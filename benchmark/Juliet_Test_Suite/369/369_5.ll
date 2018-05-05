; ModuleID = './369_5.c'
source_filename = "./369_5.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1
@.str.1 = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@staticTrue = internal global i32 1, align 4
@stdin = external global %struct._IO_FILE*, align 8
@.str.2 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@staticFalse = internal global i32 0, align 4
@.str.3 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

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
define void @bad5() #0 !dbg !39 {
entry:
  %data = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !42, metadata !20), !dbg !43
  store i32 -1, i32* %data, align 4, !dbg !44
  %0 = load i32, i32* @staticTrue, align 4, !dbg !45
  %tobool = icmp ne i32 %0, 0, !dbg !45
  br i1 %tobool, label %if.then, label %if.end, !dbg !47

if.then:                                          ; preds = %entry
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !48
  %call = call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.2, i32 0, i32 0), i32* %data), !dbg !50
  br label %if.end, !dbg !51

if.end:                                           ; preds = %if.then, %entry
  %2 = load i32, i32* @staticTrue, align 4, !dbg !52
  %tobool1 = icmp ne i32 %2, 0, !dbg !52
  br i1 %tobool1, label %if.then2, label %if.end3, !dbg !54

if.then2:                                         ; preds = %if.end
  %3 = load i32, i32* %data, align 4, !dbg !55
  %div = sdiv i32 100, %3, !dbg !57
  call void @printIntLine(i32 %div), !dbg !58
  br label %if.end3, !dbg !59

if.end3:                                          ; preds = %if.then2, %if.end
  ret void, !dbg !60
}

declare i32 @__isoc99_fscanf(%struct._IO_FILE*, i8*, ...) #2

; Function Attrs: nounwind uwtable
define void @good5() #0 !dbg !61 {
entry:
  call void @goodG2B(), !dbg !62
  ret void, !dbg !63
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !64 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @bad5(), !dbg !67
  call void @good5(), !dbg !68
  ret i32 1, !dbg !69
}

; Function Attrs: nounwind uwtable
define internal void @goodG2B() #0 !dbg !70 {
entry:
  %data = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !71, metadata !20), !dbg !72
  store i32 -1, i32* %data, align 4, !dbg !73
  %0 = load i32, i32* @staticFalse, align 4, !dbg !74
  %tobool = icmp ne i32 %0, 0, !dbg !74
  br i1 %tobool, label %if.then, label %if.else, !dbg !76

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.3, i32 0, i32 0)), !dbg !77
  br label %if.end, !dbg !79

if.else:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !80
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %1 = load i32, i32* @staticTrue, align 4, !dbg !82
  %tobool1 = icmp ne i32 %1, 0, !dbg !82
  br i1 %tobool1, label %if.then2, label %if.end3, !dbg !84

if.then2:                                         ; preds = %if.end
  %2 = load i32, i32* %data, align 4, !dbg !85
  %div = sdiv i32 100, %2, !dbg !87
  call void @printIntLine(i32 %div), !dbg !88
  br label %if.end3, !dbg !89

