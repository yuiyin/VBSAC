; ModuleID = './190_28.c'
source_filename = "./190_28.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@.str.1 = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1
@.str.2 = private unnamed_addr constant [5 x i8] c"%ld\0A\00", align 1
@.str.3 = private unnamed_addr constant [54 x i8] c"data value is too large to perform arithmetic safely.\00", align 1

; Function Attrs: nounwind uwtable
define void @printHexCharLine(i8 signext %charHex) #0 !dbg !11 {
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
define void @badSink(i8* %dataVoidPtr) #0 !dbg !58 {
entry:
  %dataVoidPtr.addr = alloca i8*, align 8
  %dataPtr = alloca i16*, align 8
  %data = alloca i16, align 2
  %result = alloca i16, align 2
  store i8* %dataVoidPtr, i8** %dataVoidPtr.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %dataVoidPtr.addr, metadata !61, metadata !17), !dbg !62
  call void @llvm.dbg.declare(metadata i16** %dataPtr, metadata !63, metadata !17), !dbg !64
  %0 = load i8*, i8** %dataVoidPtr.addr, align 8, !dbg !65
  %1 = bitcast i8* %0 to i16*, !dbg !66
  store i16* %1, i16** %dataPtr, align 8, !dbg !64
  call void @llvm.dbg.declare(metadata i16* %data, metadata !67, metadata !17), !dbg !68
  %2 = load i16*, i16** %dataPtr, align 8, !dbg !69
  %3 = load i16, i16* %2, align 2, !dbg !70
  store i16 %3, i16* %data, align 2, !dbg !68
  %4 = load i16, i16* %data, align 2, !dbg !71
  %conv = sext i16 %4 to i32, !dbg !71
  %cmp = icmp sgt i32 %conv, 0, !dbg !73
  br i1 %cmp, label %if.then, label %if.end, !dbg !74

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i16* %result, metadata !75, metadata !17), !dbg !77
  %5 = load i16, i16* %data, align 2, !dbg !78
  %conv2 = sext i16 %5 to i32, !dbg !78
  %mul = mul nsw i32 %conv2, 2, !dbg !79
  %conv3 = trunc i32 %mul to i16, !dbg !78
  store i16 %conv3, i16* %result, align 2, !dbg !77
  %6 = load i16, i16* %result, align 2, !dbg !80
  %conv4 = sext i16 %6 to i32, !dbg !80
  call void @printIntLine(i32 %conv4), !dbg !81
  br label %if.end, !dbg !82

if.end:                                           ; preds = %if.then, %entry
  ret void, !dbg !83
}

; Function Attrs: nounwind uwtable
define void @goodSink(i8* %dataVoidPtr) #0 !dbg !84 {
entry:
  %dataVoidPtr.addr = alloca i8*, align 8
  %dataPtr = alloca i16*, align 8
  %data = alloca i16, align 2
  %result = alloca i16, align 2
  store i8* %dataVoidPtr, i8** %dataVoidPtr.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %dataVoidPtr.addr, metadata !85, metadata !17), !dbg !86
  call void @llvm.dbg.declare(metadata i16** %dataPtr, metadata !87, metadata !17), !dbg !88
  %0 = load i8*, i8** %dataVoidPtr.addr, align 8, !dbg !89
  %1 = bitcast i8* %0 to i16*, !dbg !90
  store i16* %1, i16** %dataPtr, align 8, !dbg !88
  call void @llvm.dbg.declare(metadata i16* %data, metadata !91, metadata !17), !dbg !92
  %2 = load i16*, i16** %dataPtr, align 8, !dbg !93
  %3 = load i16, i16* %2, align 2, !dbg !94
  store i16 %3, i16* %data, align 2, !dbg !92
  %4 = load i16, i16* %data, align 2, !dbg !95
  %conv = sext i16 %4 to i32, !dbg !95
  %cmp = icmp sgt i32 %conv, 0, !dbg !97
  br i1 %cmp, label %if.then, label %if.end9, !dbg !98

if.then:                                          ; preds = %entry
  %5 = load i16, i16* %data, align 2, !dbg !99
  %conv2 = sext i16 %5 to i32, !dbg !99
  %cmp3 = icmp slt i32 %conv2, 16383, !dbg !102
  br i1 %cmp3, label %if.then5, label %if.else, !dbg !103

