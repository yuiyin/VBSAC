; ModuleID = './369_50.c'
source_filename = "./369_50.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1
@.str.1 = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@stdin = external global %struct._IO_FILE*, align 8
@.str.2 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@CWE369_Divide_by_Zero__int_fscanf_divide_45_badData = internal global i32 0, align 4
@CWE369_Divide_by_Zero__int_fscanf_divide_45_goodG2BData = internal global i32 0, align 4

; Function Attrs: nounwind uwtable
define void @printLine(i8* %line) #0 !dbg !13 {
entry:
  %line.addr = alloca i8*, align 8
  store i8* %line, i8** %line.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %line.addr, metadata !19, metadata !20), !dbg !21
  %0 = load i8*, i8** %line.addr, align 8, !dbg !22
  %cmp = icmp ne i8* %0, null, !dbg !24
  br i1 %cmp, label %if.then, label %if.end, !dbg !25

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** %line.addr, align 8, !dbg !26
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), i8* %1), !dbg !28
  br label %if.end, !dbg !29

if.end:                                           ; preds = %if.then, %entry
  ret void, !dbg !30
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @printf(i8*, ...) #2

; Function Attrs: nounwind uwtable
define void @printIntLine(i32 %intNumber) #0 !dbg !31 {
entry:
  %intNumber.addr = alloca i32, align 4
  store i32 %intNumber, i32* %intNumber.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %intNumber.addr, metadata !34, metadata !20), !dbg !35
  %0 = load i32, i32* %intNumber.addr, align 4, !dbg !36
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i32 0, i32 0), i32 %0), !dbg !37
  ret void, !dbg !38
}

; Function Attrs: nounwind uwtable
define void @bad50() #0 !dbg !39 {
entry:
  %data = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !42, metadata !20), !dbg !43
  store i32 -1, i32* %data, align 4, !dbg !44
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !45
  %call = call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* %0, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.2, i32 0, i32 0), i32* %data), !dbg !46
  %1 = load i32, i32* %data, align 4, !dbg !47
  store i32 %1, i32* @CWE369_Divide_by_Zero__int_fscanf_divide_45_badData, align 4, !dbg !48
  call void @badSink(), !dbg !49
  ret void, !dbg !50
}

declare i32 @__isoc99_fscanf(%struct._IO_FILE*, i8*, ...) #2

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !51 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @good50(), !dbg !54
  call void @bad50(), !dbg !55
  ret i32 1, !dbg !56
}

; Function Attrs: nounwind uwtable
define internal void @badSink() #0 !dbg !57 {
entry:
  %data = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !58, metadata !20), !dbg !59
  %0 = load i32, i32* @CWE369_Divide_by_Zero__int_fscanf_divide_45_badData, align 4, !dbg !60
  store i32 %0, i32* %data, align 4, !dbg !59
  %1 = load i32, i32* %data, align 4, !dbg !61
  %rem = srem i32 100, %1, !dbg !62
  call void @printIntLine(i32 %rem), !dbg !63
  ret void, !dbg !64
}

; Function Attrs: nounwind uwtable
define internal void @good50() #0 !dbg !65 {
entry:
  %data = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !66, metadata !20), !dbg !67
  store i32 -1, i32* %data, align 4, !dbg !68
  store i32 7, i32* %data, align 4, !dbg !69
  %0 = load i32, i32* %data, align 4, !dbg !70
  store i32 %0, i32* @CWE369_Divide_by_Zero__int_fscanf_divide_45_goodG2BData, align 4, !dbg !71
  call void @goodG2BSink(), !dbg !72
  ret void, !dbg !73
}

