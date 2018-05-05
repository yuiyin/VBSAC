; ModuleID = './457_uninit_memory_access_5.c'
source_filename = "./457_uninit_memory_access_5.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [7 x i8] c"STRING\00", align 1

; Function Attrs: nounwind uwtable
define void @uninit_memory_access_006_func_001_bad(i8* %dst, i8* %src) #0 !dbg !10 {
entry:
  %dst.addr = alloca i8*, align 8
  %src.addr = alloca i8*, align 8
  store i8* %dst, i8** %dst.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %dst.addr, metadata !16, metadata !17), !dbg !18
  store i8* %src, i8** %src.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %src.addr, metadata !19, metadata !17), !dbg !20
  %0 = load i8*, i8** %src.addr, align 8, !dbg !21
  %cmp = icmp eq i8* %0, null, !dbg !23
  br i1 %cmp, label %if.then, label %if.else, !dbg !24

if.then:                                          ; preds = %entry
  br label %if.end, !dbg !25

if.else:                                          ; preds = %entry
  br label %while.cond, !dbg !27

while.cond:                                       ; preds = %while.body, %if.else
  %1 = load i8*, i8** %src.addr, align 8, !dbg !29
  %2 = load i8, i8* %1, align 1, !dbg !31
  %conv = sext i8 %2 to i32, !dbg !31
  %cmp1 = icmp ne i32 %conv, 0, !dbg !32
  br i1 %cmp1, label %while.body, label %while.end, !dbg !33

while.body:                                       ; preds = %while.cond
  %3 = load i8*, i8** %src.addr, align 8, !dbg !34
  %4 = load i8, i8* %3, align 1, !dbg !36
  %5 = load i8*, i8** %dst.addr, align 8, !dbg !37
  store i8 %4, i8* %5, align 1, !dbg !38
  %6 = load i8*, i8** %src.addr, align 8, !dbg !39
  %incdec.ptr = getelementptr inbounds i8, i8* %6, i32 1, !dbg !39
  store i8* %incdec.ptr, i8** %src.addr, align 8, !dbg !39
  %7 = load i8*, i8** %dst.addr, align 8, !dbg !40
  %incdec.ptr3 = getelementptr inbounds i8, i8* %7, i32 1, !dbg !40
  store i8* %incdec.ptr3, i8** %dst.addr, align 8, !dbg !40
  br label %while.cond, !dbg !41, !llvm.loop !43

while.end:                                        ; preds = %while.cond
  %8 = load i8*, i8** %dst.addr, align 8, !dbg !44
  store i8 0, i8* %8, align 1, !dbg !45
  br label %if.end

if.end:                                           ; preds = %if.then, %while.end
  ret void, !dbg !46
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind uwtable
define void @uninit_memory_access_006_bad() #0 !dbg !47 {
entry:
  %str1 = alloca i8*, align 8
  %str2 = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %str1, metadata !50, metadata !17), !dbg !51
  %call = call noalias i8* @calloc(i64 25, i64 1) #3, !dbg !52
  store i8* %call, i8** %str1, align 8, !dbg !51
  call void @llvm.dbg.declare(metadata i8** %str2, metadata !53, metadata !17), !dbg !54
  %0 = load i8*, i8** %str1, align 8, !dbg !55
  %1 = load i8*, i8** %str2, align 8, !dbg !56
  call void @uninit_memory_access_006_func_001_bad(i8* %0, i8* %1), !dbg !57
  ret void, !dbg !58
}

; Function Attrs: nounwind
declare noalias i8* @calloc(i64, i64) #2

; Function Attrs: nounwind uwtable
define void @uninit_memory_access_006_func_001_good(i8* %dst, i8* %src) #0 !dbg !59 {
entry:
  %dst.addr = alloca i8*, align 8
  %src.addr = alloca i8*, align 8
  store i8* %dst, i8** %dst.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %dst.addr, metadata !60, metadata !17), !dbg !61
  store i8* %src, i8** %src.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %src.addr, metadata !62, metadata !17), !dbg !63
  %0 = load i8*, i8** %src.addr, align 8, !dbg !64
  %cmp = icmp eq i8* %0, null, !dbg !66
  br i1 %cmp, label %if.then, label %if.else, !dbg !67

if.then:                                          ; preds = %entry
  br label %if.end, !dbg !68

if.else:                                          ; preds = %entry
  br label %while.cond, !dbg !70

while.cond:                                       ; preds = %while.body, %if.else
  %1 = load i8*, i8** %src.addr, align 8, !dbg !72
  %2 = load i8, i8* %1, align 1, !dbg !74
  %conv = sext i8 %2 to i32, !dbg !74
  %cmp1 = icmp ne i32 %conv, 0, !dbg !75
  br i1 %cmp1, label %while.body, label %while.end, !dbg !76

