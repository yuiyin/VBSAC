; ModuleID = './190_31.c'
source_filename = "./190_31.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@.str.1 = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1
@.str.2 = private unnamed_addr constant [5 x i8] c"%ld\0A\00", align 1
@stdin = external global %struct._IO_FILE*, align 8
@.str.3 = private unnamed_addr constant [3 x i8] c"%c\00", align 1
@.str.4 = private unnamed_addr constant [54 x i8] c"data value is too large to perform arithmetic safely.\00", align 1

; Function Attrs: nounwind uwtable
define void @printHexCharLine(i8 signext %charHex) #0 !dbg !9 {
entry:
  %charHex.addr = alloca i8, align 1
  store i8 %charHex, i8* %charHex.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %charHex.addr, metadata !14, metadata !15), !dbg !16
  %0 = load i8, i8* %charHex.addr, align 1, !dbg !17
  %conv = sext i8 %0 to i32, !dbg !18
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), i32 %conv), !dbg !19
  ret void, !dbg !20
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @printf(i8*, ...) #2

; Function Attrs: nounwind uwtable
define void @printLine(i8* %line) #0 !dbg !21 {
entry:
  %line.addr = alloca i8*, align 8
  store i8* %line, i8** %line.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %line.addr, metadata !26, metadata !15), !dbg !27
  %0 = load i8*, i8** %line.addr, align 8, !dbg !28
  %cmp = icmp ne i8* %0, null, !dbg !30
  br i1 %cmp, label %if.then, label %if.end, !dbg !31

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** %line.addr, align 8, !dbg !32
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i32 0, i32 0), i8* %1), !dbg !34
  br label %if.end, !dbg !35

if.end:                                           ; preds = %if.then, %entry
  ret void, !dbg !36
}

; Function Attrs: nounwind uwtable
define void @printIntLine(i32 %intNumber) #0 !dbg !37 {
entry:
  %intNumber.addr = alloca i32, align 4
  store i32 %intNumber, i32* %intNumber.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %intNumber.addr, metadata !40, metadata !15), !dbg !41
  %0 = load i32, i32* %intNumber.addr, align 4, !dbg !42
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), i32 %0), !dbg !43
  ret void, !dbg !44
}

; Function Attrs: nounwind uwtable
define void @printLongLine(i64 %longIntNumber) #0 !dbg !45 {
entry:
  %longIntNumber.addr = alloca i64, align 8
  store i64 %longIntNumber, i64* %longIntNumber.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %longIntNumber.addr, metadata !51, metadata !15), !dbg !52
  %0 = load i64, i64* %longIntNumber.addr, align 8, !dbg !53
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.2, i32 0, i32 0), i64 %0), !dbg !54
  ret void, !dbg !55
}

; Function Attrs: nounwind uwtable
define void @bad31() #0 !dbg !56 {
entry:
  %data = alloca i8, align 1
  %result = alloca i8, align 1
  call void @llvm.dbg.declare(metadata i8* %data, metadata !59, metadata !15), !dbg !60
  store i8 32, i8* %data, align 1, !dbg !61
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !62
  %call = call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* %0, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i32 0, i32 0), i8* %data), !dbg !63
  %1 = load i8, i8* %data, align 1, !dbg !64
  %conv = sext i8 %1 to i32, !dbg !64
  %cmp = icmp sgt i32 %conv, 0, !dbg !66
  br i1 %cmp, label %if.then, label %if.end, !dbg !67

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i8* %result, metadata !68, metadata !15), !dbg !70
  %2 = load i8, i8* %data, align 1, !dbg !71
  %conv2 = sext i8 %2 to i32, !dbg !71
  %mul = mul nsw i32 %conv2, 2, !dbg !72
  %conv3 = trunc i32 %mul to i8, !dbg !71
  store i8 %conv3, i8* %result, align 1, !dbg !70
  %3 = load i8, i8* %result, align 1, !dbg !73
  call void @printHexCharLine(i8 signext %3), !dbg !74
  br label %if.end, !dbg !75

if.end:                                           ; preds = %if.then, %entry
  ret void, !dbg !76
}

declare i32 @__isoc99_fscanf(%struct._IO_FILE*, i8*, ...) #2

