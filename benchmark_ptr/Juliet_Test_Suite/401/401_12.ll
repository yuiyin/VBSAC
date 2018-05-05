; ModuleID = './401_12.c'
source_filename = "./401_12.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@GLOBAL_CONST_TRUE = constant i32 1, align 4
@GLOBAL_CONST_FALSE = constant i32 0, align 4
@GLOBAL_CONST_FIVE = constant i32 5, align 4
@globalTrue = global i32 1, align 4
@globalFalse = global i32 0, align 4
@globalFive = global i32 5, align 4
@.str = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1
@.str.1 = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@.str.2 = private unnamed_addr constant [9 x i8] c"A String\00", align 1

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
define void @printLine(i8* %line) #0 !dbg !30 {
entry:
  %line.addr = alloca i8*, align 8
  store i8* %line, i8** %line.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %line.addr, metadata !35, metadata !36), !dbg !37
  %0 = load i8*, i8** %line.addr, align 8, !dbg !38
  %cmp = icmp ne i8* %0, null, !dbg !40
  br i1 %cmp, label %if.then, label %if.end, !dbg !41

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** %line.addr, align 8, !dbg !42
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), i8* %1), !dbg !44
  br label %if.end, !dbg !45

if.end:                                           ; preds = %if.then, %entry
  ret void, !dbg !46
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #2

declare i32 @printf(i8*, ...) #3

; Function Attrs: nounwind uwtable
define void @printIntLine(i32 %intNumber) #0 !dbg !47 {
entry:
  %intNumber.addr = alloca i32, align 4
  store i32 %intNumber, i32* %intNumber.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %intNumber.addr, metadata !50, metadata !36), !dbg !51
  %0 = load i32, i32* %intNumber.addr, align 4, !dbg !52
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i32 0, i32 0), i32 %0), !dbg !53
  ret void, !dbg !54
}

; Function Attrs: nounwind uwtable
define void @bad12() #0 !dbg !55 {
entry:
  %data = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !58, metadata !36), !dbg !59
  store i8* null, i8** %data, align 8, !dbg !60
  %call = call i32 @globalReturnsTrueOrFalse(), !dbg !61
  %tobool = icmp ne i32 %call, 0, !dbg !61
  br i1 %tobool, label %if.then, label %if.else, !dbg !63

if.then:                                          ; preds = %entry
  %call1 = call noalias i8* @calloc(i64 100, i64 1) #4, !dbg !64
  store i8* %call1, i8** %data, align 8, !dbg !66
  %0 = load i8*, i8** %data, align 8, !dbg !67
  %cmp = icmp eq i8* %0, null, !dbg !69
  br i1 %cmp, label %if.then2, label %if.end, !dbg !70

if.then2:                                         ; preds = %if.then
  br label %if.end13, !dbg !71

if.end:                                           ; preds = %if.then
  %1 = load i8*, i8** %data, align 8, !dbg !73
  %call3 = call i8* @strcpy(i8* %1, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.2, i32 0, i32 0)) #4, !dbg !74
  %2 = load i8*, i8** %data, align 8, !dbg !75
  call void @printLine(i8* %2), !dbg !76
  br label %if.end8, !dbg !77

if.else:                                          ; preds = %entry
  %3 = alloca i8, i64 100, !dbg !78
  store i8* %3, i8** %data, align 8, !dbg !80
  %4 = load i8*, i8** %data, align 8, !dbg !81
  %cmp4 = icmp eq i8* %4, null, !dbg !83
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !84

if.then5:                                         ; preds = %if.else
  br label %if.end13, !dbg !85

if.end6:                                          ; preds = %if.else
  %5 = load i8*, i8** %data, align 8, !dbg !87
  %call7 = call i8* @strcpy(i8* %5, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.2, i32 0, i32 0)) #4, !dbg !88
  %6 = load i8*, i8** %data, align 8, !dbg !89
  call void @printLine(i8* %6), !dbg !90
  br label %if.end8

if.end8:                                          ; preds = %if.end6, %if.end
  %call9 = call i32 @globalReturnsTrueOrFalse(), !dbg !91
  %tobool10 = icmp ne i32 %call9, 0, !dbg !91
  br i1 %tobool10, label %if.then11, label %if.else12, !dbg !93

if.then11:                                        ; preds = %if.end8
  br label %if.end13, !dbg !94

if.else12:                                        ; preds = %if.end8
  %7 = load i8*, i8** %data, align 8, !dbg !96
  call void @free(i8* %7) #4, !dbg !98
  br label %if.end13

if.end13:                                         ; preds = %if.then2, %if.then5, %if.else12, %if.then11
  ret void, !dbg !99
}

