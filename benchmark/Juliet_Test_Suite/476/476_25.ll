; ModuleID = './476_25.c'
source_filename = "./476_25.c"
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
@.str.4 = private unnamed_addr constant [13 x i8] c"data is NULL\00", align 1

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
define void @printHexCharLine(i8 signext %charHex) #0 !dbg !29 {
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
define void @bad25() #0 !dbg !75 {
entry:
  %data = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !78, metadata !34), !dbg !80
  %0 = load i32, i32* @staticFive, align 4, !dbg !81
  %cmp = icmp eq i32 %0, 5, !dbg !83
  br i1 %cmp, label %if.then, label %if.end, !dbg !84

if.then:                                          ; preds = %entry
  store i32* null, i32** %data, align 8, !dbg !85
  br label %if.end, !dbg !87

if.end:                                           ; preds = %if.then, %entry
  %1 = load i32, i32* @staticFive, align 4, !dbg !88
  %cmp1 = icmp eq i32 %1, 5, !dbg !90
  br i1 %cmp1, label %if.then2, label %if.end3, !dbg !91

if.then2:                                         ; preds = %if.end
  %2 = load i32*, i32** %data, align 8, !dbg !92
  %3 = load i32, i32* %2, align 4, !dbg !94
  call void @printIntLine(i32 %3), !dbg !95
  br label %if.end3, !dbg !96

if.end3:                                          ; preds = %if.then2, %if.end
  ret void, !dbg !97
}

; Function Attrs: nounwind uwtable
define void @good25() #0 !dbg !98 {
entry:
  %data = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !99, metadata !34), !dbg !100
  %0 = load i32, i32* @staticFive, align 4, !dbg !101
  %cmp = icmp eq i32 %0, 5, !dbg !103
  br i1 %cmp, label %if.then, label %if.end, !dbg !104

if.then:                                          ; preds = %entry
  store i32* null, i32** %data, align 8, !dbg !105
  br label %if.end, !dbg !107

if.end:                                           ; preds = %if.then, %entry
  %1 = load i32, i32* @staticFive, align 4, !dbg !108
  %cmp1 = icmp ne i32 %1, 5, !dbg !110
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !111

if.then2:                                         ; preds = %if.end
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.3, i32 0, i32 0)), !dbg !112
  br label %if.end7, !dbg !114

if.else:                                          ; preds = %if.end
  %2 = load i32*, i32** %data, align 8, !dbg !115
  %cmp3 = icmp ne i32* %2, null, !dbg !118
  br i1 %cmp3, label %if.then4, label %if.else5, !dbg !119

if.then4:                                         ; preds = %if.else
  %3 = load i32*, i32** %data, align 8, !dbg !120
  %4 = load i32, i32* %3, align 4, !dbg !122
  call void @printIntLine(i32 %4), !dbg !123
  br label %if.end6, !dbg !124

if.else5:                                         ; preds = %if.else
  call void @printLine(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.4, i32 0, i32 0)), !dbg !125
  br label %if.end6

if.end6:                                          ; preds = %if.else5, %if.then4
  br label %if.end7

