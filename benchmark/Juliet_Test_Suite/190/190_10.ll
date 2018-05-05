; ModuleID = './190_10.c'
source_filename = "./190_10.c"
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
@.str.1 = private unnamed_addr constant [5 x i8] c"%ld\0A\00", align 1
@stdin = external global %struct._IO_FILE*, align 8
@.str.2 = private unnamed_addr constant [4 x i8] c"%ld\00", align 1
@.str.3 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@.str.4 = private unnamed_addr constant [54 x i8] c"data value is too large to perform arithmetic safely.\00", align 1

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
define void @printLongLine(i64 %longIntNumber) #0 !dbg !36 {
entry:
  %longIntNumber.addr = alloca i64, align 8
  store i64 %longIntNumber, i64* %longIntNumber.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %longIntNumber.addr, metadata !42, metadata !25), !dbg !43
  %0 = load i64, i64* %longIntNumber.addr, align 8, !dbg !44
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.1, i32 0, i32 0), i64 %0), !dbg !45
  ret void, !dbg !46
}

; Function Attrs: nounwind uwtable
define void @bad10() #0 !dbg !47 {
entry:
  %data = alloca i64, align 8
  %result = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64* %data, metadata !50, metadata !25), !dbg !51
  store i64 0, i64* %data, align 8, !dbg !52
  %0 = load i32, i32* @globalTrue, align 4, !dbg !53
  %tobool = icmp ne i32 %0, 0, !dbg !53
  br i1 %tobool, label %if.then, label %if.end, !dbg !55

if.then:                                          ; preds = %entry
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !56
  %call = call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.2, i32 0, i32 0), i64* %data), !dbg !58
  br label %if.end, !dbg !59

if.end:                                           ; preds = %if.then, %entry
  %2 = load i32, i32* @globalTrue, align 4, !dbg !60
  %tobool1 = icmp ne i32 %2, 0, !dbg !60
  br i1 %tobool1, label %if.then2, label %if.end3, !dbg !62

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i64* %result, metadata !63, metadata !25), !dbg !66
  %3 = load i64, i64* %data, align 8, !dbg !67
  %add = add nsw i64 %3, 1, !dbg !68
  store i64 %add, i64* %result, align 8, !dbg !66
  %4 = load i64, i64* %result, align 8, !dbg !69
  call void @printLongLine(i64 %4), !dbg !70
  br label %if.end3, !dbg !71

if.end3:                                          ; preds = %if.then2, %if.end
  ret void, !dbg !72
}

declare i32 @__isoc99_fscanf(%struct._IO_FILE*, i8*, ...) #2

; Function Attrs: nounwind uwtable
define void @good10() #0 !dbg !73 {
entry:
  %data = alloca i64, align 8
  %result = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64* %data, metadata !74, metadata !25), !dbg !75
  store i64 0, i64* %data, align 8, !dbg !76
  %0 = load i32, i32* @globalTrue, align 4, !dbg !77
  %tobool = icmp ne i32 %0, 0, !dbg !77
  br i1 %tobool, label %if.then, label %if.end, !dbg !79

if.then:                                          ; preds = %entry
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !80
  %call = call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.2, i32 0, i32 0), i64* %data), !dbg !82
  br label %if.end, !dbg !83

if.end:                                           ; preds = %if.then, %entry
  %2 = load i32, i32* @globalFalse, align 4, !dbg !84
  %tobool1 = icmp ne i32 %2, 0, !dbg !84
  br i1 %tobool1, label %if.then2, label %if.else, !dbg !86

if.then2:                                         ; preds = %if.end
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.3, i32 0, i32 0)), !dbg !87
  br label %if.end6, !dbg !89

if.else:                                          ; preds = %if.end
  %3 = load i64, i64* %data, align 8, !dbg !90
  %cmp = icmp slt i64 %3, 9223372036854775807, !dbg !93
  br i1 %cmp, label %if.then3, label %if.else4, !dbg !94

if.then3:                                         ; preds = %if.else
  call void @llvm.dbg.declare(metadata i64* %result, metadata !95, metadata !25), !dbg !97
  %4 = load i64, i64* %data, align 8, !dbg !98
  %add = add nsw i64 %4, 1, !dbg !99
  store i64 %add, i64* %result, align 8, !dbg !97
  %5 = load i64, i64* %result, align 8, !dbg !100
  call void @printLongLine(i64 %5), !dbg !101
  br label %if.end5, !dbg !102

if.else4:                                         ; preds = %if.else
  call void @printLine(i8* getelementptr inbounds ([54 x i8], [54 x i8]* @.str.4, i32 0, i32 0)), !dbg !103
  br label %if.end5

if.end5:                                          ; preds = %if.else4, %if.then3
  br label %if.end6

