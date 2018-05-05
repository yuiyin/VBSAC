; ModuleID = './369_23.c'
source_filename = "./369_23.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1
@.str.1 = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@stdin = external global %struct._IO_FILE*, align 8
@.str.2 = private unnamed_addr constant [3 x i8] c"%d\00", align 1

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
define void @bad23() #0 !dbg !36 {
entry:
  %data = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !39, metadata !16), !dbg !40
  store i32 -1, i32* %data, align 4, !dbg !41
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !42
  %call = call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* %0, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.2, i32 0, i32 0), i32* %data), !dbg !43
  %1 = load i32, i32* %data, align 4, !dbg !44
  call void @badSink(i32 %1), !dbg !45
  ret void, !dbg !46
}

declare i32 @__isoc99_fscanf(%struct._IO_FILE*, i8*, ...) #2

; Function Attrs: nounwind uwtable
define internal void @badSink(i32 %data) #0 !dbg !47 {
entry:
  %data.addr = alloca i32, align 4
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !48, metadata !16), !dbg !49
  %0 = load i32, i32* %data.addr, align 4, !dbg !50
  %div = sdiv i32 100, %0, !dbg !51
  call void @printIntLine(i32 %div), !dbg !52
  ret void, !dbg !53
}

; Function Attrs: nounwind uwtable
define void @good23() #0 !dbg !54 {
entry:
  %data = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !55, metadata !16), !dbg !56
  store i32 -1, i32* %data, align 4, !dbg !57
  store i32 7, i32* %data, align 4, !dbg !58
  %0 = load i32, i32* %data, align 4, !dbg !59
  call void @goodG2BSink(i32 %0), !dbg !60
  ret void, !dbg !61
}

; Function Attrs: nounwind uwtable
define internal void @goodG2BSink(i32 %data) #0 !dbg !62 {
entry:
  %data.addr = alloca i32, align 4
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !63, metadata !16), !dbg !64
  %0 = load i32, i32* %data.addr, align 4, !dbg !65
  %div = sdiv i32 100, %0, !dbg !66
  call void @printIntLine(i32 %div), !dbg !67
  ret void, !dbg !68
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !69 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @good23(), !dbg !72
  call void @bad23(), !dbg !73
  ret i32 1, !dbg !74
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6}
!llvm.ident = !{!7}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (tags/RELEASE_390/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3)
!1 = !DIFile(filename: "369_23.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/369")
!2 = !{}
!3 = !{!4}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64, align: 64)
!5 = !{i32 2, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{!"clang version 3.9.0 (tags/RELEASE_390/final)"}
!8 = distinct !DISubprogram(name: "printLine", scope: !9, file: !9, line: 10, type: !10, isLocal: false, isDefinition: true, scopeLine: 11, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!9 = !DIFile(filename: "./369_23.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/369")
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
!36 = distinct !DISubprogram(name: "bad23", scope: !9, file: !9, line: 29, type: !37, isLocal: false, isDefinition: true, scopeLine: 30, isOptimized: false, unit: !0, variables: !2)
!37 = !DISubroutineType(types: !38)
!38 = !{null}
!39 = !DILocalVariable(name: "data", scope: !36, file: !9, line: 31, type: !30)
!40 = !DILocation(line: 31, column: 9, scope: !36)
!41 = !DILocation(line: 33, column: 10, scope: !36)
!42 = !DILocation(line: 35, column: 12, scope: !36)
!43 = !DILocation(line: 35, column: 5, scope: !36)
!44 = !DILocation(line: 36, column: 13, scope: !36)
!45 = !DILocation(line: 36, column: 5, scope: !36)
!46 = !DILocation(line: 37, column: 1, scope: !36)
!47 = distinct !DISubprogram(name: "badSink", scope: !9, file: !9, line: 24, type: !28, isLocal: true, isDefinition: true, scopeLine: 25, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!48 = !DILocalVariable(name: "data", arg: 1, scope: !47, file: !9, line: 24, type: !30)
!49 = !DILocation(line: 24, column: 25, scope: !47)
!50 = !DILocation(line: 27, column: 24, scope: !47)
!51 = !DILocation(line: 27, column: 22, scope: !47)
!52 = !DILocation(line: 27, column: 5, scope: !47)
!53 = !DILocation(line: 28, column: 1, scope: !47)
!54 = distinct !DISubprogram(name: "good23", scope: !9, file: !9, line: 47, type: !37, isLocal: false, isDefinition: true, scopeLine: 48, isOptimized: false, unit: !0, variables: !2)
!55 = !DILocalVariable(name: "data", scope: !54, file: !9, line: 49, type: !30)
!56 = !DILocation(line: 49, column: 9, scope: !54)
!57 = !DILocation(line: 51, column: 10, scope: !54)
!58 = !DILocation(line: 53, column: 10, scope: !54)
!59 = !DILocation(line: 54, column: 17, scope: !54)
!60 = !DILocation(line: 54, column: 5, scope: !54)
!61 = !DILocation(line: 55, column: 1, scope: !54)
!62 = distinct !DISubprogram(name: "goodG2BSink", scope: !9, file: !9, line: 42, type: !28, isLocal: true, isDefinition: true, scopeLine: 43, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!63 = !DILocalVariable(name: "data", arg: 1, scope: !62, file: !9, line: 42, type: !30)
!64 = !DILocation(line: 42, column: 29, scope: !62)
!65 = !DILocation(line: 45, column: 24, scope: !62)
!66 = !DILocation(line: 45, column: 22, scope: !62)
!67 = !DILocation(line: 45, column: 5, scope: !62)
!68 = !DILocation(line: 46, column: 1, scope: !62)
!69 = distinct !DISubprogram(name: "main", scope: !9, file: !9, line: 59, type: !70, isLocal: false, isDefinition: true, scopeLine: 59, isOptimized: false, unit: !0, variables: !2)
!70 = !DISubroutineType(types: !71)
!71 = !{!30}
!72 = !DILocation(line: 60, column: 2, scope: !69)
!73 = !DILocation(line: 61, column: 5, scope: !69)
!74 = !DILocation(line: 62, column: 5, scope: !69)
