; ModuleID = './190_9.c'
source_filename = "./190_9.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@GLOBAL_CONST_TRUE = constant i32 1, align 4
@GLOBAL_CONST_FALSE = constant i32 0, align 4
@GLOBAL_CONST_FIVE = constant i32 5, align 4
@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@.str.1 = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1
@.str.2 = private unnamed_addr constant [5 x i8] c"%ld\0A\00", align 1
@.str.3 = private unnamed_addr constant [54 x i8] c"data value is too large to perform arithmetic safely.\00", align 1

; Function Attrs: nounwind uwtable
define void @printHexCharLine(i8 signext %charHex) #0 !dbg !18 {
entry:
  %charHex.addr = alloca i8, align 1
  store i8 %charHex, i8* %charHex.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %charHex.addr, metadata !21, metadata !22), !dbg !23
  %0 = load i8, i8* %charHex.addr, align 1, !dbg !24
  %conv = sext i8 %0 to i32, !dbg !25
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), i32 %conv), !dbg !26
  ret void, !dbg !27
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @printf(i8*, ...) #2

; Function Attrs: nounwind uwtable
define void @printLine(i8* %line) #0 !dbg !28 {
entry:
  %line.addr = alloca i8*, align 8
  store i8* %line, i8** %line.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %line.addr, metadata !33, metadata !22), !dbg !34
  %0 = load i8*, i8** %line.addr, align 8, !dbg !35
  %cmp = icmp ne i8* %0, null, !dbg !37
  br i1 %cmp, label %if.then, label %if.end, !dbg !38

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** %line.addr, align 8, !dbg !39
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i32 0, i32 0), i8* %1), !dbg !41
  br label %if.end, !dbg !42

if.end:                                           ; preds = %if.then, %entry
  ret void, !dbg !43
}

; Function Attrs: nounwind uwtable
define void @printIntLine(i32 %intNumber) #0 !dbg !44 {
entry:
  %intNumber.addr = alloca i32, align 4
  store i32 %intNumber, i32* %intNumber.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %intNumber.addr, metadata !47, metadata !22), !dbg !48
  %0 = load i32, i32* %intNumber.addr, align 4, !dbg !49
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), i32 %0), !dbg !50
  ret void, !dbg !51
}

; Function Attrs: nounwind uwtable
define void @printLongLine(i64 %longIntNumber) #0 !dbg !52 {
entry:
  %longIntNumber.addr = alloca i64, align 8
  store i64 %longIntNumber, i64* %longIntNumber.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %longIntNumber.addr, metadata !57, metadata !22), !dbg !58
  %0 = load i64, i64* %longIntNumber.addr, align 8, !dbg !59
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.2, i32 0, i32 0), i64 %0), !dbg !60
  ret void, !dbg !61
}

; Function Attrs: nounwind uwtable
define void @bad9() #0 !dbg !62 {
entry:
  %data = alloca i8, align 1
  %result = alloca i8, align 1
  call void @llvm.dbg.declare(metadata i8* %data, metadata !65, metadata !22), !dbg !66
  store i8 32, i8* %data, align 1, !dbg !67
  %call = call i32 @rand() #5, !dbg !68
  %conv = trunc i32 %call to i8, !dbg !71
  store i8 %conv, i8* %data, align 1, !dbg !72
  %0 = load i8, i8* %data, align 1, !dbg !73
  %conv1 = sext i8 %0 to i32, !dbg !73
  %cmp = icmp slt i32 %conv1, 0, !dbg !75
  br i1 %cmp, label %if.then, label %if.end, !dbg !76

if.then:                                          ; preds = %entry
  %1 = load i8, i8* %data, align 1, !dbg !77
  %conv3 = sext i8 %1 to i32, !dbg !77
  %sub = sub nsw i32 0, %conv3, !dbg !79
  %conv4 = trunc i32 %sub to i8, !dbg !79
  store i8 %conv4, i8* %data, align 1, !dbg !80
  br label %if.end, !dbg !81

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata i8* %result, metadata !82, metadata !22), !dbg !86
  %2 = load i8, i8* %data, align 1, !dbg !87
  %conv5 = sext i8 %2 to i32, !dbg !87
  %3 = load i8, i8* %data, align 1, !dbg !88
  %conv6 = sext i8 %3 to i32, !dbg !88
  %mul = mul nsw i32 %conv5, %conv6, !dbg !89
  %conv7 = trunc i32 %mul to i8, !dbg !87
  store i8 %conv7, i8* %result, align 1, !dbg !86
  %4 = load i8, i8* %result, align 1, !dbg !90
  call void @printHexCharLine(i8 signext %4), !dbg !91
  ret void, !dbg !92
}

; Function Attrs: nounwind
declare i32 @rand() #3

