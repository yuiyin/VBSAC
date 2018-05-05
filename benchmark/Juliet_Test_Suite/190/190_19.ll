; ModuleID = './190_19.c'
source_filename = "./190_19.c"
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
@badStatic = internal global i32 0, align 4
@goodStatic = internal global i32 0, align 4
@.str.3 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@.str.4 = private unnamed_addr constant [54 x i8] c"data value is too large to perform arithmetic safely.\00", align 1

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
define void @bad19() #0 !dbg !76 {
entry:
  %data = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !79, metadata !35), !dbg !80
  store i32 0, i32* %data, align 4, !dbg !81
  store i32 2147483647, i32* %data, align 4, !dbg !82
  store i32 1, i32* @badStatic, align 4, !dbg !83
  %0 = load i32, i32* %data, align 4, !dbg !84
  call void @badSink(i32 %0), !dbg !85
  ret void, !dbg !86
}

; Function Attrs: nounwind uwtable
define internal void @badSink(i32 %data) #0 !dbg !87 {
entry:
  %data.addr = alloca i32, align 4
  %result = alloca i32, align 4
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !88, metadata !35), !dbg !89
  %0 = load i32, i32* @badStatic, align 4, !dbg !90
  %tobool = icmp ne i32 %0, 0, !dbg !90
  br i1 %tobool, label %if.then, label %if.end, !dbg !92

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %result, metadata !93, metadata !35), !dbg !96
  %1 = load i32, i32* %data.addr, align 4, !dbg !97
  %add = add nsw i32 %1, 1, !dbg !98
  store i32 %add, i32* %result, align 4, !dbg !96
  %2 = load i32, i32* %result, align 4, !dbg !99
  call void @printIntLine(i32 %2), !dbg !100
  br label %if.end, !dbg !101

if.end:                                           ; preds = %if.then, %entry
  ret void, !dbg !102
}

; Function Attrs: nounwind uwtable
define void @good19() #0 !dbg !103 {
entry:
  %data = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !104, metadata !35), !dbg !105
  store i32 0, i32* %data, align 4, !dbg !106
  store i32 2147483647, i32* %data, align 4, !dbg !107
  store i32 0, i32* @goodStatic, align 4, !dbg !108
  %0 = load i32, i32* %data, align 4, !dbg !109
  call void @goodSink(i32 %0), !dbg !110
  ret void, !dbg !111
}

; Function Attrs: nounwind uwtable
define internal void @goodSink(i32 %data) #0 !dbg !112 {
entry:
  %data.addr = alloca i32, align 4
  %result = alloca i32, align 4
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !113, metadata !35), !dbg !114
  %0 = load i32, i32* @goodStatic, align 4, !dbg !115
  %tobool = icmp ne i32 %0, 0, !dbg !115
  br i1 %tobool, label %if.then, label %if.else, !dbg !117

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.3, i32 0, i32 0)), !dbg !118
  br label %if.end3, !dbg !120

if.else:                                          ; preds = %entry
  %1 = load i32, i32* %data.addr, align 4, !dbg !121
  %cmp = icmp slt i32 %1, 2147483647, !dbg !124
  br i1 %cmp, label %if.then1, label %if.else2, !dbg !125

if.then1:                                         ; preds = %if.else
  call void @llvm.dbg.declare(metadata i32* %result, metadata !126, metadata !35), !dbg !128
  %2 = load i32, i32* %data.addr, align 4, !dbg !129
  %add = add nsw i32 %2, 1, !dbg !130
  store i32 %add, i32* %result, align 4, !dbg !128
  %3 = load i32, i32* %result, align 4, !dbg !131
  call void @printIntLine(i32 %3), !dbg !132
  br label %if.end, !dbg !133

if.else2:                                         ; preds = %if.else
  call void @printLine(i8* getelementptr inbounds ([54 x i8], [54 x i8]* @.str.4, i32 0, i32 0)), !dbg !134
  br label %if.end

if.end:                                           ; preds = %if.else2, %if.then1
  br label %if.end3

