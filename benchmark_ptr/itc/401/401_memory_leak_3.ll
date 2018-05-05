; ModuleID = './401_memory_leak_3.c'
source_filename = "./401_memory_leak_3.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [17 x i8] c"This is a string\00", align 1

; Function Attrs: nounwind uwtable
define void @memory_leak_003_func_001_bad(i32 %len, i8** %stringPtr) #0 !dbg !8 {
entry:
  %len.addr = alloca i32, align 4
  %stringPtr.addr = alloca i8**, align 8
  %p = alloca i8*, align 8
  store i32 %len, i32* %len.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %len.addr, metadata !16, metadata !17), !dbg !18
  store i8** %stringPtr, i8*** %stringPtr.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %stringPtr.addr, metadata !19, metadata !17), !dbg !20
  call void @llvm.dbg.declare(metadata i8** %p, metadata !21, metadata !17), !dbg !22
  %0 = load i32, i32* %len.addr, align 4, !dbg !23
  %add = add nsw i32 %0, 1, !dbg !24
  %conv = sext i32 %add to i64, !dbg !25
  %mul = mul i64 1, %conv, !dbg !26
  %call = call noalias i8* @malloc(i64 %mul) #4, !dbg !27
  store i8* %call, i8** %p, align 8, !dbg !22
  %1 = load i8*, i8** %p, align 8, !dbg !28
  %cmp = icmp eq i8* %1, null, !dbg !30
  br i1 %cmp, label %if.then, label %if.end, !dbg !31

if.then:                                          ; preds = %entry
  br label %return, !dbg !32

if.end:                                           ; preds = %entry
  %2 = load i8*, i8** %p, align 8, !dbg !34
  %3 = load i8**, i8*** %stringPtr.addr, align 8, !dbg !35
  store i8* %2, i8** %3, align 8, !dbg !36
  br label %return, !dbg !37

return:                                           ; preds = %if.end, %if.then
  ret void, !dbg !38
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #2

; Function Attrs: nounwind uwtable
define void @memory_leak_003_bad() #0 !dbg !40 {
entry:
  %str = alloca i8*, align 8
  %str1 = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %str, metadata !43, metadata !17), !dbg !44
  store i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str, i32 0, i32 0), i8** %str, align 8, !dbg !44
  call void @llvm.dbg.declare(metadata i8** %str1, metadata !45, metadata !17), !dbg !46
  %0 = load i8*, i8** %str, align 8, !dbg !47
  %call = call i64 @strlen(i8* %0) #5, !dbg !48
  %conv = trunc i64 %call to i32, !dbg !48
  call void @memory_leak_003_func_001_bad(i32 %conv, i8** %str1), !dbg !49
  %1 = load i8*, i8** %str1, align 8, !dbg !51
  %2 = load i8*, i8** %str, align 8, !dbg !52
  %call1 = call i8* @strcpy(i8* %1, i8* %2) #4, !dbg !53
  ret void, !dbg !54
}

; Function Attrs: nounwind readonly
declare i64 @strlen(i8*) #3

; Function Attrs: nounwind
declare i8* @strcpy(i8*, i8*) #2

; Function Attrs: nounwind uwtable
define void @memory_leak_003_func_001_good(i32 %len, i8** %stringPtr) #0 !dbg !55 {
entry:
  %len.addr = alloca i32, align 4
  %stringPtr.addr = alloca i8**, align 8
  %p = alloca i8*, align 8
  store i32 %len, i32* %len.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %len.addr, metadata !56, metadata !17), !dbg !57
  store i8** %stringPtr, i8*** %stringPtr.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %stringPtr.addr, metadata !58, metadata !17), !dbg !59
  call void @llvm.dbg.declare(metadata i8** %p, metadata !60, metadata !17), !dbg !61
  %0 = load i32, i32* %len.addr, align 4, !dbg !62
  %add = add nsw i32 %0, 1, !dbg !63
  %conv = sext i32 %add to i64, !dbg !64
  %mul = mul i64 1, %conv, !dbg !65
  %call = call noalias i8* @malloc(i64 %mul) #4, !dbg !66
  store i8* %call, i8** %p, align 8, !dbg !61
  %1 = load i8*, i8** %p, align 8, !dbg !67
  %cmp = icmp eq i8* %1, null, !dbg !69
  br i1 %cmp, label %if.then, label %if.end, !dbg !70

if.then:                                          ; preds = %entry
  br label %return, !dbg !71

if.end:                                           ; preds = %entry
  %2 = load i8*, i8** %p, align 8, !dbg !73
  %3 = load i8**, i8*** %stringPtr.addr, align 8, !dbg !74
  store i8* %2, i8** %3, align 8, !dbg !75
  br label %return, !dbg !76

