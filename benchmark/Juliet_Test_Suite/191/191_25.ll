; ModuleID = './191_25.c'
source_filename = "./191_25.c"
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
@.str.3 = private unnamed_addr constant [4 x i8] c"%u\0A\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: nounwind uwtable
define void @printHexCharLine(i8 signext %charHex) #0 !dbg !18 {
entry:
  %charHex.addr = alloca i8, align 1
  store i8 %charHex, i8* %charHex.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %charHex.addr, metadata !22, metadata !23), !dbg !24
  %0 = load i8, i8* %charHex.addr, align 1, !dbg !25
  %conv = sext i8 %0 to i32, !dbg !26
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), i32 %conv), !dbg !27
  ret void, !dbg !28
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @printf(i8*, ...) #2

; Function Attrs: nounwind uwtable
define void @printLine(i8* %line) #0 !dbg !29 {
entry:
  %line.addr = alloca i8*, align 8
  store i8* %line, i8** %line.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %line.addr, metadata !34, metadata !23), !dbg !35
  %0 = load i8*, i8** %line.addr, align 8, !dbg !36
  %cmp = icmp ne i8* %0, null, !dbg !38
  br i1 %cmp, label %if.then, label %if.end, !dbg !39

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** %line.addr, align 8, !dbg !40
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i32 0, i32 0), i8* %1), !dbg !42
  br label %if.end, !dbg !43

if.end:                                           ; preds = %if.then, %entry
  ret void, !dbg !44
}

; Function Attrs: nounwind uwtable
define void @printIntLine(i32 %intNumber) #0 !dbg !45 {
entry:
  %intNumber.addr = alloca i32, align 4
  store i32 %intNumber, i32* %intNumber.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %intNumber.addr, metadata !48, metadata !23), !dbg !49
  %0 = load i32, i32* %intNumber.addr, align 4, !dbg !50
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), i32 %0), !dbg !51
  ret void, !dbg !52
}

; Function Attrs: nounwind uwtable
define void @printLongLine(i64 %longIntNumber) #0 !dbg !53 {
entry:
  %longIntNumber.addr = alloca i64, align 8
  store i64 %longIntNumber, i64* %longIntNumber.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %longIntNumber.addr, metadata !59, metadata !23), !dbg !60
  %0 = load i64, i64* %longIntNumber.addr, align 8, !dbg !61
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.2, i32 0, i32 0), i64 %0), !dbg !62
  ret void, !dbg !63
}

; Function Attrs: nounwind uwtable
define void @printUnsignedLine(i32 %unsignedNumber) #0 !dbg !64 {
entry:
  %unsignedNumber.addr = alloca i32, align 4
  store i32 %unsignedNumber, i32* %unsignedNumber.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %unsignedNumber.addr, metadata !68, metadata !23), !dbg !69
  %0 = load i32, i32* %unsignedNumber.addr, align 4, !dbg !70
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i32 0, i32 0), i32 %0), !dbg !71
  ret void, !dbg !72
}

; Function Attrs: nounwind uwtable
define void @bad25() #0 !dbg !73 {
entry:
  %data = alloca i8, align 1
  %result = alloca i8, align 1
  call void @llvm.dbg.declare(metadata i8* %data, metadata !76, metadata !23), !dbg !77
  store i8 32, i8* %data, align 1, !dbg !78
  %0 = load i32, i32* @globalTrue, align 4, !dbg !79
  %tobool = icmp ne i32 %0, 0, !dbg !79
  br i1 %tobool, label %if.then, label %if.end, !dbg !81

if.then:                                          ; preds = %entry
  store i8 -90, i8* %data, align 1, !dbg !82
  br label %if.end, !dbg !84

if.end:                                           ; preds = %if.then, %entry
  %1 = load i32, i32* @globalTrue, align 4, !dbg !85
  %tobool1 = icmp ne i32 %1, 0, !dbg !85
  br i1 %tobool1, label %if.then2, label %if.end4, !dbg !87

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i8* %result, metadata !88, metadata !23), !dbg !91
  %2 = load i8, i8* %data, align 1, !dbg !92
  %conv = sext i8 %2 to i32, !dbg !92
  %sub = sub nsw i32 %conv, 65, !dbg !93
  %conv3 = trunc i32 %sub to i8, !dbg !92
  store i8 %conv3, i8* %result, align 1, !dbg !91
  %3 = load i8, i8* %result, align 1, !dbg !94
  call void @printHexCharLine(i8 signext %3), !dbg !95
  br label %if.end4, !dbg !96

