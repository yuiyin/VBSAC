; ModuleID = './401_20.c'
source_filename = "./401_20.c"
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
@staticTrue = internal global i32 1, align 4
@.str.2 = private unnamed_addr constant [9 x i8] c"A String\00", align 1
@staticFalse = internal global i32 0, align 4
@.str.3 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: nounwind uwtable
define i32 @globalReturnsTrue() #0 !dbg !22 {
entry:
  ret i32 1, !dbg !25
}

; Function Attrs: nounwind uwtable
define i32 @globalReturnsFalse() #0 !dbg !26 {
entry:
  ret i32 0, !dbg !27
}

; Function Attrs: nounwind uwtable
define i32 @globalReturnsTrueOrFalse() #0 !dbg !28 {
entry:
  %call = call i32 @rand() #4, !dbg !29
  %rem = srem i32 %call, 2, !dbg !30
  ret i32 %rem, !dbg !31
}

; Function Attrs: nounwind
declare i32 @rand() #1

; Function Attrs: nounwind uwtable
define void @printLine(i8* %line) #0 !dbg !32 {
entry:
  %line.addr = alloca i8*, align 8
  store i8* %line, i8** %line.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %line.addr, metadata !37, metadata !38), !dbg !39
  %0 = load i8*, i8** %line.addr, align 8, !dbg !40
  %cmp = icmp ne i8* %0, null, !dbg !42
  br i1 %cmp, label %if.then, label %if.end, !dbg !43

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** %line.addr, align 8, !dbg !44
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), i8* %1), !dbg !46
  br label %if.end, !dbg !47

if.end:                                           ; preds = %if.then, %entry
  ret void, !dbg !48
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #2

declare i32 @printf(i8*, ...) #3

; Function Attrs: nounwind uwtable
define void @printIntLine(i32 %intNumber) #0 !dbg !49 {
entry:
  %intNumber.addr = alloca i32, align 4
  store i32 %intNumber, i32* %intNumber.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %intNumber.addr, metadata !52, metadata !38), !dbg !53
  %0 = load i32, i32* %intNumber.addr, align 4, !dbg !54
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i32 0, i32 0), i32 %0), !dbg !55
  ret void, !dbg !56
}

; Function Attrs: nounwind uwtable
define void @bad20() #0 !dbg !57 {
entry:
  %data = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !60, metadata !38), !dbg !61
  store i8* null, i8** %data, align 8, !dbg !62
  %0 = load i32, i32* @staticTrue, align 4, !dbg !63
  %tobool = icmp ne i32 %0, 0, !dbg !63
  br i1 %tobool, label %if.then, label %if.end3, !dbg !65

if.then:                                          ; preds = %entry
  %call = call noalias i8* @malloc(i64 100) #4, !dbg !66
  store i8* %call, i8** %data, align 8, !dbg !68
  %1 = load i8*, i8** %data, align 8, !dbg !69
  %cmp = icmp eq i8* %1, null, !dbg !71
  br i1 %cmp, label %if.then1, label %if.end, !dbg !72

if.then1:                                         ; preds = %if.then
  br label %if.end6, !dbg !73

if.end:                                           ; preds = %if.then
  %2 = load i8*, i8** %data, align 8, !dbg !75
  %call2 = call i8* @strcpy(i8* %2, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.2, i32 0, i32 0)) #4, !dbg !76
  %3 = load i8*, i8** %data, align 8, !dbg !77
  call void @printLine(i8* %3), !dbg !78
  br label %if.end3, !dbg !79

if.end3:                                          ; preds = %if.end, %entry
  %4 = load i32, i32* @staticTrue, align 4, !dbg !80
  %tobool4 = icmp ne i32 %4, 0, !dbg !80
  br i1 %tobool4, label %if.then5, label %if.end6, !dbg !82

if.then5:                                         ; preds = %if.end3
  br label %if.end6, !dbg !83

if.end6:                                          ; preds = %if.then1, %if.then5, %if.end3
  ret void, !dbg !85
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #1

; Function Attrs: nounwind
declare i8* @strcpy(i8*, i8*) #1

