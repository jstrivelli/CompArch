.file   "conway.c"
.text
.globl update
    .type   update, @function
update:
	pushl	%ebp
	movl	%esp, %ebp
	subl 	$36, %esp
	movl	8(%ebp), %ecx #deferences the pointers 
	movl 	12(%ebp), %eax # width
	movl	%eax ,-8(%ebp) #storage of the width
	subl	$1, %eax 	#width - 1
	movl 	%eax, -32(%ebp) #this stores the width -1
	movl	16(%ebp),%ecx
	movl	%ecx, -12(%ebp) #storage for the height
	subl	$1, %ecx		#height -1
	movl	%ecx, -36(%ebp) #this stores height -1
	movl	$0, -16(%ebp) #x index , int x = 0
	movl 	$0, -20(%ebp) #y index, int y = 0 
	movl	-8(%ebp), %edx
	imull	-12(%ebp), %edx #determines the size of what we are going to malloc
	imull	$4,%edx
	push 	%edx
	call 	malloc  #malloc to a new board
	movl	%eax, -24(%ebp) #stores address of the new board from eax to a spot on the stack
	movl	%eax, -28(%ebp) #this is the second reference to the address
	movl	8(%ebp),%ecx


.L1:
	movl -20(%ebp), %ebx 
	movl	8(%ebp),%ecx
	movl (%ecx, %ebx, 4), %eax #Traversing the Y columns 

.L3:
	movl -16(%ebp), %ecx
	movl (%eax, %ecx, 4), %edx #Traversing through the rows


	movl -24(%ebp), %eax
	movl (%eax), %edx
	movl $0, %edx
	movl %edx, (%eax)

#Top left Starts

	cmpl $0, %ecx #This checks the top left corner -1, -1 
	je .L50
	cmpl $0, %ebx
	je .L50

	subl $1, %ebx
	movl	8(%ebp), %ecx
	movl (%ecx, %ebx, 4), %eax
	movl -16(%ebp), %ecx
	subl $1, %ecx
	movl (%eax, %ecx, 4), %edx
	cmpl $0, %edx
	je .L57
	movl -24(%ebp), %eax
	movl (%eax), %edx
	addl $1, %edx
	movl %edx, (%eax)

.L57:	
	
	movl -24(%ebp), %eax
	movl -20(%ebp), %ebx #restores the original values so we can work with them later
	movl -16(%ebp),%ecx



.L50: #Top left Ends


	#Top Middle Starts
	cmpl $0, %ebx
	je .L60

	subl $1, %ebx
	movl 8(%ebp), %ecx
	movl (%ecx, %ebx, 4), %eax
	movl -16(%ebp), %ecx
	movl (%eax, %ecx, 4), %edx
	cmpl $0, %edx
	je .L67
	movl -24(%ebp), %eax
	movl (%eax), %edx
	addl $1, %edx
	movl %edx, (%eax)

.L67:	
	
	movl -24(%ebp), %eax
	movl -20(%ebp), %ebx #restores the original values so we can work with them later
	movl -16(%ebp),%ecx



.L60: #Top Middle Ends

	#Top Right Starts
	cmpl $0, %ebx
	je .L70
	cmpl %ecx, -32(%ebp)
	je .L70

	subl $1, %ebx
	movl 8(%ebp), %ecx
	movl (%ecx, %ebx, 4), %eax
	movl -16(%ebp), %ecx
	addl $1, %ecx
	movl (%eax, %ecx, 4), %edx
	cmpl $0, %edx
	je .L77
	movl -24(%ebp), %eax
	movl (%eax), %edx
	addl $1, %edx
	movl %edx, (%eax)

.L77:	
	
	movl -24(%ebp), %eax
	movl -20(%ebp), %ebx #restores the original values so we can work with them later
	movl -16(%ebp),%ecx



.L70: #Top Right Ends


	#Middle Left Starts
	cmpl $0, %ecx
	je .L80

	movl 8(%ebp), %ecx
	movl (%ecx, %ebx, 4), %eax
	movl -16(%ebp), %ecx
	subl $1, %ecx
	movl (%eax, %ecx, 4), %edx
	cmpl $0, %edx
	je .L87
	movl -24(%ebp), %eax
	movl (%eax), %edx
	addl $1, %edx
	movl %edx, (%eax)

.L87:	
	

	movl -24(%ebp), %eax
	movl -20(%ebp), %ebx #restores the original values so we can work with them later
	movl -16(%ebp),%ecx



.L80: #Middle Left Ends
	

	#Middle Right Starts
	cmpl -32(%ebp),%ecx
	je .L90

	movl 8(%ebp), %ecx
	movl (%ecx, %ebx, 4), %eax
	movl -16(%ebp), %ecx
	addl $1, %ecx
	movl (%eax, %ecx, 4), %edx
	cmpl $0, %edx
	je .L97
	movl -24(%ebp), %eax
	movl (%eax), %edx
	addl $1, %edx
	movl %edx, (%eax)

