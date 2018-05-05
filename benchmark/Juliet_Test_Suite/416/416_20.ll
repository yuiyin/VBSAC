; ModuleID = './416_20.c'
source_filename = "./416_20.c"
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
@.str.3 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: nounwind uwtable
define i32 @globalReturnsTrue() #0 !dbg !20 {
entry:
  ret i32 1, !dbg !23
}

; Function Attrs: nounwind uwtable
define i32 @globalReturnsFalse() #0 !dbg !24 {
entry:
  ret i32 0, !dbg !25
}

; Function Attrs: nounwind uwtable
define i32 @globalReturnsTrueOrFalse() #0 !dbg !26 {
entry:
  %call = call i32 @rand() #4, !dbg !27
  %rem = srem i32 %call, 2, !dbg !28
  ret i32 %rem, !dbg !29
}

; Function Attrs: nounwind
declare i32 @rand() #1

; Function Attrs: nounwind uwtable
define void @printHexCharLine(i8 signext %charHex) #0 !dbg !30 {
entry:
  %charHex.addr = alloca i8, align 1
  store i8 %charHex, i8* %charHex.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %charHex.addr, metadata !34, metadata !35), !dbg !36
  %0 = load i8, i8* %charHex.addr, align 1, !dbg !37
  %conv = sext i8 %0 to i32, !dbg !38
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), i32 %conv), !dbg !39
  ret void, !dbg !40
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #2

declare i32 @printf(i8*, ...) #3

; Function Attrs: nounwind uwtable
define void @printLine(i8* %line) #0 !dbg !41 {
entry:
  %line.addr = alloca i8*, align 8
  store i8* %line, i8** %line.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %line.addr, metadata !46, metadata !35), !dbg !47
  %0 = load i8*, i8** %line.addr, align 8, !dbg !48
  %cmp = icmp ne i8* %0, null, !dbg !50
  br i1 %cmp, label %if.then, label %if.end, !dbg !51

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** %line.addr, align 8, !dbg !52
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i32 0, i32 0), i8* %1), !dbg !54
  br label %if.end, !dbg !55

if.end:                                           ; preds = %if.then, %entry
  ret void, !dbg !56
}

; Function Attrs: nounwind uwtable
define void @printIntLine(i32 %intNumber) #0 !dbg !57 {
entry:
  %intNumber.addr = alloca i32, align 4
  store i32 %intNumber, i32* %intNumber.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %intNumber.addr, metadata !60, metadata !35), !dbg !61
  %0 = load i32, i32* %intNumber.addr, align 4, !dbg !62
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), i32 %0), !dbg !63
  ret void, !dbg !64
}

; Function Attrs: nounwind uwtable
define void @printLongLine(i64 %longIntNumber) #0 !dbg !65 {
entry:
  %longIntNumber.addr = alloca i64, align 8
  store i64 %longIntNumber, i64* %longIntNumber.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %longIntNumber.addr, metadata !70, metadata !35), !dbg !71
  %0 = load i64, i64* %longIntNumber.addr, align 8, !dbg !72
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.2, i32 0, i32 0), i64 %0), !dbg !73
  ret void, !dbg !74
}

; Function Attrs: nounwind uwtable
define void @bad20() #0 !dbg !75 {
entry:
  %data = alloca i64*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !78, metadata !35), !dbg !79
  store i64* null, i64** %data, align 8, !dbg !80
  %call = call i32 @staticReturnsTrue(), !dbg !81
  %tobool = icmp ne i32 %call, 0, !dbg !81
  br i1 %tobool, label %if.then, label %if.end4, !dbg !83

if.then:                                          ; preds = %entry
  %call1 = call noalias i8* @malloc(i64 800) #4, !dbg !84
  %0 = bitcast i8* %call1 to i64*, !dbg !86
  store i64* %0, i64** %data, align 8, !dbg !87
  %1 = load i64*, i64** %data, align 8, !dbg !88
  %cmp = icmp eq i64* %1, null, !dbg !90
  br i1 %cmp, label %if.then2, label %if.end, !dbg !91

if.then2:                                         ; preds = %if.then
  br label %if.end9, !dbg !92

