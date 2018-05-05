; ModuleID = './416_17.c'
source_filename = "./416_17.c"
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
@staticTrue = internal global i32 1, align 4
@staticFalse = internal global i32 0, align 4
@.str.3 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: nounwind uwtable
define i32 @globalReturnsTrue() #0 !dbg !22 {
entry:
  ret i32 1, !dbg !25
}

; Function Attrs: nounwind uwtable
define i32 @globalReturnsFalse() #0 !dbg !26 {
entry:
  ret i32 0, !dbg !27
}

; Function Attrs: nounwind uwtable
define i32 @globalReturnsTrueOrFalse() #0 !dbg !28 {
entry:
  %call = call i32 @rand() #4, !dbg !29
  %rem = srem i32 %call, 2, !dbg !30
  ret i32 %rem, !dbg !31
}

; Function Attrs: nounwind
declare i32 @rand() #1

; Function Attrs: nounwind uwtable
define void @printHexCharLine(i8 signext %charHex) #0 !dbg !32 {
entry:
  %charHex.addr = alloca i8, align 1
  store i8 %charHex, i8* %charHex.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %charHex.addr, metadata !36, metadata !37), !dbg !38
  %0 = load i8, i8* %charHex.addr, align 1, !dbg !39
  %conv = sext i8 %0 to i32, !dbg !40
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), i32 %conv), !dbg !41
  ret void, !dbg !42
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #2

declare i32 @printf(i8*, ...) #3

; Function Attrs: nounwind uwtable
define void @printLine(i8* %line) #0 !dbg !43 {
entry:
  %line.addr = alloca i8*, align 8
  store i8* %line, i8** %line.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %line.addr, metadata !48, metadata !37), !dbg !49
  %0 = load i8*, i8** %line.addr, align 8, !dbg !50
  %cmp = icmp ne i8* %0, null, !dbg !52
  br i1 %cmp, label %if.then, label %if.end, !dbg !53

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** %line.addr, align 8, !dbg !54
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i32 0, i32 0), i8* %1), !dbg !56
  br label %if.end, !dbg !57

if.end:                                           ; preds = %if.then, %entry
  ret void, !dbg !58
}

; Function Attrs: nounwind uwtable
define void @printIntLine(i32 %intNumber) #0 !dbg !59 {
entry:
  %intNumber.addr = alloca i32, align 4
  store i32 %intNumber, i32* %intNumber.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %intNumber.addr, metadata !62, metadata !37), !dbg !63
  %0 = load i32, i32* %intNumber.addr, align 4, !dbg !64
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), i32 %0), !dbg !65
  ret void, !dbg !66
}

; Function Attrs: nounwind uwtable
define void @printLongLine(i64 %longIntNumber) #0 !dbg !67 {
entry:
  %longIntNumber.addr = alloca i64, align 8
  store i64 %longIntNumber, i64* %longIntNumber.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %longIntNumber.addr, metadata !72, metadata !37), !dbg !73
  %0 = load i64, i64* %longIntNumber.addr, align 8, !dbg !74
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.2, i32 0, i32 0), i64 %0), !dbg !75
  ret void, !dbg !76
}

; Function Attrs: nounwind uwtable
define void @bad17() #0 !dbg !77 {
entry:
  %data = alloca i64*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !80, metadata !37), !dbg !81
  store i64* null, i64** %data, align 8, !dbg !82
  %0 = load i32, i32* @staticTrue, align 4, !dbg !83
  %tobool = icmp ne i32 %0, 0, !dbg !83
  br i1 %tobool, label %if.then, label %if.end3, !dbg !85

if.then:                                          ; preds = %entry
  %call = call noalias i8* @malloc(i64 800) #4, !dbg !86
  %1 = bitcast i8* %call to i64*, !dbg !88
  store i64* %1, i64** %data, align 8, !dbg !89
  %2 = load i64*, i64** %data, align 8, !dbg !90
  %cmp = icmp eq i64* %2, null, !dbg !92
  br i1 %cmp, label %if.then1, label %if.end, !dbg !93

if.then1:                                         ; preds = %if.then
  br label %if.end7, !dbg !94

