
test:     file format elf64-x86-64


Disassembly of section .init:

0000000000001000 <_init>:
    1000:	f3 0f 1e fa          	endbr64 
    1004:	48 83 ec 08          	sub    $0x8,%rsp
    1008:	48 8b 05 d9 2f 00 00 	mov    0x2fd9(%rip),%rax        # 3fe8 <__gmon_start__@Base>
    100f:	48 85 c0             	test   %rax,%rax
    1012:	74 02                	je     1016 <_init+0x16>
    1014:	ff d0                	call   *%rax
    1016:	48 83 c4 08          	add    $0x8,%rsp
    101a:	c3                   	ret    

Disassembly of section .plt:

0000000000001020 <.plt>:
    1020:	ff 35 62 2f 00 00    	push   0x2f62(%rip)        # 3f88 <_GLOBAL_OFFSET_TABLE_+0x8>
    1026:	f2 ff 25 63 2f 00 00 	bnd jmp *0x2f63(%rip)        # 3f90 <_GLOBAL_OFFSET_TABLE_+0x10>
    102d:	0f 1f 00             	nopl   (%rax)
    1030:	f3 0f 1e fa          	endbr64 
    1034:	68 00 00 00 00       	push   $0x0
    1039:	f2 e9 e1 ff ff ff    	bnd jmp 1020 <_init+0x20>
    103f:	90                   	nop
    1040:	f3 0f 1e fa          	endbr64 
    1044:	68 01 00 00 00       	push   $0x1
    1049:	f2 e9 d1 ff ff ff    	bnd jmp 1020 <_init+0x20>
    104f:	90                   	nop
    1050:	f3 0f 1e fa          	endbr64 
    1054:	68 02 00 00 00       	push   $0x2
    1059:	f2 e9 c1 ff ff ff    	bnd jmp 1020 <_init+0x20>
    105f:	90                   	nop
    1060:	f3 0f 1e fa          	endbr64 
    1064:	68 03 00 00 00       	push   $0x3
    1069:	f2 e9 b1 ff ff ff    	bnd jmp 1020 <_init+0x20>
    106f:	90                   	nop
    1070:	f3 0f 1e fa          	endbr64 
    1074:	68 04 00 00 00       	push   $0x4
    1079:	f2 e9 a1 ff ff ff    	bnd jmp 1020 <_init+0x20>
    107f:	90                   	nop
    1080:	f3 0f 1e fa          	endbr64 
    1084:	68 05 00 00 00       	push   $0x5
    1089:	f2 e9 91 ff ff ff    	bnd jmp 1020 <_init+0x20>
    108f:	90                   	nop
    1090:	f3 0f 1e fa          	endbr64 
    1094:	68 06 00 00 00       	push   $0x6
    1099:	f2 e9 81 ff ff ff    	bnd jmp 1020 <_init+0x20>
    109f:	90                   	nop
    10a0:	f3 0f 1e fa          	endbr64 
    10a4:	68 07 00 00 00       	push   $0x7
    10a9:	f2 e9 71 ff ff ff    	bnd jmp 1020 <_init+0x20>
    10af:	90                   	nop

Disassembly of section .plt.got:

00000000000010b0 <__cxa_finalize@plt>:
    10b0:	f3 0f 1e fa          	endbr64 
    10b4:	f2 ff 25 3d 2f 00 00 	bnd jmp *0x2f3d(%rip)        # 3ff8 <__cxa_finalize@GLIBC_2.2.5>
    10bb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

Disassembly of section .plt.sec:

00000000000010c0 <__stack_chk_fail@plt>:
    10c0:	f3 0f 1e fa          	endbr64 
    10c4:	f2 ff 25 cd 2e 00 00 	bnd jmp *0x2ecd(%rip)        # 3f98 <__stack_chk_fail@GLIBC_2.4>
    10cb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

00000000000010d0 <gettimeofday@plt>:
    10d0:	f3 0f 1e fa          	endbr64 
    10d4:	f2 ff 25 c5 2e 00 00 	bnd jmp *0x2ec5(%rip)        # 3fa0 <gettimeofday@GLIBC_2.2.5>
    10db:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