.L97:

	movl -24(%ebp), %eax
	movl -20(%ebp), %ebx #restores the original values so we can work with them later
	movl -16(%ebp),%ecx



.L90: #Middle Right Ends
	


	#Bottum Left Starts
	cmpl $0, %ecx
	je .L100
	cmpl -36(%ebp),%ebx
	je .L100

	addl $1, %ebx
	movl 8(%ebp), %ecx
	movl (%ecx, %ebx, 4), %eax
	movl -16(%ebp), %ecx
	subl $1, %ecx
	movl (%eax, %ecx, 4), %edx
	cmpl $0, %edx
	je .L107
	movl -24(%ebp), %eax
	movl (%eax), %edx
	addl $1, %edx
	movl %edx, (%eax)

.L107:	
	
	movl -24(%ebp), %eax
	movl -20(%ebp), %ebx #restores the original values so we can work with them later
	movl -16(%ebp),%ecx


.L100: #Bottum Left Ends

	#Bottum Middle Starts
	cmpl -36(%ebp),%ebx
	je .L110

	addl $1, %ebx
	movl 8(%ebp), %ecx
	movl (%ecx, %ebx, 4), %eax
	movl -16(%ebp), %ecx
	movl (%eax, %ecx, 4), %edx
	cmpl $0, %edx
	je .L117
	movl -24(%ebp), %eax
	movl (%eax), %edx
	addl $1, %edx
	movl %edx, (%eax)

.L117:	
	
	movl -24(%ebp), %eax
	movl -20(%ebp), %ebx #restores the original values so we can work with them later
	movl -16(%ebp),%ecx



.L110: #Bottum Middle Ends

	#Bottum Right Starts
	cmpl -32(%ebp),%ecx
	je .L120
	cmpl -36(%ebp),%ebx 
	je .L120

	addl $1, %ebx
	movl 8(%ebp), %ecx
	movl (%ecx, %ebx, 4), %eax
	movl -16(%ebp), %ecx
	addl $1, %ecx
	movl (%eax, %ecx, 4), %edx
	cmpl $0, %edx
	je .L127
	movl -24(%ebp), %eax
	movl (%eax), %edx
	addl $1, %edx
	movl %edx, (%eax)

.L127:	
	
	movl -24(%ebp), %eax
	movl -20(%ebp), %ebx #restores the original values so we can work with them later
	movl -16(%ebp),%ecx



.L120: #Bottum Right Ends

	addl $4,-24(%ebp)
	

	addl $1, %ecx #increments the x index
	movl %ecx, -16(%ebp) #this is the actual update for the x index
	cmpl -8(%ebp),%ecx #compares the index to the width 
	jl .L3  #if the index is less the the width we keep moving through the row

	movl $0, -16(%ebp) # We have reached a new line 
	movl -20(%ebp), %eax
	addl $1, %eax #increments the Y to get to the next column
	movl %eax, -20(%ebp)
	cmpl -12(%ebp),%eax #compares the index to the height
	jl .L1	#if the index is less then the height we keep moving through and repeat process over again

	movl $0, -20(%ebp)




	movl $0, -16(%ebp)
.L4:
	movl -20(%ebp), %ebx 
	movl 8(%ebp),%ecx
	movl (%ecx, %ebx, 4), %eax #Traversing the Y columns 
.L5:
	movl -16(%ebp), %ecx
	movl (%eax, %ecx, 4), %edx #Traversing through the rows

	movl -28(%ebp), %ebx
	movl (%ebx), %ecx #opening up this address
	cmpl $2, %ecx
	je .L33
	cmpl $3, %ecx
	je .L35
	jmp .L37
.L33:

	cmpl $1,%edx
	jne .L37
.L35:
	movl $1,%edx
	jmp .L38
.L37:
	movl $0,%edx
.L38:

	movl -20(%ebp), %ebx 
	movl -16(%ebp), %ecx
	
	addl $4,-28(%ebp)


	movl %edx, (%eax, %ecx, 4)    #updates the current index we are at
	addl $1, %ecx #increments the x index
	movl %ecx, -16(%ebp) #this is the actual update for the x index
	cmpl -8(%ebp),%ecx #compares the index to the width 
	jl .L5  #if the index is less the the width we keep moving through the row

	movl $0, -16(%ebp) # We have reached a new line 
	movl -20(%ebp), %eax
	addl $1, %eax #increments the Y to get to the next column
	movl %eax, -20(%ebp)
	cmpl -12(%ebp),%eax #compares the index to the height
	jl .L4	#if the index is less then the height we keep moving through and repeat process over again

	movl $0, -20(%ebp)
	

	movl %ebp, %esp
	popl %ebp
	ret