; Function Attrs: nounwind uwtable
define void @goodG2B() #0 !dbg !77 {
entry:
  %data = alloca i8, align 1
  %result = alloca i8, align 1
  call void @llvm.dbg.declare(metadata i8* %data, metadata !78, metadata !15), !dbg !79
  store i8 32, i8* %data, align 1, !dbg !80
  store i8 2, i8* %data, align 1, !dbg !81
  %0 = load i8, i8* %data, align 1, !dbg !82
  %conv = sext i8 %0 to i32, !dbg !82
  %cmp = icmp sgt i32 %conv, 0, !dbg !84
  br i1 %cmp, label %if.then, label %if.end, !dbg !85

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i8* %result, metadata !86, metadata !15), !dbg !88
  %1 = load i8, i8* %data, align 1, !dbg !89
  %conv2 = sext i8 %1 to i32, !dbg !89
  %mul = mul nsw i32 %conv2, 2, !dbg !90
  %conv3 = trunc i32 %mul to i8, !dbg !89
  store i8 %conv3, i8* %result, align 1, !dbg !88
  %2 = load i8, i8* %result, align 1, !dbg !91
  call void @printHexCharLine(i8 signext %2), !dbg !92
  br label %if.end, !dbg !93

if.end:                                           ; preds = %if.then, %entry
  ret void, !dbg !94
}

; Function Attrs: nounwind uwtable
define void @goodB2G() #0 !dbg !95 {
entry:
  %data = alloca i8, align 1
  %result = alloca i8, align 1
  call void @llvm.dbg.declare(metadata i8* %data, metadata !96, metadata !15), !dbg !97
  store i8 32, i8* %data, align 1, !dbg !98
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !99
  %call = call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* %0, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i32 0, i32 0), i8* %data), !dbg !100
  %1 = load i8, i8* %data, align 1, !dbg !101
  %conv = sext i8 %1 to i32, !dbg !101
  %cmp = icmp sgt i32 %conv, 0, !dbg !103
  br i1 %cmp, label %if.then, label %if.end8, !dbg !104

if.then:                                          ; preds = %entry
  %2 = load i8, i8* %data, align 1, !dbg !105
  %conv2 = sext i8 %2 to i32, !dbg !105
  %cmp3 = icmp slt i32 %conv2, 63, !dbg !108
  br i1 %cmp3, label %if.then5, label %if.else, !dbg !109

if.then5:                                         ; preds = %if.then
  call void @llvm.dbg.declare(metadata i8* %result, metadata !110, metadata !15), !dbg !112
  %3 = load i8, i8* %data, align 1, !dbg !113
  %conv6 = sext i8 %3 to i32, !dbg !113
  %mul = mul nsw i32 %conv6, 2, !dbg !114
  %conv7 = trunc i32 %mul to i8, !dbg !113
  store i8 %conv7, i8* %result, align 1, !dbg !112
  %4 = load i8, i8* %result, align 1, !dbg !115
  call void @printHexCharLine(i8 signext %4), !dbg !116
  br label %if.end, !dbg !117

if.else:                                          ; preds = %if.then
  call void @printLine(i8* getelementptr inbounds ([54 x i8], [54 x i8]* @.str.4, i32 0, i32 0)), !dbg !118
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then5
  br label %if.end8, !dbg !120

if.end8:                                          ; preds = %if.end, %entry
  ret void, !dbg !121
}

