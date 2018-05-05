; ModuleID = './415_8.c'
source_filename = "./415_8.c"
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
  call void @llvm.dbg.declare(metadata i8* %charHex.addr, metadata !33, metadata !34), !dbg !35
  %0 = load i8, i8* %charHex.addr, align 1, !dbg !36
  %conv = sext i8 %0 to i32, !dbg !37
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), i32 %conv), !dbg !38
  ret void, !dbg !39
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #2

declare i32 @printf(i8*, ...) #3

; Function Attrs: nounwind uwtable
define void @printLine(i8* %line) #0 !dbg !40 {
entry:
  %line.addr = alloca i8*, align 8
  store i8* %line, i8** %line.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %line.addr, metadata !45, metadata !34), !dbg !46
  %0 = load i8*, i8** %line.addr, align 8, !dbg !47
  %cmp = icmp ne i8* %0, null, !dbg !49
  br i1 %cmp, label %if.then, label %if.end, !dbg !50

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** %line.addr, align 8, !dbg !51
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i32 0, i32 0), i8* %1), !dbg !53
  br label %if.end, !dbg !54

if.end:                                           ; preds = %if.then, %entry
  ret void, !dbg !55
}

; Function Attrs: nounwind uwtable
define void @printIntLine(i32 %intNumber) #0 !dbg !56 {
entry:
  %intNumber.addr = alloca i32, align 4
  store i32 %intNumber, i32* %intNumber.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %intNumber.addr, metadata !59, metadata !34), !dbg !60
  %0 = load i32, i32* %intNumber.addr, align 4, !dbg !61
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), i32 %0), !dbg !62
  ret void, !dbg !63
}

; Function Attrs: nounwind uwtable
define void @printLongLine(i64 %longIntNumber) #0 !dbg !64 {
entry:
  %longIntNumber.addr = alloca i64, align 8
  store i64 %longIntNumber, i64* %longIntNumber.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %longIntNumber.addr, metadata !70, metadata !34), !dbg !71
  %0 = load i64, i64* %longIntNumber.addr, align 8, !dbg !72
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.2, i32 0, i32 0), i64 %0), !dbg !73
  ret void, !dbg !74
}

; Function Attrs: nounwind uwtable
define void @bad8() #0 !dbg !75 {
entry:
  %data = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !78, metadata !34), !dbg !79
  store i8* null, i8** %data, align 8, !dbg !80
  %call = call i32 @staticReturnsTrue(), !dbg !81
  %tobool = icmp ne i32 %call, 0, !dbg !81
  br i1 %tobool, label %if.then, label %if.end3, !dbg !83

if.then:                                          ; preds = %entry
  %call1 = call noalias i8* @malloc(i64 100) #4, !dbg !84
  store i8* %call1, i8** %data, align 8, !dbg !86
  %0 = load i8*, i8** %data, align 8, !dbg !87
  %cmp = icmp eq i8* %0, null, !dbg !89
  br i1 %cmp, label %if.then2, label %if.end, !dbg !90

if.then2:                                         ; preds = %if.then
  br label %if.end7, !dbg !91

if.end:                                           ; preds = %if.then
  %1 = load i8*, i8** %data, align 8, !dbg !93
  call void @free(i8* %1) #4, !dbg !94
  br label %if.end3, !dbg !95

if.end3:                                          ; preds = %if.end, %entry
  %call4 = call i32 @staticReturnsTrue(), !dbg !96
  %tobool5 = icmp ne i32 %call4, 0, !dbg !96
  br i1 %tobool5, label %if.then6, label %if.end7, !dbg !98

if.then6:                                         ; preds = %if.end3
  %2 = load i8*, i8** %data, align 8, !dbg !99
  call void @free(i8* %2) #4, !dbg !101
  br label %if.end7, !dbg !102

if.end7:                                          ; preds = %if.then2, %if.then6, %if.end3
  ret void, !dbg !103
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #1

; Function Attrs: nounwind
declare void @free(i8*) #1

; Function Attrs: nounwind uwtable
define void @good8() #0 !dbg !104 {
entry:
  %data = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !105, metadata !34), !dbg !106
  store i8* null, i8** %data, align 8, !dbg !107
  %call = call i32 @staticReturnsTrue(), !dbg !108
  %tobool = icmp ne i32 %call, 0, !dbg !108
  br i1 %tobool, label %if.then, label %if.end3, !dbg !110

