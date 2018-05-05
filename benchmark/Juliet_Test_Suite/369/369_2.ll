; ModuleID = './369_2.c'
source_filename = "./369_2.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1
@.str.1 = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@stdin = external global %struct._IO_FILE*, align 8
@.str.2 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.3 = private unnamed_addr constant [38 x i8] c"This would result in a divide by zero\00", align 1

; Function Attrs: nounwind uwtable
define void @printLine(i8* %line) #0 !dbg !8 {
entry:
  %line.addr = alloca i8*, align 8
  store i8* %line, i8** %line.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %line.addr, metadata !15, metadata !16), !dbg !17
  %0 = load i8*, i8** %line.addr, align 8, !dbg !18
  %cmp = icmp ne i8* %0, null, !dbg !20
  br i1 %cmp, label %if.then, label %if.end, !dbg !21

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** %line.addr, align 8, !dbg !22
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), i8* %1), !dbg !24
  br label %if.end, !dbg !25

if.end:                                           ; preds = %if.then, %entry
  ret void, !dbg !26
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @printf(i8*, ...) #2

; Function Attrs: nounwind uwtable
define void @printIntLine(i32 %intNumber) #0 !dbg !27 {
entry:
  %intNumber.addr = alloca i32, align 4
  store i32 %intNumber, i32* %intNumber.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %intNumber.addr, metadata !31, metadata !16), !dbg !32
  %0 = load i32, i32* %intNumber.addr, align 4, !dbg !33
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i32 0, i32 0), i32 %0), !dbg !34
  ret void, !dbg !35
}

; Function Attrs: nounwind uwtable
define void @bad2() #0 !dbg !36 {
entry:
  %data = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !39, metadata !16), !dbg !40
  store i32 -1, i32* %data, align 4, !dbg !41
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !42
  %call = call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* %0, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.2, i32 0, i32 0), i32* %data), !dbg !45
  %1 = load i32, i32* %data, align 4, !dbg !46
  %div = sdiv i32 100, %1, !dbg !49
  call void @printIntLine(i32 %div), !dbg !50
  ret void, !dbg !51
}

declare i32 @__isoc99_fscanf(%struct._IO_FILE*, i8*, ...) #2