; Function Attrs: nounwind uwtable
define internal void @goodG2BSink() #0 !dbg !74 {
entry:
  %data = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !75, metadata !20), !dbg !76
  %0 = load i32, i32* @CWE369_Divide_by_Zero__int_fscanf_divide_45_goodG2BData, align 4, !dbg !77
  store i32 %0, i32* %data, align 4, !dbg !76
  %1 = load i32, i32* %data, align 4, !dbg !78
  %rem = srem i32 100, %1, !dbg !79
  call void @printIntLine(i32 %rem), !dbg !80
  ret void, !dbg !81
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (tags/RELEASE_390/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, globals: !5)
!1 = !DIFile(filename: "369_50.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/369")
!2 = !{}
!3 = !{!4}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64, align: 64)
!5 = !{!6, !9}
!6 = distinct !DIGlobalVariable(name: "CWE369_Divide_by_Zero__int_fscanf_divide_45_badData", scope: !0, file: !7, line: 23, type: !8, isLocal: true, isDefinition: true, variable: i32* @CWE369_Divide_by_Zero__int_fscanf_divide_45_badData)
!7 = !DIFile(filename: "./369_50.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/369")
!8 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!9 = distinct !DIGlobalVariable(name: "CWE369_Divide_by_Zero__int_fscanf_divide_45_goodG2BData", scope: !0, file: !7, line: 24, type: !8, isLocal: true, isDefinition: true, variable: i32* @CWE369_Divide_by_Zero__int_fscanf_divide_45_goodG2BData)
!10 = !{i32 2, !"Dwarf Version", i32 4}
!11 = !{i32 2, !"Debug Info Version", i32 3}
!12 = !{!"clang version 3.9.0 (tags/RELEASE_390/final)"}
!13 = distinct !DISubprogram(name: "printLine", scope: !7, file: !7, line: 10, type: !14, isLocal: false, isDefinition: true, scopeLine: 11, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!14 = !DISubroutineType(types: !15)
!15 = !{null, !16}
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64, align: 64)
!17 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !18)
!18 = !DIBasicType(name: "char", size: 8, align: 8, encoding: DW_ATE_signed_char)
!19 = !DILocalVariable(name: "line", arg: 1, scope: !13, file: !7, line: 10, type: !16)
!20 = !DIExpression()
!21 = !DILocation(line: 10, column: 30, scope: !13)
!22 = !DILocation(line: 12, column: 8, scope: !23)
!23 = distinct !DILexicalBlock(scope: !13, file: !7, line: 12, column: 8)
!24 = !DILocation(line: 12, column: 13, scope: !23)
!25 = !DILocation(line: 12, column: 8, scope: !13)
!26 = !DILocation(line: 14, column: 24, scope: !27)
!27 = distinct !DILexicalBlock(scope: !23, file: !7, line: 13, column: 5)
!28 = !DILocation(line: 14, column: 9, scope: !27)
!29 = !DILocation(line: 15, column: 5, scope: !27)
!30 = !DILocation(line: 16, column: 1, scope: !13)
!31 = distinct !DISubprogram(name: "printIntLine", scope: !7, file: !7, line: 18, type: !32, isLocal: false, isDefinition: true, scopeLine: 19, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!32 = !DISubroutineType(types: !33)
!33 = !{null, !8}
!34 = !DILocalVariable(name: "intNumber", arg: 1, scope: !31, file: !7, line: 18, type: !8)
!35 = !DILocation(line: 18, column: 24, scope: !31)
!36 = !DILocation(line: 20, column: 20, scope: !31)
!37 = !DILocation(line: 20, column: 5, scope: !31)
!38 = !DILocation(line: 21, column: 1, scope: !31)
!39 = distinct !DISubprogram(name: "bad50", scope: !7, file: !7, line: 36, type: !40, isLocal: false, isDefinition: true, scopeLine: 37, isOptimized: false, unit: !0, variables: !2)
!40 = !DISubroutineType(types: !41)
!41 = !{null}
!42 = !DILocalVariable(name: "data", scope: !39, file: !7, line: 38, type: !8)
!43 = !DILocation(line: 38, column: 9, scope: !39)
!44 = !DILocation(line: 40, column: 10, scope: !39)
!45 = !DILocation(line: 42, column: 12, scope: !39)
!46 = !DILocation(line: 42, column: 5, scope: !39)
!47 = !DILocation(line: 43, column: 59, scope: !39)
!48 = !DILocation(line: 43, column: 57, scope: !39)
!49 = !DILocation(line: 44, column: 5, scope: !39)
!50 = !DILocation(line: 45, column: 1, scope: !39)
!51 = distinct !DISubprogram(name: "main", scope: !7, file: !7, line: 70, type: !52, isLocal: false, isDefinition: true, scopeLine: 70, isOptimized: false, unit: !0, variables: !2)
!52 = !DISubroutineType(types: !53)
!53 = !{!8}
!54 = !DILocation(line: 71, column: 5, scope: !51)
!55 = !DILocation(line: 72, column: 5, scope: !51)
!56 = !DILocation(line: 73, column: 5, scope: !51)
!57 = distinct !DISubprogram(name: "badSink", scope: !7, file: !7, line: 29, type: !40, isLocal: true, isDefinition: true, scopeLine: 30, isOptimized: false, unit: !0, variables: !2)
!58 = !DILocalVariable(name: "data", scope: !57, file: !7, line: 31, type: !8)
!59 = !DILocation(line: 31, column: 9, scope: !57)
!60 = !DILocation(line: 31, column: 16, scope: !57)
!61 = !DILocation(line: 33, column: 24, scope: !57)
!62 = !DILocation(line: 33, column: 22, scope: !57)
!63 = !DILocation(line: 33, column: 5, scope: !57)
!64 = !DILocation(line: 34, column: 1, scope: !57)
!65 = distinct !DISubprogram(name: "good50", scope: !7, file: !7, line: 57, type: !40, isLocal: true, isDefinition: true, scopeLine: 58, isOptimized: false, unit: !0, variables: !2)
!66 = !DILocalVariable(name: "data", scope: !65, file: !7, line: 59, type: !8)
!67 = !DILocation(line: 59, column: 9, scope: !65)
!68 = !DILocation(line: 61, column: 10, scope: !65)
!69 = !DILocation(line: 63, column: 10, scope: !65)
!70 = !DILocation(line: 64, column: 63, scope: !65)
!71 = !DILocation(line: 64, column: 61, scope: !65)
!72 = !DILocation(line: 65, column: 5, scope: !65)
!73 = !DILocation(line: 66, column: 1, scope: !65)
!74 = distinct !DISubprogram(name: "goodG2BSink", scope: !7, file: !7, line: 50, type: !40, isLocal: true, isDefinition: true, scopeLine: 51, isOptimized: false, unit: !0, variables: !2)
!75 = !DILocalVariable(name: "data", scope: !74, file: !7, line: 52, type: !8)
!76 = !DILocation(line: 52, column: 9, scope: !74)
!77 = !DILocation(line: 52, column: 16, scope: !74)
!78 = !DILocation(line: 54, column: 24, scope: !74)
!79 = !DILocation(line: 54, column: 22, scope: !74)
!80 = !DILocation(line: 54, column: 5, scope: !74)
!81 = !DILocation(line: 55, column: 1, scope: !74)