if.end:                                           ; preds = %if.then
  call void @llvm.dbg.declare(metadata i64* %i, metadata !94, metadata !35), !dbg !99
  store i64 0, i64* %i, align 8, !dbg !100
  br label %for.cond, !dbg !102

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !103
  %cmp3 = icmp ult i64 %2, 100, !dbg !106
  br i1 %cmp3, label %for.body, label %for.end, !dbg !107

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !108
  %4 = load i64*, i64** %data, align 8, !dbg !110
  %arrayidx = getelementptr inbounds i64, i64* %4, i64 %3, !dbg !110
  store i64 5, i64* %arrayidx, align 8, !dbg !111
  br label %for.inc, !dbg !112

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !113
  %inc = add i64 %5, 1, !dbg !113
  store i64 %inc, i64* %i, align 8, !dbg !113
  br label %for.cond, !dbg !115, !llvm.loop !116

for.end:                                          ; preds = %for.cond
  %6 = load i64*, i64** %data, align 8, !dbg !118
  %7 = bitcast i64* %6 to i8*, !dbg !118
  call void @free(i8* %7) #4, !dbg !119
  br label %if.end4, !dbg !120

if.end4:                                          ; preds = %for.end, %entry
  %call5 = call i32 @staticReturnsTrue(), !dbg !121
  %tobool6 = icmp ne i32 %call5, 0, !dbg !121
  br i1 %tobool6, label %if.then7, label %if.end9, !dbg !123

if.then7:                                         ; preds = %if.end4
  %8 = load i64*, i64** %data, align 8, !dbg !124
  %arrayidx8 = getelementptr inbounds i64, i64* %8, i64 0, !dbg !124
  %9 = load i64, i64* %arrayidx8, align 8, !dbg !124
  call void @printLongLine(i64 %9), !dbg !126
  br label %if.end9, !dbg !127

if.end9:                                          ; preds = %if.then2, %if.then7, %if.end4
  ret void, !dbg !128
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #1

; Function Attrs: nounwind
declare void @free(i8*) #1

; Function Attrs: nounwind uwtable
define void @good20() #0 !dbg !129 {
entry:
  %data = alloca i64*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !130, metadata !35), !dbg !131
  store i64* null, i64** %data, align 8, !dbg !132
  %call = call i32 @staticReturnsTrue(), !dbg !133
  %tobool = icmp ne i32 %call, 0, !dbg !133
  br i1 %tobool, label %if.then, label %if.end4, !dbg !135

if.then:                                          ; preds = %entry
  %call1 = call noalias i8* @malloc(i64 800) #4, !dbg !136
  %0 = bitcast i8* %call1 to i64*, !dbg !138
  store i64* %0, i64** %data, align 8, !dbg !139
  %1 = load i64*, i64** %data, align 8, !dbg !140
  %cmp = icmp eq i64* %1, null, !dbg !142
  br i1 %cmp, label %if.then2, label %if.end, !dbg !143

if.then2:                                         ; preds = %if.then
  br label %if.end8, !dbg !144

if.end:                                           ; preds = %if.then
  call void @llvm.dbg.declare(metadata i64* %i, metadata !146, metadata !35), !dbg !148
  store i64 0, i64* %i, align 8, !dbg !149
  br label %for.cond, !dbg !151

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !152
  %cmp3 = icmp ult i64 %2, 100, !dbg !155
  br i1 %cmp3, label %for.body, label %for.end, !dbg !156

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !157
  %4 = load i64*, i64** %data, align 8, !dbg !159
  %arrayidx = getelementptr inbounds i64, i64* %4, i64 %3, !dbg !159
  store i64 5, i64* %arrayidx, align 8, !dbg !160
  br label %for.inc, !dbg !161

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !162
  %inc = add i64 %5, 1, !dbg !162
  store i64 %inc, i64* %i, align 8, !dbg !162
  br label %for.cond, !dbg !164, !llvm.loop !165

for.end:                                          ; preds = %for.cond
  %6 = load i64*, i64** %data, align 8, !dbg !167
  %7 = bitcast i64* %6 to i8*, !dbg !167
  call void @free(i8* %7) #4, !dbg !168
  br label %if.end4, !dbg !169

