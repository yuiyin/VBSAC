; ModuleID = './369_11.c'
source_filename = "./369_11.c"
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
define void @printLine(i8* %line) #0 !dbg !18 {
entry:
  %line.addr = alloca i8*, align 8
  store i8* %line, i8** %line.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %line.addr, metadata !24, metadata !25), !dbg !26
  %0 = load i8*, i8** %line.addr, align 8, !dbg !27
  %cmp = icmp ne i8* %0, null, !dbg !29
  br i1 %cmp, label %if.then, label %if.end, !dbg !30

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** %line.addr, align 8, !dbg !31
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), i8* %1), !dbg !33
  br label %if.end, !dbg !34

if.end:                                           ; preds = %if.then, %entry
  ret void, !dbg !35
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @printf(i8*, ...) #2

; Function Attrs: nounwind uwtable
define void @printIntLine(i32 %intNumber) #0 !dbg !36 {
entry:
  %intNumber.addr = alloca i32, align 4
  store i32 %intNumber, i32* %intNumber.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %intNumber.addr, metadata !39, metadata !25), !dbg !40
  %0 = load i32, i32* %intNumber.addr, align 4, !dbg !41
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i32 0, i32 0), i32 %0), !dbg !42
  ret void, !dbg !43
}

; Function Attrs: nounwind uwtable
define i32 @globalReturnsTrue() #0 !dbg !44 {
entry:
  ret i32 1, !dbg !47
}

; Function Attrs: nounwind uwtable
define i32 @globalReturnsFalse() #0 !dbg !48 {
entry:
  ret i32 0, !dbg !49
}

; Function Attrs: nounwind uwtable
define void @bad11() #0 !dbg !50 {
entry:
  %data = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !53, metadata !25), !dbg !54
  store i32 -1, i32* %data, align 4, !dbg !55
  %call = call i32 @globalReturnsTrue(), !dbg !56
  %tobool = icmp ne i32 %call, 0, !dbg !56
  br i1 %tobool, label %if.then, label %if.end, !dbg !58

if.then:                                          ; preds = %entry
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !59
  %call1 = call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* %0, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.2, i32 0, i32 0), i32* %data), !dbg !61
  br label %if.end, !dbg !62

if.end:                                           ; preds = %if.then, %entry
  %call2 = call i32 @globalReturnsTrue(), !dbg !63
  %tobool3 = icmp ne i32 %call2, 0, !dbg !63
  br i1 %tobool3, label %if.then4, label %if.end5, !dbg !65

if.then4:                                         ; preds = %if.end
  %1 = load i32, i32* %data, align 4, !dbg !66
  %div = sdiv i32 100, %1, !dbg !68
  call void @printIntLine(i32 %div), !dbg !69
  br label %if.end5, !dbg !70

if.end5:                                          ; preds = %if.then4, %if.end
  ret void, !dbg !71
}

declare i32 @__isoc99_fscanf(%struct._IO_FILE*, i8*, ...) #2

; Function Attrs: nounwind uwtable
define void @good11() #0 !dbg !72 {
entry:
  %data = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !73, metadata !25), !dbg !74
  store i32 -1, i32* %data, align 4, !dbg !75
  %call = call i32 @globalReturnsTrue(), !dbg !76
  %tobool = icmp ne i32 %call, 0, !dbg !76
  br i1 %tobool, label %if.then, label %if.end, !dbg !78

if.then:                                          ; preds = %entry
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !79
  %call1 = call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* %0, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.2, i32 0, i32 0), i32* %data), !dbg !81
  br label %if.end, !dbg !82

if.end:                                           ; preds = %if.then, %entry
  %call2 = call i32 @globalReturnsFalse(), !dbg !83
  %tobool3 = icmp ne i32 %call2, 0, !dbg !83
  br i1 %tobool3, label %if.then4, label %if.else, !dbg !85

if.then4:                                         ; preds = %if.end
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.3, i32 0, i32 0)), !dbg !86
  br label %if.end8, !dbg !88

if.else:                                          ; preds = %if.end
  %1 = load i32, i32* %data, align 4, !dbg !89
  %cmp = icmp ne i32 %1, 0, !dbg !92
  br i1 %cmp, label %if.then5, label %if.else6, !dbg !93

