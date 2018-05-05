; ModuleID = './191_44.c'
source_filename = "./191_44.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@.str.1 = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1
@.str.2 = private unnamed_addr constant [5 x i8] c"%ld\0A\00", align 1
@.str.3 = private unnamed_addr constant [4 x i8] c"%u\0A\00", align 1
@stdin = external global %struct._IO_FILE*, align 8
@.str.4 = private unnamed_addr constant [4 x i8] c"%hd\00", align 1
@.str.5 = private unnamed_addr constant [51 x i8] c"data value is too small to perform multiplication.\00", align 1

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
define void @printUnsignedLine(i32 %unsignedNumber) #0 !dbg !56 {
entry:
  %unsignedNumber.addr = alloca i32, align 4
  store i32 %unsignedNumber, i32* %unsignedNumber.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %unsignedNumber.addr, metadata !60, metadata !15), !dbg !61
  %0 = load i32, i32* %unsignedNumber.addr, align 4, !dbg !62
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i32 0, i32 0), i32 %0), !dbg !63
  ret void, !dbg !64
}

; Function Attrs: nounwind uwtable
define void @bad44() #0 !dbg !65 {
entry:
  %data = alloca i16, align 2
  %result = alloca i16, align 2
  call void @llvm.dbg.declare(metadata i16* %data, metadata !68, metadata !15), !dbg !70
  store i16 0, i16* %data, align 2, !dbg !71
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !72
  %call = call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* %0, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.4, i32 0, i32 0), i16* %data), !dbg !75
  %1 = load i16, i16* %data, align 2, !dbg !76
  %conv = sext i16 %1 to i32, !dbg !76
  %cmp = icmp slt i32 %conv, 0, !dbg !80
  br i1 %cmp, label %if.then, label %if.end, !dbg !81

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i16* %result, metadata !82, metadata !15), !dbg !84
  %2 = load i16, i16* %data, align 2, !dbg !85
  %conv2 = sext i16 %2 to i32, !dbg !85
  %mul = mul nsw i32 %conv2, 2, !dbg !86
  %conv3 = trunc i32 %mul to i16, !dbg !85
  store i16 %conv3, i16* %result, align 2, !dbg !84
  %3 = load i16, i16* %result, align 2, !dbg !87
  %conv4 = sext i16 %3 to i32, !dbg !87
  call void @printIntLine(i32 %conv4), !dbg !88
  br label %if.end, !dbg !89

if.end:                                           ; preds = %if.then, %entry
  ret void, !dbg !90
}

declare i32 @__isoc99_fscanf(%struct._IO_FILE*, i8*, ...) #2

; Function Attrs: nounwind uwtable
define void @good44() #0 !dbg !91 {
entry:
  %data = alloca i16, align 2
  %result = alloca i16, align 2
  call void @llvm.dbg.declare(metadata i16* %data, metadata !92, metadata !15), !dbg !93
  store i16 0, i16* %data, align 2, !dbg !94
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !95
  %call = call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* %0, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.4, i32 0, i32 0), i16* %data), !dbg !98
  %1 = load i16, i16* %data, align 2, !dbg !99
  %conv = sext i16 %1 to i32, !dbg !99
  %cmp = icmp slt i32 %conv, 0, !dbg !103
  br i1 %cmp, label %if.then, label %if.end9, !dbg !104

if.then:                                          ; preds = %entry
  %2 = load i16, i16* %data, align 2, !dbg !105
  %conv2 = sext i16 %2 to i32, !dbg !105
  %cmp3 = icmp sgt i32 %conv2, -16384, !dbg !108
  br i1 %cmp3, label %if.then5, label %if.else, !dbg !109

