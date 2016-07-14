	.file	"prime.c"
	.text
.globl square
	.type	square, @function
square:
	pushl	%esp
	movl	%esp, %ebp
	movl	12(%ebp), %eax
	imull	8(%ebp), %eax
	popl	%ebp
	ret
	.size	square, .-square
.globl isPrime
	.type	isPrime, @function
isPrime:
	pushl	%ebp #pushes n onto the stack
	movl	%esp, %ebp #initializes where esp and ebp are on the stack
	subl	$36, %esp #esp = esp - 36
	movl	8(%ebp), %eax #eax = n
	andl	$1, %eax # n & 1
	testl	%eax, %eax #this checks if eax is 0 or greater
	jmp	.L4
	cmpl	$2, 8(%ebp) #this compares x: 2
	jne	.L6 # if(x != 2 && x != 0)... jumps to L6
.L4:
	movl	8(%ebp), %eax #eax = n
	movl	%eax, -28(%ebp) #moves n to the -28 spot on stack
	movl	$1431655766, -32(%ebp) #moves
	movl	-32(%ebp), %eax
	imull	-28(%ebp)
	movl	%edx, %ecx
	movl	-28(%ebp), %eax
	sarl	$31, %eax
	movl	%ecx, %edx
	subl	%eax, %edx
	movl	%edx, -24(%ebp)
	movl	-24(%ebp), %eax
	addl	%eax, %eax
	addl	-24(%ebp), %eax
	movl	-28(%ebp), %ecx
	subl	%eax, %ecx
	movl	%ecx, -24(%ebp)
	cmpl	$0, -24(%ebp)
	jne	.L7
	cmpl	$3, 8(%ebp)
	jne	.L6
.L7:
	cmpl	$1, 8(%ebp)
	jg	.L9
.L6:
	movl	$0, -20(%ebp)
	jmp	.L10
.L9:
	movl	$1, -8(%ebp)
	jmp	.L11
.L12:
	movl	-8(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	addl	%eax, %eax
	movl	%eax, -4(%ebp)
	movl	-4(%ebp), %eax
	subl	$1, %eax
	movl	8(%ebp), %edx
	movl	%eax, %ecx
	movl	%edx, %eax
	sarl	$31, %edx
	idivl	%ecx
	movl	%edx, %eax
	testl	%eax, %eax
	jne	.L13
	movl	-4(%ebp), %eax
	subl	$1, %eax
	cmpl	8(%ebp), %eax
	je	.L13
	movl	$0, -20(%ebp)
	jmp	.L10
.L13:
	movl	-4(%ebp), %eax
	addl	$1, %eax
	movl	8(%ebp), %edx
	movl	%eax, %ecx
	movl	%edx, %eax
	sarl	$31, %edx
	idivl	%ecx
	movl	%edx, %eax
	testl	%eax, %eax
	jne	.L16
	movl	-4(%ebp), %eax
	addl	$1, %eax
	cmpl	8(%ebp), %eax
	je	.L16
	movl	$0, -20(%ebp)
	jmp	.L10
.L16:
	addl	$1, -8(%ebp)
.L11:
	movl	-8(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	addl	%eax, %eax
	subl	$7, %eax
	movl	%eax, (%esp)
	call	square
	cmpl	8(%ebp), %eax
	jl	.L12
	movl	$1, -20(%ebp)
.L10:
	movl	-20(%ebp), %eax
	leave
	ret
	.size	isPrime, .-isPrime
	.section	.rodata
.LC0:
	.string "Prime %d is %d\n"
	.text
.globl main
	.type	main, @function
main:
	leal	4(%esp), %ecx
	andl	$-16, %esp
	pushl	-4(%ecx)
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%ecx
	subl	$36, %esp
	movl	4(%ecx), %eax
	addl	$0, %eax
	movl	(%eax), %eax
	movl	%eax, (%esp)
	call	atoi
	movl	%eax, -16(%ebp)
	movl	$0, -12(%ebp)
	movl	$1, -8(%ebp)
	jmp	.L27
.L23:
	addl	$1, -8(%ebp)
	movl	-8(%ebp), %eax
	movl	%eax, (%esp)
	call	isPrime
	testl	%eax, %eax
	je	.L22
	addl	$1, -12(%ebp)
.L22:
.L27:
	movl	-12(%ebp), %eax
	cmpl	-16(%ebp), %eax
	jl	.L23
	movl	-8(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	-16(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$.LC0, (%esp)
	call	printf
	movl	$0, %eax
	addl	$36, %esp
	popl	%ecx
	popl	%ebp
	leal	-4(%ecx), %esp
	ret
	.size	main, .-main
	.ident	"GCC: (GNU) 4.1.2 20080704 (Red Hat 4.1.2-51)"
	.section	.note.GNU-stack,"",@progbits
