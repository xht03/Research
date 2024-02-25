
./bin/test1:     file format elf64-x86-64


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
    1020:	ff 35 82 2f 00 00    	push   0x2f82(%rip)        # 3fa8 <_GLOBAL_OFFSET_TABLE_+0x8>
    1026:	f2 ff 25 83 2f 00 00 	bnd jmp *0x2f83(%rip)        # 3fb0 <_GLOBAL_OFFSET_TABLE_+0x10>
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

Disassembly of section .plt.got:

0000000000001070 <__cxa_finalize@plt>:
    1070:	f3 0f 1e fa          	endbr64 
    1074:	f2 ff 25 7d 2f 00 00 	bnd jmp *0x2f7d(%rip)        # 3ff8 <__cxa_finalize@GLIBC_2.2.5>
    107b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

Disassembly of section .plt.sec:

0000000000001080 <putchar@plt>:
    1080:	f3 0f 1e fa          	endbr64 
    1084:	f2 ff 25 2d 2f 00 00 	bnd jmp *0x2f2d(%rip)        # 3fb8 <putchar@GLIBC_2.2.5>
    108b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000001090 <__stack_chk_fail@plt>:
    1090:	f3 0f 1e fa          	endbr64 
    1094:	f2 ff 25 25 2f 00 00 	bnd jmp *0x2f25(%rip)        # 3fc0 <__stack_chk_fail@GLIBC_2.4>
    109b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

00000000000010a0 <printf@plt>:
    10a0:	f3 0f 1e fa          	endbr64 
    10a4:	f2 ff 25 1d 2f 00 00 	bnd jmp *0x2f1d(%rip)        # 3fc8 <printf@GLIBC_2.2.5>
    10ab:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

00000000000010b0 <gettimeofday@plt>:
    10b0:	f3 0f 1e fa          	endbr64 
    10b4:	f2 ff 25 15 2f 00 00 	bnd jmp *0x2f15(%rip)        # 3fd0 <gettimeofday@GLIBC_2.2.5>
    10bb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

Disassembly of section .text:

00000000000010c0 <_start>:
    10c0:	f3 0f 1e fa          	endbr64 
    10c4:	31 ed                	xor    %ebp,%ebp
    10c6:	49 89 d1             	mov    %rdx,%r9
    10c9:	5e                   	pop    %rsi
    10ca:	48 89 e2             	mov    %rsp,%rdx
    10cd:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
    10d1:	50                   	push   %rax
    10d2:	54                   	push   %rsp
    10d3:	45 31 c0             	xor    %r8d,%r8d
    10d6:	31 c9                	xor    %ecx,%ecx
    10d8:	48 8d 3d 61 01 00 00 	lea    0x161(%rip),%rdi        # 1240 <main>
    10df:	ff 15 f3 2e 00 00    	call   *0x2ef3(%rip)        # 3fd8 <__libc_start_main@GLIBC_2.34>
    10e5:	f4                   	hlt    
    10e6:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
    10ed:	00 00 00 

