// kernel/src/init/main.c
#include "drivers/uart/pl011.h"
#include "arch/arm64/exceptions.h"

extern void *vectors;

void kernel_main(void)
{
    uart_init();

    /* Install exception vectors */
    asm volatile("msr VBAR_EL1, %0" : : "r"(&vectors) : "memory");
    asm volatile("dsb sy; isb" ::: "memory");

    uart_puts("NXU kernel initialized\r\n");
    uart_puts("Exception vectors installed\r\n");

    uart_puts("Triggering a deliberate data abort for testing...\r\n");/

    /* We should never reach here */
    while (1) {
        asm volatile("wfi" ::: "memory");
    }
}