if.then5:                                         ; preds = %if.else
  %2 = load i32, i32* %data, align 4, !dbg !94
  %div = sdiv i32 100, %2, !dbg !96
  call void @printIntLine(i32 %div), !dbg !97
  br label %if.end7, !dbg !98

if.else6:                                         ; preds = %if.else
  call void @printLine(i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.str.4, i32 0, i32 0)), !dbg !99
  br label %if.end7

if.end7:                                          ; preds = %if.else6, %if.then5
  br label %if.end8

if.end8:                                          ; preds = %if.end7, %if.then4
  ret void, !dbg !101
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !102 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @good11(), !dbg !103
  call void @bad11(), !dbg !104
  ret i32 1, !dbg !105
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!15, !16}
!llvm.ident = !{!17}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (tags/RELEASE_390/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, globals: !5)
!1 = !DIFile(filename: "369_11.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/369")
!2 = !{}
!3 = !{!4}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64, align: 64)
!5 = !{!6, !10, !11, !12, !13, !14}
!6 = distinct !DIGlobalVariable(name: "GLOBAL_CONST_TRUE", scope: !0, file: !7, line: 10, type: !8, isLocal: false, isDefinition: true, variable: i32* @GLOBAL_CONST_TRUE)
!7 = !DIFile(filename: "./369_11.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/369")
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
!18 = distinct !DISubprogram(name: "printLine", scope: !7, file: !7, line: 19, type: !19, isLocal: false, isDefinition: true, scopeLine: 20, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!19 = !DISubroutineType(types: !20)
!20 = !{null, !21}
!21 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !22, size: 64, align: 64)
!22 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !23)
!23 = !DIBasicType(name: "char", size: 8, align: 8, encoding: DW_ATE_signed_char)
!24 = !DILocalVariable(name: "line", arg: 1, scope: !18, file: !7, line: 19, type: !21)
!25 = !DIExpression()
!26 = !DILocation(line: 19, column: 30, scope: !18)
!27 = !DILocation(line: 21, column: 8, scope: !28)
!28 = distinct !DILexicalBlock(scope: !18, file: !7, line: 21, column: 8)
!29 = !DILocation(line: 21, column: 13, scope: !28)
!30 = !DILocation(line: 21, column: 8, scope: !18)
!31 = !DILocation(line: 23, column: 24, scope: !32)
!32 = distinct !DILexicalBlock(scope: !28, file: !7, line: 22, column: 5)
!33 = !DILocation(line: 23, column: 9, scope: !32)
!34 = !DILocation(line: 24, column: 5, scope: !32)
!35 = !DILocation(line: 25, column: 1, scope: !18)
!36 = distinct !DISubprogram(name: "printIntLine", scope: !7, file: !7, line: 27, type: !37, isLocal: false, isDefinition: true, scopeLine: 28, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!37 = !DISubroutineType(types: !38)
!38 = !{null, !9}
!39 = !DILocalVariable(name: "intNumber", arg: 1, scope: !36, file: !7, line: 27, type: !9)
!40 = !DILocation(line: 27, column: 24, scope: !36)
!41 = !DILocation(line: 29, column: 20, scope: !36)
!42 = !DILocation(line: 29, column: 5, scope: !36)
!43 = !DILocation(line: 30, column: 1, scope: !36)
!44 = distinct !DISubprogram(name: "globalReturnsTrue", scope: !7, file: !7, line: 32, type: !45, isLocal: false, isDefinition: true, scopeLine: 33, isOptimized: false, unit: !0, variables: !2)
!45 = !DISubroutineType(types: !46)
!46 = !{!9}
!47 = !DILocation(line: 34, column: 5, scope: !44)
!48 = distinct !DISubprogram(name: "globalReturnsFalse", scope: !7, file: !7, line: 37, type: !45, isLocal: false, isDefinition: true, scopeLine: 38, isOptimized: false, unit: !0, variables: !2)
!49 = !DILocation(line: 39, column: 5, scope: !48)
!50 = distinct !DISubprogram(name: "bad11", scope: !7, file: !7, line: 44, type: !51, isLocal: false, isDefinition: true, scopeLine: 45, isOptimized: false, unit: !0, variables: !2)
!51 = !DISubroutineType(types: !52)
!52 = !{null}
!53 = !DILocalVariable(name: "data", scope: !50, file: !7, line: 46, type: !9)
!54 = !DILocation(line: 46, column: 9, scope: !50)
!55 = !DILocation(line: 48, column: 10, scope: !50)
!56 = !DILocation(line: 49, column: 8, scope: !57)
!57 = distinct !DILexicalBlock(scope: !50, file: !7, line: 49, column: 8)
!58 = !DILocation(line: 49, column: 8, scope: !50)
!59 = !DILocation(line: 52, column: 16, scope: !60)
!60 = distinct !DILexicalBlock(scope: !57, file: !7, line: 50, column: 5)
!61 = !DILocation(line: 52, column: 9, scope: !60)
!62 = !DILocation(line: 53, column: 5, scope: !60)
!63 = !DILocation(line: 54, column: 8, scope: !64)
!64 = distinct !DILexicalBlock(scope: !50, file: !7, line: 54, column: 8)
!65 = !DILocation(line: 54, column: 8, scope: !50)
!66 = !DILocation(line: 57, column: 28, scope: !67)
!67 = distinct !DILexicalBlock(scope: !64, file: !7, line: 55, column: 5)
!68 = !DILocation(line: 57, column: 26, scope: !67)
!69 = !DILocation(line: 57, column: 9, scope: !67)
!70 = !DILocation(line: 58, column: 5, scope: !67)
!71 = !DILocation(line: 59, column: 1, scope: !50)
!72 = distinct !DISubprogram(name: "good11", scope: !7, file: !7, line: 63, type: !51, isLocal: false, isDefinition: true, scopeLine: 64, isOptimized: false, unit: !0, variables: !2)
!73 = !DILocalVariable(name: "data", scope: !72, file: !7, line: 65, type: !9)
!74 = !DILocation(line: 65, column: 9, scope: !72)
!75 = !DILocation(line: 67, column: 10, scope: !72)
!76 = !DILocation(line: 68, column: 8, scope: !77)
!77 = distinct !DILexicalBlock(scope: !72, file: !7, line: 68, column: 8)
!78 = !DILocation(line: 68, column: 8, scope: !72)
!79 = !DILocation(line: 71, column: 16, scope: !80)
!80 = distinct !DILexicalBlock(scope: !77, file: !7, line: 69, column: 5)
!81 = !DILocation(line: 71, column: 9, scope: !80)
!82 = !DILocation(line: 72, column: 5, scope: !80)
!83 = !DILocation(line: 73, column: 8, scope: !84)
!84 = distinct !DILexicalBlock(scope: !72, file: !7, line: 73, column: 8)
!85 = !DILocation(line: 73, column: 8, scope: !72)
!86 = !DILocation(line: 76, column: 9, scope: !87)
!87 = distinct !DILexicalBlock(scope: !84, file: !7, line: 74, column: 5)
!88 = !DILocation(line: 77, column: 5, scope: !87)
!89 = !DILocation(line: 81, column: 13, scope: !90)
!90 = distinct !DILexicalBlock(scope: !91, file: !7, line: 81, column: 13)
!91 = distinct !DILexicalBlock(scope: !84, file: !7, line: 79, column: 5)
!92 = !DILocation(line: 81, column: 18, scope: !90)
!93 = !DILocation(line: 81, column: 13, scope: !91)
!94 = !DILocation(line: 83, column: 32, scope: !95)
!95 = distinct !DILexicalBlock(scope: !90, file: !7, line: 82, column: 9)
!96 = !DILocation(line: 83, column: 30, scope: !95)
!97 = !DILocation(line: 83, column: 13, scope: !95)
!98 = !DILocation(line: 84, column: 9, scope: !95)
!99 = !DILocation(line: 87, column: 13, scope: !100)
!100 = distinct !DILexicalBlock(scope: !90, file: !7, line: 86, column: 9)
!101 = !DILocation(line: 90, column: 1, scope: !72)
!102 = distinct !DISubprogram(name: "main", scope: !7, file: !7, line: 93, type: !45, isLocal: false, isDefinition: true, scopeLine: 93, isOptimized: false, unit: !0, variables: !2)
!103 = !DILocation(line: 94, column: 5, scope: !102)
!104 = !DILocation(line: 95, column: 2, scope: !102)
!105 = !DILocation(line: 96, column: 5, scope: !102)
