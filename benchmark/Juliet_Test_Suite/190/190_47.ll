; ModuleID = './190_47.c'
source_filename = "./190_47.c"
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
@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@.str.1 = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1
@.str.2 = private unnamed_addr constant [5 x i8] c"%ld\0A\00", align 1
@stdin = external global %struct._IO_FILE*, align 8
@.str.3 = private unnamed_addr constant [4 x i8] c"%hd\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@.str.5 = private unnamed_addr constant [54 x i8] c"data value is too large to perform arithmetic safely.\00", align 1

; Function Attrs: nounwind uwtable
define void @printHexCharLine(i8 signext %charHex) #0 !dbg !18 {
entry:
  %charHex.addr = alloca i8, align 1
  store i8 %charHex, i8* %charHex.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %charHex.addr, metadata !22, metadata !23), !dbg !24
  %0 = load i8, i8* %charHex.addr, align 1, !dbg !25
  %conv = sext i8 %0 to i32, !dbg !26
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), i32 %conv), !dbg !27
  ret void, !dbg !28
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @printf(i8*, ...) #2

; Function Attrs: nounwind uwtable
define void @printLine(i8* %line) #0 !dbg !29 {
entry:
  %line.addr = alloca i8*, align 8
  store i8* %line, i8** %line.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %line.addr, metadata !34, metadata !23), !dbg !35
  %0 = load i8*, i8** %line.addr, align 8, !dbg !36
  %cmp = icmp ne i8* %0, null, !dbg !38
  br i1 %cmp, label %if.then, label %if.end, !dbg !39

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** %line.addr, align 8, !dbg !40
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i32 0, i32 0), i8* %1), !dbg !42
  br label %if.end, !dbg !43

if.end:                                           ; preds = %if.then, %entry
  ret void, !dbg !44
}

; Function Attrs: nounwind uwtable
define void @printIntLine(i32 %intNumber) #0 !dbg !45 {
entry:
  %intNumber.addr = alloca i32, align 4
  store i32 %intNumber, i32* %intNumber.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %intNumber.addr, metadata !48, metadata !23), !dbg !49
  %0 = load i32, i32* %intNumber.addr, align 4, !dbg !50
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), i32 %0), !dbg !51
  ret void, !dbg !52
}

; Function Attrs: nounwind uwtable
define void @printLongLine(i64 %longIntNumber) #0 !dbg !53 {
entry:
  %longIntNumber.addr = alloca i64, align 8
  store i64 %longIntNumber, i64* %longIntNumber.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %longIntNumber.addr, metadata !59, metadata !23), !dbg !60
  %0 = load i64, i64* %longIntNumber.addr, align 8, !dbg !61
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.2, i32 0, i32 0), i64 %0), !dbg !62
  ret void, !dbg !63
}

; Function Attrs: nounwind uwtable
define void @bad47() #0 !dbg !64 {
entry:
  %data = alloca i16, align 2
  %result = alloca i16, align 2
  call void @llvm.dbg.declare(metadata i16* %data, metadata !67, metadata !23), !dbg !69
  store i16 0, i16* %data, align 2, !dbg !70
  %0 = load i32, i32* @globalTrue, align 4, !dbg !71
  %tobool = icmp ne i32 %0, 0, !dbg !71
  br i1 %tobool, label %if.then, label %if.end, !dbg !73

if.then:                                          ; preds = %entry
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !74
  %call = call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i32 0, i32 0), i16* %data), !dbg !76
  br label %if.end, !dbg !77

if.end:                                           ; preds = %if.then, %entry
  %2 = load i32, i32* @globalTrue, align 4, !dbg !78
  %tobool1 = icmp ne i32 %2, 0, !dbg !78
  br i1 %tobool1, label %if.then2, label %if.end9, !dbg !80

if.then2:                                         ; preds = %if.end
  %3 = load i16, i16* %data, align 2, !dbg !81
  %conv = sext i16 %3 to i32, !dbg !81
  %cmp = icmp sgt i32 %conv, 0, !dbg !84
  br i1 %cmp, label %if.then4, label %if.end8, !dbg !85

