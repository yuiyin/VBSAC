; ModuleID = './190_33.c'
source_filename = "./190_33.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@.str.1 = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1
@.str.2 = private unnamed_addr constant [5 x i8] c"%ld\0A\00", align 1
@staticFive = internal global i32 5, align 4
@stdin = external global %struct._IO_FILE*, align 8
@.str.3 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.4 = private unnamed_addr constant [54 x i8] c"data value is too large to perform arithmetic safely.\00", align 1

; Function Attrs: nounwind uwtable
define void @printHexCharLine(i8 signext %charHex) #0 !dbg !12 {
entry:
  %charHex.addr = alloca i8, align 1
  store i8 %charHex, i8* %charHex.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %charHex.addr, metadata !16, metadata !17), !dbg !18
  %0 = load i8, i8* %charHex.addr, align 1, !dbg !19
  %conv = sext i8 %0 to i32, !dbg !20
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), i32 %conv), !dbg !21
  ret void, !dbg !22
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @printf(i8*, ...) #2

; Function Attrs: nounwind uwtable
define void @printLine(i8* %line) #0 !dbg !23 {
entry:
  %line.addr = alloca i8*, align 8
  store i8* %line, i8** %line.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %line.addr, metadata !28, metadata !17), !dbg !29
  %0 = load i8*, i8** %line.addr, align 8, !dbg !30
  %cmp = icmp ne i8* %0, null, !dbg !32
  br i1 %cmp, label %if.then, label %if.end, !dbg !33

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** %line.addr, align 8, !dbg !34
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i32 0, i32 0), i8* %1), !dbg !36
  br label %if.end, !dbg !37

if.end:                                           ; preds = %if.then, %entry
  ret void, !dbg !38
}

; Function Attrs: nounwind uwtable
define void @printIntLine(i32 %intNumber) #0 !dbg !39 {
entry:
  %intNumber.addr = alloca i32, align 4
  store i32 %intNumber, i32* %intNumber.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %intNumber.addr, metadata !42, metadata !17), !dbg !43
  %0 = load i32, i32* %intNumber.addr, align 4, !dbg !44
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), i32 %0), !dbg !45
  ret void, !dbg !46
}

; Function Attrs: nounwind uwtable
define void @printLongLine(i64 %longIntNumber) #0 !dbg !47 {
entry:
  %longIntNumber.addr = alloca i64, align 8
  store i64 %longIntNumber, i64* %longIntNumber.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %longIntNumber.addr, metadata !53, metadata !17), !dbg !54
  %0 = load i64, i64* %longIntNumber.addr, align 8, !dbg !55
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.2, i32 0, i32 0), i64 %0), !dbg !56
  ret void, !dbg !57
}

; Function Attrs: nounwind uwtable
define void @bad33() #0 !dbg !58 {
entry:
  %data = alloca i32, align 4
  %result = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !61, metadata !17), !dbg !62
  store i32 0, i32* %data, align 4, !dbg !63
  %0 = load i32, i32* @staticFive, align 4, !dbg !64
  %cmp = icmp eq i32 %0, 5, !dbg !66
  br i1 %cmp, label %if.then, label %if.end, !dbg !67

if.then:                                          ; preds = %entry
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !68
  %call = call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i32 0, i32 0), i32* %data), !dbg !70
  br label %if.end, !dbg !71

if.end:                                           ; preds = %if.then, %entry
  %2 = load i32, i32* @staticFive, align 4, !dbg !72
  %cmp1 = icmp eq i32 %2, 5, !dbg !74
  br i1 %cmp1, label %if.then2, label %if.end3, !dbg !75

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %result, metadata !76, metadata !17), !dbg !79
  %3 = load i32, i32* %data, align 4, !dbg !80
  %add = add nsw i32 %3, 1, !dbg !81
  store i32 %add, i32* %result, align 4, !dbg !79
  %4 = load i32, i32* %result, align 4, !dbg !82
  call void @printIntLine(i32 %4), !dbg !83
  br label %if.end3, !dbg !84

