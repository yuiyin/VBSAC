; ModuleID = './190_34.c'
source_filename = "./190_34.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@.str.1 = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1
@.str.2 = private unnamed_addr constant [5 x i8] c"%ld\0A\00", align 1
@stdin = external global %struct._IO_FILE*, align 8
@.str.3 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@.str.5 = private unnamed_addr constant [54 x i8] c"data value is too large to perform arithmetic safely.\00", align 1

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
define void @bad34() #0 !dbg !56 {
entry:
  %data = alloca i32, align 4
  %result = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !59, metadata !15), !dbg !60
  store i32 0, i32* %data, align 4, !dbg !61
  %call = call i32 @staticReturnsTrue(), !dbg !62
  %tobool = icmp ne i32 %call, 0, !dbg !62
  br i1 %tobool, label %if.then, label %if.end, !dbg !64

if.then:                                          ; preds = %entry
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !65
  %call1 = call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* %0, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i32 0, i32 0), i32* %data), !dbg !67
  br label %if.end, !dbg !68

if.end:                                           ; preds = %if.then, %entry
  %call2 = call i32 @staticReturnsTrue(), !dbg !69
  %tobool3 = icmp ne i32 %call2, 0, !dbg !69
  br i1 %tobool3, label %if.then4, label %if.end5, !dbg !71

if.then4:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %result, metadata !72, metadata !15), !dbg !75
  %1 = load i32, i32* %data, align 4, !dbg !76
  %add = add nsw i32 %1, 1, !dbg !77
  store i32 %add, i32* %result, align 4, !dbg !75
  %2 = load i32, i32* %result, align 4, !dbg !78
  call void @printIntLine(i32 %2), !dbg !79
  br label %if.end5, !dbg !80

if.end5:                                          ; preds = %if.then4, %if.end
  ret void, !dbg !81
}

declare i32 @__isoc99_fscanf(%struct._IO_FILE*, i8*, ...) #2

; Function Attrs: nounwind uwtable
define void @good34() #0 !dbg !82 {
entry:
  %data = alloca i32, align 4
  %result = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !83, metadata !15), !dbg !84
  store i32 0, i32* %data, align 4, !dbg !85
  %call = call i32 @staticReturnsTrue(), !dbg !86
  %tobool = icmp ne i32 %call, 0, !dbg !86
  br i1 %tobool, label %if.then, label %if.end, !dbg !88

if.then:                                          ; preds = %entry
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !89
  %call1 = call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* %0, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i32 0, i32 0), i32* %data), !dbg !91
  br label %if.end, !dbg !92

if.end:                                           ; preds = %if.then, %entry
  %call2 = call i32 @staticReturnsFalse(), !dbg !93
  %tobool3 = icmp ne i32 %call2, 0, !dbg !93
  br i1 %tobool3, label %if.then4, label %if.else, !dbg !95

if.then4:                                         ; preds = %if.end
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i32 0, i32 0)), !dbg !96
  br label %if.end8, !dbg !98

if.else:                                          ; preds = %if.end
  %1 = load i32, i32* %data, align 4, !dbg !99
  %cmp = icmp slt i32 %1, 2147483647, !dbg !102
  br i1 %cmp, label %if.then5, label %if.else6, !dbg !103

if.then5:                                         ; preds = %if.else
  call void @llvm.dbg.declare(metadata i32* %result, metadata !104, metadata !15), !dbg !106
  %2 = load i32, i32* %data, align 4, !dbg !107
  %add = add nsw i32 %2, 1, !dbg !108
  store i32 %add, i32* %result, align 4, !dbg !106
  %3 = load i32, i32* %result, align 4, !dbg !109
  call void @printIntLine(i32 %3), !dbg !110
  br label %if.end7, !dbg !111

if.else6:                                         ; preds = %if.else
  call void @printLine(i8* getelementptr inbounds ([54 x i8], [54 x i8]* @.str.5, i32 0, i32 0)), !dbg !112
  br label %if.end7

if.end7:                                          ; preds = %if.else6, %if.then5
  br label %if.end8

if.end8:                                          ; preds = %if.end7, %if.then4
  ret void, !dbg !114
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !115 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @good34(), !dbg !118
  call void @bad34(), !dbg !119
  ret i32 1, !dbg !120
}

; Function Attrs: nounwind uwtable
define internal i32 @staticReturnsTrue() #0 !dbg !121 {
entry:
  ret i32 1, !dbg !122
}