return:                                           ; preds = %if.end, %if.then
  ret void, !dbg !77
}

; Function Attrs: nounwind uwtable
define void @memory_leak_003_good() #0 !dbg !79 {
entry:
  %str = alloca i8*, align 8
  %str1 = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %str, metadata !80, metadata !17), !dbg !81
  store i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str, i32 0, i32 0), i8** %str, align 8, !dbg !81
  call void @llvm.dbg.declare(metadata i8** %str1, metadata !82, metadata !17), !dbg !83
  %0 = load i8*, i8** %str, align 8, !dbg !84
  %call = call i64 @strlen(i8* %0) #5, !dbg !85
  %conv = trunc i64 %call to i32, !dbg !85
  call void @memory_leak_003_func_001_good(i32 %conv, i8** %str1), !dbg !86
  %1 = load i8*, i8** %str1, align 8, !dbg !88
  %2 = load i8*, i8** %str, align 8, !dbg !89
  %call1 = call i8* @strcpy(i8* %1, i8* %2) #4, !dbg !90
  %3 = load i8*, i8** %str1, align 8, !dbg !91
  call void @free(i8* %3) #4, !dbg !92
  ret void, !dbg !93
}

; Function Attrs: nounwind
declare void @free(i8*) #2

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !94 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @memory_leak_003_good(), !dbg !97
  call void @memory_leak_003_bad(), !dbg !98
  ret i32 0, !dbg !99
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readonly "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { nounwind readonly }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6}
!llvm.ident = !{!7}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (tags/RELEASE_390/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3)
!1 = !DIFile(filename: "401_memory_leak_3.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/itc/401")
!2 = !{}
!3 = !{!4}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64, align: 64)
!5 = !{i32 2, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{!"clang version 3.9.0 (tags/RELEASE_390/final)"}
!8 = distinct !DISubprogram(name: "memory_leak_003_func_001_bad", scope: !9, file: !9, line: 18, type: !10, isLocal: false, isDefinition: true, scopeLine: 19, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!9 = !DIFile(filename: "./401_memory_leak_3.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/itc/401")
!10 = !DISubroutineType(types: !11)
!11 = !{null, !12, !13}
!12 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!13 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 64, align: 64)
!14 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !15, size: 64, align: 64)
!15 = !DIBasicType(name: "char", size: 8, align: 8, encoding: DW_ATE_signed_char)
!16 = !DILocalVariable(name: "len", arg: 1, scope: !8, file: !9, line: 18, type: !12)
!17 = !DIExpression()
!18 = !DILocation(line: 18, column: 39, scope: !8)
!19 = !DILocalVariable(name: "stringPtr", arg: 2, scope: !8, file: !9, line: 18, type: !13)
!20 = !DILocation(line: 18, column: 50, scope: !8)
!21 = !DILocalVariable(name: "p", scope: !8, file: !9, line: 20, type: !14)
!22 = !DILocation(line: 20, column: 9, scope: !8)
!23 = !DILocation(line: 20, column: 36, scope: !8)
!24 = !DILocation(line: 20, column: 39, scope: !8)
!25 = !DILocation(line: 20, column: 35, scope: !8)
!26 = !DILocation(line: 20, column: 33, scope: !8)
!27 = !DILocation(line: 20, column: 13, scope: !8)
!28 = !DILocation(line: 21, column: 6, scope: !29)
!29 = distinct !DILexicalBlock(scope: !8, file: !9, line: 21, column: 6)
!30 = !DILocation(line: 21, column: 8, scope: !29)
!31 = !DILocation(line: 21, column: 6, scope: !8)
!32 = !DILocation(line: 23, column: 3, scope: !33)
!33 = distinct !DILexicalBlock(scope: !29, file: !9, line: 22, column: 2)
!34 = !DILocation(line: 25, column: 15, scope: !8)
!35 = !DILocation(line: 25, column: 3, scope: !8)
!36 = !DILocation(line: 25, column: 13, scope: !8)
!37 = !DILocation(line: 26, column: 1, scope: !8)
!38 = !DILocation(line: 26, column: 1, scope: !39)
!39 = !DILexicalBlockFile(scope: !8, file: !9, discriminator: 1)
!40 = distinct !DISubprogram(name: "memory_leak_003_bad", scope: !9, file: !9, line: 28, type: !41, isLocal: false, isDefinition: true, scopeLine: 29, isOptimized: false, unit: !0, variables: !2)
!41 = !DISubroutineType(types: !42)
!42 = !{null}
!43 = !DILocalVariable(name: "str", scope: !40, file: !9, line: 30, type: !14)
!44 = !DILocation(line: 30, column: 8, scope: !40)
!45 = !DILocalVariable(name: "str1", scope: !40, file: !9, line: 31, type: !14)
!46 = !DILocation(line: 31, column: 8, scope: !40)
!47 = !DILocation(line: 32, column: 38, scope: !40)
!48 = !DILocation(line: 32, column: 31, scope: !40)
!49 = !DILocation(line: 32, column: 2, scope: !50)
!50 = !DILexicalBlockFile(scope: !40, file: !9, discriminator: 1)
!51 = !DILocation(line: 33, column: 9, scope: !40)
!52 = !DILocation(line: 33, column: 14, scope: !40)
!53 = !DILocation(line: 33, column: 2, scope: !40)
!54 = !DILocation(line: 34, column: 1, scope: !40)
!55 = distinct !DISubprogram(name: "memory_leak_003_func_001_good", scope: !9, file: !9, line: 40, type: !10, isLocal: false, isDefinition: true, scopeLine: 41, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!56 = !DILocalVariable(name: "len", arg: 1, scope: !55, file: !9, line: 40, type: !12)
!57 = !DILocation(line: 40, column: 40, scope: !55)
!58 = !DILocalVariable(name: "stringPtr", arg: 2, scope: !55, file: !9, line: 40, type: !13)
!59 = !DILocation(line: 40, column: 51, scope: !55)
!60 = !DILocalVariable(name: "p", scope: !55, file: !9, line: 42, type: !14)
!61 = !DILocation(line: 42, column: 9, scope: !55)
!62 = !DILocation(line: 42, column: 36, scope: !55)
!63 = !DILocation(line: 42, column: 39, scope: !55)
!64 = !DILocation(line: 42, column: 35, scope: !55)
!65 = !DILocation(line: 42, column: 33, scope: !55)
!66 = !DILocation(line: 42, column: 13, scope: !55)
!67 = !DILocation(line: 43, column: 6, scope: !68)
!68 = distinct !DILexicalBlock(scope: !55, file: !9, line: 43, column: 6)
!69 = !DILocation(line: 43, column: 8, scope: !68)
!70 = !DILocation(line: 43, column: 6, scope: !55)
!71 = !DILocation(line: 45, column: 3, scope: !72)
!72 = distinct !DILexicalBlock(scope: !68, file: !9, line: 44, column: 2)
!73 = !DILocation(line: 47, column: 15, scope: !55)
!74 = !DILocation(line: 47, column: 3, scope: !55)
!75 = !DILocation(line: 47, column: 13, scope: !55)
!76 = !DILocation(line: 48, column: 1, scope: !55)
!77 = !DILocation(line: 48, column: 1, scope: !78)
!78 = !DILexicalBlockFile(scope: !55, file: !9, discriminator: 1)
!79 = distinct !DISubprogram(name: "memory_leak_003_good", scope: !9, file: !9, line: 50, type: !41, isLocal: false, isDefinition: true, scopeLine: 51, isOptimized: false, unit: !0, variables: !2)
!80 = !DILocalVariable(name: "str", scope: !79, file: !9, line: 52, type: !14)
!81 = !DILocation(line: 52, column: 8, scope: !79)
!82 = !DILocalVariable(name: "str1", scope: !79, file: !9, line: 53, type: !14)
!83 = !DILocation(line: 53, column: 8, scope: !79)
!84 = !DILocation(line: 54, column: 39, scope: !79)
!85 = !DILocation(line: 54, column: 32, scope: !79)
!86 = !DILocation(line: 54, column: 2, scope: !87)
!87 = !DILexicalBlockFile(scope: !79, file: !9, discriminator: 1)
!88 = !DILocation(line: 55, column: 9, scope: !79)
!89 = !DILocation(line: 55, column: 14, scope: !79)
!90 = !DILocation(line: 55, column: 2, scope: !79)
!91 = !DILocation(line: 56, column: 7, scope: !79)
!92 = !DILocation(line: 56, column: 2, scope: !79)
!93 = !DILocation(line: 57, column: 1, scope: !79)
!94 = distinct !DISubprogram(name: "main", scope: !9, file: !9, line: 64, type: !95, isLocal: false, isDefinition: true, scopeLine: 65, isOptimized: false, unit: !0, variables: !2)
!95 = !DISubroutineType(types: !96)
!96 = !{!12}
!97 = !DILocation(line: 66, column: 2, scope: !94)
!98 = !DILocation(line: 67, column: 2, scope: !94)
!99 = !DILocation(line: 68, column: 2, scope: !94)
