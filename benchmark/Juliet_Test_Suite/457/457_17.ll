; ModuleID = './457_17.c'
source_filename = "./457_17.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@GLOBAL_CONST_TRUE = constant i32 1, align 4
@GLOBAL_CONST_FALSE = constant i32 0, align 4
@GLOBAL_CONST_FIVE = constant i32 5, align 4
@globalTrue = global i32 1, align 4
@globalFalse = global i32 0, align 4
@globalFive = global i32 5, align 4
@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@.str.1 = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1
@.str.2 = private unnamed_addr constant [5 x i8] c"%ld\0A\00", align 1
@.str.3 = private unnamed_addr constant [7 x i8] c"string\00", align 1

; Function Attrs: nounwind uwtable
define i32 @globalReturnsTrue() #0 !dbg !18 {
entry:
  ret i32 1, !dbg !21
}

; Function Attrs: nounwind uwtable
define i32 @globalReturnsFalse() #0 !dbg !22 {
entry:
  ret i32 0, !dbg !23
}

; Function Attrs: nounwind uwtable
define i32 @globalReturnsTrueOrFalse() #0 !dbg !24 {
entry:
  %call = call i32 @rand() #4, !dbg !25
  %rem = srem i32 %call, 2, !dbg !26
  ret i32 %rem, !dbg !27
}

; Function Attrs: nounwind
declare i32 @rand() #1

; Function Attrs: nounwind uwtable
define void @printHexCharLine(i8 signext %charHex) #0 !dbg !28 {
entry:
  %charHex.addr = alloca i8, align 1
  store i8 %charHex, i8* %charHex.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %charHex.addr, metadata !32, metadata !33), !dbg !34
  %0 = load i8, i8* %charHex.addr, align 1, !dbg !35
  %conv = sext i8 %0 to i32, !dbg !36
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), i32 %conv), !dbg !37
  ret void, !dbg !38
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #2

declare i32 @printf(i8*, ...) #3

; Function Attrs: nounwind uwtable
define void @printLine(i8* %line) #0 !dbg !39 {
entry:
  %line.addr = alloca i8*, align 8
  store i8* %line, i8** %line.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %line.addr, metadata !44, metadata !33), !dbg !45
  %0 = load i8*, i8** %line.addr, align 8, !dbg !46
  %cmp = icmp ne i8* %0, null, !dbg !48
  br i1 %cmp, label %if.then, label %if.end, !dbg !49

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** %line.addr, align 8, !dbg !50
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i32 0, i32 0), i8* %1), !dbg !52
  br label %if.end, !dbg !53

if.end:                                           ; preds = %if.then, %entry
  ret void, !dbg !54
}

; Function Attrs: nounwind uwtable
define void @printIntLine(i32 %intNumber) #0 !dbg !55 {
entry:
  %intNumber.addr = alloca i32, align 4
  store i32 %intNumber, i32* %intNumber.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %intNumber.addr, metadata !58, metadata !33), !dbg !59
  %0 = load i32, i32* %intNumber.addr, align 4, !dbg !60
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), i32 %0), !dbg !61
  ret void, !dbg !62
}

; Function Attrs: nounwind uwtable
define void @printLongLine(i64 %longIntNumber) #0 !dbg !63 {
entry:
  %longIntNumber.addr = alloca i64, align 8
  store i64 %longIntNumber, i64* %longIntNumber.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %longIntNumber.addr, metadata !69, metadata !33), !dbg !70
  %0 = load i64, i64* %longIntNumber.addr, align 8, !dbg !71
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.2, i32 0, i32 0), i64 %0), !dbg !72
  ret void, !dbg !73
}

; Function Attrs: nounwind uwtable
define void @bad17() #0 !dbg !74 {
entry:
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %data = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i32* %i, metadata !77, metadata !33), !dbg !78
  call void @llvm.dbg.declare(metadata i32* %j, metadata !79, metadata !33), !dbg !80
  call void @llvm.dbg.declare(metadata i8** %data, metadata !81, metadata !33), !dbg !83
  store i32 0, i32* %i, align 4, !dbg !84
  br label %for.cond, !dbg !86

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !87
  %cmp = icmp slt i32 %0, 1, !dbg !90
  br i1 %cmp, label %for.body, label %for.end, !dbg !91

for.body:                                         ; preds = %for.cond
  br label %for.inc, !dbg !92

