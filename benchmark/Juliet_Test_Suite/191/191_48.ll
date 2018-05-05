; ModuleID = './191_48.c'
source_filename = "./191_48.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@.str.1 = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1
@.str.2 = private unnamed_addr constant [5 x i8] c"%ld\0A\00", align 1
@.str.3 = private unnamed_addr constant [4 x i8] c"%u\0A\00", align 1
@staticFive = internal global i32 5, align 4
@stdin = external global %struct._IO_FILE*, align 8
@.str.4 = private unnamed_addr constant [4 x i8] c"%hd\00", align 1
@.str.5 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@.str.6 = private unnamed_addr constant [51 x i8] c"data value is too small to perform multiplication.\00", align 1

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
define void @printUnsignedLine(i32 %unsignedNumber) #0 !dbg !58 {
entry:
  %unsignedNumber.addr = alloca i32, align 4
  store i32 %unsignedNumber, i32* %unsignedNumber.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %unsignedNumber.addr, metadata !62, metadata !17), !dbg !63
  %0 = load i32, i32* %unsignedNumber.addr, align 4, !dbg !64
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i32 0, i32 0), i32 %0), !dbg !65
  ret void, !dbg !66
}

; Function Attrs: nounwind uwtable
define void @bad48() #0 !dbg !67 {
entry:
  %data = alloca i16, align 2
  %result = alloca i16, align 2
  call void @llvm.dbg.declare(metadata i16* %data, metadata !70, metadata !17), !dbg !72
  store i16 0, i16* %data, align 2, !dbg !73
  %0 = load i32, i32* @staticFive, align 4, !dbg !74
  %cmp = icmp eq i32 %0, 5, !dbg !76
  br i1 %cmp, label %if.then, label %if.end, !dbg !77

if.then:                                          ; preds = %entry
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !78
  %call = call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.4, i32 0, i32 0), i16* %data), !dbg !80
  br label %if.end, !dbg !81

if.end:                                           ; preds = %if.then, %entry
  %2 = load i32, i32* @staticFive, align 4, !dbg !82
  %cmp1 = icmp eq i32 %2, 5, !dbg !84
  br i1 %cmp1, label %if.then2, label %if.end10, !dbg !85

if.then2:                                         ; preds = %if.end
  %3 = load i16, i16* %data, align 2, !dbg !86
  %conv = sext i16 %3 to i32, !dbg !86
  %cmp3 = icmp slt i32 %conv, 0, !dbg !89
  br i1 %cmp3, label %if.then5, label %if.end9, !dbg !90

if.then5:                                         ; preds = %if.then2
  call void @llvm.dbg.declare(metadata i16* %result, metadata !91, metadata !17), !dbg !93
  %4 = load i16, i16* %data, align 2, !dbg !94
  %conv6 = sext i16 %4 to i32, !dbg !94
  %mul = mul nsw i32 %conv6, 2, !dbg !95
  %conv7 = trunc i32 %mul to i16, !dbg !94
  store i16 %conv7, i16* %result, align 2, !dbg !93
  %5 = load i16, i16* %result, align 2, !dbg !96
  %conv8 = sext i16 %5 to i32, !dbg !96
  call void @printIntLine(i32 %conv8), !dbg !97
  br label %if.end9, !dbg !98

if.end9:                                          ; preds = %if.then5, %if.then2
  br label %if.end10, !dbg !99

if.end10:                                         ; preds = %if.end9, %if.end
  ret void, !dbg !100
}

declare i32 @__isoc99_fscanf(%struct._IO_FILE*, i8*, ...) #2

; Function Attrs: nounwind uwtable
define void @good48() #0 !dbg !101 {
entry:
  %data = alloca i16, align 2
  %result = alloca i16, align 2
  call void @llvm.dbg.declare(metadata i16* %data, metadata !102, metadata !17), !dbg !103
  store i16 0, i16* %data, align 2, !dbg !104
  %0 = load i32, i32* @staticFive, align 4, !dbg !105
  %cmp = icmp eq i32 %0, 5, !dbg !107
  br i1 %cmp, label %if.then, label %if.end, !dbg !108

if.then:                                          ; preds = %entry
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !109
  %call = call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.4, i32 0, i32 0), i16* %data), !dbg !111
  br label %if.end, !dbg !112

if.end:                                           ; preds = %if.then, %entry
  %2 = load i32, i32* @staticFive, align 4, !dbg !113
  %cmp1 = icmp ne i32 %2, 5, !dbg !115
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !116

if.then2:                                         ; preds = %if.end
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.5, i32 0, i32 0)), !dbg !117
  br label %if.end16, !dbg !119

if.else:                                          ; preds = %if.end
  %3 = load i16, i16* %data, align 2, !dbg !120
  %conv = sext i16 %3 to i32, !dbg !120
  %cmp3 = icmp slt i32 %conv, 0, !dbg !123
  br i1 %cmp3, label %if.then5, label %if.end15, !dbg !124

