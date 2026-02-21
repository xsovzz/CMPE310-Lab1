.section .bss
.global ram
.lcomm ram, 256

.section .text
.global fill_ram
fill_ram:
    # Indirect addressing: use pointer register

    lea ram(%rip), %rdi     # rdi = address of ram[0]
    add $0x50, %rdi         # rdi = address of ram[0x50]

    mov $9, %ecx            # 9 bytes (50H to 58H)
    mov $0xFF, %al          # value to store

loop_start:
    movb %al, (%rdi)        # store FF at address in rdi
    inc %rdi                # move to next memory location
    loop loop_start         # decrement ecx and repeat if not zero

    ret

.section .note.GNU-stack,"",@progbits