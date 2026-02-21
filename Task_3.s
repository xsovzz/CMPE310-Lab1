.section .bss
.global ram
.lcomm ram, 256

.section .text
.global fill_ram
fill_ram:
    # Clear RAM locations 50H - 58H by writing 00H

    lea ram(%rip), %rdi     # rdi = &ram[0]
    add $0x50, %rdi         # rdi = &ram[0x50]

    mov $9, %ecx            # 9 bytes (0x50..0x58)
    xor %eax, %eax          # AL = 0x00

loop_clear:
    movb %al, (%rdi)        # store 00
    inc %rdi
    loop loop_clear

    ret

.section .note.GNU-stack,"",@progbits