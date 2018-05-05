; ModuleID = './401_49.c'
source_filename = "./401_49.c"
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
@staticFive = internal global i32 5, align 4
@.str.2 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: nounwind uwtable
define i32 @globalReturnsTrue() #0 !dbg !20 {
entry:
  ret i32 1, !dbg !23
}

; Function Attrs: nounwind uwtable
define i32 @globalReturnsFalse() #0 !dbg !24 {
entry:
  ret i32 0, !dbg !25
}

; Function Attrs: nounwind uwtable
define i32 @globalReturnsTrueOrFalse() #0 !dbg !26 {
entry:
  %call = call i32 @rand() #4, !dbg !27
  %rem = srem i32 %call, 2, !dbg !28
  ret i32 %rem, !dbg !29
}

; Function Attrs: nounwind
declare i32 @rand() #1

; Function Attrs: nounwind uwtable
define void @printLine(i8* %line) #0 !dbg !30 {
entry:
  %line.addr = alloca i8*, align 8
  store i8* %line, i8** %line.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %line.addr, metadata !36, metadata !37), !dbg !38
  %0 = load i8*, i8** %line.addr, align 8, !dbg !39
  %cmp = icmp ne i8* %0, null, !dbg !41
  br i1 %cmp, label %if.then, label %if.end, !dbg !42

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** %line.addr, align 8, !dbg !43
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), i8* %1), !dbg !45
  br label %if.end, !dbg !46

if.end:                                           ; preds = %if.then, %entry
  ret void, !dbg !47
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #2

declare i32 @printf(i8*, ...) #3

; Function Attrs: nounwind uwtable
define void @printIntLine(i32 %intNumber) #0 !dbg !48 {
entry:
  %intNumber.addr = alloca i32, align 4
  store i32 %intNumber, i32* %intNumber.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %intNumber.addr, metadata !51, metadata !37), !dbg !52
  %0 = load i32, i32* %intNumber.addr, align 4, !dbg !53
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i32 0, i32 0), i32 %0), !dbg !54
  ret void, !dbg !55
}

; Function Attrs: nounwind uwtable
define void @bad49() #0 !dbg !56 {
entry:
  %data = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !59, metadata !37), !dbg !60
  store i32* null, i32** %data, align 8, !dbg !61
  %0 = load i32, i32* @staticFive, align 4, !dbg !62
  %cmp = icmp eq i32 %0, 5, !dbg !64
  br i1 %cmp, label %if.then, label %if.end4, !dbg !65

if.then:                                          ; preds = %entry
  %call = call noalias i8* @calloc(i64 100, i64 4) #4, !dbg !66
  %1 = bitcast i8* %call to i32*, !dbg !68
  store i32* %1, i32** %data, align 8, !dbg !69
  %2 = load i32*, i32** %data, align 8, !dbg !70
  %cmp1 = icmp eq i32* %2, null, !dbg !72
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !73

if.then2:                                         ; preds = %if.then
  br label %if.end7, !dbg !74

if.end:                                           ; preds = %if.then
  %3 = load i32*, i32** %data, align 8, !dbg !76
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 0, !dbg !76
  store i32 5, i32* %arrayidx, align 4, !dbg !77
  %4 = load i32*, i32** %data, align 8, !dbg !78
  %arrayidx3 = getelementptr inbounds i32, i32* %4, i64 0, !dbg !78
  %5 = load i32, i32* %arrayidx3, align 4, !dbg !78
  call void @printIntLine(i32 %5), !dbg !79
  br label %if.end4, !dbg !80

if.end4:                                          ; preds = %if.end, %entry
  %6 = load i32, i32* @staticFive, align 4, !dbg !81
  %cmp5 = icmp eq i32 %6, 5, !dbg !83
  br i1 %cmp5, label %if.then6, label %if.end7, !dbg !84

if.then6:                                         ; preds = %if.end4
  br label %if.end7, !dbg !85

if.end7:                                          ; preds = %if.then2, %if.then6, %if.end4
  ret void, !dbg !87
}

; Function Attrs: nounwind
declare noalias i8* @calloc(i64, i64) #1

; Function Attrs: nounwind uwtable
define void @good49() #0 !dbg !88 {
entry:
  %data = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !89, metadata !37), !dbg !90
  store i32* null, i32** %data, align 8, !dbg !91
  %0 = load i32, i32* @staticFive, align 4, !dbg !92
  %cmp = icmp eq i32 %0, 5, !dbg !94
  br i1 %cmp, label %if.then, label %if.end4, !dbg !95

