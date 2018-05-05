; ModuleID = './190_7.c'
source_filename = "./190_7.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@.str.1 = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1
@.str.2 = private unnamed_addr constant [5 x i8] c"%ld\0A\00", align 1
@staticFive = internal global i32 5, align 4
@.str.3 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@.str.4 = private unnamed_addr constant [54 x i8] c"data value is too large to perform arithmetic safely.\00", align 1

; Function Attrs: nounwind uwtable
define void @printHexCharLine(i8 signext %charHex) #0 !dbg !13 {
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
define void @bad7() #0 !dbg !58 {
entry:
  %data = alloca i8, align 1
  %result = alloca i8, align 1
  call void @llvm.dbg.declare(metadata i8* %data, metadata !61, metadata !17), !dbg !62
  store i8 32, i8* %data, align 1, !dbg !63
  %0 = load i32, i32* @staticFive, align 4, !dbg !64
  %cmp = icmp eq i32 %0, 5, !dbg !66
  br i1 %cmp, label %if.then, label %if.end7, !dbg !67

if.then:                                          ; preds = %entry
  %call = call i32 @rand() #4, !dbg !68
  %conv = trunc i32 %call to i8, !dbg !70
  store i8 %conv, i8* %data, align 1, !dbg !71
  %1 = load i8, i8* %data, align 1, !dbg !72
  %conv1 = sext i8 %1 to i32, !dbg !72
  %cmp2 = icmp slt i32 %conv1, 0, !dbg !74
  br i1 %cmp2, label %if.then4, label %if.end, !dbg !75

if.then4:                                         ; preds = %if.then
  %2 = load i8, i8* %data, align 1, !dbg !76
  %conv5 = sext i8 %2 to i32, !dbg !76
  %sub = sub nsw i32 0, %conv5, !dbg !78
  %conv6 = trunc i32 %sub to i8, !dbg !78
  store i8 %conv6, i8* %data, align 1, !dbg !79
  br label %if.end, !dbg !80

if.end:                                           ; preds = %if.then4, %if.then
  %3 = load i8, i8* %data, align 1, !dbg !81
  call void @printHexCharLine(i8 signext %3), !dbg !82
  br label %if.end7, !dbg !83

if.end7:                                          ; preds = %if.end, %entry
  %4 = load i32, i32* @staticFive, align 4, !dbg !84
  %cmp8 = icmp eq i32 %4, 5, !dbg !86
  br i1 %cmp8, label %if.then10, label %if.end13, !dbg !87

if.then10:                                        ; preds = %if.end7
  call void @llvm.dbg.declare(metadata i8* %result, metadata !88, metadata !17), !dbg !91
  %5 = load i8, i8* %data, align 1, !dbg !92
  %conv11 = sext i8 %5 to i32, !dbg !92
  %add = add nsw i32 %conv11, 1, !dbg !93
  %conv12 = trunc i32 %add to i8, !dbg !92
  store i8 %conv12, i8* %result, align 1, !dbg !91
  %6 = load i8, i8* %result, align 1, !dbg !94
  call void @printHexCharLine(i8 signext %6), !dbg !95
  br label %if.end13, !dbg !96

if.end13:                                         ; preds = %if.then10, %if.end7
  ret void, !dbg !97
}

; Function Attrs: nounwind
declare i32 @rand() #3

; Function Attrs: nounwind uwtable
define void @good7() #0 !dbg !98 {
entry:
  %data = alloca i8, align 1
  %result = alloca i8, align 1
  call void @llvm.dbg.declare(metadata i8* %data, metadata !99, metadata !17), !dbg !100
  store i8 32, i8* %data, align 1, !dbg !101
  %0 = load i32, i32* @staticFive, align 4, !dbg !102
  %cmp = icmp eq i32 %0, 5, !dbg !104
  br i1 %cmp, label %if.then, label %if.end7, !dbg !105

if.then:                                          ; preds = %entry
  %call = call i32 @rand() #4, !dbg !106
  %conv = trunc i32 %call to i8, !dbg !108
  store i8 %conv, i8* %data, align 1, !dbg !109
  %1 = load i8, i8* %data, align 1, !dbg !110
  %conv1 = sext i8 %1 to i32, !dbg !110
  %cmp2 = icmp slt i32 %conv1, 0, !dbg !112
  br i1 %cmp2, label %if.then4, label %if.end, !dbg !113

if.then4:                                         ; preds = %if.then
  %2 = load i8, i8* %data, align 1, !dbg !114
  %conv5 = sext i8 %2 to i32, !dbg !114
  %sub = sub nsw i32 0, %conv5, !dbg !116
  %conv6 = trunc i32 %sub to i8, !dbg !116
  store i8 %conv6, i8* %data, align 1, !dbg !117
  br label %if.end, !dbg !118