for.inc:                                          ; preds = %for.body
  %1 = load i32, i32* %i, align 4, !dbg !94
  %inc = add nsw i32 %1, 1, !dbg !94
  store i32 %inc, i32* %i, align 4, !dbg !94
  br label %for.cond, !dbg !96, !llvm.loop !97

for.end:                                          ; preds = %for.cond
  store i32 0, i32* %j, align 4, !dbg !99
  br label %for.cond1, !dbg !101

for.cond1:                                        ; preds = %for.inc4, %for.end
  %2 = load i32, i32* %j, align 4, !dbg !102
  %cmp2 = icmp slt i32 %2, 1, !dbg !105
  br i1 %cmp2, label %for.body3, label %for.end6, !dbg !106

for.body3:                                        ; preds = %for.cond1
  %3 = load i8*, i8** %data, align 8, !dbg !107
  call void @printLine(i8* %3), !dbg !109
  br label %for.inc4, !dbg !110

for.inc4:                                         ; preds = %for.body3
  %4 = load i32, i32* %j, align 4, !dbg !111
  %inc5 = add nsw i32 %4, 1, !dbg !111
  store i32 %inc5, i32* %j, align 4, !dbg !111
  br label %for.cond1, !dbg !113, !llvm.loop !114

for.end6:                                         ; preds = %for.cond1
  ret void, !dbg !116
}

; Function Attrs: nounwind uwtable
define void @good17() #0 !dbg !117 {
entry:
  %i = alloca i32, align 4
  %k = alloca i32, align 4
  %data = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i32* %i, metadata !118, metadata !33), !dbg !119
  call void @llvm.dbg.declare(metadata i32* %k, metadata !120, metadata !33), !dbg !121
  call void @llvm.dbg.declare(metadata i8** %data, metadata !122, metadata !33), !dbg !123
  store i32 0, i32* %i, align 4, !dbg !124
  br label %for.cond, !dbg !126

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !127
  %cmp = icmp slt i32 %0, 1, !dbg !130
  br i1 %cmp, label %for.body, label %for.end, !dbg !131

for.body:                                         ; preds = %for.cond
  br label %for.inc, !dbg !132

for.inc:                                          ; preds = %for.body
  %1 = load i32, i32* %i, align 4, !dbg !134
  %inc = add nsw i32 %1, 1, !dbg !134
  store i32 %inc, i32* %i, align 4, !dbg !134
  br label %for.cond, !dbg !136, !llvm.loop !137

for.end:                                          ; preds = %for.cond
  store i32 0, i32* %k, align 4, !dbg !139
  br label %for.cond1, !dbg !141

for.cond1:                                        ; preds = %for.inc4, %for.end
  %2 = load i32, i32* %k, align 4, !dbg !142
  %cmp2 = icmp slt i32 %2, 1, !dbg !145
  br i1 %cmp2, label %for.body3, label %for.end6, !dbg !146

for.body3:                                        ; preds = %for.cond1
  store i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.3, i32 0, i32 0), i8** %data, align 8, !dbg !147
  %3 = load i8*, i8** %data, align 8, !dbg !149
  call void @printLine(i8* %3), !dbg !150
  br label %for.inc4, !dbg !151

for.inc4:                                         ; preds = %for.body3
  %4 = load i32, i32* %k, align 4, !dbg !152
  %inc5 = add nsw i32 %4, 1, !dbg !152
  store i32 %inc5, i32* %k, align 4, !dbg !152
  br label %for.cond1, !dbg !154, !llvm.loop !155