if.then:                                          ; preds = %entry
  %call = call noalias i8* @calloc(i64 100, i64 4) #4, !dbg !96
  %1 = bitcast i8* %call to i32*, !dbg !98
  store i32* %1, i32** %data, align 8, !dbg !99
  %2 = load i32*, i32** %data, align 8, !dbg !100
  %cmp1 = icmp eq i32* %2, null, !dbg !102
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !103

if.then2:                                         ; preds = %if.then
  br label %if.end7, !dbg !104

if.end:                                           ; preds = %if.then
  %3 = load i32*, i32** %data, align 8, !dbg !106
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 0, !dbg !106
  store i32 5, i32* %arrayidx, align 4, !dbg !107
  %4 = load i32*, i32** %data, align 8, !dbg !108
  %arrayidx3 = getelementptr inbounds i32, i32* %4, i64 0, !dbg !108
  %5 = load i32, i32* %arrayidx3, align 4, !dbg !108
  call void @printIntLine(i32 %5), !dbg !109
  br label %if.end4, !dbg !110

if.end4:                                          ; preds = %if.end, %entry
  %6 = load i32, i32* @staticFive, align 4, !dbg !111
  %cmp5 = icmp ne i32 %6, 5, !dbg !113
  br i1 %cmp5, label %if.then6, label %if.else, !dbg !114

if.then6:                                         ; preds = %if.end4
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.2, i32 0, i32 0)), !dbg !115
  br label %if.end7, !dbg !117

if.else:                                          ; preds = %if.end4
  %7 = load i32*, i32** %data, align 8, !dbg !118
  %8 = bitcast i32* %7 to i8*, !dbg !118
  call void @free(i8* %8) #4, !dbg !120
  br label %if.end7

if.end7:                                          ; preds = %if.then2, %if.else, %if.then6
  ret void, !dbg !121
}