; Function Attrs: nounwind uwtable
define void @good9() #0 !dbg !93 {
entry:
  %data = alloca i8, align 1
  %result = alloca i8, align 1
  call void @llvm.dbg.declare(metadata i8* %data, metadata !94, metadata !22), !dbg !95
  store i8 32, i8* %data, align 1, !dbg !96
  %call = call i32 @rand() #5, !dbg !97
  %conv = trunc i32 %call to i8, !dbg !100
  store i8 %conv, i8* %data, align 1, !dbg !101
  %0 = load i8, i8* %data, align 1, !dbg !102
  %conv1 = sext i8 %0 to i32, !dbg !102
  %cmp = icmp slt i32 %conv1, 0, !dbg !104
  br i1 %cmp, label %if.then, label %if.end, !dbg !105

if.then:                                          ; preds = %entry
  %1 = load i8, i8* %data, align 1, !dbg !106
  %conv3 = sext i8 %1 to i32, !dbg !106
  %sub = sub nsw i32 0, %conv3, !dbg !108
  %conv4 = trunc i32 %sub to i8, !dbg !108
  store i8 %conv4, i8* %data, align 1, !dbg !109
  br label %if.end, !dbg !110

if.end:                                           ; preds = %if.then, %entry
  %2 = load i8, i8* %data, align 1, !dbg !111
  %conv5 = sext i8 %2 to i64, !dbg !115
  %call6 = call i64 @labs(i64 %conv5) #1, !dbg !116
  %call7 = call double @sqrt(double 1.270000e+02) #5, !dbg !117
  %conv8 = fptosi double %call7 to i64, !dbg !119
  %cmp9 = icmp sle i64 %call6, %conv8, !dbg !120
  br i1 %cmp9, label %if.then11, label %if.else, !dbg !121

if.then11:                                        ; preds = %if.end
  call void @llvm.dbg.declare(metadata i8* %result, metadata !122, metadata !22), !dbg !124
  %3 = load i8, i8* %data, align 1, !dbg !125
  %conv12 = sext i8 %3 to i32, !dbg !125
  %4 = load i8, i8* %data, align 1, !dbg !126
  %conv13 = sext i8 %4 to i32, !dbg !126
  %mul = mul nsw i32 %conv12, %conv13, !dbg !127
  %conv14 = trunc i32 %mul to i8, !dbg !125
  store i8 %conv14, i8* %result, align 1, !dbg !124
  %5 = load i8, i8* %result, align 1, !dbg !128
  call void @printHexCharLine(i8 signext %5), !dbg !129
  br label %if.end15, !dbg !130

if.else:                                          ; preds = %if.end
  call void @printLine(i8* getelementptr inbounds ([54 x i8], [54 x i8]* @.str.3, i32 0, i32 0)), !dbg !131
  br label %if.end15

if.end15:                                         ; preds = %if.else, %if.then11
  ret void, !dbg !133
}

; Function Attrs: nounwind readnone
declare i64 @labs(i64) #4