while.body:                                       ; preds = %while.cond
  %3 = load i8*, i8** %src.addr, align 8, !dbg !77
  %4 = load i8, i8* %3, align 1, !dbg !79
  %5 = load i8*, i8** %dst.addr, align 8, !dbg !80
  store i8 %4, i8* %5, align 1, !dbg !81
  %6 = load i8*, i8** %src.addr, align 8, !dbg !82
  %incdec.ptr = getelementptr inbounds i8, i8* %6, i32 1, !dbg !82
  store i8* %incdec.ptr, i8** %src.addr, align 8, !dbg !82
  %7 = load i8*, i8** %dst.addr, align 8, !dbg !83
  %incdec.ptr3 = getelementptr inbounds i8, i8* %7, i32 1, !dbg !83
  store i8* %incdec.ptr3, i8** %dst.addr, align 8, !dbg !83
  br label %while.cond, !dbg !84, !llvm.loop !86

while.end:                                        ; preds = %while.cond
  %8 = load i8*, i8** %dst.addr, align 8, !dbg !87
  store i8 0, i8* %8, align 1, !dbg !88
  br label %if.end

if.end:                                           ; preds = %if.then, %while.end
  ret void, !dbg !89
}

; Function Attrs: nounwind uwtable
define void @uninit_memory_access_006_good() #0 !dbg !90 {
entry:
  %str1 = alloca i8*, align 8
  %str2 = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %str1, metadata !91, metadata !17), !dbg !92
  %call = call noalias i8* @calloc(i64 25, i64 1) #3, !dbg !93
  store i8* %call, i8** %str1, align 8, !dbg !92
  call void @llvm.dbg.declare(metadata i8** %str2, metadata !94, metadata !17), !dbg !95
  store i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8** %str2, align 8, !dbg !95
  %0 = load i8*, i8** %str1, align 8, !dbg !96
  %1 = load i8*, i8** %str2, align 8, !dbg !97
  call void @uninit_memory_access_006_func_001_good(i8* %0, i8* %1), !dbg !98
  ret void, !dbg !99
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !100 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @uninit_memory_access_006_good(), !dbg !104
  call void @uninit_memory_access_006_bad(), !dbg !105
  ret i32 0, !dbg !106
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8}
!llvm.ident = !{!9}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (tags/RELEASE_390/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3)
!1 = !DIFile(filename: "457_uninit_memory_access_5.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/itc/457")
!2 = !{}
!3 = !{!4, !5}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64, align: 64)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64, align: 64)
!6 = !DIBasicType(name: "char", size: 8, align: 8, encoding: DW_ATE_signed_char)
!7 = !{i32 2, !"Dwarf Version", i32 4}
!8 = !{i32 2, !"Debug Info Version", i32 3}
!9 = !{!"clang version 3.9.0 (tags/RELEASE_390/final)"}
!10 = distinct !DISubprogram(name: "uninit_memory_access_006_func_001_bad", scope: !11, file: !11, line: 9, type: !12, isLocal: false, isDefinition: true, scopeLine: 10, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!11 = !DIFile(filename: "./457_uninit_memory_access_5.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/itc/457")
!12 = !DISubroutineType(types: !13)
!13 = !{null, !5, !14}
!14 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !15, size: 64, align: 64)
!15 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !6)
!16 = !DILocalVariable(name: "dst", arg: 1, scope: !10, file: !11, line: 9, type: !5)
!17 = !DIExpression()
!18 = !DILocation(line: 9, column: 50, scope: !10)
!19 = !DILocalVariable(name: "src", arg: 2, scope: !10, file: !11, line: 9, type: !14)
!20 = !DILocation(line: 9, column: 67, scope: !10)
!21 = !DILocation(line: 11, column: 9, scope: !22)
!22 = distinct !DILexicalBlock(scope: !10, file: !11, line: 11, column: 9)
!23 = !DILocation(line: 11, column: 13, scope: !22)
!24 = !DILocation(line: 11, column: 9, scope: !10)
!25 = !DILocation(line: 13, column: 10, scope: !26)
!26 = distinct !DILexicalBlock(scope: !22, file: !11, line: 12, column: 6)
!27 = !DILocation(line: 17, column: 7, scope: !28)
!28 = distinct !DILexicalBlock(scope: !22, file: !11, line: 16, column: 6)
!29 = !DILocation(line: 17, column: 14, scope: !30)
!30 = !DILexicalBlockFile(scope: !28, file: !11, discriminator: 1)
!31 = !DILocation(line: 17, column: 13, scope: !30)
!32 = !DILocation(line: 17, column: 18, scope: !30)
!33 = !DILocation(line: 17, column: 7, scope: !30)
!34 = !DILocation(line: 19, column: 16, scope: !35)
!35 = distinct !DILexicalBlock(scope: !28, file: !11, line: 18, column: 9)
!36 = !DILocation(line: 19, column: 15, scope: !35)
!37 = !DILocation(line: 19, column: 9, scope: !35)
!38 = !DILocation(line: 19, column: 13, scope: !35)
!39 = !DILocation(line: 20, column: 17, scope: !35)
!40 = !DILocation(line: 21, column: 17, scope: !35)
!41 = !DILocation(line: 17, column: 7, scope: !42)
!42 = !DILexicalBlockFile(scope: !28, file: !11, discriminator: 2)
!43 = distinct !{!43, !27}
!44 = !DILocation(line: 23, column: 10, scope: !28)
!45 = !DILocation(line: 23, column: 14, scope: !28)
!46 = !DILocation(line: 25, column: 2, scope: !10)
!47 = distinct !DISubprogram(name: "uninit_memory_access_006_bad", scope: !11, file: !11, line: 26, type: !48, isLocal: false, isDefinition: true, scopeLine: 27, isOptimized: false, unit: !0, variables: !2)
!48 = !DISubroutineType(types: !49)
!49 = !{null}
!50 = !DILocalVariable(name: "str1", scope: !47, file: !11, line: 28, type: !5)
!51 = !DILocation(line: 28, column: 11, scope: !47)
!52 = !DILocation(line: 28, column: 27, scope: !47)
!53 = !DILocalVariable(name: "str2", scope: !47, file: !11, line: 29, type: !5)
!54 = !DILocation(line: 29, column: 11, scope: !47)
!55 = !DILocation(line: 30, column: 43, scope: !47)
!56 = !DILocation(line: 30, column: 49, scope: !47)
!57 = !DILocation(line: 30, column: 5, scope: !47)
!58 = !DILocation(line: 31, column: 1, scope: !47)
!59 = distinct !DISubprogram(name: "uninit_memory_access_006_func_001_good", scope: !11, file: !11, line: 37, type: !12, isLocal: false, isDefinition: true, scopeLine: 38, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!60 = !DILocalVariable(name: "dst", arg: 1, scope: !59, file: !11, line: 37, type: !5)
!61 = !DILocation(line: 37, column: 51, scope: !59)
!62 = !DILocalVariable(name: "src", arg: 2, scope: !59, file: !11, line: 37, type: !14)
!63 = !DILocation(line: 37, column: 68, scope: !59)
!64 = !DILocation(line: 39, column: 9, scope: !65)
!65 = distinct !DILexicalBlock(scope: !59, file: !11, line: 39, column: 9)
!66 = !DILocation(line: 39, column: 13, scope: !65)
!67 = !DILocation(line: 39, column: 9, scope: !59)
!68 = !DILocation(line: 41, column: 10, scope: !69)
!69 = distinct !DILexicalBlock(scope: !65, file: !11, line: 40, column: 6)
!70 = !DILocation(line: 45, column: 7, scope: !71)
!71 = distinct !DILexicalBlock(scope: !65, file: !11, line: 44, column: 6)
!72 = !DILocation(line: 45, column: 14, scope: !73)
!73 = !DILexicalBlockFile(scope: !71, file: !11, discriminator: 1)
!74 = !DILocation(line: 45, column: 13, scope: !73)
!75 = !DILocation(line: 45, column: 18, scope: !73)
!76 = !DILocation(line: 45, column: 7, scope: !73)
!77 = !DILocation(line: 47, column: 16, scope: !78)
!78 = distinct !DILexicalBlock(scope: !71, file: !11, line: 46, column: 9)
!79 = !DILocation(line: 47, column: 15, scope: !78)
!80 = !DILocation(line: 47, column: 9, scope: !78)
!81 = !DILocation(line: 47, column: 13, scope: !78)
!82 = !DILocation(line: 48, column: 17, scope: !78)
!83 = !DILocation(line: 49, column: 17, scope: !78)
!84 = !DILocation(line: 45, column: 7, scope: !85)
!85 = !DILexicalBlockFile(scope: !71, file: !11, discriminator: 2)
!86 = distinct !{!86, !70}
!87 = !DILocation(line: 51, column: 10, scope: !71)
!88 = !DILocation(line: 51, column: 14, scope: !71)
!89 = !DILocation(line: 53, column: 2, scope: !59)
!90 = distinct !DISubprogram(name: "uninit_memory_access_006_good", scope: !11, file: !11, line: 54, type: !48, isLocal: false, isDefinition: true, scopeLine: 55, isOptimized: false, unit: !0, variables: !2)
!91 = !DILocalVariable(name: "str1", scope: !90, file: !11, line: 56, type: !5)
!92 = !DILocation(line: 56, column: 11, scope: !90)
!93 = !DILocation(line: 56, column: 27, scope: !90)
!94 = !DILocalVariable(name: "str2", scope: !90, file: !11, line: 57, type: !5)
!95 = !DILocation(line: 57, column: 11, scope: !90)
!96 = !DILocation(line: 58, column: 44, scope: !90)
!97 = !DILocation(line: 58, column: 50, scope: !90)
!98 = !DILocation(line: 58, column: 5, scope: !90)
!99 = !DILocation(line: 59, column: 1, scope: !90)
!100 = distinct !DISubprogram(name: "main", scope: !11, file: !11, line: 61, type: !101, isLocal: false, isDefinition: true, scopeLine: 61, isOptimized: false, unit: !0, variables: !2)
!101 = !DISubroutineType(types: !102)
!102 = !{!103}
!103 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!104 = !DILocation(line: 62, column: 3, scope: !100)
!105 = !DILocation(line: 63, column: 2, scope: !100)
!106 = !DILocation(line: 64, column: 2, scope: !100)
