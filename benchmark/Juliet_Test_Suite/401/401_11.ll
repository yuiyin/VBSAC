; ModuleID = './401_11.c'
source_filename = "./401_11.c"
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
@.str.3 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

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
define void @bad11() #0 !dbg !55 {
entry:
  %data = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !58, metadata !36), !dbg !59
  store i8* null, i8** %data, align 8, !dbg !60
  %call = call i32 @globalReturnsTrue(), !dbg !61
  %tobool = icmp ne i32 %call, 0, !dbg !61
  br i1 %tobool, label %if.then, label %if.end4, !dbg !63

if.then:                                          ; preds = %entry
  %call1 = call noalias i8* @calloc(i64 100, i64 1) #4, !dbg !64
  store i8* %call1, i8** %data, align 8, !dbg !66
  %0 = load i8*, i8** %data, align 8, !dbg !67
  %cmp = icmp eq i8* %0, null, !dbg !69
  br i1 %cmp, label %if.then2, label %if.end, !dbg !70

if.then2:                                         ; preds = %if.then
  br label %if.end8, !dbg !71

if.end:                                           ; preds = %if.then
  %1 = load i8*, i8** %data, align 8, !dbg !73
  %call3 = call i8* @strcpy(i8* %1, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.2, i32 0, i32 0)) #4, !dbg !74
  %2 = load i8*, i8** %data, align 8, !dbg !75
  call void @printLine(i8* %2), !dbg !76
  br label %if.end4, !dbg !77

if.end4:                                          ; preds = %if.end, %entry
  %call5 = call i32 @globalReturnsTrue(), !dbg !78
  %tobool6 = icmp ne i32 %call5, 0, !dbg !78
  br i1 %tobool6, label %if.then7, label %if.end8, !dbg !80

if.then7:                                         ; preds = %if.end4
  br label %if.end8, !dbg !81

if.end8:                                          ; preds = %if.then2, %if.then7, %if.end4
  ret void, !dbg !83
}

; Function Attrs: nounwind
declare noalias i8* @calloc(i64, i64) #1

; Function Attrs: nounwind
declare i8* @strcpy(i8*, i8*) #1

; Function Attrs: nounwind uwtable
define void @good11() #0 !dbg !84 {
entry:
  %data = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !85, metadata !36), !dbg !86
  store i8* null, i8** %data, align 8, !dbg !87
  %call = call i32 @globalReturnsTrue(), !dbg !88
  %tobool = icmp ne i32 %call, 0, !dbg !88
  br i1 %tobool, label %if.then, label %if.end4, !dbg !90

if.then:                                          ; preds = %entry
  %call1 = call noalias i8* @calloc(i64 100, i64 1) #4, !dbg !91
  store i8* %call1, i8** %data, align 8, !dbg !93
  %0 = load i8*, i8** %data, align 8, !dbg !94
  %cmp = icmp eq i8* %0, null, !dbg !96
  br i1 %cmp, label %if.then2, label %if.end, !dbg !97

if.then2:                                         ; preds = %if.then
  br label %if.end8, !dbg !98

if.end:                                           ; preds = %if.then
  %1 = load i8*, i8** %data, align 8, !dbg !100
  %call3 = call i8* @strcpy(i8* %1, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.2, i32 0, i32 0)) #4, !dbg !101
  %2 = load i8*, i8** %data, align 8, !dbg !102
  call void @printLine(i8* %2), !dbg !103
  br label %if.end4, !dbg !104

if.end4:                                          ; preds = %if.end, %entry
  %call5 = call i32 @globalReturnsFalse(), !dbg !105
  %tobool6 = icmp ne i32 %call5, 0, !dbg !105
  br i1 %tobool6, label %if.then7, label %if.else, !dbg !107

if.then7:                                         ; preds = %if.end4
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.3, i32 0, i32 0)), !dbg !108
  br label %if.end8, !dbg !110

if.else:                                          ; preds = %if.end4
  %3 = load i8*, i8** %data, align 8, !dbg !111
  call void @free(i8* %3) #4, !dbg !113
  br label %if.end8

if.end8:                                          ; preds = %if.then2, %if.else, %if.then7
  ret void, !dbg !114
}