00000000000010f0 <deregister_tm_clones>:
    10f0:	48 8d 3d 19 2f 00 00 	lea    0x2f19(%rip),%rdi        # 4010 <__TMC_END__>
    10f7:	48 8d 05 12 2f 00 00 	lea    0x2f12(%rip),%rax        # 4010 <__TMC_END__>
    10fe:	48 39 f8             	cmp    %rdi,%rax
    1101:	74 15                	je     1118 <deregister_tm_clones+0x28>
    1103:	48 8b 05 d6 2e 00 00 	mov    0x2ed6(%rip),%rax        # 3fe0 <_ITM_deregisterTMCloneTable@Base>
    110a:	48 85 c0             	test   %rax,%rax
    110d:	74 09                	je     1118 <deregister_tm_clones+0x28>
    110f:	ff e0                	jmp    *%rax
    1111:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    1118:	c3                   	ret    
    1119:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000001120 <register_tm_clones>:
    1120:	48 8d 3d e9 2e 00 00 	lea    0x2ee9(%rip),%rdi        # 4010 <__TMC_END__>
    1127:	48 8d 35 e2 2e 00 00 	lea    0x2ee2(%rip),%rsi        # 4010 <__TMC_END__>
    112e:	48 29 fe             	sub    %rdi,%rsi
    1131:	48 89 f0             	mov    %rsi,%rax
    1134:	48 c1 ee 3f          	shr    $0x3f,%rsi
    1138:	48 c1 f8 03          	sar    $0x3,%rax
    113c:	48 01 c6             	add    %rax,%rsi
    113f:	48 d1 fe             	sar    %rsi
    1142:	74 14                	je     1158 <register_tm_clones+0x38>
    1144:	48 8b 05 a5 2e 00 00 	mov    0x2ea5(%rip),%rax        # 3ff0 <_ITM_registerTMCloneTable@Base>
    114b:	48 85 c0             	test   %rax,%rax
    114e:	74 08                	je     1158 <register_tm_clones+0x38>
    1150:	ff e0                	jmp    *%rax
    1152:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    1158:	c3                   	ret    
    1159:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000001160 <__do_global_dtors_aux>:
    1160:	f3 0f 1e fa          	endbr64 
    1164:	80 3d a5 2e 00 00 00 	cmpb   $0x0,0x2ea5(%rip)        # 4010 <__TMC_END__>
    116b:	75 2b                	jne    1198 <__do_global_dtors_aux+0x38>
    116d:	55                   	push   %rbp
    116e:	48 83 3d 82 2e 00 00 	cmpq   $0x0,0x2e82(%rip)        # 3ff8 <__cxa_finalize@GLIBC_2.2.5>
    1175:	00 
    1176:	48 89 e5             	mov    %rsp,%rbp
    1179:	74 0c                	je     1187 <__do_global_dtors_aux+0x27>
    117b:	48 8b 3d 86 2e 00 00 	mov    0x2e86(%rip),%rdi        # 4008 <__dso_handle>
    1182:	e8 e9 fe ff ff       	call   1070 <__cxa_finalize@plt>
    1187:	e8 64 ff ff ff       	call   10f0 <deregister_tm_clones>
    118c:	c6 05 7d 2e 00 00 01 	movb   $0x1,0x2e7d(%rip)        # 4010 <__TMC_END__>
    1193:	5d                   	pop    %rbp
    1194:	c3                   	ret    
    1195:	0f 1f 00             	nopl   (%rax)
    1198:	c3                   	ret    
    1199:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

00000000000011a0 <frame_dummy>:
    11a0:	f3 0f 1e fa          	endbr64 
    11a4:	e9 77 ff ff ff       	jmp    1120 <register_tm_clones>

00000000000011a9 <print_time>:
    11a9:	f3 0f 1e fa          	endbr64 
    11ad:	55                   	push   %rbp
    11ae:	48 89 e5             	mov    %rsp,%rbp
    11b1:	48 83 ec 30          	sub    $0x30,%rsp
    11b5:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
    11bc:	00 00 
    11be:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    11c2:	31 c0                	xor    %eax,%eax
    11c4:	48 8d 45 e0          	lea    -0x20(%rbp),%rax
    11c8:	be 00 00 00 00       	mov    $0x0,%esi
    11cd:	48 89 c7             	mov    %rax,%rdi
    11d0:	e8 db fe ff ff       	call   10b0 <gettimeofday@plt>
    11d5:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    11d9:	48 69 d0 40 42 0f 00 	imul   $0xf4240,%rax,%rdx
    11e0:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    11e4:	48 01 d0             	add    %rdx,%rax
    11e7:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
    11eb:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    11ef:	48 89 c6             	mov    %rax,%rsi
    11f2:	48 8d 05 0b 0e 00 00 	lea    0xe0b(%rip),%rax        # 2004 <_IO_stdin_used+0x4>
    11f9:	48 89 c7             	mov    %rax,%rdi
    11fc:	b8 00 00 00 00       	mov    $0x0,%eax
    1201:	e8 9a fe ff ff       	call   10a0 <printf@plt>
    1206:	90                   	nop
    1207:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    120b:	64 48 2b 04 25 28 00 	sub    %fs:0x28,%rax
    1212:	00 00 
    1214:	74 05                	je     121b <print_time+0x72>
    1216:	e8 75 fe ff ff       	call   1090 <__stack_chk_fail@plt>
    121b:	c9                   	leave  
    121c:	c3                   	ret    