if.end3:                                          ; preds = %if.then2, %if.end
  ret void, !dbg !85
}

declare i32 @__isoc99_fscanf(%struct._IO_FILE*, i8*, ...) #2

; Function Attrs: nounwind uwtable
define void @good33() #0 !dbg !86 {
entry:
  %data = alloca i32, align 4
  %result = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !87, metadata !17), !dbg !88
  store i32 0, i32* %data, align 4, !dbg !89
  %0 = load i32, i32* @staticFive, align 4, !dbg !90
  %cmp = icmp eq i32 %0, 5, !dbg !92
  br i1 %cmp, label %if.then, label %if.end, !dbg !93

if.then:                                          ; preds = %entry
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !94
  %call = call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i32 0, i32 0), i32* %data), !dbg !96
  br label %if.end, !dbg !97

if.end:                                           ; preds = %if.then, %entry
  %2 = load i32, i32* @staticFive, align 4, !dbg !98
  %cmp1 = icmp eq i32 %2, 5, !dbg !100
  br i1 %cmp1, label %if.then2, label %if.end6, !dbg !101

if.then2:                                         ; preds = %if.end
  %3 = load i32, i32* %data, align 4, !dbg !102
  %cmp3 = icmp slt i32 %3, 2147483647, !dbg !105
  br i1 %cmp3, label %if.then4, label %if.else, !dbg !106

if.then4:                                         ; preds = %if.then2
  call void @llvm.dbg.declare(metadata i32* %result, metadata !107, metadata !17), !dbg !109
  %4 = load i32, i32* %data, align 4, !dbg !110
  %add = add nsw i32 %4, 1, !dbg !111
  store i32 %add, i32* %result, align 4, !dbg !109
  %5 = load i32, i32* %result, align 4, !dbg !112
  call void @printIntLine(i32 %5), !dbg !113
  br label %if.end5, !dbg !114

if.else:                                          ; preds = %if.then2
  call void @printLine(i8* getelementptr inbounds ([54 x i8], [54 x i8]* @.str.4, i32 0, i32 0)), !dbg !115
  br label %if.end5

if.end5:                                          ; preds = %if.else, %if.then4
  br label %if.end6, !dbg !117

