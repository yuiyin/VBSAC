; ModuleID = './369_7.c'
source_filename = "./369_7.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1
@.str.1 = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@staticFive = internal global i32 5, align 4
@stdin = external global %struct._IO_FILE*, align 8
@.str.2 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.3 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@.str.4 = private unnamed_addr constant [38 x i8] c"This would result in a divide by zero\00", align 1

; Function Attrs: nounwind uwtable
define void @printLine(i8* %line) #0 !dbg !12 {
entry:
  %line.addr = alloca i8*, align 8
  store i8* %line, i8** %line.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %line.addr, metadata !18, metadata !19), !dbg !20
  %0 = load i8*, i8** %line.addr, align 8, !dbg !21
  %cmp = icmp ne i8* %0, null, !dbg !23
  br i1 %cmp, label %if.then, label %if.end, !dbg !24

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** %line.addr, align 8, !dbg !25
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), i8* %1), !dbg !27
  br label %if.end, !dbg !28

if.end:                                           ; preds = %if.then, %entry
  ret void, !dbg !29
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @printf(i8*, ...) #2

; Function Attrs: nounwind uwtable
define void @printIntLine(i32 %intNumber) #0 !dbg !30 {
entry:
  %intNumber.addr = alloca i32, align 4
  store i32 %intNumber, i32* %intNumber.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %intNumber.addr, metadata !33, metadata !19), !dbg !34
  %0 = load i32, i32* %intNumber.addr, align 4, !dbg !35
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i32 0, i32 0), i32 %0), !dbg !36
  ret void, !dbg !37
}

; Function Attrs: nounwind uwtable
define void @bad7() #0 !dbg !38 {
entry:
  %data = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !41, metadata !19), !dbg !42
  store i32 -1, i32* %data, align 4, !dbg !43
  %0 = load i32, i32* @staticFive, align 4, !dbg !44
  %cmp = icmp eq i32 %0, 5, !dbg !46
  br i1 %cmp, label %if.then, label %if.end, !dbg !47

if.then:                                          ; preds = %entry
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !48
  %call = call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.2, i32 0, i32 0), i32* %data), !dbg !50
  br label %if.end, !dbg !51

if.end:                                           ; preds = %if.then, %entry
  %2 = load i32, i32* @staticFive, align 4, !dbg !52
  %cmp1 = icmp eq i32 %2, 5, !dbg !54
  br i1 %cmp1, label %if.then2, label %if.end3, !dbg !55

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
define void @good7() #0 !dbg !62 {
entry:
  %data = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !63, metadata !19), !dbg !64
  store i32 -1, i32* %data, align 4, !dbg !65
  %0 = load i32, i32* @staticFive, align 4, !dbg !66
  %cmp = icmp eq i32 %0, 5, !dbg !68
  br i1 %cmp, label %if.then, label %if.end, !dbg !69

if.then:                                          ; preds = %entry
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !70
  %call = call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.2, i32 0, i32 0), i32* %data), !dbg !72
  br label %if.end, !dbg !73

if.end:                                           ; preds = %if.then, %entry
  %2 = load i32, i32* @staticFive, align 4, !dbg !74
  %cmp1 = icmp ne i32 %2, 5, !dbg !76
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !77

if.then2:                                         ; preds = %if.end
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.3, i32 0, i32 0)), !dbg !78
  br label %if.end7, !dbg !80

if.else:                                          ; preds = %if.end
  %3 = load i32, i32* %data, align 4, !dbg !81
  %cmp3 = icmp ne i32 %3, 0, !dbg !84
  br i1 %cmp3, label %if.then4, label %if.else5, !dbg !85

if.then4:                                         ; preds = %if.else
  %4 = load i32, i32* %data, align 4, !dbg !86
  %div = sdiv i32 100, %4, !dbg !88
  call void @printIntLine(i32 %div), !dbg !89
  br label %if.end6, !dbg !90

if.else5:                                         ; preds = %if.else
  call void @printLine(i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.str.4, i32 0, i32 0)), !dbg !91
  br label %if.end6

