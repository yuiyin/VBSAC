; ModuleID = './415_27.c'
source_filename = "./415_27.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@GLOBAL_CONST_TRUE = constant i32 1, align 4
@GLOBAL_CONST_FALSE = constant i32 0, align 4
@GLOBAL_CONST_FIVE = constant i32 5, align 4
@globalTrue = global i32 1, align 4
@globalFalse = global i32 0, align 4
@globalFive = global i32 5, align 4
@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@.str.1 = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1
@.str.2 = private unnamed_addr constant [5 x i8] c"%ld\0A\00", align 1
@staticFive = internal global i32 5, align 4
@.str.3 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

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
define void @printHexCharLine(i8 signext %charHex) #0 !dbg !30 {
entry:
  %charHex.addr = alloca i8, align 1
  store i8 %charHex, i8* %charHex.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %charHex.addr, metadata !34, metadata !35), !dbg !36
  %0 = load i8, i8* %charHex.addr, align 1, !dbg !37
  %conv = sext i8 %0 to i32, !dbg !38
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), i32 %conv), !dbg !39
  ret void, !dbg !40
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #2

declare i32 @printf(i8*, ...) #3

; Function Attrs: nounwind uwtable
define void @printLine(i8* %line) #0 !dbg !41 {
entry:
  %line.addr = alloca i8*, align 8
  store i8* %line, i8** %line.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %line.addr, metadata !46, metadata !35), !dbg !47
  %0 = load i8*, i8** %line.addr, align 8, !dbg !48
  %cmp = icmp ne i8* %0, null, !dbg !50
  br i1 %cmp, label %if.then, label %if.end, !dbg !51

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** %line.addr, align 8, !dbg !52
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i32 0, i32 0), i8* %1), !dbg !54
  br label %if.end, !dbg !55

if.end:                                           ; preds = %if.then, %entry
  ret void, !dbg !56
}

; Function Attrs: nounwind uwtable
define void @printIntLine(i32 %intNumber) #0 !dbg !57 {
entry:
  %intNumber.addr = alloca i32, align 4
  store i32 %intNumber, i32* %intNumber.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %intNumber.addr, metadata !60, metadata !35), !dbg !61
  %0 = load i32, i32* %intNumber.addr, align 4, !dbg !62
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), i32 %0), !dbg !63
  ret void, !dbg !64
}

; Function Attrs: nounwind uwtable
define void @printLongLine(i64 %longIntNumber) #0 !dbg !65 {
entry:
  %longIntNumber.addr = alloca i64, align 8
  store i64 %longIntNumber, i64* %longIntNumber.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %longIntNumber.addr, metadata !71, metadata !35), !dbg !72
  %0 = load i64, i64* %longIntNumber.addr, align 8, !dbg !73
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.2, i32 0, i32 0), i64 %0), !dbg !74
  ret void, !dbg !75
}

; Function Attrs: nounwind uwtable
define void @bad27() #0 !dbg !76 {
entry:
  %data = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !79, metadata !35), !dbg !80
  store i32* null, i32** %data, align 8, !dbg !81
  %0 = load i32, i32* @staticFive, align 4, !dbg !82
  %cmp = icmp eq i32 %0, 5, !dbg !84
  br i1 %cmp, label %if.then, label %if.end3, !dbg !85

if.then:                                          ; preds = %entry
  %call = call noalias i8* @malloc(i64 400) #4, !dbg !86
  %1 = bitcast i8* %call to i32*, !dbg !88
  store i32* %1, i32** %data, align 8, !dbg !89
  %2 = load i32*, i32** %data, align 8, !dbg !90
  %cmp1 = icmp eq i32* %2, null, !dbg !92
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !93

if.then2:                                         ; preds = %if.then
  br label %if.end6, !dbg !94

if.end:                                           ; preds = %if.then
  %3 = load i32*, i32** %data, align 8, !dbg !96
  %4 = bitcast i32* %3 to i8*, !dbg !96
  call void @free(i8* %4) #4, !dbg !97
  br label %if.end3, !dbg !98

if.end3:                                          ; preds = %if.end, %entry
  %5 = load i32, i32* @staticFive, align 4, !dbg !99
  %cmp4 = icmp eq i32 %5, 5, !dbg !101
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !102

if.then5:                                         ; preds = %if.end3
  %6 = load i32*, i32** %data, align 8, !dbg !103
  %7 = bitcast i32* %6 to i8*, !dbg !103
  call void @free(i8* %7) #4, !dbg !105
  br label %if.end6, !dbg !106

if.end6:                                          ; preds = %if.then2, %if.then5, %if.end3
  ret void, !dbg !107
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #1

