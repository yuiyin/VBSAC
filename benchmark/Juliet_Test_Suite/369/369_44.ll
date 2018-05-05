; ModuleID = './369_44.c'
source_filename = "./369_44.c"
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
@badStatic = internal global i32 0, align 4
@goodB2G1Static = internal global i32 0, align 4
@.str.3 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@.str.4 = private unnamed_addr constant [38 x i8] c"This would result in a divide by zero\00", align 1

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
  call void @llvm.dbg.declare(metadata i8** %line.addr, metadata !36, metadata !37), !dbg !38
  %0 = load i8*, i8** %line.addr, align 8, !dbg !39
  %cmp = icmp ne i8* %0, null, !dbg !41
  br i1 %cmp, label %if.then, label %if.end, !dbg !42

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** %line.addr, align 8, !dbg !43
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), i8* %1), !dbg !45
  br label %if.end, !dbg !46

if.end:                                           ; preds = %if.then, %entry
  ret void, !dbg !47
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #2

declare i32 @printf(i8*, ...) #3

; Function Attrs: nounwind uwtable
define void @printIntLine(i32 %intNumber) #0 !dbg !48 {
entry:
  %intNumber.addr = alloca i32, align 4
  store i32 %intNumber, i32* %intNumber.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %intNumber.addr, metadata !51, metadata !37), !dbg !52
  %0 = load i32, i32* %intNumber.addr, align 4, !dbg !53
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i32 0, i32 0), i32 %0), !dbg !54
  ret void, !dbg !55
}

; Function Attrs: nounwind uwtable
define void @bad44() #0 !dbg !56 {
entry:
  %data = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !59, metadata !37), !dbg !60
  store i32 -1, i32* %data, align 4, !dbg !61
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !62
  %call = call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* %0, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.2, i32 0, i32 0), i32* %data), !dbg !63
  store i32 1, i32* @badStatic, align 4, !dbg !64
  %1 = load i32, i32* %data, align 4, !dbg !65
  call void @badSink(i32 %1), !dbg !66
  ret void, !dbg !67
}

declare i32 @__isoc99_fscanf(%struct._IO_FILE*, i8*, ...) #3

; Function Attrs: nounwind uwtable
define internal void @badSink(i32 %data) #0 !dbg !68 {
entry:
  %data.addr = alloca i32, align 4
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !69, metadata !37), !dbg !70
  %0 = load i32, i32* @badStatic, align 4, !dbg !71
  %tobool = icmp ne i32 %0, 0, !dbg !71
  br i1 %tobool, label %if.then, label %if.end, !dbg !73

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %data.addr, align 4, !dbg !74
  %rem = srem i32 100, %1, !dbg !76
  call void @printIntLine(i32 %rem), !dbg !77
  br label %if.end, !dbg !78

if.end:                                           ; preds = %if.then, %entry
  ret void, !dbg !79
}

; Function Attrs: nounwind uwtable
define void @good44() #0 !dbg !80 {
entry:
  %data = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !81, metadata !37), !dbg !82
  store i32 -1, i32* %data, align 4, !dbg !83
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !84
  %call = call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* %0, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.2, i32 0, i32 0), i32* %data), !dbg !85
  store i32 0, i32* @goodB2G1Static, align 4, !dbg !86
  %1 = load i32, i32* %data, align 4, !dbg !87
  call void @goodB2G1Sink(i32 %1), !dbg !88
  ret void, !dbg !89
}

; Function Attrs: nounwind uwtable
define internal void @goodB2G1Sink(i32 %data) #0 !dbg !90 {
entry:
  %data.addr = alloca i32, align 4
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !91, metadata !37), !dbg !92
  %0 = load i32, i32* @goodB2G1Static, align 4, !dbg !93
  %tobool = icmp ne i32 %0, 0, !dbg !93
  br i1 %tobool, label %if.then, label %if.else, !dbg !95

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.3, i32 0, i32 0)), !dbg !96
  br label %if.end3, !dbg !98