if.then5:                                         ; preds = %if.else
  %4 = load i16, i16* %data, align 2, !dbg !125
  %conv6 = sext i16 %4 to i32, !dbg !125
  %cmp7 = icmp sgt i32 %conv6, -16384, !dbg !128
  br i1 %cmp7, label %if.then9, label %if.else13, !dbg !129

if.then9:                                         ; preds = %if.then5
  call void @llvm.dbg.declare(metadata i16* %result, metadata !130, metadata !17), !dbg !132
  %5 = load i16, i16* %data, align 2, !dbg !133
  %conv10 = sext i16 %5 to i32, !dbg !133
  %mul = mul nsw i32 %conv10, 2, !dbg !134
  %conv11 = trunc i32 %mul to i16, !dbg !133
  store i16 %conv11, i16* %result, align 2, !dbg !132
  %6 = load i16, i16* %result, align 2, !dbg !135
  %conv12 = sext i16 %6 to i32, !dbg !135
  call void @printIntLine(i32 %conv12), !dbg !136
  br label %if.end14, !dbg !137

if.else13:                                        ; preds = %if.then5
  call void @printLine(i8* getelementptr inbounds ([51 x i8], [51 x i8]* @.str.6, i32 0, i32 0)), !dbg !138
  br label %if.end14

if.end14:                                         ; preds = %if.else13, %if.then9
  br label %if.end15, !dbg !140

if.end15:                                         ; preds = %if.end14, %if.else
  br label %if.end16

