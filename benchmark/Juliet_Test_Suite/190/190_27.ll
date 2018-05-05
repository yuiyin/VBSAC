; ModuleID = './190_27.c'
source_filename = "./190_27.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.structType = type { i16 }

@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@.str.1 = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1
@.str.2 = private unnamed_addr constant [5 x i8] c"%ld\0A\00", align 1
@.str.3 = private unnamed_addr constant [54 x i8] c"data value is too large to perform arithmetic safely.\00", align 1

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
define void @badSink(i16 %myStruct.coerce) #0 !dbg !56 {
entry:
  %myStruct = alloca %struct.structType, align 2
  %data = alloca i16, align 2
  %result = alloca i16, align 2
  %coerce.dive = getelementptr inbounds %struct.structType, %struct.structType* %myStruct, i32 0, i32 0
  store i16 %myStruct.coerce, i16* %coerce.dive, align 2
  call void @llvm.dbg.declare(metadata %struct.structType* %myStruct, metadata !64, metadata !15), !dbg !65
  call void @llvm.dbg.declare(metadata i16* %data, metadata !66, metadata !15), !dbg !67
  %structFirst = getelementptr inbounds %struct.structType, %struct.structType* %myStruct, i32 0, i32 0, !dbg !68
  %0 = load i16, i16* %structFirst, align 2, !dbg !68
  store i16 %0, i16* %data, align 2, !dbg !67
  call void @llvm.dbg.declare(metadata i16* %result, metadata !69, metadata !15), !dbg !71
  %1 = load i16, i16* %data, align 2, !dbg !72
  %conv = sext i16 %1 to i32, !dbg !72
  %add = add nsw i32 %conv, 1, !dbg !73
  %conv1 = trunc i32 %add to i16, !dbg !72
  store i16 %conv1, i16* %result, align 2, !dbg !71
  %2 = load i16, i16* %result, align 2, !dbg !74
  %conv2 = sext i16 %2 to i32, !dbg !74
  call void @printIntLine(i32 %conv2), !dbg !75
  ret void, !dbg !76
}

; Function Attrs: nounwind uwtable
define void @goodSink(i16 %myStruct.coerce) #0 !dbg !77 {
entry:
  %myStruct = alloca %struct.structType, align 2
  %data = alloca i16, align 2
  %result = alloca i16, align 2
  %coerce.dive = getelementptr inbounds %struct.structType, %struct.structType* %myStruct, i32 0, i32 0
  store i16 %myStruct.coerce, i16* %coerce.dive, align 2
  call void @llvm.dbg.declare(metadata %struct.structType* %myStruct, metadata !78, metadata !15), !dbg !79
  call void @llvm.dbg.declare(metadata i16* %data, metadata !80, metadata !15), !dbg !81
  %structFirst = getelementptr inbounds %struct.structType, %struct.structType* %myStruct, i32 0, i32 0, !dbg !82
  %0 = load i16, i16* %structFirst, align 2, !dbg !82
  store i16 %0, i16* %data, align 2, !dbg !81
  %1 = load i16, i16* %data, align 2, !dbg !83
  %conv = sext i16 %1 to i32, !dbg !83
  %cmp = icmp slt i32 %conv, 32767, !dbg !85
  br i1 %cmp, label %if.then, label %if.else, !dbg !86

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i16* %result, metadata !87, metadata !15), !dbg !89
  %2 = load i16, i16* %data, align 2, !dbg !90
  %conv2 = sext i16 %2 to i32, !dbg !90
  %add = add nsw i32 %conv2, 1, !dbg !91
  %conv3 = trunc i32 %add to i16, !dbg !90
  store i16 %conv3, i16* %result, align 2, !dbg !89
  %3 = load i16, i16* %result, align 2, !dbg !92
  %conv4 = sext i16 %3 to i32, !dbg !92
  call void @printIntLine(i32 %conv4), !dbg !93
  br label %if.end, !dbg !94

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([54 x i8], [54 x i8]* @.str.3, i32 0, i32 0)), !dbg !95
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !97
}