if.end3:                                          ; preds = %if.then2, %if.end
  ret void, !dbg !90
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (tags/RELEASE_390/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, globals: !5)
!1 = !DIFile(filename: "369_5.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/369")
!2 = !{}
!3 = !{!4}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64, align: 64)
!5 = !{!6, !9}
!6 = distinct !DIGlobalVariable(name: "staticTrue", scope: !0, file: !7, line: 23, type: !8, isLocal: true, isDefinition: true, variable: i32* @staticTrue)
!7 = !DIFile(filename: "./369_5.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/369")
!8 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!9 = distinct !DIGlobalVariable(name: "staticFalse", scope: !0, file: !7, line: 24, type: !8, isLocal: true, isDefinition: true, variable: i32* @staticFalse)
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
!39 = distinct !DISubprogram(name: "bad5", scope: !7, file: !7, line: 28, type: !40, isLocal: false, isDefinition: true, scopeLine: 29, isOptimized: false, unit: !0, variables: !2)
!40 = !DISubroutineType(types: !41)
!41 = !{null}
!42 = !DILocalVariable(name: "data", scope: !39, file: !7, line: 30, type: !8)
!43 = !DILocation(line: 30, column: 9, scope: !39)
!44 = !DILocation(line: 32, column: 10, scope: !39)
!45 = !DILocation(line: 33, column: 8, scope: !46)
!46 = distinct !DILexicalBlock(scope: !39, file: !7, line: 33, column: 8)
!47 = !DILocation(line: 33, column: 8, scope: !39)
!48 = !DILocation(line: 36, column: 16, scope: !49)
!49 = distinct !DILexicalBlock(scope: !46, file: !7, line: 34, column: 5)
!50 = !DILocation(line: 36, column: 9, scope: !49)
!51 = !DILocation(line: 37, column: 5, scope: !49)
!52 = !DILocation(line: 38, column: 8, scope: !53)
!53 = distinct !DILexicalBlock(scope: !39, file: !7, line: 38, column: 8)
!54 = !DILocation(line: 38, column: 8, scope: !39)
!55 = !DILocation(line: 41, column: 28, scope: !56)
!56 = distinct !DILexicalBlock(scope: !53, file: !7, line: 39, column: 5)
!57 = !DILocation(line: 41, column: 26, scope: !56)
!58 = !DILocation(line: 41, column: 9, scope: !56)
!59 = !DILocation(line: 42, column: 5, scope: !56)
!60 = !DILocation(line: 43, column: 1, scope: !39)
!61 = distinct !DISubprogram(name: "good5", scope: !7, file: !7, line: 73, type: !40, isLocal: false, isDefinition: true, scopeLine: 74, isOptimized: false, unit: !0, variables: !2)
!62 = !DILocation(line: 76, column: 5, scope: !61)
!63 = !DILocation(line: 77, column: 1, scope: !61)
!64 = distinct !DISubprogram(name: "main", scope: !7, file: !7, line: 81, type: !65, isLocal: false, isDefinition: true, scopeLine: 81, isOptimized: false, unit: !0, variables: !2)
!65 = !DISubroutineType(types: !66)
!66 = !{!8}
!67 = !DILocation(line: 82, column: 2, scope: !64)
!68 = !DILocation(line: 83, column: 2, scope: !64)
!69 = !DILocation(line: 84, column: 5, scope: !64)
!70 = distinct !DISubprogram(name: "goodG2B", scope: !7, file: !7, line: 51, type: !40, isLocal: true, isDefinition: true, scopeLine: 52, isOptimized: false, unit: !0, variables: !2)
!71 = !DILocalVariable(name: "data", scope: !70, file: !7, line: 53, type: !8)
!72 = !DILocation(line: 53, column: 8, scope: !70)
!73 = !DILocation(line: 55, column: 10, scope: !70)
!74 = !DILocation(line: 56, column: 8, scope: !75)
!75 = distinct !DILexicalBlock(scope: !70, file: !7, line: 56, column: 8)
!76 = !DILocation(line: 56, column: 8, scope: !70)
!77 = !DILocation(line: 59, column: 9, scope: !78)
!78 = distinct !DILexicalBlock(scope: !75, file: !7, line: 57, column: 5)
!79 = !DILocation(line: 60, column: 5, scope: !78)
!80 = !DILocation(line: 64, column: 14, scope: !81)
!81 = distinct !DILexicalBlock(scope: !75, file: !7, line: 62, column: 5)
!82 = !DILocation(line: 66, column: 8, scope: !83)
!83 = distinct !DILexicalBlock(scope: !70, file: !7, line: 66, column: 8)
!84 = !DILocation(line: 66, column: 8, scope: !70)
!85 = !DILocation(line: 69, column: 28, scope: !86)
!86 = distinct !DILexicalBlock(scope: !83, file: !7, line: 67, column: 5)
!87 = !DILocation(line: 69, column: 26, scope: !86)
!88 = !DILocation(line: 69, column: 9, scope: !86)
!89 = !DILocation(line: 70, column: 5, scope: !86)
!90 = !DILocation(line: 71, column: 1, scope: !70)
