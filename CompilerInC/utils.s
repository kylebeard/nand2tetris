	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 12, 0	sdk_version 12, 0
	.globl	_getTokenTypeStr                ## -- Begin function getTokenTypeStr
	.p2align	4, 0x90
_getTokenTypeStr:                       ## @getTokenTypeStr
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movl	%edi, -12(%rbp)
	movl	-12(%rbp), %eax
                                        ## kill: def $rax killed $eax
	movq	%rax, -24(%rbp)                 ## 8-byte Spill
	subq	$5, %rax
	ja	LBB0_7
## %bb.9:
	movq	-24(%rbp), %rax                 ## 8-byte Reload
	leaq	LJTI0_0(%rip), %rcx
	movslq	(%rcx,%rax,4), %rax
	addq	%rcx, %rax
	jmpq	*%rax
LBB0_1:
	leaq	L_.str(%rip), %rax
	movq	%rax, -8(%rbp)
	jmp	LBB0_8
LBB0_2:
	leaq	L_.str.1(%rip), %rax
	movq	%rax, -8(%rbp)
	jmp	LBB0_8
LBB0_3:
	leaq	L_.str.2(%rip), %rax
	movq	%rax, -8(%rbp)
	jmp	LBB0_8
LBB0_4:
	leaq	L_.str.3(%rip), %rax
	movq	%rax, -8(%rbp)
	jmp	LBB0_8
LBB0_5:
	leaq	L_.str.4(%rip), %rax
	movq	%rax, -8(%rbp)
	jmp	LBB0_8
LBB0_6:
	leaq	L_.str.5(%rip), %rax
	movq	%rax, -8(%rbp)
	jmp	LBB0_8
LBB0_7:
	movq	$0, -8(%rbp)
LBB0_8:
	movq	-8(%rbp), %rax
	popq	%rbp
	retq
	.cfi_endproc
	.p2align	2, 0x90
	.data_region jt32
.set L0_0_set_1, LBB0_1-LJTI0_0
.set L0_0_set_2, LBB0_2-LJTI0_0
.set L0_0_set_3, LBB0_3-LJTI0_0
.set L0_0_set_4, LBB0_4-LJTI0_0
.set L0_0_set_5, LBB0_5-LJTI0_0
.set L0_0_set_6, LBB0_6-LJTI0_0
LJTI0_0:
	.long	L0_0_set_1
	.long	L0_0_set_2
	.long	L0_0_set_3
	.long	L0_0_set_4
	.long	L0_0_set_5
	.long	L0_0_set_6
	.end_data_region
                                        ## -- End function
	.globl	_getKeywordStr                  ## -- Begin function getKeywordStr
	.p2align	4, 0x90
_getKeywordStr:                         ## @getKeywordStr
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movl	%edi, -12(%rbp)
	movl	-12(%rbp), %eax
                                        ## kill: def $rax killed $eax
	movq	%rax, -24(%rbp)                 ## 8-byte Spill
	subq	$20, %rax
	ja	LBB1_22
## %bb.24:
	movq	-24(%rbp), %rax                 ## 8-byte Reload
	leaq	LJTI1_0(%rip), %rcx
	movslq	(%rcx,%rax,4), %rax
	addq	%rcx, %rax
	jmpq	*%rax
LBB1_1:
	leaq	L_.str.6(%rip), %rax
	movq	%rax, -8(%rbp)
	jmp	LBB1_23
LBB1_2:
	leaq	L_.str.7(%rip), %rax
	movq	%rax, -8(%rbp)
	jmp	LBB1_23
LBB1_3:
	leaq	L_.str.8(%rip), %rax
	movq	%rax, -8(%rbp)
	jmp	LBB1_23
LBB1_4:
	leaq	L_.str.9(%rip), %rax
	movq	%rax, -8(%rbp)
	jmp	LBB1_23
LBB1_5:
	leaq	L_.str.10(%rip), %rax
	movq	%rax, -8(%rbp)
	jmp	LBB1_23
LBB1_6:
	leaq	L_.str.11(%rip), %rax
	movq	%rax, -8(%rbp)
	jmp	LBB1_23
LBB1_7:
	leaq	L_.str.12(%rip), %rax
	movq	%rax, -8(%rbp)
	jmp	LBB1_23
LBB1_8:
	leaq	L_.str.13(%rip), %rax
	movq	%rax, -8(%rbp)
	jmp	LBB1_23
LBB1_9:
	leaq	L_.str.14(%rip), %rax
	movq	%rax, -8(%rbp)
	jmp	LBB1_23
LBB1_10:
	leaq	L_.str.15(%rip), %rax
	movq	%rax, -8(%rbp)
	jmp	LBB1_23
LBB1_11:
	leaq	L_.str.16(%rip), %rax
	movq	%rax, -8(%rbp)
	jmp	LBB1_23
LBB1_12:
	leaq	L_.str.17(%rip), %rax
	movq	%rax, -8(%rbp)
	jmp	LBB1_23
LBB1_13:
	leaq	L_.str.18(%rip), %rax
	movq	%rax, -8(%rbp)
	jmp	LBB1_23
LBB1_14:
	leaq	L_.str.19(%rip), %rax
	movq	%rax, -8(%rbp)
	jmp	LBB1_23
LBB1_15:
	leaq	L_.str.20(%rip), %rax
	movq	%rax, -8(%rbp)
	jmp	LBB1_23
