; ModuleID = './369_34.c'
source_filename = "./369_34.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1
@.str.1 = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@GLOBAL_CONST_TRUE = constant i32 1, align 4
@GLOBAL_CONST_FALSE = constant i32 0, align 4
@GLOBAL_CONST_FIVE = constant i32 5, align 4
@stdin = external global %struct._IO_FILE*, align 8
@.str.2 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.3 = private unnamed_addr constant [38 x i8] c"This would result in a divide by zero\00", align 1

; Function Attrs: nounwind uwtable
define void @printLine(i8* %line) #0 !dbg !15 {
entry:
  %line.addr = alloca i8*, align 8
  store i8* %line, i8** %line.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %line.addr, metadata !21, metadata !22), !dbg !23
  %0 = load i8*, i8** %line.addr, align 8, !dbg !24
  %cmp = icmp ne i8* %0, null, !dbg !26
  br i1 %cmp, label %if.then, label %if.end, !dbg !27

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** %line.addr, align 8, !dbg !28
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), i8* %1), !dbg !30
  br label %if.end, !dbg !31

if.end:                                           ; preds = %if.then, %entry
  ret void, !dbg !32
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @printf(i8*, ...) #2

; Function Attrs: nounwind uwtable
define void @printIntLine(i32 %intNumber) #0 !dbg !33 {
entry:
  %intNumber.addr = alloca i32, align 4
  store i32 %intNumber, i32* %intNumber.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %intNumber.addr, metadata !36, metadata !22), !dbg !37
  %0 = load i32, i32* %intNumber.addr, align 4, !dbg !38
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i32 0, i32 0), i32 %0), !dbg !39
  ret void, !dbg !40
}

; Function Attrs: nounwind uwtable
define void @bad34() #0 !dbg !41 {
entry:
  %data = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !44, metadata !22), !dbg !45
  store i32 -1, i32* %data, align 4, !dbg !46
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !47
  %call = call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* %0, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.2, i32 0, i32 0), i32* %data), !dbg !50
  %1 = load i32, i32* %data, align 4, !dbg !51
  %rem = srem i32 100, %1, !dbg !54
  call void @printIntLine(i32 %rem), !dbg !55
  ret void, !dbg !56
}

declare i32 @__isoc99_fscanf(%struct._IO_FILE*, i8*, ...) #2

