; ModuleID = './191_33.c'
source_filename = "./191_33.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@.str.1 = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1
@.str.2 = private unnamed_addr constant [5 x i8] c"%ld\0A\00", align 1
@.str.3 = private unnamed_addr constant [4 x i8] c"%u\0A\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
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
define void @bad33() #0 !dbg !65 {
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
  br i1 %tobool2, label %if.then3, label %if.end9, !dbg !79

if.then3:                                         ; preds = %if.end
  %0 = load i8, i8* %data, align 1, !dbg !80
  %conv = sext i8 %0 to i32, !dbg !80
  %cmp = icmp slt i32 %conv, 0, !dbg !83
  br i1 %cmp, label %if.then5, label %if.end8, !dbg !84

if.then5:                                         ; preds = %if.then3
  call void @llvm.dbg.declare(metadata i8* %result, metadata !85, metadata !15), !dbg !87
  %1 = load i8, i8* %data, align 1, !dbg !88
  %conv6 = sext i8 %1 to i32, !dbg !88
  %mul = mul nsw i32 %conv6, 2, !dbg !89
  %conv7 = trunc i32 %mul to i8, !dbg !88
  store i8 %conv7, i8* %result, align 1, !dbg !87
  %2 = load i8, i8* %result, align 1, !dbg !90
  call void @printHexCharLine(i8 signext %2), !dbg !91
  br label %if.end8, !dbg !92

if.end8:                                          ; preds = %if.then5, %if.then3
  br label %if.end9, !dbg !93

if.end9:                                          ; preds = %if.end8, %if.end
  ret void, !dbg !94
}

; Function Attrs: nounwind uwtable
define void @good33() #0 !dbg !95 {
entry:
  %data = alloca i8, align 1
  %result = alloca i8, align 1
  call void @llvm.dbg.declare(metadata i8* %data, metadata !96, metadata !15), !dbg !97
  store i8 32, i8* %data, align 1, !dbg !98
  %call = call i32 @staticReturnsTrue(), !dbg !99
  %tobool = icmp ne i32 %call, 0, !dbg !99
  br i1 %tobool, label %if.then, label %if.end, !dbg !101

if.then:                                          ; preds = %entry
  store i8 -128, i8* %data, align 1, !dbg !102
  br label %if.end, !dbg !104

if.end:                                           ; preds = %if.then, %entry
  %call1 = call i32 @staticReturnsFalse(), !dbg !105
  %tobool2 = icmp ne i32 %call1, 0, !dbg !105
  br i1 %tobool2, label %if.then3, label %if.else, !dbg !107

if.then3:                                         ; preds = %if.end
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i32 0, i32 0)), !dbg !108
  br label %if.end15, !dbg !110

if.else:                                          ; preds = %if.end
  %0 = load i8, i8* %data, align 1, !dbg !111
  %conv = sext i8 %0 to i32, !dbg !111
  %cmp = icmp slt i32 %conv, 0, !dbg !114
  br i1 %cmp, label %if.then5, label %if.end14, !dbg !115

if.then5:                                         ; preds = %if.else
  %1 = load i8, i8* %data, align 1, !dbg !116
  %conv6 = sext i8 %1 to i32, !dbg !116
  %cmp7 = icmp sgt i32 %conv6, -64, !dbg !119
  br i1 %cmp7, label %if.then9, label %if.else12, !dbg !120

if.then9:                                         ; preds = %if.then5
  call void @llvm.dbg.declare(metadata i8* %result, metadata !121, metadata !15), !dbg !123
  %2 = load i8, i8* %data, align 1, !dbg !124
  %conv10 = sext i8 %2 to i32, !dbg !124
  %mul = mul nsw i32 %conv10, 2, !dbg !125
  %conv11 = trunc i32 %mul to i8, !dbg !124
  store i8 %conv11, i8* %result, align 1, !dbg !123
  %3 = load i8, i8* %result, align 1, !dbg !126
  call void @printHexCharLine(i8 signext %3), !dbg !127
  br label %if.end13, !dbg !128

if.else12:                                        ; preds = %if.then5
  call void @printLine(i8* getelementptr inbounds ([51 x i8], [51 x i8]* @.str.5, i32 0, i32 0)), !dbg !129
  br label %if.end13

if.end13:                                         ; preds = %if.else12, %if.then9
  br label %if.end14, !dbg !131

if.end14:                                         ; preds = %if.end13, %if.else
  br label %if.end15

if.end15:                                         ; preds = %if.end14, %if.then3
  ret void, !dbg !132
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !133 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @good33(), !dbg !136
  call void @bad33(), !dbg !137
  ret i32 1, !dbg !138
}

; Function Attrs: nounwind uwtable
define internal i32 @staticReturnsTrue() #0 !dbg !139 {
entry:
  ret i32 1, !dbg !140
}

