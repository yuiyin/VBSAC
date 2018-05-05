; ModuleID = './190_50.c'
source_filename = "./190_50.c"
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

; Function Attrs: nounwind uwtable
define i32 @globalReturnsTrue() #0 !dbg !18 {
entry:
  ret i32 1, !dbg !21
}

; Function Attrs: nounwind uwtable
define i32 @globalReturnsFalse() #0 !dbg !22 {
entry:
  ret i32 0, !dbg !23
}

; Function Attrs: nounwind uwtable
define i32 @globalReturnsTrueOrFalse() #0 !dbg !24 {
entry:
  %call = call i32 @rand() #4, !dbg !25
  %rem = srem i32 %call, 2, !dbg !26
  ret i32 %rem, !dbg !27
}

; Function Attrs: nounwind
declare i32 @rand() #1

; Function Attrs: nounwind uwtable
define void @printHexCharLine(i8 signext %charHex) #0 !dbg !28 {
entry:
  %charHex.addr = alloca i8, align 1
  store i8 %charHex, i8* %charHex.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %charHex.addr, metadata !32, metadata !33), !dbg !34
  %0 = load i8, i8* %charHex.addr, align 1, !dbg !35
  %conv = sext i8 %0 to i32, !dbg !36
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), i32 %conv), !dbg !37
  ret void, !dbg !38
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #2

declare i32 @printf(i8*, ...) #3

; Function Attrs: nounwind uwtable
define void @printLine(i8* %line) #0 !dbg !39 {
entry:
  %line.addr = alloca i8*, align 8
  store i8* %line, i8** %line.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %line.addr, metadata !44, metadata !33), !dbg !45
  %0 = load i8*, i8** %line.addr, align 8, !dbg !46
  %cmp = icmp ne i8* %0, null, !dbg !48
  br i1 %cmp, label %if.then, label %if.end, !dbg !49

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** %line.addr, align 8, !dbg !50
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i32 0, i32 0), i8* %1), !dbg !52
  br label %if.end, !dbg !53

if.end:                                           ; preds = %if.then, %entry
  ret void, !dbg !54
}

; Function Attrs: nounwind uwtable
define void @printIntLine(i32 %intNumber) #0 !dbg !55 {
entry:
  %intNumber.addr = alloca i32, align 4
  store i32 %intNumber, i32* %intNumber.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %intNumber.addr, metadata !58, metadata !33), !dbg !59
  %0 = load i32, i32* %intNumber.addr, align 4, !dbg !60
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), i32 %0), !dbg !61
  ret void, !dbg !62
}

; Function Attrs: nounwind uwtable
define void @printLongLine(i64 %longIntNumber) #0 !dbg !63 {
entry:
  %longIntNumber.addr = alloca i64, align 8
  store i64 %longIntNumber, i64* %longIntNumber.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %longIntNumber.addr, metadata !69, metadata !33), !dbg !70
  %0 = load i64, i64* %longIntNumber.addr, align 8, !dbg !71
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.2, i32 0, i32 0), i64 %0), !dbg !72
  ret void, !dbg !73
}