; Function Attrs: nounwind
declare void @free(i8*) #1

; Function Attrs: nounwind uwtable
define void @good27() #0 !dbg !108 {
entry:
  %data = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !109, metadata !35), !dbg !110
  store i32* null, i32** %data, align 8, !dbg !111
  %0 = load i32, i32* @staticFive, align 4, !dbg !112
  %cmp = icmp eq i32 %0, 5, !dbg !114
  br i1 %cmp, label %if.then, label %if.end3, !dbg !115

if.then:                                          ; preds = %entry
  %call = call noalias i8* @malloc(i64 400) #4, !dbg !116
  %1 = bitcast i8* %call to i32*, !dbg !118
  store i32* %1, i32** %data, align 8, !dbg !119
  %2 = load i32*, i32** %data, align 8, !dbg !120
  %cmp1 = icmp eq i32* %2, null, !dbg !122
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !123

if.then2:                                         ; preds = %if.then
  br label %if.end6, !dbg !124

if.end:                                           ; preds = %if.then
  %3 = load i32*, i32** %data, align 8, !dbg !126
  %4 = bitcast i32* %3 to i8*, !dbg !126
  call void @free(i8* %4) #4, !dbg !127
  br label %if.end3, !dbg !128

if.end3:                                          ; preds = %if.end, %entry
  %5 = load i32, i32* @staticFive, align 4, !dbg !129
  %cmp4 = icmp ne i32 %5, 5, !dbg !131
  br i1 %cmp4, label %if.then5, label %if.else, !dbg !132

if.then5:                                         ; preds = %if.end3
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.3, i32 0, i32 0)), !dbg !133
  br label %if.end6, !dbg !135

if.else:                                          ; preds = %if.end3
  br label %if.end6

