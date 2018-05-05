; ModuleID = 'example.c'
source_filename = "example.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: nounwind uwtable
define void @callFree(i32* %p) #0 !dbg !6 {
entry:
  %p.addr = alloca i32*, align 8
  store i32* %p, i32** %p.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %p.addr, metadata !11, metadata !12), !dbg !13
  %0 = load i32*, i32** %p.addr, align 8, !dbg !14
  %1 = bitcast i32* %0 to i8*, !dbg !14
  call void @free(i8* %1) #4, !dbg !15
  ret void, !dbg !16
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare void @free(i8*) #2

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) #0 !dbg !17 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %x = alloca i32, align 4
  %y = alloca i32, align 4
  %index = alloca i32, align 4
  %p = alloca i32*, align 8
  %q = alloca i32*, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !24, metadata !12), !dbg !25
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !26, metadata !12), !dbg !27
  call void @llvm.dbg.declare(metadata i32* %x, metadata !28, metadata !12), !dbg !29
  store i32 0, i32* %x, align 4, !dbg !29
  call void @llvm.dbg.declare(metadata i32* %y, metadata !30, metadata !12), !dbg !31
  store i32 2048, i32* %y, align 4, !dbg !31
  call void @llvm.dbg.declare(metadata i32* %index, metadata !32, metadata !12), !dbg !33
  store i32 0, i32* %index, align 4, !dbg !33
  call void @llvm.dbg.declare(metadata i32** %p, metadata !34, metadata !12), !dbg !35
  call void @llvm.dbg.declare(metadata i32** %q, metadata !36, metadata !12), !dbg !37
  %call = call i32 (...) @inputInt(), !dbg !38
  store i32 %call, i32* %x, align 4, !dbg !39
  %call1 = call noalias i8* @malloc(i64 20) #4, !dbg !40
  %0 = bitcast i8* %call1 to i32*, !dbg !40
  store i32* %0, i32** %p, align 8, !dbg !41
  %1 = load i32, i32* %y, align 4, !dbg !42
  %2 = load i32, i32* %x, align 4, !dbg !44
  %rem = srem i32 %1, %2, !dbg !45
  %cmp = icmp eq i32 %rem, 0, !dbg !46
  br i1 %cmp, label %if.then, label %if.else, !dbg !47

if.then:                                          ; preds = %entry
  br label %if.end5, !dbg !48

if.else:                                          ; preds = %entry
  %3 = load i32*, i32** %p, align 8, !dbg !50
  store i32* %3, i32** %q, align 8, !dbg !52
  store i32 0, i32* %index, align 4, !dbg !53
  br label %for.cond, !dbg !55

for.cond:                                         ; preds = %for.inc, %if.else
  %4 = load i32, i32* %index, align 4, !dbg !56
  %cmp2 = icmp slt i32 %4, 5, !dbg !59
  br i1 %cmp2, label %for.body, label %for.end, !dbg !60

for.body:                                         ; preds = %for.cond
  %5 = load i32, i32* %index, align 4, !dbg !61
  %add = add nsw i32 %5, 1, !dbg !63
  %6 = load i32*, i32** %q, align 8, !dbg !64
  %7 = load i32, i32* %index, align 4, !dbg !65
  %idx.ext = sext i32 %7 to i64, !dbg !66
  %add.ptr = getelementptr inbounds i32, i32* %6, i64 %idx.ext, !dbg !66
  store i32 %add, i32* %add.ptr, align 4, !dbg !67
  br label %for.inc, !dbg !68

for.inc:                                          ; preds = %for.body
  %8 = load i32, i32* %index, align 4, !dbg !69
  %inc = add nsw i32 %8, 1, !dbg !69
  store i32 %inc, i32* %index, align 4, !dbg !69
  br label %for.cond, !dbg !71, !llvm.loop !72

for.end:                                          ; preds = %for.cond
  %9 = load i32*, i32** %p, align 8, !dbg !74
  %10 = load i32, i32* %9, align 4, !dbg !76
  %cmp3 = icmp slt i32 %10, 10, !dbg !77
  br i1 %cmp3, label %if.then4, label %if.end, !dbg !78

if.then4:                                         ; preds = %for.end
  %11 = load i32*, i32** %q, align 8, !dbg !79
  call void @callFree(i32* %11), !dbg !80
  br label %if.end, !dbg !80

if.end:                                           ; preds = %if.then4, %for.end
  %12 = load i32*, i32** %p, align 8, !dbg !81
  %13 = bitcast i32* %12 to i8*, !dbg !81
  call void @free(i8* %13) #4, !dbg !82
  br label %if.end5

if.end5:                                          ; preds = %if.end, %if.then
  ret i32 1, !dbg !83
}

