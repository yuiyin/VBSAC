; ModuleID = './190_35.c'
source_filename = "./190_35.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@.str.1 = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1
@.str.2 = private unnamed_addr constant [5 x i8] c"%ld\0A\00", align 1
@staticFive = internal global i32 5, align 4
@.str.3 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@.str.4 = private unnamed_addr constant [54 x i8] c"data value is too large to perform arithmetic safely.\00", align 1

; Function Attrs: nounwind uwtable
define void @printHexCharLine(i8 signext %charHex) #0 !dbg !14 {
entry:
  %charHex.addr = alloca i8, align 1
  store i8 %charHex, i8* %charHex.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %charHex.addr, metadata !18, metadata !19), !dbg !20
  %0 = load i8, i8* %charHex.addr, align 1, !dbg !21
  %conv = sext i8 %0 to i32, !dbg !22
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), i32 %conv), !dbg !23
  ret void, !dbg !24
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @printf(i8*, ...) #2

; Function Attrs: nounwind uwtable
define void @printLine(i8* %line) #0 !dbg !25 {
entry:
  %line.addr = alloca i8*, align 8
  store i8* %line, i8** %line.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %line.addr, metadata !30, metadata !19), !dbg !31
  %0 = load i8*, i8** %line.addr, align 8, !dbg !32
  %cmp = icmp ne i8* %0, null, !dbg !34
  br i1 %cmp, label %if.then, label %if.end, !dbg !35

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** %line.addr, align 8, !dbg !36
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i32 0, i32 0), i8* %1), !dbg !38
  br label %if.end, !dbg !39

if.end:                                           ; preds = %if.then, %entry
  ret void, !dbg !40
}

; Function Attrs: nounwind uwtable
define void @printIntLine(i32 %intNumber) #0 !dbg !41 {
entry:
  %intNumber.addr = alloca i32, align 4
  store i32 %intNumber, i32* %intNumber.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %intNumber.addr, metadata !44, metadata !19), !dbg !45
  %0 = load i32, i32* %intNumber.addr, align 4, !dbg !46
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), i32 %0), !dbg !47
  ret void, !dbg !48
}

; Function Attrs: nounwind uwtable
define void @printLongLine(i64 %longIntNumber) #0 !dbg !49 {
entry:
  %longIntNumber.addr = alloca i64, align 8
  store i64 %longIntNumber, i64* %longIntNumber.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %longIntNumber.addr, metadata !54, metadata !19), !dbg !55
  %0 = load i64, i64* %longIntNumber.addr, align 8, !dbg !56
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.2, i32 0, i32 0), i64 %0), !dbg !57
  ret void, !dbg !58
}

; Function Attrs: nounwind uwtable
define void @bad35() #0 !dbg !59 {
entry:
  %data = alloca i8, align 1
  %result = alloca i8, align 1
  call void @llvm.dbg.declare(metadata i8* %data, metadata !62, metadata !19), !dbg !63
  store i8 32, i8* %data, align 1, !dbg !64
  %0 = load i32, i32* @staticFive, align 4, !dbg !65
  %cmp = icmp eq i32 %0, 5, !dbg !67
  br i1 %cmp, label %if.then, label %if.end, !dbg !68

if.then:                                          ; preds = %entry
  store i8 127, i8* %data, align 1, !dbg !69
  br label %if.end, !dbg !71

if.end:                                           ; preds = %if.then, %entry
  %1 = load i32, i32* @staticFive, align 4, !dbg !72
  %cmp1 = icmp eq i32 %1, 5, !dbg !74
  br i1 %cmp1, label %if.then2, label %if.end5, !dbg !75

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i8* %result, metadata !76, metadata !19), !dbg !79
  %2 = load i8, i8* %data, align 1, !dbg !80
  %conv = sext i8 %2 to i32, !dbg !80
  %3 = load i8, i8* %data, align 1, !dbg !81
  %conv3 = sext i8 %3 to i32, !dbg !81
  %mul = mul nsw i32 %conv, %conv3, !dbg !82
  %conv4 = trunc i32 %mul to i8, !dbg !80
  store i8 %conv4, i8* %result, align 1, !dbg !79
  %4 = load i8, i8* %result, align 1, !dbg !83
  call void @printHexCharLine(i8 signext %4), !dbg !84
  br label %if.end5, !dbg !85

if.end5:                                          ; preds = %if.then2, %if.end
  ret void, !dbg !86
}

