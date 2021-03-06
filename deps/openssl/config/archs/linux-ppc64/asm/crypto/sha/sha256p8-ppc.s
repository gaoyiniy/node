.machine	"any"
.text

.globl	sha256_block_p8
.type	sha256_block_p8,@function
.section	".opd","aw"
.align	3
sha256_block_p8:
.quad	.sha256_block_p8,.TOC.@tocbase,0
.previous

.align	6
.sha256_block_p8:
	stdu	1,-448(1)
	mflr	8
	li	10,207
	li	11,223
	stvx	20,10,1
	addi	10,10,32
	mfspr	12,256
	stvx	21,11,1
	addi	11,11,32
	stvx	22,10,1
	addi	10,10,32
	stvx	23,11,1
	addi	11,11,32
	stvx	24,10,1
	addi	10,10,32
	stvx	25,11,1
	addi	11,11,32
	stvx	26,10,1
	addi	10,10,32
	stvx	27,11,1
	addi	11,11,32
	stvx	28,10,1
	addi	10,10,32
	stvx	29,11,1
	addi	11,11,32
	stvx	30,10,1
	stvx	31,11,1
	li	11,-1
	stw	12,396(1)
	li	10,0x10
	std	26,400(1)
	li	26,0x20
	std	27,408(1)
	li	27,0x30
	std	28,416(1)
	li	28,0x40
	std	29,424(1)
	li	29,0x50
	std	30,432(1)
	li	30,0x60
	std	31,440(1)
	li	31,0x70
	std	8,464(1)
	mtspr	256,11

	bl	.LPICmeup
	addi	11,1,64+15
	.long	0x7C001E19
	.long	0x7C8A1E19
	vsldoi	1,0,0,4
	vsldoi	2,0,0,8
	vsldoi	3,0,0,12
	vsldoi	5,4,4,4
	vsldoi	6,4,4,8
	vsldoi	7,4,4,12
	li	0,3
	b	.Loop