; Function Attrs: nounwind
declare noalias i8* @calloc(i64, i64) #1

; Function Attrs: nounwind
declare i8* @strcpy(i8*, i8*) #1

; Function Attrs: nounwind
declare void @free(i8*) #1

; Function Attrs: nounwind uwtable
define void @good12() #0 !dbg !100 {
entry:
  %data = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !101, metadata !36), !dbg !102
  store i8* null, i8** %data, align 8, !dbg !103
  %call = call i32 @globalReturnsTrueOrFalse(), !dbg !104
  %tobool = icmp ne i32 %call, 0, !dbg !104
  br i1 %tobool, label %if.then, label %if.else, !dbg !106

if.then:                                          ; preds = %entry
  %call1 = call noalias i8* @calloc(i64 100, i64 1) #4, !dbg !107
  store i8* %call1, i8** %data, align 8, !dbg !109
  %0 = load i8*, i8** %data, align 8, !dbg !110
  %call2 = call i8* @strcpy(i8* %0, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.2, i32 0, i32 0)) #4, !dbg !111
  %1 = load i8*, i8** %data, align 8, !dbg !112
  call void @printLine(i8* %1), !dbg !113
  br label %if.end, !dbg !114

if.else:                                          ; preds = %entry
  %call3 = call noalias i8* @calloc(i64 100, i64 1) #4, !dbg !115
  store i8* %call3, i8** %data, align 8, !dbg !117
  %2 = load i8*, i8** %data, align 8, !dbg !118
  %call4 = call i8* @strcpy(i8* %2, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.2, i32 0, i32 0)) #4, !dbg !119
  %3 = load i8*, i8** %data, align 8, !dbg !120
  call void @printLine(i8* %3), !dbg !121
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %call5 = call i32 @globalReturnsTrueOrFalse(), !dbg !122
  %tobool6 = icmp ne i32 %call5, 0, !dbg !122
  br i1 %tobool6, label %if.then7, label %if.else8, !dbg !124

if.then7:                                         ; preds = %if.end
  %4 = load i8*, i8** %data, align 8, !dbg !125
  call void @free(i8* %4) #4, !dbg !127
  br label %if.end9, !dbg !128

if.else8:                                         ; preds = %if.end
  %5 = load i8*, i8** %data, align 8, !dbg !129
  call void @free(i8* %5) #4, !dbg !131
  br label %if.end9

