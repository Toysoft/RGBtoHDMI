#include "rpi-base.h"
#include "defs.h"

#include "macros.S"

.text

.global capture_line_fast_eightbits_8bpp
.global capture_line_fast_ninebitslo_16bpp
.global capture_line_fast_ninebitshi_16bpp
.global capture_line_fast_twelvebits_16bpp

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


        .ltorg

        // *** 8 bit ***

        b       preload_capture_line_fast_eightbits_8bpp
capture_line_fast_eightbits_8bpp:
        push    {lr}
        SETUP_VSYNC_DEBUG_R11_R12
        SKIP_PSYNC_NO_OLD_CPLD_FAST
        SETUP_EIGHT_BITS_MASK_R14
loop_8bpp:
        WAIT_FOR_PSYNC_EDGE_FAST                  // expects GPLEV0 in r4, result in r8
        CAPTURE_EIGHT_BITS_8BPP_0 r11             // input in r8
        WAIT_FOR_PSYNC_EDGE_FAST                  // expects GPLEV0 in r4, result in r8
        CAPTURE_EIGHT_BITS_8BPP_1                 // input in r8
        WAIT_FOR_PSYNC_EDGE_FAST                  // expects GPLEV0 in r4, result in r8
        CAPTURE_EIGHT_BITS_8BPP_2                 // input in r8
        WAIT_FOR_PSYNC_EDGE_FAST                  // expects GPLEV0 in r4, result in r8
        CAPTURE_EIGHT_BITS_8BPP_3 r5              // input in r8

        WAIT_FOR_PSYNC_EDGE_FAST                  // expects GPLEV0 in r4, result in r8
        CAPTURE_EIGHT_BITS_8BPP_0 r12             // input in r8
        WAIT_FOR_PSYNC_EDGE_FAST                  // expects GPLEV0 in r4, result in r8
        CAPTURE_EIGHT_BITS_8BPP_1                 // input in r8
        WAIT_FOR_PSYNC_EDGE_FAST                  // expects GPLEV0 in r4, result in r8
        CAPTURE_EIGHT_BITS_8BPP_2                 // input in r8
        WAIT_FOR_PSYNC_EDGE_FAST                  // expects GPLEV0 in r4, result in r8
        CAPTURE_EIGHT_BITS_8BPP_3 r6              // input in r8

        cmp     r1, #1
        stmeqia r0, {r5, r6}
        moveq   r0, r2
        popeq   {pc}

        WAIT_FOR_PSYNC_EDGE_FAST                  // expects GPLEV0 in r4, result in r8
        CAPTURE_EIGHT_BITS_8BPP_0 r11             // input in r8
        WAIT_FOR_PSYNC_EDGE_FAST                  // expects GPLEV0 in r4, result in r8
        CAPTURE_EIGHT_BITS_8BPP_1                 // input in r8
        WAIT_FOR_PSYNC_EDGE_FAST                  // expects GPLEV0 in r4, result in r8
        CAPTURE_EIGHT_BITS_8BPP_2                 // input in r8
        WAIT_FOR_PSYNC_EDGE_FAST                  // expects GPLEV0 in r4, result in r8
        CAPTURE_EIGHT_BITS_8BPP_3 r7              // input in r8

        WAIT_FOR_PSYNC_EDGE_FAST                  // expects GPLEV0 in r4, result in r8
        CAPTURE_EIGHT_BITS_8BPP_0 r12             // input in r8
        WAIT_FOR_PSYNC_EDGE_FAST                  // expects GPLEV0 in r4, result in r8
        CAPTURE_EIGHT_BITS_8BPP_1                 // input in r8
        WAIT_FOR_PSYNC_EDGE_FAST                  // expects GPLEV0 in r4, result in r8
        CAPTURE_EIGHT_BITS_8BPP_2                 // input in r8
        WAIT_FOR_PSYNC_EDGE_FAST                  // expects GPLEV0 in r4, result in r8
        CAPTURE_EIGHT_BITS_8BPP_3 r10             // input in r8

        stmia   r0!, {r5, r6, r7, r10}
        subs    r1, r1, #2
        bne     loop_8bpp

        mov     r0, r2
        pop     {pc}

preload_capture_line_fast_eightbits_8bpp:
        SETUP_DUMMY_PARAMETERS
        b       capture_line_fast_eightbits_8bpp

        .ltorg

        // *** 16 bit ***
        b       preload_capture_line_fast_twelvebits_16bpp
capture_line_fast_twelvebits_16bpp:
        push    {lr}
        SETUP_VSYNC_DEBUG_16BPP_R11_R12
        SKIP_PSYNC_NO_OLD_CPLD_FAST
        SETUP_TWELVE_BITS_MASK_R14
loop_16bpp:
        WAIT_FOR_PSYNC_EDGE_FAST                       // expects GPLEV0 in r4, result in r8
        CAPTURE_TWELVE_BITS_16BPP_LO r11               // input in r8
        WAIT_FOR_PSYNC_EDGE_FAST                       // expects GPLEV0 in r4, result in r8
        CAPTURE_TWELVE_BITS_16BPP_HI r5                // input in r8
        WAIT_FOR_PSYNC_EDGE_FAST                       // expects GPLEV0 in r4, result in r8
        CAPTURE_TWELVE_BITS_16BPP_LO_0                 // input in r8
        WAIT_FOR_PSYNC_EDGE_FAST                       // expects GPLEV0 in r4, result in r8
        CAPTURE_TWELVE_BITS_16BPP_HI r6                // input in r8

        WAIT_FOR_PSYNC_EDGE_FAST                       // expects GPLEV0 in r4, result in r8
        CAPTURE_TWELVE_BITS_16BPP_LO_0                 // input in r8
        WAIT_FOR_PSYNC_EDGE_FAST                       // expects GPLEV0 in r4, result in r8
        CAPTURE_TWELVE_BITS_16BPP_HI r7                // input in r8
        WAIT_FOR_PSYNC_EDGE_FAST                       // expects GPLEV0 in r4, result in r8
        CAPTURE_TWELVE_BITS_16BPP_LO r12               // input in r8
        WAIT_FOR_PSYNC_EDGE_FAST                       // expects GPLEV0 in r4, result in r8
        CAPTURE_TWELVE_BITS_16BPP_HI r10               // input in r8
        stmia   r0!, {r5, r6, r7, r10}

        subs    r1, r1, #1
        bne     loop_16bpp

        mov     r0, r2
        pop     {pc}