if.then:                                          ; preds = %entry
  %call1 = call noalias i8* @malloc(i64 100) #4, !dbg !111
  store i8* %call1, i8** %data, align 8, !dbg !113
  %0 = load i8*, i8** %data, align 8, !dbg !114
  %cmp = icmp eq i8* %0, null, !dbg !116
  br i1 %cmp, label %if.then2, label %if.end, !dbg !117

if.then2:                                         ; preds = %if.then
  br label %if.end7, !dbg !118

if.end:                                           ; preds = %if.then
  %1 = load i8*, i8** %data, align 8, !dbg !120
  call void @free(i8* %1) #4, !dbg !121
  br label %if.end3, !dbg !122

if.end3:                                          ; preds = %if.end, %entry
  %call4 = call i32 @staticReturnsFalse(), !dbg !123
  %tobool5 = icmp ne i32 %call4, 0, !dbg !123
  br i1 %tobool5, label %if.then6, label %if.else, !dbg !125

if.then6:                                         ; preds = %if.end3
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.3, i32 0, i32 0)), !dbg !126
  br label %if.end7, !dbg !128

if.else:                                          ; preds = %if.end3
  br label %if.end7

if.end7:                                          ; preds = %if.then2, %if.else, %if.then6
  ret void, !dbg !129
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !130 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @good8(), !dbg !131
  call void @bad8(), !dbg !132
  ret i32 1, !dbg !133
}

; Function Attrs: nounwind uwtable
define internal i32 @staticReturnsTrue() #0 !dbg !134 {
entry:
  ret i32 1, !dbg !135
}

