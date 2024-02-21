
./bin/demo:     file format elf64-x86-64


Disassembly of section .text:

00000000000010a0 <_start>:
    10a0:	f3 0f 1e fa          	endbr64 
    10a4:	31 ed                	xor    %ebp,%ebp
    10a6:	49 89 d1             	mov    %rdx,%r9
    10a9:	5e                   	pop    %rsi
    10aa:	48 89 e2             	mov    %rsp,%rdx
    10ad:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
    10b1:	50                   	push   %rax
    10b2:	54                   	push   %rsp
    10b3:	45 31 c0             	xor    %r8d,%r8d
    10b6:	31 c9                	xor    %ecx,%ecx
    10b8:	48 8d 3d ca 00 00 00 	lea    0xca(%rip),%rdi        # 1189 <main>
    10bf:	ff 15 13 2f 00 00    	call   *0x2f13(%rip)        # 3fd8 <__libc_start_main@GLIBC_2.34>
    10c5:	f4                   	hlt    
    10c6:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
    10cd:	00 00 00 

00000000000010d0 <deregister_tm_clones>:
    10d0:	48 8d 3d 39 2f 00 00 	lea    0x2f39(%rip),%rdi        # 4010 <__TMC_END__>
    10d7:	48 8d 05 32 2f 00 00 	lea    0x2f32(%rip),%rax        # 4010 <__TMC_END__>
    10de:	48 39 f8             	cmp    %rdi,%rax
    10e1:	74 15                	je     10f8 <deregister_tm_clones+0x28>
    10e3:	48 8b 05 f6 2e 00 00 	mov    0x2ef6(%rip),%rax        # 3fe0 <_ITM_deregisterTMCloneTable@Base>
    10ea:	48 85 c0             	test   %rax,%rax
    10ed:	74 09                	je     10f8 <deregister_tm_clones+0x28>
    10ef:	ff e0                	jmp    *%rax
    10f1:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    10f8:	c3                   	ret    
    10f9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000001100 <register_tm_clones>:
    1100:	48 8d 3d 09 2f 00 00 	lea    0x2f09(%rip),%rdi        # 4010 <__TMC_END__>
    1107:	48 8d 35 02 2f 00 00 	lea    0x2f02(%rip),%rsi        # 4010 <__TMC_END__>
    110e:	48 29 fe             	sub    %rdi,%rsi
    1111:	48 89 f0             	mov    %rsi,%rax
    1114:	48 c1 ee 3f          	shr    $0x3f,%rsi
    1118:	48 c1 f8 03          	sar    $0x3,%rax
    111c:	48 01 c6             	add    %rax,%rsi
    111f:	48 d1 fe             	sar    %rsi
    1122:	74 14                	je     1138 <register_tm_clones+0x38>
    1124:	48 8b 05 c5 2e 00 00 	mov    0x2ec5(%rip),%rax        # 3ff0 <_ITM_registerTMCloneTable@Base>
    112b:	48 85 c0             	test   %rax,%rax
    112e:	74 08                	je     1138 <register_tm_clones+0x38>
    1130:	ff e0                	jmp    *%rax
    1132:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    1138:	c3                   	ret    
    1139:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000001140 <__do_global_dtors_aux>:
    1140:	f3 0f 1e fa          	endbr64 
    1144:	80 3d c5 2e 00 00 00 	cmpb   $0x0,0x2ec5(%rip)        # 4010 <__TMC_END__>
    114b:	75 2b                	jne    1178 <__do_global_dtors_aux+0x38>
    114d:	55                   	push   %rbp
    114e:	48 83 3d a2 2e 00 00 	cmpq   $0x0,0x2ea2(%rip)        # 3ff8 <__cxa_finalize@GLIBC_2.2.5>
    1155:	00 
    1156:	48 89 e5             	mov    %rsp,%rbp
    1159:	74 0c                	je     1167 <__do_global_dtors_aux+0x27>
    115b:	48 8b 3d a6 2e 00 00 	mov    0x2ea6(%rip),%rdi        # 4008 <__dso_handle>
    1162:	e8 f9 fe ff ff       	call   1060 <__cxa_finalize@plt>
    1167:	e8 64 ff ff ff       	call   10d0 <deregister_tm_clones>
    116c:	c6 05 9d 2e 00 00 01 	movb   $0x1,0x2e9d(%rip)        # 4010 <__TMC_END__>
    1173:	5d                   	pop    %rbp
    1174:	c3                   	ret    
    1175:	0f 1f 00             	nopl   (%rax)
    1178:	c3                   	ret    
    1179:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000001180 <frame_dummy>:
    1180:	f3 0f 1e fa          	endbr64 
    1184:	e9 77 ff ff ff       	jmp    1100 <register_tm_clones>

