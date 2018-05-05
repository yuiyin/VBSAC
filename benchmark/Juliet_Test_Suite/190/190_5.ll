; ModuleID = './190_5.c'
source_filename = "./190_5.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@.str.1 = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1
@.str.2 = private unnamed_addr constant [5 x i8] c"%ld\0A\00", align 1
@staticTrue = internal global i32 1, align 4
@staticFalse = internal global i32 0, align 4
@.str.3 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@.str.4 = private unnamed_addr constant [54 x i8] c"data value is too large to perform arithmetic safely.\00", align 1

; Function Attrs: nounwind uwtable
define void @printHexCharLine(i8 signext %charHex) #0 !dbg !13 {
entry:
  %charHex.addr = alloca i8, align 1
  store i8 %charHex, i8* %charHex.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %charHex.addr, metadata !17, metadata !18), !dbg !19
  %0 = load i8, i8* %charHex.addr, align 1, !dbg !20
  %conv = sext i8 %0 to i32, !dbg !21
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), i32 %conv), !dbg !22
  ret void, !dbg !23
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @printf(i8*, ...) #2

; Function Attrs: nounwind uwtable
define void @printLine(i8* %line) #0 !dbg !24 {
entry:
  %line.addr = alloca i8*, align 8
  store i8* %line, i8** %line.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %line.addr, metadata !29, metadata !18), !dbg !30
  %0 = load i8*, i8** %line.addr, align 8, !dbg !31
  %cmp = icmp ne i8* %0, null, !dbg !33
  br i1 %cmp, label %if.then, label %if.end, !dbg !34

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** %line.addr, align 8, !dbg !35
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i32 0, i32 0), i8* %1), !dbg !37
  br label %if.end, !dbg !38

if.end:                                           ; preds = %if.then, %entry
  ret void, !dbg !39
}

; Function Attrs: nounwind uwtable
define void @printIntLine(i32 %intNumber) #0 !dbg !40 {
entry:
  %intNumber.addr = alloca i32, align 4
  store i32 %intNumber, i32* %intNumber.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %intNumber.addr, metadata !43, metadata !18), !dbg !44
  %0 = load i32, i32* %intNumber.addr, align 4, !dbg !45
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), i32 %0), !dbg !46
  ret void, !dbg !47
}

; Function Attrs: nounwind uwtable
define void @printLongLine(i64 %longIntNumber) #0 !dbg !48 {
entry:
  %longIntNumber.addr = alloca i64, align 8
  store i64 %longIntNumber, i64* %longIntNumber.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %longIntNumber.addr, metadata !54, metadata !18), !dbg !55
  %0 = load i64, i64* %longIntNumber.addr, align 8, !dbg !56
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.2, i32 0, i32 0), i64 %0), !dbg !57
  ret void, !dbg !58
}

; Function Attrs: nounwind uwtable
define void @bad5() #0 !dbg !59 {
entry:
  %data = alloca i8, align 1
  %result = alloca i8, align 1
  call void @llvm.dbg.declare(metadata i8* %data, metadata !62, metadata !18), !dbg !63
  store i8 32, i8* %data, align 1, !dbg !64
  %0 = load i32, i32* @staticTrue, align 4, !dbg !65
  %tobool = icmp ne i32 %0, 0, !dbg !65
  br i1 %tobool, label %if.then, label %if.end, !dbg !67

if.then:                                          ; preds = %entry
  store i8 127, i8* %data, align 1, !dbg !68
  br label %if.end, !dbg !70

if.end:                                           ; preds = %if.then, %entry
  %1 = load i32, i32* @staticTrue, align 4, !dbg !71
  %tobool1 = icmp ne i32 %1, 0, !dbg !71
  br i1 %tobool1, label %if.then2, label %if.end8, !dbg !73

if.then2:                                         ; preds = %if.end
  %2 = load i8, i8* %data, align 1, !dbg !74
  %conv = sext i8 %2 to i32, !dbg !74
  %cmp = icmp sgt i32 %conv, 0, !dbg !77
  br i1 %cmp, label %if.then4, label %if.end7, !dbg !78

if.then4:                                         ; preds = %if.then2
  call void @llvm.dbg.declare(metadata i8* %result, metadata !79, metadata !18), !dbg !81
  %3 = load i8, i8* %data, align 1, !dbg !82
  %conv5 = sext i8 %3 to i32, !dbg !82
  %mul = mul nsw i32 %conv5, 2, !dbg !83
  %conv6 = trunc i32 %mul to i8, !dbg !82
  store i8 %conv6, i8* %result, align 1, !dbg !81
  %4 = load i8, i8* %result, align 1, !dbg !84
  call void @printHexCharLine(i8 signext %4), !dbg !85
  br label %if.end7, !dbg !86

