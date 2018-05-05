; ModuleID = './415_18.c'
source_filename = "./415_18.c"
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
define i32 @globalReturnsTrue() #0 !dbg !22 {
entry:
  ret i32 1, !dbg !25
}

; Function Attrs: nounwind uwtable
define i32 @globalReturnsFalse() #0 !dbg !26 {
entry:
  ret i32 0, !dbg !27
}

; Function Attrs: nounwind uwtable
define i32 @globalReturnsTrueOrFalse() #0 !dbg !28 {
entry:
  %call = call i32 @rand() #4, !dbg !29
  %rem = srem i32 %call, 2, !dbg !30
  ret i32 %rem, !dbg !31
}

; Function Attrs: nounwind
declare i32 @rand() #1

; Function Attrs: nounwind uwtable
define void @printHexCharLine(i8 signext %charHex) #0 !dbg !32 {
entry:
  %charHex.addr = alloca i8, align 1
  store i8 %charHex, i8* %charHex.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %charHex.addr, metadata !36, metadata !37), !dbg !38
  %0 = load i8, i8* %charHex.addr, align 1, !dbg !39
  %conv = sext i8 %0 to i32, !dbg !40
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), i32 %conv), !dbg !41
  ret void, !dbg !42
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #2

declare i32 @printf(i8*, ...) #3

; Function Attrs: nounwind uwtable
define void @printLine(i8* %line) #0 !dbg !43 {
entry:
  %line.addr = alloca i8*, align 8
  store i8* %line, i8** %line.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %line.addr, metadata !48, metadata !37), !dbg !49
  %0 = load i8*, i8** %line.addr, align 8, !dbg !50
  %cmp = icmp ne i8* %0, null, !dbg !52
  br i1 %cmp, label %if.then, label %if.end, !dbg !53

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** %line.addr, align 8, !dbg !54
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i32 0, i32 0), i8* %1), !dbg !56
  br label %if.end, !dbg !57

if.end:                                           ; preds = %if.then, %entry
  ret void, !dbg !58
}

; Function Attrs: nounwind uwtable
define void @printIntLine(i32 %intNumber) #0 !dbg !59 {
entry:
  %intNumber.addr = alloca i32, align 4
  store i32 %intNumber, i32* %intNumber.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %intNumber.addr, metadata !62, metadata !37), !dbg !63
  %0 = load i32, i32* %intNumber.addr, align 4, !dbg !64
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), i32 %0), !dbg !65
  ret void, !dbg !66
}

; Function Attrs: nounwind uwtable
define void @printLongLine(i64 %longIntNumber) #0 !dbg !67 {
entry:
  %longIntNumber.addr = alloca i64, align 8
  store i64 %longIntNumber, i64* %longIntNumber.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %longIntNumber.addr, metadata !70, metadata !37), !dbg !71
  %0 = load i64, i64* %longIntNumber.addr, align 8, !dbg !72
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.2, i32 0, i32 0), i64 %0), !dbg !73
  ret void, !dbg !74
}

; Function Attrs: nounwind uwtable
define void @bad18() #0 !dbg !75 {
entry:
  %data = alloca i64*, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !78, metadata !37), !dbg !79
  store i64* null, i64** %data, align 8, !dbg !80
  %call = call i32 @staticReturnsTrue(), !dbg !81
  %tobool = icmp ne i32 %call, 0, !dbg !81
  br i1 %tobool, label %if.then, label %if.end3, !dbg !83

if.then:                                          ; preds = %entry
  %call1 = call noalias i8* @malloc(i64 800) #4, !dbg !84
  %0 = bitcast i8* %call1 to i64*, !dbg !86
  store i64* %0, i64** %data, align 8, !dbg !87
  %1 = load i64*, i64** %data, align 8, !dbg !88
  %cmp = icmp eq i64* %1, null, !dbg !90
  br i1 %cmp, label %if.then2, label %if.end, !dbg !91