; Function Attrs: nounwind uwtable
define void @bad50() #0 !dbg !74 {
entry:
  %data = alloca i32, align 4
  %dataPtr1 = alloca i32*, align 8
  %dataPtr2 = alloca i32*, align 8
  %data1 = alloca i32, align 4
  %data2 = alloca i32, align 4
  %result = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !77, metadata !33), !dbg !78
  call void @llvm.dbg.declare(metadata i32** %dataPtr1, metadata !79, metadata !33), !dbg !81
  store i32* %data, i32** %dataPtr1, align 8, !dbg !81
  call void @llvm.dbg.declare(metadata i32** %dataPtr2, metadata !82, metadata !33), !dbg !83
  store i32* %data, i32** %dataPtr2, align 8, !dbg !83
  store i32 0, i32* %data, align 4, !dbg !84
  call void @llvm.dbg.declare(metadata i32* %data1, metadata !85, metadata !33), !dbg !87
  %0 = load i32*, i32** %dataPtr1, align 8, !dbg !88
  %1 = load i32, i32* %0, align 4, !dbg !89
  store i32 %1, i32* %data1, align 4, !dbg !87
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !90
  %call = call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i32 0, i32 0), i32* %data1), !dbg !91
  %3 = load i32, i32* %data1, align 4, !dbg !92
  %4 = load i32*, i32** %dataPtr1, align 8, !dbg !93
  store i32 %3, i32* %4, align 4, !dbg !94
  call void @llvm.dbg.declare(metadata i32* %data2, metadata !95, metadata !33), !dbg !97
  %5 = load i32*, i32** %dataPtr2, align 8, !dbg !98
  %6 = load i32, i32* %5, align 4, !dbg !99
  store i32 %6, i32* %data2, align 4, !dbg !97
  call void @llvm.dbg.declare(metadata i32* %result, metadata !100, metadata !33), !dbg !102
  %7 = load i32, i32* %data2, align 4, !dbg !103
  %add = add nsw i32 %7, 1, !dbg !104
  store i32 %add, i32* %result, align 4, !dbg !102
  %8 = load i32, i32* %result, align 4, !dbg !105
  call void @printIntLine(i32 %8), !dbg !106
  ret void, !dbg !107
}

declare i32 @__isoc99_fscanf(%struct._IO_FILE*, i8*, ...) #3