if.end:                                           ; preds = %if.then
  call void @llvm.dbg.declare(metadata i64* %i, metadata !96, metadata !37), !dbg !101
  store i64 0, i64* %i, align 8, !dbg !102
  br label %for.cond, !dbg !104

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i64, i64* %i, align 8, !dbg !105
  %cmp2 = icmp ult i64 %3, 100, !dbg !108
  br i1 %cmp2, label %for.body, label %for.end, !dbg !109

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !110
  %5 = load i64*, i64** %data, align 8, !dbg !112
  %arrayidx = getelementptr inbounds i64, i64* %5, i64 %4, !dbg !112
  store i64 5, i64* %arrayidx, align 8, !dbg !113
  br label %for.inc, !dbg !114

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !115
  %inc = add i64 %6, 1, !dbg !115
  store i64 %inc, i64* %i, align 8, !dbg !115
  br label %for.cond, !dbg !117, !llvm.loop !118

for.end:                                          ; preds = %for.cond
  %7 = load i64*, i64** %data, align 8, !dbg !120
  %8 = bitcast i64* %7 to i8*, !dbg !120
  call void @free(i8* %8) #4, !dbg !121
  br label %if.end3, !dbg !122

if.end3:                                          ; preds = %for.end, %entry
  %9 = load i32, i32* @staticTrue, align 4, !dbg !123
  %tobool4 = icmp ne i32 %9, 0, !dbg !123
  br i1 %tobool4, label %if.then5, label %if.end7, !dbg !125

if.then5:                                         ; preds = %if.end3
  %10 = load i64*, i64** %data, align 8, !dbg !126
  %arrayidx6 = getelementptr inbounds i64, i64* %10, i64 0, !dbg !126
  %11 = load i64, i64* %arrayidx6, align 8, !dbg !126
  call void @printLongLine(i64 %11), !dbg !128
  br label %if.end7, !dbg !129

if.end7:                                          ; preds = %if.then1, %if.then5, %if.end3
  ret void, !dbg !130
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #1

; Function Attrs: nounwind
declare void @free(i8*) #1

; Function Attrs: nounwind uwtable
define void @good17() #0 !dbg !131 {
entry:
  %data = alloca i64*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !132, metadata !37), !dbg !133
  store i64* null, i64** %data, align 8, !dbg !134
  %0 = load i32, i32* @staticTrue, align 4, !dbg !135
  %tobool = icmp ne i32 %0, 0, !dbg !135
  br i1 %tobool, label %if.then, label %if.end3, !dbg !137

if.then:                                          ; preds = %entry
  %call = call noalias i8* @malloc(i64 800) #4, !dbg !138
  %1 = bitcast i8* %call to i64*, !dbg !140
  store i64* %1, i64** %data, align 8, !dbg !141
  %2 = load i64*, i64** %data, align 8, !dbg !142
  %cmp = icmp eq i64* %2, null, !dbg !144
  br i1 %cmp, label %if.then1, label %if.end, !dbg !145

if.then1:                                         ; preds = %if.then
  br label %if.end6, !dbg !146

if.end:                                           ; preds = %if.then
  call void @llvm.dbg.declare(metadata i64* %i, metadata !148, metadata !37), !dbg !150
  store i64 0, i64* %i, align 8, !dbg !151
  br label %for.cond, !dbg !153

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i64, i64* %i, align 8, !dbg !154
  %cmp2 = icmp ult i64 %3, 100, !dbg !157
  br i1 %cmp2, label %for.body, label %for.end, !dbg !158

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !159
  %5 = load i64*, i64** %data, align 8, !dbg !161
  %arrayidx = getelementptr inbounds i64, i64* %5, i64 %4, !dbg !161
  store i64 5, i64* %arrayidx, align 8, !dbg !162
  br label %for.inc, !dbg !163

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !164
  %inc = add i64 %6, 1, !dbg !164
  store i64 %inc, i64* %i, align 8, !dbg !164
  br label %for.cond, !dbg !166, !llvm.loop !167