; Function Attrs: nounwind uwtable
define void @good31() #0 !dbg !122 {
entry:
  call void @goodG2B(), !dbg !123
  call void @goodB2G(), !dbg !124
  ret void, !dbg !125
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !126 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @good31(), !dbg !129
  call void @bad31(), !dbg !130
  ret i32 1, !dbg !131
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (tags/RELEASE_390/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3)
!1 = !DIFile(filename: "190_31.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/190")
!2 = !{}
!3 = !{!4, !5}
!4 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64, align: 64)
!6 = !{i32 2, !"Dwarf Version", i32 4}
!7 = !{i32 2, !"Debug Info Version", i32 3}
!8 = !{!"clang version 3.9.0 (tags/RELEASE_390/final)"}
!9 = distinct !DISubprogram(name: "printHexCharLine", scope: !10, file: !10, line: 10, type: !11, isLocal: false, isDefinition: true, scopeLine: 11, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!10 = !DIFile(filename: "./190_31.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/190")
!11 = !DISubroutineType(types: !12)
!12 = !{null, !13}
!13 = !DIBasicType(name: "char", size: 8, align: 8, encoding: DW_ATE_signed_char)
!14 = !DILocalVariable(name: "charHex", arg: 1, scope: !9, file: !10, line: 10, type: !13)
!15 = !DIExpression()
!16 = !DILocation(line: 10, column: 29, scope: !9)
!17 = !DILocation(line: 12, column: 25, scope: !9)
!18 = !DILocation(line: 12, column: 20, scope: !9)
!19 = !DILocation(line: 12, column: 5, scope: !9)
!20 = !DILocation(line: 13, column: 1, scope: !9)
!21 = distinct !DISubprogram(name: "printLine", scope: !10, file: !10, line: 15, type: !22, isLocal: false, isDefinition: true, scopeLine: 16, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!22 = !DISubroutineType(types: !23)
!23 = !{null, !24}
!24 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !25, size: 64, align: 64)
!25 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !13)
!26 = !DILocalVariable(name: "line", arg: 1, scope: !21, file: !10, line: 15, type: !24)
!27 = !DILocation(line: 15, column: 30, scope: !21)
!28 = !DILocation(line: 17, column: 8, scope: !29)
!29 = distinct !DILexicalBlock(scope: !21, file: !10, line: 17, column: 8)
!30 = !DILocation(line: 17, column: 13, scope: !29)
!31 = !DILocation(line: 17, column: 8, scope: !21)
!32 = !DILocation(line: 19, column: 24, scope: !33)
!33 = distinct !DILexicalBlock(scope: !29, file: !10, line: 18, column: 5)
!34 = !DILocation(line: 19, column: 9, scope: !33)
!35 = !DILocation(line: 20, column: 5, scope: !33)
!36 = !DILocation(line: 21, column: 1, scope: !21)
!37 = distinct !DISubprogram(name: "printIntLine", scope: !10, file: !10, line: 23, type: !38, isLocal: false, isDefinition: true, scopeLine: 24, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!38 = !DISubroutineType(types: !39)
!39 = !{null, !4}
!40 = !DILocalVariable(name: "intNumber", arg: 1, scope: !37, file: !10, line: 23, type: !4)
!41 = !DILocation(line: 23, column: 24, scope: !37)
!42 = !DILocation(line: 25, column: 20, scope: !37)
!43 = !DILocation(line: 25, column: 5, scope: !37)
!44 = !DILocation(line: 26, column: 1, scope: !37)
!45 = distinct !DISubprogram(name: "printLongLine", scope: !10, file: !10, line: 28, type: !46, isLocal: false, isDefinition: true, scopeLine: 29, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!46 = !DISubroutineType(types: !47)
!47 = !{null, !48}
!48 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !49, line: 197, baseType: !50)
!49 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/sys/types.h", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/190")
!50 = !DIBasicType(name: "long int", size: 64, align: 64, encoding: DW_ATE_signed)
!51 = !DILocalVariable(name: "longIntNumber", arg: 1, scope: !45, file: !10, line: 28, type: !48)
!52 = !DILocation(line: 28, column: 29, scope: !45)
!53 = !DILocation(line: 30, column: 21, scope: !45)
!54 = !DILocation(line: 30, column: 5, scope: !45)
!55 = !DILocation(line: 31, column: 1, scope: !45)
!56 = distinct !DISubprogram(name: "bad31", scope: !10, file: !10, line: 33, type: !57, isLocal: false, isDefinition: true, scopeLine: 34, isOptimized: false, unit: !0, variables: !2)
!57 = !DISubroutineType(types: !58)
!58 = !{null}
!59 = !DILocalVariable(name: "data", scope: !56, file: !10, line: 35, type: !13)
!60 = !DILocation(line: 35, column: 10, scope: !56)
!61 = !DILocation(line: 36, column: 10, scope: !56)
!62 = !DILocation(line: 38, column: 13, scope: !56)
!63 = !DILocation(line: 38, column: 5, scope: !56)
!64 = !DILocation(line: 39, column: 8, scope: !65)
!65 = distinct !DILexicalBlock(scope: !56, file: !10, line: 39, column: 8)
!66 = !DILocation(line: 39, column: 13, scope: !65)
!67 = !DILocation(line: 39, column: 8, scope: !56)
!68 = !DILocalVariable(name: "result", scope: !69, file: !10, line: 42, type: !13)
!69 = distinct !DILexicalBlock(scope: !65, file: !10, line: 40, column: 5)
!70 = !DILocation(line: 42, column: 14, scope: !69)
!71 = !DILocation(line: 42, column: 23, scope: !69)
!72 = !DILocation(line: 42, column: 28, scope: !69)
!73 = !DILocation(line: 43, column: 26, scope: !69)
!74 = !DILocation(line: 43, column: 9, scope: !69)
!75 = !DILocation(line: 44, column: 5, scope: !69)
!76 = !DILocation(line: 45, column: 1, scope: !56)
!77 = distinct !DISubprogram(name: "goodG2B", scope: !10, file: !10, line: 47, type: !57, isLocal: false, isDefinition: true, scopeLine: 48, isOptimized: false, unit: !0, variables: !2)
!78 = !DILocalVariable(name: "data", scope: !77, file: !10, line: 49, type: !13)
!79 = !DILocation(line: 49, column: 10, scope: !77)
!80 = !DILocation(line: 50, column: 10, scope: !77)
!81 = !DILocation(line: 52, column: 10, scope: !77)
!82 = !DILocation(line: 53, column: 8, scope: !83)
!83 = distinct !DILexicalBlock(scope: !77, file: !10, line: 53, column: 8)
!84 = !DILocation(line: 53, column: 13, scope: !83)
!85 = !DILocation(line: 53, column: 8, scope: !77)
!86 = !DILocalVariable(name: "result", scope: !87, file: !10, line: 56, type: !13)
!87 = distinct !DILexicalBlock(scope: !83, file: !10, line: 54, column: 5)
!88 = !DILocation(line: 56, column: 14, scope: !87)
!89 = !DILocation(line: 56, column: 23, scope: !87)
!90 = !DILocation(line: 56, column: 28, scope: !87)
!91 = !DILocation(line: 57, column: 26, scope: !87)
!92 = !DILocation(line: 57, column: 9, scope: !87)
!93 = !DILocation(line: 58, column: 5, scope: !87)
!94 = !DILocation(line: 59, column: 1, scope: !77)
!95 = distinct !DISubprogram(name: "goodB2G", scope: !10, file: !10, line: 62, type: !57, isLocal: false, isDefinition: true, scopeLine: 63, isOptimized: false, unit: !0, variables: !2)
!96 = !DILocalVariable(name: "data", scope: !95, file: !10, line: 64, type: !13)
!97 = !DILocation(line: 64, column: 10, scope: !95)
!98 = !DILocation(line: 65, column: 10, scope: !95)
!99 = !DILocation(line: 67, column: 13, scope: !95)
!100 = !DILocation(line: 67, column: 5, scope: !95)
!101 = !DILocation(line: 68, column: 8, scope: !102)
!102 = distinct !DILexicalBlock(scope: !95, file: !10, line: 68, column: 8)
!103 = !DILocation(line: 68, column: 13, scope: !102)
!104 = !DILocation(line: 68, column: 8, scope: !95)
!105 = !DILocation(line: 71, column: 13, scope: !106)
!106 = distinct !DILexicalBlock(scope: !107, file: !10, line: 71, column: 13)
!107 = distinct !DILexicalBlock(scope: !102, file: !10, line: 69, column: 5)
!108 = !DILocation(line: 71, column: 18, scope: !106)
!109 = !DILocation(line: 71, column: 13, scope: !107)
!110 = !DILocalVariable(name: "result", scope: !111, file: !10, line: 73, type: !13)
!111 = distinct !DILexicalBlock(scope: !106, file: !10, line: 72, column: 9)
!112 = !DILocation(line: 73, column: 18, scope: !111)
!113 = !DILocation(line: 73, column: 27, scope: !111)
!114 = !DILocation(line: 73, column: 32, scope: !111)
!115 = !DILocation(line: 74, column: 30, scope: !111)
!116 = !DILocation(line: 74, column: 13, scope: !111)
!117 = !DILocation(line: 75, column: 9, scope: !111)
!118 = !DILocation(line: 78, column: 13, scope: !119)
!119 = distinct !DILexicalBlock(scope: !106, file: !10, line: 77, column: 9)
!120 = !DILocation(line: 80, column: 5, scope: !107)
!121 = !DILocation(line: 81, column: 1, scope: !95)
!122 = distinct !DISubprogram(name: "good31", scope: !10, file: !10, line: 83, type: !57, isLocal: false, isDefinition: true, scopeLine: 84, isOptimized: false, unit: !0, variables: !2)
!123 = !DILocation(line: 85, column: 5, scope: !122)
!124 = !DILocation(line: 86, column: 5, scope: !122)
!125 = !DILocation(line: 87, column: 1, scope: !122)
!126 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 89, type: !127, isLocal: false, isDefinition: true, scopeLine: 89, isOptimized: false, unit: !0, variables: !2)
!127 = !DISubroutineType(types: !128)
!128 = !{!4}
!129 = !DILocation(line: 90, column: 5, scope: !126)
!130 = !DILocation(line: 91, column: 5, scope: !126)
!131 = !DILocation(line: 92, column: 5, scope: !126)
