	.file	"matrix.c"
	.text
	.globl	populate
	.type	populate, @function
populate:
.LFB3:
	.cfi_startproc
	movl	$0, %ecx
	jmp	.L2
.L7:
	addl	$1, %ecx
.L2:
	cmpl	$255, %ecx
	jg	.L6
	movl	$0, %eax
.L4:
	cmpl	$215, %eax
	jg	.L7
	movl	%ecx, %edx
	imull	%eax, %edx
	movl	%edx, (%rdi)
	addq	$4, %rdi
	addl	$1, %eax
	jmp	.L4
.L6:
	ret
	.cfi_endproc
.LFE3:
	.size	populate, .-populate
	.globl	get_elem
	.type	get_elem, @function
get_elem:
.LFB4:
	.cfi_startproc
	movslq	%esi, %rsi          # extend r to 64 bits to use in next leaq
	leaq	(%rsi,%rsi,2), %rax # compute 3*r and place in rax
	leaq	(%rax,%rax,8), %rcx # 9*3*r and place it in rcx
	movq	%rcx, %rax          # move 27*r to rax
	salq	$5, %rax            # shifting left by 5, resulting in 27r * 2^5 = 32*27*r = 864r = 216*4*r
	addq	%rax, %rdi          # 216*4*r + arrow (start pos of the matrix)
	movslq	%edx, %rdx          # extend c to 64 bits to use in next movq
	movl	(%rdi,%rdx,4), %eax # (arrow + 216*4*r + 4c) is the element being retrieved and placed into eax to return!
								# We can tell that N = 216 because the formula for accessing elements is A + (C*i) + j
								# In this case, A is the arrow, i is r and j is c, the data type is 4 bytes (int), and C = N (no of cols)
								# so, if we divide the effective number computed (864) by 4, we get 216 which is the number of columns!
	ret
	.cfi_endproc
.LFE4:
	.size	get_elem, .-get_elem
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"result is: %d\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB5:
	.cfi_startproc
	subq	$221192, %rsp
	.cfi_def_cfa_offset 221200
	movq	%rsp, %rdi
	call	populate
	movl	$8, %edx
	movl	$8, %esi
	movq	%rsp, %rdi
	call	get_elem
	movl	%eax, %esi
	movl	$.LC0, %edi
	movl	$0, %eax
	call	printf
	movl	$0, %eax
	addq	$221192, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE5:
	.size	main, .-main
	.ident	"GCC: (GNU) 8.3.1 20190311 (Red Hat 8.3.1-3)"
	.section	.note.GNU-stack,"",@progbits
