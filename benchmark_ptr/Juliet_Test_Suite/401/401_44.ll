; ModuleID = './401_44.c'
source_filename = "./401_44.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@GLOBAL_CONST_TRUE = constant i32 1, align 4
@GLOBAL_CONST_FALSE = constant i32 0, align 4
@GLOBAL_CONST_FIVE = constant i32 5, align 4
@globalTrue = global i32 1, align 4
@globalFalse = global i32 0, align 4
@globalFive = global i32 5, align 4
@.str = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1
@.str.1 = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @globalReturnsTrue() #0 !dbg !19 {
entry:
  ret i32 1, !dbg !22
}

; Function Attrs: nounwind uwtable
define i32 @globalReturnsFalse() #0 !dbg !23 {
entry:
  ret i32 0, !dbg !24
}

; Function Attrs: nounwind uwtable
define i32 @globalReturnsTrueOrFalse() #0 !dbg !25 {
entry:
  %call = call i32 @rand() #4, !dbg !26
  %rem = srem i32 %call, 2, !dbg !27
  ret i32 %rem, !dbg !28
}

; Function Attrs: nounwind
declare i32 @rand() #1

; Function Attrs: nounwind uwtable
define void @printLine(i8* %line) #0 !dbg !29 {
entry:
  %line.addr = alloca i8*, align 8
  store i8* %line, i8** %line.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %line.addr, metadata !35, metadata !36), !dbg !37
  %0 = load i8*, i8** %line.addr, align 8, !dbg !38
  %cmp = icmp ne i8* %0, null, !dbg !40
  br i1 %cmp, label %if.then, label %if.end, !dbg !41

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** %line.addr, align 8, !dbg !42
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), i8* %1), !dbg !44
  br label %if.end, !dbg !45

if.end:                                           ; preds = %if.then, %entry
  ret void, !dbg !46
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #2

declare i32 @printf(i8*, ...) #3

; Function Attrs: nounwind uwtable
define void @printIntLine(i32 %intNumber) #0 !dbg !47 {
entry:
  %intNumber.addr = alloca i32, align 4
  store i32 %intNumber, i32* %intNumber.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %intNumber.addr, metadata !50, metadata !36), !dbg !51
  %0 = load i32, i32* %intNumber.addr, align 4, !dbg !52
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i32 0, i32 0), i32 %0), !dbg !53
  ret void, !dbg !54
}

; Function Attrs: nounwind uwtable
define void @bad44() #0 !dbg !55 {
entry:
  %data = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !58, metadata !36), !dbg !59
  store i32* null, i32** %data, align 8, !dbg !60
  %call = call noalias i8* @calloc(i64 100, i64 4) #4, !dbg !61
  %0 = bitcast i8* %call to i32*, !dbg !64
  store i32* %0, i32** %data, align 8, !dbg !65
  %1 = load i32*, i32** %data, align 8, !dbg !66
  %cmp = icmp eq i32* %1, null, !dbg !68
  br i1 %cmp, label %if.then, label %if.end, !dbg !69

if.then:                                          ; preds = %entry
  br label %return, !dbg !70

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !72
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 0, !dbg !72
  store i32 5, i32* %arrayidx, align 4, !dbg !73
  %3 = load i32*, i32** %data, align 8, !dbg !74
  %arrayidx1 = getelementptr inbounds i32, i32* %3, i64 0, !dbg !74
  %4 = load i32, i32* %arrayidx1, align 4, !dbg !74
  call void @printIntLine(i32 %4), !dbg !75
  br label %return, !dbg !76

return:                                           ; preds = %if.end, %if.then
  ret void, !dbg !77
}

; Function Attrs: nounwind
declare noalias i8* @calloc(i64, i64) #1

; Function Attrs: nounwind uwtable
define void @good44() #0 !dbg !79 {
entry:
  %data = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !80, metadata !36), !dbg !81
  store i32* null, i32** %data, align 8, !dbg !82
  %call = call noalias i8* @calloc(i64 100, i64 4) #4, !dbg !83
  %0 = bitcast i8* %call to i32*, !dbg !86
  store i32* %0, i32** %data, align 8, !dbg !87
  %1 = load i32*, i32** %data, align 8, !dbg !88
  %cmp = icmp eq i32* %1, null, !dbg !90
  br i1 %cmp, label %if.then, label %if.end, !dbg !91

if.then:                                          ; preds = %entry
  br label %return, !dbg !92

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !94
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 0, !dbg !94
  store i32 5, i32* %arrayidx, align 4, !dbg !95
  %3 = load i32*, i32** %data, align 8, !dbg !96
  %arrayidx1 = getelementptr inbounds i32, i32* %3, i64 0, !dbg !96
  %4 = load i32, i32* %arrayidx1, align 4, !dbg !96
  call void @printIntLine(i32 %4), !dbg !97
  %5 = load i32*, i32** %data, align 8, !dbg !98
  %6 = bitcast i32* %5 to i8*, !dbg !98
  call void @free(i8* %6) #4, !dbg !101
  br label %return, !dbg !102