if.end6:                                          ; preds = %if.else5, %if.then4
  br label %if.end7

if.end7:                                          ; preds = %if.end6, %if.then2
  ret void, !dbg !93
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !94 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @bad7(), !dbg !97
  call void @good7(), !dbg !98
  ret i32 1, !dbg !99
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!9, !10}
!llvm.ident = !{!11}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (tags/RELEASE_390/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, globals: !5)
!1 = !DIFile(filename: "369_7.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/369")
!2 = !{}
!3 = !{!4}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64, align: 64)
!5 = !{!6}
!6 = distinct !DIGlobalVariable(name: "staticFive", scope: !0, file: !7, line: 23, type: !8, isLocal: true, isDefinition: true, variable: i32* @staticFive)
!7 = !DIFile(filename: "./369_7.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/369")
!8 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!9 = !{i32 2, !"Dwarf Version", i32 4}
!10 = !{i32 2, !"Debug Info Version", i32 3}
!11 = !{!"clang version 3.9.0 (tags/RELEASE_390/final)"}
!12 = distinct !DISubprogram(name: "printLine", scope: !7, file: !7, line: 10, type: !13, isLocal: false, isDefinition: true, scopeLine: 11, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!13 = !DISubroutineType(types: !14)
!14 = !{null, !15}
!15 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64, align: 64)
!16 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !17)
!17 = !DIBasicType(name: "char", size: 8, align: 8, encoding: DW_ATE_signed_char)
!18 = !DILocalVariable(name: "line", arg: 1, scope: !12, file: !7, line: 10, type: !15)
!19 = !DIExpression()
!20 = !DILocation(line: 10, column: 30, scope: !12)
!21 = !DILocation(line: 12, column: 8, scope: !22)
!22 = distinct !DILexicalBlock(scope: !12, file: !7, line: 12, column: 8)
!23 = !DILocation(line: 12, column: 13, scope: !22)
!24 = !DILocation(line: 12, column: 8, scope: !12)
!25 = !DILocation(line: 14, column: 24, scope: !26)
!26 = distinct !DILexicalBlock(scope: !22, file: !7, line: 13, column: 5)
!27 = !DILocation(line: 14, column: 9, scope: !26)
!28 = !DILocation(line: 15, column: 5, scope: !26)
!29 = !DILocation(line: 16, column: 1, scope: !12)
!30 = distinct !DISubprogram(name: "printIntLine", scope: !7, file: !7, line: 18, type: !31, isLocal: false, isDefinition: true, scopeLine: 19, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!31 = !DISubroutineType(types: !32)
!32 = !{null, !8}
!33 = !DILocalVariable(name: "intNumber", arg: 1, scope: !30, file: !7, line: 18, type: !8)
!34 = !DILocation(line: 18, column: 24, scope: !30)
!35 = !DILocation(line: 20, column: 20, scope: !30)
!36 = !DILocation(line: 20, column: 5, scope: !30)
!37 = !DILocation(line: 21, column: 1, scope: !30)
!38 = distinct !DISubprogram(name: "bad7", scope: !7, file: !7, line: 27, type: !39, isLocal: false, isDefinition: true, scopeLine: 28, isOptimized: false, unit: !0, variables: !2)
!39 = !DISubroutineType(types: !40)
!40 = !{null}
!41 = !DILocalVariable(name: "data", scope: !38, file: !7, line: 29, type: !8)
!42 = !DILocation(line: 29, column: 9, scope: !38)
!43 = !DILocation(line: 31, column: 10, scope: !38)
!44 = !DILocation(line: 32, column: 8, scope: !45)
!45 = distinct !DILexicalBlock(scope: !38, file: !7, line: 32, column: 8)
!46 = !DILocation(line: 32, column: 18, scope: !45)
!47 = !DILocation(line: 32, column: 8, scope: !38)
!48 = !DILocation(line: 35, column: 16, scope: !49)
!49 = distinct !DILexicalBlock(scope: !45, file: !7, line: 33, column: 5)
!50 = !DILocation(line: 35, column: 9, scope: !49)
!51 = !DILocation(line: 36, column: 5, scope: !49)
!52 = !DILocation(line: 37, column: 8, scope: !53)
!53 = distinct !DILexicalBlock(scope: !38, file: !7, line: 37, column: 8)
!54 = !DILocation(line: 37, column: 18, scope: !53)
!55 = !DILocation(line: 37, column: 8, scope: !38)
!56 = !DILocation(line: 40, column: 28, scope: !57)
!57 = distinct !DILexicalBlock(scope: !53, file: !7, line: 38, column: 5)
!58 = !DILocation(line: 40, column: 26, scope: !57)
!59 = !DILocation(line: 40, column: 9, scope: !57)
!60 = !DILocation(line: 41, column: 5, scope: !57)
!61 = !DILocation(line: 42, column: 1, scope: !38)
!62 = distinct !DISubprogram(name: "good7", scope: !7, file: !7, line: 47, type: !39, isLocal: false, isDefinition: true, scopeLine: 48, isOptimized: false, unit: !0, variables: !2)
!63 = !DILocalVariable(name: "data", scope: !62, file: !7, line: 49, type: !8)
!64 = !DILocation(line: 49, column: 9, scope: !62)
!65 = !DILocation(line: 51, column: 10, scope: !62)
!66 = !DILocation(line: 52, column: 8, scope: !67)
!67 = distinct !DILexicalBlock(scope: !62, file: !7, line: 52, column: 8)
!68 = !DILocation(line: 52, column: 18, scope: !67)
!69 = !DILocation(line: 52, column: 8, scope: !62)
!70 = !DILocation(line: 55, column: 16, scope: !71)
!71 = distinct !DILexicalBlock(scope: !67, file: !7, line: 53, column: 5)
!72 = !DILocation(line: 55, column: 9, scope: !71)
!73 = !DILocation(line: 56, column: 5, scope: !71)
!74 = !DILocation(line: 57, column: 8, scope: !75)
!75 = distinct !DILexicalBlock(scope: !62, file: !7, line: 57, column: 8)
!76 = !DILocation(line: 57, column: 18, scope: !75)
!77 = !DILocation(line: 57, column: 8, scope: !62)
!78 = !DILocation(line: 60, column: 9, scope: !79)
!79 = distinct !DILexicalBlock(scope: !75, file: !7, line: 58, column: 5)
!80 = !DILocation(line: 61, column: 5, scope: !79)
!81 = !DILocation(line: 65, column: 13, scope: !82)
!82 = distinct !DILexicalBlock(scope: !83, file: !7, line: 65, column: 13)
!83 = distinct !DILexicalBlock(scope: !75, file: !7, line: 63, column: 5)
!84 = !DILocation(line: 65, column: 18, scope: !82)
!85 = !DILocation(line: 65, column: 13, scope: !83)
!86 = !DILocation(line: 67, column: 32, scope: !87)
!87 = distinct !DILexicalBlock(scope: !82, file: !7, line: 66, column: 9)
!88 = !DILocation(line: 67, column: 30, scope: !87)
!89 = !DILocation(line: 67, column: 13, scope: !87)
!90 = !DILocation(line: 68, column: 9, scope: !87)
!91 = !DILocation(line: 71, column: 13, scope: !92)
!92 = distinct !DILexicalBlock(scope: !82, file: !7, line: 70, column: 9)
!93 = !DILocation(line: 74, column: 1, scope: !62)
!94 = distinct !DISubprogram(name: "main", scope: !7, file: !7, line: 77, type: !95, isLocal: false, isDefinition: true, scopeLine: 77, isOptimized: false, unit: !0, variables: !2)
!95 = !DISubroutineType(types: !96)
!96 = !{!8}
!97 = !DILocation(line: 78, column: 2, scope: !94)
!98 = !DILocation(line: 79, column: 2, scope: !94)
!99 = !DILocation(line: 80, column: 5, scope: !94)
