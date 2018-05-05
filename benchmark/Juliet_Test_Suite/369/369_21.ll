; ModuleID = './369_21.c'
source_filename = "./369_21.c"
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
define void @bad21() #0 !dbg !36 {
entry:
  %data = alloca i32, align 4
  %dataPtr1 = alloca i32*, align 8
  %dataPtr2 = alloca i32*, align 8
  %data1 = alloca i32, align 4
  %data2 = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !39, metadata !16), !dbg !40
  call void @llvm.dbg.declare(metadata i32** %dataPtr1, metadata !41, metadata !16), !dbg !43
  store i32* %data, i32** %dataPtr1, align 8, !dbg !43
  call void @llvm.dbg.declare(metadata i32** %dataPtr2, metadata !44, metadata !16), !dbg !45
  store i32* %data, i32** %dataPtr2, align 8, !dbg !45
  store i32 -1, i32* %data, align 4, !dbg !46
  call void @llvm.dbg.declare(metadata i32* %data1, metadata !47, metadata !16), !dbg !49
  %0 = load i32*, i32** %dataPtr1, align 8, !dbg !50
  %1 = load i32, i32* %0, align 4, !dbg !51
  store i32 %1, i32* %data1, align 4, !dbg !49
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !52
  %call = call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.2, i32 0, i32 0), i32* %data1), !dbg !53
  %3 = load i32, i32* %data1, align 4, !dbg !54
  %4 = load i32*, i32** %dataPtr1, align 8, !dbg !55
  store i32 %3, i32* %4, align 4, !dbg !56
  call void @llvm.dbg.declare(metadata i32* %data2, metadata !57, metadata !16), !dbg !59
  %5 = load i32*, i32** %dataPtr2, align 8, !dbg !60
  %6 = load i32, i32* %5, align 4, !dbg !61
  store i32 %6, i32* %data2, align 4, !dbg !59
  %7 = load i32, i32* %data2, align 4, !dbg !62
  %div = sdiv i32 100, %7, !dbg !63
  call void @printIntLine(i32 %div), !dbg !64
  ret void, !dbg !65
}

declare i32 @__isoc99_fscanf(%struct._IO_FILE*, i8*, ...) #2

