// kernel/src/arch/arm64/exceptions.c

#include "drivers/uart/pl011.h"
#include "arch/arm64/exceptions.h"

void handle_sync_exception(void)
{
    unsigned long esr, far, elr;

    asm volatile("mrs %0, ESR_EL1" : "=r"(esr));
    asm volatile("mrs %0, FAR_EL1" : "=r"(far));
    asm volatile("mrs %0, ELR_EL1" : "=r"(elr));

    uart_puts("\r\n*** Synchronous Exception ***\r\n");
    uart_puts("ESR_EL1 = 0x"); uart_puthex(esr); uart_puts("\r\n");
    uart_puts("FAR_EL1 = 0x"); uart_puthex(far); uart_puts("\r\n");
    uart_puts("ELR_EL1 = 0x"); uart_puthex(elr); uart_puts("\r\n");

    uart_puts("Kernel halted.\r\n");

    while (1) {
        asm volatile("wfi");
    }
}