; Function Attrs: nounwind
declare double @sqrt(double) #3

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !134 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @good9(), !dbg !137
  call void @bad9(), !dbg !138
  ret i32 1, !dbg !139
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readnone "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!15, !16}
!llvm.ident = !{!17}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (tags/RELEASE_390/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, globals: !9)
!1 = !DIFile(filename: "190_9.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/190")
!2 = !{}
!3 = !{!4, !5, !6, !7, !8}
!4 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64, align: 64)
!6 = !DIBasicType(name: "char", size: 8, align: 8, encoding: DW_ATE_signed_char)
!7 = !DIBasicType(name: "long int", size: 64, align: 64, encoding: DW_ATE_signed)
!8 = !DIBasicType(name: "double", size: 64, align: 64, encoding: DW_ATE_float)
!9 = !{!10, !13, !14}
!10 = distinct !DIGlobalVariable(name: "GLOBAL_CONST_TRUE", scope: !0, file: !11, line: 10, type: !12, isLocal: false, isDefinition: true, variable: i32* @GLOBAL_CONST_TRUE)
!11 = !DIFile(filename: "./190_9.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/190")
!12 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !4)
!13 = distinct !DIGlobalVariable(name: "GLOBAL_CONST_FALSE", scope: !0, file: !11, line: 11, type: !12, isLocal: false, isDefinition: true, variable: i32* @GLOBAL_CONST_FALSE)
!14 = distinct !DIGlobalVariable(name: "GLOBAL_CONST_FIVE", scope: !0, file: !11, line: 12, type: !12, isLocal: false, isDefinition: true, variable: i32* @GLOBAL_CONST_FIVE)
!15 = !{i32 2, !"Dwarf Version", i32 4}
!16 = !{i32 2, !"Debug Info Version", i32 3}
!17 = !{!"clang version 3.9.0 (tags/RELEASE_390/final)"}
!18 = distinct !DISubprogram(name: "printHexCharLine", scope: !11, file: !11, line: 14, type: !19, isLocal: false, isDefinition: true, scopeLine: 15, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!19 = !DISubroutineType(types: !20)
!20 = !{null, !6}
!21 = !DILocalVariable(name: "charHex", arg: 1, scope: !18, file: !11, line: 14, type: !6)
!22 = !DIExpression()
!23 = !DILocation(line: 14, column: 29, scope: !18)
!24 = !DILocation(line: 16, column: 25, scope: !18)
!25 = !DILocation(line: 16, column: 20, scope: !18)
!26 = !DILocation(line: 16, column: 5, scope: !18)
!27 = !DILocation(line: 17, column: 1, scope: !18)
!28 = distinct !DISubprogram(name: "printLine", scope: !11, file: !11, line: 19, type: !29, isLocal: false, isDefinition: true, scopeLine: 20, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!29 = !DISubroutineType(types: !30)
!30 = !{null, !31}
!31 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !32, size: 64, align: 64)
!32 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !6)
!33 = !DILocalVariable(name: "line", arg: 1, scope: !28, file: !11, line: 19, type: !31)
!34 = !DILocation(line: 19, column: 30, scope: !28)
!35 = !DILocation(line: 21, column: 8, scope: !36)
!36 = distinct !DILexicalBlock(scope: !28, file: !11, line: 21, column: 8)
!37 = !DILocation(line: 21, column: 13, scope: !36)
!38 = !DILocation(line: 21, column: 8, scope: !28)
!39 = !DILocation(line: 23, column: 24, scope: !40)
!40 = distinct !DILexicalBlock(scope: !36, file: !11, line: 22, column: 5)
!41 = !DILocation(line: 23, column: 9, scope: !40)
!42 = !DILocation(line: 24, column: 5, scope: !40)
!43 = !DILocation(line: 25, column: 1, scope: !28)
!44 = distinct !DISubprogram(name: "printIntLine", scope: !11, file: !11, line: 27, type: !45, isLocal: false, isDefinition: true, scopeLine: 28, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!45 = !DISubroutineType(types: !46)
!46 = !{null, !4}
!47 = !DILocalVariable(name: "intNumber", arg: 1, scope: !44, file: !11, line: 27, type: !4)
!48 = !DILocation(line: 27, column: 24, scope: !44)
!49 = !DILocation(line: 29, column: 20, scope: !44)
!50 = !DILocation(line: 29, column: 5, scope: !44)
!51 = !DILocation(line: 30, column: 1, scope: !44)
!52 = distinct !DISubprogram(name: "printLongLine", scope: !11, file: !11, line: 32, type: !53, isLocal: false, isDefinition: true, scopeLine: 33, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!53 = !DISubroutineType(types: !54)
!54 = !{null, !55}
!55 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !56, line: 197, baseType: !7)
!56 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/sys/types.h", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/190")
!57 = !DILocalVariable(name: "longIntNumber", arg: 1, scope: !52, file: !11, line: 32, type: !55)
!58 = !DILocation(line: 32, column: 29, scope: !52)
!59 = !DILocation(line: 34, column: 21, scope: !52)
!60 = !DILocation(line: 34, column: 5, scope: !52)
!61 = !DILocation(line: 35, column: 1, scope: !52)
!62 = distinct !DISubprogram(name: "bad9", scope: !11, file: !11, line: 38, type: !63, isLocal: false, isDefinition: true, scopeLine: 39, isOptimized: false, unit: !0, variables: !2)
!63 = !DISubroutineType(types: !64)
!64 = !{null}
!65 = !DILocalVariable(name: "data", scope: !62, file: !11, line: 40, type: !6)
!66 = !DILocation(line: 40, column: 10, scope: !62)
!67 = !DILocation(line: 41, column: 10, scope: !62)
!68 = !DILocation(line: 45, column: 22, scope: !69)
!69 = distinct !DILexicalBlock(scope: !70, file: !11, line: 43, column: 5)
!70 = distinct !DILexicalBlock(scope: !62, file: !11, line: 42, column: 8)
!71 = !DILocation(line: 45, column: 16, scope: !69)
!72 = !DILocation(line: 45, column: 14, scope: !69)
!73 = !DILocation(line: 46, column: 13, scope: !74)
!74 = distinct !DILexicalBlock(scope: !69, file: !11, line: 46, column: 13)
!75 = !DILocation(line: 46, column: 18, scope: !74)
!76 = !DILocation(line: 46, column: 13, scope: !69)
!77 = !DILocation(line: 48, column: 21, scope: !78)
!78 = distinct !DILexicalBlock(scope: !74, file: !11, line: 47, column: 9)
!79 = !DILocation(line: 48, column: 20, scope: !78)
!80 = !DILocation(line: 48, column: 18, scope: !78)
!81 = !DILocation(line: 49, column: 9, scope: !78)
!82 = !DILocalVariable(name: "result", scope: !83, file: !11, line: 55, type: !6)
!83 = distinct !DILexicalBlock(scope: !84, file: !11, line: 53, column: 9)
!84 = distinct !DILexicalBlock(scope: !85, file: !11, line: 52, column: 5)
!85 = distinct !DILexicalBlock(scope: !62, file: !11, line: 51, column: 8)
!86 = !DILocation(line: 55, column: 18, scope: !83)
!87 = !DILocation(line: 55, column: 27, scope: !83)
!88 = !DILocation(line: 55, column: 34, scope: !83)
!89 = !DILocation(line: 55, column: 32, scope: !83)
!90 = !DILocation(line: 56, column: 30, scope: !83)
!91 = !DILocation(line: 56, column: 13, scope: !83)
!92 = !DILocation(line: 59, column: 1, scope: !62)
!93 = distinct !DISubprogram(name: "good9", scope: !11, file: !11, line: 61, type: !63, isLocal: false, isDefinition: true, scopeLine: 62, isOptimized: false, unit: !0, variables: !2)
!94 = !DILocalVariable(name: "data", scope: !93, file: !11, line: 63, type: !6)
!95 = !DILocation(line: 63, column: 10, scope: !93)
!96 = !DILocation(line: 64, column: 10, scope: !93)
!97 = !DILocation(line: 68, column: 22, scope: !98)
!98 = distinct !DILexicalBlock(scope: !99, file: !11, line: 66, column: 5)
!99 = distinct !DILexicalBlock(scope: !93, file: !11, line: 65, column: 8)
!100 = !DILocation(line: 68, column: 16, scope: !98)
!101 = !DILocation(line: 68, column: 14, scope: !98)
!102 = !DILocation(line: 69, column: 13, scope: !103)
!103 = distinct !DILexicalBlock(scope: !98, file: !11, line: 69, column: 13)
!104 = !DILocation(line: 69, column: 18, scope: !103)
!105 = !DILocation(line: 69, column: 13, scope: !98)
!106 = !DILocation(line: 71, column: 21, scope: !107)
!107 = distinct !DILexicalBlock(scope: !103, file: !11, line: 70, column: 9)
!108 = !DILocation(line: 71, column: 20, scope: !107)
!109 = !DILocation(line: 71, column: 18, scope: !107)
!110 = !DILocation(line: 72, column: 9, scope: !107)
!111 = !DILocation(line: 82, column: 24, scope: !112)
!112 = distinct !DILexicalBlock(scope: !113, file: !11, line: 82, column: 13)
!113 = distinct !DILexicalBlock(scope: !114, file: !11, line: 80, column: 5)
!114 = distinct !DILexicalBlock(scope: !93, file: !11, line: 74, column: 8)
!115 = !DILocation(line: 82, column: 18, scope: !112)
!116 = !DILocation(line: 82, column: 13, scope: !112)
!117 = !DILocation(line: 82, column: 39, scope: !118)
!118 = !DILexicalBlockFile(scope: !112, file: !11, discriminator: 1)
!119 = !DILocation(line: 82, column: 33, scope: !112)
!120 = !DILocation(line: 82, column: 30, scope: !112)
!121 = !DILocation(line: 82, column: 13, scope: !113)
!122 = !DILocalVariable(name: "result", scope: !123, file: !11, line: 84, type: !6)
!123 = distinct !DILexicalBlock(scope: !112, file: !11, line: 83, column: 9)
!124 = !DILocation(line: 84, column: 18, scope: !123)
!125 = !DILocation(line: 84, column: 27, scope: !123)
!126 = !DILocation(line: 84, column: 34, scope: !123)
!127 = !DILocation(line: 84, column: 32, scope: !123)
!128 = !DILocation(line: 85, column: 30, scope: !123)
!129 = !DILocation(line: 85, column: 13, scope: !123)
!130 = !DILocation(line: 86, column: 9, scope: !123)
!131 = !DILocation(line: 89, column: 13, scope: !132)
!132 = distinct !DILexicalBlock(scope: !112, file: !11, line: 88, column: 9)
!133 = !DILocation(line: 92, column: 1, scope: !93)
!134 = distinct !DISubprogram(name: "main", scope: !11, file: !11, line: 94, type: !135, isLocal: false, isDefinition: true, scopeLine: 94, isOptimized: false, unit: !0, variables: !2)
!135 = !DISubroutineType(types: !136)
!136 = !{!4}
!137 = !DILocation(line: 95, column: 5, scope: !134)
!138 = !DILocation(line: 96, column: 5, scope: !134)
!139 = !DILocation(line: 97, column: 5, scope: !134)
