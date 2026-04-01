// kernel/src/arch/arm64/exceptions.c
#include "drivers/uart/pl011.h"
#include "arch/arm64/exceptions.h"

static const char* get_exception_class_name(unsigned long ec)
{
    switch (ec) {
        case 0x00: return "Unknown reason";
        case 0x01: return "WFx trap";
        case 0x03: return "CPO2 trap";
        case 0x04: return "Data abort (lower EL)";
        case 0x05: return "Data abort (current EL)";
        case 0x06: return "SP alignment fault";
        case 0x0A: return "PC alignment fault";
        case 0x0C: return "SVC in AArch32";
        case 0x11: return "SVC in AArch64";
        case 0x15: return "SVC from lower EL";
        case 0x20: return "Instruction abort (lower EL)";
        case 0x21: return "Instruction abort (current EL)";
        case 0x24: return "Data abort (current EL)";
        case 0x25: return "Data abort (lower EL)";
        default:   return "Unknown exception class";
    }
}

void handle_sync_exception(void)
{
    unsigned long esr, far, elr, spsr;

    asm volatile("mrs %0, ESR_EL1" : "=r"(esr));
    asm volatile("mrs %0, FAR_EL1" : "=r"(far));
    asm volatile("mrs %0, ELR_EL1" : "=r"(elr));
    asm volatile("mrs %0, SPSR_EL1" : "=r"(spsr));

    unsigned long ec = (esr >> 26) & 0x3F;
    unsigned long il = (esr >> 25) & 0x1;
    unsigned long iss = esr & 0x1FFFFFF;

    uart_puts("\r\n*** SYNCHRONOUS EXCEPTION ***\r\n");

    uart_puts("Exception Class : 0x"); uart_puthex(ec);
    uart_puts(" ("); uart_puts(get_exception_class_name(ec)); uart_puts(")\r\n");

    uart_puts("Instruction Len : "); uart_putdec(il); uart_puts(" ("); 
    uart_puts(il ? "32-bit" : "16-bit"); uart_puts(")\r\n");

    uart_puts("ISS            : 0x"); uart_puthex(iss); uart_puts("\r\n");
    uart_puts("FAR_EL1        : 0x"); uart_puthex(far); uart_puts("\r\n");
    uart_puts("ELR_EL1        : 0x"); uart_puthex(elr); uart_puts("\r\n");
    uart_puts("SPSR_EL1       : 0x"); uart_puthex(spsr); uart_puts("\r\n");

    uart_puts("\r\nKernel halted.\r\n");

    while (1) {
        asm volatile("wfi");
    }
}