; Function Attrs: nounwind uwtable
define void @good2() #0 !dbg !52 {
entry:
  %data = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !53, metadata !16), !dbg !54
  store i32 -1, i32* %data, align 4, !dbg !55
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !56
  %call = call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* %0, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.2, i32 0, i32 0), i32* %data), !dbg !59
  %1 = load i32, i32* %data, align 4, !dbg !60
  %cmp = icmp ne i32 %1, 0, !dbg !64
  br i1 %cmp, label %if.then, label %if.else, !dbg !65

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %data, align 4, !dbg !66
  %div = sdiv i32 100, %2, !dbg !68
  call void @printIntLine(i32 %div), !dbg !69
  br label %if.end, !dbg !70

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.str.3, i32 0, i32 0)), !dbg !71
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !73
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !74 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @good2(), !dbg !77
  call void @bad2(), !dbg !78
  ret i32 1, !dbg !79
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6}
!llvm.ident = !{!7}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (tags/RELEASE_390/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3)
!1 = !DIFile(filename: "369_2.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/369")
!2 = !{}
!3 = !{!4}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64, align: 64)
!5 = !{i32 2, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{!"clang version 3.9.0 (tags/RELEASE_390/final)"}
!8 = distinct !DISubprogram(name: "printLine", scope: !9, file: !9, line: 10, type: !10, isLocal: false, isDefinition: true, scopeLine: 11, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!9 = !DIFile(filename: "./369_2.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/369")
!10 = !DISubroutineType(types: !11)
!11 = !{null, !12}
!12 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !13, size: 64, align: 64)
!13 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !14)
!14 = !DIBasicType(name: "char", size: 8, align: 8, encoding: DW_ATE_signed_char)
!15 = !DILocalVariable(name: "line", arg: 1, scope: !8, file: !9, line: 10, type: !12)
!16 = !DIExpression()
!17 = !DILocation(line: 10, column: 30, scope: !8)
!18 = !DILocation(line: 12, column: 8, scope: !19)
!19 = distinct !DILexicalBlock(scope: !8, file: !9, line: 12, column: 8)
!20 = !DILocation(line: 12, column: 13, scope: !19)
!21 = !DILocation(line: 12, column: 8, scope: !8)
!22 = !DILocation(line: 14, column: 24, scope: !23)
!23 = distinct !DILexicalBlock(scope: !19, file: !9, line: 13, column: 5)
!24 = !DILocation(line: 14, column: 9, scope: !23)
!25 = !DILocation(line: 15, column: 5, scope: !23)
!26 = !DILocation(line: 16, column: 1, scope: !8)
!27 = distinct !DISubprogram(name: "printIntLine", scope: !9, file: !9, line: 18, type: !28, isLocal: false, isDefinition: true, scopeLine: 19, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!28 = !DISubroutineType(types: !29)
!29 = !{null, !30}
!30 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!31 = !DILocalVariable(name: "intNumber", arg: 1, scope: !27, file: !9, line: 18, type: !30)
!32 = !DILocation(line: 18, column: 24, scope: !27)
!33 = !DILocation(line: 20, column: 20, scope: !27)
!34 = !DILocation(line: 20, column: 5, scope: !27)
!35 = !DILocation(line: 21, column: 1, scope: !27)
!36 = distinct !DISubprogram(name: "bad2", scope: !9, file: !9, line: 23, type: !37, isLocal: false, isDefinition: true, scopeLine: 24, isOptimized: false, unit: !0, variables: !2)
!37 = !DISubroutineType(types: !38)
!38 = !{null}
!39 = !DILocalVariable(name: "data", scope: !36, file: !9, line: 25, type: !30)
!40 = !DILocation(line: 25, column: 9, scope: !36)
!41 = !DILocation(line: 27, column: 10, scope: !36)
!42 = !DILocation(line: 31, column: 16, scope: !43)
!43 = distinct !DILexicalBlock(scope: !44, file: !9, line: 29, column: 5)
!44 = distinct !DILexicalBlock(scope: !36, file: !9, line: 28, column: 8)
!45 = !DILocation(line: 31, column: 9, scope: !43)
!46 = !DILocation(line: 36, column: 28, scope: !47)
!47 = distinct !DILexicalBlock(scope: !48, file: !9, line: 34, column: 5)
!48 = distinct !DILexicalBlock(scope: !36, file: !9, line: 33, column: 8)
!49 = !DILocation(line: 36, column: 26, scope: !47)
!50 = !DILocation(line: 36, column: 9, scope: !47)
!51 = !DILocation(line: 38, column: 1, scope: !36)
!52 = distinct !DISubprogram(name: "good2", scope: !9, file: !9, line: 40, type: !37, isLocal: false, isDefinition: true, scopeLine: 41, isOptimized: false, unit: !0, variables: !2)
!53 = !DILocalVariable(name: "data", scope: !52, file: !9, line: 42, type: !30)
!54 = !DILocation(line: 42, column: 9, scope: !52)
!55 = !DILocation(line: 44, column: 10, scope: !52)
!56 = !DILocation(line: 48, column: 16, scope: !57)
!57 = distinct !DILexicalBlock(scope: !58, file: !9, line: 46, column: 5)
!58 = distinct !DILexicalBlock(scope: !52, file: !9, line: 45, column: 8)
!59 = !DILocation(line: 48, column: 9, scope: !57)
!60 = !DILocation(line: 58, column: 13, scope: !61)
!61 = distinct !DILexicalBlock(scope: !62, file: !9, line: 58, column: 13)
!62 = distinct !DILexicalBlock(scope: !63, file: !9, line: 56, column: 5)
!63 = distinct !DILexicalBlock(scope: !52, file: !9, line: 50, column: 8)
!64 = !DILocation(line: 58, column: 18, scope: !61)
!65 = !DILocation(line: 58, column: 13, scope: !62)
!66 = !DILocation(line: 60, column: 32, scope: !67)
!67 = distinct !DILexicalBlock(scope: !61, file: !9, line: 59, column: 9)
!68 = !DILocation(line: 60, column: 30, scope: !67)
!69 = !DILocation(line: 60, column: 13, scope: !67)
!70 = !DILocation(line: 61, column: 9, scope: !67)
!71 = !DILocation(line: 64, column: 13, scope: !72)
!72 = distinct !DILexicalBlock(scope: !61, file: !9, line: 63, column: 9)
!73 = !DILocation(line: 67, column: 1, scope: !52)
!74 = distinct !DISubprogram(name: "main", scope: !9, file: !9, line: 69, type: !75, isLocal: false, isDefinition: true, scopeLine: 69, isOptimized: false, unit: !0, variables: !2)
!75 = !DISubroutineType(types: !76)
!76 = !{!30}
!77 = !DILocation(line: 70, column: 2, scope: !74)
!78 = !DILocation(line: 71, column: 5, scope: !74)
!79 = !DILocation(line: 72, column: 5, scope: !74)