return:                                           ; preds = %if.end, %if.then
  ret void, !dbg !103
}

; Function Attrs: nounwind
declare void @free(i8*) #1

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !105 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @good44(), !dbg !106
  call void @bad44(), !dbg !107
  ret i32 1, !dbg !108
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone }
attributes #3 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!16, !17}
!llvm.ident = !{!18}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (tags/RELEASE_390/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, globals: !7)
!1 = !DIFile(filename: "401_44.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/401")
!2 = !{}
!3 = !{!4, !5}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64, align: 64)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64, align: 64)
!6 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!7 = !{!8, !11, !12, !13, !14, !15}
!8 = distinct !DIGlobalVariable(name: "GLOBAL_CONST_TRUE", scope: !0, file: !9, line: 10, type: !10, isLocal: false, isDefinition: true, variable: i32* @GLOBAL_CONST_TRUE)
!9 = !DIFile(filename: "./401_44.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/401")
!10 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !6)
!11 = distinct !DIGlobalVariable(name: "GLOBAL_CONST_FALSE", scope: !0, file: !9, line: 11, type: !10, isLocal: false, isDefinition: true, variable: i32* @GLOBAL_CONST_FALSE)
!12 = distinct !DIGlobalVariable(name: "GLOBAL_CONST_FIVE", scope: !0, file: !9, line: 12, type: !10, isLocal: false, isDefinition: true, variable: i32* @GLOBAL_CONST_FIVE)
!13 = distinct !DIGlobalVariable(name: "globalTrue", scope: !0, file: !9, line: 15, type: !6, isLocal: false, isDefinition: true, variable: i32* @globalTrue)
!14 = distinct !DIGlobalVariable(name: "globalFalse", scope: !0, file: !9, line: 16, type: !6, isLocal: false, isDefinition: true, variable: i32* @globalFalse)
!15 = distinct !DIGlobalVariable(name: "globalFive", scope: !0, file: !9, line: 17, type: !6, isLocal: false, isDefinition: true, variable: i32* @globalFive)
!16 = !{i32 2, !"Dwarf Version", i32 4}
!17 = !{i32 2, !"Debug Info Version", i32 3}
!18 = !{!"clang version 3.9.0 (tags/RELEASE_390/final)"}
!19 = distinct !DISubprogram(name: "globalReturnsTrue", scope: !9, file: !9, line: 19, type: !20, isLocal: false, isDefinition: true, scopeLine: 20, isOptimized: false, unit: !0, variables: !2)
!20 = !DISubroutineType(types: !21)
!21 = !{!6}
!22 = !DILocation(line: 21, column: 5, scope: !19)
!23 = distinct !DISubprogram(name: "globalReturnsFalse", scope: !9, file: !9, line: 24, type: !20, isLocal: false, isDefinition: true, scopeLine: 25, isOptimized: false, unit: !0, variables: !2)
!24 = !DILocation(line: 26, column: 5, scope: !23)
!25 = distinct !DISubprogram(name: "globalReturnsTrueOrFalse", scope: !9, file: !9, line: 29, type: !20, isLocal: false, isDefinition: true, scopeLine: 30, isOptimized: false, unit: !0, variables: !2)
!26 = !DILocation(line: 31, column: 13, scope: !25)
!27 = !DILocation(line: 31, column: 20, scope: !25)
!28 = !DILocation(line: 31, column: 5, scope: !25)
!29 = distinct !DISubprogram(name: "printLine", scope: !9, file: !9, line: 34, type: !30, isLocal: false, isDefinition: true, scopeLine: 35, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!30 = !DISubroutineType(types: !31)
!31 = !{null, !32}
!32 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !33, size: 64, align: 64)
!33 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !34)
!34 = !DIBasicType(name: "char", size: 8, align: 8, encoding: DW_ATE_signed_char)
!35 = !DILocalVariable(name: "line", arg: 1, scope: !29, file: !9, line: 34, type: !32)
!36 = !DIExpression()
!37 = !DILocation(line: 34, column: 30, scope: !29)
!38 = !DILocation(line: 36, column: 8, scope: !39)
!39 = distinct !DILexicalBlock(scope: !29, file: !9, line: 36, column: 8)
!40 = !DILocation(line: 36, column: 13, scope: !39)
!41 = !DILocation(line: 36, column: 8, scope: !29)
!42 = !DILocation(line: 38, column: 24, scope: !43)
!43 = distinct !DILexicalBlock(scope: !39, file: !9, line: 37, column: 5)
!44 = !DILocation(line: 38, column: 9, scope: !43)
!45 = !DILocation(line: 39, column: 5, scope: !43)
!46 = !DILocation(line: 40, column: 1, scope: !29)
!47 = distinct !DISubprogram(name: "printIntLine", scope: !9, file: !9, line: 42, type: !48, isLocal: false, isDefinition: true, scopeLine: 43, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!48 = !DISubroutineType(types: !49)
!49 = !{null, !6}
!50 = !DILocalVariable(name: "intNumber", arg: 1, scope: !47, file: !9, line: 42, type: !6)
!51 = !DILocation(line: 42, column: 24, scope: !47)
!52 = !DILocation(line: 44, column: 20, scope: !47)
!53 = !DILocation(line: 44, column: 5, scope: !47)
!54 = !DILocation(line: 45, column: 1, scope: !47)
!55 = distinct !DISubprogram(name: "bad44", scope: !9, file: !9, line: 49, type: !56, isLocal: false, isDefinition: true, scopeLine: 50, isOptimized: false, unit: !0, variables: !2)
!56 = !DISubroutineType(types: !57)
!57 = !{null}
!58 = !DILocalVariable(name: "data", scope: !55, file: !9, line: 51, type: !5)
!59 = !DILocation(line: 51, column: 11, scope: !55)
!60 = !DILocation(line: 52, column: 10, scope: !55)
!61 = !DILocation(line: 56, column: 23, scope: !62)
!62 = distinct !DILexicalBlock(scope: !63, file: !9, line: 54, column: 5)
!63 = distinct !DILexicalBlock(scope: !55, file: !9, line: 53, column: 8)
!64 = !DILocation(line: 56, column: 16, scope: !62)
!65 = !DILocation(line: 56, column: 14, scope: !62)
!66 = !DILocation(line: 57, column: 13, scope: !67)
!67 = distinct !DILexicalBlock(scope: !62, file: !9, line: 57, column: 13)
!68 = !DILocation(line: 57, column: 18, scope: !67)
!69 = !DILocation(line: 57, column: 13, scope: !62)
!70 = !DILocation(line: 57, column: 27, scope: !71)
!71 = !DILexicalBlockFile(scope: !67, file: !9, discriminator: 1)
!72 = !DILocation(line: 59, column: 9, scope: !62)
!73 = !DILocation(line: 59, column: 17, scope: !62)
!74 = !DILocation(line: 60, column: 22, scope: !62)
!75 = !DILocation(line: 60, column: 9, scope: !62)
!76 = !DILocation(line: 67, column: 1, scope: !55)
!77 = !DILocation(line: 67, column: 1, scope: !78)
!78 = !DILexicalBlockFile(scope: !55, file: !9, discriminator: 1)
!79 = distinct !DISubprogram(name: "good44", scope: !9, file: !9, line: 73, type: !56, isLocal: false, isDefinition: true, scopeLine: 74, isOptimized: false, unit: !0, variables: !2)
!80 = !DILocalVariable(name: "data", scope: !79, file: !9, line: 75, type: !5)
!81 = !DILocation(line: 75, column: 11, scope: !79)
!82 = !DILocation(line: 76, column: 10, scope: !79)
!83 = !DILocation(line: 80, column: 23, scope: !84)
!84 = distinct !DILexicalBlock(scope: !85, file: !9, line: 78, column: 5)
!85 = distinct !DILexicalBlock(scope: !79, file: !9, line: 77, column: 8)
!86 = !DILocation(line: 80, column: 16, scope: !84)
!87 = !DILocation(line: 80, column: 14, scope: !84)
!88 = !DILocation(line: 81, column: 13, scope: !89)
!89 = distinct !DILexicalBlock(scope: !84, file: !9, line: 81, column: 13)
!90 = !DILocation(line: 81, column: 18, scope: !89)
!91 = !DILocation(line: 81, column: 13, scope: !84)
!92 = !DILocation(line: 81, column: 27, scope: !93)
!93 = !DILexicalBlockFile(scope: !89, file: !9, discriminator: 1)
!94 = !DILocation(line: 83, column: 9, scope: !84)
!95 = !DILocation(line: 83, column: 17, scope: !84)
!96 = !DILocation(line: 84, column: 22, scope: !84)
!97 = !DILocation(line: 84, column: 9, scope: !84)
!98 = !DILocation(line: 94, column: 14, scope: !99)
!99 = distinct !DILexicalBlock(scope: !100, file: !9, line: 92, column: 5)
!100 = distinct !DILexicalBlock(scope: !79, file: !9, line: 86, column: 8)
!101 = !DILocation(line: 94, column: 9, scope: !99)
!102 = !DILocation(line: 96, column: 1, scope: !79)
!103 = !DILocation(line: 96, column: 1, scope: !104)
!104 = !DILexicalBlockFile(scope: !79, file: !9, discriminator: 1)
!105 = distinct !DISubprogram(name: "main", scope: !9, file: !9, line: 100, type: !20, isLocal: false, isDefinition: true, scopeLine: 100, isOptimized: false, unit: !0, variables: !2)
!106 = !DILocation(line: 101, column: 5, scope: !105)
!107 = !DILocation(line: 102, column: 2, scope: !105)
!108 = !DILocation(line: 103, column: 5, scope: !105)
