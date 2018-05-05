; ModuleID = './191_5.c'
source_filename = "./191_5.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@.str.1 = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1
@.str.2 = private unnamed_addr constant [5 x i8] c"%ld\0A\00", align 1
@.str.3 = private unnamed_addr constant [4 x i8] c"%u\0A\00", align 1
@staticTrue = internal global i32 1, align 4
@stdin = external global %struct._IO_FILE*, align 8
@.str.4 = private unnamed_addr constant [3 x i8] c"%u\00", align 1
@.str.5 = private unnamed_addr constant [48 x i8] c"data value is too small to perform subtraction.\00", align 1

; Function Attrs: nounwind uwtable
define void @printHexCharLine(i8 signext %charHex) #0 !dbg !12 {
entry:
  %charHex.addr = alloca i8, align 1
  store i8 %charHex, i8* %charHex.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %charHex.addr, metadata !16, metadata !17), !dbg !18
  %0 = load i8, i8* %charHex.addr, align 1, !dbg !19
  %conv = sext i8 %0 to i32, !dbg !20
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), i32 %conv), !dbg !21
  ret void, !dbg !22
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @printf(i8*, ...) #2

; Function Attrs: nounwind uwtable
define void @printLine(i8* %line) #0 !dbg !23 {
entry:
  %line.addr = alloca i8*, align 8
  store i8* %line, i8** %line.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %line.addr, metadata !28, metadata !17), !dbg !29
  %0 = load i8*, i8** %line.addr, align 8, !dbg !30
  %cmp = icmp ne i8* %0, null, !dbg !32
  br i1 %cmp, label %if.then, label %if.end, !dbg !33

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** %line.addr, align 8, !dbg !34
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i32 0, i32 0), i8* %1), !dbg !36
  br label %if.end, !dbg !37

if.end:                                           ; preds = %if.then, %entry
  ret void, !dbg !38
}

; Function Attrs: nounwind uwtable
define void @printIntLine(i32 %intNumber) #0 !dbg !39 {
entry:
  %intNumber.addr = alloca i32, align 4
  store i32 %intNumber, i32* %intNumber.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %intNumber.addr, metadata !42, metadata !17), !dbg !43
  %0 = load i32, i32* %intNumber.addr, align 4, !dbg !44
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), i32 %0), !dbg !45
  ret void, !dbg !46
}

; Function Attrs: nounwind uwtable
define void @printLongLine(i64 %longIntNumber) #0 !dbg !47 {
entry:
  %longIntNumber.addr = alloca i64, align 8
  store i64 %longIntNumber, i64* %longIntNumber.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %longIntNumber.addr, metadata !53, metadata !17), !dbg !54
  %0 = load i64, i64* %longIntNumber.addr, align 8, !dbg !55
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.2, i32 0, i32 0), i64 %0), !dbg !56
  ret void, !dbg !57
}

; Function Attrs: nounwind uwtable
define void @printUnsignedLine(i32 %unsignedNumber) #0 !dbg !58 {
entry:
  %unsignedNumber.addr = alloca i32, align 4
  store i32 %unsignedNumber, i32* %unsignedNumber.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %unsignedNumber.addr, metadata !62, metadata !17), !dbg !63
  %0 = load i32, i32* %unsignedNumber.addr, align 4, !dbg !64
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i32 0, i32 0), i32 %0), !dbg !65
  ret void, !dbg !66
}

; Function Attrs: nounwind uwtable
define void @bad5() #0 !dbg !67 {
entry:
  %data = alloca i32, align 4
  %result = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !70, metadata !17), !dbg !71
  store i32 0, i32* %data, align 4, !dbg !72
  %0 = load i32, i32* @staticTrue, align 4, !dbg !73
  %tobool = icmp ne i32 %0, 0, !dbg !73
  br i1 %tobool, label %if.then, label %if.end, !dbg !75

if.then:                                          ; preds = %entry
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !76
  %call = call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.4, i32 0, i32 0), i32* %data), !dbg !78
  br label %if.end, !dbg !79