if.else:                                          ; preds = %entry
  %1 = load i32, i32* %data.addr, align 4, !dbg !99
  %cmp = icmp ne i32 %1, 0, !dbg !102
  br i1 %cmp, label %if.then1, label %if.else2, !dbg !103

if.then1:                                         ; preds = %if.else
  %2 = load i32, i32* %data.addr, align 4, !dbg !104
  %rem = srem i32 100, %2, !dbg !106
  call void @printIntLine(i32 %rem), !dbg !107
  br label %if.end, !dbg !108

if.else2:                                         ; preds = %if.else
  call void @printLine(i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.str.4, i32 0, i32 0)), !dbg !109
  br label %if.end

if.end:                                           ; preds = %if.else2, %if.then1
  br label %if.end3

if.end3:                                          ; preds = %if.end, %if.then
  ret void, !dbg !111
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !112 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @good44(), !dbg !113
  call void @bad44(), !dbg !114
  ret i32 1, !dbg !115
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone }
attributes #3 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!17, !18}
!llvm.ident = !{!19}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (tags/RELEASE_390/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, globals: !5)
!1 = !DIFile(filename: "369_44.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/369")
!2 = !{}
!3 = !{!4}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64, align: 64)
!5 = !{!6, !10, !11, !12, !13, !14, !15, !16}
!6 = distinct !DIGlobalVariable(name: "GLOBAL_CONST_TRUE", scope: !0, file: !7, line: 10, type: !8, isLocal: false, isDefinition: true, variable: i32* @GLOBAL_CONST_TRUE)
!7 = !DIFile(filename: "./369_44.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/369")
!8 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !9)
!9 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!10 = distinct !DIGlobalVariable(name: "GLOBAL_CONST_FALSE", scope: !0, file: !7, line: 11, type: !8, isLocal: false, isDefinition: true, variable: i32* @GLOBAL_CONST_FALSE)
!11 = distinct !DIGlobalVariable(name: "GLOBAL_CONST_FIVE", scope: !0, file: !7, line: 12, type: !8, isLocal: false, isDefinition: true, variable: i32* @GLOBAL_CONST_FIVE)
!12 = distinct !DIGlobalVariable(name: "globalTrue", scope: !0, file: !7, line: 15, type: !9, isLocal: false, isDefinition: true, variable: i32* @globalTrue)
!13 = distinct !DIGlobalVariable(name: "globalFalse", scope: !0, file: !7, line: 16, type: !9, isLocal: false, isDefinition: true, variable: i32* @globalFalse)
!14 = distinct !DIGlobalVariable(name: "globalFive", scope: !0, file: !7, line: 17, type: !9, isLocal: false, isDefinition: true, variable: i32* @globalFive)
!15 = distinct !DIGlobalVariable(name: "badStatic", scope: !0, file: !7, line: 47, type: !9, isLocal: true, isDefinition: true, variable: i32* @badStatic)
!16 = distinct !DIGlobalVariable(name: "goodB2G1Static", scope: !0, file: !7, line: 48, type: !9, isLocal: true, isDefinition: true, variable: i32* @goodB2G1Static)
!17 = !{i32 2, !"Dwarf Version", i32 4}
!18 = !{i32 2, !"Debug Info Version", i32 3}
!19 = !{!"clang version 3.9.0 (tags/RELEASE_390/final)"}
!20 = distinct !DISubprogram(name: "globalReturnsTrue", scope: !7, file: !7, line: 19, type: !21, isLocal: false, isDefinition: true, scopeLine: 20, isOptimized: false, unit: !0, variables: !2)
!21 = !DISubroutineType(types: !22)
!22 = !{!9}
!23 = !DILocation(line: 21, column: 5, scope: !20)
!24 = distinct !DISubprogram(name: "globalReturnsFalse", scope: !7, file: !7, line: 24, type: !21, isLocal: false, isDefinition: true, scopeLine: 25, isOptimized: false, unit: !0, variables: !2)
!25 = !DILocation(line: 26, column: 5, scope: !24)
!26 = distinct !DISubprogram(name: "globalReturnsTrueOrFalse", scope: !7, file: !7, line: 29, type: !21, isLocal: false, isDefinition: true, scopeLine: 30, isOptimized: false, unit: !0, variables: !2)
!27 = !DILocation(line: 31, column: 13, scope: !26)
!28 = !DILocation(line: 31, column: 20, scope: !26)
!29 = !DILocation(line: 31, column: 5, scope: !26)
!30 = distinct !DISubprogram(name: "printLine", scope: !7, file: !7, line: 34, type: !31, isLocal: false, isDefinition: true, scopeLine: 35, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!31 = !DISubroutineType(types: !32)
!32 = !{null, !33}
!33 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !34, size: 64, align: 64)
!34 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !35)
!35 = !DIBasicType(name: "char", size: 8, align: 8, encoding: DW_ATE_signed_char)
!36 = !DILocalVariable(name: "line", arg: 1, scope: !30, file: !7, line: 34, type: !33)
!37 = !DIExpression()
!38 = !DILocation(line: 34, column: 30, scope: !30)
!39 = !DILocation(line: 36, column: 8, scope: !40)
!40 = distinct !DILexicalBlock(scope: !30, file: !7, line: 36, column: 8)
!41 = !DILocation(line: 36, column: 13, scope: !40)
!42 = !DILocation(line: 36, column: 8, scope: !30)
!43 = !DILocation(line: 38, column: 24, scope: !44)
!44 = distinct !DILexicalBlock(scope: !40, file: !7, line: 37, column: 5)
!45 = !DILocation(line: 38, column: 9, scope: !44)
!46 = !DILocation(line: 39, column: 5, scope: !44)
!47 = !DILocation(line: 40, column: 1, scope: !30)
!48 = distinct !DISubprogram(name: "printIntLine", scope: !7, file: !7, line: 42, type: !49, isLocal: false, isDefinition: true, scopeLine: 43, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!49 = !DISubroutineType(types: !50)
!50 = !{null, !9}
!51 = !DILocalVariable(name: "intNumber", arg: 1, scope: !48, file: !7, line: 42, type: !9)
!52 = !DILocation(line: 42, column: 24, scope: !48)
!53 = !DILocation(line: 44, column: 20, scope: !48)
!54 = !DILocation(line: 44, column: 5, scope: !48)
!55 = !DILocation(line: 45, column: 1, scope: !48)
!56 = distinct !DISubprogram(name: "bad44", scope: !7, file: !7, line: 59, type: !57, isLocal: false, isDefinition: true, scopeLine: 60, isOptimized: false, unit: !0, variables: !2)
!57 = !DISubroutineType(types: !58)
!58 = !{null}
!59 = !DILocalVariable(name: "data", scope: !56, file: !7, line: 61, type: !9)
!60 = !DILocation(line: 61, column: 9, scope: !56)
!61 = !DILocation(line: 63, column: 10, scope: !56)
!62 = !DILocation(line: 65, column: 12, scope: !56)
!63 = !DILocation(line: 65, column: 5, scope: !56)
!64 = !DILocation(line: 66, column: 15, scope: !56)
!65 = !DILocation(line: 67, column: 13, scope: !56)
!66 = !DILocation(line: 67, column: 5, scope: !56)
!67 = !DILocation(line: 68, column: 1, scope: !56)
!68 = distinct !DISubprogram(name: "badSink", scope: !7, file: !7, line: 51, type: !49, isLocal: true, isDefinition: true, scopeLine: 52, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!69 = !DILocalVariable(name: "data", arg: 1, scope: !68, file: !7, line: 51, type: !9)
!70 = !DILocation(line: 51, column: 25, scope: !68)
!71 = !DILocation(line: 53, column: 8, scope: !72)
!72 = distinct !DILexicalBlock(scope: !68, file: !7, line: 53, column: 8)
!73 = !DILocation(line: 53, column: 8, scope: !68)
!74 = !DILocation(line: 56, column: 28, scope: !75)
!75 = distinct !DILexicalBlock(scope: !72, file: !7, line: 54, column: 5)
!76 = !DILocation(line: 56, column: 26, scope: !75)
!77 = !DILocation(line: 56, column: 9, scope: !75)
!78 = !DILocation(line: 57, column: 5, scope: !75)
!79 = !DILocation(line: 58, column: 1, scope: !68)
!80 = distinct !DISubprogram(name: "good44", scope: !7, file: !7, line: 95, type: !57, isLocal: false, isDefinition: true, scopeLine: 95, isOptimized: false, unit: !0, variables: !2)
!81 = !DILocalVariable(name: "data", scope: !80, file: !7, line: 97, type: !9)
!82 = !DILocation(line: 97, column: 9, scope: !80)
!83 = !DILocation(line: 99, column: 10, scope: !80)
!84 = !DILocation(line: 101, column: 12, scope: !80)
!85 = !DILocation(line: 101, column: 5, scope: !80)
!86 = !DILocation(line: 102, column: 20, scope: !80)
!87 = !DILocation(line: 103, column: 18, scope: !80)
!88 = !DILocation(line: 103, column: 5, scope: !80)
!89 = !DILocation(line: 104, column: 1, scope: !80)
!90 = distinct !DISubprogram(name: "goodB2G1Sink", scope: !7, file: !7, line: 74, type: !49, isLocal: true, isDefinition: true, scopeLine: 75, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!91 = !DILocalVariable(name: "data", arg: 1, scope: !90, file: !7, line: 74, type: !9)
!92 = !DILocation(line: 74, column: 30, scope: !90)
!93 = !DILocation(line: 76, column: 8, scope: !94)
!94 = distinct !DILexicalBlock(scope: !90, file: !7, line: 76, column: 8)
!95 = !DILocation(line: 76, column: 8, scope: !90)
!96 = !DILocation(line: 79, column: 9, scope: !97)
!97 = distinct !DILexicalBlock(scope: !94, file: !7, line: 77, column: 5)
!98 = !DILocation(line: 80, column: 5, scope: !97)
!99 = !DILocation(line: 84, column: 13, scope: !100)
!100 = distinct !DILexicalBlock(scope: !101, file: !7, line: 84, column: 13)
!101 = distinct !DILexicalBlock(scope: !94, file: !7, line: 82, column: 5)
!102 = !DILocation(line: 84, column: 18, scope: !100)
!103 = !DILocation(line: 84, column: 13, scope: !101)
!104 = !DILocation(line: 86, column: 32, scope: !105)
!105 = distinct !DILexicalBlock(scope: !100, file: !7, line: 85, column: 9)
!106 = !DILocation(line: 86, column: 30, scope: !105)
!107 = !DILocation(line: 86, column: 13, scope: !105)
!108 = !DILocation(line: 87, column: 9, scope: !105)
!109 = !DILocation(line: 90, column: 13, scope: !110)
!110 = distinct !DILexicalBlock(scope: !100, file: !7, line: 89, column: 9)
!111 = !DILocation(line: 93, column: 1, scope: !90)
!112 = distinct !DISubprogram(name: "main", scope: !7, file: !7, line: 108, type: !21, isLocal: false, isDefinition: true, scopeLine: 108, isOptimized: false, unit: !0, variables: !2)
!113 = !DILocation(line: 109, column: 5, scope: !112)
!114 = !DILocation(line: 110, column: 5, scope: !112)
!115 = !DILocation(line: 111, column: 5, scope: !112)
