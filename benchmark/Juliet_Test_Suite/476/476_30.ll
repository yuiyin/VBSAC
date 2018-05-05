; ModuleID = './476_30.c'
source_filename = "./476_30.c"
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
@.str.3 = private unnamed_addr constant [13 x i8] c"data is NULL\00", align 1

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
define void @bad30() #0 !dbg !74 {
entry:
  %data = alloca i32*, align 8
  %tmpData = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32** %data, metadata !77, metadata !33), !dbg !79
  %call = call i32 @globalReturnsTrueOrFalse(), !dbg !80
  %tobool = icmp ne i32 %call, 0, !dbg !80
  br i1 %tobool, label %if.then, label %if.else, !dbg !82

if.then:                                          ; preds = %entry
  store i32* null, i32** %data, align 8, !dbg !83
  br label %if.end, !dbg !85

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %tmpData, metadata !86, metadata !33), !dbg !89
  store i32 5, i32* %tmpData, align 4, !dbg !89
  store i32* %tmpData, i32** %data, align 8, !dbg !90
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %call1 = call i32 @globalReturnsTrueOrFalse(), !dbg !91
  %tobool2 = icmp ne i32 %call1, 0, !dbg !91
  br i1 %tobool2, label %if.then3, label %if.else4, !dbg !93

if.then3:                                         ; preds = %if.end
  %0 = load i32*, i32** %data, align 8, !dbg !94
  %1 = load i32, i32* %0, align 4, !dbg !96
  call void @printIntLine(i32 %1), !dbg !97
  br label %if.end8, !dbg !98

if.else4:                                         ; preds = %if.end
  %2 = load i32*, i32** %data, align 8, !dbg !99
  %cmp = icmp ne i32* %2, null, !dbg !102
  br i1 %cmp, label %if.then5, label %if.else6, !dbg !103

if.then5:                                         ; preds = %if.else4
  %3 = load i32*, i32** %data, align 8, !dbg !104
  %4 = load i32, i32* %3, align 4, !dbg !106
  call void @printIntLine(i32 %4), !dbg !107
  br label %if.end7, !dbg !108

if.else6:                                         ; preds = %if.else4
  call void @printLine(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.3, i32 0, i32 0)), !dbg !109
  br label %if.end7

if.end7:                                          ; preds = %if.else6, %if.then5
  br label %if.end8

if.end8:                                          ; preds = %if.end7, %if.then3
  ret void, !dbg !111
}

; Function Attrs: nounwind uwtable
define void @good30() #0 !dbg !112 {
entry:
  %data = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !113, metadata !33), !dbg !114
  %call = call i32 @globalReturnsTrueOrFalse(), !dbg !115
  %tobool = icmp ne i32 %call, 0, !dbg !115
  br i1 %tobool, label %if.then, label %if.else, !dbg !117

if.then:                                          ; preds = %entry
  store i32* null, i32** %data, align 8, !dbg !118
  br label %if.end, !dbg !120

if.else:                                          ; preds = %entry
  store i32* null, i32** %data, align 8, !dbg !121
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %call1 = call i32 @globalReturnsTrueOrFalse(), !dbg !123
  %tobool2 = icmp ne i32 %call1, 0, !dbg !123
  br i1 %tobool2, label %if.then3, label %if.else7, !dbg !125

if.then3:                                         ; preds = %if.end
  %0 = load i32*, i32** %data, align 8, !dbg !126
  %cmp = icmp ne i32* %0, null, !dbg !129
  br i1 %cmp, label %if.then4, label %if.else5, !dbg !130

if.then4:                                         ; preds = %if.then3
  %1 = load i32*, i32** %data, align 8, !dbg !131
  %2 = load i32, i32* %1, align 4, !dbg !133
  call void @printIntLine(i32 %2), !dbg !134
  br label %if.end6, !dbg !135

if.else5:                                         ; preds = %if.then3
  call void @printLine(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.3, i32 0, i32 0)), !dbg !136
  br label %if.end6

if.end6:                                          ; preds = %if.else5, %if.then4
  br label %if.end12, !dbg !138

if.else7:                                         ; preds = %if.end
  %3 = load i32*, i32** %data, align 8, !dbg !139
  %cmp8 = icmp ne i32* %3, null, !dbg !142
  br i1 %cmp8, label %if.then9, label %if.else10, !dbg !143