.align	5
.Loop:
	lvx	24,0,6
	li	7,16
	.long	0x7D002699
	addi	4,4,16
	stvx	0,0,11
	stvx	1,10,11
	stvx	2,26,11
	stvx	3,27,11
	stvx	4,28,11
	stvx	5,29,11
	stvx	6,30,11
	stvx	7,31,11
	vadduwm	7,7,24
	lvx	24,7,6
	addi	7,7,16

	vsel	25,6,5,4
	.long	0x1364FE82
	vadduwm	7,7,8
	.long	0x13408682

	vadduwm	7,7,25
	vxor	25,0,1

	vadduwm	7,7,27
	vsel	25,1,2,25
	vadduwm	6,6,24
	vadduwm	3,3,7
	vadduwm	26,26,25

	lvx	24,7,6
	addi	7,7,16
	vadduwm	7,7,26

	vsldoi	9,8,8,4

	vsel	25,5,4,3
	.long	0x1363FE82
	vadduwm	6,6,9
	.long	0x13478682

	vadduwm	6,6,25
	vxor	25,7,0

	vadduwm	6,6,27
	vsel	25,0,1,25
	vadduwm	5,5,24
	vadduwm	2,2,6
	vadduwm	26,26,25

	lvx	24,7,6
	addi	7,7,16
	vadduwm	6,6,26

	vsldoi	10,9,9,4

	vsel	25,4,3,2
	.long	0x1362FE82
	vadduwm	5,5,10
	.long	0x13468682

	vadduwm	5,5,25
	vxor	25,6,7

	vadduwm	5,5,27
	vsel	25,7,0,25
	vadduwm	4,4,24
	vadduwm	1,1,5
	vadduwm	26,26,25

	lvx	24,7,6
	addi	7,7,16
	vadduwm	5,5,26

	.long	0x7D802699
	addi	4,4,16
	vsldoi	11,10,10,4

	vsel	25,3,2,1
	.long	0x1361FE82
	vadduwm	4,4,11
	.long	0x13458682

	vadduwm	4,4,25
	vxor	25,5,6

	vadduwm	4,4,27
	vsel	25,6,7,25
	vadduwm	3,3,24
	vadduwm	0,0,4
	vadduwm	26,26,25

	lvx	24,7,6
	addi	7,7,16
	vadduwm	4,4,26


	vsel	25,2,1,0
	.long	0x1360FE82
	vadduwm	3,3,12
	.long	0x13448682

	vadduwm	3,3,25
	vxor	25,4,5

	vadduwm	3,3,27
	vsel	25,5,6,25
	vadduwm	2,2,24
	vadduwm	7,7,3
	vadduwm	26,26,25

	lvx	24,7,6
	addi	7,7,16
	vadduwm	3,3,26

	vsldoi	13,12,12,4

	vsel	25,1,0,7
	.long	0x1367FE82
	vadduwm	2,2,13
	.long	0x13438682

	vadduwm	2,2,25
	vxor	25,3,4

	vadduwm	2,2,27
	vsel	25,4,5,25
	vadduwm	1,1,24
	vadduwm	6,6,2
	vadduwm	26,26,25

	lvx	24,7,6
	addi	7,7,16
	vadduwm	2,2,26

	vsldoi	14,13,13,4

	vsel	25,0,7,6
	.long	0x1366FE82
	vadduwm	1,1,14
	.long	0x13428682

	vadduwm	1,1,25
	vxor	25,2,3

	vadduwm	1,1,27
	vsel	25,3,4,25
	vadduwm	0,0,24
	vadduwm	5,5,1
	vadduwm	26,26,25

	lvx	24,7,6
	addi	7,7,16
	vadduwm	1,1,26

	.long	0x7E002699
	addi	4,4,16
	vsldoi	15,14,14,4

	vsel	25,7,6,5
	.long	0x1365FE82
	vadduwm	0,0,15
	.long	0x13418682

	vadduwm	0,0,25
	vxor	25,1,2

	vadduwm	0,0,27
	vsel	25,2,3,25
	vadduwm	7,7,24
	vadduwm	4,4,0
	vadduwm	26,26,25

	lvx	24,7,6
	addi	7,7,16
	vadduwm	0,0,26


	vsel	25,6,5,4
	.long	0x1364FE82
	vadduwm	7,7,16
	.long	0x13408682

	vadduwm	7,7,25
	vxor	25,0,1

	vadduwm	7,7,27
	vsel	25,1,2,25
	vadduwm	6,6,24
	vadduwm	3,3,7
	vadduwm	26,26,25

	lvx	24,7,6
	addi	7,7,16
	vadduwm	7,7,26

	vsldoi	17,16,16,4

	vsel	25,5,4,3
	.long	0x1363FE82
	vadduwm	6,6,17
	.long	0x13478682

	vadduwm	6,6,25
	vxor	25,7,0

	vadduwm	6,6,27
	vsel	25,0,1,25
	vadduwm	5,5,24
	vadduwm	2,2,6
	vadduwm	26,26,25

	lvx	24,7,6
	addi	7,7,16
	vadduwm	6,6,26

	vsldoi	18,17,17,4

	vsel	25,4,3,2
	.long	0x1362FE82
	vadduwm	5,5,18
	.long	0x13468682

	vadduwm	5,5,25
	vxor	25,6,7

	vadduwm	5,5,27
	vsel	25,7,0,25
	vadduwm	4,4,24
	vadduwm	1,1,5
	vadduwm	26,26,25

	lvx	24,7,6
	addi	7,7,16
	vadduwm	5,5,26

	.long	0x7E802699
	addi	4,4,16
	vsldoi	19,18,18,4

	vsel	25,3,2,1
	.long	0x1361FE82
	vadduwm	4,4,19
	.long	0x13458682

	vadduwm	4,4,25
	vxor	25,5,6

	vadduwm	4,4,27
	vsel	25,6,7,25
	vadduwm	3,3,24
	vadduwm	0,0,4
	vadduwm	26,26,25

	lvx	24,7,6
	addi	7,7,16
	vadduwm	4,4,26


	vsel	25,2,1,0
	.long	0x1360FE82
	vadduwm	3,3,20
	.long	0x13448682

	vadduwm	3,3,25
	vxor	25,4,5

	vadduwm	3,3,27
	vsel	25,5,6,25
	vadduwm	2,2,24
	vadduwm	7,7,3
	vadduwm	26,26,25

	lvx	24,7,6
	addi	7,7,16
	vadduwm	3,3,26

	vsldoi	21,20,20,4

	vsel	25,1,0,7
	.long	0x1367FE82
	vadduwm	2,2,21
	.long	0x13438682

	vadduwm	2,2,25
	vxor	25,3,4

	vadduwm	2,2,27
	vsel	25,4,5,25
	vadduwm	1,1,24
	vadduwm	6,6,2
	vadduwm	26,26,25

	lvx	24,7,6
	addi	7,7,16
	vadduwm	2,2,26

	vsldoi	22,21,21,4

	vsel	25,0,7,6
	.long	0x1366FE82
	vadduwm	1,1,22
	.long	0x13428682

	vadduwm	1,1,25
	vxor	25,2,3

	vadduwm	1,1,27
	vsel	25,3,4,25
	vadduwm	0,0,24
	vadduwm	5,5,1
	vadduwm	26,26,25

	lvx	24,7,6
	addi	7,7,16
	vadduwm	1,1,26

	vsldoi	23,22,22,4
	.long	0x13890682
	vsel	25,7,6,5
	.long	0x1365FE82
	vadduwm	0,0,23
	.long	0x13418682
	.long	0x13B67E82
	vadduwm	0,0,25
	vxor	25,1,2
	vadduwm	8,8,17
	vadduwm	0,0,27
	vsel	25,2,3,25
	vadduwm	7,7,24
	vadduwm	4,4,0
	vadduwm	26,26,25
	vadduwm	8,8,28
	lvx	24,7,6
	addi	7,7,16
	vadduwm	0,0,26
	vadduwm	8,8,29
	mtctr	0
	b	.L16_xx