; Function Attrs: nounwind
declare void @free(i8*) #1

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !115 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @good11(), !dbg !116
  call void @bad11(), !dbg !117
  ret i32 1, !dbg !118
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
!1 = !DIFile(filename: "401_11.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/401")
!2 = !{}
!3 = !{!4, !5}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64, align: 64)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64, align: 64)
!6 = !DIBasicType(name: "char", size: 8, align: 8, encoding: DW_ATE_signed_char)
!7 = !{!8, !12, !13, !14, !15, !16}
!8 = distinct !DIGlobalVariable(name: "GLOBAL_CONST_TRUE", scope: !0, file: !9, line: 10, type: !10, isLocal: false, isDefinition: true, variable: i32* @GLOBAL_CONST_TRUE)
!9 = !DIFile(filename: "./401_11.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/401")
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
!55 = distinct !DISubprogram(name: "bad11", scope: !9, file: !9, line: 49, type: !56, isLocal: false, isDefinition: true, scopeLine: 50, isOptimized: false, unit: !0, variables: !2)
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
!78 = !DILocation(line: 62, column: 8, scope: !79)
!79 = distinct !DILexicalBlock(scope: !55, file: !9, line: 62, column: 8)
!80 = !DILocation(line: 62, column: 8, scope: !55)
!81 = !DILocation(line: 66, column: 5, scope: !82)
!82 = distinct !DILexicalBlock(scope: !79, file: !9, line: 63, column: 5)
!83 = !DILocation(line: 67, column: 1, scope: !55)
!84 = distinct !DISubprogram(name: "good11", scope: !9, file: !9, line: 73, type: !56, isLocal: false, isDefinition: true, scopeLine: 74, isOptimized: false, unit: !0, variables: !2)
!85 = !DILocalVariable(name: "data", scope: !84, file: !9, line: 75, type: !5)
!86 = !DILocation(line: 75, column: 12, scope: !84)
!87 = !DILocation(line: 76, column: 10, scope: !84)
!88 = !DILocation(line: 77, column: 8, scope: !89)
!89 = distinct !DILexicalBlock(scope: !84, file: !9, line: 77, column: 8)
!90 = !DILocation(line: 77, column: 8, scope: !84)
!91 = !DILocation(line: 80, column: 24, scope: !92)
!92 = distinct !DILexicalBlock(scope: !89, file: !9, line: 78, column: 5)
!93 = !DILocation(line: 80, column: 14, scope: !92)
!94 = !DILocation(line: 81, column: 13, scope: !95)
!95 = distinct !DILexicalBlock(scope: !92, file: !9, line: 81, column: 13)
!96 = !DILocation(line: 81, column: 18, scope: !95)
!97 = !DILocation(line: 81, column: 13, scope: !92)
!98 = !DILocation(line: 81, column: 27, scope: !99)
!99 = !DILexicalBlockFile(scope: !95, file: !9, discriminator: 1)
!100 = !DILocation(line: 83, column: 16, scope: !92)
!101 = !DILocation(line: 83, column: 9, scope: !92)
!102 = !DILocation(line: 84, column: 19, scope: !92)
!103 = !DILocation(line: 84, column: 9, scope: !92)
!104 = !DILocation(line: 85, column: 5, scope: !92)
!105 = !DILocation(line: 86, column: 8, scope: !106)
!106 = distinct !DILexicalBlock(scope: !84, file: !9, line: 86, column: 8)
!107 = !DILocation(line: 86, column: 8, scope: !84)
!108 = !DILocation(line: 89, column: 9, scope: !109)
!109 = distinct !DILexicalBlock(scope: !106, file: !9, line: 87, column: 5)
!110 = !DILocation(line: 90, column: 5, scope: !109)
!111 = !DILocation(line: 94, column: 14, scope: !112)
!112 = distinct !DILexicalBlock(scope: !106, file: !9, line: 92, column: 5)
!113 = !DILocation(line: 94, column: 9, scope: !112)
!114 = !DILocation(line: 96, column: 1, scope: !84)
!115 = distinct !DISubprogram(name: "main", scope: !9, file: !9, line: 102, type: !21, isLocal: false, isDefinition: true, scopeLine: 102, isOptimized: false, unit: !0, variables: !2)
!116 = !DILocation(line: 103, column: 2, scope: !115)
!117 = !DILocation(line: 104, column: 5, scope: !115)
!118 = !DILocation(line: 105, column: 5, scope: !115)