if.then9:                                         ; preds = %if.else7
  %4 = load i32*, i32** %data, align 8, !dbg !144
  %5 = load i32, i32* %4, align 4, !dbg !146
  call void @printIntLine(i32 %5), !dbg !147
  br label %if.end11, !dbg !148

if.else10:                                        ; preds = %if.else7
  call void @printLine(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.3, i32 0, i32 0)), !dbg !149
  br label %if.end11

if.end11:                                         ; preds = %if.else10, %if.then9
  br label %if.end12

if.end12:                                         ; preds = %if.end11, %if.end6
  ret void, !dbg !151
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !152 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @good30(), !dbg !153
  call void @bad30(), !dbg !154
  ret i32 1, !dbg !155
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
!1 = !DIFile(filename: "476_30.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/476")
!2 = !{}
!3 = !{!4, !5}
!4 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64, align: 64)
!6 = !{!7, !10, !11, !12, !13, !14}
!7 = distinct !DIGlobalVariable(name: "GLOBAL_CONST_TRUE", scope: !0, file: !8, line: 10, type: !9, isLocal: false, isDefinition: true, variable: i32* @GLOBAL_CONST_TRUE)
!8 = !DIFile(filename: "./476_30.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/476")
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
!67 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/sys/types.h", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/476")
!68 = !DIBasicType(name: "long int", size: 64, align: 64, encoding: DW_ATE_signed)
!69 = !DILocalVariable(name: "longIntNumber", arg: 1, scope: !63, file: !8, line: 51, type: !66)
!70 = !DILocation(line: 51, column: 29, scope: !63)
!71 = !DILocation(line: 53, column: 21, scope: !63)
!72 = !DILocation(line: 53, column: 5, scope: !63)
!73 = !DILocation(line: 54, column: 1, scope: !63)
!74 = distinct !DISubprogram(name: "bad30", scope: !8, file: !8, line: 59, type: !75, isLocal: false, isDefinition: true, scopeLine: 60, isOptimized: false, unit: !0, variables: !2)
!75 = !DISubroutineType(types: !76)
!76 = !{null}
!77 = !DILocalVariable(name: "data", scope: !74, file: !8, line: 61, type: !78)
!78 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64, align: 64)
!79 = !DILocation(line: 61, column: 11, scope: !74)
!80 = !DILocation(line: 62, column: 8, scope: !81)
!81 = distinct !DILexicalBlock(scope: !74, file: !8, line: 62, column: 8)
!82 = !DILocation(line: 62, column: 8, scope: !74)
!83 = !DILocation(line: 65, column: 14, scope: !84)
!84 = distinct !DILexicalBlock(scope: !81, file: !8, line: 63, column: 5)
!85 = !DILocation(line: 66, column: 5, scope: !84)
!86 = !DILocalVariable(name: "tmpData", scope: !87, file: !8, line: 71, type: !4)
!87 = distinct !DILexicalBlock(scope: !88, file: !8, line: 70, column: 9)
!88 = distinct !DILexicalBlock(scope: !81, file: !8, line: 68, column: 5)
!89 = !DILocation(line: 71, column: 17, scope: !87)
!90 = !DILocation(line: 72, column: 18, scope: !87)
!91 = !DILocation(line: 75, column: 8, scope: !92)
!92 = distinct !DILexicalBlock(scope: !74, file: !8, line: 75, column: 8)
!93 = !DILocation(line: 75, column: 8, scope: !74)
!94 = !DILocation(line: 78, column: 23, scope: !95)
!95 = distinct !DILexicalBlock(scope: !92, file: !8, line: 76, column: 5)
!96 = !DILocation(line: 78, column: 22, scope: !95)
!97 = !DILocation(line: 78, column: 9, scope: !95)
!98 = !DILocation(line: 79, column: 5, scope: !95)
!99 = !DILocation(line: 83, column: 13, scope: !100)
!100 = distinct !DILexicalBlock(scope: !101, file: !8, line: 83, column: 13)
!101 = distinct !DILexicalBlock(scope: !92, file: !8, line: 81, column: 5)
!102 = !DILocation(line: 83, column: 18, scope: !100)
!103 = !DILocation(line: 83, column: 13, scope: !101)
!104 = !DILocation(line: 85, column: 27, scope: !105)
!105 = distinct !DILexicalBlock(scope: !100, file: !8, line: 84, column: 9)
!106 = !DILocation(line: 85, column: 26, scope: !105)
!107 = !DILocation(line: 85, column: 13, scope: !105)
!108 = !DILocation(line: 86, column: 9, scope: !105)
!109 = !DILocation(line: 89, column: 13, scope: !110)
!110 = distinct !DILexicalBlock(scope: !100, file: !8, line: 88, column: 9)
!111 = !DILocation(line: 92, column: 1, scope: !74)
!112 = distinct !DISubprogram(name: "good30", scope: !8, file: !8, line: 98, type: !75, isLocal: false, isDefinition: true, scopeLine: 99, isOptimized: false, unit: !0, variables: !2)
!113 = !DILocalVariable(name: "data", scope: !112, file: !8, line: 100, type: !78)
!114 = !DILocation(line: 100, column: 11, scope: !112)
!115 = !DILocation(line: 101, column: 8, scope: !116)
!116 = distinct !DILexicalBlock(scope: !112, file: !8, line: 101, column: 8)
!117 = !DILocation(line: 101, column: 8, scope: !112)
!118 = !DILocation(line: 104, column: 14, scope: !119)
!119 = distinct !DILexicalBlock(scope: !116, file: !8, line: 102, column: 5)
!120 = !DILocation(line: 105, column: 5, scope: !119)
!121 = !DILocation(line: 109, column: 14, scope: !122)
!122 = distinct !DILexicalBlock(scope: !116, file: !8, line: 107, column: 5)
!123 = !DILocation(line: 111, column: 8, scope: !124)
!124 = distinct !DILexicalBlock(scope: !112, file: !8, line: 111, column: 8)
!125 = !DILocation(line: 111, column: 8, scope: !112)
!126 = !DILocation(line: 114, column: 13, scope: !127)
!127 = distinct !DILexicalBlock(scope: !128, file: !8, line: 114, column: 13)
!128 = distinct !DILexicalBlock(scope: !124, file: !8, line: 112, column: 5)
!129 = !DILocation(line: 114, column: 18, scope: !127)
!130 = !DILocation(line: 114, column: 13, scope: !128)
!131 = !DILocation(line: 116, column: 27, scope: !132)
!132 = distinct !DILexicalBlock(scope: !127, file: !8, line: 115, column: 9)
!133 = !DILocation(line: 116, column: 26, scope: !132)
!134 = !DILocation(line: 116, column: 13, scope: !132)
!135 = !DILocation(line: 117, column: 9, scope: !132)
!136 = !DILocation(line: 120, column: 13, scope: !137)
!137 = distinct !DILexicalBlock(scope: !127, file: !8, line: 119, column: 9)
!138 = !DILocation(line: 122, column: 5, scope: !128)
!139 = !DILocation(line: 126, column: 13, scope: !140)
!140 = distinct !DILexicalBlock(scope: !141, file: !8, line: 126, column: 13)
!141 = distinct !DILexicalBlock(scope: !124, file: !8, line: 124, column: 5)
!142 = !DILocation(line: 126, column: 18, scope: !140)
!143 = !DILocation(line: 126, column: 13, scope: !141)
!144 = !DILocation(line: 128, column: 27, scope: !145)
!145 = distinct !DILexicalBlock(scope: !140, file: !8, line: 127, column: 9)
!146 = !DILocation(line: 128, column: 26, scope: !145)
!147 = !DILocation(line: 128, column: 13, scope: !145)
!148 = !DILocation(line: 129, column: 9, scope: !145)
!149 = !DILocation(line: 132, column: 13, scope: !150)
!150 = distinct !DILexicalBlock(scope: !140, file: !8, line: 131, column: 9)
!151 = !DILocation(line: 135, column: 1, scope: !112)
!152 = distinct !DISubprogram(name: "main", scope: !8, file: !8, line: 138, type: !19, isLocal: false, isDefinition: true, scopeLine: 138, isOptimized: false, unit: !0, variables: !2)
!153 = !DILocation(line: 139, column: 5, scope: !152)
!154 = !DILocation(line: 140, column: 2, scope: !152)
!155 = !DILocation(line: 141, column: 5, scope: !152)