00000000000010e0 <execve@plt>:
    10e0:	f3 0f 1e fa          	endbr64 
    10e4:	f2 ff 25 bd 2e 00 00 	bnd jmp *0x2ebd(%rip)        # 3fa8 <execve@GLIBC_2.2.5>
    10eb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

00000000000010f0 <__printf_chk@plt>:
    10f0:	f3 0f 1e fa          	endbr64 
    10f4:	f2 ff 25 b5 2e 00 00 	bnd jmp *0x2eb5(%rip)        # 3fb0 <__printf_chk@GLIBC_2.3.4>
    10fb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000001100 <perror@plt>:
    1100:	f3 0f 1e fa          	endbr64 
    1104:	f2 ff 25 ad 2e 00 00 	bnd jmp *0x2ead(%rip)        # 3fb8 <perror@GLIBC_2.2.5>
    110b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000001110 <exit@plt>:
    1110:	f3 0f 1e fa          	endbr64 
    1114:	f2 ff 25 a5 2e 00 00 	bnd jmp *0x2ea5(%rip)        # 3fc0 <exit@GLIBC_2.2.5>
    111b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000001120 <wait@plt>:
    1120:	f3 0f 1e fa          	endbr64 
    1124:	f2 ff 25 9d 2e 00 00 	bnd jmp *0x2e9d(%rip)        # 3fc8 <wait@GLIBC_2.2.5>
    112b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000001130 <fork@plt>:
    1130:	f3 0f 1e fa          	endbr64 
    1134:	f2 ff 25 95 2e 00 00 	bnd jmp *0x2e95(%rip)        # 3fd0 <fork@GLIBC_2.2.5>
    113b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

Disassembly of section .text:

0000000000001140 <main>:
    1140:	f3 0f 1e fa          	endbr64 
    1144:	55                   	push   %rbp
    1145:	31 f6                	xor    %esi,%esi
    1147:	48 8d 2d ea 0e 00 00 	lea    0xeea(%rip),%rbp        # 2038 <_IO_stdin_used+0x38>
    114e:	48 8d 3d eb 2e 00 00 	lea    0x2eeb(%rip),%rdi        # 4040 <start>
    1155:	48 83 ec 20          	sub    $0x20,%rsp
    1159:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
    1160:	00 00 
    1162:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
    1167:	31 c0                	xor    %eax,%eax
    1169:	48 89 2c 24          	mov    %rbp,(%rsp)
    116d:	48 c7 44 24 08 00 00 	movq   $0x0,0x8(%rsp)
    1174:	00 00 
    1176:	e8 55 ff ff ff       	call   10d0 <gettimeofday@plt>
    117b:	e8 b0 ff ff ff       	call   1130 <fork@plt>
    1180:	85 c0                	test   %eax,%eax
    1182:	74 6b                	je     11ef <main+0xaf>
    1184:	0f 8e 8d 00 00 00    	jle    1217 <main+0xd7>
    118a:	31 ff                	xor    %edi,%edi
    118c:	31 c0                	xor    %eax,%eax
    118e:	e8 8d ff ff ff       	call   1120 <wait@plt>
    1193:	31 f6                	xor    %esi,%esi
    1195:	48 8d 3d 84 2e 00 00 	lea    0x2e84(%rip),%rdi        # 4020 <end>
    119c:	e8 2f ff ff ff       	call   10d0 <gettimeofday@plt>
    11a1:	48 8b 15 78 2e 00 00 	mov    0x2e78(%rip),%rdx        # 4020 <end>
    11a8:	31 c0                	xor    %eax,%eax
    11aa:	48 2b 15 8f 2e 00 00 	sub    0x2e8f(%rip),%rdx        # 4040 <start>
    11b1:	48 69 d2 40 42 0f 00 	imul   $0xf4240,%rdx,%rdx
    11b8:	48 8d 35 5a 0e 00 00 	lea    0xe5a(%rip),%rsi        # 2019 <_IO_stdin_used+0x19>
    11bf:	48 03 15 62 2e 00 00 	add    0x2e62(%rip),%rdx        # 4028 <end+0x8>
    11c6:	bf 01 00 00 00       	mov    $0x1,%edi
    11cb:	48 2b 15 76 2e 00 00 	sub    0x2e76(%rip),%rdx        # 4048 <start+0x8>
    11d2:	e8 19 ff ff ff       	call   10f0 <__printf_chk@plt>
    11d7:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
    11dc:	64 48 2b 04 25 28 00 	sub    %fs:0x28,%rax
    11e3:	00 00 
    11e5:	75 2b                	jne    1212 <main+0xd2>
    11e7:	48 83 c4 20          	add    $0x20,%rsp
    11eb:	31 c0                	xor    %eax,%eax
    11ed:	5d                   	pop    %rbp
    11ee:	c3                   	ret    
    11ef:	48 89 e6             	mov    %rsp,%rsi
    11f2:	31 d2                	xor    %edx,%edx
    11f4:	48 89 ef             	mov    %rbp,%rdi
    11f7:	e8 e4 fe ff ff       	call   10e0 <execve@plt> 
    11fc:	48 8d 3d 0f 0e 00 00 	lea    0xe0f(%rip),%rdi        # 2012 <_IO_stdin_used+0x12>
    1203:	e8 f8 fe ff ff       	call   1100 <perror@plt>
    1208:	bf 01 00 00 00       	mov    $0x1,%edi
    120d:	e8 fe fe ff ff       	call   1110 <exit@plt>
    1212:	e8 a9 fe ff ff       	call   10c0 <__stack_chk_fail@plt>
    1217:	48 8d 3d 0f 0e 00 00 	lea    0xe0f(%rip),%rdi        # 202d <_IO_stdin_used+0x2d>
    121e:	e8 dd fe ff ff       	call   1100 <perror@plt>
    1223:	bf 01 00 00 00       	mov    $0x1,%edi
    1228:	e8 e3 fe ff ff       	call   1110 <exit@plt>
    122d:	0f 1f 00             	nopl   (%rax)