; Function Attrs: nounwind uwtable
define void @good20() #0 !dbg !86 {
entry:
  %data = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !87, metadata !38), !dbg !88
  store i8* null, i8** %data, align 8, !dbg !89
  %0 = load i32, i32* @staticTrue, align 4, !dbg !90
  %tobool = icmp ne i32 %0, 0, !dbg !90
  br i1 %tobool, label %if.then, label %if.end3, !dbg !92

if.then:                                          ; preds = %entry
  %call = call noalias i8* @malloc(i64 100) #4, !dbg !93
  store i8* %call, i8** %data, align 8, !dbg !95
  %1 = load i8*, i8** %data, align 8, !dbg !96
  %cmp = icmp eq i8* %1, null, !dbg !98
  br i1 %cmp, label %if.then1, label %if.end, !dbg !99

if.then1:                                         ; preds = %if.then
  br label %if.end6, !dbg !100

if.end:                                           ; preds = %if.then
  %2 = load i8*, i8** %data, align 8, !dbg !102
  %call2 = call i8* @strcpy(i8* %2, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.2, i32 0, i32 0)) #4, !dbg !103
  %3 = load i8*, i8** %data, align 8, !dbg !104
  call void @printLine(i8* %3), !dbg !105
  br label %if.end3, !dbg !106

if.end3:                                          ; preds = %if.end, %entry
  %4 = load i32, i32* @staticFalse, align 4, !dbg !107
  %tobool4 = icmp ne i32 %4, 0, !dbg !107
  br i1 %tobool4, label %if.then5, label %if.else, !dbg !109

if.then5:                                         ; preds = %if.end3
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.3, i32 0, i32 0)), !dbg !110
  br label %if.end6, !dbg !112

if.else:                                          ; preds = %if.end3
  %5 = load i8*, i8** %data, align 8, !dbg !113
  call void @free(i8* %5) #4, !dbg !115
  br label %if.end6

if.end6:                                          ; preds = %if.then1, %if.else, %if.then5
  ret void, !dbg !116
}