; Function Attrs: nounwind
declare void @free(i8*) #1

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !122 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @good49(), !dbg !123
  call void @bad49(), !dbg !124
  ret i32 1, !dbg !125
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone }
attributes #3 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!17, !18}
!llvm.ident = !{!19}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (tags/RELEASE_390/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, globals: !7)
!1 = !DIFile(filename: "401_49.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/401")
!2 = !{}
!3 = !{!4, !5}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64, align: 64)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64, align: 64)
!6 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!7 = !{!8, !11, !12, !13, !14, !15, !16}
!8 = distinct !DIGlobalVariable(name: "GLOBAL_CONST_TRUE", scope: !0, file: !9, line: 10, type: !10, isLocal: false, isDefinition: true, variable: i32* @GLOBAL_CONST_TRUE)
!9 = !DIFile(filename: "./401_49.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/401")
!10 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !6)
!11 = distinct !DIGlobalVariable(name: "GLOBAL_CONST_FALSE", scope: !0, file: !9, line: 11, type: !10, isLocal: false, isDefinition: true, variable: i32* @GLOBAL_CONST_FALSE)
!12 = distinct !DIGlobalVariable(name: "GLOBAL_CONST_FIVE", scope: !0, file: !9, line: 12, type: !10, isLocal: false, isDefinition: true, variable: i32* @GLOBAL_CONST_FIVE)
!13 = distinct !DIGlobalVariable(name: "globalTrue", scope: !0, file: !9, line: 15, type: !6, isLocal: false, isDefinition: true, variable: i32* @globalTrue)
!14 = distinct !DIGlobalVariable(name: "globalFalse", scope: !0, file: !9, line: 16, type: !6, isLocal: false, isDefinition: true, variable: i32* @globalFalse)
!15 = distinct !DIGlobalVariable(name: "globalFive", scope: !0, file: !9, line: 17, type: !6, isLocal: false, isDefinition: true, variable: i32* @globalFive)
!16 = distinct !DIGlobalVariable(name: "staticFive", scope: !0, file: !9, line: 47, type: !6, isLocal: true, isDefinition: true, variable: i32* @staticFive)
!17 = !{i32 2, !"Dwarf Version", i32 4}
!18 = !{i32 2, !"Debug Info Version", i32 3}
!19 = !{!"clang version 3.9.0 (tags/RELEASE_390/final)"}
!20 = distinct !DISubprogram(name: "globalReturnsTrue", scope: !9, file: !9, line: 19, type: !21, isLocal: false, isDefinition: true, scopeLine: 20, isOptimized: false, unit: !0, variables: !2)
!21 = !DISubroutineType(types: !22)
!22 = !{!6}
!23 = !DILocation(line: 21, column: 5, scope: !20)
!24 = distinct !DISubprogram(name: "globalReturnsFalse", scope: !9, file: !9, line: 24, type: !21, isLocal: false, isDefinition: true, scopeLine: 25, isOptimized: false, unit: !0, variables: !2)
!25 = !DILocation(line: 26, column: 5, scope: !24)
!26 = distinct !DISubprogram(name: "globalReturnsTrueOrFalse", scope: !9, file: !9, line: 29, type: !21, isLocal: false, isDefinition: true, scopeLine: 30, isOptimized: false, unit: !0, variables: !2)
!27 = !DILocation(line: 31, column: 13, scope: !26)
!28 = !DILocation(line: 31, column: 20, scope: !26)
!29 = !DILocation(line: 31, column: 5, scope: !26)
!30 = distinct !DISubprogram(name: "printLine", scope: !9, file: !9, line: 34, type: !31, isLocal: false, isDefinition: true, scopeLine: 35, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!31 = !DISubroutineType(types: !32)
!32 = !{null, !33}
!33 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !34, size: 64, align: 64)
!34 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !35)
!35 = !DIBasicType(name: "char", size: 8, align: 8, encoding: DW_ATE_signed_char)
!36 = !DILocalVariable(name: "line", arg: 1, scope: !30, file: !9, line: 34, type: !33)
!37 = !DIExpression()
!38 = !DILocation(line: 34, column: 30, scope: !30)
!39 = !DILocation(line: 36, column: 8, scope: !40)
!40 = distinct !DILexicalBlock(scope: !30, file: !9, line: 36, column: 8)
!41 = !DILocation(line: 36, column: 13, scope: !40)
!42 = !DILocation(line: 36, column: 8, scope: !30)
!43 = !DILocation(line: 38, column: 24, scope: !44)
!44 = distinct !DILexicalBlock(scope: !40, file: !9, line: 37, column: 5)
!45 = !DILocation(line: 38, column: 9, scope: !44)
!46 = !DILocation(line: 39, column: 5, scope: !44)
!47 = !DILocation(line: 40, column: 1, scope: !30)
!48 = distinct !DISubprogram(name: "printIntLine", scope: !9, file: !9, line: 42, type: !49, isLocal: false, isDefinition: true, scopeLine: 43, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!49 = !DISubroutineType(types: !50)
!50 = !{null, !6}
!51 = !DILocalVariable(name: "intNumber", arg: 1, scope: !48, file: !9, line: 42, type: !6)
!52 = !DILocation(line: 42, column: 24, scope: !48)
!53 = !DILocation(line: 44, column: 20, scope: !48)
!54 = !DILocation(line: 44, column: 5, scope: !48)
!55 = !DILocation(line: 45, column: 1, scope: !48)
!56 = distinct !DISubprogram(name: "bad49", scope: !9, file: !9, line: 51, type: !57, isLocal: false, isDefinition: true, scopeLine: 52, isOptimized: false, unit: !0, variables: !2)
!57 = !DISubroutineType(types: !58)
!58 = !{null}
!59 = !DILocalVariable(name: "data", scope: !56, file: !9, line: 53, type: !5)
!60 = !DILocation(line: 53, column: 11, scope: !56)
!61 = !DILocation(line: 54, column: 10, scope: !56)
!62 = !DILocation(line: 55, column: 8, scope: !63)
!63 = distinct !DILexicalBlock(scope: !56, file: !9, line: 55, column: 8)
!64 = !DILocation(line: 55, column: 18, scope: !63)
!65 = !DILocation(line: 55, column: 8, scope: !56)
!66 = !DILocation(line: 58, column: 23, scope: !67)
!67 = distinct !DILexicalBlock(scope: !63, file: !9, line: 56, column: 5)
!68 = !DILocation(line: 58, column: 16, scope: !67)
!69 = !DILocation(line: 58, column: 14, scope: !67)
!70 = !DILocation(line: 59, column: 13, scope: !71)
!71 = distinct !DILexicalBlock(scope: !67, file: !9, line: 59, column: 13)
!72 = !DILocation(line: 59, column: 18, scope: !71)
!73 = !DILocation(line: 59, column: 13, scope: !67)
!74 = !DILocation(line: 59, column: 27, scope: !75)
!75 = !DILexicalBlockFile(scope: !71, file: !9, discriminator: 1)
!76 = !DILocation(line: 61, column: 9, scope: !67)
!77 = !DILocation(line: 61, column: 17, scope: !67)
!78 = !DILocation(line: 62, column: 22, scope: !67)
!79 = !DILocation(line: 62, column: 9, scope: !67)
!80 = !DILocation(line: 63, column: 5, scope: !67)
!81 = !DILocation(line: 64, column: 8, scope: !82)
!82 = distinct !DILexicalBlock(scope: !56, file: !9, line: 64, column: 8)
!83 = !DILocation(line: 64, column: 18, scope: !82)
!84 = !DILocation(line: 64, column: 8, scope: !56)
!85 = !DILocation(line: 68, column: 5, scope: !86)
!86 = distinct !DILexicalBlock(scope: !82, file: !9, line: 65, column: 5)
!87 = !DILocation(line: 69, column: 1, scope: !56)
!88 = distinct !DISubprogram(name: "good49", scope: !9, file: !9, line: 75, type: !57, isLocal: false, isDefinition: true, scopeLine: 76, isOptimized: false, unit: !0, variables: !2)
!89 = !DILocalVariable(name: "data", scope: !88, file: !9, line: 77, type: !5)
!90 = !DILocation(line: 77, column: 11, scope: !88)
!91 = !DILocation(line: 78, column: 10, scope: !88)
!92 = !DILocation(line: 79, column: 8, scope: !93)
!93 = distinct !DILexicalBlock(scope: !88, file: !9, line: 79, column: 8)
!94 = !DILocation(line: 79, column: 18, scope: !93)
!95 = !DILocation(line: 79, column: 8, scope: !88)
!96 = !DILocation(line: 82, column: 23, scope: !97)
!97 = distinct !DILexicalBlock(scope: !93, file: !9, line: 80, column: 5)
!98 = !DILocation(line: 82, column: 16, scope: !97)
!99 = !DILocation(line: 82, column: 14, scope: !97)
!100 = !DILocation(line: 83, column: 13, scope: !101)
!101 = distinct !DILexicalBlock(scope: !97, file: !9, line: 83, column: 13)
!102 = !DILocation(line: 83, column: 18, scope: !101)
!103 = !DILocation(line: 83, column: 13, scope: !97)
!104 = !DILocation(line: 83, column: 27, scope: !105)
!105 = !DILexicalBlockFile(scope: !101, file: !9, discriminator: 1)
!106 = !DILocation(line: 85, column: 9, scope: !97)
!107 = !DILocation(line: 85, column: 17, scope: !97)
!108 = !DILocation(line: 86, column: 22, scope: !97)
!109 = !DILocation(line: 86, column: 9, scope: !97)
!110 = !DILocation(line: 87, column: 5, scope: !97)
!111 = !DILocation(line: 88, column: 8, scope: !112)
!112 = distinct !DILexicalBlock(scope: !88, file: !9, line: 88, column: 8)
!113 = !DILocation(line: 88, column: 18, scope: !112)
!114 = !DILocation(line: 88, column: 8, scope: !88)
!115 = !DILocation(line: 91, column: 9, scope: !116)
!116 = distinct !DILexicalBlock(scope: !112, file: !9, line: 89, column: 5)
!117 = !DILocation(line: 92, column: 5, scope: !116)
!118 = !DILocation(line: 96, column: 14, scope: !119)
!119 = distinct !DILexicalBlock(scope: !112, file: !9, line: 94, column: 5)
!120 = !DILocation(line: 96, column: 9, scope: !119)
!121 = !DILocation(line: 98, column: 1, scope: !88)
!122 = distinct !DISubprogram(name: "main", scope: !9, file: !9, line: 102, type: !21, isLocal: false, isDefinition: true, scopeLine: 102, isOptimized: false, unit: !0, variables: !2)
!123 = !DILocation(line: 103, column: 5, scope: !122)
!124 = !DILocation(line: 104, column: 2, scope: !122)
!125 = !DILocation(line: 105, column: 5, scope: !122)