.align	5
.L16_xx:
	.long	0x138A0682
	vsel	25,6,5,4
	.long	0x1364FE82
	vadduwm	7,7,8
	.long	0x13408682
	.long	0x13B77E82
	vadduwm	7,7,25
	vxor	25,0,1
	vadduwm	9,9,18
	vadduwm	7,7,27
	vsel	25,1,2,25
	vadduwm	6,6,24
	vadduwm	3,3,7
	vadduwm	26,26,25
	vadduwm	9,9,28
	lvx	24,7,6
	addi	7,7,16
	vadduwm	7,7,26
	vadduwm	9,9,29
	.long	0x138B0682
	vsel	25,5,4,3
	.long	0x1363FE82
	vadduwm	6,6,9
	.long	0x13478682
	.long	0x13A87E82
	vadduwm	6,6,25
	vxor	25,7,0
	vadduwm	10,10,19
	vadduwm	6,6,27
	vsel	25,0,1,25
	vadduwm	5,5,24
	vadduwm	2,2,6
	vadduwm	26,26,25
	vadduwm	10,10,28
	lvx	24,7,6
	addi	7,7,16
	vadduwm	6,6,26
	vadduwm	10,10,29
	.long	0x138C0682
	vsel	25,4,3,2
	.long	0x1362FE82
	vadduwm	5,5,10
	.long	0x13468682
	.long	0x13A97E82
	vadduwm	5,5,25
	vxor	25,6,7
	vadduwm	11,11,20
	vadduwm	5,5,27
	vsel	25,7,0,25
	vadduwm	4,4,24
	vadduwm	1,1,5
	vadduwm	26,26,25
	vadduwm	11,11,28
	lvx	24,7,6
	addi	7,7,16
	vadduwm	5,5,26
	vadduwm	11,11,29
	.long	0x138D0682
	vsel	25,3,2,1
	.long	0x1361FE82
	vadduwm	4,4,11
	.long	0x13458682
	.long	0x13AA7E82
	vadduwm	4,4,25
	vxor	25,5,6
	vadduwm	12,12,21
	vadduwm	4,4,27
	vsel	25,6,7,25
	vadduwm	3,3,24
	vadduwm	0,0,4
	vadduwm	26,26,25
	vadduwm	12,12,28
	lvx	24,7,6
	addi	7,7,16
	vadduwm	4,4,26
	vadduwm	12,12,29
	.long	0x138E0682
	vsel	25,2,1,0
	.long	0x1360FE82
	vadduwm	3,3,12
	.long	0x13448682
	.long	0x13AB7E82
	vadduwm	3,3,25
	vxor	25,4,5
	vadduwm	13,13,22
	vadduwm	3,3,27
	vsel	25,5,6,25
	vadduwm	2,2,24
	vadduwm	7,7,3
	vadduwm	26,26,25
	vadduwm	13,13,28
	lvx	24,7,6
	addi	7,7,16
	vadduwm	3,3,26
	vadduwm	13,13,29
	.long	0x138F0682
	vsel	25,1,0,7
	.long	0x1367FE82
	vadduwm	2,2,13
	.long	0x13438682
	.long	0x13AC7E82
	vadduwm	2,2,25
	vxor	25,3,4
	vadduwm	14,14,23
	vadduwm	2,2,27
	vsel	25,4,5,25
	vadduwm	1,1,24
	vadduwm	6,6,2
	vadduwm	26,26,25
	vadduwm	14,14,28
	lvx	24,7,6
	addi	7,7,16
	vadduwm	2,2,26
	vadduwm	14,14,29
	.long	0x13900682
	vsel	25,0,7,6
	.long	0x1366FE82
	vadduwm	1,1,14
	.long	0x13428682
	.long	0x13AD7E82
	vadduwm	1,1,25
	vxor	25,2,3
	vadduwm	15,15,8
	vadduwm	1,1,27
	vsel	25,3,4,25
	vadduwm	0,0,24
	vadduwm	5,5,1
	vadduwm	26,26,25
	vadduwm	15,15,28
	lvx	24,7,6
	addi	7,7,16
	vadduwm	1,1,26
	vadduwm	15,15,29
	.long	0x13910682
	vsel	25,7,6,5
	.long	0x1365FE82
	vadduwm	0,0,15
	.long	0x13418682
	.long	0x13AE7E82
	vadduwm	0,0,25
	vxor	25,1,2
	vadduwm	16,16,9
	vadduwm	0,0,27
	vsel	25,2,3,25
	vadduwm	7,7,24
	vadduwm	4,4,0
	vadduwm	26,26,25
	vadduwm	16,16,28
	lvx	24,7,6
	addi	7,7,16
	vadduwm	0,0,26
	vadduwm	16,16,29
	.long	0x13920682
	vsel	25,6,5,4
	.long	0x1364FE82
	vadduwm	7,7,16
	.long	0x13408682
	.long	0x13AF7E82
	vadduwm	7,7,25
	vxor	25,0,1
	vadduwm	17,17,10
	vadduwm	7,7,27
	vsel	25,1,2,25
	vadduwm	6,6,24
	vadduwm	3,3,7
	vadduwm	26,26,25
	vadduwm	17,17,28
	lvx	24,7,6
	addi	7,7,16
	vadduwm	7,7,26
	vadduwm	17,17,29
	.long	0x13930682
	vsel	25,5,4,3
	.long	0x1363FE82
	vadduwm	6,6,17
	.long	0x13478682
	.long	0x13B07E82
	vadduwm	6,6,25
	vxor	25,7,0
	vadduwm	18,18,11
	vadduwm	6,6,27
	vsel	25,0,1,25
	vadduwm	5,5,24
	vadduwm	2,2,6
	vadduwm	26,26,25
	vadduwm	18,18,28
	lvx	24,7,6
	addi	7,7,16
	vadduwm	6,6,26
	vadduwm	18,18,29
	.long	0x13940682
	vsel	25,4,3,2
	.long	0x1362FE82
	vadduwm	5,5,18
	.long	0x13468682
	.long	0x13B17E82
	vadduwm	5,5,25
	vxor	25,6,7
	vadduwm	19,19,12
	vadduwm	5,5,27
	vsel	25,7,0,25
	vadduwm	4,4,24
	vadduwm	1,1,5
	vadduwm	26,26,25
	vadduwm	19,19,28
	lvx	24,7,6
	addi	7,7,16
	vadduwm	5,5,26
	vadduwm	19,19,29
	.long	0x13950682
	vsel	25,3,2,1
	.long	0x1361FE82
	vadduwm	4,4,19
	.long	0x13458682
	.long	0x13B27E82
	vadduwm	4,4,25
	vxor	25,5,6
	vadduwm	20,20,13
	vadduwm	4,4,27
	vsel	25,6,7,25
	vadduwm	3,3,24
	vadduwm	0,0,4
	vadduwm	26,26,25
	vadduwm	20,20,28
	lvx	24,7,6
	addi	7,7,16
	vadduwm	4,4,26
	vadduwm	20,20,29
	.long	0x13960682
	vsel	25,2,1,0
	.long	0x1360FE82
	vadduwm	3,3,20
	.long	0x13448682
	.long	0x13B37E82
	vadduwm	3,3,25
	vxor	25,4,5
	vadduwm	21,21,14
	vadduwm	3,3,27
	vsel	25,5,6,25
	vadduwm	2,2,24
	vadduwm	7,7,3
	vadduwm	26,26,25
	vadduwm	21,21,28
	lvx	24,7,6
	addi	7,7,16
	vadduwm	3,3,26
	vadduwm	21,21,29
	.long	0x13970682
	vsel	25,1,0,7
	.long	0x1367FE82
	vadduwm	2,2,21
	.long	0x13438682
	.long	0x13B47E82
	vadduwm	2,2,25
	vxor	25,3,4
	vadduwm	22,22,15
	vadduwm	2,2,27
	vsel	25,4,5,25
	vadduwm	1,1,24
	vadduwm	6,6,2
	vadduwm	26,26,25
	vadduwm	22,22,28
	lvx	24,7,6
	addi	7,7,16
	vadduwm	2,2,26
	vadduwm	22,22,29
	.long	0x13880682
	vsel	25,0,7,6
	.long	0x1366FE82
	vadduwm	1,1,22
	.long	0x13428682
	.long	0x13B57E82
	vadduwm	1,1,25
	vxor	25,2,3
	vadduwm	23,23,16
	vadduwm	1,1,27
	vsel	25,3,4,25
	vadduwm	0,0,24
	vadduwm	5,5,1
	vadduwm	26,26,25
	vadduwm	23,23,28
	lvx	24,7,6
	addi	7,7,16
	vadduwm	1,1,26
	vadduwm	23,23,29
	.long	0x13890682
	vsel	25,7,6,5
	.long	0x1365FE82
	vadduwm	0,0,23
	.long	0x13418682
	.long	0x13B67E82
	vadduwm	0,0,25
	vxor	25,1,2
	vadduwm	8,8,17
	vadduwm	0,0,27
	vsel	25,2,3,25
	vadduwm	7,7,24
	vadduwm	4,4,0
	vadduwm	26,26,25
	vadduwm	8,8,28
	lvx	24,7,6
	addi	7,7,16
	vadduwm	0,0,26
	vadduwm	8,8,29
	bdnz	.L16_xx

	lvx	10,0,11
	subic.	5,5,1
	lvx	11,10,11
	vadduwm	0,0,10
	lvx	12,26,11
	vadduwm	1,1,11
	lvx	13,27,11
	vadduwm	2,2,12
	lvx	14,28,11
	vadduwm	3,3,13
	lvx	15,29,11
	vadduwm	4,4,14
	lvx	16,30,11
	vadduwm	5,5,15
	lvx	17,31,11
	vadduwm	6,6,16
	vadduwm	7,7,17
	bne	.Loop
	lvx	8,7,6
	addi	7,7,16
	vperm	0,0,1,24
	lvx	9,7,6
	vperm	4,4,5,24
	vperm	0,0,2,8
	vperm	4,4,6,8
	vperm	0,0,3,9
	vperm	4,4,7,9
	.long	0x7C001F19
	.long	0x7C8A1F19
	li	10,207
	mtlr	8
	li	11,223
	mtspr	256,12
	lvx	20,10,1
	addi	10,10,32
	lvx	21,11,1
	addi	11,11,32
	lvx	22,10,1
	addi	10,10,32
	lvx	23,11,1
	addi	11,11,32
	lvx	24,10,1
	addi	10,10,32
	lvx	25,11,1
	addi	11,11,32
	lvx	26,10,1
	addi	10,10,32
	lvx	27,11,1
	addi	11,11,32
	lvx	28,10,1
	addi	10,10,32
	lvx	29,11,1
	addi	11,11,32
	lvx	30,10,1
	lvx	31,11,1
	ld	26,400(1)
	ld	27,408(1)
	ld	28,416(1)
	ld	29,424(1)
	ld	30,432(1)
	ld	31,440(1)
	addi	1,1,448
	blr