if.end4:                                          ; preds = %for.end, %entry
  %call5 = call i32 @staticReturnsFalse(), !dbg !170
  %tobool6 = icmp ne i32 %call5, 0, !dbg !170
  br i1 %tobool6, label %if.then7, label %if.else, !dbg !172

if.then7:                                         ; preds = %if.end4
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.3, i32 0, i32 0)), !dbg !173
  br label %if.end8, !dbg !175

if.else:                                          ; preds = %if.end4
  br label %if.end8

if.end8:                                          ; preds = %if.then2, %if.else, %if.then7
  ret void, !dbg !176
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !177 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @good20(), !dbg !178
  call void @bad20(), !dbg !179
  ret i32 1, !dbg !180
}

; Function Attrs: nounwind uwtable
define internal i32 @staticReturnsTrue() #0 !dbg !181 {
entry:
  ret i32 1, !dbg !182
}

; Function Attrs: nounwind uwtable
define internal i32 @staticReturnsFalse() #0 !dbg !183 {
entry:
  ret i32 0, !dbg !184
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone }
attributes #3 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!17, !18}
!llvm.ident = !{!19}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (tags/RELEASE_390/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, globals: !8)
!1 = !DIFile(filename: "416_20.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/416")
!2 = !{}
!3 = !{!4, !5, !6}
!4 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64, align: 64)
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64, align: 64)
!7 = !DIBasicType(name: "long int", size: 64, align: 64, encoding: DW_ATE_signed)
!8 = !{!9, !12, !13, !14, !15, !16}
!9 = distinct !DIGlobalVariable(name: "GLOBAL_CONST_TRUE", scope: !0, file: !10, line: 10, type: !11, isLocal: false, isDefinition: true, variable: i32* @GLOBAL_CONST_TRUE)
!10 = !DIFile(filename: "./416_20.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/416")
!11 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !4)
!12 = distinct !DIGlobalVariable(name: "GLOBAL_CONST_FALSE", scope: !0, file: !10, line: 11, type: !11, isLocal: false, isDefinition: true, variable: i32* @GLOBAL_CONST_FALSE)
!13 = distinct !DIGlobalVariable(name: "GLOBAL_CONST_FIVE", scope: !0, file: !10, line: 12, type: !11, isLocal: false, isDefinition: true, variable: i32* @GLOBAL_CONST_FIVE)
!14 = distinct !DIGlobalVariable(name: "globalTrue", scope: !0, file: !10, line: 14, type: !4, isLocal: false, isDefinition: true, variable: i32* @globalTrue)
!15 = distinct !DIGlobalVariable(name: "globalFalse", scope: !0, file: !10, line: 15, type: !4, isLocal: false, isDefinition: true, variable: i32* @globalFalse)
!16 = distinct !DIGlobalVariable(name: "globalFive", scope: !0, file: !10, line: 16, type: !4, isLocal: false, isDefinition: true, variable: i32* @globalFive)
!17 = !{i32 2, !"Dwarf Version", i32 4}
!18 = !{i32 2, !"Debug Info Version", i32 3}
!19 = !{!"clang version 3.9.0 (tags/RELEASE_390/final)"}
!20 = distinct !DISubprogram(name: "globalReturnsTrue", scope: !10, file: !10, line: 18, type: !21, isLocal: false, isDefinition: true, scopeLine: 19, isOptimized: false, unit: !0, variables: !2)
!21 = !DISubroutineType(types: !22)
!22 = !{!4}
!23 = !DILocation(line: 20, column: 5, scope: !20)
!24 = distinct !DISubprogram(name: "globalReturnsFalse", scope: !10, file: !10, line: 23, type: !21, isLocal: false, isDefinition: true, scopeLine: 24, isOptimized: false, unit: !0, variables: !2)
!25 = !DILocation(line: 25, column: 5, scope: !24)
!26 = distinct !DISubprogram(name: "globalReturnsTrueOrFalse", scope: !10, file: !10, line: 28, type: !21, isLocal: false, isDefinition: true, scopeLine: 29, isOptimized: false, unit: !0, variables: !2)
!27 = !DILocation(line: 30, column: 13, scope: !26)
!28 = !DILocation(line: 30, column: 20, scope: !26)
!29 = !DILocation(line: 30, column: 5, scope: !26)
!30 = distinct !DISubprogram(name: "printHexCharLine", scope: !10, file: !10, line: 33, type: !31, isLocal: false, isDefinition: true, scopeLine: 34, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!31 = !DISubroutineType(types: !32)
!32 = !{null, !33}
!33 = !DIBasicType(name: "char", size: 8, align: 8, encoding: DW_ATE_signed_char)
!34 = !DILocalVariable(name: "charHex", arg: 1, scope: !30, file: !10, line: 33, type: !33)
!35 = !DIExpression()
!36 = !DILocation(line: 33, column: 29, scope: !30)
!37 = !DILocation(line: 35, column: 25, scope: !30)
!38 = !DILocation(line: 35, column: 20, scope: !30)
!39 = !DILocation(line: 35, column: 5, scope: !30)
!40 = !DILocation(line: 36, column: 1, scope: !30)
!41 = distinct !DISubprogram(name: "printLine", scope: !10, file: !10, line: 38, type: !42, isLocal: false, isDefinition: true, scopeLine: 39, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!42 = !DISubroutineType(types: !43)
!43 = !{null, !44}
!44 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !45, size: 64, align: 64)
!45 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !33)
!46 = !DILocalVariable(name: "line", arg: 1, scope: !41, file: !10, line: 38, type: !44)
!47 = !DILocation(line: 38, column: 30, scope: !41)
!48 = !DILocation(line: 40, column: 8, scope: !49)
!49 = distinct !DILexicalBlock(scope: !41, file: !10, line: 40, column: 8)
!50 = !DILocation(line: 40, column: 13, scope: !49)
!51 = !DILocation(line: 40, column: 8, scope: !41)
!52 = !DILocation(line: 42, column: 24, scope: !53)
!53 = distinct !DILexicalBlock(scope: !49, file: !10, line: 41, column: 5)
!54 = !DILocation(line: 42, column: 9, scope: !53)
!55 = !DILocation(line: 43, column: 5, scope: !53)
!56 = !DILocation(line: 44, column: 1, scope: !41)
!57 = distinct !DISubprogram(name: "printIntLine", scope: !10, file: !10, line: 46, type: !58, isLocal: false, isDefinition: true, scopeLine: 47, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!58 = !DISubroutineType(types: !59)
!59 = !{null, !4}
!60 = !DILocalVariable(name: "intNumber", arg: 1, scope: !57, file: !10, line: 46, type: !4)
!61 = !DILocation(line: 46, column: 24, scope: !57)
!62 = !DILocation(line: 48, column: 20, scope: !57)
!63 = !DILocation(line: 48, column: 5, scope: !57)
!64 = !DILocation(line: 49, column: 1, scope: !57)
!65 = distinct !DISubprogram(name: "printLongLine", scope: !10, file: !10, line: 51, type: !66, isLocal: false, isDefinition: true, scopeLine: 52, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!66 = !DISubroutineType(types: !67)
!67 = !{null, !68}
!68 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !69, line: 197, baseType: !7)
!69 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/sys/types.h", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/416")
!70 = !DILocalVariable(name: "longIntNumber", arg: 1, scope: !65, file: !10, line: 51, type: !68)
!71 = !DILocation(line: 51, column: 29, scope: !65)
!72 = !DILocation(line: 53, column: 21, scope: !65)
!73 = !DILocation(line: 53, column: 5, scope: !65)
!74 = !DILocation(line: 54, column: 1, scope: !65)
!75 = distinct !DISubprogram(name: "bad20", scope: !10, file: !10, line: 69, type: !76, isLocal: false, isDefinition: true, scopeLine: 70, isOptimized: false, unit: !0, variables: !2)
!76 = !DISubroutineType(types: !77)
!77 = !{null}
!78 = !DILocalVariable(name: "data", scope: !75, file: !10, line: 71, type: !6)
!79 = !DILocation(line: 71, column: 12, scope: !75)
!80 = !DILocation(line: 73, column: 10, scope: !75)
!81 = !DILocation(line: 74, column: 8, scope: !82)
!82 = distinct !DILexicalBlock(scope: !75, file: !10, line: 74, column: 8)
!83 = !DILocation(line: 74, column: 8, scope: !75)
!84 = !DILocation(line: 76, column: 24, scope: !85)
!85 = distinct !DILexicalBlock(scope: !82, file: !10, line: 75, column: 5)
!86 = !DILocation(line: 76, column: 16, scope: !85)
!87 = !DILocation(line: 76, column: 14, scope: !85)
!88 = !DILocation(line: 77, column: 13, scope: !89)
!89 = distinct !DILexicalBlock(scope: !85, file: !10, line: 77, column: 13)
!90 = !DILocation(line: 77, column: 18, scope: !89)
!91 = !DILocation(line: 77, column: 13, scope: !85)
!92 = !DILocation(line: 77, column: 27, scope: !93)
!93 = !DILexicalBlockFile(scope: !89, file: !10, discriminator: 1)
!94 = !DILocalVariable(name: "i", scope: !95, file: !10, line: 79, type: !96)
!95 = distinct !DILexicalBlock(scope: !85, file: !10, line: 78, column: 9)
!96 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !97, line: 62, baseType: !98)
!97 = !DIFile(filename: "/usr/local/bin/../lib/clang/3.9.0/include/stddef.h", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/416")
!98 = !DIBasicType(name: "long unsigned int", size: 64, align: 64, encoding: DW_ATE_unsigned)
!99 = !DILocation(line: 79, column: 20, scope: !95)
!100 = !DILocation(line: 80, column: 19, scope: !101)
!101 = distinct !DILexicalBlock(scope: !95, file: !10, line: 80, column: 13)
!102 = !DILocation(line: 80, column: 17, scope: !101)
!103 = !DILocation(line: 80, column: 24, scope: !104)
!104 = !DILexicalBlockFile(scope: !105, file: !10, discriminator: 1)
!105 = distinct !DILexicalBlock(scope: !101, file: !10, line: 80, column: 13)
!106 = !DILocation(line: 80, column: 26, scope: !104)
!107 = !DILocation(line: 80, column: 13, scope: !104)
!108 = !DILocation(line: 82, column: 22, scope: !109)
!109 = distinct !DILexicalBlock(scope: !105, file: !10, line: 81, column: 13)
!110 = !DILocation(line: 82, column: 17, scope: !109)
!111 = !DILocation(line: 82, column: 25, scope: !109)
!112 = !DILocation(line: 83, column: 13, scope: !109)
!113 = !DILocation(line: 80, column: 34, scope: !114)
!114 = !DILexicalBlockFile(scope: !105, file: !10, discriminator: 2)
!115 = !DILocation(line: 80, column: 13, scope: !114)
!116 = distinct !{!116, !117}
!117 = !DILocation(line: 80, column: 13, scope: !95)
!118 = !DILocation(line: 86, column: 14, scope: !85)
!119 = !DILocation(line: 86, column: 9, scope: !85)
!120 = !DILocation(line: 87, column: 5, scope: !85)
!121 = !DILocation(line: 88, column: 8, scope: !122)
!122 = distinct !DILexicalBlock(scope: !75, file: !10, line: 88, column: 8)
!123 = !DILocation(line: 88, column: 8, scope: !75)
!124 = !DILocation(line: 91, column: 23, scope: !125)
!125 = distinct !DILexicalBlock(scope: !122, file: !10, line: 89, column: 5)
!126 = !DILocation(line: 91, column: 9, scope: !125)
!127 = !DILocation(line: 93, column: 5, scope: !125)
!128 = !DILocation(line: 94, column: 1, scope: !75)
!129 = distinct !DISubprogram(name: "good20", scope: !10, file: !10, line: 100, type: !76, isLocal: false, isDefinition: true, scopeLine: 101, isOptimized: false, unit: !0, variables: !2)
!130 = !DILocalVariable(name: "data", scope: !129, file: !10, line: 102, type: !6)
!131 = !DILocation(line: 102, column: 12, scope: !129)
!132 = !DILocation(line: 104, column: 10, scope: !129)
!133 = !DILocation(line: 105, column: 8, scope: !134)
!134 = distinct !DILexicalBlock(scope: !129, file: !10, line: 105, column: 8)
!135 = !DILocation(line: 105, column: 8, scope: !129)
!136 = !DILocation(line: 107, column: 24, scope: !137)
!137 = distinct !DILexicalBlock(scope: !134, file: !10, line: 106, column: 5)
!138 = !DILocation(line: 107, column: 16, scope: !137)
!139 = !DILocation(line: 107, column: 14, scope: !137)
!140 = !DILocation(line: 108, column: 13, scope: !141)
!141 = distinct !DILexicalBlock(scope: !137, file: !10, line: 108, column: 13)
!142 = !DILocation(line: 108, column: 18, scope: !141)
!143 = !DILocation(line: 108, column: 13, scope: !137)
!144 = !DILocation(line: 108, column: 27, scope: !145)
!145 = !DILexicalBlockFile(scope: !141, file: !10, discriminator: 1)
!146 = !DILocalVariable(name: "i", scope: !147, file: !10, line: 110, type: !96)
!147 = distinct !DILexicalBlock(scope: !137, file: !10, line: 109, column: 9)
!148 = !DILocation(line: 110, column: 20, scope: !147)
!149 = !DILocation(line: 111, column: 19, scope: !150)
!150 = distinct !DILexicalBlock(scope: !147, file: !10, line: 111, column: 13)
!151 = !DILocation(line: 111, column: 17, scope: !150)
!152 = !DILocation(line: 111, column: 24, scope: !153)
!153 = !DILexicalBlockFile(scope: !154, file: !10, discriminator: 1)
!154 = distinct !DILexicalBlock(scope: !150, file: !10, line: 111, column: 13)
!155 = !DILocation(line: 111, column: 26, scope: !153)
!156 = !DILocation(line: 111, column: 13, scope: !153)
!157 = !DILocation(line: 113, column: 22, scope: !158)
!158 = distinct !DILexicalBlock(scope: !154, file: !10, line: 112, column: 13)
!159 = !DILocation(line: 113, column: 17, scope: !158)
!160 = !DILocation(line: 113, column: 25, scope: !158)
!161 = !DILocation(line: 114, column: 13, scope: !158)
!162 = !DILocation(line: 111, column: 34, scope: !163)
!163 = !DILexicalBlockFile(scope: !154, file: !10, discriminator: 2)
!164 = !DILocation(line: 111, column: 13, scope: !163)
!165 = distinct !{!165, !166}
!166 = !DILocation(line: 111, column: 13, scope: !147)
!167 = !DILocation(line: 117, column: 14, scope: !137)
!168 = !DILocation(line: 117, column: 9, scope: !137)
!169 = !DILocation(line: 118, column: 5, scope: !137)
!170 = !DILocation(line: 119, column: 8, scope: !171)
!171 = distinct !DILexicalBlock(scope: !129, file: !10, line: 119, column: 8)
!172 = !DILocation(line: 119, column: 8, scope: !129)
!173 = !DILocation(line: 122, column: 9, scope: !174)
!174 = distinct !DILexicalBlock(scope: !171, file: !10, line: 120, column: 5)
!175 = !DILocation(line: 123, column: 5, scope: !174)
!176 = !DILocation(line: 131, column: 1, scope: !129)
!177 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 135, type: !21, isLocal: false, isDefinition: true, scopeLine: 135, isOptimized: false, unit: !0, variables: !2)
!178 = !DILocation(line: 136, column: 5, scope: !177)
!179 = !DILocation(line: 137, column: 2, scope: !177)
!180 = !DILocation(line: 138, column: 5, scope: !177)
!181 = distinct !DISubprogram(name: "staticReturnsTrue", scope: !10, file: !10, line: 57, type: !21, isLocal: true, isDefinition: true, scopeLine: 58, isOptimized: false, unit: !0, variables: !2)
!182 = !DILocation(line: 59, column: 5, scope: !181)
!183 = distinct !DISubprogram(name: "staticReturnsFalse", scope: !10, file: !10, line: 62, type: !21, isLocal: true, isDefinition: true, scopeLine: 63, isOptimized: false, unit: !0, variables: !2)
!184 = !DILocation(line: 64, column: 5, scope: !183)
