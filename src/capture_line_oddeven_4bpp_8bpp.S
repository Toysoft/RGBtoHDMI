#include "rpi-base.h"
#include "defs.h"

#include "macros.S"

.text

.global capture_line_even_4bpp
.global capture_line_even_8bpp
.global capture_line_odd_4bpp
.global capture_line_odd_8bpp

// The capture line function is provided the following:
//   r0 = pointer to current line in frame buffer
//   r1 = number of complete psync cycles to capture (=param_chars_per_line)
//   r2 = frame buffer line pitch in bytes (=param_fb_pitch)
//   r3 = flags register
//   r4 = GPLEV0 constant
//   r5 = line number count down to 0 (initial value =param_nlines)
//   r6 = scan line count modulo 10
//   r7 = number of psyncs to skip
//   r8 = frame buffer height (=param_fb_height)
//
// All registers are available as scratch registers (i.e. nothing needs to be preserved)

        .align 6
        b       preload_capture_line_even
capture_line_even_4bpp:
        push    {lr}
        tst     r3, #BIT_VSYNC_MARKER
        ldrne   r6, =0x11111111
        moveq   r6, #0
        tst     r3, #BIT_DEBUG
        eorne   r6, r6, #0x50         //magenta in leftmost
        eorne   r6, r6, #0x02000000   //green in rightmost
        SKIP_PSYNC
        mov    r1, r1, lsr #1
        ldr    r7, =0x70707070

loope:
        WAIT_FOR_PSYNC_EDGE              // expects GPLEV0 in r4, result in r8
        CAPTURE_LOW_BITS                 // input in r8, result in r10, corrupts r9
        WAIT_FOR_PSYNC_EDGE              // expects GPLEV0 in r4, result in r8
        CAPTURE_HIGH_BITS                // input in r8, result in r10, corrupts r9

        bic    r10, r10, r7
        orr    r10, r10, r10, lsl #4

        WRITE_WORD_FAST
        subs    r1, r1, #1
        bne     loope
        pop     {r0, pc}

preload_capture_line_even:
        SETUP_DUMMY_PARAMETERS
        b       capture_line_even_4bpp

        .ltorg

        // *** 8 bit ***

        .align 6
        b       preload_capture_line_even_8bpp
capture_line_even_8bpp:
        push    {lr}
        tst     r3, #BIT_VSYNC_MARKER
        ldrne   r5, =0x40404040
        moveq   r5, #0
        ldrne   r6, =0x40404040
        moveq   r6, #0
        tst     r3, #BIT_DEBUG
        eorne   r5, r5, #0x05           //magenta in leftmost
        eorne   r6, r6, #0x02000000     //green in rightmost
        SKIP_PSYNC
        mov    r1, r1, lsr #1
        ldr    r7, =0x00070007


loop_8bppe:
        WAIT_FOR_PSYNC_EDGE              // expects GPLEV0 in r4, result in r8
        CAPTURE_BITS_8BPP                // input in r8, result in r9/r10

        bic    r10, r10, r7
        orr    r10, r10, r10, lsr #8

        mov    r11, r10                  // save first word
        WAIT_FOR_PSYNC_EDGE              // expects GPLEV0 in r4, result in r8
        CAPTURE_BITS_8BPP                // input in r8, result in r9/r10

        bic    r10, r10, r7
        orr    r10, r10, r10, lsr #8

        mov     r9, r11
        WRITE_WORDS_8BPP_FAST
        subs    r1, r1, #1
        bne     loop_8bppe
        pop     {r0, pc}

preload_capture_line_even_8bpp:
        SETUP_DUMMY_PARAMETERS
        b       capture_line_even_8bpp


        .align 6
        b       preload_capture_line_odd
capture_line_odd_4bpp:
        push    {lr}
        tst     r3, #BIT_VSYNC_MARKER
        ldrne   r6, =0x11111111
        moveq   r6, #0
        tst     r3, #BIT_DEBUG
        eorne   r6, r6, #0x50         //magenta in leftmost
        eorne   r6, r6, #0x02000000   //green in rightmost
        SKIP_PSYNC
        mov    r1, r1, lsr #1
        ldr    r7, =0x07070707
loopo:
        WAIT_FOR_PSYNC_EDGE              // expects GPLEV0 in r4, result in r8
        CAPTURE_LOW_BITS                 // input in r8, result in r10, corrupts r9
        WAIT_FOR_PSYNC_EDGE              // expects GPLEV0 in r4, result in r8
        CAPTURE_HIGH_BITS                // input in r8, result in r10, corrupts r9

        bic    r10, r10, r7
        orr    r10, r10, r10, lsr #4

        WRITE_WORD_FAST
        subs    r1, r1, #1
        bne     loopo
        pop     {r0, pc}

preload_capture_line_odd:
        SETUP_DUMMY_PARAMETERS
        b       capture_line_odd_4bpp

        .ltorg

        // *** 8 bit ***

        .align 6
        b       preload_capture_line_odd_8bpp
capture_line_odd_8bpp:
        push    {lr}
        tst     r3, #BIT_VSYNC_MARKER
        ldrne   r5, =0x40404040
        moveq   r5, #0
        ldrne   r6, =0x40404040
        moveq   r6, #0
        tst     r3, #BIT_DEBUG
        eorne   r5, r5, #0x05           //magenta in leftmost
        eorne   r6, r6, #0x02000000     //green in rightmost
        SKIP_PSYNC
        mov    r1, r1, lsr #1
        ldr    r7, =0x07000700

loop_8bppo:
        WAIT_FOR_PSYNC_EDGE              // expects GPLEV0 in r4, result in r8
        CAPTURE_BITS_8BPP                // input in r8, result in r10, corrupts r9

        bic    r10, r10, r7
        orr    r10, r10, r10, lsl #8
        mov    r11, r10                  // save first word
        WAIT_FOR_PSYNC_EDGE              // expects GPLEV0 in r4, result in r8
        CAPTURE_BITS_8BPP                // input in r8, result in r9/r10

        bic    r10, r10, r7
        orr    r10, r10, r10, lsl #8
        mov     r9, r11
        WRITE_WORDS_8BPP_FAST
        subs    r1, r1, #1
        bne     loop_8bppo
        pop     {r0, pc}

preload_capture_line_odd_8bpp:
        SETUP_DUMMY_PARAMETERS
        b       capture_line_odd_8bpp