if.end:                                           ; preds = %if.then, %entry
  %2 = load i32, i32* @staticTrue, align 4, !dbg !80
  %tobool1 = icmp ne i32 %2, 0, !dbg !80
  br i1 %tobool1, label %if.then2, label %if.end3, !dbg !82

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %result, metadata !83, metadata !17), !dbg !86
  %3 = load i32, i32* %data, align 4, !dbg !87
  %sub = sub i32 %3, 1, !dbg !88
  store i32 %sub, i32* %result, align 4, !dbg !86
  %4 = load i32, i32* %result, align 4, !dbg !89
  call void @printUnsignedLine(i32 %4), !dbg !90
  br label %if.end3, !dbg !91

if.end3:                                          ; preds = %if.then2, %if.end
  ret void, !dbg !92
}

declare i32 @__isoc99_fscanf(%struct._IO_FILE*, i8*, ...) #2

; Function Attrs: nounwind uwtable
define void @good5() #0 !dbg !93 {
entry:
  %data = alloca i32, align 4
  %result = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !94, metadata !17), !dbg !95
  store i32 0, i32* %data, align 4, !dbg !96
  %0 = load i32, i32* @staticTrue, align 4, !dbg !97
  %tobool = icmp ne i32 %0, 0, !dbg !97
  br i1 %tobool, label %if.then, label %if.end, !dbg !99

if.then:                                          ; preds = %entry
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !100
  %call = call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.4, i32 0, i32 0), i32* %data), !dbg !102
  br label %if.end, !dbg !103

if.end:                                           ; preds = %if.then, %entry
  %2 = load i32, i32* @staticTrue, align 4, !dbg !104
  %tobool1 = icmp ne i32 %2, 0, !dbg !104
  br i1 %tobool1, label %if.then2, label %if.end5, !dbg !106

if.then2:                                         ; preds = %if.end
  %3 = load i32, i32* %data, align 4, !dbg !107
  %cmp = icmp ugt i32 %3, 0, !dbg !110
  br i1 %cmp, label %if.then3, label %if.else, !dbg !111

if.then3:                                         ; preds = %if.then2
  call void @llvm.dbg.declare(metadata i32* %result, metadata !112, metadata !17), !dbg !114
  %4 = load i32, i32* %data, align 4, !dbg !115
  %sub = sub i32 %4, 1, !dbg !116
  store i32 %sub, i32* %result, align 4, !dbg !114
  %5 = load i32, i32* %result, align 4, !dbg !117
  call void @printUnsignedLine(i32 %5), !dbg !118
  br label %if.end4, !dbg !119

if.else:                                          ; preds = %if.then2
  call void @printLine(i8* getelementptr inbounds ([48 x i8], [48 x i8]* @.str.5, i32 0, i32 0)), !dbg !120
  br label %if.end4

if.end4:                                          ; preds = %if.else, %if.then3
  br label %if.end5, !dbg !122

