.section .bss
.global ram
.lcomm ram, 256

.section .text
.global fill_ram
fill_ram:
    # Compute 1+2+...+10 and store result at RAM[50H]

    xor %eax, %eax          # AL = sum = 0
    mov $1, %bl             # BL = i = 1
    mov $10, %ecx           # loop counter = 10

sum_loop:
    add %bl, %al            # sum += i
    inc %bl                 # i++
    loop sum_loop

    # store sum into ram[0x50]
    lea ram(%rip), %rdi
    movb %al, 0x50(%rdi)

    ret

.section .note.GNU-stack,"",@progbits