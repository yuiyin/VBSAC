; ModuleID = './190_26.c'
source_filename = "./190_26.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@.str.1 = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1
@.str.2 = private unnamed_addr constant [5 x i8] c"%ld\0A\00", align 1
@stdin = external global %struct._IO_FILE*, align 8
@.str.3 = private unnamed_addr constant [4 x i8] c"%hd\00", align 1

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
define void @badSink(i16* %dataArray) #0 !dbg !56 {
entry:
  %dataArray.addr = alloca i16*, align 8
  %data = alloca i16, align 2
  %result = alloca i16, align 2
  store i16* %dataArray, i16** %dataArray.addr, align 8
  call void @llvm.dbg.declare(metadata i16** %dataArray.addr, metadata !61, metadata !15), !dbg !62
  call void @llvm.dbg.declare(metadata i16* %data, metadata !63, metadata !15), !dbg !64
  %0 = load i16*, i16** %dataArray.addr, align 8, !dbg !65
  %arrayidx = getelementptr inbounds i16, i16* %0, i64 2, !dbg !65
  %1 = load i16, i16* %arrayidx, align 2, !dbg !65
  store i16 %1, i16* %data, align 2, !dbg !64
  %2 = load i16, i16* %data, align 2, !dbg !66
  %conv = sext i16 %2 to i32, !dbg !66
  %cmp = icmp sgt i32 %conv, 0, !dbg !68
  br i1 %cmp, label %if.then, label %if.end, !dbg !69

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i16* %result, metadata !70, metadata !15), !dbg !72
  %3 = load i16, i16* %data, align 2, !dbg !73
  %conv2 = sext i16 %3 to i32, !dbg !73
  %mul = mul nsw i32 %conv2, 2, !dbg !74
  %conv3 = trunc i32 %mul to i16, !dbg !73
  store i16 %conv3, i16* %result, align 2, !dbg !72
  %4 = load i16, i16* %result, align 2, !dbg !75
  %conv4 = sext i16 %4 to i32, !dbg !75
  call void @printIntLine(i32 %conv4), !dbg !76
  br label %if.end, !dbg !77

if.end:                                           ; preds = %if.then, %entry
  ret void, !dbg !78
}

; Function Attrs: nounwind uwtable
define void @goodSink(i16* %dataArray) #0 !dbg !79 {
entry:
  %dataArray.addr = alloca i16*, align 8
  %data = alloca i16, align 2
  %result = alloca i16, align 2
  store i16* %dataArray, i16** %dataArray.addr, align 8
  call void @llvm.dbg.declare(metadata i16** %dataArray.addr, metadata !80, metadata !15), !dbg !81
  call void @llvm.dbg.declare(metadata i16* %data, metadata !82, metadata !15), !dbg !83
  %0 = load i16*, i16** %dataArray.addr, align 8, !dbg !84
  %arrayidx = getelementptr inbounds i16, i16* %0, i64 2, !dbg !84
  %1 = load i16, i16* %arrayidx, align 2, !dbg !84
  store i16 %1, i16* %data, align 2, !dbg !83
  store i16 2, i16* %data, align 2, !dbg !85
  %2 = load i16, i16* %data, align 2, !dbg !86
  %conv = sext i16 %2 to i32, !dbg !86
  %cmp = icmp sgt i32 %conv, 0, !dbg !88
  br i1 %cmp, label %if.then, label %if.end, !dbg !89

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i16* %result, metadata !90, metadata !15), !dbg !92
  %3 = load i16, i16* %data, align 2, !dbg !93
  %conv2 = sext i16 %3 to i32, !dbg !93
  %mul = mul nsw i32 %conv2, 2, !dbg !94
  %conv3 = trunc i32 %mul to i16, !dbg !93
  store i16 %conv3, i16* %result, align 2, !dbg !92
  %4 = load i16, i16* %result, align 2, !dbg !95
  %conv4 = sext i16 %4 to i32, !dbg !95
  call void @printIntLine(i32 %conv4), !dbg !96
  br label %if.end, !dbg !97

if.end:                                           ; preds = %if.then, %entry
  ret void, !dbg !98
}

