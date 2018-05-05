; ModuleID = './369_29.c'
source_filename = "./369_29.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1
@.str.1 = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@GLOBAL_CONST_TRUE = constant i32 1, align 4
@GLOBAL_CONST_FALSE = constant i32 0, align 4
@GLOBAL_CONST_FIVE = constant i32 5, align 4
@globalTrue = global i32 1, align 4
@globalFalse = global i32 0, align 4
@globalFive = global i32 5, align 4
@stdin = external global %struct._IO_FILE*, align 8
@.str.2 = private unnamed_addr constant [3 x i8] c"%d\00", align 1

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
define i32 @globalReturnsTrueOrFalse() #0 !dbg !50 {
entry:
  %call = call i32 @rand() #4, !dbg !51
  %rem = srem i32 %call, 2, !dbg !52
  ret i32 %rem, !dbg !53
}

; Function Attrs: nounwind
declare i32 @rand() #3

; Function Attrs: nounwind uwtable
define void @bad29() #0 !dbg !54 {
entry:
  %data = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !57, metadata !25), !dbg !58
  store i32 -1, i32* %data, align 4, !dbg !59
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !60
  %call = call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* %0, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.2, i32 0, i32 0), i32* %data), !dbg !63
  %1 = load i32, i32* %data, align 4, !dbg !64
  %rem = srem i32 100, %1, !dbg !67
  call void @printIntLine(i32 %rem), !dbg !68
  ret void, !dbg !69
}

declare i32 @__isoc99_fscanf(%struct._IO_FILE*, i8*, ...) #2