0000000000001189 <main>:
    1189:	f3 0f 1e fa          	endbr64 
    118d:	55                   	push   %rbp
    118e:	48 89 e5             	mov    %rsp,%rbp
    1191:	4c 8d 9c 24 00 00 c3 	lea    -0x3d0000(%rsp),%r11
    1198:	ff 
    1199:	48 81 ec 00 10 00 00 	sub    $0x1000,%rsp
    11a0:	48 83 0c 24 00       	orq    $0x0,(%rsp)
    11a5:	4c 39 dc             	cmp    %r11,%rsp
    11a8:	75 ef                	jne    1199 <main+0x10>
    11aa:	48 81 ec 20 09 00 00 	sub    $0x920,%rsp
    11b1:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
    11b8:	00 00 
    11ba:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    11be:	31 c0                	xor    %eax,%eax
    11c0:	c7 85 e0 f6 c2 ff 00 	movl   $0x0,-0x3d0920(%rbp)
    11c7:	00 00 00 
    11ca:	eb 56                	jmp    1222 <main+0x99>
    11cc:	c7 85 e4 f6 c2 ff 00 	movl   $0x0,-0x3d091c(%rbp)
    11d3:	00 00 00 
    11d6:	eb 37                	jmp    120f <main+0x86>
    11d8:	8b 85 e0 f6 c2 ff    	mov    -0x3d0920(%rbp),%eax
    11de:	0f af 85 e4 f6 c2 ff 	imul   -0x3d091c(%rbp),%eax
    11e5:	8b 95 e4 f6 c2 ff    	mov    -0x3d091c(%rbp),%edx
    11eb:	48 63 ca             	movslq %edx,%rcx
    11ee:	8b 95 e0 f6 c2 ff    	mov    -0x3d0920(%rbp),%edx
    11f4:	48 63 d2             	movslq %edx,%rdx
    11f7:	48 69 d2 e8 03 00 00 	imul   $0x3e8,%rdx,%rdx
    11fe:	48 01 ca             	add    %rcx,%rdx
    1201:	89 84 95 f0 f6 c2 ff 	mov    %eax,-0x3d0910(%rbp,%rdx,4)
    1208:	83 85 e4 f6 c2 ff 01 	addl   $0x1,-0x3d091c(%rbp)
    120f:	81 bd e4 f6 c2 ff e7 	cmpl   $0x3e7,-0x3d091c(%rbp)
    1216:	03 00 00 
    1219:	7e bd                	jle    11d8 <main+0x4f>
    121b:	83 85 e0 f6 c2 ff 01 	addl   $0x1,-0x3d0920(%rbp)
    1222:	81 bd e0 f6 c2 ff e7 	cmpl   $0x3e7,-0x3d0920(%rbp)       # 0x3e7 = 999
    1229:	03 00 00 
    122c:	7e 9e                	jle    11cc <main+0x43>
    122e:	c7 85 e8 f6 c2 ff 00 	movl   $0x0,-0x3d0918(%rbp)
    1235:	00 00 00 
    1238:	eb 68                	jmp    12a2 <main+0x119>
    123a:	c7 85 ec f6 c2 ff 00 	movl   $0x0,-0x3d0914(%rbp)
    1241:	00 00 00 
    1244:	eb 3f                	jmp    1285 <main+0xfc>
    1246:	8b 85 ec f6 c2 ff    	mov    -0x3d0914(%rbp),%eax
    124c:	48 63 d0             	movslq %eax,%rdx
    124f:	8b 85 e8 f6 c2 ff    	mov    -0x3d0918(%rbp),%eax
    1255:	48 98                	cltq   
    1257:	48 69 c0 e8 03 00 00 	imul   $0x3e8,%rax,%rax
    125e:	48 01 d0             	add    %rdx,%rax
    1261:	8b 84 85 f0 f6 c2 ff 	mov    -0x3d0910(%rbp,%rax,4),%eax
    1268:	89 c6                	mov    %eax,%esi
    126a:	48 8d 05 93 0d 00 00 	lea    0xd93(%rip),%rax        # 2004 <_IO_stdin_used+0x4>
    1271:	48 89 c7             	mov    %rax,%rdi
    1274:	b8 00 00 00 00       	mov    $0x0,%eax
    1279:	e8 12 fe ff ff       	call   1090 <printf@plt>
    127e:	83 85 ec f6 c2 ff 01 	addl   $0x1,-0x3d0914(%rbp)
    1285:	81 bd ec f6 c2 ff e7 	cmpl   $0x3e7,-0x3d0914(%rbp)
    128c:	03 00 00 
    128f:	7e b5                	jle    1246 <main+0xbd>
    1291:	bf 0a 00 00 00       	mov    $0xa,%edi
    1296:	e8 d5 fd ff ff       	call   1070 <putchar@plt>
    129b:	83 85 e8 f6 c2 ff 01 	addl   $0x1,-0x3d0918(%rbp)
    12a2:	81 bd e8 f6 c2 ff e7 	cmpl   $0x3e7,-0x3d0918(%rbp)
    12a9:	03 00 00 
    12ac:	7e 8c                	jle    123a <main+0xb1>
    12ae:	b8 00 00 00 00       	mov    $0x0,%eax
    12b3:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
    12b7:	64 48 2b 14 25 28 00 	sub    %fs:0x28,%rdx
    12be:	00 00 
    12c0:	74 05                	je     12c7 <main+0x13e>
    12c2:	e8 b9 fd ff ff       	call   1080 <__stack_chk_fail@plt>
    12c7:	c9                   	leave  
    12c8:	c3                   	ret    