; Function Attrs: nounwind uwtable
define internal i32 @staticReturnsFalse() #0 !dbg !123 {
entry:
  ret i32 0, !dbg !124
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (tags/RELEASE_390/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3)
!1 = !DIFile(filename: "190_34.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/190")
!2 = !{}
!3 = !{!4, !5}
!4 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64, align: 64)
!6 = !{i32 2, !"Dwarf Version", i32 4}
!7 = !{i32 2, !"Debug Info Version", i32 3}
!8 = !{!"clang version 3.9.0 (tags/RELEASE_390/final)"}
!9 = distinct !DISubprogram(name: "printHexCharLine", scope: !10, file: !10, line: 10, type: !11, isLocal: false, isDefinition: true, scopeLine: 11, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!10 = !DIFile(filename: "./190_34.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/190")
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
!56 = distinct !DISubprogram(name: "bad34", scope: !10, file: !10, line: 45, type: !57, isLocal: false, isDefinition: true, scopeLine: 46, isOptimized: false, unit: !0, variables: !2)
!57 = !DISubroutineType(types: !58)
!58 = !{null}
!59 = !DILocalVariable(name: "data", scope: !56, file: !10, line: 47, type: !4)
!60 = !DILocation(line: 47, column: 9, scope: !56)
!61 = !DILocation(line: 49, column: 10, scope: !56)
!62 = !DILocation(line: 50, column: 8, scope: !63)
!63 = distinct !DILexicalBlock(scope: !56, file: !10, line: 50, column: 8)
!64 = !DILocation(line: 50, column: 8, scope: !56)
!65 = !DILocation(line: 53, column: 16, scope: !66)
!66 = distinct !DILexicalBlock(scope: !63, file: !10, line: 51, column: 5)
!67 = !DILocation(line: 53, column: 9, scope: !66)
!68 = !DILocation(line: 54, column: 5, scope: !66)
!69 = !DILocation(line: 55, column: 8, scope: !70)
!70 = distinct !DILexicalBlock(scope: !56, file: !10, line: 55, column: 8)
!71 = !DILocation(line: 55, column: 8, scope: !56)
!72 = !DILocalVariable(name: "result", scope: !73, file: !10, line: 59, type: !4)
!73 = distinct !DILexicalBlock(scope: !74, file: !10, line: 57, column: 9)
!74 = distinct !DILexicalBlock(scope: !70, file: !10, line: 56, column: 5)
!75 = !DILocation(line: 59, column: 17, scope: !73)
!76 = !DILocation(line: 59, column: 26, scope: !73)
!77 = !DILocation(line: 59, column: 31, scope: !73)
!78 = !DILocation(line: 60, column: 26, scope: !73)
!79 = !DILocation(line: 60, column: 13, scope: !73)
!80 = !DILocation(line: 62, column: 5, scope: !74)
!81 = !DILocation(line: 63, column: 1, scope: !56)
!82 = distinct !DISubprogram(name: "good34", scope: !10, file: !10, line: 69, type: !57, isLocal: false, isDefinition: true, scopeLine: 70, isOptimized: false, unit: !0, variables: !2)
!83 = !DILocalVariable(name: "data", scope: !82, file: !10, line: 71, type: !4)
!84 = !DILocation(line: 71, column: 9, scope: !82)
!85 = !DILocation(line: 73, column: 10, scope: !82)
!86 = !DILocation(line: 74, column: 8, scope: !87)
!87 = distinct !DILexicalBlock(scope: !82, file: !10, line: 74, column: 8)
!88 = !DILocation(line: 74, column: 8, scope: !82)
!89 = !DILocation(line: 77, column: 16, scope: !90)
!90 = distinct !DILexicalBlock(scope: !87, file: !10, line: 75, column: 5)
!91 = !DILocation(line: 77, column: 9, scope: !90)
!92 = !DILocation(line: 78, column: 5, scope: !90)
!93 = !DILocation(line: 79, column: 8, scope: !94)
!94 = distinct !DILexicalBlock(scope: !82, file: !10, line: 79, column: 8)
!95 = !DILocation(line: 79, column: 8, scope: !82)
!96 = !DILocation(line: 82, column: 9, scope: !97)
!97 = distinct !DILexicalBlock(scope: !94, file: !10, line: 80, column: 5)
!98 = !DILocation(line: 83, column: 5, scope: !97)
!99 = !DILocation(line: 87, column: 13, scope: !100)
!100 = distinct !DILexicalBlock(scope: !101, file: !10, line: 87, column: 13)
!101 = distinct !DILexicalBlock(scope: !94, file: !10, line: 85, column: 5)
!102 = !DILocation(line: 87, column: 18, scope: !100)
!103 = !DILocation(line: 87, column: 13, scope: !101)
!104 = !DILocalVariable(name: "result", scope: !105, file: !10, line: 89, type: !4)
!105 = distinct !DILexicalBlock(scope: !100, file: !10, line: 88, column: 9)
!106 = !DILocation(line: 89, column: 17, scope: !105)
!107 = !DILocation(line: 89, column: 26, scope: !105)
!108 = !DILocation(line: 89, column: 31, scope: !105)
!109 = !DILocation(line: 90, column: 26, scope: !105)
!110 = !DILocation(line: 90, column: 13, scope: !105)
!111 = !DILocation(line: 91, column: 9, scope: !105)
!112 = !DILocation(line: 94, column: 13, scope: !113)
!113 = distinct !DILexicalBlock(scope: !100, file: !10, line: 93, column: 9)
!114 = !DILocation(line: 96, column: 6, scope: !82)
!115 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 99, type: !116, isLocal: false, isDefinition: true, scopeLine: 99, isOptimized: false, unit: !0, variables: !2)
!116 = !DISubroutineType(types: !117)
!117 = !{!4}
!118 = !DILocation(line: 100, column: 5, scope: !115)
!119 = !DILocation(line: 101, column: 5, scope: !115)
!120 = !DILocation(line: 102, column: 5, scope: !115)
!121 = distinct !DISubprogram(name: "staticReturnsTrue", scope: !10, file: !10, line: 33, type: !116, isLocal: true, isDefinition: true, scopeLine: 34, isOptimized: false, unit: !0, variables: !2)
!122 = !DILocation(line: 35, column: 5, scope: !121)
!123 = distinct !DISubprogram(name: "staticReturnsFalse", scope: !10, file: !10, line: 38, type: !116, isLocal: true, isDefinition: true, scopeLine: 39, isOptimized: false, unit: !0, variables: !2)
!124 = !DILocation(line: 40, column: 5, scope: !123)