; Function Attrs: nounwind uwtable
define void @good29() #0 !dbg !70 {
entry:
  %data = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !71, metadata !25), !dbg !72
  store i32 -1, i32* %data, align 4, !dbg !73
  store i32 7, i32* %data, align 4, !dbg !74
  %0 = load i32, i32* %data, align 4, !dbg !77
  %rem = srem i32 100, %0, !dbg !80
  call void @printIntLine(i32 %rem), !dbg !81
  ret void, !dbg !82
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !83 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @good29(), !dbg !84
  call void @bad29(), !dbg !85
  ret i32 1, !dbg !86
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!15, !16}
!llvm.ident = !{!17}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (tags/RELEASE_390/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, globals: !5)
!1 = !DIFile(filename: "369_29.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/369")
!2 = !{}
!3 = !{!4}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64, align: 64)
!5 = !{!6, !10, !11, !12, !13, !14}
!6 = distinct !DIGlobalVariable(name: "GLOBAL_CONST_TRUE", scope: !0, file: !7, line: 23, type: !8, isLocal: false, isDefinition: true, variable: i32* @GLOBAL_CONST_TRUE)
!7 = !DIFile(filename: "./369_29.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/369")
!8 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !9)
!9 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!10 = distinct !DIGlobalVariable(name: "GLOBAL_CONST_FALSE", scope: !0, file: !7, line: 24, type: !8, isLocal: false, isDefinition: true, variable: i32* @GLOBAL_CONST_FALSE)
!11 = distinct !DIGlobalVariable(name: "GLOBAL_CONST_FIVE", scope: !0, file: !7, line: 25, type: !8, isLocal: false, isDefinition: true, variable: i32* @GLOBAL_CONST_FIVE)
!12 = distinct !DIGlobalVariable(name: "globalTrue", scope: !0, file: !7, line: 29, type: !9, isLocal: false, isDefinition: true, variable: i32* @globalTrue)
!13 = distinct !DIGlobalVariable(name: "globalFalse", scope: !0, file: !7, line: 30, type: !9, isLocal: false, isDefinition: true, variable: i32* @globalFalse)
!14 = distinct !DIGlobalVariable(name: "globalFive", scope: !0, file: !7, line: 31, type: !9, isLocal: false, isDefinition: true, variable: i32* @globalFive)
!15 = !{i32 2, !"Dwarf Version", i32 4}
!16 = !{i32 2, !"Debug Info Version", i32 3}
!17 = !{!"clang version 3.9.0 (tags/RELEASE_390/final)"}
!18 = distinct !DISubprogram(name: "printLine", scope: !7, file: !7, line: 10, type: !19, isLocal: false, isDefinition: true, scopeLine: 11, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!19 = !DISubroutineType(types: !20)
!20 = !{null, !21}
!21 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !22, size: 64, align: 64)
!22 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !23)
!23 = !DIBasicType(name: "char", size: 8, align: 8, encoding: DW_ATE_signed_char)
!24 = !DILocalVariable(name: "line", arg: 1, scope: !18, file: !7, line: 10, type: !21)
!25 = !DIExpression()
!26 = !DILocation(line: 10, column: 30, scope: !18)
!27 = !DILocation(line: 12, column: 8, scope: !28)
!28 = distinct !DILexicalBlock(scope: !18, file: !7, line: 12, column: 8)
!29 = !DILocation(line: 12, column: 13, scope: !28)
!30 = !DILocation(line: 12, column: 8, scope: !18)
!31 = !DILocation(line: 14, column: 24, scope: !32)
!32 = distinct !DILexicalBlock(scope: !28, file: !7, line: 13, column: 5)
!33 = !DILocation(line: 14, column: 9, scope: !32)
!34 = !DILocation(line: 15, column: 5, scope: !32)
!35 = !DILocation(line: 16, column: 1, scope: !18)
!36 = distinct !DISubprogram(name: "printIntLine", scope: !7, file: !7, line: 18, type: !37, isLocal: false, isDefinition: true, scopeLine: 19, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!37 = !DISubroutineType(types: !38)
!38 = !{null, !9}
!39 = !DILocalVariable(name: "intNumber", arg: 1, scope: !36, file: !7, line: 18, type: !9)
!40 = !DILocation(line: 18, column: 24, scope: !36)
!41 = !DILocation(line: 20, column: 20, scope: !36)
!42 = !DILocation(line: 20, column: 5, scope: !36)
!43 = !DILocation(line: 21, column: 1, scope: !36)
!44 = distinct !DISubprogram(name: "globalReturnsTrue", scope: !7, file: !7, line: 33, type: !45, isLocal: false, isDefinition: true, scopeLine: 34, isOptimized: false, unit: !0, variables: !2)
!45 = !DISubroutineType(types: !46)
!46 = !{!9}
!47 = !DILocation(line: 35, column: 5, scope: !44)
!48 = distinct !DISubprogram(name: "globalReturnsFalse", scope: !7, file: !7, line: 38, type: !45, isLocal: false, isDefinition: true, scopeLine: 39, isOptimized: false, unit: !0, variables: !2)
!49 = !DILocation(line: 40, column: 5, scope: !48)
!50 = distinct !DISubprogram(name: "globalReturnsTrueOrFalse", scope: !7, file: !7, line: 43, type: !45, isLocal: false, isDefinition: true, scopeLine: 44, isOptimized: false, unit: !0, variables: !2)
!51 = !DILocation(line: 45, column: 13, scope: !50)
!52 = !DILocation(line: 45, column: 20, scope: !50)
!53 = !DILocation(line: 45, column: 5, scope: !50)
!54 = distinct !DISubprogram(name: "bad29", scope: !7, file: !7, line: 50, type: !55, isLocal: false, isDefinition: true, scopeLine: 51, isOptimized: false, unit: !0, variables: !2)
!55 = !DISubroutineType(types: !56)
!56 = !{null}
!57 = !DILocalVariable(name: "data", scope: !54, file: !7, line: 52, type: !9)
!58 = !DILocation(line: 52, column: 9, scope: !54)
!59 = !DILocation(line: 54, column: 10, scope: !54)
!60 = !DILocation(line: 58, column: 16, scope: !61)
!61 = distinct !DILexicalBlock(scope: !62, file: !7, line: 56, column: 5)
!62 = distinct !DILexicalBlock(scope: !54, file: !7, line: 55, column: 8)
!63 = !DILocation(line: 58, column: 9, scope: !61)
!64 = !DILocation(line: 63, column: 28, scope: !65)
!65 = distinct !DILexicalBlock(scope: !66, file: !7, line: 61, column: 5)
!66 = distinct !DILexicalBlock(scope: !54, file: !7, line: 60, column: 8)
!67 = !DILocation(line: 63, column: 26, scope: !65)
!68 = !DILocation(line: 63, column: 9, scope: !65)
!69 = !DILocation(line: 65, column: 1, scope: !54)
!70 = distinct !DISubprogram(name: "good29", scope: !7, file: !7, line: 72, type: !55, isLocal: false, isDefinition: true, scopeLine: 73, isOptimized: false, unit: !0, variables: !2)
!71 = !DILocalVariable(name: "data", scope: !70, file: !7, line: 74, type: !9)
!72 = !DILocation(line: 74, column: 13, scope: !70)
!73 = !DILocation(line: 76, column: 10, scope: !70)
!74 = !DILocation(line: 85, column: 14, scope: !75)
!75 = distinct !DILexicalBlock(scope: !76, file: !7, line: 83, column: 5)
!76 = distinct !DILexicalBlock(scope: !70, file: !7, line: 77, column: 8)
!77 = !DILocation(line: 90, column: 28, scope: !78)
!78 = distinct !DILexicalBlock(scope: !79, file: !7, line: 88, column: 5)
!79 = distinct !DILexicalBlock(scope: !70, file: !7, line: 87, column: 8)
!80 = !DILocation(line: 90, column: 26, scope: !78)
!81 = !DILocation(line: 90, column: 9, scope: !78)
!82 = !DILocation(line: 92, column: 1, scope: !70)
!83 = distinct !DISubprogram(name: "main", scope: !7, file: !7, line: 96, type: !45, isLocal: false, isDefinition: true, scopeLine: 96, isOptimized: false, unit: !0, variables: !2)
!84 = !DILocation(line: 97, column: 2, scope: !83)
!85 = !DILocation(line: 98, column: 5, scope: !83)
!86 = !DILocation(line: 99, column: 5, scope: !83)
