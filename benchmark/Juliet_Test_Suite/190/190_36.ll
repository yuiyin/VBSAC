; ModuleID = './190_36.c'
source_filename = "./190_36.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@GLOBAL_CONST_TRUE = constant i32 1, align 4
@GLOBAL_CONST_FALSE = constant i32 0, align 4
@GLOBAL_CONST_FIVE = constant i32 5, align 4
@globalTrue = global i32 1, align 4
@globalFalse = global i32 0, align 4
@globalFive = global i32 5, align 4
@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@.str.1 = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1
@.str.2 = private unnamed_addr constant [5 x i8] c"%ld\0A\00", align 1
@stdin = external global %struct._IO_FILE*, align 8
@.str.3 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@.str.5 = private unnamed_addr constant [54 x i8] c"data value is too large to perform arithmetic safely.\00", align 1

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
define void @bad36() #0 !dbg !64 {
entry:
  %data = alloca i32, align 4
  %result = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !67, metadata !23), !dbg !68
  store i32 0, i32* %data, align 4, !dbg !69
  %0 = load i32, i32* @globalTrue, align 4, !dbg !70
  %tobool = icmp ne i32 %0, 0, !dbg !70
  br i1 %tobool, label %if.then, label %if.end, !dbg !72

if.then:                                          ; preds = %entry
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !73
  %call = call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i32 0, i32 0), i32* %data), !dbg !75
  br label %if.end, !dbg !76

if.end:                                           ; preds = %if.then, %entry
  %2 = load i32, i32* @globalTrue, align 4, !dbg !77
  %tobool1 = icmp ne i32 %2, 0, !dbg !77
  br i1 %tobool1, label %if.then2, label %if.end3, !dbg !79

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %result, metadata !80, metadata !23), !dbg !83
  %3 = load i32, i32* %data, align 4, !dbg !84
  %add = add nsw i32 %3, 1, !dbg !85
  store i32 %add, i32* %result, align 4, !dbg !83
  %4 = load i32, i32* %result, align 4, !dbg !86
  call void @printIntLine(i32 %4), !dbg !87
  br label %if.end3, !dbg !88

if.end3:                                          ; preds = %if.then2, %if.end
  ret void, !dbg !89
}

declare i32 @__isoc99_fscanf(%struct._IO_FILE*, i8*, ...) #2

; Function Attrs: nounwind uwtable
define void @good36() #0 !dbg !90 {
entry:
  %data = alloca i32, align 4
  %result = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !91, metadata !23), !dbg !92
  store i32 0, i32* %data, align 4, !dbg !93
  %0 = load i32, i32* @globalTrue, align 4, !dbg !94
  %tobool = icmp ne i32 %0, 0, !dbg !94
  br i1 %tobool, label %if.then, label %if.end, !dbg !96

if.then:                                          ; preds = %entry
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !97
  %call = call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i32 0, i32 0), i32* %data), !dbg !99
  br label %if.end, !dbg !100

if.end:                                           ; preds = %if.then, %entry
  %2 = load i32, i32* @globalFalse, align 4, !dbg !101
  %tobool1 = icmp ne i32 %2, 0, !dbg !101
  br i1 %tobool1, label %if.then2, label %if.else, !dbg !103

if.then2:                                         ; preds = %if.end
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i32 0, i32 0)), !dbg !104
  br label %if.end6, !dbg !106

if.else:                                          ; preds = %if.end
  %3 = load i32, i32* %data, align 4, !dbg !107
  %cmp = icmp slt i32 %3, 2147483647, !dbg !110
  br i1 %cmp, label %if.then3, label %if.else4, !dbg !111

if.then3:                                         ; preds = %if.else
  call void @llvm.dbg.declare(metadata i32* %result, metadata !112, metadata !23), !dbg !114
  %4 = load i32, i32* %data, align 4, !dbg !115
  %add = add nsw i32 %4, 1, !dbg !116
  store i32 %add, i32* %result, align 4, !dbg !114
  %5 = load i32, i32* %result, align 4, !dbg !117
  call void @printIntLine(i32 %5), !dbg !118
  br label %if.end5, !dbg !119

if.else4:                                         ; preds = %if.else
  call void @printLine(i8* getelementptr inbounds ([54 x i8], [54 x i8]* @.str.5, i32 0, i32 0)), !dbg !120
  br label %if.end5

if.end5:                                          ; preds = %if.else4, %if.then3
  br label %if.end6