; Function Attrs: nounwind uwtable
define internal i32 @staticReturnsFalse() #0 !dbg !136 {
entry:
  ret i32 0, !dbg !137
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone }
attributes #3 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!17, !18}
!llvm.ident = !{!19}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (tags/RELEASE_390/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, globals: !8)
!1 = !DIFile(filename: "415_8.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/415")
!2 = !{}
!3 = !{!4, !5, !6}
!4 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64, align: 64)
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64, align: 64)
!7 = !DIBasicType(name: "char", size: 8, align: 8, encoding: DW_ATE_signed_char)
!8 = !{!9, !12, !13, !14, !15, !16}
!9 = distinct !DIGlobalVariable(name: "GLOBAL_CONST_TRUE", scope: !0, file: !10, line: 10, type: !11, isLocal: false, isDefinition: true, variable: i32* @GLOBAL_CONST_TRUE)
!10 = !DIFile(filename: "./415_8.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/415")
!11 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !4)
!12 = distinct !DIGlobalVariable(name: "GLOBAL_CONST_FALSE", scope: !0, file: !10, line: 11, type: !11, isLocal: false, isDefinition: true, variable: i32* @GLOBAL_CONST_FALSE)
!13 = distinct !DIGlobalVariable(name: "GLOBAL_CONST_FIVE", scope: !0, file: !10, line: 12, type: !11, isLocal: false, isDefinition: true, variable: i32* @GLOBAL_CONST_FIVE)
!14 = distinct !DIGlobalVariable(name: "globalTrue", scope: !0, file: !10, line: 14, type: !4, isLocal: false, isDefinition: true, variable: i32* @globalTrue)
!15 = distinct !DIGlobalVariable(name: "globalFalse", scope: !0, file: !10, line: 15, type: !4, isLocal: false, isDefinition: true, variable: i32* @globalFalse)
!16 = distinct !DIGlobalVariable(name: "globalFive", scope: !0, file: !10, line: 16, type: !4, isLocal: false, isDefinition: true, variable: i32* @globalFive)
!17 = !{i32 2, !"Dwarf Version", i32 4}
!18 = !{i32 2, !"Debug Info Version", i32 3}
!19 = !{!"clang version 3.9.0 (tags/RELEASE_390/final)"}
!20 = distinct !DISubprogram(name: "globalReturnsTrue", scope: !10, file: !10, line: 18, type: !21, isLocal: false, isDefinition: true, scopeLine: 19, isOptimized: false, unit: !0, variables: !2)
!21 = !DISubroutineType(types: !22)
!22 = !{!4}
!23 = !DILocation(line: 20, column: 5, scope: !20)
!24 = distinct !DISubprogram(name: "globalReturnsFalse", scope: !10, file: !10, line: 23, type: !21, isLocal: false, isDefinition: true, scopeLine: 24, isOptimized: false, unit: !0, variables: !2)
!25 = !DILocation(line: 25, column: 5, scope: !24)
!26 = distinct !DISubprogram(name: "globalReturnsTrueOrFalse", scope: !10, file: !10, line: 28, type: !21, isLocal: false, isDefinition: true, scopeLine: 29, isOptimized: false, unit: !0, variables: !2)
!27 = !DILocation(line: 30, column: 13, scope: !26)
!28 = !DILocation(line: 30, column: 20, scope: !26)
!29 = !DILocation(line: 30, column: 5, scope: !26)
!30 = distinct !DISubprogram(name: "printHexCharLine", scope: !10, file: !10, line: 33, type: !31, isLocal: false, isDefinition: true, scopeLine: 34, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!31 = !DISubroutineType(types: !32)
!32 = !{null, !7}
!33 = !DILocalVariable(name: "charHex", arg: 1, scope: !30, file: !10, line: 33, type: !7)
!34 = !DIExpression()
!35 = !DILocation(line: 33, column: 29, scope: !30)
!36 = !DILocation(line: 35, column: 25, scope: !30)
!37 = !DILocation(line: 35, column: 20, scope: !30)
!38 = !DILocation(line: 35, column: 5, scope: !30)
!39 = !DILocation(line: 36, column: 1, scope: !30)
!40 = distinct !DISubprogram(name: "printLine", scope: !10, file: !10, line: 38, type: !41, isLocal: false, isDefinition: true, scopeLine: 39, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!41 = !DISubroutineType(types: !42)
!42 = !{null, !43}
!43 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !44, size: 64, align: 64)
!44 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !7)
!45 = !DILocalVariable(name: "line", arg: 1, scope: !40, file: !10, line: 38, type: !43)
!46 = !DILocation(line: 38, column: 30, scope: !40)
!47 = !DILocation(line: 40, column: 8, scope: !48)
!48 = distinct !DILexicalBlock(scope: !40, file: !10, line: 40, column: 8)
!49 = !DILocation(line: 40, column: 13, scope: !48)
!50 = !DILocation(line: 40, column: 8, scope: !40)
!51 = !DILocation(line: 42, column: 24, scope: !52)
!52 = distinct !DILexicalBlock(scope: !48, file: !10, line: 41, column: 5)
!53 = !DILocation(line: 42, column: 9, scope: !52)
!54 = !DILocation(line: 43, column: 5, scope: !52)
!55 = !DILocation(line: 44, column: 1, scope: !40)
!56 = distinct !DISubprogram(name: "printIntLine", scope: !10, file: !10, line: 46, type: !57, isLocal: false, isDefinition: true, scopeLine: 47, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!57 = !DISubroutineType(types: !58)
!58 = !{null, !4}
!59 = !DILocalVariable(name: "intNumber", arg: 1, scope: !56, file: !10, line: 46, type: !4)
!60 = !DILocation(line: 46, column: 24, scope: !56)
!61 = !DILocation(line: 48, column: 20, scope: !56)
!62 = !DILocation(line: 48, column: 5, scope: !56)
!63 = !DILocation(line: 49, column: 1, scope: !56)
!64 = distinct !DISubprogram(name: "printLongLine", scope: !10, file: !10, line: 51, type: !65, isLocal: false, isDefinition: true, scopeLine: 52, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!65 = !DISubroutineType(types: !66)
!66 = !{null, !67}
!67 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !68, line: 197, baseType: !69)
!68 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/sys/types.h", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/415")
!69 = !DIBasicType(name: "long int", size: 64, align: 64, encoding: DW_ATE_signed)
!70 = !DILocalVariable(name: "longIntNumber", arg: 1, scope: !64, file: !10, line: 51, type: !67)
!71 = !DILocation(line: 51, column: 29, scope: !64)
!72 = !DILocation(line: 53, column: 21, scope: !64)
!73 = !DILocation(line: 53, column: 5, scope: !64)
!74 = !DILocation(line: 54, column: 1, scope: !64)
!75 = distinct !DISubprogram(name: "bad8", scope: !10, file: !10, line: 69, type: !76, isLocal: false, isDefinition: true, scopeLine: 70, isOptimized: false, unit: !0, variables: !2)
!76 = !DISubroutineType(types: !77)
!77 = !{null}
!78 = !DILocalVariable(name: "data", scope: !75, file: !10, line: 71, type: !6)
!79 = !DILocation(line: 71, column: 12, scope: !75)
!80 = !DILocation(line: 73, column: 10, scope: !75)
!81 = !DILocation(line: 74, column: 8, scope: !82)
!82 = distinct !DILexicalBlock(scope: !75, file: !10, line: 74, column: 8)
!83 = !DILocation(line: 74, column: 8, scope: !75)
!84 = !DILocation(line: 76, column: 24, scope: !85)
!85 = distinct !DILexicalBlock(scope: !82, file: !10, line: 75, column: 5)
!86 = !DILocation(line: 76, column: 14, scope: !85)
!87 = !DILocation(line: 78, column: 13, scope: !88)
!88 = distinct !DILexicalBlock(scope: !85, file: !10, line: 78, column: 13)
!89 = !DILocation(line: 78, column: 18, scope: !88)
!90 = !DILocation(line: 78, column: 13, scope: !85)
!91 = !DILocation(line: 78, column: 27, scope: !92)
!92 = !DILexicalBlockFile(scope: !88, file: !10, discriminator: 1)
!93 = !DILocation(line: 79, column: 14, scope: !85)
!94 = !DILocation(line: 79, column: 9, scope: !85)
!95 = !DILocation(line: 80, column: 5, scope: !85)
!96 = !DILocation(line: 81, column: 8, scope: !97)
!97 = distinct !DILexicalBlock(scope: !75, file: !10, line: 81, column: 8)
!98 = !DILocation(line: 81, column: 8, scope: !75)
!99 = !DILocation(line: 84, column: 14, scope: !100)
!100 = distinct !DILexicalBlock(scope: !97, file: !10, line: 82, column: 5)
!101 = !DILocation(line: 84, column: 9, scope: !100)
!102 = !DILocation(line: 85, column: 5, scope: !100)
!103 = !DILocation(line: 86, column: 1, scope: !75)
!104 = distinct !DISubprogram(name: "good8", scope: !10, file: !10, line: 92, type: !76, isLocal: false, isDefinition: true, scopeLine: 93, isOptimized: false, unit: !0, variables: !2)
!105 = !DILocalVariable(name: "data", scope: !104, file: !10, line: 94, type: !6)
!106 = !DILocation(line: 94, column: 12, scope: !104)
!107 = !DILocation(line: 96, column: 10, scope: !104)
!108 = !DILocation(line: 97, column: 8, scope: !109)
!109 = distinct !DILexicalBlock(scope: !104, file: !10, line: 97, column: 8)
!110 = !DILocation(line: 97, column: 8, scope: !104)
!111 = !DILocation(line: 99, column: 24, scope: !112)
!112 = distinct !DILexicalBlock(scope: !109, file: !10, line: 98, column: 5)
!113 = !DILocation(line: 99, column: 14, scope: !112)
!114 = !DILocation(line: 101, column: 13, scope: !115)
!115 = distinct !DILexicalBlock(scope: !112, file: !10, line: 101, column: 13)
!116 = !DILocation(line: 101, column: 18, scope: !115)
!117 = !DILocation(line: 101, column: 13, scope: !112)
!118 = !DILocation(line: 101, column: 27, scope: !119)
!119 = !DILexicalBlockFile(scope: !115, file: !10, discriminator: 1)
!120 = !DILocation(line: 102, column: 14, scope: !112)
!121 = !DILocation(line: 102, column: 9, scope: !112)
!122 = !DILocation(line: 103, column: 5, scope: !112)
!123 = !DILocation(line: 104, column: 8, scope: !124)
!124 = distinct !DILexicalBlock(scope: !104, file: !10, line: 104, column: 8)
!125 = !DILocation(line: 104, column: 8, scope: !104)
!126 = !DILocation(line: 107, column: 9, scope: !127)
!127 = distinct !DILexicalBlock(scope: !124, file: !10, line: 105, column: 5)
!128 = !DILocation(line: 108, column: 5, scope: !127)
!129 = !DILocation(line: 115, column: 1, scope: !104)
!130 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 119, type: !21, isLocal: false, isDefinition: true, scopeLine: 119, isOptimized: false, unit: !0, variables: !2)
!131 = !DILocation(line: 120, column: 5, scope: !130)
!132 = !DILocation(line: 121, column: 2, scope: !130)
!133 = !DILocation(line: 122, column: 5, scope: !130)
!134 = distinct !DISubprogram(name: "staticReturnsTrue", scope: !10, file: !10, line: 57, type: !21, isLocal: true, isDefinition: true, scopeLine: 58, isOptimized: false, unit: !0, variables: !2)
!135 = !DILocation(line: 59, column: 5, scope: !134)
!136 = distinct !DISubprogram(name: "staticReturnsFalse", scope: !10, file: !10, line: 62, type: !21, isLocal: true, isDefinition: true, scopeLine: 63, isOptimized: false, unit: !0, variables: !2)
!137 = !DILocation(line: 64, column: 5, scope: !136)