if.end16:                                         ; preds = %if.end15, %if.then2
  ret void, !dbg !141
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !142 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @good48(), !dbg !145
  call void @bad48(), !dbg !146
  ret i32 1, !dbg !147
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!9, !10}
!llvm.ident = !{!11}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (tags/RELEASE_390/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, globals: !6)
!1 = !DIFile(filename: "191_48.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/191")
!2 = !{}
!3 = !{!4, !5}
!4 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64, align: 64)
!6 = !{!7}
!7 = distinct !DIGlobalVariable(name: "staticFive", scope: !0, file: !8, line: 39, type: !4, isLocal: true, isDefinition: true, variable: i32* @staticFive)
!8 = !DIFile(filename: "./191_48.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/191")
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
!51 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/sys/types.h", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/191")
!52 = !DIBasicType(name: "long int", size: 64, align: 64, encoding: DW_ATE_signed)
!53 = !DILocalVariable(name: "longIntNumber", arg: 1, scope: !47, file: !8, line: 28, type: !50)
!54 = !DILocation(line: 28, column: 29, scope: !47)
!55 = !DILocation(line: 30, column: 21, scope: !47)
!56 = !DILocation(line: 30, column: 5, scope: !47)
!57 = !DILocation(line: 31, column: 1, scope: !47)
!58 = distinct !DISubprogram(name: "printUnsignedLine", scope: !8, file: !8, line: 33, type: !59, isLocal: false, isDefinition: true, scopeLine: 34, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!59 = !DISubroutineType(types: !60)
!60 = !{null, !61}
!61 = !DIBasicType(name: "unsigned int", size: 32, align: 32, encoding: DW_ATE_unsigned)
!62 = !DILocalVariable(name: "unsignedNumber", arg: 1, scope: !58, file: !8, line: 33, type: !61)
!63 = !DILocation(line: 33, column: 33, scope: !58)
!64 = !DILocation(line: 35, column: 20, scope: !58)
!65 = !DILocation(line: 35, column: 5, scope: !58)
!66 = !DILocation(line: 36, column: 1, scope: !58)
!67 = distinct !DISubprogram(name: "bad48", scope: !8, file: !8, line: 43, type: !68, isLocal: false, isDefinition: true, scopeLine: 44, isOptimized: false, unit: !0, variables: !2)
!68 = !DISubroutineType(types: !69)
!69 = !{null}
!70 = !DILocalVariable(name: "data", scope: !67, file: !8, line: 45, type: !71)
!71 = !DIBasicType(name: "short", size: 16, align: 16, encoding: DW_ATE_signed)
!72 = !DILocation(line: 45, column: 11, scope: !67)
!73 = !DILocation(line: 46, column: 10, scope: !67)
!74 = !DILocation(line: 47, column: 8, scope: !75)
!75 = distinct !DILexicalBlock(scope: !67, file: !8, line: 47, column: 8)
!76 = !DILocation(line: 47, column: 18, scope: !75)
!77 = !DILocation(line: 47, column: 8, scope: !67)
!78 = !DILocation(line: 50, column: 17, scope: !79)
!79 = distinct !DILexicalBlock(scope: !75, file: !8, line: 48, column: 5)
!80 = !DILocation(line: 50, column: 9, scope: !79)
!81 = !DILocation(line: 51, column: 5, scope: !79)
!82 = !DILocation(line: 52, column: 8, scope: !83)
!83 = distinct !DILexicalBlock(scope: !67, file: !8, line: 52, column: 8)
!84 = !DILocation(line: 52, column: 18, scope: !83)
!85 = !DILocation(line: 52, column: 8, scope: !67)
!86 = !DILocation(line: 54, column: 12, scope: !87)
!87 = distinct !DILexicalBlock(scope: !88, file: !8, line: 54, column: 12)
!88 = distinct !DILexicalBlock(scope: !83, file: !8, line: 53, column: 5)
!89 = !DILocation(line: 54, column: 17, scope: !87)
!90 = !DILocation(line: 54, column: 12, scope: !88)
!91 = !DILocalVariable(name: "result", scope: !92, file: !8, line: 57, type: !71)
!92 = distinct !DILexicalBlock(scope: !87, file: !8, line: 55, column: 9)
!93 = !DILocation(line: 57, column: 19, scope: !92)
!94 = !DILocation(line: 57, column: 28, scope: !92)
!95 = !DILocation(line: 57, column: 33, scope: !92)
!96 = !DILocation(line: 58, column: 26, scope: !92)
!97 = !DILocation(line: 58, column: 13, scope: !92)
!98 = !DILocation(line: 59, column: 9, scope: !92)
!99 = !DILocation(line: 60, column: 5, scope: !88)
!100 = !DILocation(line: 61, column: 1, scope: !67)
!101 = distinct !DISubprogram(name: "good48", scope: !8, file: !8, line: 67, type: !68, isLocal: false, isDefinition: true, scopeLine: 68, isOptimized: false, unit: !0, variables: !2)
!102 = !DILocalVariable(name: "data", scope: !101, file: !8, line: 69, type: !71)
!103 = !DILocation(line: 69, column: 11, scope: !101)
!104 = !DILocation(line: 70, column: 10, scope: !101)
!105 = !DILocation(line: 71, column: 8, scope: !106)
!106 = distinct !DILexicalBlock(scope: !101, file: !8, line: 71, column: 8)
!107 = !DILocation(line: 71, column: 18, scope: !106)
!108 = !DILocation(line: 71, column: 8, scope: !101)
!109 = !DILocation(line: 74, column: 17, scope: !110)
!110 = distinct !DILexicalBlock(scope: !106, file: !8, line: 72, column: 5)
!111 = !DILocation(line: 74, column: 9, scope: !110)
!112 = !DILocation(line: 75, column: 5, scope: !110)
!113 = !DILocation(line: 76, column: 8, scope: !114)
!114 = distinct !DILexicalBlock(scope: !101, file: !8, line: 76, column: 8)
!115 = !DILocation(line: 76, column: 18, scope: !114)
!116 = !DILocation(line: 76, column: 8, scope: !101)
!117 = !DILocation(line: 79, column: 9, scope: !118)
!118 = distinct !DILexicalBlock(scope: !114, file: !8, line: 77, column: 5)
!119 = !DILocation(line: 80, column: 5, scope: !118)
!120 = !DILocation(line: 83, column: 12, scope: !121)
!121 = distinct !DILexicalBlock(scope: !122, file: !8, line: 83, column: 12)
!122 = distinct !DILexicalBlock(scope: !114, file: !8, line: 82, column: 5)
!123 = !DILocation(line: 83, column: 17, scope: !121)
!124 = !DILocation(line: 83, column: 12, scope: !122)
!125 = !DILocation(line: 86, column: 17, scope: !126)
!126 = distinct !DILexicalBlock(scope: !127, file: !8, line: 86, column: 17)
!127 = distinct !DILexicalBlock(scope: !121, file: !8, line: 84, column: 9)
!128 = !DILocation(line: 86, column: 22, scope: !126)
!129 = !DILocation(line: 86, column: 17, scope: !127)
!130 = !DILocalVariable(name: "result", scope: !131, file: !8, line: 88, type: !71)
!131 = distinct !DILexicalBlock(scope: !126, file: !8, line: 87, column: 13)
!132 = !DILocation(line: 88, column: 23, scope: !131)
!133 = !DILocation(line: 88, column: 32, scope: !131)
!134 = !DILocation(line: 88, column: 37, scope: !131)
!135 = !DILocation(line: 89, column: 30, scope: !131)
!136 = !DILocation(line: 89, column: 17, scope: !131)
!137 = !DILocation(line: 90, column: 13, scope: !131)
!138 = !DILocation(line: 93, column: 17, scope: !139)
!139 = distinct !DILexicalBlock(scope: !126, file: !8, line: 92, column: 13)
!140 = !DILocation(line: 95, column: 9, scope: !127)
!141 = !DILocation(line: 97, column: 1, scope: !101)
!142 = distinct !DISubprogram(name: "main", scope: !8, file: !8, line: 103, type: !143, isLocal: false, isDefinition: true, scopeLine: 103, isOptimized: false, unit: !0, variables: !2)
!143 = !DISubroutineType(types: !144)
!144 = !{!4}
!145 = !DILocation(line: 104, column: 2, scope: !142)
!146 = !DILocation(line: 105, column: 5, scope: !142)
!147 = !DILocation(line: 106, column: 5, scope: !142)