if.then5:                                         ; preds = %if.then
  call void @llvm.dbg.declare(metadata i16* %result, metadata !104, metadata !17), !dbg !106
  %6 = load i16, i16* %data, align 2, !dbg !107
  %conv6 = sext i16 %6 to i32, !dbg !107
  %mul = mul nsw i32 %conv6, 2, !dbg !108
  %conv7 = trunc i32 %mul to i16, !dbg !107
  store i16 %conv7, i16* %result, align 2, !dbg !106
  %7 = load i16, i16* %result, align 2, !dbg !109
  %conv8 = sext i16 %7 to i32, !dbg !109
  call void @printIntLine(i32 %conv8), !dbg !110
  br label %if.end, !dbg !111

if.else:                                          ; preds = %if.then
  call void @printLine(i8* getelementptr inbounds ([54 x i8], [54 x i8]* @.str.3, i32 0, i32 0)), !dbg !112
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then5
  br label %if.end9, !dbg !114

if.end9:                                          ; preds = %if.end, %entry
  ret void, !dbg !115
}

; Function Attrs: nounwind uwtable
define void @bad28() #0 !dbg !116 {
entry:
  %data = alloca i16, align 2
  call void @llvm.dbg.declare(metadata i16* %data, metadata !119, metadata !17), !dbg !120
  store i16 0, i16* %data, align 2, !dbg !121
  store i16 32767, i16* %data, align 2, !dbg !122
  %0 = bitcast i16* %data to i8*, !dbg !123
  call void @badSink(i8* %0), !dbg !124
  ret void, !dbg !125
}