declare i32 @inputInt(...) #3

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #2

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4}
!llvm.ident = !{!5}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (tags/RELEASE_390/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2)
!1 = !DIFile(filename: "example.c", directory: "/home/guzuxing/Documents/VBSAC/VBSAC_tool/example")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{!"clang version 3.9.0 (tags/RELEASE_390/final)"}
!6 = distinct !DISubprogram(name: "callFree", scope: !1, file: !1, line: 6, type: !7, isLocal: false, isDefinition: true, scopeLine: 6, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!7 = !DISubroutineType(types: !8)
!8 = !{null, !9}
!9 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !10, size: 64, align: 64)
!10 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!11 = !DILocalVariable(name: "p", arg: 1, scope: !6, file: !1, line: 6, type: !9)
!12 = !DIExpression()
!13 = !DILocation(line: 6, column: 20, scope: !6)
!14 = !DILocation(line: 7, column: 7, scope: !6)
!15 = !DILocation(line: 7, column: 2, scope: !6)
!16 = !DILocation(line: 8, column: 1, scope: !6)
!17 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 10, type: !18, isLocal: false, isDefinition: true, scopeLine: 11, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!18 = !DISubroutineType(types: !19)
!19 = !{!10, !10, !20}
!20 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !21, size: 64, align: 64)
!21 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !22, size: 64, align: 64)
!22 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !23)
!23 = !DIBasicType(name: "char", size: 8, align: 8, encoding: DW_ATE_signed_char)
!24 = !DILocalVariable(name: "argc", arg: 1, scope: !17, file: !1, line: 10, type: !10)
!25 = !DILocation(line: 10, column: 14, scope: !17)
!26 = !DILocalVariable(name: "argv", arg: 2, scope: !17, file: !1, line: 10, type: !20)
!27 = !DILocation(line: 10, column: 32, scope: !17)
!28 = !DILocalVariable(name: "x", scope: !17, file: !1, line: 12, type: !10)
!29 = !DILocation(line: 12, column: 6, scope: !17)
!30 = !DILocalVariable(name: "y", scope: !17, file: !1, line: 12, type: !10)
!31 = !DILocation(line: 12, column: 13, scope: !17)
!32 = !DILocalVariable(name: "index", scope: !17, file: !1, line: 12, type: !10)
!33 = !DILocation(line: 12, column: 23, scope: !17)
!34 = !DILocalVariable(name: "p", scope: !17, file: !1, line: 13, type: !9)
!35 = !DILocation(line: 13, column: 7, scope: !17)
!36 = !DILocalVariable(name: "q", scope: !17, file: !1, line: 13, type: !9)
!37 = !DILocation(line: 13, column: 11, scope: !17)
!38 = !DILocation(line: 15, column: 6, scope: !17)
!39 = !DILocation(line: 15, column: 4, scope: !17)
!40 = !DILocation(line: 16, column: 6, scope: !17)
!41 = !DILocation(line: 16, column: 4, scope: !17)
!42 = !DILocation(line: 17, column: 6, scope: !43)
!43 = distinct !DILexicalBlock(scope: !17, file: !1, line: 17, column: 6)
!44 = !DILocation(line: 17, column: 8, scope: !43)
!45 = !DILocation(line: 17, column: 7, scope: !43)
!46 = !DILocation(line: 17, column: 10, scope: !43)
!47 = !DILocation(line: 17, column: 6, scope: !17)
!48 = !DILocation(line: 19, column: 2, scope: !49)
!49 = distinct !DILexicalBlock(scope: !43, file: !1, line: 17, column: 16)
!50 = !DILocation(line: 20, column: 8, scope: !51)
!51 = distinct !DILexicalBlock(scope: !43, file: !1, line: 19, column: 8)
!52 = !DILocation(line: 20, column: 6, scope: !51)
!53 = !DILocation(line: 21, column: 14, scope: !54)
!54 = distinct !DILexicalBlock(scope: !51, file: !1, line: 21, column: 4)
!55 = !DILocation(line: 21, column: 8, scope: !54)
!56 = !DILocation(line: 21, column: 19, scope: !57)
!57 = !DILexicalBlockFile(scope: !58, file: !1, discriminator: 1)
!58 = distinct !DILexicalBlock(scope: !54, file: !1, line: 21, column: 4)
!59 = !DILocation(line: 21, column: 25, scope: !57)
!60 = !DILocation(line: 21, column: 4, scope: !57)
!61 = !DILocation(line: 22, column: 22, scope: !62)
!62 = distinct !DILexicalBlock(scope: !58, file: !1, line: 21, column: 39)
!63 = !DILocation(line: 22, column: 27, scope: !62)
!64 = !DILocation(line: 22, column: 11, scope: !62)
!65 = !DILocation(line: 22, column: 13, scope: !62)
!66 = !DILocation(line: 22, column: 12, scope: !62)
!67 = !DILocation(line: 22, column: 20, scope: !62)
!68 = !DILocation(line: 23, column: 5, scope: !62)
!69 = !DILocation(line: 21, column: 35, scope: !70)
!70 = !DILexicalBlockFile(scope: !58, file: !1, discriminator: 2)
!71 = !DILocation(line: 21, column: 4, scope: !70)
!72 = distinct !{!72, !73}
!73 = !DILocation(line: 21, column: 4, scope: !51)
!74 = !DILocation(line: 24, column: 9, scope: !75)
!75 = distinct !DILexicalBlock(scope: !51, file: !1, line: 24, column: 8)
!76 = !DILocation(line: 24, column: 8, scope: !75)
!77 = !DILocation(line: 24, column: 11, scope: !75)
!78 = !DILocation(line: 24, column: 8, scope: !51)
!79 = !DILocation(line: 25, column: 15, scope: !75)
!80 = !DILocation(line: 25, column: 6, scope: !75)
!81 = !DILocation(line: 26, column: 11, scope: !51)
!82 = !DILocation(line: 26, column: 6, scope: !51)
!83 = !DILocation(line: 28, column: 2, scope: !17)