LBB1_16:
	leaq	L_.str.21(%rip), %rax
	movq	%rax, -8(%rbp)
	jmp	LBB1_23
LBB1_17:
	leaq	L_.str.22(%rip), %rax
	movq	%rax, -8(%rbp)
	jmp	LBB1_23
LBB1_18:
	leaq	L_.str.23(%rip), %rax
	movq	%rax, -8(%rbp)
	jmp	LBB1_23
LBB1_19:
	leaq	L_.str.24(%rip), %rax
	movq	%rax, -8(%rbp)
	jmp	LBB1_23
LBB1_20:
	leaq	L_.str.25(%rip), %rax
	movq	%rax, -8(%rbp)
	jmp	LBB1_23
LBB1_21:
	leaq	L_.str.26(%rip), %rax
	movq	%rax, -8(%rbp)
	jmp	LBB1_23
LBB1_22:
	movq	$0, -8(%rbp)
LBB1_23:
	movq	-8(%rbp), %rax
	popq	%rbp
	retq
	.cfi_endproc
	.p2align	2, 0x90
	.data_region jt32
.set L1_0_set_1, LBB1_1-LJTI1_0
.set L1_0_set_2, LBB1_2-LJTI1_0
.set L1_0_set_3, LBB1_3-LJTI1_0
.set L1_0_set_4, LBB1_4-LJTI1_0
.set L1_0_set_5, LBB1_5-LJTI1_0
.set L1_0_set_6, LBB1_6-LJTI1_0
.set L1_0_set_7, LBB1_7-LJTI1_0
.set L1_0_set_8, LBB1_8-LJTI1_0
.set L1_0_set_9, LBB1_9-LJTI1_0
.set L1_0_set_10, LBB1_10-LJTI1_0
.set L1_0_set_11, LBB1_11-LJTI1_0
.set L1_0_set_12, LBB1_12-LJTI1_0
.set L1_0_set_13, LBB1_13-LJTI1_0
.set L1_0_set_14, LBB1_14-LJTI1_0
.set L1_0_set_15, LBB1_15-LJTI1_0
.set L1_0_set_16, LBB1_16-LJTI1_0
.set L1_0_set_17, LBB1_17-LJTI1_0
.set L1_0_set_18, LBB1_18-LJTI1_0
.set L1_0_set_19, LBB1_19-LJTI1_0
.set L1_0_set_20, LBB1_20-LJTI1_0
.set L1_0_set_21, LBB1_21-LJTI1_0
LJTI1_0:
	.long	L1_0_set_1
	.long	L1_0_set_2
	.long	L1_0_set_3
	.long	L1_0_set_4
	.long	L1_0_set_5
	.long	L1_0_set_6
	.long	L1_0_set_7
	.long	L1_0_set_8
	.long	L1_0_set_9
	.long	L1_0_set_10
	.long	L1_0_set_11
	.long	L1_0_set_12
	.long	L1_0_set_13
	.long	L1_0_set_14
	.long	L1_0_set_15
	.long	L1_0_set_16
	.long	L1_0_set_17
	.long	L1_0_set_18
	.long	L1_0_set_19
	.long	L1_0_set_20
	.long	L1_0_set_21
	.end_data_region
                                        ## -- End function
	.globl	_main                           ## -- Begin function main
	.p2align	4, 0x90
_main:                                  ## @main
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	xorl	%eax, %eax
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__cstring,cstring_literals
L_.str:                                 ## @.str
	.asciz	"keyword"

L_.str.1:                               ## @.str.1
	.asciz	"symbol"

L_.str.2:                               ## @.str.2
	.asciz	"identifier"

L_.str.3:                               ## @.str.3
	.asciz	"integerConstant"

L_.str.4:                               ## @.str.4
	.asciz	"stringConstant"

L_.str.5:                               ## @.str.5
	.asciz	"unknown"

L_.str.6:                               ## @.str.6
	.asciz	"class"

L_.str.7:                               ## @.str.7
	.asciz	"constructor"

L_.str.8:                               ## @.str.8
	.asciz	"function"

L_.str.9:                               ## @.str.9
	.asciz	"method"

L_.str.10:                              ## @.str.10
	.asciz	"field"

L_.str.11:                              ## @.str.11
	.asciz	"static"

L_.str.12:                              ## @.str.12
	.asciz	"var"

L_.str.13:                              ## @.str.13
	.asciz	"int"

L_.str.14:                              ## @.str.14
	.asciz	"char"

L_.str.15:                              ## @.str.15
	.asciz	"boolean"

L_.str.16:                              ## @.str.16
	.asciz	"void"

L_.str.17:                              ## @.str.17
	.asciz	"true"

L_.str.18:                              ## @.str.18
	.asciz	"false"

L_.str.19:                              ## @.str.19
	.asciz	"null"

L_.str.20:                              ## @.str.20
	.asciz	"this"

L_.str.21:                              ## @.str.21
	.asciz	"let"

L_.str.22:                              ## @.str.22
	.asciz	"do"

L_.str.23:                              ## @.str.23
	.asciz	"if"

L_.str.24:                              ## @.str.24
	.asciz	"else"

L_.str.25:                              ## @.str.25
	.asciz	"while"

L_.str.26:                              ## @.str.26
	.asciz	"return"

.subsections_via_symbols