for.end6:                                         ; preds = %for.cond1
  ret void, !dbg !157
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !158 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @good17(), !dbg !159
  call void @bad17(), !dbg !160
  ret i32 1, !dbg !161
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone }
attributes #3 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!15, !16}
!llvm.ident = !{!17}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (tags/RELEASE_390/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, globals: !6)
!1 = !DIFile(filename: "457_17.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/457")
!2 = !{}
!3 = !{!4, !5}
!4 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64, align: 64)
!6 = !{!7, !10, !11, !12, !13, !14}
!7 = distinct !DIGlobalVariable(name: "GLOBAL_CONST_TRUE", scope: !0, file: !8, line: 10, type: !9, isLocal: false, isDefinition: true, variable: i32* @GLOBAL_CONST_TRUE)
!8 = !DIFile(filename: "./457_17.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/457")
!9 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !4)
!10 = distinct !DIGlobalVariable(name: "GLOBAL_CONST_FALSE", scope: !0, file: !8, line: 11, type: !9, isLocal: false, isDefinition: true, variable: i32* @GLOBAL_CONST_FALSE)
!11 = distinct !DIGlobalVariable(name: "GLOBAL_CONST_FIVE", scope: !0, file: !8, line: 12, type: !9, isLocal: false, isDefinition: true, variable: i32* @GLOBAL_CONST_FIVE)
!12 = distinct !DIGlobalVariable(name: "globalTrue", scope: !0, file: !8, line: 14, type: !4, isLocal: false, isDefinition: true, variable: i32* @globalTrue)
!13 = distinct !DIGlobalVariable(name: "globalFalse", scope: !0, file: !8, line: 15, type: !4, isLocal: false, isDefinition: true, variable: i32* @globalFalse)
!14 = distinct !DIGlobalVariable(name: "globalFive", scope: !0, file: !8, line: 16, type: !4, isLocal: false, isDefinition: true, variable: i32* @globalFive)
!15 = !{i32 2, !"Dwarf Version", i32 4}
!16 = !{i32 2, !"Debug Info Version", i32 3}
!17 = !{!"clang version 3.9.0 (tags/RELEASE_390/final)"}
!18 = distinct !DISubprogram(name: "globalReturnsTrue", scope: !8, file: !8, line: 18, type: !19, isLocal: false, isDefinition: true, scopeLine: 19, isOptimized: false, unit: !0, variables: !2)
!19 = !DISubroutineType(types: !20)
!20 = !{!4}
!21 = !DILocation(line: 20, column: 5, scope: !18)
!22 = distinct !DISubprogram(name: "globalReturnsFalse", scope: !8, file: !8, line: 23, type: !19, isLocal: false, isDefinition: true, scopeLine: 24, isOptimized: false, unit: !0, variables: !2)
!23 = !DILocation(line: 25, column: 5, scope: !22)
!24 = distinct !DISubprogram(name: "globalReturnsTrueOrFalse", scope: !8, file: !8, line: 28, type: !19, isLocal: false, isDefinition: true, scopeLine: 29, isOptimized: false, unit: !0, variables: !2)
!25 = !DILocation(line: 30, column: 13, scope: !24)
!26 = !DILocation(line: 30, column: 20, scope: !24)
!27 = !DILocation(line: 30, column: 5, scope: !24)
!28 = distinct !DISubprogram(name: "printHexCharLine", scope: !8, file: !8, line: 33, type: !29, isLocal: false, isDefinition: true, scopeLine: 34, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!29 = !DISubroutineType(types: !30)
!30 = !{null, !31}
!31 = !DIBasicType(name: "char", size: 8, align: 8, encoding: DW_ATE_signed_char)
!32 = !DILocalVariable(name: "charHex", arg: 1, scope: !28, file: !8, line: 33, type: !31)
!33 = !DIExpression()
!34 = !DILocation(line: 33, column: 29, scope: !28)
!35 = !DILocation(line: 35, column: 25, scope: !28)
!36 = !DILocation(line: 35, column: 20, scope: !28)
!37 = !DILocation(line: 35, column: 5, scope: !28)
!38 = !DILocation(line: 36, column: 1, scope: !28)
!39 = distinct !DISubprogram(name: "printLine", scope: !8, file: !8, line: 38, type: !40, isLocal: false, isDefinition: true, scopeLine: 39, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!40 = !DISubroutineType(types: !41)
!41 = !{null, !42}
!42 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !43, size: 64, align: 64)
!43 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !31)
!44 = !DILocalVariable(name: "line", arg: 1, scope: !39, file: !8, line: 38, type: !42)
!45 = !DILocation(line: 38, column: 30, scope: !39)
!46 = !DILocation(line: 40, column: 8, scope: !47)
!47 = distinct !DILexicalBlock(scope: !39, file: !8, line: 40, column: 8)
!48 = !DILocation(line: 40, column: 13, scope: !47)
!49 = !DILocation(line: 40, column: 8, scope: !39)
!50 = !DILocation(line: 42, column: 24, scope: !51)
!51 = distinct !DILexicalBlock(scope: !47, file: !8, line: 41, column: 5)
!52 = !DILocation(line: 42, column: 9, scope: !51)
!53 = !DILocation(line: 43, column: 5, scope: !51)
!54 = !DILocation(line: 44, column: 1, scope: !39)
!55 = distinct !DISubprogram(name: "printIntLine", scope: !8, file: !8, line: 46, type: !56, isLocal: false, isDefinition: true, scopeLine: 47, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!56 = !DISubroutineType(types: !57)
!57 = !{null, !4}
!58 = !DILocalVariable(name: "intNumber", arg: 1, scope: !55, file: !8, line: 46, type: !4)
!59 = !DILocation(line: 46, column: 24, scope: !55)
!60 = !DILocation(line: 48, column: 20, scope: !55)
!61 = !DILocation(line: 48, column: 5, scope: !55)
!62 = !DILocation(line: 49, column: 1, scope: !55)
!63 = distinct !DISubprogram(name: "printLongLine", scope: !8, file: !8, line: 51, type: !64, isLocal: false, isDefinition: true, scopeLine: 52, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!64 = !DISubroutineType(types: !65)
!65 = !{null, !66}
!66 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !67, line: 197, baseType: !68)
!67 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/sys/types.h", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/457")
!68 = !DIBasicType(name: "long int", size: 64, align: 64, encoding: DW_ATE_signed)
!69 = !DILocalVariable(name: "longIntNumber", arg: 1, scope: !63, file: !8, line: 51, type: !66)
!70 = !DILocation(line: 51, column: 29, scope: !63)
!71 = !DILocation(line: 53, column: 21, scope: !63)
!72 = !DILocation(line: 53, column: 5, scope: !63)
!73 = !DILocation(line: 54, column: 1, scope: !63)
!74 = distinct !DISubprogram(name: "bad17", scope: !8, file: !8, line: 59, type: !75, isLocal: false, isDefinition: true, scopeLine: 60, isOptimized: false, unit: !0, variables: !2)
!75 = !DISubroutineType(types: !76)
!76 = !{null}
!77 = !DILocalVariable(name: "i", scope: !74, file: !8, line: 61, type: !4)
!78 = !DILocation(line: 61, column: 9, scope: !74)
!79 = !DILocalVariable(name: "j", scope: !74, file: !8, line: 61, type: !4)
!80 = !DILocation(line: 61, column: 11, scope: !74)
!81 = !DILocalVariable(name: "data", scope: !74, file: !8, line: 62, type: !82)
!82 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !31, size: 64, align: 64)
!83 = !DILocation(line: 62, column: 12, scope: !74)
!84 = !DILocation(line: 63, column: 11, scope: !85)
!85 = distinct !DILexicalBlock(scope: !74, file: !8, line: 63, column: 5)
!86 = !DILocation(line: 63, column: 9, scope: !85)
!87 = !DILocation(line: 63, column: 16, scope: !88)
!88 = !DILexicalBlockFile(scope: !89, file: !8, discriminator: 1)
!89 = distinct !DILexicalBlock(scope: !85, file: !8, line: 63, column: 5)
!90 = !DILocation(line: 63, column: 18, scope: !88)
!91 = !DILocation(line: 63, column: 5, scope: !88)
!92 = !DILocation(line: 67, column: 5, scope: !93)
!93 = distinct !DILexicalBlock(scope: !89, file: !8, line: 64, column: 5)
!94 = !DILocation(line: 63, column: 24, scope: !95)
!95 = !DILexicalBlockFile(scope: !89, file: !8, discriminator: 2)
!96 = !DILocation(line: 63, column: 5, scope: !95)
!97 = distinct !{!97, !98}
!98 = !DILocation(line: 63, column: 5, scope: !74)
!99 = !DILocation(line: 68, column: 11, scope: !100)
!100 = distinct !DILexicalBlock(scope: !74, file: !8, line: 68, column: 5)
!101 = !DILocation(line: 68, column: 9, scope: !100)
!102 = !DILocation(line: 68, column: 16, scope: !103)
!103 = !DILexicalBlockFile(scope: !104, file: !8, discriminator: 1)
!104 = distinct !DILexicalBlock(scope: !100, file: !8, line: 68, column: 5)
!105 = !DILocation(line: 68, column: 18, scope: !103)
!106 = !DILocation(line: 68, column: 5, scope: !103)
!107 = !DILocation(line: 71, column: 19, scope: !108)
!108 = distinct !DILexicalBlock(scope: !104, file: !8, line: 69, column: 5)
!109 = !DILocation(line: 71, column: 9, scope: !108)
!110 = !DILocation(line: 72, column: 5, scope: !108)
!111 = !DILocation(line: 68, column: 24, scope: !112)
!112 = !DILexicalBlockFile(scope: !104, file: !8, discriminator: 2)
!113 = !DILocation(line: 68, column: 5, scope: !112)
!114 = distinct !{!114, !115}
!115 = !DILocation(line: 68, column: 5, scope: !74)
!116 = !DILocation(line: 73, column: 1, scope: !74)
!117 = distinct !DISubprogram(name: "good17", scope: !8, file: !8, line: 79, type: !75, isLocal: false, isDefinition: true, scopeLine: 80, isOptimized: false, unit: !0, variables: !2)
!118 = !DILocalVariable(name: "i", scope: !117, file: !8, line: 81, type: !4)
!119 = !DILocation(line: 81, column: 9, scope: !117)
!120 = !DILocalVariable(name: "k", scope: !117, file: !8, line: 81, type: !4)
!121 = !DILocation(line: 81, column: 11, scope: !117)
!122 = !DILocalVariable(name: "data", scope: !117, file: !8, line: 82, type: !82)
!123 = !DILocation(line: 82, column: 12, scope: !117)
!124 = !DILocation(line: 83, column: 11, scope: !125)
!125 = distinct !DILexicalBlock(scope: !117, file: !8, line: 83, column: 5)
!126 = !DILocation(line: 83, column: 9, scope: !125)
!127 = !DILocation(line: 83, column: 16, scope: !128)
!128 = !DILexicalBlockFile(scope: !129, file: !8, discriminator: 1)
!129 = distinct !DILexicalBlock(scope: !125, file: !8, line: 83, column: 5)
!130 = !DILocation(line: 83, column: 18, scope: !128)
!131 = !DILocation(line: 83, column: 5, scope: !128)
!132 = !DILocation(line: 87, column: 5, scope: !133)
!133 = distinct !DILexicalBlock(scope: !129, file: !8, line: 84, column: 5)
!134 = !DILocation(line: 83, column: 24, scope: !135)
!135 = !DILexicalBlockFile(scope: !129, file: !8, discriminator: 2)
!136 = !DILocation(line: 83, column: 5, scope: !135)
!137 = distinct !{!137, !138}
!138 = !DILocation(line: 83, column: 5, scope: !117)
!139 = !DILocation(line: 88, column: 11, scope: !140)
!140 = distinct !DILexicalBlock(scope: !117, file: !8, line: 88, column: 5)
!141 = !DILocation(line: 88, column: 9, scope: !140)
!142 = !DILocation(line: 88, column: 16, scope: !143)
!143 = !DILexicalBlockFile(scope: !144, file: !8, discriminator: 1)
!144 = distinct !DILexicalBlock(scope: !140, file: !8, line: 88, column: 5)
!145 = !DILocation(line: 88, column: 18, scope: !143)
!146 = !DILocation(line: 88, column: 5, scope: !143)
!147 = !DILocation(line: 91, column: 14, scope: !148)
!148 = distinct !DILexicalBlock(scope: !144, file: !8, line: 89, column: 5)
!149 = !DILocation(line: 92, column: 19, scope: !148)
!150 = !DILocation(line: 92, column: 9, scope: !148)
!151 = !DILocation(line: 93, column: 5, scope: !148)
!152 = !DILocation(line: 88, column: 24, scope: !153)
!153 = !DILexicalBlockFile(scope: !144, file: !8, discriminator: 2)
!154 = !DILocation(line: 88, column: 5, scope: !153)
!155 = distinct !{!155, !156}
!156 = !DILocation(line: 88, column: 5, scope: !117)
!157 = !DILocation(line: 94, column: 1, scope: !117)
!158 = distinct !DISubprogram(name: "main", scope: !8, file: !8, line: 99, type: !19, isLocal: false, isDefinition: true, scopeLine: 99, isOptimized: false, unit: !0, variables: !2)
!159 = !DILocation(line: 100, column: 5, scope: !158)
!160 = !DILocation(line: 101, column: 2, scope: !158)
!161 = !DILocation(line: 102, column: 5, scope: !158)
