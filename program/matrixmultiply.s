addi x1, x0, 1

sw x1, 0(x0)
addi x1, x0, 1
sw x1, 4(x0)
addi x1, x0, 1
sw x1, 8(x0)

addi x1, x0, 1
sw x1, 12(x0)
addi x1, x0, 2
sw x1, 16(x0)
addi x1, x0, 3
sw x1, 20(x0)

addi x1, x0, 0
sw x1, 24(x0)
addi x1, x0, 1
sw x1, 28(x0)
addi x1, x0, 0
sw x1, 32(x0)

addi x1, x0, 0
sw x1, 36(x0)
addi x1, x0, 1
sw x1, 40(x0)
addi x1, x0, 1
sw x1, 44(x0)

addi x1, x0, 0
sw x1, 48(x0)
addi x1, x0, 1
sw x1, 52(x0)
addi x1, x0, 2
sw x1, 56(x0)

addi x1, x0, 3
sw x1, 60(x0)
addi x1, x0, 1
sw x1, 64(x0)
addi x1, x0, 2
sw x1, 68(x0)

addi x2, x0, 3 # size
addi x8, x0, 0
addi x9, x0, 36

addi x20, x20, 128 # base address of result matrix

add x5, x0, x0 # reset for row count

loop1:
    add x6, x0, x0 # reset for column count
loop2:
    add x7, x0, x0 # reset for multiply count
    add x28, x0, x0 # reset for the sum variable
loop3:
    lw x10, 0(x8)
    lw x11, 0(x9)
    addi x7, x7, 1
    addi x8, x8, 4      # Word size = 4 bytes
    mul x10, x10, x11
    addi x9, x9, 12       # Size of each row in bytes
    add x28, x28, x10

    bne x7, x2, loop3   # back to loop 3 for multiplying

    sw x28, 0(x20)       # storing
    addi x20, x20, 4      # Word size = 4 bytes


    addi x6, x6, 1      # increment 1 for one done column
    addi x8, x8, -12       # reset to the first row for next column multiply
    addi x9, x9, -32       # Reset second matrix to first element
    
    
    bne x6, x2, loop2   # number of column of second matrix #back to loop 2 for done column

    addi x5, x5, 1  
    addi x8, x8, 12   # size of one rou # continue to the next row
    addi x9, x9, -12   # reset the position of the second matrix to its first element
    
    bne x5, x2, loop1   # number of rows of first matrix #back to loop 1 for done row
    addi x1, x0, 1
    bne x1, x0, 0
