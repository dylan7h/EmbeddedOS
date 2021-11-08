# start of text section 
.text
    # 32 bit code
    .code 32                

    # .global == extern
    .global vector_start
    .global vector_end

    vector_start:
        MOV R0, R1
    vector_end:
        # fill 1024 byte as 0
        .space 1024, 0
# end of text section
.end