if.end6:                                          ; preds = %if.end5, %if.then2
  ret void, !dbg !122
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !123 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @good36(), !dbg !126
  call void @bad36(), !dbg !127
  ret i32 1, !dbg !128
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!15, !16}
!llvm.ident = !{!17}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (tags/RELEASE_390/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, globals: !6)
!1 = !DIFile(filename: "190_36.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/190")
!2 = !{}
!3 = !{!4, !5}
!4 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64, align: 64)
!6 = !{!7, !10, !11, !12, !13, !14}
!7 = distinct !DIGlobalVariable(name: "GLOBAL_CONST_TRUE", scope: !0, file: !8, line: 10, type: !9, isLocal: false, isDefinition: true, variable: i32* @GLOBAL_CONST_TRUE)
!8 = !DIFile(filename: "./190_36.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/190")
!9 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !4)
!10 = distinct !DIGlobalVariable(name: "GLOBAL_CONST_FALSE", scope: !0, file: !8, line: 11, type: !9, isLocal: false, isDefinition: true, variable: i32* @GLOBAL_CONST_FALSE)
!11 = distinct !DIGlobalVariable(name: "GLOBAL_CONST_FIVE", scope: !0, file: !8, line: 12, type: !9, isLocal: false, isDefinition: true, variable: i32* @GLOBAL_CONST_FIVE)
!12 = distinct !DIGlobalVariable(name: "globalTrue", scope: !0, file: !8, line: 14, type: !4, isLocal: false, isDefinition: true, variable: i32* @globalTrue)
!13 = distinct !DIGlobalVariable(name: "globalFalse", scope: !0, file: !8, line: 15, type: !4, isLocal: false, isDefinition: true, variable: i32* @globalFalse)
!14 = distinct !DIGlobalVariable(name: "globalFive", scope: !0, file: !8, line: 16, type: !4, isLocal: false, isDefinition: true, variable: i32* @globalFive)
!15 = !{i32 2, !"Dwarf Version", i32 4}
!16 = !{i32 2, !"Debug Info Version", i32 3}
!17 = !{!"clang version 3.9.0 (tags/RELEASE_390/final)"}
!18 = distinct !DISubprogram(name: "printHexCharLine", scope: !8, file: !8, line: 19, type: !19, isLocal: false, isDefinition: true, scopeLine: 20, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!19 = !DISubroutineType(types: !20)
!20 = !{null, !21}
!21 = !DIBasicType(name: "char", size: 8, align: 8, encoding: DW_ATE_signed_char)
!22 = !DILocalVariable(name: "charHex", arg: 1, scope: !18, file: !8, line: 19, type: !21)
!23 = !DIExpression()
!24 = !DILocation(line: 19, column: 29, scope: !18)
!25 = !DILocation(line: 21, column: 25, scope: !18)
!26 = !DILocation(line: 21, column: 20, scope: !18)
!27 = !DILocation(line: 21, column: 5, scope: !18)
!28 = !DILocation(line: 22, column: 1, scope: !18)
!29 = distinct !DISubprogram(name: "printLine", scope: !8, file: !8, line: 24, type: !30, isLocal: false, isDefinition: true, scopeLine: 25, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!30 = !DISubroutineType(types: !31)
!31 = !{null, !32}
!32 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !33, size: 64, align: 64)
!33 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !21)
!34 = !DILocalVariable(name: "line", arg: 1, scope: !29, file: !8, line: 24, type: !32)
!35 = !DILocation(line: 24, column: 30, scope: !29)
!36 = !DILocation(line: 26, column: 8, scope: !37)
!37 = distinct !DILexicalBlock(scope: !29, file: !8, line: 26, column: 8)
!38 = !DILocation(line: 26, column: 13, scope: !37)
!39 = !DILocation(line: 26, column: 8, scope: !29)
!40 = !DILocation(line: 28, column: 24, scope: !41)
!41 = distinct !DILexicalBlock(scope: !37, file: !8, line: 27, column: 5)
!42 = !DILocation(line: 28, column: 9, scope: !41)
!43 = !DILocation(line: 29, column: 5, scope: !41)
!44 = !DILocation(line: 30, column: 1, scope: !29)
!45 = distinct !DISubprogram(name: "printIntLine", scope: !8, file: !8, line: 32, type: !46, isLocal: false, isDefinition: true, scopeLine: 33, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!46 = !DISubroutineType(types: !47)
!47 = !{null, !4}
!48 = !DILocalVariable(name: "intNumber", arg: 1, scope: !45, file: !8, line: 32, type: !4)
!49 = !DILocation(line: 32, column: 24, scope: !45)
!50 = !DILocation(line: 34, column: 20, scope: !45)
!51 = !DILocation(line: 34, column: 5, scope: !45)
!52 = !DILocation(line: 35, column: 1, scope: !45)
!53 = distinct !DISubprogram(name: "printLongLine", scope: !8, file: !8, line: 37, type: !54, isLocal: false, isDefinition: true, scopeLine: 38, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!54 = !DISubroutineType(types: !55)
!55 = !{null, !56}
!56 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !57, line: 197, baseType: !58)
!57 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/sys/types.h", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/190")
!58 = !DIBasicType(name: "long int", size: 64, align: 64, encoding: DW_ATE_signed)
!59 = !DILocalVariable(name: "longIntNumber", arg: 1, scope: !53, file: !8, line: 37, type: !56)
!60 = !DILocation(line: 37, column: 29, scope: !53)
!61 = !DILocation(line: 39, column: 21, scope: !53)
!62 = !DILocation(line: 39, column: 5, scope: !53)
!63 = !DILocation(line: 40, column: 1, scope: !53)
!64 = distinct !DISubprogram(name: "bad36", scope: !8, file: !8, line: 44, type: !65, isLocal: false, isDefinition: true, scopeLine: 45, isOptimized: false, unit: !0, variables: !2)
!65 = !DISubroutineType(types: !66)
!66 = !{null}
!67 = !DILocalVariable(name: "data", scope: !64, file: !8, line: 46, type: !4)
!68 = !DILocation(line: 46, column: 9, scope: !64)
!69 = !DILocation(line: 48, column: 10, scope: !64)
!70 = !DILocation(line: 49, column: 8, scope: !71)
!71 = distinct !DILexicalBlock(scope: !64, file: !8, line: 49, column: 8)
!72 = !DILocation(line: 49, column: 8, scope: !64)
!73 = !DILocation(line: 52, column: 16, scope: !74)
!74 = distinct !DILexicalBlock(scope: !71, file: !8, line: 50, column: 5)
!75 = !DILocation(line: 52, column: 9, scope: !74)
!76 = !DILocation(line: 53, column: 5, scope: !74)
!77 = !DILocation(line: 54, column: 8, scope: !78)
!78 = distinct !DILexicalBlock(scope: !64, file: !8, line: 54, column: 8)
!79 = !DILocation(line: 54, column: 8, scope: !64)
!80 = !DILocalVariable(name: "result", scope: !81, file: !8, line: 58, type: !4)
!81 = distinct !DILexicalBlock(scope: !82, file: !8, line: 56, column: 9)
!82 = distinct !DILexicalBlock(scope: !78, file: !8, line: 55, column: 5)
!83 = !DILocation(line: 58, column: 17, scope: !81)
!84 = !DILocation(line: 58, column: 26, scope: !81)
!85 = !DILocation(line: 58, column: 31, scope: !81)
!86 = !DILocation(line: 59, column: 26, scope: !81)
!87 = !DILocation(line: 59, column: 13, scope: !81)
!88 = !DILocation(line: 61, column: 5, scope: !82)
!89 = !DILocation(line: 62, column: 1, scope: !64)
!90 = distinct !DISubprogram(name: "good36", scope: !8, file: !8, line: 69, type: !65, isLocal: false, isDefinition: true, scopeLine: 70, isOptimized: false, unit: !0, variables: !2)
!91 = !DILocalVariable(name: "data", scope: !90, file: !8, line: 71, type: !4)
!92 = !DILocation(line: 71, column: 9, scope: !90)
!93 = !DILocation(line: 73, column: 10, scope: !90)
!94 = !DILocation(line: 74, column: 8, scope: !95)
!95 = distinct !DILexicalBlock(scope: !90, file: !8, line: 74, column: 8)
!96 = !DILocation(line: 74, column: 8, scope: !90)
!97 = !DILocation(line: 77, column: 16, scope: !98)
!98 = distinct !DILexicalBlock(scope: !95, file: !8, line: 75, column: 5)
!99 = !DILocation(line: 77, column: 9, scope: !98)
!100 = !DILocation(line: 78, column: 5, scope: !98)
!101 = !DILocation(line: 79, column: 8, scope: !102)
!102 = distinct !DILexicalBlock(scope: !90, file: !8, line: 79, column: 8)
!103 = !DILocation(line: 79, column: 8, scope: !90)
!104 = !DILocation(line: 82, column: 9, scope: !105)
!105 = distinct !DILexicalBlock(scope: !102, file: !8, line: 80, column: 5)
!106 = !DILocation(line: 83, column: 5, scope: !105)
!107 = !DILocation(line: 87, column: 13, scope: !108)
!108 = distinct !DILexicalBlock(scope: !109, file: !8, line: 87, column: 13)
!109 = distinct !DILexicalBlock(scope: !102, file: !8, line: 85, column: 5)
!110 = !DILocation(line: 87, column: 18, scope: !108)
!111 = !DILocation(line: 87, column: 13, scope: !109)
!112 = !DILocalVariable(name: "result", scope: !113, file: !8, line: 89, type: !4)
!113 = distinct !DILexicalBlock(scope: !108, file: !8, line: 88, column: 9)
!114 = !DILocation(line: 89, column: 17, scope: !113)
!115 = !DILocation(line: 89, column: 26, scope: !113)
!116 = !DILocation(line: 89, column: 31, scope: !113)
!117 = !DILocation(line: 90, column: 26, scope: !113)
!118 = !DILocation(line: 90, column: 13, scope: !113)
!119 = !DILocation(line: 91, column: 9, scope: !113)
!120 = !DILocation(line: 94, column: 13, scope: !121)
!121 = distinct !DILexicalBlock(scope: !108, file: !8, line: 93, column: 9)
!122 = !DILocation(line: 97, column: 1, scope: !90)
!123 = distinct !DISubprogram(name: "main", scope: !8, file: !8, line: 101, type: !124, isLocal: false, isDefinition: true, scopeLine: 101, isOptimized: false, unit: !0, variables: !2)
!124 = !DISubroutineType(types: !125)
!125 = !{!4}
!126 = !DILocation(line: 102, column: 5, scope: !123)
!127 = !DILocation(line: 103, column: 5, scope: !123)
!128 = !DILocation(line: 104, column: 5, scope: !123)
