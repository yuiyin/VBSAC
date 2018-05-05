; ModuleID = './191_41.c'
source_filename = "./191_41.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@.str.1 = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1
@.str.2 = private unnamed_addr constant [5 x i8] c"%ld\0A\00", align 1
@.str.3 = private unnamed_addr constant [4 x i8] c"%u\0A\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@.str.5 = private unnamed_addr constant [48 x i8] c"data value is too large to perform subtraction.\00", align 1

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
define void @bad41() #0 !dbg !65 {
entry:
  %data = alloca i8, align 1
  %result = alloca i8, align 1
  call void @llvm.dbg.declare(metadata i8* %data, metadata !68, metadata !15), !dbg !69
  store i8 32, i8* %data, align 1, !dbg !70
  %call = call i32 @staticReturnsTrue(), !dbg !71
  %tobool = icmp ne i32 %call, 0, !dbg !71
  br i1 %tobool, label %if.then, label %if.end, !dbg !73

if.then:                                          ; preds = %entry
  store i8 -128, i8* %data, align 1, !dbg !74
  br label %if.end, !dbg !76

if.end:                                           ; preds = %if.then, %entry
  %call1 = call i32 @staticReturnsTrue(), !dbg !77
  %tobool2 = icmp ne i32 %call1, 0, !dbg !77
  br i1 %tobool2, label %if.then3, label %if.end5, !dbg !79

if.then3:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i8* %result, metadata !80, metadata !15), !dbg !83
  %0 = load i8, i8* %data, align 1, !dbg !84
  %conv = sext i8 %0 to i32, !dbg !84
  %sub = sub nsw i32 %conv, 1, !dbg !85
  %conv4 = trunc i32 %sub to i8, !dbg !84
  store i8 %conv4, i8* %result, align 1, !dbg !83
  %1 = load i8, i8* %result, align 1, !dbg !86
  call void @printHexCharLine(i8 signext %1), !dbg !87
  br label %if.end5, !dbg !88

if.end5:                                          ; preds = %if.then3, %if.end
  ret void, !dbg !89
}

; Function Attrs: nounwind uwtable
define void @good41() #0 !dbg !90 {
entry:
  %data = alloca i8, align 1
  %result = alloca i8, align 1
  call void @llvm.dbg.declare(metadata i8* %data, metadata !91, metadata !15), !dbg !92
  store i8 32, i8* %data, align 1, !dbg !93
  %call = call i32 @staticReturnsTrue(), !dbg !94
  %tobool = icmp ne i32 %call, 0, !dbg !94
  br i1 %tobool, label %if.then, label %if.end, !dbg !96

if.then:                                          ; preds = %entry
  store i8 -128, i8* %data, align 1, !dbg !97
  br label %if.end, !dbg !99

if.end:                                           ; preds = %if.then, %entry
  %call1 = call i32 @staticReturnsFalse(), !dbg !100
  %tobool2 = icmp ne i32 %call1, 0, !dbg !100
  br i1 %tobool2, label %if.then3, label %if.else, !dbg !102

if.then3:                                         ; preds = %if.end
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i32 0, i32 0)), !dbg !103
  br label %if.end10, !dbg !105

if.else:                                          ; preds = %if.end
  %0 = load i8, i8* %data, align 1, !dbg !106
  %conv = sext i8 %0 to i32, !dbg !106
  %cmp = icmp sgt i32 %conv, -128, !dbg !109
  br i1 %cmp, label %if.then5, label %if.else8, !dbg !110

if.then5:                                         ; preds = %if.else
  call void @llvm.dbg.declare(metadata i8* %result, metadata !111, metadata !15), !dbg !113
  %1 = load i8, i8* %data, align 1, !dbg !114
  %conv6 = sext i8 %1 to i32, !dbg !114
  %sub = sub nsw i32 %conv6, 1, !dbg !115
  %conv7 = trunc i32 %sub to i8, !dbg !114
  store i8 %conv7, i8* %result, align 1, !dbg !113
  %2 = load i8, i8* %result, align 1, !dbg !116
  call void @printHexCharLine(i8 signext %2), !dbg !117
  br label %if.end9, !dbg !118

if.else8:                                         ; preds = %if.else
  call void @printLine(i8* getelementptr inbounds ([48 x i8], [48 x i8]* @.str.5, i32 0, i32 0)), !dbg !119
  br label %if.end9

if.end9:                                          ; preds = %if.else8, %if.then5
  br label %if.end10

if.end10:                                         ; preds = %if.end9, %if.then3
  ret void, !dbg !121
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !122 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @good41(), !dbg !125
  call void @bad41(), !dbg !126
  ret i32 1, !dbg !127
}

; Function Attrs: nounwind uwtable
define internal i32 @staticReturnsTrue() #0 !dbg !128 {
entry:
  ret i32 1, !dbg !129
}