; Function Attrs: nounwind uwtable
define internal i32 @staticReturnsFalse() #0 !dbg !141 {
entry:
  ret i32 0, !dbg !142
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (tags/RELEASE_390/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3)
!1 = !DIFile(filename: "191_33.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/191")
!2 = !{}
!3 = !{!4, !5}
!4 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64, align: 64)
!6 = !{i32 2, !"Dwarf Version", i32 4}
!7 = !{i32 2, !"Debug Info Version", i32 3}
!8 = !{!"clang version 3.9.0 (tags/RELEASE_390/final)"}
!9 = distinct !DISubprogram(name: "printHexCharLine", scope: !10, file: !10, line: 10, type: !11, isLocal: false, isDefinition: true, scopeLine: 11, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!10 = !DIFile(filename: "./191_33.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/191")
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
!65 = distinct !DISubprogram(name: "bad33", scope: !10, file: !10, line: 51, type: !66, isLocal: false, isDefinition: true, scopeLine: 52, isOptimized: false, unit: !0, variables: !2)
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
!80 = !DILocation(line: 62, column: 12, scope: !81)
!81 = distinct !DILexicalBlock(scope: !82, file: !10, line: 62, column: 12)
!82 = distinct !DILexicalBlock(scope: !78, file: !10, line: 61, column: 5)
!83 = !DILocation(line: 62, column: 17, scope: !81)
!84 = !DILocation(line: 62, column: 12, scope: !82)
!85 = !DILocalVariable(name: "result", scope: !86, file: !10, line: 65, type: !13)
!86 = distinct !DILexicalBlock(scope: !81, file: !10, line: 63, column: 9)
!87 = !DILocation(line: 65, column: 18, scope: !86)
!88 = !DILocation(line: 65, column: 27, scope: !86)
!89 = !DILocation(line: 65, column: 32, scope: !86)
!90 = !DILocation(line: 66, column: 30, scope: !86)
!91 = !DILocation(line: 66, column: 13, scope: !86)
!92 = !DILocation(line: 67, column: 9, scope: !86)
!93 = !DILocation(line: 68, column: 5, scope: !82)
!94 = !DILocation(line: 69, column: 1, scope: !65)
!95 = distinct !DISubprogram(name: "good33", scope: !10, file: !10, line: 75, type: !66, isLocal: false, isDefinition: true, scopeLine: 76, isOptimized: false, unit: !0, variables: !2)
!96 = !DILocalVariable(name: "data", scope: !95, file: !10, line: 77, type: !13)
!97 = !DILocation(line: 77, column: 10, scope: !95)
!98 = !DILocation(line: 78, column: 10, scope: !95)
!99 = !DILocation(line: 79, column: 8, scope: !100)
!100 = distinct !DILexicalBlock(scope: !95, file: !10, line: 79, column: 8)
!101 = !DILocation(line: 79, column: 8, scope: !95)
!102 = !DILocation(line: 82, column: 14, scope: !103)
!103 = distinct !DILexicalBlock(scope: !100, file: !10, line: 80, column: 5)
!104 = !DILocation(line: 83, column: 5, scope: !103)
!105 = !DILocation(line: 84, column: 8, scope: !106)
!106 = distinct !DILexicalBlock(scope: !95, file: !10, line: 84, column: 8)
!107 = !DILocation(line: 84, column: 8, scope: !95)
!108 = !DILocation(line: 87, column: 9, scope: !109)
!109 = distinct !DILexicalBlock(scope: !106, file: !10, line: 85, column: 5)
!110 = !DILocation(line: 88, column: 5, scope: !109)
!111 = !DILocation(line: 91, column: 12, scope: !112)
!112 = distinct !DILexicalBlock(scope: !113, file: !10, line: 91, column: 12)
!113 = distinct !DILexicalBlock(scope: !106, file: !10, line: 90, column: 5)
!114 = !DILocation(line: 91, column: 17, scope: !112)
!115 = !DILocation(line: 91, column: 12, scope: !113)
!116 = !DILocation(line: 94, column: 17, scope: !117)
!117 = distinct !DILexicalBlock(scope: !118, file: !10, line: 94, column: 17)
!118 = distinct !DILexicalBlock(scope: !112, file: !10, line: 92, column: 9)
!119 = !DILocation(line: 94, column: 22, scope: !117)
!120 = !DILocation(line: 94, column: 17, scope: !118)
!121 = !DILocalVariable(name: "result", scope: !122, file: !10, line: 96, type: !13)
!122 = distinct !DILexicalBlock(scope: !117, file: !10, line: 95, column: 13)
!123 = !DILocation(line: 96, column: 22, scope: !122)
!124 = !DILocation(line: 96, column: 31, scope: !122)
!125 = !DILocation(line: 96, column: 36, scope: !122)
!126 = !DILocation(line: 97, column: 34, scope: !122)
!127 = !DILocation(line: 97, column: 17, scope: !122)
!128 = !DILocation(line: 98, column: 13, scope: !122)
!129 = !DILocation(line: 101, column: 17, scope: !130)
!130 = distinct !DILexicalBlock(scope: !117, file: !10, line: 100, column: 13)
!131 = !DILocation(line: 103, column: 9, scope: !118)
!132 = !DILocation(line: 105, column: 1, scope: !95)
!133 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 111, type: !134, isLocal: false, isDefinition: true, scopeLine: 111, isOptimized: false, unit: !0, variables: !2)
!134 = !DISubroutineType(types: !135)
!135 = !{!4}
!136 = !DILocation(line: 112, column: 2, scope: !133)
!137 = !DILocation(line: 113, column: 5, scope: !133)
!138 = !DILocation(line: 114, column: 5, scope: !133)
!139 = distinct !DISubprogram(name: "staticReturnsTrue", scope: !10, file: !10, line: 39, type: !134, isLocal: true, isDefinition: true, scopeLine: 40, isOptimized: false, unit: !0, variables: !2)
!140 = !DILocation(line: 41, column: 5, scope: !139)
!141 = distinct !DISubprogram(name: "staticReturnsFalse", scope: !10, file: !10, line: 44, type: !134, isLocal: true, isDefinition: true, scopeLine: 45, isOptimized: false, unit: !0, variables: !2)
!142 = !DILocation(line: 46, column: 5, scope: !141)