; Function Attrs: nounwind uwtable
define void @good21() #0 !dbg !66 {
entry:
  %data = alloca i32, align 4
  %dataPtr1 = alloca i32*, align 8
  %dataPtr2 = alloca i32*, align 8
  %data1 = alloca i32, align 4
  %data2 = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !67, metadata !16), !dbg !68
  call void @llvm.dbg.declare(metadata i32** %dataPtr1, metadata !69, metadata !16), !dbg !70
  store i32* %data, i32** %dataPtr1, align 8, !dbg !70
  call void @llvm.dbg.declare(metadata i32** %dataPtr2, metadata !71, metadata !16), !dbg !72
  store i32* %data, i32** %dataPtr2, align 8, !dbg !72
  store i32 -1, i32* %data, align 4, !dbg !73
  call void @llvm.dbg.declare(metadata i32* %data1, metadata !74, metadata !16), !dbg !76
  %0 = load i32*, i32** %dataPtr1, align 8, !dbg !77
  %1 = load i32, i32* %0, align 4, !dbg !78
  store i32 %1, i32* %data1, align 4, !dbg !76
  store i32 7, i32* %data1, align 4, !dbg !79
  %2 = load i32, i32* %data1, align 4, !dbg !80
  %3 = load i32*, i32** %dataPtr1, align 8, !dbg !81
  store i32 %2, i32* %3, align 4, !dbg !82
  call void @llvm.dbg.declare(metadata i32* %data2, metadata !83, metadata !16), !dbg !85
  %4 = load i32*, i32** %dataPtr2, align 8, !dbg !86
  %5 = load i32, i32* %4, align 4, !dbg !87
  store i32 %5, i32* %data2, align 4, !dbg !85
  %6 = load i32, i32* %data2, align 4, !dbg !88
  %div = sdiv i32 100, %6, !dbg !89
  call void @printIntLine(i32 %div), !dbg !90
  ret void, !dbg !91
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !92 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @good21(), !dbg !95
  call void @bad21(), !dbg !96
  ret i32 1, !dbg !97
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6}
!llvm.ident = !{!7}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (tags/RELEASE_390/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3)
!1 = !DIFile(filename: "369_21.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/369")
!2 = !{}
!3 = !{!4}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64, align: 64)
!5 = !{i32 2, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{!"clang version 3.9.0 (tags/RELEASE_390/final)"}
!8 = distinct !DISubprogram(name: "printLine", scope: !9, file: !9, line: 10, type: !10, isLocal: false, isDefinition: true, scopeLine: 11, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!9 = !DIFile(filename: "./369_21.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/369")
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
!36 = distinct !DISubprogram(name: "bad21", scope: !9, file: !9, line: 25, type: !37, isLocal: false, isDefinition: true, scopeLine: 26, isOptimized: false, unit: !0, variables: !2)
!37 = !DISubroutineType(types: !38)
!38 = !{null}
!39 = !DILocalVariable(name: "data", scope: !36, file: !9, line: 27, type: !30)
!40 = !DILocation(line: 27, column: 9, scope: !36)
!41 = !DILocalVariable(name: "dataPtr1", scope: !36, file: !9, line: 28, type: !42)
!42 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !30, size: 64, align: 64)
!43 = !DILocation(line: 28, column: 10, scope: !36)
!44 = !DILocalVariable(name: "dataPtr2", scope: !36, file: !9, line: 29, type: !42)
!45 = !DILocation(line: 29, column: 10, scope: !36)
!46 = !DILocation(line: 31, column: 10, scope: !36)
!47 = !DILocalVariable(name: "data", scope: !48, file: !9, line: 33, type: !30)
!48 = distinct !DILexicalBlock(scope: !36, file: !9, line: 32, column: 5)
!49 = !DILocation(line: 33, column: 13, scope: !48)
!50 = !DILocation(line: 33, column: 21, scope: !48)
!51 = !DILocation(line: 33, column: 20, scope: !48)
!52 = !DILocation(line: 35, column: 16, scope: !48)
!53 = !DILocation(line: 35, column: 9, scope: !48)
!54 = !DILocation(line: 36, column: 21, scope: !48)
!55 = !DILocation(line: 36, column: 10, scope: !48)
!56 = !DILocation(line: 36, column: 19, scope: !48)
!57 = !DILocalVariable(name: "data", scope: !58, file: !9, line: 39, type: !30)
!58 = distinct !DILexicalBlock(scope: !36, file: !9, line: 38, column: 5)
!59 = !DILocation(line: 39, column: 13, scope: !58)
!60 = !DILocation(line: 39, column: 21, scope: !58)
!61 = !DILocation(line: 39, column: 20, scope: !58)
!62 = !DILocation(line: 41, column: 28, scope: !58)
!63 = !DILocation(line: 41, column: 26, scope: !58)
!64 = !DILocation(line: 41, column: 9, scope: !58)
!65 = !DILocation(line: 43, column: 1, scope: !36)
!66 = distinct !DISubprogram(name: "good21", scope: !9, file: !9, line: 50, type: !37, isLocal: false, isDefinition: true, scopeLine: 51, isOptimized: false, unit: !0, variables: !2)
!67 = !DILocalVariable(name: "data", scope: !66, file: !9, line: 52, type: !30)
!68 = !DILocation(line: 52, column: 9, scope: !66)
!69 = !DILocalVariable(name: "dataPtr1", scope: !66, file: !9, line: 53, type: !42)
!70 = !DILocation(line: 53, column: 10, scope: !66)
!71 = !DILocalVariable(name: "dataPtr2", scope: !66, file: !9, line: 54, type: !42)
!72 = !DILocation(line: 54, column: 10, scope: !66)
!73 = !DILocation(line: 56, column: 10, scope: !66)
!74 = !DILocalVariable(name: "data", scope: !75, file: !9, line: 58, type: !30)
!75 = distinct !DILexicalBlock(scope: !66, file: !9, line: 57, column: 5)
!76 = !DILocation(line: 58, column: 13, scope: !75)
!77 = !DILocation(line: 58, column: 21, scope: !75)
!78 = !DILocation(line: 58, column: 20, scope: !75)
!79 = !DILocation(line: 60, column: 14, scope: !75)
!80 = !DILocation(line: 61, column: 21, scope: !75)
!81 = !DILocation(line: 61, column: 10, scope: !75)
!82 = !DILocation(line: 61, column: 19, scope: !75)
!83 = !DILocalVariable(name: "data", scope: !84, file: !9, line: 64, type: !30)
!84 = distinct !DILexicalBlock(scope: !66, file: !9, line: 63, column: 5)
!85 = !DILocation(line: 64, column: 13, scope: !84)
!86 = !DILocation(line: 64, column: 21, scope: !84)
!87 = !DILocation(line: 64, column: 20, scope: !84)
!88 = !DILocation(line: 66, column: 28, scope: !84)
!89 = !DILocation(line: 66, column: 26, scope: !84)
!90 = !DILocation(line: 66, column: 9, scope: !84)
!91 = !DILocation(line: 68, column: 1, scope: !66)
!92 = distinct !DISubprogram(name: "main", scope: !9, file: !9, line: 72, type: !93, isLocal: false, isDefinition: true, scopeLine: 72, isOptimized: false, unit: !0, variables: !2)
!93 = !DISubroutineType(types: !94)
!94 = !{!30}
!95 = !DILocation(line: 73, column: 2, scope: !92)
!96 = !DILocation(line: 74, column: 5, scope: !92)
!97 = !DILocation(line: 75, column: 5, scope: !92)
