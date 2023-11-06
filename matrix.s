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
	cmpl	$575, %eax
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
	movslq	%esi, %rsi
	leaq	(%rsi,%rsi,8), %rcx
	movq	%rcx, %rax
	salq	$8, %rax
	addq	%rax, %rdi
	movslq	%edx, %rdx
	movl	(%rdi,%rdx,4), %eax
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
	subq	$589832, %rsp
	.cfi_def_cfa_offset 589840
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
	addq	$589832, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE5:
	.size	main, .-main
	.ident	"GCC: (GNU) 8.3.1 20190311 (Red Hat 8.3.1-3)"
	.section	.note.GNU-stack,"",@progbits