; Function Attrs: nounwind uwtable
define void @good35() #0 !dbg !87 {
entry:
  %data = alloca i8, align 1
  %result = alloca i8, align 1
  call void @llvm.dbg.declare(metadata i8* %data, metadata !88, metadata !19), !dbg !89
  store i8 32, i8* %data, align 1, !dbg !90
  %0 = load i32, i32* @staticFive, align 4, !dbg !91
  %cmp = icmp eq i32 %0, 5, !dbg !93
  br i1 %cmp, label %if.then, label %if.end, !dbg !94

if.then:                                          ; preds = %entry
  store i8 127, i8* %data, align 1, !dbg !95
  br label %if.end, !dbg !97

if.end:                                           ; preds = %if.then, %entry
  %1 = load i32, i32* @staticFive, align 4, !dbg !98
  %cmp1 = icmp ne i32 %1, 5, !dbg !100
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !101

if.then2:                                         ; preds = %if.end
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.3, i32 0, i32 0)), !dbg !102
  br label %if.end15, !dbg !104

if.else:                                          ; preds = %if.end
  %2 = load i8, i8* %data, align 1, !dbg !105
  %conv = sext i8 %2 to i64, !dbg !108
  %conv3 = trunc i64 %conv to i32, !dbg !108
  %call = call i32 @abs(i32 %conv3) #1, !dbg !109
  %conv4 = sext i32 %call to i64, !dbg !109
  %call5 = call double @sqrt(double 1.270000e+02) #5, !dbg !110
  %conv6 = fptosi double %call5 to i64, !dbg !112
  %cmp7 = icmp sle i64 %conv4, %conv6, !dbg !113
  br i1 %cmp7, label %if.then9, label %if.else13, !dbg !114

if.then9:                                         ; preds = %if.else
  call void @llvm.dbg.declare(metadata i8* %result, metadata !115, metadata !19), !dbg !117
  %3 = load i8, i8* %data, align 1, !dbg !118
  %conv10 = sext i8 %3 to i32, !dbg !118
  %4 = load i8, i8* %data, align 1, !dbg !119
  %conv11 = sext i8 %4 to i32, !dbg !119
  %mul = mul nsw i32 %conv10, %conv11, !dbg !120
  %conv12 = trunc i32 %mul to i8, !dbg !118
  store i8 %conv12, i8* %result, align 1, !dbg !117
  %5 = load i8, i8* %result, align 1, !dbg !121
  call void @printHexCharLine(i8 signext %5), !dbg !122
  br label %if.end14, !dbg !123

if.else13:                                        ; preds = %if.else
  call void @printLine(i8* getelementptr inbounds ([54 x i8], [54 x i8]* @.str.4, i32 0, i32 0)), !dbg !124
  br label %if.end14

if.end14:                                         ; preds = %if.else13, %if.then9
  br label %if.end15

if.end15:                                         ; preds = %if.end14, %if.then2
  ret void, !dbg !126
}

; Function Attrs: nounwind readnone
declare i32 @abs(i32) #3