if.end:                                           ; preds = %if.then4, %if.then
  %3 = load i8, i8* %data, align 1, !dbg !119
  call void @printHexCharLine(i8 signext %3), !dbg !120
  br label %if.end7, !dbg !121

if.end7:                                          ; preds = %if.end, %entry
  %4 = load i32, i32* @staticFive, align 4, !dbg !122
  %cmp8 = icmp ne i32 %4, 5, !dbg !124
  br i1 %cmp8, label %if.then10, label %if.else, !dbg !125

if.then10:                                        ; preds = %if.end7
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.3, i32 0, i32 0)), !dbg !126
  br label %if.end19, !dbg !128

if.else:                                          ; preds = %if.end7
  %5 = load i8, i8* %data, align 1, !dbg !129
  %conv11 = sext i8 %5 to i32, !dbg !129
  %cmp12 = icmp slt i32 %conv11, 127, !dbg !132
  br i1 %cmp12, label %if.then14, label %if.else17, !dbg !133

if.then14:                                        ; preds = %if.else
  call void @llvm.dbg.declare(metadata i8* %result, metadata !134, metadata !17), !dbg !136
  %6 = load i8, i8* %data, align 1, !dbg !137
  %conv15 = sext i8 %6 to i32, !dbg !137
  %add = add nsw i32 %conv15, 1, !dbg !138
  %conv16 = trunc i32 %add to i8, !dbg !137
  store i8 %conv16, i8* %result, align 1, !dbg !136
  %7 = load i8, i8* %result, align 1, !dbg !139
  call void @printHexCharLine(i8 signext %7), !dbg !140
  br label %if.end18, !dbg !141

if.else17:                                        ; preds = %if.else
  call void @printLine(i8* getelementptr inbounds ([54 x i8], [54 x i8]* @.str.4, i32 0, i32 0)), !dbg !142
  br label %if.end18

if.end18:                                         ; preds = %if.else17, %if.then14
  br label %if.end19