if.then2:                                         ; preds = %if.then
  br label %if.end7, !dbg !92

if.end:                                           ; preds = %if.then
  %2 = load i64*, i64** %data, align 8, !dbg !94
  %3 = bitcast i64* %2 to i8*, !dbg !94
  call void @free(i8* %3) #4, !dbg !95
  br label %if.end3, !dbg !96

if.end3:                                          ; preds = %if.end, %entry
  %call4 = call i32 @staticReturnsTrue(), !dbg !97
  %tobool5 = icmp ne i32 %call4, 0, !dbg !97
  br i1 %tobool5, label %if.then6, label %if.end7, !dbg !99

if.then6:                                         ; preds = %if.end3
  %4 = load i64*, i64** %data, align 8, !dbg !100
  %5 = bitcast i64* %4 to i8*, !dbg !100
  call void @free(i8* %5) #4, !dbg !102
  br label %if.end7, !dbg !103

if.end7:                                          ; preds = %if.then2, %if.then6, %if.end3
  ret void, !dbg !104
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #1

; Function Attrs: nounwind
declare void @free(i8*) #1

; Function Attrs: nounwind uwtable
define void @good18() #0 !dbg !105 {
entry:
  %data = alloca i64*, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !106, metadata !37), !dbg !107
  store i64* null, i64** %data, align 8, !dbg !108
  %call = call i32 @staticReturnsTrue(), !dbg !109
  %tobool = icmp ne i32 %call, 0, !dbg !109
  br i1 %tobool, label %if.then, label %if.end3, !dbg !111

if.then:                                          ; preds = %entry
  %call1 = call noalias i8* @malloc(i64 800) #4, !dbg !112
  %0 = bitcast i8* %call1 to i64*, !dbg !114
  store i64* %0, i64** %data, align 8, !dbg !115
  %1 = load i64*, i64** %data, align 8, !dbg !116
  %cmp = icmp eq i64* %1, null, !dbg !118
  br i1 %cmp, label %if.then2, label %if.end, !dbg !119

if.then2:                                         ; preds = %if.then
  br label %if.end7, !dbg !120

if.end:                                           ; preds = %if.then
  %2 = load i64*, i64** %data, align 8, !dbg !122
  %3 = bitcast i64* %2 to i8*, !dbg !122
  call void @free(i8* %3) #4, !dbg !123
  br label %if.end3, !dbg !124

if.end3:                                          ; preds = %if.end, %entry
  %call4 = call i32 @staticReturnsFalse(), !dbg !125
  %tobool5 = icmp ne i32 %call4, 0, !dbg !125
  br i1 %tobool5, label %if.then6, label %if.else, !dbg !127

if.then6:                                         ; preds = %if.end3
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.3, i32 0, i32 0)), !dbg !128
  br label %if.end7, !dbg !130

if.else:                                          ; preds = %if.end3
  br label %if.end7

if.end7:                                          ; preds = %if.then2, %if.else, %if.then6
  ret void, !dbg !131
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !132 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @good18(), !dbg !133
  call void @bad18(), !dbg !134
  ret i32 1, !dbg !135
}

; Function Attrs: nounwind uwtable
define internal i32 @staticReturnsTrue() #0 !dbg !136 {
entry:
  ret i32 1, !dbg !137
}