.long	0
.byte	0,12,4,1,0x80,6,3,0
.long	0
.size	sha256_block_p8,.-.sha256_block_p8
.size	.sha256_block_p8,.-.sha256_block_p8
.align	6
.LPICmeup:
	mflr	0
	bcl	20,31,$+4
	mflr	6
	addi	6,6,56
	mtlr	0
	blr
.long	0
.byte	0,12,0x14,0,0,0,0,0
.space	28
.long	0x428a2f98,0x428a2f98,0x428a2f98,0x428a2f98
.long	0x71374491,0x71374491,0x71374491,0x71374491
.long	0xb5c0fbcf,0xb5c0fbcf,0xb5c0fbcf,0xb5c0fbcf
.long	0xe9b5dba5,0xe9b5dba5,0xe9b5dba5,0xe9b5dba5
.long	0x3956c25b,0x3956c25b,0x3956c25b,0x3956c25b
.long	0x59f111f1,0x59f111f1,0x59f111f1,0x59f111f1
.long	0x923f82a4,0x923f82a4,0x923f82a4,0x923f82a4
.long	0xab1c5ed5,0xab1c5ed5,0xab1c5ed5,0xab1c5ed5
.long	0xd807aa98,0xd807aa98,0xd807aa98,0xd807aa98
.long	0x12835b01,0x12835b01,0x12835b01,0x12835b01
.long	0x243185be,0x243185be,0x243185be,0x243185be
.long	0x550c7dc3,0x550c7dc3,0x550c7dc3,0x550c7dc3
.long	0x72be5d74,0x72be5d74,0x72be5d74,0x72be5d74
.long	0x80deb1fe,0x80deb1fe,0x80deb1fe,0x80deb1fe
.long	0x9bdc06a7,0x9bdc06a7,0x9bdc06a7,0x9bdc06a7
.long	0xc19bf174,0xc19bf174,0xc19bf174,0xc19bf174
.long	0xe49b69c1,0xe49b69c1,0xe49b69c1,0xe49b69c1
.long	0xefbe4786,0xefbe4786,0xefbe4786,0xefbe4786
.long	0x0fc19dc6,0x0fc19dc6,0x0fc19dc6,0x0fc19dc6
.long	0x240ca1cc,0x240ca1cc,0x240ca1cc,0x240ca1cc
.long	0x2de92c6f,0x2de92c6f,0x2de92c6f,0x2de92c6f
.long	0x4a7484aa,0x4a7484aa,0x4a7484aa,0x4a7484aa
.long	0x5cb0a9dc,0x5cb0a9dc,0x5cb0a9dc,0x5cb0a9dc
.long	0x76f988da,0x76f988da,0x76f988da,0x76f988da
.long	0x983e5152,0x983e5152,0x983e5152,0x983e5152
.long	0xa831c66d,0xa831c66d,0xa831c66d,0xa831c66d
.long	0xb00327c8,0xb00327c8,0xb00327c8,0xb00327c8
.long	0xbf597fc7,0xbf597fc7,0xbf597fc7,0xbf597fc7
.long	0xc6e00bf3,0xc6e00bf3,0xc6e00bf3,0xc6e00bf3
.long	0xd5a79147,0xd5a79147,0xd5a79147,0xd5a79147
.long	0x06ca6351,0x06ca6351,0x06ca6351,0x06ca6351
.long	0x14292967,0x14292967,0x14292967,0x14292967
.long	0x27b70a85,0x27b70a85,0x27b70a85,0x27b70a85
.long	0x2e1b2138,0x2e1b2138,0x2e1b2138,0x2e1b2138
.long	0x4d2c6dfc,0x4d2c6dfc,0x4d2c6dfc,0x4d2c6dfc
.long	0x53380d13,0x53380d13,0x53380d13,0x53380d13
.long	0x650a7354,0x650a7354,0x650a7354,0x650a7354
.long	0x766a0abb,0x766a0abb,0x766a0abb,0x766a0abb
.long	0x81c2c92e,0x81c2c92e,0x81c2c92e,0x81c2c92e
.long	0x92722c85,0x92722c85,0x92722c85,0x92722c85
.long	0xa2bfe8a1,0xa2bfe8a1,0xa2bfe8a1,0xa2bfe8a1
.long	0xa81a664b,0xa81a664b,0xa81a664b,0xa81a664b
.long	0xc24b8b70,0xc24b8b70,0xc24b8b70,0xc24b8b70
.long	0xc76c51a3,0xc76c51a3,0xc76c51a3,0xc76c51a3
.long	0xd192e819,0xd192e819,0xd192e819,0xd192e819
.long	0xd6990624,0xd6990624,0xd6990624,0xd6990624
.long	0xf40e3585,0xf40e3585,0xf40e3585,0xf40e3585
.long	0x106aa070,0x106aa070,0x106aa070,0x106aa070
.long	0x19a4c116,0x19a4c116,0x19a4c116,0x19a4c116
.long	0x1e376c08,0x1e376c08,0x1e376c08,0x1e376c08
.long	0x2748774c,0x2748774c,0x2748774c,0x2748774c
.long	0x34b0bcb5,0x34b0bcb5,0x34b0bcb5,0x34b0bcb5
.long	0x391c0cb3,0x391c0cb3,0x391c0cb3,0x391c0cb3
.long	0x4ed8aa4a,0x4ed8aa4a,0x4ed8aa4a,0x4ed8aa4a
.long	0x5b9cca4f,0x5b9cca4f,0x5b9cca4f,0x5b9cca4f
.long	0x682e6ff3,0x682e6ff3,0x682e6ff3,0x682e6ff3
.long	0x748f82ee,0x748f82ee,0x748f82ee,0x748f82ee
.long	0x78a5636f,0x78a5636f,0x78a5636f,0x78a5636f
.long	0x84c87814,0x84c87814,0x84c87814,0x84c87814
.long	0x8cc70208,0x8cc70208,0x8cc70208,0x8cc70208
.long	0x90befffa,0x90befffa,0x90befffa,0x90befffa
.long	0xa4506ceb,0xa4506ceb,0xa4506ceb,0xa4506ceb
.long	0xbef9a3f7,0xbef9a3f7,0xbef9a3f7,0xbef9a3f7
.long	0xc67178f2,0xc67178f2,0xc67178f2,0xc67178f2
.long	0,0,0,0
.long	0x00010203,0x10111213,0x10111213,0x10111213
.long	0x00010203,0x04050607,0x10111213,0x10111213
.long	0x00010203,0x04050607,0x08090a0b,0x10111213
.byte	83,72,65,50,53,54,32,102,111,114,32,80,111,119,101,114,73,83,65,32,50,46,48,55,44,32,67,82,89,80,84,79,71,65,77,83,32,98,121,32,60,97,112,112,114,111,64,111,112,101,110,115,115,108,46,111,114,103,62,0
.align	2
.align	2