if.end5:                                          ; preds = %if.end4, %if.end
  ret void, !dbg !123
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !124 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @good5(), !dbg !127
  call void @bad5(), !dbg !128
  ret i32 1, !dbg !129
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!9, !10}
!llvm.ident = !{!11}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (tags/RELEASE_390/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, globals: !6)
!1 = !DIFile(filename: "191_5.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/191")
!2 = !{}
!3 = !{!4, !5}
!4 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64, align: 64)
!6 = !{!7}
!7 = distinct !DIGlobalVariable(name: "staticTrue", scope: !0, file: !8, line: 42, type: !4, isLocal: true, isDefinition: true, variable: i32* @staticTrue)
!8 = !DIFile(filename: "./191_5.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/191")
!9 = !{i32 2, !"Dwarf Version", i32 4}
!10 = !{i32 2, !"Debug Info Version", i32 3}
!11 = !{!"clang version 3.9.0 (tags/RELEASE_390/final)"}
!12 = distinct !DISubprogram(name: "printHexCharLine", scope: !8, file: !8, line: 10, type: !13, isLocal: false, isDefinition: true, scopeLine: 11, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!13 = !DISubroutineType(types: !14)
!14 = !{null, !15}
!15 = !DIBasicType(name: "char", size: 8, align: 8, encoding: DW_ATE_signed_char)
!16 = !DILocalVariable(name: "charHex", arg: 1, scope: !12, file: !8, line: 10, type: !15)
!17 = !DIExpression()
!18 = !DILocation(line: 10, column: 29, scope: !12)
!19 = !DILocation(line: 12, column: 25, scope: !12)
!20 = !DILocation(line: 12, column: 20, scope: !12)
!21 = !DILocation(line: 12, column: 5, scope: !12)
!22 = !DILocation(line: 13, column: 1, scope: !12)
!23 = distinct !DISubprogram(name: "printLine", scope: !8, file: !8, line: 15, type: !24, isLocal: false, isDefinition: true, scopeLine: 16, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!24 = !DISubroutineType(types: !25)
!25 = !{null, !26}
!26 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !27, size: 64, align: 64)
!27 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !15)
!28 = !DILocalVariable(name: "line", arg: 1, scope: !23, file: !8, line: 15, type: !26)
!29 = !DILocation(line: 15, column: 30, scope: !23)
!30 = !DILocation(line: 17, column: 8, scope: !31)
!31 = distinct !DILexicalBlock(scope: !23, file: !8, line: 17, column: 8)
!32 = !DILocation(line: 17, column: 13, scope: !31)
!33 = !DILocation(line: 17, column: 8, scope: !23)
!34 = !DILocation(line: 19, column: 24, scope: !35)
!35 = distinct !DILexicalBlock(scope: !31, file: !8, line: 18, column: 5)
!36 = !DILocation(line: 19, column: 9, scope: !35)
!37 = !DILocation(line: 20, column: 5, scope: !35)
!38 = !DILocation(line: 21, column: 1, scope: !23)
!39 = distinct !DISubprogram(name: "printIntLine", scope: !8, file: !8, line: 23, type: !40, isLocal: false, isDefinition: true, scopeLine: 24, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!40 = !DISubroutineType(types: !41)
!41 = !{null, !4}
!42 = !DILocalVariable(name: "intNumber", arg: 1, scope: !39, file: !8, line: 23, type: !4)
!43 = !DILocation(line: 23, column: 24, scope: !39)
!44 = !DILocation(line: 25, column: 20, scope: !39)
!45 = !DILocation(line: 25, column: 5, scope: !39)
!46 = !DILocation(line: 26, column: 1, scope: !39)
!47 = distinct !DISubprogram(name: "printLongLine", scope: !8, file: !8, line: 28, type: !48, isLocal: false, isDefinition: true, scopeLine: 29, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!48 = !DISubroutineType(types: !49)
!49 = !{null, !50}
!50 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !51, line: 197, baseType: !52)
!51 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/sys/types.h", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/191")
!52 = !DIBasicType(name: "long int", size: 64, align: 64, encoding: DW_ATE_signed)
!53 = !DILocalVariable(name: "longIntNumber", arg: 1, scope: !47, file: !8, line: 28, type: !50)
!54 = !DILocation(line: 28, column: 29, scope: !47)
!55 = !DILocation(line: 30, column: 21, scope: !47)
!56 = !DILocation(line: 30, column: 5, scope: !47)
!57 = !DILocation(line: 31, column: 1, scope: !47)
!58 = distinct !DISubprogram(name: "printUnsignedLine", scope: !8, file: !8, line: 33, type: !59, isLocal: false, isDefinition: true, scopeLine: 34, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!59 = !DISubroutineType(types: !60)
!60 = !{null, !61}
!61 = !DIBasicType(name: "unsigned int", size: 32, align: 32, encoding: DW_ATE_unsigned)
!62 = !DILocalVariable(name: "unsignedNumber", arg: 1, scope: !58, file: !8, line: 33, type: !61)
!63 = !DILocation(line: 33, column: 33, scope: !58)
!64 = !DILocation(line: 35, column: 20, scope: !58)
!65 = !DILocation(line: 35, column: 5, scope: !58)
!66 = !DILocation(line: 36, column: 1, scope: !58)
!67 = distinct !DISubprogram(name: "bad5", scope: !8, file: !8, line: 45, type: !68, isLocal: false, isDefinition: true, scopeLine: 46, isOptimized: false, unit: !0, variables: !2)
!68 = !DISubroutineType(types: !69)
!69 = !{null}
!70 = !DILocalVariable(name: "data", scope: !67, file: !8, line: 47, type: !61)
!71 = !DILocation(line: 47, column: 18, scope: !67)
!72 = !DILocation(line: 48, column: 10, scope: !67)
!73 = !DILocation(line: 49, column: 8, scope: !74)
!74 = distinct !DILexicalBlock(scope: !67, file: !8, line: 49, column: 8)
!75 = !DILocation(line: 49, column: 8, scope: !67)
!76 = !DILocation(line: 52, column: 17, scope: !77)
!77 = distinct !DILexicalBlock(scope: !74, file: !8, line: 50, column: 5)
!78 = !DILocation(line: 52, column: 9, scope: !77)
!79 = !DILocation(line: 53, column: 5, scope: !77)
!80 = !DILocation(line: 54, column: 8, scope: !81)
!81 = distinct !DILexicalBlock(scope: !67, file: !8, line: 54, column: 8)
!82 = !DILocation(line: 54, column: 8, scope: !67)
!83 = !DILocalVariable(name: "result", scope: !84, file: !8, line: 58, type: !61)
!84 = distinct !DILexicalBlock(scope: !85, file: !8, line: 56, column: 9)
!85 = distinct !DILexicalBlock(scope: !81, file: !8, line: 55, column: 5)
!86 = !DILocation(line: 58, column: 26, scope: !84)
!87 = !DILocation(line: 58, column: 35, scope: !84)
!88 = !DILocation(line: 58, column: 40, scope: !84)
!89 = !DILocation(line: 59, column: 31, scope: !84)
!90 = !DILocation(line: 59, column: 13, scope: !84)
!91 = !DILocation(line: 61, column: 5, scope: !85)
!92 = !DILocation(line: 62, column: 1, scope: !67)
!93 = distinct !DISubprogram(name: "good5", scope: !8, file: !8, line: 64, type: !68, isLocal: false, isDefinition: true, scopeLine: 65, isOptimized: false, unit: !0, variables: !2)
!94 = !DILocalVariable(name: "data", scope: !93, file: !8, line: 66, type: !61)
!95 = !DILocation(line: 66, column: 18, scope: !93)
!96 = !DILocation(line: 67, column: 10, scope: !93)
!97 = !DILocation(line: 68, column: 8, scope: !98)
!98 = distinct !DILexicalBlock(scope: !93, file: !8, line: 68, column: 8)
!99 = !DILocation(line: 68, column: 8, scope: !93)
!100 = !DILocation(line: 71, column: 17, scope: !101)
!101 = distinct !DILexicalBlock(scope: !98, file: !8, line: 69, column: 5)
!102 = !DILocation(line: 71, column: 9, scope: !101)
!103 = !DILocation(line: 72, column: 5, scope: !101)
!104 = !DILocation(line: 73, column: 8, scope: !105)
!105 = distinct !DILexicalBlock(scope: !93, file: !8, line: 73, column: 8)
!106 = !DILocation(line: 73, column: 8, scope: !93)
!107 = !DILocation(line: 76, column: 13, scope: !108)
!108 = distinct !DILexicalBlock(scope: !109, file: !8, line: 76, column: 13)
!109 = distinct !DILexicalBlock(scope: !105, file: !8, line: 74, column: 5)
!110 = !DILocation(line: 76, column: 18, scope: !108)
!111 = !DILocation(line: 76, column: 13, scope: !109)
!112 = !DILocalVariable(name: "result", scope: !113, file: !8, line: 78, type: !61)
!113 = distinct !DILexicalBlock(scope: !108, file: !8, line: 77, column: 9)
!114 = !DILocation(line: 78, column: 26, scope: !113)
!115 = !DILocation(line: 78, column: 35, scope: !113)
!116 = !DILocation(line: 78, column: 40, scope: !113)
!117 = !DILocation(line: 79, column: 31, scope: !113)
!118 = !DILocation(line: 79, column: 13, scope: !113)
!119 = !DILocation(line: 80, column: 9, scope: !113)
!120 = !DILocation(line: 83, column: 13, scope: !121)
!121 = distinct !DILexicalBlock(scope: !108, file: !8, line: 82, column: 9)
!122 = !DILocation(line: 85, column: 5, scope: !109)
!123 = !DILocation(line: 86, column: 1, scope: !93)
!124 = distinct !DISubprogram(name: "main", scope: !8, file: !8, line: 88, type: !125, isLocal: false, isDefinition: true, scopeLine: 88, isOptimized: false, unit: !0, variables: !2)
!125 = !DISubroutineType(types: !126)
!126 = !{!4}
!127 = !DILocation(line: 89, column: 5, scope: !124)
!128 = !DILocation(line: 90, column: 2, scope: !124)
!129 = !DILocation(line: 91, column: 5, scope: !124)