if.then4:                                         ; preds = %if.then2
  call void @llvm.dbg.declare(metadata i16* %result, metadata !86, metadata !23), !dbg !88
  %4 = load i16, i16* %data, align 2, !dbg !89
  %conv5 = sext i16 %4 to i32, !dbg !89
  %mul = mul nsw i32 %conv5, 2, !dbg !90
  %conv6 = trunc i32 %mul to i16, !dbg !89
  store i16 %conv6, i16* %result, align 2, !dbg !88
  %5 = load i16, i16* %result, align 2, !dbg !91
  %conv7 = sext i16 %5 to i32, !dbg !91
  call void @printIntLine(i32 %conv7), !dbg !92
  br label %if.end8, !dbg !93

if.end8:                                          ; preds = %if.then4, %if.then2
  br label %if.end9, !dbg !94

if.end9:                                          ; preds = %if.end8, %if.end
  ret void, !dbg !95
}

declare i32 @__isoc99_fscanf(%struct._IO_FILE*, i8*, ...) #2

; Function Attrs: nounwind uwtable
define void @good47() #0 !dbg !96 {
entry:
  %data = alloca i16, align 2
  %result = alloca i16, align 2
  call void @llvm.dbg.declare(metadata i16* %data, metadata !97, metadata !23), !dbg !98
  store i16 0, i16* %data, align 2, !dbg !99
  %0 = load i32, i32* @globalTrue, align 4, !dbg !100
  %tobool = icmp ne i32 %0, 0, !dbg !100
  br i1 %tobool, label %if.then, label %if.end, !dbg !102

if.then:                                          ; preds = %entry
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !103
  %call = call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i32 0, i32 0), i16* %data), !dbg !105
  br label %if.end, !dbg !106

if.end:                                           ; preds = %if.then, %entry
  %2 = load i32, i32* @globalFalse, align 4, !dbg !107
  %tobool1 = icmp ne i32 %2, 0, !dbg !107
  br i1 %tobool1, label %if.then2, label %if.else, !dbg !109

if.then2:                                         ; preds = %if.end
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i32 0, i32 0)), !dbg !110
  br label %if.end15, !dbg !112

if.else:                                          ; preds = %if.end
  %3 = load i16, i16* %data, align 2, !dbg !113
  %conv = sext i16 %3 to i32, !dbg !113
  %cmp = icmp sgt i32 %conv, 0, !dbg !116
  br i1 %cmp, label %if.then4, label %if.end14, !dbg !117

if.then4:                                         ; preds = %if.else
  %4 = load i16, i16* %data, align 2, !dbg !118
  %conv5 = sext i16 %4 to i32, !dbg !118
  %cmp6 = icmp slt i32 %conv5, 16383, !dbg !121
  br i1 %cmp6, label %if.then8, label %if.else12, !dbg !122

if.then8:                                         ; preds = %if.then4
  call void @llvm.dbg.declare(metadata i16* %result, metadata !123, metadata !23), !dbg !125
  %5 = load i16, i16* %data, align 2, !dbg !126
  %conv9 = sext i16 %5 to i32, !dbg !126
  %mul = mul nsw i32 %conv9, 2, !dbg !127
  %conv10 = trunc i32 %mul to i16, !dbg !126
  store i16 %conv10, i16* %result, align 2, !dbg !125
  %6 = load i16, i16* %result, align 2, !dbg !128
  %conv11 = sext i16 %6 to i32, !dbg !128
  call void @printIntLine(i32 %conv11), !dbg !129
  br label %if.end13, !dbg !130

if.else12:                                        ; preds = %if.then4
  call void @printLine(i8* getelementptr inbounds ([54 x i8], [54 x i8]* @.str.5, i32 0, i32 0)), !dbg !131
  br label %if.end13

if.end13:                                         ; preds = %if.else12, %if.then8
  br label %if.end14, !dbg !133