for.end:                                          ; preds = %for.cond
  %7 = load i64*, i64** %data, align 8, !dbg !169
  %8 = bitcast i64* %7 to i8*, !dbg !169
  call void @free(i8* %8) #4, !dbg !170
  br label %if.end3, !dbg !171

if.end3:                                          ; preds = %for.end, %entry
  %9 = load i32, i32* @staticFalse, align 4, !dbg !172
  %tobool4 = icmp ne i32 %9, 0, !dbg !172
  br i1 %tobool4, label %if.then5, label %if.else, !dbg !174

if.then5:                                         ; preds = %if.end3
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.3, i32 0, i32 0)), !dbg !175
  br label %if.end6, !dbg !177

if.else:                                          ; preds = %if.end3
  br label %if.end6

if.end6:                                          ; preds = %if.then1, %if.else, %if.then5
  ret void, !dbg !178
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !179 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @good17(), !dbg !180
  call void @bad17(), !dbg !181
  ret i32 1, !dbg !182
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone }
attributes #3 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!19, !20}
!llvm.ident = !{!21}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (tags/RELEASE_390/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, globals: !8)
!1 = !DIFile(filename: "416_17.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/416")
!2 = !{}
!3 = !{!4, !5, !6}
!4 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64, align: 64)
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64, align: 64)
!7 = !DIBasicType(name: "long int", size: 64, align: 64, encoding: DW_ATE_signed)
!8 = !{!9, !12, !13, !14, !15, !16, !17, !18}
!9 = distinct !DIGlobalVariable(name: "GLOBAL_CONST_TRUE", scope: !0, file: !10, line: 10, type: !11, isLocal: false, isDefinition: true, variable: i32* @GLOBAL_CONST_TRUE)
!10 = !DIFile(filename: "./416_17.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/416")
!11 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !4)
!12 = distinct !DIGlobalVariable(name: "GLOBAL_CONST_FALSE", scope: !0, file: !10, line: 11, type: !11, isLocal: false, isDefinition: true, variable: i32* @GLOBAL_CONST_FALSE)
!13 = distinct !DIGlobalVariable(name: "GLOBAL_CONST_FIVE", scope: !0, file: !10, line: 12, type: !11, isLocal: false, isDefinition: true, variable: i32* @GLOBAL_CONST_FIVE)
!14 = distinct !DIGlobalVariable(name: "globalTrue", scope: !0, file: !10, line: 14, type: !4, isLocal: false, isDefinition: true, variable: i32* @globalTrue)
!15 = distinct !DIGlobalVariable(name: "globalFalse", scope: !0, file: !10, line: 15, type: !4, isLocal: false, isDefinition: true, variable: i32* @globalFalse)
!16 = distinct !DIGlobalVariable(name: "globalFive", scope: !0, file: !10, line: 16, type: !4, isLocal: false, isDefinition: true, variable: i32* @globalFive)
!17 = distinct !DIGlobalVariable(name: "staticTrue", scope: !0, file: !10, line: 57, type: !4, isLocal: true, isDefinition: true, variable: i32* @staticTrue)
!18 = distinct !DIGlobalVariable(name: "staticFalse", scope: !0, file: !10, line: 58, type: !4, isLocal: true, isDefinition: true, variable: i32* @staticFalse)
!19 = !{i32 2, !"Dwarf Version", i32 4}
!20 = !{i32 2, !"Debug Info Version", i32 3}
!21 = !{!"clang version 3.9.0 (tags/RELEASE_390/final)"}
!22 = distinct !DISubprogram(name: "globalReturnsTrue", scope: !10, file: !10, line: 18, type: !23, isLocal: false, isDefinition: true, scopeLine: 19, isOptimized: false, unit: !0, variables: !2)
!23 = !DISubroutineType(types: !24)
!24 = !{!4}
!25 = !DILocation(line: 20, column: 5, scope: !22)
!26 = distinct !DISubprogram(name: "globalReturnsFalse", scope: !10, file: !10, line: 23, type: !23, isLocal: false, isDefinition: true, scopeLine: 24, isOptimized: false, unit: !0, variables: !2)
!27 = !DILocation(line: 25, column: 5, scope: !26)
!28 = distinct !DISubprogram(name: "globalReturnsTrueOrFalse", scope: !10, file: !10, line: 28, type: !23, isLocal: false, isDefinition: true, scopeLine: 29, isOptimized: false, unit: !0, variables: !2)
!29 = !DILocation(line: 30, column: 13, scope: !28)
!30 = !DILocation(line: 30, column: 20, scope: !28)
!31 = !DILocation(line: 30, column: 5, scope: !28)
!32 = distinct !DISubprogram(name: "printHexCharLine", scope: !10, file: !10, line: 33, type: !33, isLocal: false, isDefinition: true, scopeLine: 34, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!33 = !DISubroutineType(types: !34)
!34 = !{null, !35}
!35 = !DIBasicType(name: "char", size: 8, align: 8, encoding: DW_ATE_signed_char)
!36 = !DILocalVariable(name: "charHex", arg: 1, scope: !32, file: !10, line: 33, type: !35)
!37 = !DIExpression()
!38 = !DILocation(line: 33, column: 29, scope: !32)
!39 = !DILocation(line: 35, column: 25, scope: !32)
!40 = !DILocation(line: 35, column: 20, scope: !32)
!41 = !DILocation(line: 35, column: 5, scope: !32)
!42 = !DILocation(line: 36, column: 1, scope: !32)
!43 = distinct !DISubprogram(name: "printLine", scope: !10, file: !10, line: 38, type: !44, isLocal: false, isDefinition: true, scopeLine: 39, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!44 = !DISubroutineType(types: !45)
!45 = !{null, !46}
!46 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !47, size: 64, align: 64)
!47 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !35)
!48 = !DILocalVariable(name: "line", arg: 1, scope: !43, file: !10, line: 38, type: !46)
!49 = !DILocation(line: 38, column: 30, scope: !43)
!50 = !DILocation(line: 40, column: 8, scope: !51)
!51 = distinct !DILexicalBlock(scope: !43, file: !10, line: 40, column: 8)
!52 = !DILocation(line: 40, column: 13, scope: !51)
!53 = !DILocation(line: 40, column: 8, scope: !43)
!54 = !DILocation(line: 42, column: 24, scope: !55)
!55 = distinct !DILexicalBlock(scope: !51, file: !10, line: 41, column: 5)
!56 = !DILocation(line: 42, column: 9, scope: !55)
!57 = !DILocation(line: 43, column: 5, scope: !55)
!58 = !DILocation(line: 44, column: 1, scope: !43)
!59 = distinct !DISubprogram(name: "printIntLine", scope: !10, file: !10, line: 46, type: !60, isLocal: false, isDefinition: true, scopeLine: 47, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!60 = !DISubroutineType(types: !61)
!61 = !{null, !4}
!62 = !DILocalVariable(name: "intNumber", arg: 1, scope: !59, file: !10, line: 46, type: !4)
!63 = !DILocation(line: 46, column: 24, scope: !59)
!64 = !DILocation(line: 48, column: 20, scope: !59)
!65 = !DILocation(line: 48, column: 5, scope: !59)
!66 = !DILocation(line: 49, column: 1, scope: !59)
!67 = distinct !DISubprogram(name: "printLongLine", scope: !10, file: !10, line: 51, type: !68, isLocal: false, isDefinition: true, scopeLine: 52, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!68 = !DISubroutineType(types: !69)
!69 = !{null, !70}
!70 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !71, line: 197, baseType: !7)
!71 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/sys/types.h", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/416")
!72 = !DILocalVariable(name: "longIntNumber", arg: 1, scope: !67, file: !10, line: 51, type: !70)
!73 = !DILocation(line: 51, column: 29, scope: !67)
!74 = !DILocation(line: 53, column: 21, scope: !67)
!75 = !DILocation(line: 53, column: 5, scope: !67)
!76 = !DILocation(line: 54, column: 1, scope: !67)
!77 = distinct !DISubprogram(name: "bad17", scope: !10, file: !10, line: 62, type: !78, isLocal: false, isDefinition: true, scopeLine: 63, isOptimized: false, unit: !0, variables: !2)
!78 = !DISubroutineType(types: !79)
!79 = !{null}
!80 = !DILocalVariable(name: "data", scope: !77, file: !10, line: 64, type: !6)
!81 = !DILocation(line: 64, column: 12, scope: !77)
!82 = !DILocation(line: 66, column: 10, scope: !77)
!83 = !DILocation(line: 67, column: 8, scope: !84)
!84 = distinct !DILexicalBlock(scope: !77, file: !10, line: 67, column: 8)
!85 = !DILocation(line: 67, column: 8, scope: !77)
!86 = !DILocation(line: 69, column: 24, scope: !87)
!87 = distinct !DILexicalBlock(scope: !84, file: !10, line: 68, column: 5)
!88 = !DILocation(line: 69, column: 16, scope: !87)
!89 = !DILocation(line: 69, column: 14, scope: !87)
!90 = !DILocation(line: 70, column: 13, scope: !91)
!91 = distinct !DILexicalBlock(scope: !87, file: !10, line: 70, column: 13)
!92 = !DILocation(line: 70, column: 18, scope: !91)
!93 = !DILocation(line: 70, column: 13, scope: !87)
!94 = !DILocation(line: 70, column: 27, scope: !95)
!95 = !DILexicalBlockFile(scope: !91, file: !10, discriminator: 1)
!96 = !DILocalVariable(name: "i", scope: !97, file: !10, line: 72, type: !98)
!97 = distinct !DILexicalBlock(scope: !87, file: !10, line: 71, column: 9)
!98 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !99, line: 62, baseType: !100)
!99 = !DIFile(filename: "/usr/local/bin/../lib/clang/3.9.0/include/stddef.h", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/416")
!100 = !DIBasicType(name: "long unsigned int", size: 64, align: 64, encoding: DW_ATE_unsigned)
!101 = !DILocation(line: 72, column: 20, scope: !97)
!102 = !DILocation(line: 73, column: 19, scope: !103)
!103 = distinct !DILexicalBlock(scope: !97, file: !10, line: 73, column: 13)
!104 = !DILocation(line: 73, column: 17, scope: !103)
!105 = !DILocation(line: 73, column: 24, scope: !106)
!106 = !DILexicalBlockFile(scope: !107, file: !10, discriminator: 1)
!107 = distinct !DILexicalBlock(scope: !103, file: !10, line: 73, column: 13)
!108 = !DILocation(line: 73, column: 26, scope: !106)
!109 = !DILocation(line: 73, column: 13, scope: !106)
!110 = !DILocation(line: 75, column: 22, scope: !111)
!111 = distinct !DILexicalBlock(scope: !107, file: !10, line: 74, column: 13)
!112 = !DILocation(line: 75, column: 17, scope: !111)
!113 = !DILocation(line: 75, column: 25, scope: !111)
!114 = !DILocation(line: 76, column: 13, scope: !111)
!115 = !DILocation(line: 73, column: 34, scope: !116)
!116 = !DILexicalBlockFile(scope: !107, file: !10, discriminator: 2)
!117 = !DILocation(line: 73, column: 13, scope: !116)
!118 = distinct !{!118, !119}
!119 = !DILocation(line: 73, column: 13, scope: !97)
!120 = !DILocation(line: 79, column: 14, scope: !87)
!121 = !DILocation(line: 79, column: 9, scope: !87)
!122 = !DILocation(line: 80, column: 5, scope: !87)
!123 = !DILocation(line: 81, column: 8, scope: !124)
!124 = distinct !DILexicalBlock(scope: !77, file: !10, line: 81, column: 8)
!125 = !DILocation(line: 81, column: 8, scope: !77)
!126 = !DILocation(line: 84, column: 23, scope: !127)
!127 = distinct !DILexicalBlock(scope: !124, file: !10, line: 82, column: 5)
!128 = !DILocation(line: 84, column: 9, scope: !127)
!129 = !DILocation(line: 86, column: 5, scope: !127)
!130 = !DILocation(line: 87, column: 1, scope: !77)
!131 = distinct !DISubprogram(name: "good17", scope: !10, file: !10, line: 93, type: !78, isLocal: false, isDefinition: true, scopeLine: 94, isOptimized: false, unit: !0, variables: !2)
!132 = !DILocalVariable(name: "data", scope: !131, file: !10, line: 95, type: !6)
!133 = !DILocation(line: 95, column: 12, scope: !131)
!134 = !DILocation(line: 97, column: 10, scope: !131)
!135 = !DILocation(line: 98, column: 8, scope: !136)
!136 = distinct !DILexicalBlock(scope: !131, file: !10, line: 98, column: 8)
!137 = !DILocation(line: 98, column: 8, scope: !131)
!138 = !DILocation(line: 100, column: 24, scope: !139)
!139 = distinct !DILexicalBlock(scope: !136, file: !10, line: 99, column: 5)
!140 = !DILocation(line: 100, column: 16, scope: !139)
!141 = !DILocation(line: 100, column: 14, scope: !139)
!142 = !DILocation(line: 101, column: 13, scope: !143)
!143 = distinct !DILexicalBlock(scope: !139, file: !10, line: 101, column: 13)
!144 = !DILocation(line: 101, column: 18, scope: !143)
!145 = !DILocation(line: 101, column: 13, scope: !139)
!146 = !DILocation(line: 101, column: 27, scope: !147)
!147 = !DILexicalBlockFile(scope: !143, file: !10, discriminator: 1)
!148 = !DILocalVariable(name: "i", scope: !149, file: !10, line: 103, type: !98)
!149 = distinct !DILexicalBlock(scope: !139, file: !10, line: 102, column: 9)
!150 = !DILocation(line: 103, column: 20, scope: !149)
!151 = !DILocation(line: 104, column: 19, scope: !152)
!152 = distinct !DILexicalBlock(scope: !149, file: !10, line: 104, column: 13)
!153 = !DILocation(line: 104, column: 17, scope: !152)
!154 = !DILocation(line: 104, column: 24, scope: !155)
!155 = !DILexicalBlockFile(scope: !156, file: !10, discriminator: 1)
!156 = distinct !DILexicalBlock(scope: !152, file: !10, line: 104, column: 13)
!157 = !DILocation(line: 104, column: 26, scope: !155)
!158 = !DILocation(line: 104, column: 13, scope: !155)
!159 = !DILocation(line: 106, column: 22, scope: !160)
!160 = distinct !DILexicalBlock(scope: !156, file: !10, line: 105, column: 13)
!161 = !DILocation(line: 106, column: 17, scope: !160)
!162 = !DILocation(line: 106, column: 25, scope: !160)
!163 = !DILocation(line: 107, column: 13, scope: !160)
!164 = !DILocation(line: 104, column: 34, scope: !165)
!165 = !DILexicalBlockFile(scope: !156, file: !10, discriminator: 2)
!166 = !DILocation(line: 104, column: 13, scope: !165)
!167 = distinct !{!167, !168}
!168 = !DILocation(line: 104, column: 13, scope: !149)
!169 = !DILocation(line: 110, column: 14, scope: !139)
!170 = !DILocation(line: 110, column: 9, scope: !139)
!171 = !DILocation(line: 111, column: 5, scope: !139)
!172 = !DILocation(line: 112, column: 8, scope: !173)
!173 = distinct !DILexicalBlock(scope: !131, file: !10, line: 112, column: 8)
!174 = !DILocation(line: 112, column: 8, scope: !131)
!175 = !DILocation(line: 115, column: 9, scope: !176)
!176 = distinct !DILexicalBlock(scope: !173, file: !10, line: 113, column: 5)
!177 = !DILocation(line: 116, column: 5, scope: !176)
!178 = !DILocation(line: 124, column: 1, scope: !131)
!179 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 127, type: !23, isLocal: false, isDefinition: true, scopeLine: 127, isOptimized: false, unit: !0, variables: !2)
!180 = !DILocation(line: 128, column: 5, scope: !179)
!181 = !DILocation(line: 129, column: 2, scope: !179)
!182 = !DILocation(line: 130, column: 5, scope: !179)
