; ModuleID = './369_10.c'
source_filename = "./369_10.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1
@.str.1 = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@globalTrue = global i32 1, align 4
@globalFalse = global i32 0, align 4
@globalFive = global i32 5, align 4
@stdin = external global %struct._IO_FILE*, align 8
@.str.2 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.3 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@.str.4 = private unnamed_addr constant [38 x i8] c"This would result in a divide by zero\00", align 1

; Function Attrs: nounwind uwtable
define void @printLine(i8* %line) #0 !dbg !14 {
entry:
  %line.addr = alloca i8*, align 8
  store i8* %line, i8** %line.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %line.addr, metadata !20, metadata !21), !dbg !22
  %0 = load i8*, i8** %line.addr, align 8, !dbg !23
  %cmp = icmp ne i8* %0, null, !dbg !25
  br i1 %cmp, label %if.then, label %if.end, !dbg !26

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** %line.addr, align 8, !dbg !27
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), i8* %1), !dbg !29
  br label %if.end, !dbg !30

if.end:                                           ; preds = %if.then, %entry
  ret void, !dbg !31
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @printf(i8*, ...) #2

; Function Attrs: nounwind uwtable
define void @printIntLine(i32 %intNumber) #0 !dbg !32 {
entry:
  %intNumber.addr = alloca i32, align 4
  store i32 %intNumber, i32* %intNumber.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %intNumber.addr, metadata !35, metadata !21), !dbg !36
  %0 = load i32, i32* %intNumber.addr, align 4, !dbg !37
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i32 0, i32 0), i32 %0), !dbg !38
  ret void, !dbg !39
}

; Function Attrs: nounwind uwtable
define void @bad10() #0 !dbg !40 {
entry:
  %data = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !43, metadata !21), !dbg !44
  store i32 -1, i32* %data, align 4, !dbg !45
  %0 = load i32, i32* @globalTrue, align 4, !dbg !46
  %tobool = icmp ne i32 %0, 0, !dbg !46
  br i1 %tobool, label %if.then, label %if.end, !dbg !48

if.then:                                          ; preds = %entry
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !49
  %call = call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.2, i32 0, i32 0), i32* %data), !dbg !51
  br label %if.end, !dbg !52

if.end:                                           ; preds = %if.then, %entry
  %2 = load i32, i32* @globalTrue, align 4, !dbg !53
  %tobool1 = icmp ne i32 %2, 0, !dbg !53
  br i1 %tobool1, label %if.then2, label %if.end3, !dbg !55

if.then2:                                         ; preds = %if.end
  %3 = load i32, i32* %data, align 4, !dbg !56
  %div = sdiv i32 100, %3, !dbg !58
  call void @printIntLine(i32 %div), !dbg !59
  br label %if.end3, !dbg !60

if.end3:                                          ; preds = %if.then2, %if.end
  ret void, !dbg !61
}

declare i32 @__isoc99_fscanf(%struct._IO_FILE*, i8*, ...) #2

; Function Attrs: nounwind uwtable
define void @good10() #0 !dbg !62 {
entry:
  %data = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !63, metadata !21), !dbg !64
  store i32 -1, i32* %data, align 4, !dbg !65
  %0 = load i32, i32* @globalTrue, align 4, !dbg !66
  %tobool = icmp ne i32 %0, 0, !dbg !66
  br i1 %tobool, label %if.then, label %if.end, !dbg !68

if.then:                                          ; preds = %entry
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !69
  %call = call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.2, i32 0, i32 0), i32* %data), !dbg !71
  br label %if.end, !dbg !72

if.end:                                           ; preds = %if.then, %entry
  %2 = load i32, i32* @globalFalse, align 4, !dbg !73
  %tobool1 = icmp ne i32 %2, 0, !dbg !73
  br i1 %tobool1, label %if.then2, label %if.else, !dbg !75

if.then2:                                         ; preds = %if.end
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.3, i32 0, i32 0)), !dbg !76
  br label %if.end6, !dbg !78

if.else:                                          ; preds = %if.end
  %3 = load i32, i32* %data, align 4, !dbg !79
  %cmp = icmp ne i32 %3, 0, !dbg !82
  br i1 %cmp, label %if.then3, label %if.else4, !dbg !83