; Function Attrs: nounwind uwtable
define void @good34() #0 !dbg !57 {
entry:
  %data = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !58, metadata !22), !dbg !59
  store i32 -1, i32* %data, align 4, !dbg !60
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !61
  %call = call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* %0, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.2, i32 0, i32 0), i32* %data), !dbg !64
  %1 = load i32, i32* %data, align 4, !dbg !65
  %cmp = icmp ne i32 %1, 0, !dbg !69
  br i1 %cmp, label %if.then, label %if.else, !dbg !70

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %data, align 4, !dbg !71
  %rem = srem i32 100, %2, !dbg !73
  call void @printIntLine(i32 %rem), !dbg !74
  br label %if.end, !dbg !75

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.str.3, i32 0, i32 0)), !dbg !76
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !78
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !79 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @good34(), !dbg !82
  call void @bad34(), !dbg !83
  ret i32 1, !dbg !84
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!12, !13}
!llvm.ident = !{!14}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (tags/RELEASE_390/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, globals: !5)
!1 = !DIFile(filename: "369_34.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/369")
!2 = !{}
!3 = !{!4}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64, align: 64)
!5 = !{!6, !10, !11}
!6 = distinct !DIGlobalVariable(name: "GLOBAL_CONST_TRUE", scope: !0, file: !7, line: 23, type: !8, isLocal: false, isDefinition: true, variable: i32* @GLOBAL_CONST_TRUE)
!7 = !DIFile(filename: "./369_34.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/369")
!8 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !9)
!9 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!10 = distinct !DIGlobalVariable(name: "GLOBAL_CONST_FALSE", scope: !0, file: !7, line: 24, type: !8, isLocal: false, isDefinition: true, variable: i32* @GLOBAL_CONST_FALSE)
!11 = distinct !DIGlobalVariable(name: "GLOBAL_CONST_FIVE", scope: !0, file: !7, line: 25, type: !8, isLocal: false, isDefinition: true, variable: i32* @GLOBAL_CONST_FIVE)
!12 = !{i32 2, !"Dwarf Version", i32 4}
!13 = !{i32 2, !"Debug Info Version", i32 3}
!14 = !{!"clang version 3.9.0 (tags/RELEASE_390/final)"}
!15 = distinct !DISubprogram(name: "printLine", scope: !7, file: !7, line: 10, type: !16, isLocal: false, isDefinition: true, scopeLine: 11, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!16 = !DISubroutineType(types: !17)
!17 = !{null, !18}
!18 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !19, size: 64, align: 64)
!19 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !20)
!20 = !DIBasicType(name: "char", size: 8, align: 8, encoding: DW_ATE_signed_char)
!21 = !DILocalVariable(name: "line", arg: 1, scope: !15, file: !7, line: 10, type: !18)
!22 = !DIExpression()
!23 = !DILocation(line: 10, column: 30, scope: !15)
!24 = !DILocation(line: 12, column: 8, scope: !25)
!25 = distinct !DILexicalBlock(scope: !15, file: !7, line: 12, column: 8)
!26 = !DILocation(line: 12, column: 13, scope: !25)
!27 = !DILocation(line: 12, column: 8, scope: !15)
!28 = !DILocation(line: 14, column: 24, scope: !29)
!29 = distinct !DILexicalBlock(scope: !25, file: !7, line: 13, column: 5)
!30 = !DILocation(line: 14, column: 9, scope: !29)
!31 = !DILocation(line: 15, column: 5, scope: !29)
!32 = !DILocation(line: 16, column: 1, scope: !15)
!33 = distinct !DISubprogram(name: "printIntLine", scope: !7, file: !7, line: 18, type: !34, isLocal: false, isDefinition: true, scopeLine: 19, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!34 = !DISubroutineType(types: !35)
!35 = !{null, !9}
!36 = !DILocalVariable(name: "intNumber", arg: 1, scope: !33, file: !7, line: 18, type: !9)
!37 = !DILocation(line: 18, column: 24, scope: !33)
!38 = !DILocation(line: 20, column: 20, scope: !33)
!39 = !DILocation(line: 20, column: 5, scope: !33)
!40 = !DILocation(line: 21, column: 1, scope: !33)
!41 = distinct !DISubprogram(name: "bad34", scope: !7, file: !7, line: 34, type: !42, isLocal: false, isDefinition: true, scopeLine: 35, isOptimized: false, unit: !0, variables: !2)
!42 = !DISubroutineType(types: !43)
!43 = !{null}
!44 = !DILocalVariable(name: "data", scope: !41, file: !7, line: 36, type: !9)
!45 = !DILocation(line: 36, column: 9, scope: !41)
!46 = !DILocation(line: 38, column: 10, scope: !41)
!47 = !DILocation(line: 42, column: 16, scope: !48)
!48 = distinct !DILexicalBlock(scope: !49, file: !7, line: 40, column: 5)
!49 = distinct !DILexicalBlock(scope: !41, file: !7, line: 39, column: 8)
!50 = !DILocation(line: 42, column: 9, scope: !48)
!51 = !DILocation(line: 47, column: 28, scope: !52)
!52 = distinct !DILexicalBlock(scope: !53, file: !7, line: 45, column: 5)
!53 = distinct !DILexicalBlock(scope: !41, file: !7, line: 44, column: 8)
!54 = !DILocation(line: 47, column: 26, scope: !52)
!55 = !DILocation(line: 47, column: 9, scope: !52)
!56 = !DILocation(line: 49, column: 1, scope: !41)
!57 = distinct !DISubprogram(name: "good34", scope: !7, file: !7, line: 53, type: !42, isLocal: false, isDefinition: true, scopeLine: 54, isOptimized: false, unit: !0, variables: !2)
!58 = !DILocalVariable(name: "data", scope: !57, file: !7, line: 55, type: !9)
!59 = !DILocation(line: 55, column: 9, scope: !57)
!60 = !DILocation(line: 57, column: 10, scope: !57)
!61 = !DILocation(line: 61, column: 16, scope: !62)
!62 = distinct !DILexicalBlock(scope: !63, file: !7, line: 59, column: 5)
!63 = distinct !DILexicalBlock(scope: !57, file: !7, line: 58, column: 8)
!64 = !DILocation(line: 61, column: 9, scope: !62)
!65 = !DILocation(line: 71, column: 13, scope: !66)
!66 = distinct !DILexicalBlock(scope: !67, file: !7, line: 71, column: 13)
!67 = distinct !DILexicalBlock(scope: !68, file: !7, line: 69, column: 5)
!68 = distinct !DILexicalBlock(scope: !57, file: !7, line: 63, column: 8)
!69 = !DILocation(line: 71, column: 18, scope: !66)
!70 = !DILocation(line: 71, column: 13, scope: !67)
!71 = !DILocation(line: 73, column: 32, scope: !72)
!72 = distinct !DILexicalBlock(scope: !66, file: !7, line: 72, column: 9)
!73 = !DILocation(line: 73, column: 30, scope: !72)
!74 = !DILocation(line: 73, column: 13, scope: !72)
!75 = !DILocation(line: 74, column: 9, scope: !72)
!76 = !DILocation(line: 77, column: 13, scope: !77)
!77 = distinct !DILexicalBlock(scope: !66, file: !7, line: 76, column: 9)
!78 = !DILocation(line: 80, column: 1, scope: !57)
!79 = distinct !DISubprogram(name: "main", scope: !7, file: !7, line: 83, type: !80, isLocal: false, isDefinition: true, scopeLine: 83, isOptimized: false, unit: !0, variables: !2)
!80 = !DISubroutineType(types: !81)
!81 = !{!9}
!82 = !DILocation(line: 84, column: 5, scope: !79)
!83 = !DILocation(line: 85, column: 5, scope: !79)
!84 = !DILocation(line: 86, column: 5, scope: !79)