if.then5:                                         ; preds = %if.then
  call void @llvm.dbg.declare(metadata i16* %result, metadata !110, metadata !15), !dbg !112
  %3 = load i16, i16* %data, align 2, !dbg !113
  %conv6 = sext i16 %3 to i32, !dbg !113
  %mul = mul nsw i32 %conv6, 2, !dbg !114
  %conv7 = trunc i32 %mul to i16, !dbg !113
  store i16 %conv7, i16* %result, align 2, !dbg !112
  %4 = load i16, i16* %result, align 2, !dbg !115
  %conv8 = sext i16 %4 to i32, !dbg !115
  call void @printIntLine(i32 %conv8), !dbg !116
  br label %if.end, !dbg !117

if.else:                                          ; preds = %if.then
  call void @printLine(i8* getelementptr inbounds ([51 x i8], [51 x i8]* @.str.5, i32 0, i32 0)), !dbg !118
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then5
  br label %if.end9, !dbg !120

if.end9:                                          ; preds = %if.end, %entry
  ret void, !dbg !121
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !122 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @good44(), !dbg !125
  call void @bad44(), !dbg !126
  ret i32 1, !dbg !127
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (tags/RELEASE_390/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3)
!1 = !DIFile(filename: "191_44.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/191")
!2 = !{}
!3 = !{!4, !5}
!4 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64, align: 64)
!6 = !{i32 2, !"Dwarf Version", i32 4}
!7 = !{i32 2, !"Debug Info Version", i32 3}
!8 = !{!"clang version 3.9.0 (tags/RELEASE_390/final)"}
!9 = distinct !DISubprogram(name: "printHexCharLine", scope: !10, file: !10, line: 10, type: !11, isLocal: false, isDefinition: true, scopeLine: 11, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!10 = !DIFile(filename: "./191_44.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/191")
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
!49 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/sys/types.h", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/191")
!50 = !DIBasicType(name: "long int", size: 64, align: 64, encoding: DW_ATE_signed)
!51 = !DILocalVariable(name: "longIntNumber", arg: 1, scope: !45, file: !10, line: 28, type: !48)
!52 = !DILocation(line: 28, column: 29, scope: !45)
!53 = !DILocation(line: 30, column: 21, scope: !45)
!54 = !DILocation(line: 30, column: 5, scope: !45)
!55 = !DILocation(line: 31, column: 1, scope: !45)
!56 = distinct !DISubprogram(name: "printUnsignedLine", scope: !10, file: !10, line: 33, type: !57, isLocal: false, isDefinition: true, scopeLine: 34, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!57 = !DISubroutineType(types: !58)
!58 = !{null, !59}
!59 = !DIBasicType(name: "unsigned int", size: 32, align: 32, encoding: DW_ATE_unsigned)
!60 = !DILocalVariable(name: "unsignedNumber", arg: 1, scope: !56, file: !10, line: 33, type: !59)
!61 = !DILocation(line: 33, column: 33, scope: !56)
!62 = !DILocation(line: 35, column: 20, scope: !56)
!63 = !DILocation(line: 35, column: 5, scope: !56)
!64 = !DILocation(line: 36, column: 1, scope: !56)
!65 = distinct !DISubprogram(name: "bad44", scope: !10, file: !10, line: 41, type: !66, isLocal: false, isDefinition: true, scopeLine: 42, isOptimized: false, unit: !0, variables: !2)
!66 = !DISubroutineType(types: !67)
!67 = !{null}
!68 = !DILocalVariable(name: "data", scope: !65, file: !10, line: 43, type: !69)
!69 = !DIBasicType(name: "short", size: 16, align: 16, encoding: DW_ATE_signed)
!70 = !DILocation(line: 43, column: 11, scope: !65)
!71 = !DILocation(line: 44, column: 10, scope: !65)
!72 = !DILocation(line: 48, column: 17, scope: !73)
!73 = distinct !DILexicalBlock(scope: !74, file: !10, line: 46, column: 5)
!74 = distinct !DILexicalBlock(scope: !65, file: !10, line: 45, column: 8)
!75 = !DILocation(line: 48, column: 9, scope: !73)
!76 = !DILocation(line: 52, column: 12, scope: !77)
!77 = distinct !DILexicalBlock(scope: !78, file: !10, line: 52, column: 12)
!78 = distinct !DILexicalBlock(scope: !79, file: !10, line: 51, column: 5)
!79 = distinct !DILexicalBlock(scope: !65, file: !10, line: 50, column: 8)
!80 = !DILocation(line: 52, column: 17, scope: !77)
!81 = !DILocation(line: 52, column: 12, scope: !78)
!82 = !DILocalVariable(name: "result", scope: !83, file: !10, line: 55, type: !69)
!83 = distinct !DILexicalBlock(scope: !77, file: !10, line: 53, column: 9)
!84 = !DILocation(line: 55, column: 19, scope: !83)
!85 = !DILocation(line: 55, column: 28, scope: !83)
!86 = !DILocation(line: 55, column: 33, scope: !83)
!87 = !DILocation(line: 56, column: 26, scope: !83)
!88 = !DILocation(line: 56, column: 13, scope: !83)
!89 = !DILocation(line: 57, column: 9, scope: !83)
!90 = !DILocation(line: 59, column: 1, scope: !65)
!91 = distinct !DISubprogram(name: "good44", scope: !10, file: !10, line: 64, type: !66, isLocal: false, isDefinition: true, scopeLine: 65, isOptimized: false, unit: !0, variables: !2)
!92 = !DILocalVariable(name: "data", scope: !91, file: !10, line: 66, type: !69)
!93 = !DILocation(line: 66, column: 11, scope: !91)
!94 = !DILocation(line: 67, column: 10, scope: !91)
!95 = !DILocation(line: 71, column: 17, scope: !96)
!96 = distinct !DILexicalBlock(scope: !97, file: !10, line: 69, column: 5)
!97 = distinct !DILexicalBlock(scope: !91, file: !10, line: 68, column: 8)
!98 = !DILocation(line: 71, column: 9, scope: !96)
!99 = !DILocation(line: 80, column: 12, scope: !100)
!100 = distinct !DILexicalBlock(scope: !101, file: !10, line: 80, column: 12)
!101 = distinct !DILexicalBlock(scope: !102, file: !10, line: 79, column: 5)
!102 = distinct !DILexicalBlock(scope: !91, file: !10, line: 73, column: 8)
!103 = !DILocation(line: 80, column: 17, scope: !100)
!104 = !DILocation(line: 80, column: 12, scope: !101)
!105 = !DILocation(line: 83, column: 17, scope: !106)
!106 = distinct !DILexicalBlock(scope: !107, file: !10, line: 83, column: 17)
!107 = distinct !DILexicalBlock(scope: !100, file: !10, line: 81, column: 9)
!108 = !DILocation(line: 83, column: 22, scope: !106)
!109 = !DILocation(line: 83, column: 17, scope: !107)
!110 = !DILocalVariable(name: "result", scope: !111, file: !10, line: 85, type: !69)
!111 = distinct !DILexicalBlock(scope: !106, file: !10, line: 84, column: 13)
!112 = !DILocation(line: 85, column: 23, scope: !111)
!113 = !DILocation(line: 85, column: 32, scope: !111)
!114 = !DILocation(line: 85, column: 37, scope: !111)
!115 = !DILocation(line: 86, column: 30, scope: !111)
!116 = !DILocation(line: 86, column: 17, scope: !111)
!117 = !DILocation(line: 87, column: 13, scope: !111)
!118 = !DILocation(line: 90, column: 17, scope: !119)
!119 = distinct !DILexicalBlock(scope: !106, file: !10, line: 89, column: 13)
!120 = !DILocation(line: 92, column: 9, scope: !107)
!121 = !DILocation(line: 94, column: 1, scope: !91)
!122 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 99, type: !123, isLocal: false, isDefinition: true, scopeLine: 99, isOptimized: false, unit: !0, variables: !2)
!123 = !DISubroutineType(types: !124)
!124 = !{!4}
!125 = !DILocation(line: 100, column: 2, scope: !122)
!126 = !DILocation(line: 101, column: 5, scope: !122)
!127 = !DILocation(line: 102, column: 5, scope: !122)