; Function Attrs: nounwind uwtable
define void @bad27() #0 !dbg !98 {
entry:
  %data = alloca i16, align 2
  %myStruct = alloca %struct.structType, align 2
  call void @llvm.dbg.declare(metadata i16* %data, metadata !101, metadata !15), !dbg !102
  call void @llvm.dbg.declare(metadata %struct.structType* %myStruct, metadata !103, metadata !15), !dbg !104
  store i16 0, i16* %data, align 2, !dbg !105
  store i16 32767, i16* %data, align 2, !dbg !106
  %0 = load i16, i16* %data, align 2, !dbg !107
  %structFirst = getelementptr inbounds %struct.structType, %struct.structType* %myStruct, i32 0, i32 0, !dbg !108
  store i16 %0, i16* %structFirst, align 2, !dbg !109
  %coerce.dive = getelementptr inbounds %struct.structType, %struct.structType* %myStruct, i32 0, i32 0, !dbg !110
  %1 = load i16, i16* %coerce.dive, align 2, !dbg !110
  call void @badSink(i16 %1), !dbg !110
  ret void, !dbg !111
}

; Function Attrs: nounwind uwtable
define void @good27() #0 !dbg !112 {
entry:
  %data = alloca i16, align 2
  %myStruct = alloca %struct.structType, align 2
  call void @llvm.dbg.declare(metadata i16* %data, metadata !113, metadata !15), !dbg !114
  call void @llvm.dbg.declare(metadata %struct.structType* %myStruct, metadata !115, metadata !15), !dbg !116
  store i16 0, i16* %data, align 2, !dbg !117
  store i16 32767, i16* %data, align 2, !dbg !118
  %0 = load i16, i16* %data, align 2, !dbg !119
  %structFirst = getelementptr inbounds %struct.structType, %struct.structType* %myStruct, i32 0, i32 0, !dbg !120
  store i16 %0, i16* %structFirst, align 2, !dbg !121
  %coerce.dive = getelementptr inbounds %struct.structType, %struct.structType* %myStruct, i32 0, i32 0, !dbg !122
  %1 = load i16, i16* %coerce.dive, align 2, !dbg !122
  call void @goodSink(i16 %1), !dbg !122
  ret void, !dbg !123
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !124 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @good27(), !dbg !127
  call void @bad27(), !dbg !128
  ret i32 1, !dbg !129
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (tags/RELEASE_390/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3)
!1 = !DIFile(filename: "190_27.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/190")
!2 = !{}
!3 = !{!4, !5}
!4 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64, align: 64)
!6 = !{i32 2, !"Dwarf Version", i32 4}
!7 = !{i32 2, !"Debug Info Version", i32 3}
!8 = !{!"clang version 3.9.0 (tags/RELEASE_390/final)"}
!9 = distinct !DISubprogram(name: "printHexCharLine", scope: !10, file: !10, line: 10, type: !11, isLocal: false, isDefinition: true, scopeLine: 11, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!10 = !DIFile(filename: "./190_27.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/190")
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
!56 = distinct !DISubprogram(name: "badSink", scope: !10, file: !10, line: 39, type: !57, isLocal: false, isDefinition: true, scopeLine: 40, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!57 = !DISubroutineType(types: !58)
!58 = !{null, !59}
!59 = !DIDerivedType(tag: DW_TAG_typedef, name: "structType", file: !10, line: 37, baseType: !60)
!60 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "structType", file: !10, line: 34, size: 16, align: 16, elements: !61)
!61 = !{!62}
!62 = !DIDerivedType(tag: DW_TAG_member, name: "structFirst", scope: !60, file: !10, line: 36, baseType: !63, size: 16, align: 16)
!63 = !DIBasicType(name: "short", size: 16, align: 16, encoding: DW_ATE_signed)
!64 = !DILocalVariable(name: "myStruct", arg: 1, scope: !56, file: !10, line: 39, type: !59)
!65 = !DILocation(line: 39, column: 25, scope: !56)
!66 = !DILocalVariable(name: "data", scope: !56, file: !10, line: 41, type: !63)
!67 = !DILocation(line: 41, column: 11, scope: !56)
!68 = !DILocation(line: 41, column: 27, scope: !56)
!69 = !DILocalVariable(name: "result", scope: !70, file: !10, line: 44, type: !63)
!70 = distinct !DILexicalBlock(scope: !56, file: !10, line: 42, column: 5)
!71 = !DILocation(line: 44, column: 15, scope: !70)
!72 = !DILocation(line: 44, column: 24, scope: !70)
!73 = !DILocation(line: 44, column: 29, scope: !70)
!74 = !DILocation(line: 45, column: 22, scope: !70)
!75 = !DILocation(line: 45, column: 9, scope: !70)
!76 = !DILocation(line: 47, column: 1, scope: !56)
!77 = distinct !DISubprogram(name: "goodSink", scope: !10, file: !10, line: 49, type: !57, isLocal: false, isDefinition: true, scopeLine: 50, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!78 = !DILocalVariable(name: "myStruct", arg: 1, scope: !77, file: !10, line: 49, type: !59)
!79 = !DILocation(line: 49, column: 26, scope: !77)
!80 = !DILocalVariable(name: "data", scope: !77, file: !10, line: 51, type: !63)
!81 = !DILocation(line: 51, column: 11, scope: !77)
!82 = !DILocation(line: 51, column: 27, scope: !77)
!83 = !DILocation(line: 53, column: 9, scope: !84)
!84 = distinct !DILexicalBlock(scope: !77, file: !10, line: 53, column: 9)
!85 = !DILocation(line: 53, column: 14, scope: !84)
!86 = !DILocation(line: 53, column: 9, scope: !77)
!87 = !DILocalVariable(name: "result", scope: !88, file: !10, line: 55, type: !63)
!88 = distinct !DILexicalBlock(scope: !84, file: !10, line: 54, column: 5)
!89 = !DILocation(line: 55, column: 15, scope: !88)
!90 = !DILocation(line: 55, column: 24, scope: !88)
!91 = !DILocation(line: 55, column: 29, scope: !88)
!92 = !DILocation(line: 56, column: 22, scope: !88)
!93 = !DILocation(line: 56, column: 9, scope: !88)
!94 = !DILocation(line: 57, column: 5, scope: !88)
!95 = !DILocation(line: 60, column: 9, scope: !96)
!96 = distinct !DILexicalBlock(scope: !84, file: !10, line: 59, column: 5)
!97 = !DILocation(line: 62, column: 1, scope: !77)
!98 = distinct !DISubprogram(name: "bad27", scope: !10, file: !10, line: 64, type: !99, isLocal: false, isDefinition: true, scopeLine: 65, isOptimized: false, unit: !0, variables: !2)
!99 = !DISubroutineType(types: !100)
!100 = !{null}
!101 = !DILocalVariable(name: "data", scope: !98, file: !10, line: 66, type: !63)
!102 = !DILocation(line: 66, column: 11, scope: !98)
!103 = !DILocalVariable(name: "myStruct", scope: !98, file: !10, line: 67, type: !59)
!104 = !DILocation(line: 67, column: 16, scope: !98)
!105 = !DILocation(line: 68, column: 10, scope: !98)
!106 = !DILocation(line: 70, column: 10, scope: !98)
!107 = !DILocation(line: 71, column: 28, scope: !98)
!108 = !DILocation(line: 71, column: 14, scope: !98)
!109 = !DILocation(line: 71, column: 26, scope: !98)
!110 = !DILocation(line: 72, column: 5, scope: !98)
!111 = !DILocation(line: 73, column: 1, scope: !98)
!112 = distinct !DISubprogram(name: "good27", scope: !10, file: !10, line: 75, type: !99, isLocal: false, isDefinition: true, scopeLine: 76, isOptimized: false, unit: !0, variables: !2)
!113 = !DILocalVariable(name: "data", scope: !112, file: !10, line: 77, type: !63)
!114 = !DILocation(line: 77, column: 11, scope: !112)
!115 = !DILocalVariable(name: "myStruct", scope: !112, file: !10, line: 78, type: !59)
!116 = !DILocation(line: 78, column: 16, scope: !112)
!117 = !DILocation(line: 79, column: 10, scope: !112)
!118 = !DILocation(line: 81, column: 10, scope: !112)
!119 = !DILocation(line: 82, column: 28, scope: !112)
!120 = !DILocation(line: 82, column: 14, scope: !112)
!121 = !DILocation(line: 82, column: 26, scope: !112)
!122 = !DILocation(line: 83, column: 5, scope: !112)
!123 = !DILocation(line: 84, column: 1, scope: !112)
!124 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 86, type: !125, isLocal: false, isDefinition: true, scopeLine: 86, isOptimized: false, unit: !0, variables: !2)
!125 = !DISubroutineType(types: !126)
!126 = !{!4}
!127 = !DILocation(line: 87, column: 5, scope: !124)
!128 = !DILocation(line: 88, column: 5, scope: !124)
!129 = !DILocation(line: 89, column: 5, scope: !124)