; Function Attrs: nounwind uwtable
define void @bad26() #0 !dbg !99 {
entry:
  %data = alloca i16, align 2
  %dataArray = alloca [5 x i16], align 2
  call void @llvm.dbg.declare(metadata i16* %data, metadata !102, metadata !15), !dbg !103
  call void @llvm.dbg.declare(metadata [5 x i16]* %dataArray, metadata !104, metadata !15), !dbg !108
  store i16 0, i16* %data, align 2, !dbg !109
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !110
  %call = call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* %0, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i32 0, i32 0), i16* %data), !dbg !111
  %1 = load i16, i16* %data, align 2, !dbg !112
  %arrayidx = getelementptr inbounds [5 x i16], [5 x i16]* %dataArray, i64 0, i64 2, !dbg !113
  store i16 %1, i16* %arrayidx, align 2, !dbg !114
  %arraydecay = getelementptr inbounds [5 x i16], [5 x i16]* %dataArray, i32 0, i32 0, !dbg !115
  call void @badSink(i16* %arraydecay), !dbg !116
  ret void, !dbg !117
}

declare i32 @__isoc99_fscanf(%struct._IO_FILE*, i8*, ...) #2

; Function Attrs: nounwind uwtable
define void @good26() #0 !dbg !118 {
entry:
  %data = alloca i16, align 2
  %dataArray = alloca [5 x i16], align 2
  call void @llvm.dbg.declare(metadata i16* %data, metadata !119, metadata !15), !dbg !120
  call void @llvm.dbg.declare(metadata [5 x i16]* %dataArray, metadata !121, metadata !15), !dbg !122
  store i16 0, i16* %data, align 2, !dbg !123
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !124
  %call = call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* %0, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i32 0, i32 0), i16* %data), !dbg !125
  %1 = load i16, i16* %data, align 2, !dbg !126
  %arrayidx = getelementptr inbounds [5 x i16], [5 x i16]* %dataArray, i64 0, i64 2, !dbg !127
  store i16 %1, i16* %arrayidx, align 2, !dbg !128
  %arraydecay = getelementptr inbounds [5 x i16], [5 x i16]* %dataArray, i32 0, i32 0, !dbg !129
  call void @goodSink(i16* %arraydecay), !dbg !130
  ret void, !dbg !131
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !132 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @good26(), !dbg !135
  call void @bad26(), !dbg !136
  ret i32 1, !dbg !137
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (tags/RELEASE_390/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3)
!1 = !DIFile(filename: "190_26.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/190")
!2 = !{}
!3 = !{!4, !5}
!4 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64, align: 64)
!6 = !{i32 2, !"Dwarf Version", i32 4}
!7 = !{i32 2, !"Debug Info Version", i32 3}
!8 = !{!"clang version 3.9.0 (tags/RELEASE_390/final)"}
!9 = distinct !DISubprogram(name: "printHexCharLine", scope: !10, file: !10, line: 15, type: !11, isLocal: false, isDefinition: true, scopeLine: 16, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!10 = !DIFile(filename: "./190_26.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/190")
!11 = !DISubroutineType(types: !12)
!12 = !{null, !13}
!13 = !DIBasicType(name: "char", size: 8, align: 8, encoding: DW_ATE_signed_char)
!14 = !DILocalVariable(name: "charHex", arg: 1, scope: !9, file: !10, line: 15, type: !13)
!15 = !DIExpression()
!16 = !DILocation(line: 15, column: 29, scope: !9)
!17 = !DILocation(line: 17, column: 25, scope: !9)
!18 = !DILocation(line: 17, column: 20, scope: !9)
!19 = !DILocation(line: 17, column: 5, scope: !9)
!20 = !DILocation(line: 18, column: 1, scope: !9)
!21 = distinct !DISubprogram(name: "printLine", scope: !10, file: !10, line: 20, type: !22, isLocal: false, isDefinition: true, scopeLine: 21, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!22 = !DISubroutineType(types: !23)
!23 = !{null, !24}
!24 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !25, size: 64, align: 64)
!25 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !13)
!26 = !DILocalVariable(name: "line", arg: 1, scope: !21, file: !10, line: 20, type: !24)
!27 = !DILocation(line: 20, column: 30, scope: !21)
!28 = !DILocation(line: 22, column: 8, scope: !29)
!29 = distinct !DILexicalBlock(scope: !21, file: !10, line: 22, column: 8)
!30 = !DILocation(line: 22, column: 13, scope: !29)
!31 = !DILocation(line: 22, column: 8, scope: !21)
!32 = !DILocation(line: 24, column: 24, scope: !33)
!33 = distinct !DILexicalBlock(scope: !29, file: !10, line: 23, column: 5)
!34 = !DILocation(line: 24, column: 9, scope: !33)
!35 = !DILocation(line: 25, column: 5, scope: !33)
!36 = !DILocation(line: 26, column: 1, scope: !21)
!37 = distinct !DISubprogram(name: "printIntLine", scope: !10, file: !10, line: 28, type: !38, isLocal: false, isDefinition: true, scopeLine: 29, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!38 = !DISubroutineType(types: !39)
!39 = !{null, !4}
!40 = !DILocalVariable(name: "intNumber", arg: 1, scope: !37, file: !10, line: 28, type: !4)
!41 = !DILocation(line: 28, column: 24, scope: !37)
!42 = !DILocation(line: 30, column: 20, scope: !37)
!43 = !DILocation(line: 30, column: 5, scope: !37)
!44 = !DILocation(line: 31, column: 1, scope: !37)
!45 = distinct !DISubprogram(name: "printLongLine", scope: !10, file: !10, line: 33, type: !46, isLocal: false, isDefinition: true, scopeLine: 34, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!46 = !DISubroutineType(types: !47)
!47 = !{null, !48}
!48 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !49, line: 197, baseType: !50)
!49 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/sys/types.h", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/190")
!50 = !DIBasicType(name: "long int", size: 64, align: 64, encoding: DW_ATE_signed)
!51 = !DILocalVariable(name: "longIntNumber", arg: 1, scope: !45, file: !10, line: 33, type: !48)
!52 = !DILocation(line: 33, column: 29, scope: !45)
!53 = !DILocation(line: 35, column: 21, scope: !45)
!54 = !DILocation(line: 35, column: 5, scope: !45)
!55 = !DILocation(line: 36, column: 1, scope: !45)
!56 = distinct !DISubprogram(name: "badSink", scope: !10, file: !10, line: 39, type: !57, isLocal: false, isDefinition: true, scopeLine: 40, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!57 = !DISubroutineType(types: !58)
!58 = !{null, !59}
!59 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !60, size: 64, align: 64)
!60 = !DIBasicType(name: "short", size: 16, align: 16, encoding: DW_ATE_signed)
!61 = !DILocalVariable(name: "dataArray", arg: 1, scope: !56, file: !10, line: 39, type: !59)
!62 = !DILocation(line: 39, column: 20, scope: !56)
!63 = !DILocalVariable(name: "data", scope: !56, file: !10, line: 42, type: !60)
!64 = !DILocation(line: 42, column: 11, scope: !56)
!65 = !DILocation(line: 42, column: 18, scope: !56)
!66 = !DILocation(line: 43, column: 8, scope: !67)
!67 = distinct !DILexicalBlock(scope: !56, file: !10, line: 43, column: 8)
!68 = !DILocation(line: 43, column: 13, scope: !67)
!69 = !DILocation(line: 43, column: 8, scope: !56)
!70 = !DILocalVariable(name: "result", scope: !71, file: !10, line: 46, type: !60)
!71 = distinct !DILexicalBlock(scope: !67, file: !10, line: 44, column: 5)
!72 = !DILocation(line: 46, column: 15, scope: !71)
!73 = !DILocation(line: 46, column: 24, scope: !71)
!74 = !DILocation(line: 46, column: 29, scope: !71)
!75 = !DILocation(line: 47, column: 22, scope: !71)
!76 = !DILocation(line: 47, column: 9, scope: !71)
!77 = !DILocation(line: 48, column: 5, scope: !71)
!78 = !DILocation(line: 49, column: 1, scope: !56)
!79 = distinct !DISubprogram(name: "goodSink", scope: !10, file: !10, line: 51, type: !57, isLocal: false, isDefinition: true, scopeLine: 52, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!80 = !DILocalVariable(name: "dataArray", arg: 1, scope: !79, file: !10, line: 51, type: !59)
!81 = !DILocation(line: 51, column: 21, scope: !79)
!82 = !DILocalVariable(name: "data", scope: !79, file: !10, line: 53, type: !60)
!83 = !DILocation(line: 53, column: 11, scope: !79)
!84 = !DILocation(line: 53, column: 18, scope: !79)
!85 = !DILocation(line: 54, column: 10, scope: !79)
!86 = !DILocation(line: 55, column: 8, scope: !87)
!87 = distinct !DILexicalBlock(scope: !79, file: !10, line: 55, column: 8)
!88 = !DILocation(line: 55, column: 13, scope: !87)
!89 = !DILocation(line: 55, column: 8, scope: !79)
!90 = !DILocalVariable(name: "result", scope: !91, file: !10, line: 58, type: !60)
!91 = distinct !DILexicalBlock(scope: !87, file: !10, line: 56, column: 5)
!92 = !DILocation(line: 58, column: 15, scope: !91)
!93 = !DILocation(line: 58, column: 24, scope: !91)
!94 = !DILocation(line: 58, column: 29, scope: !91)
!95 = !DILocation(line: 59, column: 22, scope: !91)
!96 = !DILocation(line: 59, column: 9, scope: !91)
!97 = !DILocation(line: 60, column: 5, scope: !91)
!98 = !DILocation(line: 61, column: 1, scope: !79)
!99 = distinct !DISubprogram(name: "bad26", scope: !10, file: !10, line: 63, type: !100, isLocal: false, isDefinition: true, scopeLine: 64, isOptimized: false, unit: !0, variables: !2)
!100 = !DISubroutineType(types: !101)
!101 = !{null}
!102 = !DILocalVariable(name: "data", scope: !99, file: !10, line: 65, type: !60)
!103 = !DILocation(line: 65, column: 11, scope: !99)
!104 = !DILocalVariable(name: "dataArray", scope: !99, file: !10, line: 66, type: !105)
!105 = !DICompositeType(tag: DW_TAG_array_type, baseType: !60, size: 80, align: 16, elements: !106)
!106 = !{!107}
!107 = !DISubrange(count: 5)
!108 = !DILocation(line: 66, column: 11, scope: !99)
!109 = !DILocation(line: 67, column: 10, scope: !99)
!110 = !DILocation(line: 69, column: 13, scope: !99)
!111 = !DILocation(line: 69, column: 5, scope: !99)
!112 = !DILocation(line: 71, column: 20, scope: !99)
!113 = !DILocation(line: 71, column: 5, scope: !99)
!114 = !DILocation(line: 71, column: 18, scope: !99)
!115 = !DILocation(line: 72, column: 13, scope: !99)
!116 = !DILocation(line: 72, column: 5, scope: !99)
!117 = !DILocation(line: 73, column: 1, scope: !99)
!118 = distinct !DISubprogram(name: "good26", scope: !10, file: !10, line: 75, type: !100, isLocal: false, isDefinition: true, scopeLine: 76, isOptimized: false, unit: !0, variables: !2)
!119 = !DILocalVariable(name: "data", scope: !118, file: !10, line: 77, type: !60)
!120 = !DILocation(line: 77, column: 11, scope: !118)
!121 = !DILocalVariable(name: "dataArray", scope: !118, file: !10, line: 78, type: !105)
!122 = !DILocation(line: 78, column: 11, scope: !118)
!123 = !DILocation(line: 79, column: 10, scope: !118)
!124 = !DILocation(line: 81, column: 13, scope: !118)
!125 = !DILocation(line: 81, column: 5, scope: !118)
!126 = !DILocation(line: 82, column: 20, scope: !118)
!127 = !DILocation(line: 82, column: 5, scope: !118)
!128 = !DILocation(line: 82, column: 18, scope: !118)
!129 = !DILocation(line: 83, column: 14, scope: !118)
!130 = !DILocation(line: 83, column: 5, scope: !118)
!131 = !DILocation(line: 84, column: 1, scope: !118)
!132 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 86, type: !133, isLocal: false, isDefinition: true, scopeLine: 86, isOptimized: false, unit: !0, variables: !2)
!133 = !DISubroutineType(types: !134)
!134 = !{!4}
!135 = !DILocation(line: 87, column: 5, scope: !132)
!136 = !DILocation(line: 88, column: 5, scope: !132)
!137 = !DILocation(line: 89, column: 5, scope: !132)
