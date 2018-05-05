; ModuleID = './369_20.c'
source_filename = "./369_20.c"
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
define void @bad20() #0 !dbg !54 {
entry:
  %data = alloca i32, align 4
  %dataCopy = alloca i32, align 4
  %data1 = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !57, metadata !35), !dbg !58
  store i32 -1, i32* %data, align 4, !dbg !59
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !60
  %call = call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* %0, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.2, i32 0, i32 0), i32* %data), !dbg !61
  call void @llvm.dbg.declare(metadata i32* %dataCopy, metadata !62, metadata !35), !dbg !64
  %1 = load i32, i32* %data, align 4, !dbg !65
  store i32 %1, i32* %dataCopy, align 4, !dbg !64
  call void @llvm.dbg.declare(metadata i32* %data1, metadata !66, metadata !35), !dbg !67
  %2 = load i32, i32* %dataCopy, align 4, !dbg !68
  store i32 %2, i32* %data1, align 4, !dbg !67
  %3 = load i32, i32* %data1, align 4, !dbg !69
  %div = sdiv i32 100, %3, !dbg !70
  call void @printIntLine(i32 %div), !dbg !71
  ret void, !dbg !72
}

declare i32 @__isoc99_fscanf(%struct._IO_FILE*, i8*, ...) #3

; Function Attrs: nounwind uwtable
define void @good20() #0 !dbg !73 {
entry:
  %data = alloca i32, align 4
  %dataCopy = alloca i32, align 4
  %data1 = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !74, metadata !35), !dbg !75
  store i32 -1, i32* %data, align 4, !dbg !76
  store i32 7, i32* %data, align 4, !dbg !77
  call void @llvm.dbg.declare(metadata i32* %dataCopy, metadata !78, metadata !35), !dbg !80
  %0 = load i32, i32* %data, align 4, !dbg !81
  store i32 %0, i32* %dataCopy, align 4, !dbg !80
  call void @llvm.dbg.declare(metadata i32* %data1, metadata !82, metadata !35), !dbg !83
  %1 = load i32, i32* %dataCopy, align 4, !dbg !84
  store i32 %1, i32* %data1, align 4, !dbg !83
  %2 = load i32, i32* %data1, align 4, !dbg !85
  %div = sdiv i32 100, %2, !dbg !86
  call void @printIntLine(i32 %div), !dbg !87
  ret void, !dbg !88
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !89 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @good20(), !dbg !90
  call void @bad20(), !dbg !91
  ret i32 1, !dbg !92
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
!1 = !DIFile(filename: "369_20.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/369")
!2 = !{}
!3 = !{!4}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64, align: 64)
!5 = !{!6, !10, !11, !12, !13, !14}
!6 = distinct !DIGlobalVariable(name: "GLOBAL_CONST_TRUE", scope: !0, file: !7, line: 10, type: !8, isLocal: false, isDefinition: true, variable: i32* @GLOBAL_CONST_TRUE)
!7 = !DIFile(filename: "./369_20.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/369")
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
!54 = distinct !DISubprogram(name: "bad20", scope: !7, file: !7, line: 53, type: !55, isLocal: false, isDefinition: true, scopeLine: 54, isOptimized: false, unit: !0, variables: !2)
!55 = !DISubroutineType(types: !56)
!56 = !{null}
!57 = !DILocalVariable(name: "data", scope: !54, file: !7, line: 55, type: !9)
!58 = !DILocation(line: 55, column: 9, scope: !54)
!59 = !DILocation(line: 57, column: 10, scope: !54)
!60 = !DILocation(line: 59, column: 12, scope: !54)
!61 = !DILocation(line: 59, column: 5, scope: !54)
!62 = !DILocalVariable(name: "dataCopy", scope: !63, file: !7, line: 61, type: !9)
!63 = distinct !DILexicalBlock(scope: !54, file: !7, line: 60, column: 5)
!64 = !DILocation(line: 61, column: 13, scope: !63)
!65 = !DILocation(line: 61, column: 24, scope: !63)
!66 = !DILocalVariable(name: "data", scope: !63, file: !7, line: 62, type: !9)
!67 = !DILocation(line: 62, column: 13, scope: !63)
!68 = !DILocation(line: 62, column: 20, scope: !63)
!69 = !DILocation(line: 64, column: 28, scope: !63)
!70 = !DILocation(line: 64, column: 26, scope: !63)
!71 = !DILocation(line: 64, column: 9, scope: !63)
!72 = !DILocation(line: 66, column: 1, scope: !54)
!73 = distinct !DISubprogram(name: "good20", scope: !7, file: !7, line: 72, type: !55, isLocal: false, isDefinition: true, scopeLine: 73, isOptimized: false, unit: !0, variables: !2)
!74 = !DILocalVariable(name: "data", scope: !73, file: !7, line: 74, type: !9)
!75 = !DILocation(line: 74, column: 9, scope: !73)
!76 = !DILocation(line: 76, column: 10, scope: !73)
!77 = !DILocation(line: 78, column: 10, scope: !73)
!78 = !DILocalVariable(name: "dataCopy", scope: !79, file: !7, line: 80, type: !9)
!79 = distinct !DILexicalBlock(scope: !73, file: !7, line: 79, column: 5)
!80 = !DILocation(line: 80, column: 13, scope: !79)
!81 = !DILocation(line: 80, column: 24, scope: !79)
!82 = !DILocalVariable(name: "data", scope: !79, file: !7, line: 81, type: !9)
!83 = !DILocation(line: 81, column: 13, scope: !79)
!84 = !DILocation(line: 81, column: 20, scope: !79)
!85 = !DILocation(line: 83, column: 28, scope: !79)
!86 = !DILocation(line: 83, column: 26, scope: !79)
!87 = !DILocation(line: 83, column: 9, scope: !79)
!88 = !DILocation(line: 85, column: 1, scope: !73)
!89 = distinct !DISubprogram(name: "main", scope: !7, file: !7, line: 89, type: !19, isLocal: false, isDefinition: true, scopeLine: 89, isOptimized: false, unit: !0, variables: !2)
!90 = !DILocation(line: 90, column: 2, scope: !89)
!91 = !DILocation(line: 91, column: 5, scope: !89)
!92 = !DILocation(line: 92, column: 5, scope: !89)