if.end14:                                         ; preds = %if.end13, %if.else
  br label %if.end15

if.end15:                                         ; preds = %if.end14, %if.then2
  ret void, !dbg !134
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !135 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @good47(), !dbg !138
  call void @bad47(), !dbg !139
  ret i32 1, !dbg !140
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!15, !16}
!llvm.ident = !{!17}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (tags/RELEASE_390/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, globals: !6)
!1 = !DIFile(filename: "190_47.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/190")
!2 = !{}
!3 = !{!4, !5}
!4 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64, align: 64)
!6 = !{!7, !10, !11, !12, !13, !14}
!7 = distinct !DIGlobalVariable(name: "GLOBAL_CONST_TRUE", scope: !0, file: !8, line: 10, type: !9, isLocal: false, isDefinition: true, variable: i32* @GLOBAL_CONST_TRUE)
!8 = !DIFile(filename: "./190_47.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/190")
!9 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !4)
!10 = distinct !DIGlobalVariable(name: "GLOBAL_CONST_FALSE", scope: !0, file: !8, line: 11, type: !9, isLocal: false, isDefinition: true, variable: i32* @GLOBAL_CONST_FALSE)
!11 = distinct !DIGlobalVariable(name: "GLOBAL_CONST_FIVE", scope: !0, file: !8, line: 12, type: !9, isLocal: false, isDefinition: true, variable: i32* @GLOBAL_CONST_FIVE)
!12 = distinct !DIGlobalVariable(name: "globalTrue", scope: !0, file: !8, line: 14, type: !4, isLocal: false, isDefinition: true, variable: i32* @globalTrue)
!13 = distinct !DIGlobalVariable(name: "globalFalse", scope: !0, file: !8, line: 15, type: !4, isLocal: false, isDefinition: true, variable: i32* @globalFalse)
!14 = distinct !DIGlobalVariable(name: "globalFive", scope: !0, file: !8, line: 16, type: !4, isLocal: false, isDefinition: true, variable: i32* @globalFive)
!15 = !{i32 2, !"Dwarf Version", i32 4}
!16 = !{i32 2, !"Debug Info Version", i32 3}
!17 = !{!"clang version 3.9.0 (tags/RELEASE_390/final)"}
!18 = distinct !DISubprogram(name: "printHexCharLine", scope: !8, file: !8, line: 18, type: !19, isLocal: false, isDefinition: true, scopeLine: 19, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!19 = !DISubroutineType(types: !20)
!20 = !{null, !21}
!21 = !DIBasicType(name: "char", size: 8, align: 8, encoding: DW_ATE_signed_char)
!22 = !DILocalVariable(name: "charHex", arg: 1, scope: !18, file: !8, line: 18, type: !21)
!23 = !DIExpression()
!24 = !DILocation(line: 18, column: 29, scope: !18)
!25 = !DILocation(line: 20, column: 25, scope: !18)
!26 = !DILocation(line: 20, column: 20, scope: !18)
!27 = !DILocation(line: 20, column: 5, scope: !18)
!28 = !DILocation(line: 21, column: 1, scope: !18)
!29 = distinct !DISubprogram(name: "printLine", scope: !8, file: !8, line: 23, type: !30, isLocal: false, isDefinition: true, scopeLine: 24, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!30 = !DISubroutineType(types: !31)
!31 = !{null, !32}
!32 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !33, size: 64, align: 64)
!33 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !21)
!34 = !DILocalVariable(name: "line", arg: 1, scope: !29, file: !8, line: 23, type: !32)
!35 = !DILocation(line: 23, column: 30, scope: !29)
!36 = !DILocation(line: 25, column: 8, scope: !37)
!37 = distinct !DILexicalBlock(scope: !29, file: !8, line: 25, column: 8)
!38 = !DILocation(line: 25, column: 13, scope: !37)
!39 = !DILocation(line: 25, column: 8, scope: !29)
!40 = !DILocation(line: 27, column: 24, scope: !41)
!41 = distinct !DILexicalBlock(scope: !37, file: !8, line: 26, column: 5)
!42 = !DILocation(line: 27, column: 9, scope: !41)
!43 = !DILocation(line: 28, column: 5, scope: !41)
!44 = !DILocation(line: 29, column: 1, scope: !29)
!45 = distinct !DISubprogram(name: "printIntLine", scope: !8, file: !8, line: 31, type: !46, isLocal: false, isDefinition: true, scopeLine: 32, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!46 = !DISubroutineType(types: !47)
!47 = !{null, !4}
!48 = !DILocalVariable(name: "intNumber", arg: 1, scope: !45, file: !8, line: 31, type: !4)
!49 = !DILocation(line: 31, column: 24, scope: !45)
!50 = !DILocation(line: 33, column: 20, scope: !45)
!51 = !DILocation(line: 33, column: 5, scope: !45)
!52 = !DILocation(line: 34, column: 1, scope: !45)
!53 = distinct !DISubprogram(name: "printLongLine", scope: !8, file: !8, line: 36, type: !54, isLocal: false, isDefinition: true, scopeLine: 37, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!54 = !DISubroutineType(types: !55)
!55 = !{null, !56}
!56 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !57, line: 197, baseType: !58)
!57 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/sys/types.h", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/190")
!58 = !DIBasicType(name: "long int", size: 64, align: 64, encoding: DW_ATE_signed)
!59 = !DILocalVariable(name: "longIntNumber", arg: 1, scope: !53, file: !8, line: 36, type: !56)
!60 = !DILocation(line: 36, column: 29, scope: !53)
!61 = !DILocation(line: 38, column: 21, scope: !53)
!62 = !DILocation(line: 38, column: 5, scope: !53)
!63 = !DILocation(line: 39, column: 1, scope: !53)
!64 = distinct !DISubprogram(name: "bad47", scope: !8, file: !8, line: 43, type: !65, isLocal: false, isDefinition: true, scopeLine: 44, isOptimized: false, unit: !0, variables: !2)
!65 = !DISubroutineType(types: !66)
!66 = !{null}
!67 = !DILocalVariable(name: "data", scope: !64, file: !8, line: 45, type: !68)
!68 = !DIBasicType(name: "short", size: 16, align: 16, encoding: DW_ATE_signed)
!69 = !DILocation(line: 45, column: 11, scope: !64)
!70 = !DILocation(line: 46, column: 10, scope: !64)
!71 = !DILocation(line: 47, column: 8, scope: !72)
!72 = distinct !DILexicalBlock(scope: !64, file: !8, line: 47, column: 8)
!73 = !DILocation(line: 47, column: 8, scope: !64)
!74 = !DILocation(line: 50, column: 17, scope: !75)
!75 = distinct !DILexicalBlock(scope: !72, file: !8, line: 48, column: 5)
!76 = !DILocation(line: 50, column: 9, scope: !75)
!77 = !DILocation(line: 51, column: 5, scope: !75)
!78 = !DILocation(line: 52, column: 8, scope: !79)
!79 = distinct !DILexicalBlock(scope: !64, file: !8, line: 52, column: 8)
!80 = !DILocation(line: 52, column: 8, scope: !64)
!81 = !DILocation(line: 54, column: 12, scope: !82)
!82 = distinct !DILexicalBlock(scope: !83, file: !8, line: 54, column: 12)
!83 = distinct !DILexicalBlock(scope: !79, file: !8, line: 53, column: 5)
!84 = !DILocation(line: 54, column: 17, scope: !82)
!85 = !DILocation(line: 54, column: 12, scope: !83)
!86 = !DILocalVariable(name: "result", scope: !87, file: !8, line: 57, type: !68)
!87 = distinct !DILexicalBlock(scope: !82, file: !8, line: 55, column: 9)
!88 = !DILocation(line: 57, column: 19, scope: !87)
!89 = !DILocation(line: 57, column: 28, scope: !87)
!90 = !DILocation(line: 57, column: 33, scope: !87)
!91 = !DILocation(line: 58, column: 26, scope: !87)
!92 = !DILocation(line: 58, column: 13, scope: !87)
!93 = !DILocation(line: 59, column: 9, scope: !87)
!94 = !DILocation(line: 60, column: 5, scope: !83)
!95 = !DILocation(line: 61, column: 1, scope: !64)
!96 = distinct !DISubprogram(name: "good47", scope: !8, file: !8, line: 67, type: !65, isLocal: false, isDefinition: true, scopeLine: 68, isOptimized: false, unit: !0, variables: !2)
!97 = !DILocalVariable(name: "data", scope: !96, file: !8, line: 69, type: !68)
!98 = !DILocation(line: 69, column: 11, scope: !96)
!99 = !DILocation(line: 70, column: 10, scope: !96)
!100 = !DILocation(line: 71, column: 8, scope: !101)
!101 = distinct !DILexicalBlock(scope: !96, file: !8, line: 71, column: 8)
!102 = !DILocation(line: 71, column: 8, scope: !96)
!103 = !DILocation(line: 74, column: 17, scope: !104)
!104 = distinct !DILexicalBlock(scope: !101, file: !8, line: 72, column: 5)
!105 = !DILocation(line: 74, column: 9, scope: !104)
!106 = !DILocation(line: 75, column: 5, scope: !104)
!107 = !DILocation(line: 76, column: 8, scope: !108)
!108 = distinct !DILexicalBlock(scope: !96, file: !8, line: 76, column: 8)
!109 = !DILocation(line: 76, column: 8, scope: !96)
!110 = !DILocation(line: 79, column: 9, scope: !111)
!111 = distinct !DILexicalBlock(scope: !108, file: !8, line: 77, column: 5)
!112 = !DILocation(line: 80, column: 5, scope: !111)
!113 = !DILocation(line: 83, column: 12, scope: !114)
!114 = distinct !DILexicalBlock(scope: !115, file: !8, line: 83, column: 12)
!115 = distinct !DILexicalBlock(scope: !108, file: !8, line: 82, column: 5)
!116 = !DILocation(line: 83, column: 17, scope: !114)
!117 = !DILocation(line: 83, column: 12, scope: !115)
!118 = !DILocation(line: 86, column: 17, scope: !119)
!119 = distinct !DILexicalBlock(scope: !120, file: !8, line: 86, column: 17)
!120 = distinct !DILexicalBlock(scope: !114, file: !8, line: 84, column: 9)
!121 = !DILocation(line: 86, column: 22, scope: !119)
!122 = !DILocation(line: 86, column: 17, scope: !120)
!123 = !DILocalVariable(name: "result", scope: !124, file: !8, line: 88, type: !68)
!124 = distinct !DILexicalBlock(scope: !119, file: !8, line: 87, column: 13)
!125 = !DILocation(line: 88, column: 23, scope: !124)
!126 = !DILocation(line: 88, column: 32, scope: !124)
!127 = !DILocation(line: 88, column: 37, scope: !124)
!128 = !DILocation(line: 89, column: 30, scope: !124)
!129 = !DILocation(line: 89, column: 17, scope: !124)
!130 = !DILocation(line: 90, column: 13, scope: !124)
!131 = !DILocation(line: 93, column: 17, scope: !132)
!132 = distinct !DILexicalBlock(scope: !119, file: !8, line: 92, column: 13)
!133 = !DILocation(line: 95, column: 9, scope: !120)
!134 = !DILocation(line: 97, column: 1, scope: !96)
!135 = distinct !DISubprogram(name: "main", scope: !8, file: !8, line: 102, type: !136, isLocal: false, isDefinition: true, scopeLine: 102, isOptimized: false, unit: !0, variables: !2)
!136 = !DISubroutineType(types: !137)
!137 = !{!4}
!138 = !DILocation(line: 103, column: 5, scope: !135)
!139 = !DILocation(line: 104, column: 5, scope: !135)
!140 = !DILocation(line: 105, column: 5, scope: !135)