if.end7:                                          ; preds = %if.end6, %if.then2
  ret void, !dbg !127
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !128 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @good25(), !dbg !129
  call void @bad25(), !dbg !130
  ret i32 1, !dbg !131
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone }
attributes #3 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!16, !17}
!llvm.ident = !{!18}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (tags/RELEASE_390/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, globals: !6)
!1 = !DIFile(filename: "476_25.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/476")
!2 = !{}
!3 = !{!4, !5}
!4 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64, align: 64)
!6 = !{!7, !10, !11, !12, !13, !14, !15}
!7 = distinct !DIGlobalVariable(name: "GLOBAL_CONST_TRUE", scope: !0, file: !8, line: 10, type: !9, isLocal: false, isDefinition: true, variable: i32* @GLOBAL_CONST_TRUE)
!8 = !DIFile(filename: "./476_25.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/476")
!9 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !4)
!10 = distinct !DIGlobalVariable(name: "GLOBAL_CONST_FALSE", scope: !0, file: !8, line: 11, type: !9, isLocal: false, isDefinition: true, variable: i32* @GLOBAL_CONST_FALSE)
!11 = distinct !DIGlobalVariable(name: "GLOBAL_CONST_FIVE", scope: !0, file: !8, line: 12, type: !9, isLocal: false, isDefinition: true, variable: i32* @GLOBAL_CONST_FIVE)
!12 = distinct !DIGlobalVariable(name: "globalTrue", scope: !0, file: !8, line: 14, type: !4, isLocal: false, isDefinition: true, variable: i32* @globalTrue)
!13 = distinct !DIGlobalVariable(name: "globalFalse", scope: !0, file: !8, line: 15, type: !4, isLocal: false, isDefinition: true, variable: i32* @globalFalse)
!14 = distinct !DIGlobalVariable(name: "globalFive", scope: !0, file: !8, line: 16, type: !4, isLocal: false, isDefinition: true, variable: i32* @globalFive)
!15 = distinct !DIGlobalVariable(name: "staticFive", scope: !0, file: !8, line: 57, type: !4, isLocal: true, isDefinition: true, variable: i32* @staticFive)
!16 = !{i32 2, !"Dwarf Version", i32 4}
!17 = !{i32 2, !"Debug Info Version", i32 3}
!18 = !{!"clang version 3.9.0 (tags/RELEASE_390/final)"}
!19 = distinct !DISubprogram(name: "globalReturnsTrue", scope: !8, file: !8, line: 18, type: !20, isLocal: false, isDefinition: true, scopeLine: 19, isOptimized: false, unit: !0, variables: !2)
!20 = !DISubroutineType(types: !21)
!21 = !{!4}
!22 = !DILocation(line: 20, column: 5, scope: !19)
!23 = distinct !DISubprogram(name: "globalReturnsFalse", scope: !8, file: !8, line: 23, type: !20, isLocal: false, isDefinition: true, scopeLine: 24, isOptimized: false, unit: !0, variables: !2)
!24 = !DILocation(line: 25, column: 5, scope: !23)
!25 = distinct !DISubprogram(name: "globalReturnsTrueOrFalse", scope: !8, file: !8, line: 28, type: !20, isLocal: false, isDefinition: true, scopeLine: 29, isOptimized: false, unit: !0, variables: !2)
!26 = !DILocation(line: 30, column: 13, scope: !25)
!27 = !DILocation(line: 30, column: 20, scope: !25)
!28 = !DILocation(line: 30, column: 5, scope: !25)
!29 = distinct !DISubprogram(name: "printHexCharLine", scope: !8, file: !8, line: 33, type: !30, isLocal: false, isDefinition: true, scopeLine: 34, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!30 = !DISubroutineType(types: !31)
!31 = !{null, !32}
!32 = !DIBasicType(name: "char", size: 8, align: 8, encoding: DW_ATE_signed_char)
!33 = !DILocalVariable(name: "charHex", arg: 1, scope: !29, file: !8, line: 33, type: !32)
!34 = !DIExpression()
!35 = !DILocation(line: 33, column: 29, scope: !29)
!36 = !DILocation(line: 35, column: 25, scope: !29)
!37 = !DILocation(line: 35, column: 20, scope: !29)
!38 = !DILocation(line: 35, column: 5, scope: !29)
!39 = !DILocation(line: 36, column: 1, scope: !29)
!40 = distinct !DISubprogram(name: "printLine", scope: !8, file: !8, line: 38, type: !41, isLocal: false, isDefinition: true, scopeLine: 39, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!41 = !DISubroutineType(types: !42)
!42 = !{null, !43}
!43 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !44, size: 64, align: 64)
!44 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !32)
!45 = !DILocalVariable(name: "line", arg: 1, scope: !40, file: !8, line: 38, type: !43)
!46 = !DILocation(line: 38, column: 30, scope: !40)
!47 = !DILocation(line: 40, column: 8, scope: !48)
!48 = distinct !DILexicalBlock(scope: !40, file: !8, line: 40, column: 8)
!49 = !DILocation(line: 40, column: 13, scope: !48)
!50 = !DILocation(line: 40, column: 8, scope: !40)
!51 = !DILocation(line: 42, column: 24, scope: !52)
!52 = distinct !DILexicalBlock(scope: !48, file: !8, line: 41, column: 5)
!53 = !DILocation(line: 42, column: 9, scope: !52)
!54 = !DILocation(line: 43, column: 5, scope: !52)
!55 = !DILocation(line: 44, column: 1, scope: !40)
!56 = distinct !DISubprogram(name: "printIntLine", scope: !8, file: !8, line: 46, type: !57, isLocal: false, isDefinition: true, scopeLine: 47, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!57 = !DISubroutineType(types: !58)
!58 = !{null, !4}
!59 = !DILocalVariable(name: "intNumber", arg: 1, scope: !56, file: !8, line: 46, type: !4)
!60 = !DILocation(line: 46, column: 24, scope: !56)
!61 = !DILocation(line: 48, column: 20, scope: !56)
!62 = !DILocation(line: 48, column: 5, scope: !56)
!63 = !DILocation(line: 49, column: 1, scope: !56)
!64 = distinct !DISubprogram(name: "printLongLine", scope: !8, file: !8, line: 51, type: !65, isLocal: false, isDefinition: true, scopeLine: 52, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!65 = !DISubroutineType(types: !66)
!66 = !{null, !67}
!67 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !68, line: 197, baseType: !69)
!68 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/sys/types.h", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/476")
!69 = !DIBasicType(name: "long int", size: 64, align: 64, encoding: DW_ATE_signed)
!70 = !DILocalVariable(name: "longIntNumber", arg: 1, scope: !64, file: !8, line: 51, type: !67)
!71 = !DILocation(line: 51, column: 29, scope: !64)
!72 = !DILocation(line: 53, column: 21, scope: !64)
!73 = !DILocation(line: 53, column: 5, scope: !64)
!74 = !DILocation(line: 54, column: 1, scope: !64)
!75 = distinct !DISubprogram(name: "bad25", scope: !8, file: !8, line: 61, type: !76, isLocal: false, isDefinition: true, scopeLine: 62, isOptimized: false, unit: !0, variables: !2)
!76 = !DISubroutineType(types: !77)
!77 = !{null}
!78 = !DILocalVariable(name: "data", scope: !75, file: !8, line: 63, type: !79)
!79 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64, align: 64)
!80 = !DILocation(line: 63, column: 11, scope: !75)
!81 = !DILocation(line: 64, column: 8, scope: !82)
!82 = distinct !DILexicalBlock(scope: !75, file: !8, line: 64, column: 8)
!83 = !DILocation(line: 64, column: 18, scope: !82)
!84 = !DILocation(line: 64, column: 8, scope: !75)
!85 = !DILocation(line: 67, column: 14, scope: !86)
!86 = distinct !DILexicalBlock(scope: !82, file: !8, line: 65, column: 5)
!87 = !DILocation(line: 68, column: 5, scope: !86)
!88 = !DILocation(line: 69, column: 8, scope: !89)
!89 = distinct !DILexicalBlock(scope: !75, file: !8, line: 69, column: 8)
!90 = !DILocation(line: 69, column: 18, scope: !89)
!91 = !DILocation(line: 69, column: 8, scope: !75)
!92 = !DILocation(line: 72, column: 23, scope: !93)
!93 = distinct !DILexicalBlock(scope: !89, file: !8, line: 70, column: 5)
!94 = !DILocation(line: 72, column: 22, scope: !93)
!95 = !DILocation(line: 72, column: 9, scope: !93)
!96 = !DILocation(line: 73, column: 5, scope: !93)
!97 = !DILocation(line: 74, column: 1, scope: !75)
!98 = distinct !DISubprogram(name: "good25", scope: !8, file: !8, line: 80, type: !76, isLocal: false, isDefinition: true, scopeLine: 81, isOptimized: false, unit: !0, variables: !2)
!99 = !DILocalVariable(name: "data", scope: !98, file: !8, line: 82, type: !79)
!100 = !DILocation(line: 82, column: 11, scope: !98)
!101 = !DILocation(line: 83, column: 8, scope: !102)
!102 = distinct !DILexicalBlock(scope: !98, file: !8, line: 83, column: 8)
!103 = !DILocation(line: 83, column: 18, scope: !102)
!104 = !DILocation(line: 83, column: 8, scope: !98)
!105 = !DILocation(line: 86, column: 14, scope: !106)
!106 = distinct !DILexicalBlock(scope: !102, file: !8, line: 84, column: 5)
!107 = !DILocation(line: 87, column: 5, scope: !106)
!108 = !DILocation(line: 88, column: 8, scope: !109)
!109 = distinct !DILexicalBlock(scope: !98, file: !8, line: 88, column: 8)
!110 = !DILocation(line: 88, column: 18, scope: !109)
!111 = !DILocation(line: 88, column: 8, scope: !98)
!112 = !DILocation(line: 91, column: 9, scope: !113)
!113 = distinct !DILexicalBlock(scope: !109, file: !8, line: 89, column: 5)
!114 = !DILocation(line: 92, column: 5, scope: !113)
!115 = !DILocation(line: 96, column: 13, scope: !116)
!116 = distinct !DILexicalBlock(scope: !117, file: !8, line: 96, column: 13)
!117 = distinct !DILexicalBlock(scope: !109, file: !8, line: 94, column: 5)
!118 = !DILocation(line: 96, column: 18, scope: !116)
!119 = !DILocation(line: 96, column: 13, scope: !117)
!120 = !DILocation(line: 98, column: 27, scope: !121)
!121 = distinct !DILexicalBlock(scope: !116, file: !8, line: 97, column: 9)
!122 = !DILocation(line: 98, column: 26, scope: !121)
!123 = !DILocation(line: 98, column: 13, scope: !121)
!124 = !DILocation(line: 99, column: 9, scope: !121)
!125 = !DILocation(line: 102, column: 13, scope: !126)
!126 = distinct !DILexicalBlock(scope: !116, file: !8, line: 101, column: 9)
!127 = !DILocation(line: 105, column: 1, scope: !98)
!128 = distinct !DISubprogram(name: "main", scope: !8, file: !8, line: 109, type: !20, isLocal: false, isDefinition: true, scopeLine: 109, isOptimized: false, unit: !0, variables: !2)
!129 = !DILocation(line: 110, column: 5, scope: !128)
!130 = !DILocation(line: 111, column: 2, scope: !128)
!131 = !DILocation(line: 112, column: 5, scope: !128)
