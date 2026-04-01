/*
 * kernel/src/arch/arm64/entry.S
 *
 * Exception vector table and low-level exception entry points for NXU kernel.
 * All exceptions are currently routed to a single C handler for debugging.
 */

#include <nxu/types.h>  /* for u64, etc. — adjust path if needed */

/* Must be 2 KiB aligned */
.section .vectors, "ax"
.align 11
.global vectors

vectors:
    /* 0x000 — Synchronous, Current EL with SP_EL0 */
    b    sync_current_sp0
    .org 0x080
    b    irq_current_sp0
    .org 0x100
    b    fiq_current_sp0
    .org 0x180
    b    serror_current_sp0

    /* 0x200 — Synchronous, Current EL with SP_ELx */
    .org 0x200
    b    sync_current_spx
    .org 0x280
    b    irq_current_spx
    .org 0x300
    b    fiq_current_spx
    .org 0x380
    b    serror_current_spx

    /* 0x400 — Synchronous, Lower EL using AArch64 */
    .org 0x400
    b    sync_lower_aarch64
    .org 0x480
    b    irq_lower_aarch64
    .org 0x500
    b    fiq_lower_aarch64
    .org 0x580
    b    serror_lower_aarch64

    /* 0x600 — Synchronous, Lower EL using AArch32 (rare in bare-metal) */
    .org 0x600
    b    sync_lower_aarch32
    .org 0x680
    b    irq_lower_aarch32
    .org 0x700
    b    fiq_lower_aarch32
    .org 0x780
    b    serror_lower_aarch32

/*
 * Shared minimal entry trampoline for synchronous exceptions at current EL (SP_ELx)
 * Saves minimal context and calls into C handler.
 */
.section .text
.align 4

sync_current_spx:
    /* Minimal register save — enough to call C safely */
    stp     x29, x30, [sp, #-16]!   /* frame pointer & link register */
    stp     x0, x1,   [sp, #-16]!

    bl      handle_sync_exception

    ldp     x0, x1,   [sp], #16
    ldp     x29, x30, [sp], #16

    eret

/*
 * Placeholder entries for other vectors — all panic for now
 */
sync_current_sp0:
irq_current_spx:
irq_current_sp0:
fiq_current_spx:
fiq_current_sp0:
serror_current_spx:
serror_current_sp0:
sync_lower_aarch64:
irq_lower_aarch64:
fiq_lower_aarch64:
serror_lower_aarch64:
sync_lower_aarch32:
irq_lower_aarch32:
fiq_lower_aarch32:
serror_lower_aarch32:
    /* For now: infinite loop — will later print "unhandled vector" */
    wfi
    b       .