if.end6:                                          ; preds = %if.then2, %if.else, %if.then5
  ret void, !dbg !136
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !137 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @good27(), !dbg !138
  call void @bad27(), !dbg !139
  ret i32 1, !dbg !140
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
!1 = !DIFile(filename: "415_27.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/415")
!2 = !{}
!3 = !{!4, !5, !6}
!4 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64, align: 64)
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64, align: 64)
!7 = !{!8, !11, !12, !13, !14, !15, !16}
!8 = distinct !DIGlobalVariable(name: "GLOBAL_CONST_TRUE", scope: !0, file: !9, line: 10, type: !10, isLocal: false, isDefinition: true, variable: i32* @GLOBAL_CONST_TRUE)
!9 = !DIFile(filename: "./415_27.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/415")
!10 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !4)
!11 = distinct !DIGlobalVariable(name: "GLOBAL_CONST_FALSE", scope: !0, file: !9, line: 11, type: !10, isLocal: false, isDefinition: true, variable: i32* @GLOBAL_CONST_FALSE)
!12 = distinct !DIGlobalVariable(name: "GLOBAL_CONST_FIVE", scope: !0, file: !9, line: 12, type: !10, isLocal: false, isDefinition: true, variable: i32* @GLOBAL_CONST_FIVE)
!13 = distinct !DIGlobalVariable(name: "globalTrue", scope: !0, file: !9, line: 14, type: !4, isLocal: false, isDefinition: true, variable: i32* @globalTrue)
!14 = distinct !DIGlobalVariable(name: "globalFalse", scope: !0, file: !9, line: 15, type: !4, isLocal: false, isDefinition: true, variable: i32* @globalFalse)
!15 = distinct !DIGlobalVariable(name: "globalFive", scope: !0, file: !9, line: 16, type: !4, isLocal: false, isDefinition: true, variable: i32* @globalFive)
!16 = distinct !DIGlobalVariable(name: "staticFive", scope: !0, file: !9, line: 57, type: !4, isLocal: true, isDefinition: true, variable: i32* @staticFive)
!17 = !{i32 2, !"Dwarf Version", i32 4}
!18 = !{i32 2, !"Debug Info Version", i32 3}
!19 = !{!"clang version 3.9.0 (tags/RELEASE_390/final)"}
!20 = distinct !DISubprogram(name: "globalReturnsTrue", scope: !9, file: !9, line: 18, type: !21, isLocal: false, isDefinition: true, scopeLine: 19, isOptimized: false, unit: !0, variables: !2)
!21 = !DISubroutineType(types: !22)
!22 = !{!4}
!23 = !DILocation(line: 20, column: 5, scope: !20)
!24 = distinct !DISubprogram(name: "globalReturnsFalse", scope: !9, file: !9, line: 23, type: !21, isLocal: false, isDefinition: true, scopeLine: 24, isOptimized: false, unit: !0, variables: !2)
!25 = !DILocation(line: 25, column: 5, scope: !24)
!26 = distinct !DISubprogram(name: "globalReturnsTrueOrFalse", scope: !9, file: !9, line: 28, type: !21, isLocal: false, isDefinition: true, scopeLine: 29, isOptimized: false, unit: !0, variables: !2)
!27 = !DILocation(line: 30, column: 13, scope: !26)
!28 = !DILocation(line: 30, column: 20, scope: !26)
!29 = !DILocation(line: 30, column: 5, scope: !26)
!30 = distinct !DISubprogram(name: "printHexCharLine", scope: !9, file: !9, line: 33, type: !31, isLocal: false, isDefinition: true, scopeLine: 34, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!31 = !DISubroutineType(types: !32)
!32 = !{null, !33}
!33 = !DIBasicType(name: "char", size: 8, align: 8, encoding: DW_ATE_signed_char)
!34 = !DILocalVariable(name: "charHex", arg: 1, scope: !30, file: !9, line: 33, type: !33)
!35 = !DIExpression()
!36 = !DILocation(line: 33, column: 29, scope: !30)
!37 = !DILocation(line: 35, column: 25, scope: !30)
!38 = !DILocation(line: 35, column: 20, scope: !30)
!39 = !DILocation(line: 35, column: 5, scope: !30)
!40 = !DILocation(line: 36, column: 1, scope: !30)
!41 = distinct !DISubprogram(name: "printLine", scope: !9, file: !9, line: 38, type: !42, isLocal: false, isDefinition: true, scopeLine: 39, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!42 = !DISubroutineType(types: !43)
!43 = !{null, !44}
!44 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !45, size: 64, align: 64)
!45 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !33)
!46 = !DILocalVariable(name: "line", arg: 1, scope: !41, file: !9, line: 38, type: !44)
!47 = !DILocation(line: 38, column: 30, scope: !41)
!48 = !DILocation(line: 40, column: 8, scope: !49)
!49 = distinct !DILexicalBlock(scope: !41, file: !9, line: 40, column: 8)
!50 = !DILocation(line: 40, column: 13, scope: !49)
!51 = !DILocation(line: 40, column: 8, scope: !41)
!52 = !DILocation(line: 42, column: 24, scope: !53)
!53 = distinct !DILexicalBlock(scope: !49, file: !9, line: 41, column: 5)
!54 = !DILocation(line: 42, column: 9, scope: !53)
!55 = !DILocation(line: 43, column: 5, scope: !53)
!56 = !DILocation(line: 44, column: 1, scope: !41)
!57 = distinct !DISubprogram(name: "printIntLine", scope: !9, file: !9, line: 46, type: !58, isLocal: false, isDefinition: true, scopeLine: 47, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!58 = !DISubroutineType(types: !59)
!59 = !{null, !4}
!60 = !DILocalVariable(name: "intNumber", arg: 1, scope: !57, file: !9, line: 46, type: !4)
!61 = !DILocation(line: 46, column: 24, scope: !57)
!62 = !DILocation(line: 48, column: 20, scope: !57)
!63 = !DILocation(line: 48, column: 5, scope: !57)
!64 = !DILocation(line: 49, column: 1, scope: !57)
!65 = distinct !DISubprogram(name: "printLongLine", scope: !9, file: !9, line: 51, type: !66, isLocal: false, isDefinition: true, scopeLine: 52, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!66 = !DISubroutineType(types: !67)
!67 = !{null, !68}
!68 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !69, line: 197, baseType: !70)
!69 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/sys/types.h", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/415")
!70 = !DIBasicType(name: "long int", size: 64, align: 64, encoding: DW_ATE_signed)
!71 = !DILocalVariable(name: "longIntNumber", arg: 1, scope: !65, file: !9, line: 51, type: !68)
!72 = !DILocation(line: 51, column: 29, scope: !65)
!73 = !DILocation(line: 53, column: 21, scope: !65)
!74 = !DILocation(line: 53, column: 5, scope: !65)
!75 = !DILocation(line: 54, column: 1, scope: !65)
!76 = distinct !DISubprogram(name: "bad27", scope: !9, file: !9, line: 61, type: !77, isLocal: false, isDefinition: true, scopeLine: 62, isOptimized: false, unit: !0, variables: !2)
!77 = !DISubroutineType(types: !78)
!78 = !{null}
!79 = !DILocalVariable(name: "data", scope: !76, file: !9, line: 63, type: !6)
!80 = !DILocation(line: 63, column: 11, scope: !76)
!81 = !DILocation(line: 65, column: 10, scope: !76)
!82 = !DILocation(line: 66, column: 8, scope: !83)
!83 = distinct !DILexicalBlock(scope: !76, file: !9, line: 66, column: 8)
!84 = !DILocation(line: 66, column: 18, scope: !83)
!85 = !DILocation(line: 66, column: 8, scope: !76)
!86 = !DILocation(line: 68, column: 23, scope: !87)
!87 = distinct !DILexicalBlock(scope: !83, file: !9, line: 67, column: 5)
!88 = !DILocation(line: 68, column: 16, scope: !87)
!89 = !DILocation(line: 68, column: 14, scope: !87)
!90 = !DILocation(line: 69, column: 13, scope: !91)
!91 = distinct !DILexicalBlock(scope: !87, file: !9, line: 69, column: 13)
!92 = !DILocation(line: 69, column: 18, scope: !91)
!93 = !DILocation(line: 69, column: 13, scope: !87)
!94 = !DILocation(line: 69, column: 27, scope: !95)
!95 = !DILexicalBlockFile(scope: !91, file: !9, discriminator: 1)
!96 = !DILocation(line: 71, column: 14, scope: !87)
!97 = !DILocation(line: 71, column: 9, scope: !87)
!98 = !DILocation(line: 72, column: 5, scope: !87)
!99 = !DILocation(line: 73, column: 8, scope: !100)
!100 = distinct !DILexicalBlock(scope: !76, file: !9, line: 73, column: 8)
!101 = !DILocation(line: 73, column: 18, scope: !100)
!102 = !DILocation(line: 73, column: 8, scope: !76)
!103 = !DILocation(line: 76, column: 14, scope: !104)
!104 = distinct !DILexicalBlock(scope: !100, file: !9, line: 74, column: 5)
!105 = !DILocation(line: 76, column: 9, scope: !104)
!106 = !DILocation(line: 77, column: 5, scope: !104)
!107 = !DILocation(line: 78, column: 1, scope: !76)
!108 = distinct !DISubprogram(name: "good27", scope: !9, file: !9, line: 84, type: !77, isLocal: false, isDefinition: true, scopeLine: 85, isOptimized: false, unit: !0, variables: !2)
!109 = !DILocalVariable(name: "data", scope: !108, file: !9, line: 86, type: !6)
!110 = !DILocation(line: 86, column: 11, scope: !108)
!111 = !DILocation(line: 88, column: 10, scope: !108)
!112 = !DILocation(line: 89, column: 8, scope: !113)
!113 = distinct !DILexicalBlock(scope: !108, file: !9, line: 89, column: 8)
!114 = !DILocation(line: 89, column: 18, scope: !113)
!115 = !DILocation(line: 89, column: 8, scope: !108)
!116 = !DILocation(line: 91, column: 23, scope: !117)
!117 = distinct !DILexicalBlock(scope: !113, file: !9, line: 90, column: 5)
!118 = !DILocation(line: 91, column: 16, scope: !117)
!119 = !DILocation(line: 91, column: 14, scope: !117)
!120 = !DILocation(line: 92, column: 13, scope: !121)
!121 = distinct !DILexicalBlock(scope: !117, file: !9, line: 92, column: 13)
!122 = !DILocation(line: 92, column: 18, scope: !121)
!123 = !DILocation(line: 92, column: 13, scope: !117)
!124 = !DILocation(line: 92, column: 27, scope: !125)
!125 = !DILexicalBlockFile(scope: !121, file: !9, discriminator: 1)
!126 = !DILocation(line: 94, column: 14, scope: !117)
!127 = !DILocation(line: 94, column: 9, scope: !117)
!128 = !DILocation(line: 95, column: 5, scope: !117)
!129 = !DILocation(line: 96, column: 8, scope: !130)
!130 = distinct !DILexicalBlock(scope: !108, file: !9, line: 96, column: 8)
!131 = !DILocation(line: 96, column: 18, scope: !130)
!132 = !DILocation(line: 96, column: 8, scope: !108)
!133 = !DILocation(line: 99, column: 9, scope: !134)
!134 = distinct !DILexicalBlock(scope: !130, file: !9, line: 97, column: 5)
!135 = !DILocation(line: 100, column: 5, scope: !134)
!136 = !DILocation(line: 107, column: 1, scope: !108)
!137 = distinct !DISubprogram(name: "main", scope: !9, file: !9, line: 111, type: !21, isLocal: false, isDefinition: true, scopeLine: 111, isOptimized: false, unit: !0, variables: !2)
!138 = !DILocation(line: 112, column: 5, scope: !137)
!139 = !DILocation(line: 113, column: 2, scope: !137)
!140 = !DILocation(line: 114, column: 5, scope: !137)