if.end7:                                          ; preds = %if.then4, %if.then2
  br label %if.end8, !dbg !87

if.end8:                                          ; preds = %if.end7, %if.end
  ret void, !dbg !88
}

; Function Attrs: nounwind uwtable
define void @good5() #0 !dbg !89 {
entry:
  %data = alloca i8, align 1
  %result = alloca i8, align 1
  call void @llvm.dbg.declare(metadata i8* %data, metadata !90, metadata !18), !dbg !91
  store i8 32, i8* %data, align 1, !dbg !92
  %0 = load i32, i32* @staticTrue, align 4, !dbg !93
  %tobool = icmp ne i32 %0, 0, !dbg !93
  br i1 %tobool, label %if.then, label %if.end, !dbg !95

if.then:                                          ; preds = %entry
  store i8 127, i8* %data, align 1, !dbg !96
  br label %if.end, !dbg !98

if.end:                                           ; preds = %if.then, %entry
  %1 = load i32, i32* @staticFalse, align 4, !dbg !99
  %tobool1 = icmp ne i32 %1, 0, !dbg !99
  br i1 %tobool1, label %if.then2, label %if.else, !dbg !101

if.then2:                                         ; preds = %if.end
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.3, i32 0, i32 0)), !dbg !102
  br label %if.end14, !dbg !104

if.else:                                          ; preds = %if.end
  %2 = load i8, i8* %data, align 1, !dbg !105
  %conv = sext i8 %2 to i32, !dbg !105
  %cmp = icmp sgt i32 %conv, 0, !dbg !108
  br i1 %cmp, label %if.then4, label %if.end13, !dbg !109

if.then4:                                         ; preds = %if.else
  %3 = load i8, i8* %data, align 1, !dbg !110
  %conv5 = sext i8 %3 to i32, !dbg !110
  %cmp6 = icmp slt i32 %conv5, 63, !dbg !113
  br i1 %cmp6, label %if.then8, label %if.else11, !dbg !114

if.then8:                                         ; preds = %if.then4
  call void @llvm.dbg.declare(metadata i8* %result, metadata !115, metadata !18), !dbg !117
  %4 = load i8, i8* %data, align 1, !dbg !118
  %conv9 = sext i8 %4 to i32, !dbg !118
  %mul = mul nsw i32 %conv9, 2, !dbg !119
  %conv10 = trunc i32 %mul to i8, !dbg !118
  store i8 %conv10, i8* %result, align 1, !dbg !117
  %5 = load i8, i8* %result, align 1, !dbg !120
  call void @printHexCharLine(i8 signext %5), !dbg !121
  br label %if.end12, !dbg !122

if.else11:                                        ; preds = %if.then4
  call void @printLine(i8* getelementptr inbounds ([54 x i8], [54 x i8]* @.str.4, i32 0, i32 0)), !dbg !123
  br label %if.end12

if.end12:                                         ; preds = %if.else11, %if.then8
  br label %if.end13, !dbg !125

if.end13:                                         ; preds = %if.end12, %if.else
  br label %if.end14