; Function Attrs: nounwind
declare void @free(i8*) #1

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !117 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @good20(), !dbg !118
  call void @bad20(), !dbg !119
  ret i32 1, !dbg !120
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone }
attributes #3 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!19, !20}
!llvm.ident = !{!21}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (tags/RELEASE_390/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, globals: !7)
!1 = !DIFile(filename: "401_20.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/401")
!2 = !{}
!3 = !{!4, !5}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64, align: 64)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64, align: 64)
!6 = !DIBasicType(name: "char", size: 8, align: 8, encoding: DW_ATE_signed_char)
!7 = !{!8, !12, !13, !14, !15, !16, !17, !18}
!8 = distinct !DIGlobalVariable(name: "GLOBAL_CONST_TRUE", scope: !0, file: !9, line: 10, type: !10, isLocal: false, isDefinition: true, variable: i32* @GLOBAL_CONST_TRUE)
!9 = !DIFile(filename: "./401_20.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/401")
!10 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !11)
!11 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!12 = distinct !DIGlobalVariable(name: "GLOBAL_CONST_FALSE", scope: !0, file: !9, line: 11, type: !10, isLocal: false, isDefinition: true, variable: i32* @GLOBAL_CONST_FALSE)
!13 = distinct !DIGlobalVariable(name: "GLOBAL_CONST_FIVE", scope: !0, file: !9, line: 12, type: !10, isLocal: false, isDefinition: true, variable: i32* @GLOBAL_CONST_FIVE)
!14 = distinct !DIGlobalVariable(name: "globalTrue", scope: !0, file: !9, line: 15, type: !11, isLocal: false, isDefinition: true, variable: i32* @globalTrue)
!15 = distinct !DIGlobalVariable(name: "globalFalse", scope: !0, file: !9, line: 16, type: !11, isLocal: false, isDefinition: true, variable: i32* @globalFalse)
!16 = distinct !DIGlobalVariable(name: "globalFive", scope: !0, file: !9, line: 17, type: !11, isLocal: false, isDefinition: true, variable: i32* @globalFive)
!17 = distinct !DIGlobalVariable(name: "staticTrue", scope: !0, file: !9, line: 47, type: !11, isLocal: true, isDefinition: true, variable: i32* @staticTrue)
!18 = distinct !DIGlobalVariable(name: "staticFalse", scope: !0, file: !9, line: 48, type: !11, isLocal: true, isDefinition: true, variable: i32* @staticFalse)
!19 = !{i32 2, !"Dwarf Version", i32 4}
!20 = !{i32 2, !"Debug Info Version", i32 3}
!21 = !{!"clang version 3.9.0 (tags/RELEASE_390/final)"}
!22 = distinct !DISubprogram(name: "globalReturnsTrue", scope: !9, file: !9, line: 19, type: !23, isLocal: false, isDefinition: true, scopeLine: 20, isOptimized: false, unit: !0, variables: !2)
!23 = !DISubroutineType(types: !24)
!24 = !{!11}
!25 = !DILocation(line: 21, column: 5, scope: !22)
!26 = distinct !DISubprogram(name: "globalReturnsFalse", scope: !9, file: !9, line: 24, type: !23, isLocal: false, isDefinition: true, scopeLine: 25, isOptimized: false, unit: !0, variables: !2)
!27 = !DILocation(line: 26, column: 5, scope: !26)
!28 = distinct !DISubprogram(name: "globalReturnsTrueOrFalse", scope: !9, file: !9, line: 29, type: !23, isLocal: false, isDefinition: true, scopeLine: 30, isOptimized: false, unit: !0, variables: !2)
!29 = !DILocation(line: 31, column: 13, scope: !28)
!30 = !DILocation(line: 31, column: 20, scope: !28)
!31 = !DILocation(line: 31, column: 5, scope: !28)
!32 = distinct !DISubprogram(name: "printLine", scope: !9, file: !9, line: 34, type: !33, isLocal: false, isDefinition: true, scopeLine: 35, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!33 = !DISubroutineType(types: !34)
!34 = !{null, !35}
!35 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !36, size: 64, align: 64)
!36 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !6)
!37 = !DILocalVariable(name: "line", arg: 1, scope: !32, file: !9, line: 34, type: !35)
!38 = !DIExpression()
!39 = !DILocation(line: 34, column: 30, scope: !32)
!40 = !DILocation(line: 36, column: 8, scope: !41)
!41 = distinct !DILexicalBlock(scope: !32, file: !9, line: 36, column: 8)
!42 = !DILocation(line: 36, column: 13, scope: !41)
!43 = !DILocation(line: 36, column: 8, scope: !32)
!44 = !DILocation(line: 38, column: 24, scope: !45)
!45 = distinct !DILexicalBlock(scope: !41, file: !9, line: 37, column: 5)
!46 = !DILocation(line: 38, column: 9, scope: !45)
!47 = !DILocation(line: 39, column: 5, scope: !45)
!48 = !DILocation(line: 40, column: 1, scope: !32)
!49 = distinct !DISubprogram(name: "printIntLine", scope: !9, file: !9, line: 42, type: !50, isLocal: false, isDefinition: true, scopeLine: 43, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!50 = !DISubroutineType(types: !51)
!51 = !{null, !11}
!52 = !DILocalVariable(name: "intNumber", arg: 1, scope: !49, file: !9, line: 42, type: !11)
!53 = !DILocation(line: 42, column: 24, scope: !49)
!54 = !DILocation(line: 44, column: 20, scope: !49)
!55 = !DILocation(line: 44, column: 5, scope: !49)
!56 = !DILocation(line: 45, column: 1, scope: !49)
!57 = distinct !DISubprogram(name: "bad20", scope: !9, file: !9, line: 52, type: !58, isLocal: false, isDefinition: true, scopeLine: 53, isOptimized: false, unit: !0, variables: !2)
!58 = !DISubroutineType(types: !59)
!59 = !{null}
!60 = !DILocalVariable(name: "data", scope: !57, file: !9, line: 54, type: !5)
!61 = !DILocation(line: 54, column: 12, scope: !57)
!62 = !DILocation(line: 55, column: 10, scope: !57)
!63 = !DILocation(line: 56, column: 8, scope: !64)
!64 = distinct !DILexicalBlock(scope: !57, file: !9, line: 56, column: 8)
!65 = !DILocation(line: 56, column: 8, scope: !57)
!66 = !DILocation(line: 59, column: 24, scope: !67)
!67 = distinct !DILexicalBlock(scope: !64, file: !9, line: 57, column: 5)
!68 = !DILocation(line: 59, column: 14, scope: !67)
!69 = !DILocation(line: 60, column: 13, scope: !70)
!70 = distinct !DILexicalBlock(scope: !67, file: !9, line: 60, column: 13)
!71 = !DILocation(line: 60, column: 18, scope: !70)
!72 = !DILocation(line: 60, column: 13, scope: !67)
!73 = !DILocation(line: 60, column: 27, scope: !74)
!74 = !DILexicalBlockFile(scope: !70, file: !9, discriminator: 1)
!75 = !DILocation(line: 62, column: 16, scope: !67)
!76 = !DILocation(line: 62, column: 9, scope: !67)
!77 = !DILocation(line: 63, column: 19, scope: !67)
!78 = !DILocation(line: 63, column: 9, scope: !67)
!79 = !DILocation(line: 64, column: 5, scope: !67)
!80 = !DILocation(line: 65, column: 8, scope: !81)
!81 = distinct !DILexicalBlock(scope: !57, file: !9, line: 65, column: 8)
!82 = !DILocation(line: 65, column: 8, scope: !57)
!83 = !DILocation(line: 69, column: 5, scope: !84)
!84 = distinct !DILexicalBlock(scope: !81, file: !9, line: 66, column: 5)
!85 = !DILocation(line: 70, column: 1, scope: !57)
!86 = distinct !DISubprogram(name: "good20", scope: !9, file: !9, line: 76, type: !58, isLocal: false, isDefinition: true, scopeLine: 77, isOptimized: false, unit: !0, variables: !2)
!87 = !DILocalVariable(name: "data", scope: !86, file: !9, line: 78, type: !5)
!88 = !DILocation(line: 78, column: 12, scope: !86)
!89 = !DILocation(line: 79, column: 10, scope: !86)
!90 = !DILocation(line: 80, column: 8, scope: !91)
!91 = distinct !DILexicalBlock(scope: !86, file: !9, line: 80, column: 8)
!92 = !DILocation(line: 80, column: 8, scope: !86)
!93 = !DILocation(line: 83, column: 24, scope: !94)
!94 = distinct !DILexicalBlock(scope: !91, file: !9, line: 81, column: 5)
!95 = !DILocation(line: 83, column: 14, scope: !94)
!96 = !DILocation(line: 84, column: 13, scope: !97)
!97 = distinct !DILexicalBlock(scope: !94, file: !9, line: 84, column: 13)
!98 = !DILocation(line: 84, column: 18, scope: !97)
!99 = !DILocation(line: 84, column: 13, scope: !94)
!100 = !DILocation(line: 84, column: 27, scope: !101)
!101 = !DILexicalBlockFile(scope: !97, file: !9, discriminator: 1)
!102 = !DILocation(line: 86, column: 16, scope: !94)
!103 = !DILocation(line: 86, column: 9, scope: !94)
!104 = !DILocation(line: 87, column: 19, scope: !94)
!105 = !DILocation(line: 87, column: 9, scope: !94)
!106 = !DILocation(line: 88, column: 5, scope: !94)
!107 = !DILocation(line: 89, column: 8, scope: !108)
!108 = distinct !DILexicalBlock(scope: !86, file: !9, line: 89, column: 8)
!109 = !DILocation(line: 89, column: 8, scope: !86)
!110 = !DILocation(line: 92, column: 9, scope: !111)
!111 = distinct !DILexicalBlock(scope: !108, file: !9, line: 90, column: 5)
!112 = !DILocation(line: 93, column: 5, scope: !111)
!113 = !DILocation(line: 97, column: 14, scope: !114)
!114 = distinct !DILexicalBlock(scope: !108, file: !9, line: 95, column: 5)
!115 = !DILocation(line: 97, column: 9, scope: !114)
!116 = !DILocation(line: 99, column: 1, scope: !86)
!117 = distinct !DISubprogram(name: "main", scope: !9, file: !9, line: 102, type: !23, isLocal: false, isDefinition: true, scopeLine: 102, isOptimized: false, unit: !0, variables: !2)
!118 = !DILocation(line: 103, column: 5, scope: !117)
!119 = !DILocation(line: 104, column: 2, scope: !117)
!120 = !DILocation(line: 105, column: 5, scope: !117)