if.end4:                                          ; preds = %if.then2, %if.end
  ret void, !dbg !97
}

; Function Attrs: nounwind uwtable
define void @good25() #0 !dbg !98 {
entry:
  %data = alloca i8, align 1
  %result = alloca i8, align 1
  call void @llvm.dbg.declare(metadata i8* %data, metadata !99, metadata !23), !dbg !100
  store i8 32, i8* %data, align 1, !dbg !101
  %0 = load i32, i32* @globalFalse, align 4, !dbg !102
  %tobool = icmp ne i32 %0, 0, !dbg !102
  br i1 %tobool, label %if.then, label %if.else, !dbg !104

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i32 0, i32 0)), !dbg !105
  br label %if.end, !dbg !107

if.else:                                          ; preds = %entry
  store i8 -2, i8* %data, align 1, !dbg !108
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %1 = load i32, i32* @globalTrue, align 4, !dbg !110
  %tobool1 = icmp ne i32 %1, 0, !dbg !110
  br i1 %tobool1, label %if.then2, label %if.end4, !dbg !112

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i8* %result, metadata !113, metadata !23), !dbg !116
  %2 = load i8, i8* %data, align 1, !dbg !117
  %conv = sext i8 %2 to i32, !dbg !117
  %sub = sub nsw i32 %conv, 1, !dbg !118
  %conv3 = trunc i32 %sub to i8, !dbg !117
  store i8 %conv3, i8* %result, align 1, !dbg !116
  %3 = load i8, i8* %result, align 1, !dbg !119
  call void @printHexCharLine(i8 signext %3), !dbg !120
  br label %if.end4, !dbg !121