if.end14:                                         ; preds = %if.end13, %if.then2
  ret void, !dbg !126
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !127 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @good5(), !dbg !130
  call void @bad5(), !dbg !131
  ret i32 1, !dbg !132
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (tags/RELEASE_390/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, globals: !6)
!1 = !DIFile(filename: "190_5.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/190")
!2 = !{}
!3 = !{!4, !5}
!4 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64, align: 64)
!6 = !{!7, !9}
!7 = distinct !DIGlobalVariable(name: "staticTrue", scope: !0, file: !8, line: 34, type: !4, isLocal: true, isDefinition: true, variable: i32* @staticTrue)
!8 = !DIFile(filename: "./190_5.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/190")
!9 = distinct !DIGlobalVariable(name: "staticFalse", scope: !0, file: !8, line: 35, type: !4, isLocal: true, isDefinition: true, variable: i32* @staticFalse)
!10 = !{i32 2, !"Dwarf Version", i32 4}
!11 = !{i32 2, !"Debug Info Version", i32 3}
!12 = !{!"clang version 3.9.0 (tags/RELEASE_390/final)"}
!13 = distinct !DISubprogram(name: "printHexCharLine", scope: !8, file: !8, line: 10, type: !14, isLocal: false, isDefinition: true, scopeLine: 11, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!14 = !DISubroutineType(types: !15)
!15 = !{null, !16}
!16 = !DIBasicType(name: "char", size: 8, align: 8, encoding: DW_ATE_signed_char)
!17 = !DILocalVariable(name: "charHex", arg: 1, scope: !13, file: !8, line: 10, type: !16)
!18 = !DIExpression()
!19 = !DILocation(line: 10, column: 29, scope: !13)
!20 = !DILocation(line: 12, column: 25, scope: !13)
!21 = !DILocation(line: 12, column: 20, scope: !13)
!22 = !DILocation(line: 12, column: 5, scope: !13)
!23 = !DILocation(line: 13, column: 1, scope: !13)
!24 = distinct !DISubprogram(name: "printLine", scope: !8, file: !8, line: 15, type: !25, isLocal: false, isDefinition: true, scopeLine: 16, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!25 = !DISubroutineType(types: !26)
!26 = !{null, !27}
!27 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !28, size: 64, align: 64)
!28 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !16)
!29 = !DILocalVariable(name: "line", arg: 1, scope: !24, file: !8, line: 15, type: !27)
!30 = !DILocation(line: 15, column: 30, scope: !24)
!31 = !DILocation(line: 17, column: 8, scope: !32)
!32 = distinct !DILexicalBlock(scope: !24, file: !8, line: 17, column: 8)
!33 = !DILocation(line: 17, column: 13, scope: !32)
!34 = !DILocation(line: 17, column: 8, scope: !24)
!35 = !DILocation(line: 19, column: 24, scope: !36)
!36 = distinct !DILexicalBlock(scope: !32, file: !8, line: 18, column: 5)
!37 = !DILocation(line: 19, column: 9, scope: !36)
!38 = !DILocation(line: 20, column: 5, scope: !36)
!39 = !DILocation(line: 21, column: 1, scope: !24)
!40 = distinct !DISubprogram(name: "printIntLine", scope: !8, file: !8, line: 23, type: !41, isLocal: false, isDefinition: true, scopeLine: 24, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!41 = !DISubroutineType(types: !42)
!42 = !{null, !4}
!43 = !DILocalVariable(name: "intNumber", arg: 1, scope: !40, file: !8, line: 23, type: !4)
!44 = !DILocation(line: 23, column: 24, scope: !40)
!45 = !DILocation(line: 25, column: 20, scope: !40)
!46 = !DILocation(line: 25, column: 5, scope: !40)
!47 = !DILocation(line: 26, column: 1, scope: !40)
!48 = distinct !DISubprogram(name: "printLongLine", scope: !8, file: !8, line: 28, type: !49, isLocal: false, isDefinition: true, scopeLine: 29, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!49 = !DISubroutineType(types: !50)
!50 = !{null, !51}
!51 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !52, line: 197, baseType: !53)
!52 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/sys/types.h", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/190")
!53 = !DIBasicType(name: "long int", size: 64, align: 64, encoding: DW_ATE_signed)
!54 = !DILocalVariable(name: "longIntNumber", arg: 1, scope: !48, file: !8, line: 28, type: !51)
!55 = !DILocation(line: 28, column: 29, scope: !48)
!56 = !DILocation(line: 30, column: 21, scope: !48)
!57 = !DILocation(line: 30, column: 5, scope: !48)
!58 = !DILocation(line: 31, column: 1, scope: !48)
!59 = distinct !DISubprogram(name: "bad5", scope: !8, file: !8, line: 37, type: !60, isLocal: false, isDefinition: true, scopeLine: 38, isOptimized: false, unit: !0, variables: !2)
!60 = !DISubroutineType(types: !61)
!61 = !{null}
!62 = !DILocalVariable(name: "data", scope: !59, file: !8, line: 39, type: !16)
!63 = !DILocation(line: 39, column: 10, scope: !59)
!64 = !DILocation(line: 40, column: 10, scope: !59)
!65 = !DILocation(line: 41, column: 8, scope: !66)
!66 = distinct !DILexicalBlock(scope: !59, file: !8, line: 41, column: 8)
!67 = !DILocation(line: 41, column: 8, scope: !59)
!68 = !DILocation(line: 44, column: 14, scope: !69)
!69 = distinct !DILexicalBlock(scope: !66, file: !8, line: 42, column: 5)
!70 = !DILocation(line: 45, column: 5, scope: !69)
!71 = !DILocation(line: 46, column: 8, scope: !72)
!72 = distinct !DILexicalBlock(scope: !59, file: !8, line: 46, column: 8)
!73 = !DILocation(line: 46, column: 8, scope: !59)
!74 = !DILocation(line: 48, column: 12, scope: !75)
!75 = distinct !DILexicalBlock(scope: !76, file: !8, line: 48, column: 12)
!76 = distinct !DILexicalBlock(scope: !72, file: !8, line: 47, column: 5)
!77 = !DILocation(line: 48, column: 17, scope: !75)
!78 = !DILocation(line: 48, column: 12, scope: !76)
!79 = !DILocalVariable(name: "result", scope: !80, file: !8, line: 51, type: !16)
!80 = distinct !DILexicalBlock(scope: !75, file: !8, line: 49, column: 9)
!81 = !DILocation(line: 51, column: 18, scope: !80)
!82 = !DILocation(line: 51, column: 27, scope: !80)
!83 = !DILocation(line: 51, column: 32, scope: !80)
!84 = !DILocation(line: 52, column: 30, scope: !80)
!85 = !DILocation(line: 52, column: 13, scope: !80)
!86 = !DILocation(line: 53, column: 9, scope: !80)
!87 = !DILocation(line: 54, column: 5, scope: !76)
!88 = !DILocation(line: 55, column: 1, scope: !59)
!89 = distinct !DISubprogram(name: "good5", scope: !8, file: !8, line: 57, type: !60, isLocal: false, isDefinition: true, scopeLine: 58, isOptimized: false, unit: !0, variables: !2)
!90 = !DILocalVariable(name: "data", scope: !89, file: !8, line: 59, type: !16)
!91 = !DILocation(line: 59, column: 10, scope: !89)
!92 = !DILocation(line: 60, column: 10, scope: !89)
!93 = !DILocation(line: 61, column: 8, scope: !94)
!94 = distinct !DILexicalBlock(scope: !89, file: !8, line: 61, column: 8)
!95 = !DILocation(line: 61, column: 8, scope: !89)
!96 = !DILocation(line: 64, column: 14, scope: !97)
!97 = distinct !DILexicalBlock(scope: !94, file: !8, line: 62, column: 5)
!98 = !DILocation(line: 65, column: 5, scope: !97)
!99 = !DILocation(line: 66, column: 8, scope: !100)
!100 = distinct !DILexicalBlock(scope: !89, file: !8, line: 66, column: 8)
!101 = !DILocation(line: 66, column: 8, scope: !89)
!102 = !DILocation(line: 69, column: 9, scope: !103)
!103 = distinct !DILexicalBlock(scope: !100, file: !8, line: 67, column: 5)
!104 = !DILocation(line: 70, column: 5, scope: !103)
!105 = !DILocation(line: 73, column: 12, scope: !106)
!106 = distinct !DILexicalBlock(scope: !107, file: !8, line: 73, column: 12)
!107 = distinct !DILexicalBlock(scope: !100, file: !8, line: 72, column: 5)
!108 = !DILocation(line: 73, column: 17, scope: !106)
!109 = !DILocation(line: 73, column: 12, scope: !107)
!110 = !DILocation(line: 76, column: 17, scope: !111)
!111 = distinct !DILexicalBlock(scope: !112, file: !8, line: 76, column: 17)
!112 = distinct !DILexicalBlock(scope: !106, file: !8, line: 74, column: 9)
!113 = !DILocation(line: 76, column: 22, scope: !111)
!114 = !DILocation(line: 76, column: 17, scope: !112)
!115 = !DILocalVariable(name: "result", scope: !116, file: !8, line: 78, type: !16)
!116 = distinct !DILexicalBlock(scope: !111, file: !8, line: 77, column: 13)
!117 = !DILocation(line: 78, column: 22, scope: !116)
!118 = !DILocation(line: 78, column: 31, scope: !116)
!119 = !DILocation(line: 78, column: 36, scope: !116)
!120 = !DILocation(line: 79, column: 34, scope: !116)
!121 = !DILocation(line: 79, column: 17, scope: !116)
!122 = !DILocation(line: 80, column: 13, scope: !116)
!123 = !DILocation(line: 83, column: 17, scope: !124)
!124 = distinct !DILexicalBlock(scope: !111, file: !8, line: 82, column: 13)
!125 = !DILocation(line: 85, column: 9, scope: !112)
!126 = !DILocation(line: 87, column: 1, scope: !89)
!127 = distinct !DISubprogram(name: "main", scope: !8, file: !8, line: 89, type: !128, isLocal: false, isDefinition: true, scopeLine: 89, isOptimized: false, unit: !0, variables: !2)
!128 = !DISubroutineType(types: !129)
!129 = !{!4}
!130 = !DILocation(line: 90, column: 5, scope: !127)
!131 = !DILocation(line: 91, column: 5, scope: !127)
!132 = !DILocation(line: 92, column: 5, scope: !127)