if.end3:                                          ; preds = %if.end, %if.then
  ret void, !dbg !136
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !137 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @good19(), !dbg !138
  call void @bad19(), !dbg !139
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

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (tags/RELEASE_390/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, globals: !6)
!1 = !DIFile(filename: "190_19.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/190")
!2 = !{}
!3 = !{!4, !5}
!4 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64, align: 64)
!6 = !{!7, !10, !11, !12, !13, !14, !15, !16}
!7 = distinct !DIGlobalVariable(name: "GLOBAL_CONST_TRUE", scope: !0, file: !8, line: 10, type: !9, isLocal: false, isDefinition: true, variable: i32* @GLOBAL_CONST_TRUE)
!8 = !DIFile(filename: "./190_19.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/190")
!9 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !4)
!10 = distinct !DIGlobalVariable(name: "GLOBAL_CONST_FALSE", scope: !0, file: !8, line: 11, type: !9, isLocal: false, isDefinition: true, variable: i32* @GLOBAL_CONST_FALSE)
!11 = distinct !DIGlobalVariable(name: "GLOBAL_CONST_FIVE", scope: !0, file: !8, line: 12, type: !9, isLocal: false, isDefinition: true, variable: i32* @GLOBAL_CONST_FIVE)
!12 = distinct !DIGlobalVariable(name: "globalTrue", scope: !0, file: !8, line: 14, type: !4, isLocal: false, isDefinition: true, variable: i32* @globalTrue)
!13 = distinct !DIGlobalVariable(name: "globalFalse", scope: !0, file: !8, line: 15, type: !4, isLocal: false, isDefinition: true, variable: i32* @globalFalse)
!14 = distinct !DIGlobalVariable(name: "globalFive", scope: !0, file: !8, line: 16, type: !4, isLocal: false, isDefinition: true, variable: i32* @globalFive)
!15 = distinct !DIGlobalVariable(name: "badStatic", scope: !0, file: !8, line: 60, type: !4, isLocal: true, isDefinition: true, variable: i32* @badStatic)
!16 = distinct !DIGlobalVariable(name: "goodStatic", scope: !0, file: !8, line: 61, type: !4, isLocal: true, isDefinition: true, variable: i32* @goodStatic)
!17 = !{i32 2, !"Dwarf Version", i32 4}
!18 = !{i32 2, !"Debug Info Version", i32 3}
!19 = !{!"clang version 3.9.0 (tags/RELEASE_390/final)"}
!20 = distinct !DISubprogram(name: "globalReturnsTrue", scope: !8, file: !8, line: 20, type: !21, isLocal: false, isDefinition: true, scopeLine: 21, isOptimized: false, unit: !0, variables: !2)
!21 = !DISubroutineType(types: !22)
!22 = !{!4}
!23 = !DILocation(line: 22, column: 5, scope: !20)
!24 = distinct !DISubprogram(name: "globalReturnsFalse", scope: !8, file: !8, line: 25, type: !21, isLocal: false, isDefinition: true, scopeLine: 26, isOptimized: false, unit: !0, variables: !2)
!25 = !DILocation(line: 27, column: 5, scope: !24)
!26 = distinct !DISubprogram(name: "globalReturnsTrueOrFalse", scope: !8, file: !8, line: 30, type: !21, isLocal: false, isDefinition: true, scopeLine: 31, isOptimized: false, unit: !0, variables: !2)
!27 = !DILocation(line: 32, column: 13, scope: !26)
!28 = !DILocation(line: 32, column: 20, scope: !26)
!29 = !DILocation(line: 32, column: 5, scope: !26)
!30 = distinct !DISubprogram(name: "printHexCharLine", scope: !8, file: !8, line: 36, type: !31, isLocal: false, isDefinition: true, scopeLine: 37, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!31 = !DISubroutineType(types: !32)
!32 = !{null, !33}
!33 = !DIBasicType(name: "char", size: 8, align: 8, encoding: DW_ATE_signed_char)
!34 = !DILocalVariable(name: "charHex", arg: 1, scope: !30, file: !8, line: 36, type: !33)
!35 = !DIExpression()
!36 = !DILocation(line: 36, column: 29, scope: !30)
!37 = !DILocation(line: 38, column: 25, scope: !30)
!38 = !DILocation(line: 38, column: 20, scope: !30)
!39 = !DILocation(line: 38, column: 5, scope: !30)
!40 = !DILocation(line: 39, column: 1, scope: !30)
!41 = distinct !DISubprogram(name: "printLine", scope: !8, file: !8, line: 41, type: !42, isLocal: false, isDefinition: true, scopeLine: 42, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!42 = !DISubroutineType(types: !43)
!43 = !{null, !44}
!44 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !45, size: 64, align: 64)
!45 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !33)
!46 = !DILocalVariable(name: "line", arg: 1, scope: !41, file: !8, line: 41, type: !44)
!47 = !DILocation(line: 41, column: 30, scope: !41)
!48 = !DILocation(line: 43, column: 8, scope: !49)
!49 = distinct !DILexicalBlock(scope: !41, file: !8, line: 43, column: 8)
!50 = !DILocation(line: 43, column: 13, scope: !49)
!51 = !DILocation(line: 43, column: 8, scope: !41)
!52 = !DILocation(line: 45, column: 24, scope: !53)
!53 = distinct !DILexicalBlock(scope: !49, file: !8, line: 44, column: 5)
!54 = !DILocation(line: 45, column: 9, scope: !53)
!55 = !DILocation(line: 46, column: 5, scope: !53)
!56 = !DILocation(line: 47, column: 1, scope: !41)
!57 = distinct !DISubprogram(name: "printIntLine", scope: !8, file: !8, line: 49, type: !58, isLocal: false, isDefinition: true, scopeLine: 50, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!58 = !DISubroutineType(types: !59)
!59 = !{null, !4}
!60 = !DILocalVariable(name: "intNumber", arg: 1, scope: !57, file: !8, line: 49, type: !4)
!61 = !DILocation(line: 49, column: 24, scope: !57)
!62 = !DILocation(line: 51, column: 20, scope: !57)
!63 = !DILocation(line: 51, column: 5, scope: !57)
!64 = !DILocation(line: 52, column: 1, scope: !57)
!65 = distinct !DISubprogram(name: "printLongLine", scope: !8, file: !8, line: 54, type: !66, isLocal: false, isDefinition: true, scopeLine: 55, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!66 = !DISubroutineType(types: !67)
!67 = !{null, !68}
!68 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !69, line: 197, baseType: !70)
!69 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/sys/types.h", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/190")
!70 = !DIBasicType(name: "long int", size: 64, align: 64, encoding: DW_ATE_signed)
!71 = !DILocalVariable(name: "longIntNumber", arg: 1, scope: !65, file: !8, line: 54, type: !68)
!72 = !DILocation(line: 54, column: 29, scope: !65)
!73 = !DILocation(line: 56, column: 21, scope: !65)
!74 = !DILocation(line: 56, column: 5, scope: !65)
!75 = !DILocation(line: 57, column: 1, scope: !65)
!76 = distinct !DISubprogram(name: "bad19", scope: !8, file: !8, line: 97, type: !77, isLocal: false, isDefinition: true, scopeLine: 98, isOptimized: false, unit: !0, variables: !2)
!77 = !DISubroutineType(types: !78)
!78 = !{null}
!79 = !DILocalVariable(name: "data", scope: !76, file: !8, line: 99, type: !4)
!80 = !DILocation(line: 99, column: 9, scope: !76)
!81 = !DILocation(line: 101, column: 10, scope: !76)
!82 = !DILocation(line: 103, column: 10, scope: !76)
!83 = !DILocation(line: 104, column: 15, scope: !76)
!84 = !DILocation(line: 105, column: 13, scope: !76)
!85 = !DILocation(line: 105, column: 5, scope: !76)
!86 = !DILocation(line: 106, column: 1, scope: !76)
!87 = distinct !DISubprogram(name: "badSink", scope: !8, file: !8, line: 63, type: !58, isLocal: true, isDefinition: true, scopeLine: 64, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!88 = !DILocalVariable(name: "data", arg: 1, scope: !87, file: !8, line: 63, type: !4)
!89 = !DILocation(line: 63, column: 25, scope: !87)
!90 = !DILocation(line: 65, column: 8, scope: !91)
!91 = distinct !DILexicalBlock(scope: !87, file: !8, line: 65, column: 8)
!92 = !DILocation(line: 65, column: 8, scope: !87)
!93 = !DILocalVariable(name: "result", scope: !94, file: !8, line: 69, type: !4)
!94 = distinct !DILexicalBlock(scope: !95, file: !8, line: 67, column: 9)
!95 = distinct !DILexicalBlock(scope: !91, file: !8, line: 66, column: 5)
!96 = !DILocation(line: 69, column: 17, scope: !94)
!97 = !DILocation(line: 69, column: 26, scope: !94)
!98 = !DILocation(line: 69, column: 31, scope: !94)
!99 = !DILocation(line: 70, column: 26, scope: !94)
!100 = !DILocation(line: 70, column: 13, scope: !94)
!101 = !DILocation(line: 72, column: 5, scope: !95)
!102 = !DILocation(line: 73, column: 1, scope: !87)
!103 = distinct !DISubprogram(name: "good19", scope: !8, file: !8, line: 108, type: !77, isLocal: false, isDefinition: true, scopeLine: 109, isOptimized: false, unit: !0, variables: !2)
!104 = !DILocalVariable(name: "data", scope: !103, file: !8, line: 110, type: !4)
!105 = !DILocation(line: 110, column: 9, scope: !103)
!106 = !DILocation(line: 112, column: 10, scope: !103)
!107 = !DILocation(line: 114, column: 10, scope: !103)
!108 = !DILocation(line: 115, column: 16, scope: !103)
!109 = !DILocation(line: 116, column: 14, scope: !103)
!110 = !DILocation(line: 116, column: 5, scope: !103)
!111 = !DILocation(line: 117, column: 1, scope: !103)
!112 = distinct !DISubprogram(name: "goodSink", scope: !8, file: !8, line: 75, type: !58, isLocal: true, isDefinition: true, scopeLine: 76, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!113 = !DILocalVariable(name: "data", arg: 1, scope: !112, file: !8, line: 75, type: !4)
!114 = !DILocation(line: 75, column: 26, scope: !112)
!115 = !DILocation(line: 77, column: 8, scope: !116)
!116 = distinct !DILexicalBlock(scope: !112, file: !8, line: 77, column: 8)
!117 = !DILocation(line: 77, column: 8, scope: !112)
!118 = !DILocation(line: 80, column: 9, scope: !119)
!119 = distinct !DILexicalBlock(scope: !116, file: !8, line: 78, column: 5)
!120 = !DILocation(line: 81, column: 5, scope: !119)
!121 = !DILocation(line: 85, column: 13, scope: !122)
!122 = distinct !DILexicalBlock(scope: !123, file: !8, line: 85, column: 13)
!123 = distinct !DILexicalBlock(scope: !116, file: !8, line: 83, column: 5)
!124 = !DILocation(line: 85, column: 18, scope: !122)
!125 = !DILocation(line: 85, column: 13, scope: !123)
!126 = !DILocalVariable(name: "result", scope: !127, file: !8, line: 87, type: !4)
!127 = distinct !DILexicalBlock(scope: !122, file: !8, line: 86, column: 9)
!128 = !DILocation(line: 87, column: 17, scope: !127)
!129 = !DILocation(line: 87, column: 26, scope: !127)
!130 = !DILocation(line: 87, column: 31, scope: !127)
!131 = !DILocation(line: 88, column: 26, scope: !127)
!132 = !DILocation(line: 88, column: 13, scope: !127)
!133 = !DILocation(line: 89, column: 9, scope: !127)
!134 = !DILocation(line: 92, column: 13, scope: !135)
!135 = distinct !DILexicalBlock(scope: !122, file: !8, line: 91, column: 9)
!136 = !DILocation(line: 95, column: 1, scope: !112)
!137 = distinct !DISubprogram(name: "main", scope: !8, file: !8, line: 119, type: !21, isLocal: false, isDefinition: true, scopeLine: 119, isOptimized: false, unit: !0, variables: !2)
!138 = !DILocation(line: 120, column: 5, scope: !137)
!139 = !DILocation(line: 121, column: 5, scope: !137)
!140 = !DILocation(line: 122, column: 5, scope: !137)