000000000000121d <trampoline>:
    121d:	f3 0f 1e fa          	endbr64 
    1221:	55                   	push   %rbp
    1222:	48 89 e5             	mov    %rsp,%rbp
    1225:	b8 00 00 00 00       	mov    $0x0,%eax
    122a:	e8 7a ff ff ff       	call   11a9 <print_time>
    122f:	5d                   	pop    %rbp
    1230:	c7 85 a0 63 ff ff 00 	movl   $0x0,-0x9c60(%rbp)
    1237:	00 00 00 
    123a:	90                   	nop
    123b:	90                   	nop
    123c:	90                   	nop
    123d:	90                   	nop
    123e:	90                   	nop
    123f:	c3                   	ret    

0000000000001240 <main>:
    1240:	f3 0f 1e fa          	endbr64 
    1244:	55                   	push   %rbp
    1245:	48 89 e5             	mov    %rsp,%rbp
    1248:	4c 8d 9c 24 00 70 ff 	lea    -0x9000(%rsp),%r11
    124f:	ff 
    1250:	48 81 ec 00 10 00 00 	sub    $0x1000,%rsp
    1257:	48 83 0c 24 00       	orq    $0x0,(%rsp)
    125c:	4c 39 dc             	cmp    %r11,%rsp
    125f:	75 ef                	jne    1250 <main+0x10>
    1261:	48 81 ec 60 0c 00 00 	sub    $0xc60,%rsp
    1268:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
    126f:	00 00 
    1271:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    1275:	31 c0                	xor    %eax,%eax
    1277:	e8 a1 ff ff ff       	call   121d <trampoline>
    127c:	90                   	nop
    127d:	90                   	nop
    127e:	90                   	nop
    127f:	90                   	nop
    1280:	90                   	nop
    1281:	eb 67                	jmp    12ea <main+0xaa>
    1283:	c7 85 a4 63 ff ff 00 	movl   $0x0,-0x9c5c(%rbp)
    128a:	00 00 00 
    128d:	eb 4b                	jmp    12da <main+0x9a>
    128f:	8b 85 a0 63 ff ff    	mov    -0x9c60(%rbp),%eax
    1295:	0f af 85 a4 63 ff ff 	imul   -0x9c5c(%rbp),%eax
    129c:	89 c2                	mov    %eax,%edx
    129e:	8b 85 a4 63 ff ff    	mov    -0x9c5c(%rbp),%eax
    12a4:	48 63 f0             	movslq %eax,%rsi
    12a7:	8b 85 a0 63 ff ff    	mov    -0x9c60(%rbp),%eax
    12ad:	48 63 c8             	movslq %eax,%rcx
    12b0:	48 89 c8             	mov    %rcx,%rax
    12b3:	48 c1 e0 02          	shl    $0x2,%rax
    12b7:	48 01 c8             	add    %rcx,%rax
    12ba:	48 8d 0c 85 00 00 00 	lea    0x0(,%rax,4),%rcx
    12c1:	00 
    12c2:	48 01 c8             	add    %rcx,%rax
    12c5:	48 c1 e0 02          	shl    $0x2,%rax
    12c9:	48 01 f0             	add    %rsi,%rax
    12cc:	89 94 85 b0 63 ff ff 	mov    %edx,-0x9c50(%rbp,%rax,4)
    12d3:	83 85 a4 63 ff ff 01 	addl   $0x1,-0x9c5c(%rbp)
    12da:	83 bd a4 63 ff ff 63 	cmpl   $0x63,-0x9c5c(%rbp)
    12e1:	7e ac                	jle    128f <main+0x4f>
    12e3:	83 85 a0 63 ff ff 01 	addl   $0x1,-0x9c60(%rbp)
    12ea:	83 bd a0 63 ff ff 63 	cmpl   $0x63,-0x9c60(%rbp)
    12f1:	7e 90                	jle    1283 <main+0x43>
    12f3:	c7 85 a8 63 ff ff 00 	movl   $0x0,-0x9c58(%rbp)
    12fa:	00 00 00 
    12fd:	eb 78                	jmp    1377 <main+0x137>
    12ff:	c7 85 ac 63 ff ff 00 	movl   $0x0,-0x9c54(%rbp)
    1306:	00 00 00 
    1309:	eb 52                	jmp    135d <main+0x11d>
    130b:	8b 85 ac 63 ff ff    	mov    -0x9c54(%rbp),%eax
    1311:	48 63 c8             	movslq %eax,%rcx
    1314:	8b 85 a8 63 ff ff    	mov    -0x9c58(%rbp),%eax
    131a:	48 63 d0             	movslq %eax,%rdx
    131d:	48 89 d0             	mov    %rdx,%rax
    1320:	48 c1 e0 02          	shl    $0x2,%rax
    1324:	48 01 d0             	add    %rdx,%rax
    1327:	48 8d 14 85 00 00 00 	lea    0x0(,%rax,4),%rdx
    132e:	00 
    132f:	48 01 d0             	add    %rdx,%rax
    1332:	48 c1 e0 02          	shl    $0x2,%rax
    1336:	48 01 c8             	add    %rcx,%rax
    1339:	8b 84 85 b0 63 ff ff 	mov    -0x9c50(%rbp,%rax,4),%eax
    1340:	89 c6                	mov    %eax,%esi
    1342:	48 8d 05 c9 0c 00 00 	lea    0xcc9(%rip),%rax        # 2012 <_IO_stdin_used+0x12>
    1349:	48 89 c7             	mov    %rax,%rdi
    134c:	b8 00 00 00 00       	mov    $0x0,%eax
    1351:	e8 4a fd ff ff       	call   10a0 <printf@plt>
    1356:	83 85 ac 63 ff ff 01 	addl   $0x1,-0x9c54(%rbp)
    135d:	83 bd ac 63 ff ff 63 	cmpl   $0x63,-0x9c54(%rbp)
    1364:	7e a5                	jle    130b <main+0xcb>
    1366:	bf 0a 00 00 00       	mov    $0xa,%edi
    136b:	e8 10 fd ff ff       	call   1080 <putchar@plt>
    1370:	83 85 a8 63 ff ff 01 	addl   $0x1,-0x9c58(%rbp)
    1377:	83 bd a8 63 ff ff 63 	cmpl   $0x63,-0x9c58(%rbp)
    137e:	0f 8e 7b ff ff ff    	jle    12ff <main+0xbf>
    1384:	b8 00 00 00 00       	mov    $0x0,%eax
    1389:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
    138d:	64 48 2b 14 25 28 00 	sub    %fs:0x28,%rdx
    1394:	00 00 
    1396:	74 05                	je     139d <main+0x15d>
    1398:	e8 f3 fc ff ff       	call   1090 <__stack_chk_fail@plt>
    139d:	c9                   	leave  
    139e:	c3                   	ret    

Disassembly of section .fini:

00000000000013a0 <_fini>:
    13a0:	f3 0f 1e fa          	endbr64 
    13a4:	48 83 ec 08          	sub    $0x8,%rsp
    13a8:	48 83 c4 08          	add    $0x8,%rsp
    13ac:	c3                   	ret    