; Function Attrs: nounwind
declare double @sqrt(double) #4

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !127 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @good35(), !dbg !130
  call void @bad35(), !dbg !131
  ret i32 1, !dbg !132
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readnone "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (tags/RELEASE_390/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, globals: !8)
!1 = !DIFile(filename: "190_35.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/190")
!2 = !{}
!3 = !{!4, !5, !6, !7}
!4 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64, align: 64)
!6 = !DIBasicType(name: "long int", size: 64, align: 64, encoding: DW_ATE_signed)
!7 = !DIBasicType(name: "double", size: 64, align: 64, encoding: DW_ATE_float)
!8 = !{!9}
!9 = distinct !DIGlobalVariable(name: "staticFive", scope: !0, file: !10, line: 10, type: !4, isLocal: true, isDefinition: true, variable: i32* @staticFive)
!10 = !DIFile(filename: "./190_35.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/190")
!11 = !{i32 2, !"Dwarf Version", i32 4}
!12 = !{i32 2, !"Debug Info Version", i32 3}
!13 = !{!"clang version 3.9.0 (tags/RELEASE_390/final)"}
!14 = distinct !DISubprogram(name: "printHexCharLine", scope: !10, file: !10, line: 12, type: !15, isLocal: false, isDefinition: true, scopeLine: 13, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!15 = !DISubroutineType(types: !16)
!16 = !{null, !17}
!17 = !DIBasicType(name: "char", size: 8, align: 8, encoding: DW_ATE_signed_char)
!18 = !DILocalVariable(name: "charHex", arg: 1, scope: !14, file: !10, line: 12, type: !17)
!19 = !DIExpression()
!20 = !DILocation(line: 12, column: 29, scope: !14)
!21 = !DILocation(line: 14, column: 25, scope: !14)
!22 = !DILocation(line: 14, column: 20, scope: !14)
!23 = !DILocation(line: 14, column: 5, scope: !14)
!24 = !DILocation(line: 15, column: 1, scope: !14)
!25 = distinct !DISubprogram(name: "printLine", scope: !10, file: !10, line: 17, type: !26, isLocal: false, isDefinition: true, scopeLine: 18, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!26 = !DISubroutineType(types: !27)
!27 = !{null, !28}
!28 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !29, size: 64, align: 64)
!29 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !17)
!30 = !DILocalVariable(name: "line", arg: 1, scope: !25, file: !10, line: 17, type: !28)
!31 = !DILocation(line: 17, column: 30, scope: !25)
!32 = !DILocation(line: 19, column: 8, scope: !33)
!33 = distinct !DILexicalBlock(scope: !25, file: !10, line: 19, column: 8)
!34 = !DILocation(line: 19, column: 13, scope: !33)
!35 = !DILocation(line: 19, column: 8, scope: !25)
!36 = !DILocation(line: 21, column: 24, scope: !37)
!37 = distinct !DILexicalBlock(scope: !33, file: !10, line: 20, column: 5)
!38 = !DILocation(line: 21, column: 9, scope: !37)
!39 = !DILocation(line: 22, column: 5, scope: !37)
!40 = !DILocation(line: 23, column: 1, scope: !25)
!41 = distinct !DISubprogram(name: "printIntLine", scope: !10, file: !10, line: 25, type: !42, isLocal: false, isDefinition: true, scopeLine: 26, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!42 = !DISubroutineType(types: !43)
!43 = !{null, !4}
!44 = !DILocalVariable(name: "intNumber", arg: 1, scope: !41, file: !10, line: 25, type: !4)
!45 = !DILocation(line: 25, column: 24, scope: !41)
!46 = !DILocation(line: 27, column: 20, scope: !41)
!47 = !DILocation(line: 27, column: 5, scope: !41)
!48 = !DILocation(line: 28, column: 1, scope: !41)
!49 = distinct !DISubprogram(name: "printLongLine", scope: !10, file: !10, line: 30, type: !50, isLocal: false, isDefinition: true, scopeLine: 31, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!50 = !DISubroutineType(types: !51)
!51 = !{null, !52}
!52 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !53, line: 197, baseType: !6)
!53 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/sys/types.h", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/190")
!54 = !DILocalVariable(name: "longIntNumber", arg: 1, scope: !49, file: !10, line: 30, type: !52)
!55 = !DILocation(line: 30, column: 29, scope: !49)
!56 = !DILocation(line: 32, column: 21, scope: !49)
!57 = !DILocation(line: 32, column: 5, scope: !49)
!58 = !DILocation(line: 33, column: 1, scope: !49)
!59 = distinct !DISubprogram(name: "bad35", scope: !10, file: !10, line: 47, type: !60, isLocal: false, isDefinition: true, scopeLine: 48, isOptimized: false, unit: !0, variables: !2)
!60 = !DISubroutineType(types: !61)
!61 = !{null}
!62 = !DILocalVariable(name: "data", scope: !59, file: !10, line: 49, type: !17)
!63 = !DILocation(line: 49, column: 10, scope: !59)
!64 = !DILocation(line: 50, column: 10, scope: !59)
!65 = !DILocation(line: 51, column: 8, scope: !66)
!66 = distinct !DILexicalBlock(scope: !59, file: !10, line: 51, column: 8)
!67 = !DILocation(line: 51, column: 18, scope: !66)
!68 = !DILocation(line: 51, column: 8, scope: !59)
!69 = !DILocation(line: 54, column: 14, scope: !70)
!70 = distinct !DILexicalBlock(scope: !66, file: !10, line: 52, column: 5)
!71 = !DILocation(line: 55, column: 5, scope: !70)
!72 = !DILocation(line: 56, column: 8, scope: !73)
!73 = distinct !DILexicalBlock(scope: !59, file: !10, line: 56, column: 8)
!74 = !DILocation(line: 56, column: 18, scope: !73)
!75 = !DILocation(line: 56, column: 8, scope: !59)
!76 = !DILocalVariable(name: "result", scope: !77, file: !10, line: 60, type: !17)
!77 = distinct !DILexicalBlock(scope: !78, file: !10, line: 58, column: 9)
!78 = distinct !DILexicalBlock(scope: !73, file: !10, line: 57, column: 5)
!79 = !DILocation(line: 60, column: 18, scope: !77)
!80 = !DILocation(line: 60, column: 27, scope: !77)
!81 = !DILocation(line: 60, column: 34, scope: !77)
!82 = !DILocation(line: 60, column: 32, scope: !77)
!83 = !DILocation(line: 61, column: 30, scope: !77)
!84 = !DILocation(line: 61, column: 13, scope: !77)
!85 = !DILocation(line: 63, column: 5, scope: !78)
!86 = !DILocation(line: 64, column: 1, scope: !59)
!87 = distinct !DISubprogram(name: "good35", scope: !10, file: !10, line: 70, type: !60, isLocal: false, isDefinition: true, scopeLine: 71, isOptimized: false, unit: !0, variables: !2)
!88 = !DILocalVariable(name: "data", scope: !87, file: !10, line: 72, type: !17)
!89 = !DILocation(line: 72, column: 10, scope: !87)
!90 = !DILocation(line: 73, column: 10, scope: !87)
!91 = !DILocation(line: 74, column: 8, scope: !92)
!92 = distinct !DILexicalBlock(scope: !87, file: !10, line: 74, column: 8)
!93 = !DILocation(line: 74, column: 18, scope: !92)
!94 = !DILocation(line: 74, column: 8, scope: !87)
!95 = !DILocation(line: 77, column: 14, scope: !96)
!96 = distinct !DILexicalBlock(scope: !92, file: !10, line: 75, column: 5)
!97 = !DILocation(line: 78, column: 5, scope: !96)
!98 = !DILocation(line: 79, column: 8, scope: !99)
!99 = distinct !DILexicalBlock(scope: !87, file: !10, line: 79, column: 8)
!100 = !DILocation(line: 79, column: 18, scope: !99)
!101 = !DILocation(line: 79, column: 8, scope: !87)
!102 = !DILocation(line: 82, column: 9, scope: !103)
!103 = distinct !DILexicalBlock(scope: !99, file: !10, line: 80, column: 5)
!104 = !DILocation(line: 83, column: 5, scope: !103)
!105 = !DILocation(line: 87, column: 23, scope: !106)
!106 = distinct !DILexicalBlock(scope: !107, file: !10, line: 87, column: 13)
!107 = distinct !DILexicalBlock(scope: !99, file: !10, line: 85, column: 5)
!108 = !DILocation(line: 87, column: 17, scope: !106)
!109 = !DILocation(line: 87, column: 13, scope: !106)
!110 = !DILocation(line: 87, column: 38, scope: !111)
!111 = !DILexicalBlockFile(scope: !106, file: !10, discriminator: 1)
!112 = !DILocation(line: 87, column: 32, scope: !106)
!113 = !DILocation(line: 87, column: 29, scope: !106)
!114 = !DILocation(line: 87, column: 13, scope: !107)
!115 = !DILocalVariable(name: "result", scope: !116, file: !10, line: 89, type: !17)
!116 = distinct !DILexicalBlock(scope: !106, file: !10, line: 88, column: 9)
!117 = !DILocation(line: 89, column: 18, scope: !116)
!118 = !DILocation(line: 89, column: 27, scope: !116)
!119 = !DILocation(line: 89, column: 34, scope: !116)
!120 = !DILocation(line: 89, column: 32, scope: !116)
!121 = !DILocation(line: 90, column: 30, scope: !116)
!122 = !DILocation(line: 90, column: 13, scope: !116)
!123 = !DILocation(line: 91, column: 9, scope: !116)
!124 = !DILocation(line: 94, column: 13, scope: !125)
!125 = distinct !DILexicalBlock(scope: !106, file: !10, line: 93, column: 9)
!126 = !DILocation(line: 97, column: 1, scope: !87)
!127 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 101, type: !128, isLocal: false, isDefinition: true, scopeLine: 101, isOptimized: false, unit: !0, variables: !2)
!128 = !DISubroutineType(types: !129)
!129 = !{!4}
!130 = !DILocation(line: 102, column: 5, scope: !127)
!131 = !DILocation(line: 103, column: 5, scope: !127)
!132 = !DILocation(line: 104, column: 5, scope: !127)
