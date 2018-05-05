; ModuleID = './369_39.c'
source_filename = "./369_39.c"
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
@.str = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1
@.str.1 = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@stdin = external global %struct._IO_FILE*, align 8
@.str.2 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.3 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@.str.4 = private unnamed_addr constant [38 x i8] c"This would result in a divide by zero\00", align 1

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
define void @printLine(i8* %line) #0 !dbg !28 {
entry:
  %line.addr = alloca i8*, align 8
  store i8* %line, i8** %line.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %line.addr, metadata !34, metadata !35), !dbg !36
  %0 = load i8*, i8** %line.addr, align 8, !dbg !37
  %cmp = icmp ne i8* %0, null, !dbg !39
  br i1 %cmp, label %if.then, label %if.end, !dbg !40

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** %line.addr, align 8, !dbg !41
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), i8* %1), !dbg !43
  br label %if.end, !dbg !44

if.end:                                           ; preds = %if.then, %entry
  ret void, !dbg !45
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #2

declare i32 @printf(i8*, ...) #3

; Function Attrs: nounwind uwtable
define void @printIntLine(i32 %intNumber) #0 !dbg !46 {
entry:
  %intNumber.addr = alloca i32, align 4
  store i32 %intNumber, i32* %intNumber.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %intNumber.addr, metadata !49, metadata !35), !dbg !50
  %0 = load i32, i32* %intNumber.addr, align 4, !dbg !51
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i32 0, i32 0), i32 %0), !dbg !52
  ret void, !dbg !53
}

; Function Attrs: nounwind uwtable
define void @bad39() #0 !dbg !54 {
entry:
  %data = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !57, metadata !35), !dbg !58
  store i32 -1, i32* %data, align 4, !dbg !59
  %0 = load i32, i32* @globalFive, align 4, !dbg !60
  %cmp = icmp eq i32 %0, 5, !dbg !62
  br i1 %cmp, label %if.then, label %if.end, !dbg !63

if.then:                                          ; preds = %entry
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !64
  %call = call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.2, i32 0, i32 0), i32* %data), !dbg !66
  br label %if.end, !dbg !67

if.end:                                           ; preds = %if.then, %entry
  %2 = load i32, i32* @globalFive, align 4, !dbg !68
  %cmp1 = icmp eq i32 %2, 5, !dbg !70
  br i1 %cmp1, label %if.then2, label %if.end3, !dbg !71

if.then2:                                         ; preds = %if.end
  %3 = load i32, i32* %data, align 4, !dbg !72
  %rem = srem i32 100, %3, !dbg !74
  call void @printIntLine(i32 %rem), !dbg !75
  br label %if.end3, !dbg !76

if.end3:                                          ; preds = %if.then2, %if.end
  ret void, !dbg !77
}

declare i32 @__isoc99_fscanf(%struct._IO_FILE*, i8*, ...) #3

; Function Attrs: nounwind uwtable
define void @good39() #0 !dbg !78 {
entry:
  %data = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !79, metadata !35), !dbg !80
  store i32 -1, i32* %data, align 4, !dbg !81
  %0 = load i32, i32* @globalFive, align 4, !dbg !82
  %cmp = icmp eq i32 %0, 5, !dbg !84
  br i1 %cmp, label %if.then, label %if.end, !dbg !85

if.then:                                          ; preds = %entry
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !86
  %call = call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.2, i32 0, i32 0), i32* %data), !dbg !88
  br label %if.end, !dbg !89

if.end:                                           ; preds = %if.then, %entry
  %2 = load i32, i32* @globalFive, align 4, !dbg !90
  %cmp1 = icmp ne i32 %2, 5, !dbg !92
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !93

if.then2:                                         ; preds = %if.end
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.3, i32 0, i32 0)), !dbg !94
  br label %if.end7, !dbg !96

if.else:                                          ; preds = %if.end
  %3 = load i32, i32* %data, align 4, !dbg !97
  %cmp3 = icmp ne i32 %3, 0, !dbg !100
  br i1 %cmp3, label %if.then4, label %if.else5, !dbg !101

if.then4:                                         ; preds = %if.else
  %4 = load i32, i32* %data, align 4, !dbg !102
  %rem = srem i32 100, %4, !dbg !104
  call void @printIntLine(i32 %rem), !dbg !105
  br label %if.end6, !dbg !106

if.else5:                                         ; preds = %if.else
  call void @printLine(i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.str.4, i32 0, i32 0)), !dbg !107
  br label %if.end6

if.end6:                                          ; preds = %if.else5, %if.then4
  br label %if.end7