if.then3:                                         ; preds = %if.else
  %4 = load i32, i32* %data, align 4, !dbg !84
  %div = sdiv i32 100, %4, !dbg !86
  call void @printIntLine(i32 %div), !dbg !87
  br label %if.end5, !dbg !88

if.else4:                                         ; preds = %if.else
  call void @printLine(i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.str.4, i32 0, i32 0)), !dbg !89
  br label %if.end5

if.end5:                                          ; preds = %if.else4, %if.then3
  br label %if.end6

if.end6:                                          ; preds = %if.end5, %if.then2
  ret void, !dbg !91
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !92 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @good10(), !dbg !95
  call void @bad10(), !dbg !96
  ret i32 1, !dbg !97
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (tags/RELEASE_390/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, globals: !5)
!1 = !DIFile(filename: "369_10.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/369")
!2 = !{}
!3 = !{!4}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64, align: 64)
!5 = !{!6, !9, !10}
!6 = distinct !DIGlobalVariable(name: "globalTrue", scope: !0, file: !7, line: 23, type: !8, isLocal: false, isDefinition: true, variable: i32* @globalTrue)
!7 = !DIFile(filename: "./369_10.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/369")
!8 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!9 = distinct !DIGlobalVariable(name: "globalFalse", scope: !0, file: !7, line: 24, type: !8, isLocal: false, isDefinition: true, variable: i32* @globalFalse)
!10 = distinct !DIGlobalVariable(name: "globalFive", scope: !0, file: !7, line: 25, type: !8, isLocal: false, isDefinition: true, variable: i32* @globalFive)
!11 = !{i32 2, !"Dwarf Version", i32 4}
!12 = !{i32 2, !"Debug Info Version", i32 3}
!13 = !{!"clang version 3.9.0 (tags/RELEASE_390/final)"}
!14 = distinct !DISubprogram(name: "printLine", scope: !7, file: !7, line: 10, type: !15, isLocal: false, isDefinition: true, scopeLine: 11, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!15 = !DISubroutineType(types: !16)
!16 = !{null, !17}
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !18, size: 64, align: 64)
!18 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !19)
!19 = !DIBasicType(name: "char", size: 8, align: 8, encoding: DW_ATE_signed_char)
!20 = !DILocalVariable(name: "line", arg: 1, scope: !14, file: !7, line: 10, type: !17)
!21 = !DIExpression()
!22 = !DILocation(line: 10, column: 30, scope: !14)
!23 = !DILocation(line: 12, column: 8, scope: !24)
!24 = distinct !DILexicalBlock(scope: !14, file: !7, line: 12, column: 8)
!25 = !DILocation(line: 12, column: 13, scope: !24)
!26 = !DILocation(line: 12, column: 8, scope: !14)
!27 = !DILocation(line: 14, column: 24, scope: !28)
!28 = distinct !DILexicalBlock(scope: !24, file: !7, line: 13, column: 5)
!29 = !DILocation(line: 14, column: 9, scope: !28)
!30 = !DILocation(line: 15, column: 5, scope: !28)
!31 = !DILocation(line: 16, column: 1, scope: !14)
!32 = distinct !DISubprogram(name: "printIntLine", scope: !7, file: !7, line: 18, type: !33, isLocal: false, isDefinition: true, scopeLine: 19, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!33 = !DISubroutineType(types: !34)
!34 = !{null, !8}
!35 = !DILocalVariable(name: "intNumber", arg: 1, scope: !32, file: !7, line: 18, type: !8)
!36 = !DILocation(line: 18, column: 24, scope: !32)
!37 = !DILocation(line: 20, column: 20, scope: !32)
!38 = !DILocation(line: 20, column: 5, scope: !32)
!39 = !DILocation(line: 21, column: 1, scope: !32)
!40 = distinct !DISubprogram(name: "bad10", scope: !7, file: !7, line: 42, type: !41, isLocal: false, isDefinition: true, scopeLine: 43, isOptimized: false, unit: !0, variables: !2)
!41 = !DISubroutineType(types: !42)
!42 = !{null}
!43 = !DILocalVariable(name: "data", scope: !40, file: !7, line: 44, type: !8)
!44 = !DILocation(line: 44, column: 9, scope: !40)
!45 = !DILocation(line: 46, column: 10, scope: !40)
!46 = !DILocation(line: 47, column: 8, scope: !47)
!47 = distinct !DILexicalBlock(scope: !40, file: !7, line: 47, column: 8)
!48 = !DILocation(line: 47, column: 8, scope: !40)
!49 = !DILocation(line: 50, column: 16, scope: !50)
!50 = distinct !DILexicalBlock(scope: !47, file: !7, line: 48, column: 5)
!51 = !DILocation(line: 50, column: 9, scope: !50)
!52 = !DILocation(line: 51, column: 5, scope: !50)
!53 = !DILocation(line: 52, column: 8, scope: !54)
!54 = distinct !DILexicalBlock(scope: !40, file: !7, line: 52, column: 8)
!55 = !DILocation(line: 52, column: 8, scope: !40)
!56 = !DILocation(line: 55, column: 28, scope: !57)
!57 = distinct !DILexicalBlock(scope: !54, file: !7, line: 53, column: 5)
!58 = !DILocation(line: 55, column: 26, scope: !57)
!59 = !DILocation(line: 55, column: 9, scope: !57)
!60 = !DILocation(line: 56, column: 5, scope: !57)
!61 = !DILocation(line: 57, column: 1, scope: !40)
!62 = distinct !DISubprogram(name: "good10", scope: !7, file: !7, line: 61, type: !41, isLocal: false, isDefinition: true, scopeLine: 62, isOptimized: false, unit: !0, variables: !2)
!63 = !DILocalVariable(name: "data", scope: !62, file: !7, line: 63, type: !8)
!64 = !DILocation(line: 63, column: 9, scope: !62)
!65 = !DILocation(line: 65, column: 10, scope: !62)
!66 = !DILocation(line: 66, column: 8, scope: !67)
!67 = distinct !DILexicalBlock(scope: !62, file: !7, line: 66, column: 8)
!68 = !DILocation(line: 66, column: 8, scope: !62)
!69 = !DILocation(line: 69, column: 16, scope: !70)
!70 = distinct !DILexicalBlock(scope: !67, file: !7, line: 67, column: 5)
!71 = !DILocation(line: 69, column: 9, scope: !70)
!72 = !DILocation(line: 70, column: 5, scope: !70)
!73 = !DILocation(line: 71, column: 8, scope: !74)
!74 = distinct !DILexicalBlock(scope: !62, file: !7, line: 71, column: 8)
!75 = !DILocation(line: 71, column: 8, scope: !62)
!76 = !DILocation(line: 74, column: 9, scope: !77)
!77 = distinct !DILexicalBlock(scope: !74, file: !7, line: 72, column: 5)
!78 = !DILocation(line: 75, column: 5, scope: !77)
!79 = !DILocation(line: 79, column: 13, scope: !80)
!80 = distinct !DILexicalBlock(scope: !81, file: !7, line: 79, column: 13)
!81 = distinct !DILexicalBlock(scope: !74, file: !7, line: 77, column: 5)
!82 = !DILocation(line: 79, column: 18, scope: !80)
!83 = !DILocation(line: 79, column: 13, scope: !81)
!84 = !DILocation(line: 81, column: 32, scope: !85)
!85 = distinct !DILexicalBlock(scope: !80, file: !7, line: 80, column: 9)
!86 = !DILocation(line: 81, column: 30, scope: !85)
!87 = !DILocation(line: 81, column: 13, scope: !85)
!88 = !DILocation(line: 82, column: 9, scope: !85)
!89 = !DILocation(line: 85, column: 13, scope: !90)
!90 = distinct !DILexicalBlock(scope: !80, file: !7, line: 84, column: 9)
!91 = !DILocation(line: 88, column: 1, scope: !62)
!92 = distinct !DISubprogram(name: "main", scope: !7, file: !7, line: 91, type: !93, isLocal: false, isDefinition: true, scopeLine: 91, isOptimized: false, unit: !0, variables: !2)
!93 = !DISubroutineType(types: !94)
!94 = !{!8}
!95 = !DILocation(line: 92, column: 2, scope: !92)
!96 = !DILocation(line: 93, column: 5, scope: !92)
!97 = !DILocation(line: 94, column: 5, scope: !92)
