# NXU kernel Makefile

CC      = aarch64-linux-gnu-gcc
LD      = aarch64-linux-gnu-ld
OBJCOPY = aarch64-linux-gnu-objcopy

CFLAGS  = -Wall -O2 -ffreestanding -nostdlib \
          -mgeneral-regs-only -mcmodel=tiny -mstrict-align \
          -fno-pic -fno-pie -fno-stack-protector \
          -I. -Iboot/arm64 -Ikernel/include

LDFLAGS = -nostdlib

# Dynamically find all C and Assembly source files
C_SRCS   = $(shell find boot kernel drivers -name "*.c")
ASM_SRCS = $(shell find boot kernel drivers -name "*.S")

# Generate object file lists
OBJS = $(C_SRCS:.c=.o) $(ASM_SRCS:.S=.o)
DEPS = $(OBJS:.o=.d)

all: nxu.bin

nxu.elf: $(OBJS) boot/arm64/link.ld
	$(LD) $(LDFLAGS) -T boot/arm64/link.ld -o $@ $(OBJS)

nxu.bin: nxu.elf
	$(OBJCOPY) -O binary $< $@

%.o: %.S
	$(CC) $(CFLAGS) -c $< -o $@

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -f $(OBJS) $(DEPS) nxu.elf nxu.bin

qemu: nxu.bin
	# Use cortex-a57 for better reliability in some Debian/QEMU setups
	qemu-system-aarch64 \
	  -M virt \
	  -cpu cortex-a57 \
	  -smp 1 \
	  -m 512M \
	  -nographic \
	  -serial mon:stdio \
	  -kernel nxu.bin

qemu-gdb: nxu.bin
	# Same as qemu but waits for GDB to connect on port 1234 (-s -S)
	qemu-system-aarch64 \
	  -M virt \
	  -cpu cortex-a57 \
	  -smp 1 \
	  -m 512M \
	  -nographic \
	  -serial mon:stdio \
	  -kernel nxu.bin \
	  -s -S

# Include generated dependency files
-include $(DEPS)

.PHONY: all clean qemu qemu-gdb