preload_capture_line_fast_twelvebits_16bpp:
        SETUP_DUMMY_PARAMETERS
        b       capture_line_fast_twelvebits_16bpp


        .ltorg

        // *** 16 bit ***
        b       preload_capture_line_fast_ninebitslo_16bpp
capture_line_fast_ninebitslo_16bpp:
        push    {lr}
        SETUP_VSYNC_DEBUG_16BPP_R11_R12
        SKIP_PSYNC_NO_OLD_CPLD_FAST
        SETUP_NINE_BITS_MASK_R14
loop_16lobpp:
        WAIT_FOR_PSYNC_EDGE_FAST                       // expects GPLEV0 in r4, result in r8
        CAPTURE_NINELO_BITS_16BPP_LO r11               // input in r8
        WAIT_FOR_PSYNC_EDGE_FAST                       // expects GPLEV0 in r4, result in r8
        CAPTURE_NINELO_BITS_16BPP_HI r5                // input in r8
        WAIT_FOR_PSYNC_EDGE_FAST                       // expects GPLEV0 in r4, result in r8
        CAPTURE_NINELO_BITS_16BPP_LO_0                 // input in r8
        WAIT_FOR_PSYNC_EDGE_FAST                       // expects GPLEV0 in r4, result in r8
        CAPTURE_NINELO_BITS_16BPP_HI r6                // input in r8

        WAIT_FOR_PSYNC_EDGE_FAST                       // expects GPLEV0 in r4, result in r8
        CAPTURE_NINELO_BITS_16BPP_LO_0                 // input in r8
        WAIT_FOR_PSYNC_EDGE_FAST                       // expects GPLEV0 in r4, result in r8
        CAPTURE_NINELO_BITS_16BPP_HI r7                // input in r8
        WAIT_FOR_PSYNC_EDGE_FAST                       // expects GPLEV0 in r4, result in r8
        CAPTURE_NINELO_BITS_16BPP_LO r12               // input in r8
        WAIT_FOR_PSYNC_EDGE_FAST                       // expects GPLEV0 in r4, result in r8
        CAPTURE_NINELO_BITS_16BPP_HI r10               // input in r8
        stmia   r0!, {r5, r6, r7, r10}

        subs    r1, r1, #1
        bne     loop_16lobpp

        mov     r0, r2
        pop     {pc}

preload_capture_line_fast_ninebitslo_16bpp:
        SETUP_DUMMY_PARAMETERS
        b       capture_line_fast_ninebitslo_16bpp


        .ltorg

        // *** 16 bit ***
        b       preload_capture_line_fast_ninebitshi_16bpp
capture_line_fast_ninebitshi_16bpp:
        push    {lr}
        SETUP_VSYNC_DEBUG_16BPP_R11_R12
        SKIP_PSYNC_NO_OLD_CPLD_FAST
        SETUP_NINE_BITS_MASK_R14
loop_16hibpp:
        WAIT_FOR_PSYNC_EDGE_FAST                       // expects GPLEV0 in r4, result in r8
        CAPTURE_NINEHI_BITS_16BPP_LO r11               // input in r8
        WAIT_FOR_PSYNC_EDGE_FAST                       // expects GPLEV0 in r4, result in r8
        CAPTURE_NINEHI_BITS_16BPP_HI r5                // input in r8
        WAIT_FOR_PSYNC_EDGE_FAST                       // expects GPLEV0 in r4, result in r8
        CAPTURE_NINEHI_BITS_16BPP_LO_0                 // input in r8
        WAIT_FOR_PSYNC_EDGE_FAST                       // expects GPLEV0 in r4, result in r8
        CAPTURE_NINEHI_BITS_16BPP_HI r6                // input in r8

        WAIT_FOR_PSYNC_EDGE_FAST                       // expects GPLEV0 in r4, result in r8
        CAPTURE_NINEHI_BITS_16BPP_LO_0                 // input in r8
        WAIT_FOR_PSYNC_EDGE_FAST                       // expects GPLEV0 in r4, result in r8
        CAPTURE_NINEHI_BITS_16BPP_HI r7                // input in r8
        WAIT_FOR_PSYNC_EDGE_FAST                       // expects GPLEV0 in r4, result in r8
        CAPTURE_NINEHI_BITS_16BPP_LO r12               // input in r8
        WAIT_FOR_PSYNC_EDGE_FAST                       // expects GPLEV0 in r4, result in r8
        CAPTURE_NINEHI_BITS_16BPP_HI r10               // input in r8
        stmia   r0!, {r5, r6, r7, r10}

        subs    r1, r1, #1
        bne     loop_16hibpp

        mov     r0, r2
        pop     {pc}

preload_capture_line_fast_ninebitshi_16bpp:
        SETUP_DUMMY_PARAMETERS
        b       capture_line_fast_ninebitshi_16bpp