if.end6:                                          ; preds = %if.end5, %if.end
  ret void, !dbg !118
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !119 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @good33(), !dbg !122
  call void @bad33(), !dbg !123
  ret i32 1, !dbg !124
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!9, !10}
!llvm.ident = !{!11}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (tags/RELEASE_390/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, globals: !6)
!1 = !DIFile(filename: "190_33.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/190")
!2 = !{}
!3 = !{!4, !5}
!4 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64, align: 64)
!6 = !{!7}
!7 = distinct !DIGlobalVariable(name: "staticFive", scope: !0, file: !8, line: 33, type: !4, isLocal: true, isDefinition: true, variable: i32* @staticFive)
!8 = !DIFile(filename: "./190_33.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/190")
!9 = !{i32 2, !"Dwarf Version", i32 4}
!10 = !{i32 2, !"Debug Info Version", i32 3}
!11 = !{!"clang version 3.9.0 (tags/RELEASE_390/final)"}
!12 = distinct !DISubprogram(name: "printHexCharLine", scope: !8, file: !8, line: 10, type: !13, isLocal: false, isDefinition: true, scopeLine: 11, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!13 = !DISubroutineType(types: !14)
!14 = !{null, !15}
!15 = !DIBasicType(name: "char", size: 8, align: 8, encoding: DW_ATE_signed_char)
!16 = !DILocalVariable(name: "charHex", arg: 1, scope: !12, file: !8, line: 10, type: !15)
!17 = !DIExpression()
!18 = !DILocation(line: 10, column: 29, scope: !12)
!19 = !DILocation(line: 12, column: 25, scope: !12)
!20 = !DILocation(line: 12, column: 20, scope: !12)
!21 = !DILocation(line: 12, column: 5, scope: !12)
!22 = !DILocation(line: 13, column: 1, scope: !12)
!23 = distinct !DISubprogram(name: "printLine", scope: !8, file: !8, line: 15, type: !24, isLocal: false, isDefinition: true, scopeLine: 16, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!24 = !DISubroutineType(types: !25)
!25 = !{null, !26}
!26 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !27, size: 64, align: 64)
!27 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !15)
!28 = !DILocalVariable(name: "line", arg: 1, scope: !23, file: !8, line: 15, type: !26)
!29 = !DILocation(line: 15, column: 30, scope: !23)
!30 = !DILocation(line: 17, column: 8, scope: !31)
!31 = distinct !DILexicalBlock(scope: !23, file: !8, line: 17, column: 8)
!32 = !DILocation(line: 17, column: 13, scope: !31)
!33 = !DILocation(line: 17, column: 8, scope: !23)
!34 = !DILocation(line: 19, column: 24, scope: !35)
!35 = distinct !DILexicalBlock(scope: !31, file: !8, line: 18, column: 5)
!36 = !DILocation(line: 19, column: 9, scope: !35)
!37 = !DILocation(line: 20, column: 5, scope: !35)
!38 = !DILocation(line: 21, column: 1, scope: !23)
!39 = distinct !DISubprogram(name: "printIntLine", scope: !8, file: !8, line: 23, type: !40, isLocal: false, isDefinition: true, scopeLine: 24, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!40 = !DISubroutineType(types: !41)
!41 = !{null, !4}
!42 = !DILocalVariable(name: "intNumber", arg: 1, scope: !39, file: !8, line: 23, type: !4)
!43 = !DILocation(line: 23, column: 24, scope: !39)
!44 = !DILocation(line: 25, column: 20, scope: !39)
!45 = !DILocation(line: 25, column: 5, scope: !39)
!46 = !DILocation(line: 26, column: 1, scope: !39)
!47 = distinct !DISubprogram(name: "printLongLine", scope: !8, file: !8, line: 28, type: !48, isLocal: false, isDefinition: true, scopeLine: 29, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!48 = !DISubroutineType(types: !49)
!49 = !{null, !50}
!50 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !51, line: 197, baseType: !52)
!51 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/sys/types.h", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/190")
!52 = !DIBasicType(name: "long int", size: 64, align: 64, encoding: DW_ATE_signed)
!53 = !DILocalVariable(name: "longIntNumber", arg: 1, scope: !47, file: !8, line: 28, type: !50)
!54 = !DILocation(line: 28, column: 29, scope: !47)
!55 = !DILocation(line: 30, column: 21, scope: !47)
!56 = !DILocation(line: 30, column: 5, scope: !47)
!57 = !DILocation(line: 31, column: 1, scope: !47)
!58 = distinct !DISubprogram(name: "bad33", scope: !8, file: !8, line: 37, type: !59, isLocal: false, isDefinition: true, scopeLine: 38, isOptimized: false, unit: !0, variables: !2)
!59 = !DISubroutineType(types: !60)
!60 = !{null}
!61 = !DILocalVariable(name: "data", scope: !58, file: !8, line: 39, type: !4)
!62 = !DILocation(line: 39, column: 9, scope: !58)
!63 = !DILocation(line: 41, column: 10, scope: !58)
!64 = !DILocation(line: 42, column: 8, scope: !65)
!65 = distinct !DILexicalBlock(scope: !58, file: !8, line: 42, column: 8)
!66 = !DILocation(line: 42, column: 18, scope: !65)
!67 = !DILocation(line: 42, column: 8, scope: !58)
!68 = !DILocation(line: 45, column: 16, scope: !69)
!69 = distinct !DILexicalBlock(scope: !65, file: !8, line: 43, column: 5)
!70 = !DILocation(line: 45, column: 9, scope: !69)
!71 = !DILocation(line: 46, column: 5, scope: !69)
!72 = !DILocation(line: 47, column: 8, scope: !73)
!73 = distinct !DILexicalBlock(scope: !58, file: !8, line: 47, column: 8)
!74 = !DILocation(line: 47, column: 18, scope: !73)
!75 = !DILocation(line: 47, column: 8, scope: !58)
!76 = !DILocalVariable(name: "result", scope: !77, file: !8, line: 51, type: !4)
!77 = distinct !DILexicalBlock(scope: !78, file: !8, line: 49, column: 9)
!78 = distinct !DILexicalBlock(scope: !73, file: !8, line: 48, column: 5)
!79 = !DILocation(line: 51, column: 17, scope: !77)
!80 = !DILocation(line: 51, column: 26, scope: !77)
!81 = !DILocation(line: 51, column: 31, scope: !77)
!82 = !DILocation(line: 52, column: 26, scope: !77)
!83 = !DILocation(line: 52, column: 13, scope: !77)
!84 = !DILocation(line: 54, column: 5, scope: !78)
!85 = !DILocation(line: 55, column: 1, scope: !58)
!86 = distinct !DISubprogram(name: "good33", scope: !8, file: !8, line: 61, type: !59, isLocal: false, isDefinition: true, scopeLine: 62, isOptimized: false, unit: !0, variables: !2)
!87 = !DILocalVariable(name: "data", scope: !86, file: !8, line: 63, type: !4)
!88 = !DILocation(line: 63, column: 9, scope: !86)
!89 = !DILocation(line: 65, column: 10, scope: !86)
!90 = !DILocation(line: 66, column: 8, scope: !91)
!91 = distinct !DILexicalBlock(scope: !86, file: !8, line: 66, column: 8)
!92 = !DILocation(line: 66, column: 18, scope: !91)
!93 = !DILocation(line: 66, column: 8, scope: !86)
!94 = !DILocation(line: 69, column: 16, scope: !95)
!95 = distinct !DILexicalBlock(scope: !91, file: !8, line: 67, column: 5)
!96 = !DILocation(line: 69, column: 9, scope: !95)
!97 = !DILocation(line: 70, column: 5, scope: !95)
!98 = !DILocation(line: 71, column: 8, scope: !99)
!99 = distinct !DILexicalBlock(scope: !86, file: !8, line: 71, column: 8)
!100 = !DILocation(line: 71, column: 18, scope: !99)
!101 = !DILocation(line: 71, column: 8, scope: !86)
!102 = !DILocation(line: 74, column: 13, scope: !103)
!103 = distinct !DILexicalBlock(scope: !104, file: !8, line: 74, column: 13)
!104 = distinct !DILexicalBlock(scope: !99, file: !8, line: 72, column: 5)
!105 = !DILocation(line: 74, column: 18, scope: !103)
!106 = !DILocation(line: 74, column: 13, scope: !104)
!107 = !DILocalVariable(name: "result", scope: !108, file: !8, line: 76, type: !4)
!108 = distinct !DILexicalBlock(scope: !103, file: !8, line: 75, column: 9)
!109 = !DILocation(line: 76, column: 17, scope: !108)
!110 = !DILocation(line: 76, column: 26, scope: !108)
!111 = !DILocation(line: 76, column: 31, scope: !108)
!112 = !DILocation(line: 77, column: 26, scope: !108)
!113 = !DILocation(line: 77, column: 13, scope: !108)
!114 = !DILocation(line: 78, column: 9, scope: !108)
!115 = !DILocation(line: 81, column: 13, scope: !116)
!116 = distinct !DILexicalBlock(scope: !103, file: !8, line: 80, column: 9)
!117 = !DILocation(line: 83, column: 5, scope: !104)
!118 = !DILocation(line: 84, column: 1, scope: !86)
!119 = distinct !DISubprogram(name: "main", scope: !8, file: !8, line: 88, type: !120, isLocal: false, isDefinition: true, scopeLine: 88, isOptimized: false, unit: !0, variables: !2)
!120 = !DISubroutineType(types: !121)
!121 = !{!4}
!122 = !DILocation(line: 89, column: 5, scope: !119)
!123 = !DILocation(line: 90, column: 5, scope: !119)
!124 = !DILocation(line: 91, column: 5, scope: !119)