; Function Attrs: nounwind uwtable
define internal i32 @staticReturnsFalse() #0 !dbg !130 {
entry:
  ret i32 0, !dbg !131
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (tags/RELEASE_390/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3)
!1 = !DIFile(filename: "191_41.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/191")
!2 = !{}
!3 = !{!4, !5}
!4 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64, align: 64)
!6 = !{i32 2, !"Dwarf Version", i32 4}
!7 = !{i32 2, !"Debug Info Version", i32 3}
!8 = !{!"clang version 3.9.0 (tags/RELEASE_390/final)"}
!9 = distinct !DISubprogram(name: "printHexCharLine", scope: !10, file: !10, line: 10, type: !11, isLocal: false, isDefinition: true, scopeLine: 11, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!10 = !DIFile(filename: "./191_41.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/191")
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
!65 = distinct !DISubprogram(name: "bad41", scope: !10, file: !10, line: 51, type: !66, isLocal: false, isDefinition: true, scopeLine: 52, isOptimized: false, unit: !0, variables: !2)
!66 = !DISubroutineType(types: !67)
!67 = !{null}
!68 = !DILocalVariable(name: "data", scope: !65, file: !10, line: 53, type: !13)
!69 = !DILocation(line: 53, column: 10, scope: !65)
!70 = !DILocation(line: 54, column: 10, scope: !65)
!71 = !DILocation(line: 55, column: 8, scope: !72)
!72 = distinct !DILexicalBlock(scope: !65, file: !10, line: 55, column: 8)
!73 = !DILocation(line: 55, column: 8, scope: !65)
!74 = !DILocation(line: 58, column: 14, scope: !75)
!75 = distinct !DILexicalBlock(scope: !72, file: !10, line: 56, column: 5)
!76 = !DILocation(line: 59, column: 5, scope: !75)
!77 = !DILocation(line: 60, column: 8, scope: !78)
!78 = distinct !DILexicalBlock(scope: !65, file: !10, line: 60, column: 8)
!79 = !DILocation(line: 60, column: 8, scope: !65)
!80 = !DILocalVariable(name: "result", scope: !81, file: !10, line: 64, type: !13)
!81 = distinct !DILexicalBlock(scope: !82, file: !10, line: 62, column: 9)
!82 = distinct !DILexicalBlock(scope: !78, file: !10, line: 61, column: 5)
!83 = !DILocation(line: 64, column: 18, scope: !81)
!84 = !DILocation(line: 64, column: 27, scope: !81)
!85 = !DILocation(line: 64, column: 32, scope: !81)
!86 = !DILocation(line: 65, column: 30, scope: !81)
!87 = !DILocation(line: 65, column: 13, scope: !81)
!88 = !DILocation(line: 67, column: 5, scope: !82)
!89 = !DILocation(line: 68, column: 1, scope: !65)
!90 = distinct !DISubprogram(name: "good41", scope: !10, file: !10, line: 74, type: !66, isLocal: false, isDefinition: true, scopeLine: 75, isOptimized: false, unit: !0, variables: !2)
!91 = !DILocalVariable(name: "data", scope: !90, file: !10, line: 76, type: !13)
!92 = !DILocation(line: 76, column: 10, scope: !90)
!93 = !DILocation(line: 77, column: 10, scope: !90)
!94 = !DILocation(line: 78, column: 8, scope: !95)
!95 = distinct !DILexicalBlock(scope: !90, file: !10, line: 78, column: 8)
!96 = !DILocation(line: 78, column: 8, scope: !90)
!97 = !DILocation(line: 81, column: 14, scope: !98)
!98 = distinct !DILexicalBlock(scope: !95, file: !10, line: 79, column: 5)
!99 = !DILocation(line: 82, column: 5, scope: !98)
!100 = !DILocation(line: 83, column: 8, scope: !101)
!101 = distinct !DILexicalBlock(scope: !90, file: !10, line: 83, column: 8)
!102 = !DILocation(line: 83, column: 8, scope: !90)
!103 = !DILocation(line: 86, column: 9, scope: !104)
!104 = distinct !DILexicalBlock(scope: !101, file: !10, line: 84, column: 5)
!105 = !DILocation(line: 87, column: 5, scope: !104)
!106 = !DILocation(line: 91, column: 13, scope: !107)
!107 = distinct !DILexicalBlock(scope: !108, file: !10, line: 91, column: 13)
!108 = distinct !DILexicalBlock(scope: !101, file: !10, line: 89, column: 5)
!109 = !DILocation(line: 91, column: 18, scope: !107)
!110 = !DILocation(line: 91, column: 13, scope: !108)
!111 = !DILocalVariable(name: "result", scope: !112, file: !10, line: 93, type: !13)
!112 = distinct !DILexicalBlock(scope: !107, file: !10, line: 92, column: 9)
!113 = !DILocation(line: 93, column: 18, scope: !112)
!114 = !DILocation(line: 93, column: 27, scope: !112)
!115 = !DILocation(line: 93, column: 32, scope: !112)
!116 = !DILocation(line: 94, column: 30, scope: !112)
!117 = !DILocation(line: 94, column: 13, scope: !112)
!118 = !DILocation(line: 95, column: 9, scope: !112)
!119 = !DILocation(line: 98, column: 13, scope: !120)
!120 = distinct !DILexicalBlock(scope: !107, file: !10, line: 97, column: 9)
!121 = !DILocation(line: 101, column: 1, scope: !90)
!122 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 106, type: !123, isLocal: false, isDefinition: true, scopeLine: 106, isOptimized: false, unit: !0, variables: !2)
!123 = !DISubroutineType(types: !124)
!124 = !{!4}
!125 = !DILocation(line: 107, column: 2, scope: !122)
!126 = !DILocation(line: 108, column: 5, scope: !122)
!127 = !DILocation(line: 109, column: 5, scope: !122)
!128 = distinct !DISubprogram(name: "staticReturnsTrue", scope: !10, file: !10, line: 39, type: !123, isLocal: true, isDefinition: true, scopeLine: 40, isOptimized: false, unit: !0, variables: !2)
!129 = !DILocation(line: 41, column: 5, scope: !128)
!130 = distinct !DISubprogram(name: "staticReturnsFalse", scope: !10, file: !10, line: 44, type: !123, isLocal: true, isDefinition: true, scopeLine: 45, isOptimized: false, unit: !0, variables: !2)
!131 = !DILocation(line: 46, column: 5, scope: !130)