; Function Attrs: nounwind uwtable
define void @good50() #0 !dbg !108 {
entry:
  %data = alloca i32, align 4
  %dataPtr1 = alloca i32*, align 8
  %dataPtr2 = alloca i32*, align 8
  %data1 = alloca i32, align 4
  %data2 = alloca i32, align 4
  %result = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !109, metadata !33), !dbg !110
  call void @llvm.dbg.declare(metadata i32** %dataPtr1, metadata !111, metadata !33), !dbg !112
  store i32* %data, i32** %dataPtr1, align 8, !dbg !112
  call void @llvm.dbg.declare(metadata i32** %dataPtr2, metadata !113, metadata !33), !dbg !114
  store i32* %data, i32** %dataPtr2, align 8, !dbg !114
  store i32 0, i32* %data, align 4, !dbg !115
  call void @llvm.dbg.declare(metadata i32* %data1, metadata !116, metadata !33), !dbg !118
  %0 = load i32*, i32** %dataPtr1, align 8, !dbg !119
  %1 = load i32, i32* %0, align 4, !dbg !120
  store i32 %1, i32* %data1, align 4, !dbg !118
  store i32 2, i32* %data1, align 4, !dbg !121
  %2 = load i32, i32* %data1, align 4, !dbg !122
  %3 = load i32*, i32** %dataPtr1, align 8, !dbg !123
  store i32 %2, i32* %3, align 4, !dbg !124
  call void @llvm.dbg.declare(metadata i32* %data2, metadata !125, metadata !33), !dbg !127
  %4 = load i32*, i32** %dataPtr2, align 8, !dbg !128
  %5 = load i32, i32* %4, align 4, !dbg !129
  store i32 %5, i32* %data2, align 4, !dbg !127
  call void @llvm.dbg.declare(metadata i32* %result, metadata !130, metadata !33), !dbg !132
  %6 = load i32, i32* %data2, align 4, !dbg !133
  %add = add nsw i32 %6, 1, !dbg !134
  store i32 %add, i32* %result, align 4, !dbg !132
  %7 = load i32, i32* %result, align 4, !dbg !135
  call void @printIntLine(i32 %7), !dbg !136
  ret void, !dbg !137
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !138 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @good50(), !dbg !139
  call void @bad50(), !dbg !140
  ret i32 1, !dbg !141
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone }
attributes #3 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!15, !16}
!llvm.ident = !{!17}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (tags/RELEASE_390/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, globals: !6)
!1 = !DIFile(filename: "190_50.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/190")
!2 = !{}
!3 = !{!4, !5}
!4 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64, align: 64)
!6 = !{!7, !10, !11, !12, !13, !14}
!7 = distinct !DIGlobalVariable(name: "GLOBAL_CONST_TRUE", scope: !0, file: !8, line: 10, type: !9, isLocal: false, isDefinition: true, variable: i32* @GLOBAL_CONST_TRUE)
!8 = !DIFile(filename: "./190_50.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/190")
!9 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !4)
!10 = distinct !DIGlobalVariable(name: "GLOBAL_CONST_FALSE", scope: !0, file: !8, line: 11, type: !9, isLocal: false, isDefinition: true, variable: i32* @GLOBAL_CONST_FALSE)
!11 = distinct !DIGlobalVariable(name: "GLOBAL_CONST_FIVE", scope: !0, file: !8, line: 12, type: !9, isLocal: false, isDefinition: true, variable: i32* @GLOBAL_CONST_FIVE)
!12 = distinct !DIGlobalVariable(name: "globalTrue", scope: !0, file: !8, line: 14, type: !4, isLocal: false, isDefinition: true, variable: i32* @globalTrue)
!13 = distinct !DIGlobalVariable(name: "globalFalse", scope: !0, file: !8, line: 15, type: !4, isLocal: false, isDefinition: true, variable: i32* @globalFalse)
!14 = distinct !DIGlobalVariable(name: "globalFive", scope: !0, file: !8, line: 16, type: !4, isLocal: false, isDefinition: true, variable: i32* @globalFive)
!15 = !{i32 2, !"Dwarf Version", i32 4}
!16 = !{i32 2, !"Debug Info Version", i32 3}
!17 = !{!"clang version 3.9.0 (tags/RELEASE_390/final)"}
!18 = distinct !DISubprogram(name: "globalReturnsTrue", scope: !8, file: !8, line: 18, type: !19, isLocal: false, isDefinition: true, scopeLine: 19, isOptimized: false, unit: !0, variables: !2)
!19 = !DISubroutineType(types: !20)
!20 = !{!4}
!21 = !DILocation(line: 20, column: 5, scope: !18)
!22 = distinct !DISubprogram(name: "globalReturnsFalse", scope: !8, file: !8, line: 23, type: !19, isLocal: false, isDefinition: true, scopeLine: 24, isOptimized: false, unit: !0, variables: !2)
!23 = !DILocation(line: 25, column: 5, scope: !22)
!24 = distinct !DISubprogram(name: "globalReturnsTrueOrFalse", scope: !8, file: !8, line: 28, type: !19, isLocal: false, isDefinition: true, scopeLine: 29, isOptimized: false, unit: !0, variables: !2)
!25 = !DILocation(line: 30, column: 13, scope: !24)
!26 = !DILocation(line: 30, column: 20, scope: !24)
!27 = !DILocation(line: 30, column: 5, scope: !24)
!28 = distinct !DISubprogram(name: "printHexCharLine", scope: !8, file: !8, line: 33, type: !29, isLocal: false, isDefinition: true, scopeLine: 34, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!29 = !DISubroutineType(types: !30)
!30 = !{null, !31}
!31 = !DIBasicType(name: "char", size: 8, align: 8, encoding: DW_ATE_signed_char)
!32 = !DILocalVariable(name: "charHex", arg: 1, scope: !28, file: !8, line: 33, type: !31)
!33 = !DIExpression()
!34 = !DILocation(line: 33, column: 29, scope: !28)
!35 = !DILocation(line: 35, column: 25, scope: !28)
!36 = !DILocation(line: 35, column: 20, scope: !28)
!37 = !DILocation(line: 35, column: 5, scope: !28)
!38 = !DILocation(line: 36, column: 1, scope: !28)
!39 = distinct !DISubprogram(name: "printLine", scope: !8, file: !8, line: 38, type: !40, isLocal: false, isDefinition: true, scopeLine: 39, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!40 = !DISubroutineType(types: !41)
!41 = !{null, !42}
!42 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !43, size: 64, align: 64)
!43 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !31)
!44 = !DILocalVariable(name: "line", arg: 1, scope: !39, file: !8, line: 38, type: !42)
!45 = !DILocation(line: 38, column: 30, scope: !39)
!46 = !DILocation(line: 40, column: 8, scope: !47)
!47 = distinct !DILexicalBlock(scope: !39, file: !8, line: 40, column: 8)
!48 = !DILocation(line: 40, column: 13, scope: !47)
!49 = !DILocation(line: 40, column: 8, scope: !39)
!50 = !DILocation(line: 42, column: 24, scope: !51)
!51 = distinct !DILexicalBlock(scope: !47, file: !8, line: 41, column: 5)
!52 = !DILocation(line: 42, column: 9, scope: !51)
!53 = !DILocation(line: 43, column: 5, scope: !51)
!54 = !DILocation(line: 44, column: 1, scope: !39)
!55 = distinct !DISubprogram(name: "printIntLine", scope: !8, file: !8, line: 46, type: !56, isLocal: false, isDefinition: true, scopeLine: 47, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!56 = !DISubroutineType(types: !57)
!57 = !{null, !4}
!58 = !DILocalVariable(name: "intNumber", arg: 1, scope: !55, file: !8, line: 46, type: !4)
!59 = !DILocation(line: 46, column: 24, scope: !55)
!60 = !DILocation(line: 48, column: 20, scope: !55)
!61 = !DILocation(line: 48, column: 5, scope: !55)
!62 = !DILocation(line: 49, column: 1, scope: !55)
!63 = distinct !DISubprogram(name: "printLongLine", scope: !8, file: !8, line: 51, type: !64, isLocal: false, isDefinition: true, scopeLine: 52, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!64 = !DISubroutineType(types: !65)
!65 = !{null, !66}
!66 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !67, line: 197, baseType: !68)
!67 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/sys/types.h", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/190")
!68 = !DIBasicType(name: "long int", size: 64, align: 64, encoding: DW_ATE_signed)
!69 = !DILocalVariable(name: "longIntNumber", arg: 1, scope: !63, file: !8, line: 51, type: !66)
!70 = !DILocation(line: 51, column: 29, scope: !63)
!71 = !DILocation(line: 53, column: 21, scope: !63)
!72 = !DILocation(line: 53, column: 5, scope: !63)
!73 = !DILocation(line: 54, column: 1, scope: !63)
!74 = distinct !DISubprogram(name: "bad50", scope: !8, file: !8, line: 58, type: !75, isLocal: false, isDefinition: true, scopeLine: 59, isOptimized: false, unit: !0, variables: !2)
!75 = !DISubroutineType(types: !76)
!76 = !{null}
!77 = !DILocalVariable(name: "data", scope: !74, file: !8, line: 60, type: !4)
!78 = !DILocation(line: 60, column: 9, scope: !74)
!79 = !DILocalVariable(name: "dataPtr1", scope: !74, file: !8, line: 61, type: !80)
!80 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64, align: 64)
!81 = !DILocation(line: 61, column: 10, scope: !74)
!82 = !DILocalVariable(name: "dataPtr2", scope: !74, file: !8, line: 62, type: !80)
!83 = !DILocation(line: 62, column: 10, scope: !74)
!84 = !DILocation(line: 64, column: 10, scope: !74)
!85 = !DILocalVariable(name: "data", scope: !86, file: !8, line: 66, type: !4)
!86 = distinct !DILexicalBlock(scope: !74, file: !8, line: 65, column: 5)
!87 = !DILocation(line: 66, column: 13, scope: !86)
!88 = !DILocation(line: 66, column: 21, scope: !86)
!89 = !DILocation(line: 66, column: 20, scope: !86)
!90 = !DILocation(line: 68, column: 16, scope: !86)
!91 = !DILocation(line: 68, column: 9, scope: !86)
!92 = !DILocation(line: 69, column: 21, scope: !86)
!93 = !DILocation(line: 69, column: 10, scope: !86)
!94 = !DILocation(line: 69, column: 19, scope: !86)
!95 = !DILocalVariable(name: "data", scope: !96, file: !8, line: 72, type: !4)
!96 = distinct !DILexicalBlock(scope: !74, file: !8, line: 71, column: 5)
!97 = !DILocation(line: 72, column: 13, scope: !96)
!98 = !DILocation(line: 72, column: 21, scope: !96)
!99 = !DILocation(line: 72, column: 20, scope: !96)
!100 = !DILocalVariable(name: "result", scope: !101, file: !8, line: 75, type: !4)
!101 = distinct !DILexicalBlock(scope: !96, file: !8, line: 73, column: 9)
!102 = !DILocation(line: 75, column: 17, scope: !101)
!103 = !DILocation(line: 75, column: 26, scope: !101)
!104 = !DILocation(line: 75, column: 31, scope: !101)
!105 = !DILocation(line: 76, column: 26, scope: !101)
!106 = !DILocation(line: 76, column: 13, scope: !101)
!107 = !DILocation(line: 79, column: 1, scope: !74)
!108 = distinct !DISubprogram(name: "good50", scope: !8, file: !8, line: 85, type: !75, isLocal: false, isDefinition: true, scopeLine: 86, isOptimized: false, unit: !0, variables: !2)
!109 = !DILocalVariable(name: "data", scope: !108, file: !8, line: 87, type: !4)
!110 = !DILocation(line: 87, column: 9, scope: !108)
!111 = !DILocalVariable(name: "dataPtr1", scope: !108, file: !8, line: 88, type: !80)
!112 = !DILocation(line: 88, column: 10, scope: !108)
!113 = !DILocalVariable(name: "dataPtr2", scope: !108, file: !8, line: 89, type: !80)
!114 = !DILocation(line: 89, column: 10, scope: !108)
!115 = !DILocation(line: 91, column: 10, scope: !108)
!116 = !DILocalVariable(name: "data", scope: !117, file: !8, line: 93, type: !4)
!117 = distinct !DILexicalBlock(scope: !108, file: !8, line: 92, column: 5)
!118 = !DILocation(line: 93, column: 13, scope: !117)
!119 = !DILocation(line: 93, column: 21, scope: !117)
!120 = !DILocation(line: 93, column: 20, scope: !117)
!121 = !DILocation(line: 95, column: 14, scope: !117)
!122 = !DILocation(line: 96, column: 21, scope: !117)
!123 = !DILocation(line: 96, column: 10, scope: !117)
!124 = !DILocation(line: 96, column: 19, scope: !117)
!125 = !DILocalVariable(name: "data", scope: !126, file: !8, line: 99, type: !4)
!126 = distinct !DILexicalBlock(scope: !108, file: !8, line: 98, column: 5)
!127 = !DILocation(line: 99, column: 13, scope: !126)
!128 = !DILocation(line: 99, column: 21, scope: !126)
!129 = !DILocation(line: 99, column: 20, scope: !126)
!130 = !DILocalVariable(name: "result", scope: !131, file: !8, line: 102, type: !4)
!131 = distinct !DILexicalBlock(scope: !126, file: !8, line: 100, column: 9)
!132 = !DILocation(line: 102, column: 17, scope: !131)
!133 = !DILocation(line: 102, column: 26, scope: !131)
!134 = !DILocation(line: 102, column: 31, scope: !131)
!135 = !DILocation(line: 103, column: 26, scope: !131)
!136 = !DILocation(line: 103, column: 13, scope: !131)
!137 = !DILocation(line: 106, column: 1, scope: !108)
!138 = distinct !DISubprogram(name: "main", scope: !8, file: !8, line: 111, type: !19, isLocal: false, isDefinition: true, scopeLine: 111, isOptimized: false, unit: !0, variables: !2)
!139 = !DILocation(line: 112, column: 5, scope: !138)
!140 = !DILocation(line: 113, column: 5, scope: !138)
!141 = !DILocation(line: 114, column: 5, scope: !138)