; Function Attrs: nounwind uwtable
define void @good28() #0 !dbg !126 {
entry:
  %data = alloca i16, align 2
  call void @llvm.dbg.declare(metadata i16* %data, metadata !127, metadata !17), !dbg !128
  store i16 0, i16* %data, align 2, !dbg !129
  store i16 32767, i16* %data, align 2, !dbg !130
  %0 = bitcast i16* %data to i8*, !dbg !131
  call void @goodSink(i8* %0), !dbg !132
  ret void, !dbg !133
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !134 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @good28(), !dbg !137
  call void @bad28(), !dbg !138
  ret i32 1, !dbg !139
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (tags/RELEASE_390/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3)
!1 = !DIFile(filename: "190_28.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/190")
!2 = !{}
!3 = !{!4, !5, !6}
!4 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64, align: 64)
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64, align: 64)
!7 = !DIBasicType(name: "short", size: 16, align: 16, encoding: DW_ATE_signed)
!8 = !{i32 2, !"Dwarf Version", i32 4}
!9 = !{i32 2, !"Debug Info Version", i32 3}
!10 = !{!"clang version 3.9.0 (tags/RELEASE_390/final)"}
!11 = distinct !DISubprogram(name: "printHexCharLine", scope: !12, file: !12, line: 10, type: !13, isLocal: false, isDefinition: true, scopeLine: 11, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!12 = !DIFile(filename: "./190_28.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/190")
!13 = !DISubroutineType(types: !14)
!14 = !{null, !15}
!15 = !DIBasicType(name: "char", size: 8, align: 8, encoding: DW_ATE_signed_char)
!16 = !DILocalVariable(name: "charHex", arg: 1, scope: !11, file: !12, line: 10, type: !15)
!17 = !DIExpression()
!18 = !DILocation(line: 10, column: 29, scope: !11)
!19 = !DILocation(line: 12, column: 25, scope: !11)
!20 = !DILocation(line: 12, column: 20, scope: !11)
!21 = !DILocation(line: 12, column: 5, scope: !11)
!22 = !DILocation(line: 13, column: 1, scope: !11)
!23 = distinct !DISubprogram(name: "printLine", scope: !12, file: !12, line: 15, type: !24, isLocal: false, isDefinition: true, scopeLine: 16, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!24 = !DISubroutineType(types: !25)
!25 = !{null, !26}
!26 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !27, size: 64, align: 64)
!27 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !15)
!28 = !DILocalVariable(name: "line", arg: 1, scope: !23, file: !12, line: 15, type: !26)
!29 = !DILocation(line: 15, column: 30, scope: !23)
!30 = !DILocation(line: 17, column: 8, scope: !31)
!31 = distinct !DILexicalBlock(scope: !23, file: !12, line: 17, column: 8)
!32 = !DILocation(line: 17, column: 13, scope: !31)
!33 = !DILocation(line: 17, column: 8, scope: !23)
!34 = !DILocation(line: 19, column: 24, scope: !35)
!35 = distinct !DILexicalBlock(scope: !31, file: !12, line: 18, column: 5)
!36 = !DILocation(line: 19, column: 9, scope: !35)
!37 = !DILocation(line: 20, column: 5, scope: !35)
!38 = !DILocation(line: 21, column: 1, scope: !23)
!39 = distinct !DISubprogram(name: "printIntLine", scope: !12, file: !12, line: 23, type: !40, isLocal: false, isDefinition: true, scopeLine: 24, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!40 = !DISubroutineType(types: !41)
!41 = !{null, !4}
!42 = !DILocalVariable(name: "intNumber", arg: 1, scope: !39, file: !12, line: 23, type: !4)
!43 = !DILocation(line: 23, column: 24, scope: !39)
!44 = !DILocation(line: 25, column: 20, scope: !39)
!45 = !DILocation(line: 25, column: 5, scope: !39)
!46 = !DILocation(line: 26, column: 1, scope: !39)
!47 = distinct !DISubprogram(name: "printLongLine", scope: !12, file: !12, line: 28, type: !48, isLocal: false, isDefinition: true, scopeLine: 29, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!48 = !DISubroutineType(types: !49)
!49 = !{null, !50}
!50 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !51, line: 197, baseType: !52)
!51 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/sys/types.h", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/190")
!52 = !DIBasicType(name: "long int", size: 64, align: 64, encoding: DW_ATE_signed)
!53 = !DILocalVariable(name: "longIntNumber", arg: 1, scope: !47, file: !12, line: 28, type: !50)
!54 = !DILocation(line: 28, column: 29, scope: !47)
!55 = !DILocation(line: 30, column: 21, scope: !47)
!56 = !DILocation(line: 30, column: 5, scope: !47)
!57 = !DILocation(line: 31, column: 1, scope: !47)
!58 = distinct !DISubprogram(name: "badSink", scope: !12, file: !12, line: 39, type: !59, isLocal: false, isDefinition: true, scopeLine: 40, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!59 = !DISubroutineType(types: !60)
!60 = !{null, !5}
!61 = !DILocalVariable(name: "dataVoidPtr", arg: 1, scope: !58, file: !12, line: 39, type: !5)
!62 = !DILocation(line: 39, column: 21, scope: !58)
!63 = !DILocalVariable(name: "dataPtr", scope: !58, file: !12, line: 42, type: !6)
!64 = !DILocation(line: 42, column: 13, scope: !58)
!65 = !DILocation(line: 42, column: 32, scope: !58)
!66 = !DILocation(line: 42, column: 23, scope: !58)
!67 = !DILocalVariable(name: "data", scope: !58, file: !12, line: 44, type: !7)
!68 = !DILocation(line: 44, column: 11, scope: !58)
!69 = !DILocation(line: 44, column: 20, scope: !58)
!70 = !DILocation(line: 44, column: 19, scope: !58)
!71 = !DILocation(line: 45, column: 8, scope: !72)
!72 = distinct !DILexicalBlock(scope: !58, file: !12, line: 45, column: 8)
!73 = !DILocation(line: 45, column: 13, scope: !72)
!74 = !DILocation(line: 45, column: 8, scope: !58)
!75 = !DILocalVariable(name: "result", scope: !76, file: !12, line: 48, type: !7)
!76 = distinct !DILexicalBlock(scope: !72, file: !12, line: 46, column: 5)
!77 = !DILocation(line: 48, column: 15, scope: !76)
!78 = !DILocation(line: 48, column: 24, scope: !76)
!79 = !DILocation(line: 48, column: 29, scope: !76)
!80 = !DILocation(line: 49, column: 22, scope: !76)
!81 = !DILocation(line: 49, column: 9, scope: !76)
!82 = !DILocation(line: 50, column: 5, scope: !76)
!83 = !DILocation(line: 51, column: 1, scope: !58)
!84 = distinct !DISubprogram(name: "goodSink", scope: !12, file: !12, line: 53, type: !59, isLocal: false, isDefinition: true, scopeLine: 54, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!85 = !DILocalVariable(name: "dataVoidPtr", arg: 1, scope: !84, file: !12, line: 53, type: !5)
!86 = !DILocation(line: 53, column: 22, scope: !84)
!87 = !DILocalVariable(name: "dataPtr", scope: !84, file: !12, line: 56, type: !6)
!88 = !DILocation(line: 56, column: 13, scope: !84)
!89 = !DILocation(line: 56, column: 32, scope: !84)
!90 = !DILocation(line: 56, column: 23, scope: !84)
!91 = !DILocalVariable(name: "data", scope: !84, file: !12, line: 58, type: !7)
!92 = !DILocation(line: 58, column: 11, scope: !84)
!93 = !DILocation(line: 58, column: 20, scope: !84)
!94 = !DILocation(line: 58, column: 19, scope: !84)
!95 = !DILocation(line: 59, column: 8, scope: !96)
!96 = distinct !DILexicalBlock(scope: !84, file: !12, line: 59, column: 8)
!97 = !DILocation(line: 59, column: 13, scope: !96)
!98 = !DILocation(line: 59, column: 8, scope: !84)
!99 = !DILocation(line: 62, column: 13, scope: !100)
!100 = distinct !DILexicalBlock(scope: !101, file: !12, line: 62, column: 13)
!101 = distinct !DILexicalBlock(scope: !96, file: !12, line: 60, column: 5)
!102 = !DILocation(line: 62, column: 18, scope: !100)
!103 = !DILocation(line: 62, column: 13, scope: !101)
!104 = !DILocalVariable(name: "result", scope: !105, file: !12, line: 64, type: !7)
!105 = distinct !DILexicalBlock(scope: !100, file: !12, line: 63, column: 9)
!106 = !DILocation(line: 64, column: 19, scope: !105)
!107 = !DILocation(line: 64, column: 28, scope: !105)
!108 = !DILocation(line: 64, column: 33, scope: !105)
!109 = !DILocation(line: 65, column: 26, scope: !105)
!110 = !DILocation(line: 65, column: 13, scope: !105)
!111 = !DILocation(line: 66, column: 9, scope: !105)
!112 = !DILocation(line: 69, column: 13, scope: !113)
!113 = distinct !DILexicalBlock(scope: !100, file: !12, line: 68, column: 9)
!114 = !DILocation(line: 71, column: 5, scope: !101)
!115 = !DILocation(line: 72, column: 1, scope: !84)
!116 = distinct !DISubprogram(name: "bad28", scope: !12, file: !12, line: 74, type: !117, isLocal: false, isDefinition: true, scopeLine: 75, isOptimized: false, unit: !0, variables: !2)
!117 = !DISubroutineType(types: !118)
!118 = !{null}
!119 = !DILocalVariable(name: "data", scope: !116, file: !12, line: 76, type: !7)
!120 = !DILocation(line: 76, column: 11, scope: !116)
!121 = !DILocation(line: 77, column: 10, scope: !116)
!122 = !DILocation(line: 79, column: 10, scope: !116)
!123 = !DILocation(line: 80, column: 13, scope: !116)
!124 = !DILocation(line: 80, column: 5, scope: !116)
!125 = !DILocation(line: 81, column: 1, scope: !116)
!126 = distinct !DISubprogram(name: "good28", scope: !12, file: !12, line: 83, type: !117, isLocal: false, isDefinition: true, scopeLine: 84, isOptimized: false, unit: !0, variables: !2)
!127 = !DILocalVariable(name: "data", scope: !126, file: !12, line: 85, type: !7)
!128 = !DILocation(line: 85, column: 11, scope: !126)
!129 = !DILocation(line: 86, column: 10, scope: !126)
!130 = !DILocation(line: 88, column: 10, scope: !126)
!131 = !DILocation(line: 89, column: 14, scope: !126)
!132 = !DILocation(line: 89, column: 5, scope: !126)
!133 = !DILocation(line: 90, column: 1, scope: !126)
!134 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 92, type: !135, isLocal: false, isDefinition: true, scopeLine: 92, isOptimized: false, unit: !0, variables: !2)
!135 = !DISubroutineType(types: !136)
!136 = !{!4}
!137 = !DILocation(line: 93, column: 5, scope: !134)
!138 = !DILocation(line: 94, column: 5, scope: !134)
!139 = !DILocation(line: 95, column: 5, scope: !134)