if.end7:                                          ; preds = %if.end6, %if.then2
  ret void, !dbg !109
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !110 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @good39(), !dbg !111
  call void @bad39(), !dbg !112
  ret i32 1, !dbg !113
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone }
attributes #3 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!15, !16}
!llvm.ident = !{!17}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (tags/RELEASE_390/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, globals: !5)
!1 = !DIFile(filename: "369_39.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/369")
!2 = !{}
!3 = !{!4}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64, align: 64)
!5 = !{!6, !10, !11, !12, !13, !14}
!6 = distinct !DIGlobalVariable(name: "GLOBAL_CONST_TRUE", scope: !0, file: !7, line: 10, type: !8, isLocal: false, isDefinition: true, variable: i32* @GLOBAL_CONST_TRUE)
!7 = !DIFile(filename: "./369_39.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/369")
!8 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !9)
!9 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!10 = distinct !DIGlobalVariable(name: "GLOBAL_CONST_FALSE", scope: !0, file: !7, line: 11, type: !8, isLocal: false, isDefinition: true, variable: i32* @GLOBAL_CONST_FALSE)
!11 = distinct !DIGlobalVariable(name: "GLOBAL_CONST_FIVE", scope: !0, file: !7, line: 12, type: !8, isLocal: false, isDefinition: true, variable: i32* @GLOBAL_CONST_FIVE)
!12 = distinct !DIGlobalVariable(name: "globalTrue", scope: !0, file: !7, line: 15, type: !9, isLocal: false, isDefinition: true, variable: i32* @globalTrue)
!13 = distinct !DIGlobalVariable(name: "globalFalse", scope: !0, file: !7, line: 16, type: !9, isLocal: false, isDefinition: true, variable: i32* @globalFalse)
!14 = distinct !DIGlobalVariable(name: "globalFive", scope: !0, file: !7, line: 17, type: !9, isLocal: false, isDefinition: true, variable: i32* @globalFive)
!15 = !{i32 2, !"Dwarf Version", i32 4}
!16 = !{i32 2, !"Debug Info Version", i32 3}
!17 = !{!"clang version 3.9.0 (tags/RELEASE_390/final)"}
!18 = distinct !DISubprogram(name: "globalReturnsTrue", scope: !7, file: !7, line: 19, type: !19, isLocal: false, isDefinition: true, scopeLine: 20, isOptimized: false, unit: !0, variables: !2)
!19 = !DISubroutineType(types: !20)
!20 = !{!9}
!21 = !DILocation(line: 21, column: 5, scope: !18)
!22 = distinct !DISubprogram(name: "globalReturnsFalse", scope: !7, file: !7, line: 24, type: !19, isLocal: false, isDefinition: true, scopeLine: 25, isOptimized: false, unit: !0, variables: !2)
!23 = !DILocation(line: 26, column: 5, scope: !22)
!24 = distinct !DISubprogram(name: "globalReturnsTrueOrFalse", scope: !7, file: !7, line: 29, type: !19, isLocal: false, isDefinition: true, scopeLine: 30, isOptimized: false, unit: !0, variables: !2)
!25 = !DILocation(line: 31, column: 13, scope: !24)
!26 = !DILocation(line: 31, column: 20, scope: !24)
!27 = !DILocation(line: 31, column: 5, scope: !24)
!28 = distinct !DISubprogram(name: "printLine", scope: !7, file: !7, line: 34, type: !29, isLocal: false, isDefinition: true, scopeLine: 35, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!29 = !DISubroutineType(types: !30)
!30 = !{null, !31}
!31 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !32, size: 64, align: 64)
!32 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !33)
!33 = !DIBasicType(name: "char", size: 8, align: 8, encoding: DW_ATE_signed_char)
!34 = !DILocalVariable(name: "line", arg: 1, scope: !28, file: !7, line: 34, type: !31)
!35 = !DIExpression()
!36 = !DILocation(line: 34, column: 30, scope: !28)
!37 = !DILocation(line: 36, column: 8, scope: !38)
!38 = distinct !DILexicalBlock(scope: !28, file: !7, line: 36, column: 8)
!39 = !DILocation(line: 36, column: 13, scope: !38)
!40 = !DILocation(line: 36, column: 8, scope: !28)
!41 = !DILocation(line: 38, column: 24, scope: !42)
!42 = distinct !DILexicalBlock(scope: !38, file: !7, line: 37, column: 5)
!43 = !DILocation(line: 38, column: 9, scope: !42)
!44 = !DILocation(line: 39, column: 5, scope: !42)
!45 = !DILocation(line: 40, column: 1, scope: !28)
!46 = distinct !DISubprogram(name: "printIntLine", scope: !7, file: !7, line: 42, type: !47, isLocal: false, isDefinition: true, scopeLine: 43, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!47 = !DISubroutineType(types: !48)
!48 = !{null, !9}
!49 = !DILocalVariable(name: "intNumber", arg: 1, scope: !46, file: !7, line: 42, type: !9)
!50 = !DILocation(line: 42, column: 24, scope: !46)
!51 = !DILocation(line: 44, column: 20, scope: !46)
!52 = !DILocation(line: 44, column: 5, scope: !46)
!53 = !DILocation(line: 45, column: 1, scope: !46)
!54 = distinct !DISubprogram(name: "bad39", scope: !7, file: !7, line: 51, type: !55, isLocal: false, isDefinition: true, scopeLine: 52, isOptimized: false, unit: !0, variables: !2)
!55 = !DISubroutineType(types: !56)
!56 = !{null}
!57 = !DILocalVariable(name: "data", scope: !54, file: !7, line: 53, type: !9)
!58 = !DILocation(line: 53, column: 9, scope: !54)
!59 = !DILocation(line: 55, column: 10, scope: !54)
!60 = !DILocation(line: 56, column: 8, scope: !61)
!61 = distinct !DILexicalBlock(scope: !54, file: !7, line: 56, column: 8)
!62 = !DILocation(line: 56, column: 18, scope: !61)
!63 = !DILocation(line: 56, column: 8, scope: !54)
!64 = !DILocation(line: 59, column: 16, scope: !65)
!65 = distinct !DILexicalBlock(scope: !61, file: !7, line: 57, column: 5)
!66 = !DILocation(line: 59, column: 9, scope: !65)
!67 = !DILocation(line: 60, column: 5, scope: !65)
!68 = !DILocation(line: 61, column: 8, scope: !69)
!69 = distinct !DILexicalBlock(scope: !54, file: !7, line: 61, column: 8)
!70 = !DILocation(line: 61, column: 18, scope: !69)
!71 = !DILocation(line: 61, column: 8, scope: !54)
!72 = !DILocation(line: 64, column: 28, scope: !73)
!73 = distinct !DILexicalBlock(scope: !69, file: !7, line: 62, column: 5)
!74 = !DILocation(line: 64, column: 26, scope: !73)
!75 = !DILocation(line: 64, column: 9, scope: !73)
!76 = !DILocation(line: 65, column: 5, scope: !73)
!77 = !DILocation(line: 66, column: 1, scope: !54)
!78 = distinct !DISubprogram(name: "good39", scope: !7, file: !7, line: 72, type: !55, isLocal: false, isDefinition: true, scopeLine: 73, isOptimized: false, unit: !0, variables: !2)
!79 = !DILocalVariable(name: "data", scope: !78, file: !7, line: 74, type: !9)
!80 = !DILocation(line: 74, column: 13, scope: !78)
!81 = !DILocation(line: 76, column: 10, scope: !78)
!82 = !DILocation(line: 77, column: 8, scope: !83)
!83 = distinct !DILexicalBlock(scope: !78, file: !7, line: 77, column: 8)
!84 = !DILocation(line: 77, column: 18, scope: !83)
!85 = !DILocation(line: 77, column: 8, scope: !78)
!86 = !DILocation(line: 80, column: 16, scope: !87)
!87 = distinct !DILexicalBlock(scope: !83, file: !7, line: 78, column: 5)
!88 = !DILocation(line: 80, column: 9, scope: !87)
!89 = !DILocation(line: 81, column: 5, scope: !87)
!90 = !DILocation(line: 82, column: 8, scope: !91)
!91 = distinct !DILexicalBlock(scope: !78, file: !7, line: 82, column: 8)
!92 = !DILocation(line: 82, column: 18, scope: !91)
!93 = !DILocation(line: 82, column: 8, scope: !78)
!94 = !DILocation(line: 85, column: 9, scope: !95)
!95 = distinct !DILexicalBlock(scope: !91, file: !7, line: 83, column: 5)
!96 = !DILocation(line: 86, column: 5, scope: !95)
!97 = !DILocation(line: 90, column: 13, scope: !98)
!98 = distinct !DILexicalBlock(scope: !99, file: !7, line: 90, column: 13)
!99 = distinct !DILexicalBlock(scope: !91, file: !7, line: 88, column: 5)
!100 = !DILocation(line: 90, column: 18, scope: !98)
!101 = !DILocation(line: 90, column: 13, scope: !99)
!102 = !DILocation(line: 92, column: 32, scope: !103)
!103 = distinct !DILexicalBlock(scope: !98, file: !7, line: 91, column: 9)
!104 = !DILocation(line: 92, column: 30, scope: !103)
!105 = !DILocation(line: 92, column: 13, scope: !103)
!106 = !DILocation(line: 93, column: 9, scope: !103)
!107 = !DILocation(line: 96, column: 13, scope: !108)
!108 = distinct !DILexicalBlock(scope: !98, file: !7, line: 95, column: 9)
!109 = !DILocation(line: 99, column: 1, scope: !78)
!110 = distinct !DISubprogram(name: "main", scope: !7, file: !7, line: 103, type: !19, isLocal: false, isDefinition: true, scopeLine: 103, isOptimized: false, unit: !0, variables: !2)
!111 = !DILocation(line: 104, column: 5, scope: !110)
!112 = !DILocation(line: 105, column: 5, scope: !110)
!113 = !DILocation(line: 106, column: 5, scope: !110)