0000000000001230 <_start>:
    1230:	f3 0f 1e fa          	endbr64 
    1234:	31 ed                	xor    %ebp,%ebp
    1236:	49 89 d1             	mov    %rdx,%r9
    1239:	5e                   	pop    %rsi
    123a:	48 89 e2             	mov    %rsp,%rdx
    123d:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
    1241:	50                   	push   %rax
    1242:	54                   	push   %rsp
    1243:	45 31 c0             	xor    %r8d,%r8d
    1246:	31 c9                	xor    %ecx,%ecx
    1248:	48 8d 3d f1 fe ff ff 	lea    -0x10f(%rip),%rdi        # 1140 <main>
    124f:	ff 15 83 2d 00 00    	call   *0x2d83(%rip)        # 3fd8 <__libc_start_main@GLIBC_2.34>
    1255:	f4                   	hlt    
    1256:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
    125d:	00 00 00 

0000000000001260 <deregister_tm_clones>:
    1260:	48 8d 3d a9 2d 00 00 	lea    0x2da9(%rip),%rdi        # 4010 <__TMC_END__>
    1267:	48 8d 05 a2 2d 00 00 	lea    0x2da2(%rip),%rax        # 4010 <__TMC_END__>
    126e:	48 39 f8             	cmp    %rdi,%rax
    1271:	74 15                	je     1288 <deregister_tm_clones+0x28>
    1273:	48 8b 05 66 2d 00 00 	mov    0x2d66(%rip),%rax        # 3fe0 <_ITM_deregisterTMCloneTable@Base>
    127a:	48 85 c0             	test   %rax,%rax
    127d:	74 09                	je     1288 <deregister_tm_clones+0x28>
    127f:	ff e0                	jmp    *%rax
    1281:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    1288:	c3                   	ret    
    1289:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000001290 <register_tm_clones>:
    1290:	48 8d 3d 79 2d 00 00 	lea    0x2d79(%rip),%rdi        # 4010 <__TMC_END__>
    1297:	48 8d 35 72 2d 00 00 	lea    0x2d72(%rip),%rsi        # 4010 <__TMC_END__>
    129e:	48 29 fe             	sub    %rdi,%rsi
    12a1:	48 89 f0             	mov    %rsi,%rax
    12a4:	48 c1 ee 3f          	shr    $0x3f,%rsi
    12a8:	48 c1 f8 03          	sar    $0x3,%rax
    12ac:	48 01 c6             	add    %rax,%rsi
    12af:	48 d1 fe             	sar    %rsi
    12b2:	74 14                	je     12c8 <register_tm_clones+0x38>
    12b4:	48 8b 05 35 2d 00 00 	mov    0x2d35(%rip),%rax        # 3ff0 <_ITM_registerTMCloneTable@Base>
    12bb:	48 85 c0             	test   %rax,%rax
    12be:	74 08                	je     12c8 <register_tm_clones+0x38>
    12c0:	ff e0                	jmp    *%rax
    12c2:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    12c8:	c3                   	ret    
    12c9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