; Function Attrs: nounwind uwtable
define internal i32 @staticReturnsFalse() #0 !dbg !138 {
entry:
  ret i32 0, !dbg !139
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone }
attributes #3 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!19, !20}
!llvm.ident = !{!21}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (tags/RELEASE_390/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, globals: !10)
!1 = !DIFile(filename: "415_18.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/415")
!2 = !{}
!3 = !{!4, !5, !6}
!4 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64, align: 64)
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64, align: 64)
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !8, line: 197, baseType: !9)
!8 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/sys/types.h", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/415")
!9 = !DIBasicType(name: "long int", size: 64, align: 64, encoding: DW_ATE_signed)
!10 = !{!11, !14, !15, !16, !17, !18}
!11 = distinct !DIGlobalVariable(name: "GLOBAL_CONST_TRUE", scope: !0, file: !12, line: 10, type: !13, isLocal: false, isDefinition: true, variable: i32* @GLOBAL_CONST_TRUE)
!12 = !DIFile(filename: "./415_18.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/415")
!13 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !4)
!14 = distinct !DIGlobalVariable(name: "GLOBAL_CONST_FALSE", scope: !0, file: !12, line: 11, type: !13, isLocal: false, isDefinition: true, variable: i32* @GLOBAL_CONST_FALSE)
!15 = distinct !DIGlobalVariable(name: "GLOBAL_CONST_FIVE", scope: !0, file: !12, line: 12, type: !13, isLocal: false, isDefinition: true, variable: i32* @GLOBAL_CONST_FIVE)
!16 = distinct !DIGlobalVariable(name: "globalTrue", scope: !0, file: !12, line: 14, type: !4, isLocal: false, isDefinition: true, variable: i32* @globalTrue)
!17 = distinct !DIGlobalVariable(name: "globalFalse", scope: !0, file: !12, line: 15, type: !4, isLocal: false, isDefinition: true, variable: i32* @globalFalse)
!18 = distinct !DIGlobalVariable(name: "globalFive", scope: !0, file: !12, line: 16, type: !4, isLocal: false, isDefinition: true, variable: i32* @globalFive)
!19 = !{i32 2, !"Dwarf Version", i32 4}
!20 = !{i32 2, !"Debug Info Version", i32 3}
!21 = !{!"clang version 3.9.0 (tags/RELEASE_390/final)"}
!22 = distinct !DISubprogram(name: "globalReturnsTrue", scope: !12, file: !12, line: 18, type: !23, isLocal: false, isDefinition: true, scopeLine: 19, isOptimized: false, unit: !0, variables: !2)
!23 = !DISubroutineType(types: !24)
!24 = !{!4}
!25 = !DILocation(line: 20, column: 5, scope: !22)
!26 = distinct !DISubprogram(name: "globalReturnsFalse", scope: !12, file: !12, line: 23, type: !23, isLocal: false, isDefinition: true, scopeLine: 24, isOptimized: false, unit: !0, variables: !2)
!27 = !DILocation(line: 25, column: 5, scope: !26)
!28 = distinct !DISubprogram(name: "globalReturnsTrueOrFalse", scope: !12, file: !12, line: 28, type: !23, isLocal: false, isDefinition: true, scopeLine: 29, isOptimized: false, unit: !0, variables: !2)
!29 = !DILocation(line: 30, column: 13, scope: !28)
!30 = !DILocation(line: 30, column: 20, scope: !28)
!31 = !DILocation(line: 30, column: 5, scope: !28)
!32 = distinct !DISubprogram(name: "printHexCharLine", scope: !12, file: !12, line: 33, type: !33, isLocal: false, isDefinition: true, scopeLine: 34, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!33 = !DISubroutineType(types: !34)
!34 = !{null, !35}
!35 = !DIBasicType(name: "char", size: 8, align: 8, encoding: DW_ATE_signed_char)
!36 = !DILocalVariable(name: "charHex", arg: 1, scope: !32, file: !12, line: 33, type: !35)
!37 = !DIExpression()
!38 = !DILocation(line: 33, column: 29, scope: !32)
!39 = !DILocation(line: 35, column: 25, scope: !32)
!40 = !DILocation(line: 35, column: 20, scope: !32)
!41 = !DILocation(line: 35, column: 5, scope: !32)
!42 = !DILocation(line: 36, column: 1, scope: !32)
!43 = distinct !DISubprogram(name: "printLine", scope: !12, file: !12, line: 38, type: !44, isLocal: false, isDefinition: true, scopeLine: 39, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!44 = !DISubroutineType(types: !45)
!45 = !{null, !46}
!46 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !47, size: 64, align: 64)
!47 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !35)
!48 = !DILocalVariable(name: "line", arg: 1, scope: !43, file: !12, line: 38, type: !46)
!49 = !DILocation(line: 38, column: 30, scope: !43)
!50 = !DILocation(line: 40, column: 8, scope: !51)
!51 = distinct !DILexicalBlock(scope: !43, file: !12, line: 40, column: 8)
!52 = !DILocation(line: 40, column: 13, scope: !51)
!53 = !DILocation(line: 40, column: 8, scope: !43)
!54 = !DILocation(line: 42, column: 24, scope: !55)
!55 = distinct !DILexicalBlock(scope: !51, file: !12, line: 41, column: 5)
!56 = !DILocation(line: 42, column: 9, scope: !55)
!57 = !DILocation(line: 43, column: 5, scope: !55)
!58 = !DILocation(line: 44, column: 1, scope: !43)
!59 = distinct !DISubprogram(name: "printIntLine", scope: !12, file: !12, line: 46, type: !60, isLocal: false, isDefinition: true, scopeLine: 47, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!60 = !DISubroutineType(types: !61)
!61 = !{null, !4}
!62 = !DILocalVariable(name: "intNumber", arg: 1, scope: !59, file: !12, line: 46, type: !4)
!63 = !DILocation(line: 46, column: 24, scope: !59)
!64 = !DILocation(line: 48, column: 20, scope: !59)
!65 = !DILocation(line: 48, column: 5, scope: !59)
!66 = !DILocation(line: 49, column: 1, scope: !59)
!67 = distinct !DISubprogram(name: "printLongLine", scope: !12, file: !12, line: 51, type: !68, isLocal: false, isDefinition: true, scopeLine: 52, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!68 = !DISubroutineType(types: !69)
!69 = !{null, !7}
!70 = !DILocalVariable(name: "longIntNumber", arg: 1, scope: !67, file: !12, line: 51, type: !7)
!71 = !DILocation(line: 51, column: 29, scope: !67)
!72 = !DILocation(line: 53, column: 21, scope: !67)
!73 = !DILocation(line: 53, column: 5, scope: !67)
!74 = !DILocation(line: 54, column: 1, scope: !67)
!75 = distinct !DISubprogram(name: "bad18", scope: !12, file: !12, line: 69, type: !76, isLocal: false, isDefinition: true, scopeLine: 70, isOptimized: false, unit: !0, variables: !2)
!76 = !DISubroutineType(types: !77)
!77 = !{null}
!78 = !DILocalVariable(name: "data", scope: !75, file: !12, line: 71, type: !6)
!79 = !DILocation(line: 71, column: 15, scope: !75)
!80 = !DILocation(line: 73, column: 10, scope: !75)
!81 = !DILocation(line: 74, column: 8, scope: !82)
!82 = distinct !DILexicalBlock(scope: !75, file: !12, line: 74, column: 8)
!83 = !DILocation(line: 74, column: 8, scope: !75)
!84 = !DILocation(line: 76, column: 27, scope: !85)
!85 = distinct !DILexicalBlock(scope: !82, file: !12, line: 75, column: 5)
!86 = !DILocation(line: 76, column: 16, scope: !85)
!87 = !DILocation(line: 76, column: 14, scope: !85)
!88 = !DILocation(line: 77, column: 13, scope: !89)
!89 = distinct !DILexicalBlock(scope: !85, file: !12, line: 77, column: 13)
!90 = !DILocation(line: 77, column: 18, scope: !89)
!91 = !DILocation(line: 77, column: 13, scope: !85)
!92 = !DILocation(line: 77, column: 27, scope: !93)
!93 = !DILexicalBlockFile(scope: !89, file: !12, discriminator: 1)
!94 = !DILocation(line: 79, column: 14, scope: !85)
!95 = !DILocation(line: 79, column: 9, scope: !85)
!96 = !DILocation(line: 80, column: 5, scope: !85)
!97 = !DILocation(line: 81, column: 8, scope: !98)
!98 = distinct !DILexicalBlock(scope: !75, file: !12, line: 81, column: 8)
!99 = !DILocation(line: 81, column: 8, scope: !75)
!100 = !DILocation(line: 84, column: 14, scope: !101)
!101 = distinct !DILexicalBlock(scope: !98, file: !12, line: 82, column: 5)
!102 = !DILocation(line: 84, column: 9, scope: !101)
!103 = !DILocation(line: 85, column: 5, scope: !101)
!104 = !DILocation(line: 86, column: 1, scope: !75)
!105 = distinct !DISubprogram(name: "good18", scope: !12, file: !12, line: 92, type: !76, isLocal: false, isDefinition: true, scopeLine: 93, isOptimized: false, unit: !0, variables: !2)
!106 = !DILocalVariable(name: "data", scope: !105, file: !12, line: 94, type: !6)
!107 = !DILocation(line: 94, column: 15, scope: !105)
!108 = !DILocation(line: 96, column: 10, scope: !105)
!109 = !DILocation(line: 97, column: 8, scope: !110)
!110 = distinct !DILexicalBlock(scope: !105, file: !12, line: 97, column: 8)
!111 = !DILocation(line: 97, column: 8, scope: !105)
!112 = !DILocation(line: 99, column: 27, scope: !113)
!113 = distinct !DILexicalBlock(scope: !110, file: !12, line: 98, column: 5)
!114 = !DILocation(line: 99, column: 16, scope: !113)
!115 = !DILocation(line: 99, column: 14, scope: !113)
!116 = !DILocation(line: 100, column: 13, scope: !117)
!117 = distinct !DILexicalBlock(scope: !113, file: !12, line: 100, column: 13)
!118 = !DILocation(line: 100, column: 18, scope: !117)
!119 = !DILocation(line: 100, column: 13, scope: !113)
!120 = !DILocation(line: 100, column: 27, scope: !121)
!121 = !DILexicalBlockFile(scope: !117, file: !12, discriminator: 1)
!122 = !DILocation(line: 102, column: 14, scope: !113)
!123 = !DILocation(line: 102, column: 9, scope: !113)
!124 = !DILocation(line: 103, column: 5, scope: !113)
!125 = !DILocation(line: 104, column: 8, scope: !126)
!126 = distinct !DILexicalBlock(scope: !105, file: !12, line: 104, column: 8)
!127 = !DILocation(line: 104, column: 8, scope: !105)
!128 = !DILocation(line: 107, column: 9, scope: !129)
!129 = distinct !DILexicalBlock(scope: !126, file: !12, line: 105, column: 5)
!130 = !DILocation(line: 108, column: 5, scope: !129)
!131 = !DILocation(line: 115, column: 1, scope: !105)
!132 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 119, type: !23, isLocal: false, isDefinition: true, scopeLine: 119, isOptimized: false, unit: !0, variables: !2)
!133 = !DILocation(line: 120, column: 2, scope: !132)
!134 = !DILocation(line: 121, column: 5, scope: !132)
!135 = !DILocation(line: 122, column: 5, scope: !132)
!136 = distinct !DISubprogram(name: "staticReturnsTrue", scope: !12, file: !12, line: 57, type: !23, isLocal: true, isDefinition: true, scopeLine: 58, isOptimized: false, unit: !0, variables: !2)
!137 = !DILocation(line: 59, column: 5, scope: !136)
!138 = distinct !DISubprogram(name: "staticReturnsFalse", scope: !12, file: !12, line: 62, type: !23, isLocal: true, isDefinition: true, scopeLine: 63, isOptimized: false, unit: !0, variables: !2)
!139 = !DILocation(line: 64, column: 5, scope: !138)