if.end19:                                         ; preds = %if.end18, %if.then10
  ret void, !dbg !144
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !145 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @good7(), !dbg !148
  call void @bad7(), !dbg !149
  ret i32 1, !dbg !150
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (tags/RELEASE_390/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, globals: !7)
!1 = !DIFile(filename: "190_7.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/190")
!2 = !{}
!3 = !{!4, !5, !6}
!4 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64, align: 64)
!6 = !DIBasicType(name: "char", size: 8, align: 8, encoding: DW_ATE_signed_char)
!7 = !{!8}
!8 = distinct !DIGlobalVariable(name: "staticFive", scope: !0, file: !9, line: 10, type: !4, isLocal: true, isDefinition: true, variable: i32* @staticFive)
!9 = !DIFile(filename: "./190_7.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/190")
!10 = !{i32 2, !"Dwarf Version", i32 4}
!11 = !{i32 2, !"Debug Info Version", i32 3}
!12 = !{!"clang version 3.9.0 (tags/RELEASE_390/final)"}
!13 = distinct !DISubprogram(name: "printHexCharLine", scope: !9, file: !9, line: 12, type: !14, isLocal: false, isDefinition: true, scopeLine: 13, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!14 = !DISubroutineType(types: !15)
!15 = !{null, !6}
!16 = !DILocalVariable(name: "charHex", arg: 1, scope: !13, file: !9, line: 12, type: !6)
!17 = !DIExpression()
!18 = !DILocation(line: 12, column: 29, scope: !13)
!19 = !DILocation(line: 14, column: 25, scope: !13)
!20 = !DILocation(line: 14, column: 20, scope: !13)
!21 = !DILocation(line: 14, column: 5, scope: !13)
!22 = !DILocation(line: 15, column: 1, scope: !13)
!23 = distinct !DISubprogram(name: "printLine", scope: !9, file: !9, line: 17, type: !24, isLocal: false, isDefinition: true, scopeLine: 18, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!24 = !DISubroutineType(types: !25)
!25 = !{null, !26}
!26 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !27, size: 64, align: 64)
!27 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !6)
!28 = !DILocalVariable(name: "line", arg: 1, scope: !23, file: !9, line: 17, type: !26)
!29 = !DILocation(line: 17, column: 30, scope: !23)
!30 = !DILocation(line: 19, column: 8, scope: !31)
!31 = distinct !DILexicalBlock(scope: !23, file: !9, line: 19, column: 8)
!32 = !DILocation(line: 19, column: 13, scope: !31)
!33 = !DILocation(line: 19, column: 8, scope: !23)
!34 = !DILocation(line: 21, column: 24, scope: !35)
!35 = distinct !DILexicalBlock(scope: !31, file: !9, line: 20, column: 5)
!36 = !DILocation(line: 21, column: 9, scope: !35)
!37 = !DILocation(line: 22, column: 5, scope: !35)
!38 = !DILocation(line: 23, column: 1, scope: !23)
!39 = distinct !DISubprogram(name: "printIntLine", scope: !9, file: !9, line: 25, type: !40, isLocal: false, isDefinition: true, scopeLine: 26, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!40 = !DISubroutineType(types: !41)
!41 = !{null, !4}
!42 = !DILocalVariable(name: "intNumber", arg: 1, scope: !39, file: !9, line: 25, type: !4)
!43 = !DILocation(line: 25, column: 24, scope: !39)
!44 = !DILocation(line: 27, column: 20, scope: !39)
!45 = !DILocation(line: 27, column: 5, scope: !39)
!46 = !DILocation(line: 28, column: 1, scope: !39)
!47 = distinct !DISubprogram(name: "printLongLine", scope: !9, file: !9, line: 30, type: !48, isLocal: false, isDefinition: true, scopeLine: 31, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!48 = !DISubroutineType(types: !49)
!49 = !{null, !50}
!50 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !51, line: 197, baseType: !52)
!51 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/sys/types.h", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/190")
!52 = !DIBasicType(name: "long int", size: 64, align: 64, encoding: DW_ATE_signed)
!53 = !DILocalVariable(name: "longIntNumber", arg: 1, scope: !47, file: !9, line: 30, type: !50)
!54 = !DILocation(line: 30, column: 29, scope: !47)
!55 = !DILocation(line: 32, column: 21, scope: !47)
!56 = !DILocation(line: 32, column: 5, scope: !47)
!57 = !DILocation(line: 33, column: 1, scope: !47)
!58 = distinct !DISubprogram(name: "bad7", scope: !9, file: !9, line: 36, type: !59, isLocal: false, isDefinition: true, scopeLine: 37, isOptimized: false, unit: !0, variables: !2)
!59 = !DISubroutineType(types: !60)
!60 = !{null}
!61 = !DILocalVariable(name: "data", scope: !58, file: !9, line: 38, type: !6)
!62 = !DILocation(line: 38, column: 10, scope: !58)
!63 = !DILocation(line: 39, column: 10, scope: !58)
!64 = !DILocation(line: 40, column: 8, scope: !65)
!65 = distinct !DILexicalBlock(scope: !58, file: !9, line: 40, column: 8)
!66 = !DILocation(line: 40, column: 18, scope: !65)
!67 = !DILocation(line: 40, column: 8, scope: !58)
!68 = !DILocation(line: 43, column: 22, scope: !69)
!69 = distinct !DILexicalBlock(scope: !65, file: !9, line: 41, column: 5)
!70 = !DILocation(line: 43, column: 16, scope: !69)
!71 = !DILocation(line: 43, column: 14, scope: !69)
!72 = !DILocation(line: 44, column: 13, scope: !73)
!73 = distinct !DILexicalBlock(scope: !69, file: !9, line: 44, column: 13)
!74 = !DILocation(line: 44, column: 18, scope: !73)
!75 = !DILocation(line: 44, column: 13, scope: !69)
!76 = !DILocation(line: 46, column: 21, scope: !77)
!77 = distinct !DILexicalBlock(scope: !73, file: !9, line: 45, column: 9)
!78 = !DILocation(line: 46, column: 20, scope: !77)
!79 = !DILocation(line: 46, column: 18, scope: !77)
!80 = !DILocation(line: 47, column: 9, scope: !77)
!81 = !DILocation(line: 48, column: 26, scope: !69)
!82 = !DILocation(line: 48, column: 9, scope: !69)
!83 = !DILocation(line: 49, column: 5, scope: !69)
!84 = !DILocation(line: 50, column: 8, scope: !85)
!85 = distinct !DILexicalBlock(scope: !58, file: !9, line: 50, column: 8)
!86 = !DILocation(line: 50, column: 18, scope: !85)
!87 = !DILocation(line: 50, column: 8, scope: !58)
!88 = !DILocalVariable(name: "result", scope: !89, file: !9, line: 54, type: !6)
!89 = distinct !DILexicalBlock(scope: !90, file: !9, line: 52, column: 9)
!90 = distinct !DILexicalBlock(scope: !85, file: !9, line: 51, column: 5)
!91 = !DILocation(line: 54, column: 18, scope: !89)
!92 = !DILocation(line: 54, column: 27, scope: !89)
!93 = !DILocation(line: 54, column: 32, scope: !89)
!94 = !DILocation(line: 55, column: 30, scope: !89)
!95 = !DILocation(line: 55, column: 13, scope: !89)
!96 = !DILocation(line: 57, column: 5, scope: !90)
!97 = !DILocation(line: 58, column: 1, scope: !58)
!98 = distinct !DISubprogram(name: "good7", scope: !9, file: !9, line: 60, type: !59, isLocal: false, isDefinition: true, scopeLine: 61, isOptimized: false, unit: !0, variables: !2)
!99 = !DILocalVariable(name: "data", scope: !98, file: !9, line: 62, type: !6)
!100 = !DILocation(line: 62, column: 10, scope: !98)
!101 = !DILocation(line: 63, column: 10, scope: !98)
!102 = !DILocation(line: 64, column: 8, scope: !103)
!103 = distinct !DILexicalBlock(scope: !98, file: !9, line: 64, column: 8)
!104 = !DILocation(line: 64, column: 18, scope: !103)
!105 = !DILocation(line: 64, column: 8, scope: !98)
!106 = !DILocation(line: 67, column: 22, scope: !107)
!107 = distinct !DILexicalBlock(scope: !103, file: !9, line: 65, column: 5)
!108 = !DILocation(line: 67, column: 16, scope: !107)
!109 = !DILocation(line: 67, column: 14, scope: !107)
!110 = !DILocation(line: 68, column: 13, scope: !111)
!111 = distinct !DILexicalBlock(scope: !107, file: !9, line: 68, column: 13)
!112 = !DILocation(line: 68, column: 18, scope: !111)
!113 = !DILocation(line: 68, column: 13, scope: !107)
!114 = !DILocation(line: 70, column: 21, scope: !115)
!115 = distinct !DILexicalBlock(scope: !111, file: !9, line: 69, column: 9)
!116 = !DILocation(line: 70, column: 20, scope: !115)
!117 = !DILocation(line: 70, column: 18, scope: !115)
!118 = !DILocation(line: 71, column: 9, scope: !115)
!119 = !DILocation(line: 72, column: 26, scope: !107)
!120 = !DILocation(line: 72, column: 9, scope: !107)
!121 = !DILocation(line: 73, column: 5, scope: !107)
!122 = !DILocation(line: 74, column: 8, scope: !123)
!123 = distinct !DILexicalBlock(scope: !98, file: !9, line: 74, column: 8)
!124 = !DILocation(line: 74, column: 18, scope: !123)
!125 = !DILocation(line: 74, column: 8, scope: !98)
!126 = !DILocation(line: 77, column: 9, scope: !127)
!127 = distinct !DILexicalBlock(scope: !123, file: !9, line: 75, column: 5)
!128 = !DILocation(line: 78, column: 5, scope: !127)
!129 = !DILocation(line: 82, column: 13, scope: !130)
!130 = distinct !DILexicalBlock(scope: !131, file: !9, line: 82, column: 13)
!131 = distinct !DILexicalBlock(scope: !123, file: !9, line: 80, column: 5)
!132 = !DILocation(line: 82, column: 18, scope: !130)
!133 = !DILocation(line: 82, column: 13, scope: !131)
!134 = !DILocalVariable(name: "result", scope: !135, file: !9, line: 84, type: !6)
!135 = distinct !DILexicalBlock(scope: !130, file: !9, line: 83, column: 9)
!136 = !DILocation(line: 84, column: 18, scope: !135)
!137 = !DILocation(line: 84, column: 27, scope: !135)
!138 = !DILocation(line: 84, column: 32, scope: !135)
!139 = !DILocation(line: 85, column: 30, scope: !135)
!140 = !DILocation(line: 85, column: 13, scope: !135)
!141 = !DILocation(line: 86, column: 9, scope: !135)
!142 = !DILocation(line: 89, column: 13, scope: !143)
!143 = distinct !DILexicalBlock(scope: !130, file: !9, line: 88, column: 9)
!144 = !DILocation(line: 92, column: 1, scope: !98)
!145 = distinct !DISubprogram(name: "main", scope: !9, file: !9, line: 95, type: !146, isLocal: false, isDefinition: true, scopeLine: 95, isOptimized: false, unit: !0, variables: !2)
!146 = !DISubroutineType(types: !147)
!147 = !{!4}
!148 = !DILocation(line: 96, column: 5, scope: !145)
!149 = !DILocation(line: 97, column: 5, scope: !145)
!150 = !DILocation(line: 98, column: 5, scope: !145)