if.end9:                                          ; preds = %if.else8, %if.then7
  ret void, !dbg !132
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !133 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @good12(), !dbg !134
  call void @bad12(), !dbg !135
  ret i32 1, !dbg !136
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone }
attributes #3 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!17, !18}
!llvm.ident = !{!19}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (tags/RELEASE_390/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, globals: !7)
!1 = !DIFile(filename: "401_12.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/401")
!2 = !{}
!3 = !{!4, !5}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64, align: 64)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64, align: 64)
!6 = !DIBasicType(name: "char", size: 8, align: 8, encoding: DW_ATE_signed_char)
!7 = !{!8, !12, !13, !14, !15, !16}
!8 = distinct !DIGlobalVariable(name: "GLOBAL_CONST_TRUE", scope: !0, file: !9, line: 10, type: !10, isLocal: false, isDefinition: true, variable: i32* @GLOBAL_CONST_TRUE)
!9 = !DIFile(filename: "./401_12.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/401")
!10 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !11)
!11 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!12 = distinct !DIGlobalVariable(name: "GLOBAL_CONST_FALSE", scope: !0, file: !9, line: 11, type: !10, isLocal: false, isDefinition: true, variable: i32* @GLOBAL_CONST_FALSE)
!13 = distinct !DIGlobalVariable(name: "GLOBAL_CONST_FIVE", scope: !0, file: !9, line: 12, type: !10, isLocal: false, isDefinition: true, variable: i32* @GLOBAL_CONST_FIVE)
!14 = distinct !DIGlobalVariable(name: "globalTrue", scope: !0, file: !9, line: 15, type: !11, isLocal: false, isDefinition: true, variable: i32* @globalTrue)
!15 = distinct !DIGlobalVariable(name: "globalFalse", scope: !0, file: !9, line: 16, type: !11, isLocal: false, isDefinition: true, variable: i32* @globalFalse)
!16 = distinct !DIGlobalVariable(name: "globalFive", scope: !0, file: !9, line: 17, type: !11, isLocal: false, isDefinition: true, variable: i32* @globalFive)
!17 = !{i32 2, !"Dwarf Version", i32 4}
!18 = !{i32 2, !"Debug Info Version", i32 3}
!19 = !{!"clang version 3.9.0 (tags/RELEASE_390/final)"}
!20 = distinct !DISubprogram(name: "globalReturnsTrue", scope: !9, file: !9, line: 19, type: !21, isLocal: false, isDefinition: true, scopeLine: 20, isOptimized: false, unit: !0, variables: !2)
!21 = !DISubroutineType(types: !22)
!22 = !{!11}
!23 = !DILocation(line: 21, column: 5, scope: !20)
!24 = distinct !DISubprogram(name: "globalReturnsFalse", scope: !9, file: !9, line: 24, type: !21, isLocal: false, isDefinition: true, scopeLine: 25, isOptimized: false, unit: !0, variables: !2)
!25 = !DILocation(line: 26, column: 5, scope: !24)
!26 = distinct !DISubprogram(name: "globalReturnsTrueOrFalse", scope: !9, file: !9, line: 29, type: !21, isLocal: false, isDefinition: true, scopeLine: 30, isOptimized: false, unit: !0, variables: !2)
!27 = !DILocation(line: 31, column: 13, scope: !26)
!28 = !DILocation(line: 31, column: 20, scope: !26)
!29 = !DILocation(line: 31, column: 5, scope: !26)
!30 = distinct !DISubprogram(name: "printLine", scope: !9, file: !9, line: 34, type: !31, isLocal: false, isDefinition: true, scopeLine: 35, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!31 = !DISubroutineType(types: !32)
!32 = !{null, !33}
!33 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !34, size: 64, align: 64)
!34 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !6)
!35 = !DILocalVariable(name: "line", arg: 1, scope: !30, file: !9, line: 34, type: !33)
!36 = !DIExpression()
!37 = !DILocation(line: 34, column: 30, scope: !30)
!38 = !DILocation(line: 36, column: 8, scope: !39)
!39 = distinct !DILexicalBlock(scope: !30, file: !9, line: 36, column: 8)
!40 = !DILocation(line: 36, column: 13, scope: !39)
!41 = !DILocation(line: 36, column: 8, scope: !30)
!42 = !DILocation(line: 38, column: 24, scope: !43)
!43 = distinct !DILexicalBlock(scope: !39, file: !9, line: 37, column: 5)
!44 = !DILocation(line: 38, column: 9, scope: !43)
!45 = !DILocation(line: 39, column: 5, scope: !43)
!46 = !DILocation(line: 40, column: 1, scope: !30)
!47 = distinct !DISubprogram(name: "printIntLine", scope: !9, file: !9, line: 42, type: !48, isLocal: false, isDefinition: true, scopeLine: 43, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!48 = !DISubroutineType(types: !49)
!49 = !{null, !11}
!50 = !DILocalVariable(name: "intNumber", arg: 1, scope: !47, file: !9, line: 42, type: !11)
!51 = !DILocation(line: 42, column: 24, scope: !47)
!52 = !DILocation(line: 44, column: 20, scope: !47)
!53 = !DILocation(line: 44, column: 5, scope: !47)
!54 = !DILocation(line: 45, column: 1, scope: !47)
!55 = distinct !DISubprogram(name: "bad12", scope: !9, file: !9, line: 49, type: !56, isLocal: false, isDefinition: true, scopeLine: 50, isOptimized: false, unit: !0, variables: !2)
!56 = !DISubroutineType(types: !57)
!57 = !{null}
!58 = !DILocalVariable(name: "data", scope: !55, file: !9, line: 51, type: !5)
!59 = !DILocation(line: 51, column: 12, scope: !55)
!60 = !DILocation(line: 52, column: 10, scope: !55)
!61 = !DILocation(line: 53, column: 8, scope: !62)
!62 = distinct !DILexicalBlock(scope: !55, file: !9, line: 53, column: 8)
!63 = !DILocation(line: 53, column: 8, scope: !55)
!64 = !DILocation(line: 56, column: 24, scope: !65)
!65 = distinct !DILexicalBlock(scope: !62, file: !9, line: 54, column: 5)
!66 = !DILocation(line: 56, column: 14, scope: !65)
!67 = !DILocation(line: 57, column: 13, scope: !68)
!68 = distinct !DILexicalBlock(scope: !65, file: !9, line: 57, column: 13)
!69 = !DILocation(line: 57, column: 18, scope: !68)
!70 = !DILocation(line: 57, column: 13, scope: !65)
!71 = !DILocation(line: 57, column: 27, scope: !72)
!72 = !DILexicalBlockFile(scope: !68, file: !9, discriminator: 1)
!73 = !DILocation(line: 59, column: 16, scope: !65)
!74 = !DILocation(line: 59, column: 9, scope: !65)
!75 = !DILocation(line: 60, column: 19, scope: !65)
!76 = !DILocation(line: 60, column: 9, scope: !65)
!77 = !DILocation(line: 61, column: 5, scope: !65)
!78 = !DILocation(line: 65, column: 24, scope: !79)
!79 = distinct !DILexicalBlock(scope: !62, file: !9, line: 63, column: 5)
!80 = !DILocation(line: 65, column: 14, scope: !79)
!81 = !DILocation(line: 66, column: 13, scope: !82)
!82 = distinct !DILexicalBlock(scope: !79, file: !9, line: 66, column: 13)
!83 = !DILocation(line: 66, column: 18, scope: !82)
!84 = !DILocation(line: 66, column: 13, scope: !79)
!85 = !DILocation(line: 66, column: 27, scope: !86)
!86 = !DILexicalBlockFile(scope: !82, file: !9, discriminator: 1)
!87 = !DILocation(line: 68, column: 16, scope: !79)
!88 = !DILocation(line: 68, column: 9, scope: !79)
!89 = !DILocation(line: 69, column: 19, scope: !79)
!90 = !DILocation(line: 69, column: 9, scope: !79)
!91 = !DILocation(line: 71, column: 8, scope: !92)
!92 = distinct !DILexicalBlock(scope: !55, file: !9, line: 71, column: 8)
!93 = !DILocation(line: 71, column: 8, scope: !55)
!94 = !DILocation(line: 75, column: 5, scope: !95)
!95 = distinct !DILexicalBlock(scope: !92, file: !9, line: 72, column: 5)
!96 = !DILocation(line: 79, column: 14, scope: !97)
!97 = distinct !DILexicalBlock(scope: !92, file: !9, line: 77, column: 5)
!98 = !DILocation(line: 79, column: 9, scope: !97)
!99 = !DILocation(line: 81, column: 1, scope: !55)
!100 = distinct !DISubprogram(name: "good12", scope: !9, file: !9, line: 87, type: !56, isLocal: false, isDefinition: true, scopeLine: 88, isOptimized: false, unit: !0, variables: !2)
!101 = !DILocalVariable(name: "data", scope: !100, file: !9, line: 89, type: !5)
!102 = !DILocation(line: 89, column: 12, scope: !100)
!103 = !DILocation(line: 90, column: 10, scope: !100)
!104 = !DILocation(line: 91, column: 8, scope: !105)
!105 = distinct !DILexicalBlock(scope: !100, file: !9, line: 91, column: 8)
!106 = !DILocation(line: 91, column: 8, scope: !100)
!107 = !DILocation(line: 94, column: 24, scope: !108)
!108 = distinct !DILexicalBlock(scope: !105, file: !9, line: 92, column: 5)
!109 = !DILocation(line: 94, column: 14, scope: !108)
!110 = !DILocation(line: 96, column: 16, scope: !108)
!111 = !DILocation(line: 96, column: 9, scope: !108)
!112 = !DILocation(line: 97, column: 19, scope: !108)
!113 = !DILocation(line: 97, column: 9, scope: !108)
!114 = !DILocation(line: 98, column: 5, scope: !108)
!115 = !DILocation(line: 102, column: 24, scope: !116)
!116 = distinct !DILexicalBlock(scope: !105, file: !9, line: 100, column: 5)
!117 = !DILocation(line: 102, column: 14, scope: !116)
!118 = !DILocation(line: 104, column: 16, scope: !116)
!119 = !DILocation(line: 104, column: 9, scope: !116)
!120 = !DILocation(line: 105, column: 19, scope: !116)
!121 = !DILocation(line: 105, column: 9, scope: !116)
!122 = !DILocation(line: 107, column: 8, scope: !123)
!123 = distinct !DILexicalBlock(scope: !100, file: !9, line: 107, column: 8)
!124 = !DILocation(line: 107, column: 8, scope: !100)
!125 = !DILocation(line: 110, column: 14, scope: !126)
!126 = distinct !DILexicalBlock(scope: !123, file: !9, line: 108, column: 5)
!127 = !DILocation(line: 110, column: 9, scope: !126)
!128 = !DILocation(line: 111, column: 5, scope: !126)
!129 = !DILocation(line: 115, column: 14, scope: !130)
!130 = distinct !DILexicalBlock(scope: !123, file: !9, line: 113, column: 5)
!131 = !DILocation(line: 115, column: 9, scope: !130)
!132 = !DILocation(line: 117, column: 1, scope: !100)
!133 = distinct !DISubprogram(name: "main", scope: !9, file: !9, line: 122, type: !21, isLocal: false, isDefinition: true, scopeLine: 122, isOptimized: false, unit: !0, variables: !2)
!134 = !DILocation(line: 123, column: 2, scope: !133)
!135 = !DILocation(line: 124, column: 5, scope: !133)
!136 = !DILocation(line: 125, column: 5, scope: !133)