if.end6:                                          ; preds = %if.end5, %if.then2
  ret void, !dbg !105
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !106 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @good10(), !dbg !109
  call void @bad10(), !dbg !110
  ret i32 1, !dbg !111
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!15, !16}
!llvm.ident = !{!17}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (tags/RELEASE_390/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, globals: !5)
!1 = !DIFile(filename: "190_10.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/190")
!2 = !{}
!3 = !{!4}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64, align: 64)
!5 = !{!6, !10, !11, !12, !13, !14}
!6 = distinct !DIGlobalVariable(name: "GLOBAL_CONST_TRUE", scope: !0, file: !7, line: 10, type: !8, isLocal: false, isDefinition: true, variable: i32* @GLOBAL_CONST_TRUE)
!7 = !DIFile(filename: "./190_10.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/190")
!8 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !9)
!9 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!10 = distinct !DIGlobalVariable(name: "GLOBAL_CONST_FALSE", scope: !0, file: !7, line: 11, type: !8, isLocal: false, isDefinition: true, variable: i32* @GLOBAL_CONST_FALSE)
!11 = distinct !DIGlobalVariable(name: "GLOBAL_CONST_FIVE", scope: !0, file: !7, line: 12, type: !8, isLocal: false, isDefinition: true, variable: i32* @GLOBAL_CONST_FIVE)
!12 = distinct !DIGlobalVariable(name: "globalTrue", scope: !0, file: !7, line: 14, type: !9, isLocal: false, isDefinition: true, variable: i32* @globalTrue)
!13 = distinct !DIGlobalVariable(name: "globalFalse", scope: !0, file: !7, line: 15, type: !9, isLocal: false, isDefinition: true, variable: i32* @globalFalse)
!14 = distinct !DIGlobalVariable(name: "globalFive", scope: !0, file: !7, line: 16, type: !9, isLocal: false, isDefinition: true, variable: i32* @globalFive)
!15 = !{i32 2, !"Dwarf Version", i32 4}
!16 = !{i32 2, !"Debug Info Version", i32 3}
!17 = !{!"clang version 3.9.0 (tags/RELEASE_390/final)"}
!18 = distinct !DISubprogram(name: "printLine", scope: !7, file: !7, line: 19, type: !19, isLocal: false, isDefinition: true, scopeLine: 20, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!19 = !DISubroutineType(types: !20)
!20 = !{null, !21}
!21 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !22, size: 64, align: 64)
!22 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !23)
!23 = !DIBasicType(name: "char", size: 8, align: 8, encoding: DW_ATE_signed_char)
!24 = !DILocalVariable(name: "line", arg: 1, scope: !18, file: !7, line: 19, type: !21)
!25 = !DIExpression()
!26 = !DILocation(line: 19, column: 30, scope: !18)
!27 = !DILocation(line: 21, column: 8, scope: !28)
!28 = distinct !DILexicalBlock(scope: !18, file: !7, line: 21, column: 8)
!29 = !DILocation(line: 21, column: 13, scope: !28)
!30 = !DILocation(line: 21, column: 8, scope: !18)
!31 = !DILocation(line: 23, column: 24, scope: !32)
!32 = distinct !DILexicalBlock(scope: !28, file: !7, line: 22, column: 5)
!33 = !DILocation(line: 23, column: 9, scope: !32)
!34 = !DILocation(line: 24, column: 5, scope: !32)
!35 = !DILocation(line: 25, column: 1, scope: !18)
!36 = distinct !DISubprogram(name: "printLongLine", scope: !7, file: !7, line: 27, type: !37, isLocal: false, isDefinition: true, scopeLine: 28, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!37 = !DISubroutineType(types: !38)
!38 = !{null, !39}
!39 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !40, line: 197, baseType: !41)
!40 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/sys/types.h", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/190")
!41 = !DIBasicType(name: "long int", size: 64, align: 64, encoding: DW_ATE_signed)
!42 = !DILocalVariable(name: "longIntNumber", arg: 1, scope: !36, file: !7, line: 27, type: !39)
!43 = !DILocation(line: 27, column: 29, scope: !36)
!44 = !DILocation(line: 29, column: 21, scope: !36)
!45 = !DILocation(line: 29, column: 5, scope: !36)
!46 = !DILocation(line: 30, column: 1, scope: !36)
!47 = distinct !DISubprogram(name: "bad10", scope: !7, file: !7, line: 33, type: !48, isLocal: false, isDefinition: true, scopeLine: 34, isOptimized: false, unit: !0, variables: !2)
!48 = !DISubroutineType(types: !49)
!49 = !{null}
!50 = !DILocalVariable(name: "data", scope: !47, file: !7, line: 35, type: !39)
!51 = !DILocation(line: 35, column: 13, scope: !47)
!52 = !DILocation(line: 36, column: 10, scope: !47)
!53 = !DILocation(line: 37, column: 8, scope: !54)
!54 = distinct !DILexicalBlock(scope: !47, file: !7, line: 37, column: 8)
!55 = !DILocation(line: 37, column: 8, scope: !47)
!56 = !DILocation(line: 40, column: 17, scope: !57)
!57 = distinct !DILexicalBlock(scope: !54, file: !7, line: 38, column: 5)
!58 = !DILocation(line: 40, column: 9, scope: !57)
!59 = !DILocation(line: 41, column: 5, scope: !57)
!60 = !DILocation(line: 42, column: 8, scope: !61)
!61 = distinct !DILexicalBlock(scope: !47, file: !7, line: 42, column: 8)
!62 = !DILocation(line: 42, column: 8, scope: !47)
!63 = !DILocalVariable(name: "result", scope: !64, file: !7, line: 46, type: !39)
!64 = distinct !DILexicalBlock(scope: !65, file: !7, line: 44, column: 9)
!65 = distinct !DILexicalBlock(scope: !61, file: !7, line: 43, column: 5)
!66 = !DILocation(line: 46, column: 21, scope: !64)
!67 = !DILocation(line: 46, column: 30, scope: !64)
!68 = !DILocation(line: 46, column: 35, scope: !64)
!69 = !DILocation(line: 47, column: 27, scope: !64)
!70 = !DILocation(line: 47, column: 13, scope: !64)
!71 = !DILocation(line: 49, column: 5, scope: !65)
!72 = !DILocation(line: 50, column: 1, scope: !47)
!73 = distinct !DISubprogram(name: "good10", scope: !7, file: !7, line: 52, type: !48, isLocal: false, isDefinition: true, scopeLine: 53, isOptimized: false, unit: !0, variables: !2)
!74 = !DILocalVariable(name: "data", scope: !73, file: !7, line: 54, type: !39)
!75 = !DILocation(line: 54, column: 13, scope: !73)
!76 = !DILocation(line: 55, column: 10, scope: !73)
!77 = !DILocation(line: 56, column: 8, scope: !78)
!78 = distinct !DILexicalBlock(scope: !73, file: !7, line: 56, column: 8)
!79 = !DILocation(line: 56, column: 8, scope: !73)
!80 = !DILocation(line: 59, column: 17, scope: !81)
!81 = distinct !DILexicalBlock(scope: !78, file: !7, line: 57, column: 5)
!82 = !DILocation(line: 59, column: 9, scope: !81)
!83 = !DILocation(line: 60, column: 5, scope: !81)
!84 = !DILocation(line: 61, column: 8, scope: !85)
!85 = distinct !DILexicalBlock(scope: !73, file: !7, line: 61, column: 8)
!86 = !DILocation(line: 61, column: 8, scope: !73)
!87 = !DILocation(line: 64, column: 9, scope: !88)
!88 = distinct !DILexicalBlock(scope: !85, file: !7, line: 62, column: 5)
!89 = !DILocation(line: 65, column: 5, scope: !88)
!90 = !DILocation(line: 69, column: 13, scope: !91)
!91 = distinct !DILexicalBlock(scope: !92, file: !7, line: 69, column: 13)
!92 = distinct !DILexicalBlock(scope: !85, file: !7, line: 67, column: 5)
!93 = !DILocation(line: 69, column: 18, scope: !91)
!94 = !DILocation(line: 69, column: 13, scope: !92)
!95 = !DILocalVariable(name: "result", scope: !96, file: !7, line: 71, type: !39)
!96 = distinct !DILexicalBlock(scope: !91, file: !7, line: 70, column: 9)
!97 = !DILocation(line: 71, column: 21, scope: !96)
!98 = !DILocation(line: 71, column: 30, scope: !96)
!99 = !DILocation(line: 71, column: 35, scope: !96)
!100 = !DILocation(line: 72, column: 27, scope: !96)
!101 = !DILocation(line: 72, column: 13, scope: !96)
!102 = !DILocation(line: 73, column: 9, scope: !96)
!103 = !DILocation(line: 76, column: 13, scope: !104)
!104 = distinct !DILexicalBlock(scope: !91, file: !7, line: 75, column: 9)
!105 = !DILocation(line: 79, column: 1, scope: !73)
!106 = distinct !DISubprogram(name: "main", scope: !7, file: !7, line: 81, type: !107, isLocal: false, isDefinition: true, scopeLine: 81, isOptimized: false, unit: !0, variables: !2)
!107 = !DISubroutineType(types: !108)
!108 = !{!9}
!109 = !DILocation(line: 82, column: 5, scope: !106)
!110 = !DILocation(line: 83, column: 5, scope: !106)
!111 = !DILocation(line: 84, column: 5, scope: !106)