if.end4:                                          ; preds = %if.then2, %if.end
  ret void, !dbg !122
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !123 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @good25(), !dbg !126
  call void @bad25(), !dbg !127
  ret i32 1, !dbg !128
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!15, !16}
!llvm.ident = !{!17}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (tags/RELEASE_390/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, globals: !6)
!1 = !DIFile(filename: "191_25.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/191")
!2 = !{}
!3 = !{!4, !5}
!4 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64, align: 64)
!6 = !{!7, !10, !11, !12, !13, !14}
!7 = distinct !DIGlobalVariable(name: "GLOBAL_CONST_TRUE", scope: !0, file: !8, line: 10, type: !9, isLocal: false, isDefinition: true, variable: i32* @GLOBAL_CONST_TRUE)
!8 = !DIFile(filename: "./191_25.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/191")
!9 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !4)
!10 = distinct !DIGlobalVariable(name: "GLOBAL_CONST_FALSE", scope: !0, file: !8, line: 11, type: !9, isLocal: false, isDefinition: true, variable: i32* @GLOBAL_CONST_FALSE)
!11 = distinct !DIGlobalVariable(name: "GLOBAL_CONST_FIVE", scope: !0, file: !8, line: 12, type: !9, isLocal: false, isDefinition: true, variable: i32* @GLOBAL_CONST_FIVE)
!12 = distinct !DIGlobalVariable(name: "globalTrue", scope: !0, file: !8, line: 14, type: !4, isLocal: false, isDefinition: true, variable: i32* @globalTrue)
!13 = distinct !DIGlobalVariable(name: "globalFalse", scope: !0, file: !8, line: 15, type: !4, isLocal: false, isDefinition: true, variable: i32* @globalFalse)
!14 = distinct !DIGlobalVariable(name: "globalFive", scope: !0, file: !8, line: 16, type: !4, isLocal: false, isDefinition: true, variable: i32* @globalFive)
!15 = !{i32 2, !"Dwarf Version", i32 4}
!16 = !{i32 2, !"Debug Info Version", i32 3}
!17 = !{!"clang version 3.9.0 (tags/RELEASE_390/final)"}
!18 = distinct !DISubprogram(name: "printHexCharLine", scope: !8, file: !8, line: 18, type: !19, isLocal: false, isDefinition: true, scopeLine: 19, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!19 = !DISubroutineType(types: !20)
!20 = !{null, !21}
!21 = !DIBasicType(name: "char", size: 8, align: 8, encoding: DW_ATE_signed_char)
!22 = !DILocalVariable(name: "charHex", arg: 1, scope: !18, file: !8, line: 18, type: !21)
!23 = !DIExpression()
!24 = !DILocation(line: 18, column: 29, scope: !18)
!25 = !DILocation(line: 20, column: 25, scope: !18)
!26 = !DILocation(line: 20, column: 20, scope: !18)
!27 = !DILocation(line: 20, column: 5, scope: !18)
!28 = !DILocation(line: 21, column: 1, scope: !18)
!29 = distinct !DISubprogram(name: "printLine", scope: !8, file: !8, line: 23, type: !30, isLocal: false, isDefinition: true, scopeLine: 24, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!30 = !DISubroutineType(types: !31)
!31 = !{null, !32}
!32 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !33, size: 64, align: 64)
!33 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !21)
!34 = !DILocalVariable(name: "line", arg: 1, scope: !29, file: !8, line: 23, type: !32)
!35 = !DILocation(line: 23, column: 30, scope: !29)
!36 = !DILocation(line: 25, column: 8, scope: !37)
!37 = distinct !DILexicalBlock(scope: !29, file: !8, line: 25, column: 8)
!38 = !DILocation(line: 25, column: 13, scope: !37)
!39 = !DILocation(line: 25, column: 8, scope: !29)
!40 = !DILocation(line: 27, column: 24, scope: !41)
!41 = distinct !DILexicalBlock(scope: !37, file: !8, line: 26, column: 5)
!42 = !DILocation(line: 27, column: 9, scope: !41)
!43 = !DILocation(line: 28, column: 5, scope: !41)
!44 = !DILocation(line: 29, column: 1, scope: !29)
!45 = distinct !DISubprogram(name: "printIntLine", scope: !8, file: !8, line: 31, type: !46, isLocal: false, isDefinition: true, scopeLine: 32, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!46 = !DISubroutineType(types: !47)
!47 = !{null, !4}
!48 = !DILocalVariable(name: "intNumber", arg: 1, scope: !45, file: !8, line: 31, type: !4)
!49 = !DILocation(line: 31, column: 24, scope: !45)
!50 = !DILocation(line: 33, column: 20, scope: !45)
!51 = !DILocation(line: 33, column: 5, scope: !45)
!52 = !DILocation(line: 34, column: 1, scope: !45)
!53 = distinct !DISubprogram(name: "printLongLine", scope: !8, file: !8, line: 36, type: !54, isLocal: false, isDefinition: true, scopeLine: 37, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!54 = !DISubroutineType(types: !55)
!55 = !{null, !56}
!56 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !57, line: 197, baseType: !58)
!57 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/sys/types.h", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/191")
!58 = !DIBasicType(name: "long int", size: 64, align: 64, encoding: DW_ATE_signed)
!59 = !DILocalVariable(name: "longIntNumber", arg: 1, scope: !53, file: !8, line: 36, type: !56)
!60 = !DILocation(line: 36, column: 29, scope: !53)
!61 = !DILocation(line: 38, column: 21, scope: !53)
!62 = !DILocation(line: 38, column: 5, scope: !53)
!63 = !DILocation(line: 39, column: 1, scope: !53)
!64 = distinct !DISubprogram(name: "printUnsignedLine", scope: !8, file: !8, line: 41, type: !65, isLocal: false, isDefinition: true, scopeLine: 42, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!65 = !DISubroutineType(types: !66)
!66 = !{null, !67}
!67 = !DIBasicType(name: "unsigned int", size: 32, align: 32, encoding: DW_ATE_unsigned)
!68 = !DILocalVariable(name: "unsignedNumber", arg: 1, scope: !64, file: !8, line: 41, type: !67)
!69 = !DILocation(line: 41, column: 33, scope: !64)
!70 = !DILocation(line: 43, column: 20, scope: !64)
!71 = !DILocation(line: 43, column: 5, scope: !64)
!72 = !DILocation(line: 44, column: 1, scope: !64)
!73 = distinct !DISubprogram(name: "bad25", scope: !8, file: !8, line: 49, type: !74, isLocal: false, isDefinition: true, scopeLine: 50, isOptimized: false, unit: !0, variables: !2)
!74 = !DISubroutineType(types: !75)
!75 = !{null}
!76 = !DILocalVariable(name: "data", scope: !73, file: !8, line: 51, type: !21)
!77 = !DILocation(line: 51, column: 10, scope: !73)
!78 = !DILocation(line: 52, column: 10, scope: !73)
!79 = !DILocation(line: 53, column: 8, scope: !80)
!80 = distinct !DILexicalBlock(scope: !73, file: !8, line: 53, column: 8)
!81 = !DILocation(line: 53, column: 8, scope: !73)
!82 = !DILocation(line: 55, column: 14, scope: !83)
!83 = distinct !DILexicalBlock(scope: !80, file: !8, line: 54, column: 5)
!84 = !DILocation(line: 56, column: 5, scope: !83)
!85 = !DILocation(line: 57, column: 8, scope: !86)
!86 = distinct !DILexicalBlock(scope: !73, file: !8, line: 57, column: 8)
!87 = !DILocation(line: 57, column: 8, scope: !73)
!88 = !DILocalVariable(name: "result", scope: !89, file: !8, line: 61, type: !21)
!89 = distinct !DILexicalBlock(scope: !90, file: !8, line: 59, column: 9)
!90 = distinct !DILexicalBlock(scope: !86, file: !8, line: 58, column: 5)
!91 = !DILocation(line: 61, column: 18, scope: !89)
!92 = !DILocation(line: 61, column: 27, scope: !89)
!93 = !DILocation(line: 61, column: 32, scope: !89)
!94 = !DILocation(line: 62, column: 30, scope: !89)
!95 = !DILocation(line: 62, column: 13, scope: !89)
!96 = !DILocation(line: 64, column: 5, scope: !90)
!97 = !DILocation(line: 65, column: 1, scope: !73)
!98 = distinct !DISubprogram(name: "good25", scope: !8, file: !8, line: 71, type: !74, isLocal: false, isDefinition: true, scopeLine: 72, isOptimized: false, unit: !0, variables: !2)
!99 = !DILocalVariable(name: "data", scope: !98, file: !8, line: 73, type: !21)
!100 = !DILocation(line: 73, column: 10, scope: !98)
!101 = !DILocation(line: 74, column: 10, scope: !98)
!102 = !DILocation(line: 75, column: 8, scope: !103)
!103 = distinct !DILexicalBlock(scope: !98, file: !8, line: 75, column: 8)
!104 = !DILocation(line: 75, column: 8, scope: !98)
!105 = !DILocation(line: 78, column: 9, scope: !106)
!106 = distinct !DILexicalBlock(scope: !103, file: !8, line: 76, column: 5)
!107 = !DILocation(line: 79, column: 5, scope: !106)
!108 = !DILocation(line: 83, column: 14, scope: !109)
!109 = distinct !DILexicalBlock(scope: !103, file: !8, line: 81, column: 5)
!110 = !DILocation(line: 85, column: 8, scope: !111)
!111 = distinct !DILexicalBlock(scope: !98, file: !8, line: 85, column: 8)
!112 = !DILocation(line: 85, column: 8, scope: !98)
!113 = !DILocalVariable(name: "result", scope: !114, file: !8, line: 89, type: !21)
!114 = distinct !DILexicalBlock(scope: !115, file: !8, line: 87, column: 9)
!115 = distinct !DILexicalBlock(scope: !111, file: !8, line: 86, column: 5)
!116 = !DILocation(line: 89, column: 18, scope: !114)
!117 = !DILocation(line: 89, column: 27, scope: !114)
!118 = !DILocation(line: 89, column: 32, scope: !114)
!119 = !DILocation(line: 90, column: 30, scope: !114)
!120 = !DILocation(line: 90, column: 13, scope: !114)
!121 = !DILocation(line: 92, column: 5, scope: !115)
!122 = !DILocation(line: 93, column: 1, scope: !98)
!123 = distinct !DISubprogram(name: "main", scope: !8, file: !8, line: 98, type: !124, isLocal: false, isDefinition: true, scopeLine: 98, isOptimized: false, unit: !0, variables: !2)
!124 = !DISubroutineType(types: !125)
!125 = !{!4}
!126 = !DILocation(line: 99, column: 5, scope: !123)
!127 = !DILocation(line: 100, column: 2, scope: !123)
!128 = !DILocation(line: 101, column: 5, scope: !123)