00000000000012d0 <__do_global_dtors_aux>:
    12d0:	f3 0f 1e fa          	endbr64 
    12d4:	80 3d 35 2d 00 00 00 	cmpb   $0x0,0x2d35(%rip)        # 4010 <__TMC_END__>
    12db:	75 2b                	jne    1308 <__do_global_dtors_aux+0x38>
    12dd:	55                   	push   %rbp
    12de:	48 83 3d 12 2d 00 00 	cmpq   $0x0,0x2d12(%rip)        # 3ff8 <__cxa_finalize@GLIBC_2.2.5>
    12e5:	00 
    12e6:	48 89 e5             	mov    %rsp,%rbp
    12e9:	74 0c                	je     12f7 <__do_global_dtors_aux+0x27>
    12eb:	48 8b 3d 16 2d 00 00 	mov    0x2d16(%rip),%rdi        # 4008 <__dso_handle>
    12f2:	e8 b9 fd ff ff       	call   10b0 <__cxa_finalize@plt>
    12f7:	e8 64 ff ff ff       	call   1260 <deregister_tm_clones>
    12fc:	c6 05 0d 2d 00 00 01 	movb   $0x1,0x2d0d(%rip)        # 4010 <__TMC_END__>
    1303:	5d                   	pop    %rbp
    1304:	c3                   	ret    
    1305:	0f 1f 00             	nopl   (%rax)
    1308:	c3                   	ret    
    1309:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000001310 <frame_dummy>:
    1310:	f3 0f 1e fa          	endbr64 
    1314:	e9 77 ff ff ff       	jmp    1290 <register_tm_clones>
    1319:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000001320 <print_time>:
    1320:	f3 0f 1e fa          	endbr64 
    1324:	48 83 ec 08          	sub    $0x8,%rsp
    1328:	90                   	nop                             # 用于补上被插桩的指令
    1329:	90                   	nop
    132a:	90                   	nop
    132b:	90                   	nop
    132c:	90                   	nop
    132d:	31 f6                	xor    %esi,%esi
    132f:	48 8d 3d fa 2c 00 00 	lea    0x2cfa(%rip),%rdi        # 4030 <middle>
    1336:	e8 95 fd ff ff       	call   10d0 <gettimeofday@plt>
    133b:	48 8b 15 ee 2c 00 00 	mov    0x2cee(%rip),%rdx        # 4030 <middle>
    1342:	48 2b 15 f7 2c 00 00 	sub    0x2cf7(%rip),%rdx        # 4040 <start>
    1349:	31 c0                	xor    %eax,%eax
    134b:	48 69 d2 40 42 0f 00 	imul   $0xf4240,%rdx,%rdx
    1352:	48 8d 35 ab 0c 00 00 	lea    0xcab(%rip),%rsi        # 2004 <_IO_stdin_used+0x4>
    1359:	48 03 15 d8 2c 00 00 	add    0x2cd8(%rip),%rdx        # 4038 <middle+0x8>
    1360:	bf 01 00 00 00       	mov    $0x1,%edi
    1365:	48 2b 15 dc 2c 00 00 	sub    0x2cdc(%rip),%rdx        # 4048 <start+0x8>
    136c:	48 83 c4 08          	add    $0x8,%rsp
    1370:	e9 7b fd ff ff       	jmp    10f0 <__printf_chk@plt>

Disassembly of section .fini:

0000000000001378 <_fini>:
    1378:	f3 0f 1e fa          	endbr64 
    137c:	48 83 ec 08          	sub    $0x8,%rsp
    1380:	48 83 c4 08          	add    $0x8,%rsp
    1384:	c3                   	ret    
