; ModuleID = './190_17.c'
source_filename = "./190_17.c"
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
@.str.3 = private unnamed_addr constant [3 x i8] c"%d\00", align 1

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
  %data = alloca i32, align 4
  %result = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %i, metadata !77, metadata !33), !dbg !78
  call void @llvm.dbg.declare(metadata i32* %j, metadata !79, metadata !33), !dbg !80
  call void @llvm.dbg.declare(metadata i32* %data, metadata !81, metadata !33), !dbg !82
  store i32 0, i32* %data, align 4, !dbg !83
  store i32 0, i32* %i, align 4, !dbg !84
  br label %for.cond, !dbg !86

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !87
  %cmp = icmp slt i32 %0, 1, !dbg !90
  br i1 %cmp, label %for.body, label %for.end, !dbg !91

for.body:                                         ; preds = %for.cond
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !92
  %call = call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i32 0, i32 0), i32* %data), !dbg !94
  br label %for.inc, !dbg !95

for.inc:                                          ; preds = %for.body
  %2 = load i32, i32* %i, align 4, !dbg !96
  %inc = add nsw i32 %2, 1, !dbg !96
  store i32 %inc, i32* %i, align 4, !dbg !96
  br label %for.cond, !dbg !98, !llvm.loop !99

for.end:                                          ; preds = %for.cond
  store i32 0, i32* %j, align 4, !dbg !101
  br label %for.cond1, !dbg !103

for.cond1:                                        ; preds = %for.inc5, %for.end
  %3 = load i32, i32* %j, align 4, !dbg !104
  %cmp2 = icmp slt i32 %3, 1, !dbg !107
  br i1 %cmp2, label %for.body3, label %for.end7, !dbg !108

for.body3:                                        ; preds = %for.cond1
  %4 = load i32, i32* %data, align 4, !dbg !109
  %cmp4 = icmp sgt i32 %4, 0, !dbg !112
  br i1 %cmp4, label %if.then, label %if.end, !dbg !113

if.then:                                          ; preds = %for.body3
  call void @llvm.dbg.declare(metadata i32* %result, metadata !114, metadata !33), !dbg !116
  %5 = load i32, i32* %data, align 4, !dbg !117
  %mul = mul nsw i32 %5, 2, !dbg !118
  store i32 %mul, i32* %result, align 4, !dbg !116
  %6 = load i32, i32* %result, align 4, !dbg !119
  call void @printIntLine(i32 %6), !dbg !120
  br label %if.end, !dbg !121

if.end:                                           ; preds = %if.then, %for.body3
  br label %for.inc5, !dbg !122

for.inc5:                                         ; preds = %if.end
  %7 = load i32, i32* %j, align 4, !dbg !123
  %inc6 = add nsw i32 %7, 1, !dbg !123
  store i32 %inc6, i32* %j, align 4, !dbg !123
  br label %for.cond1, !dbg !125, !llvm.loop !126

for.end7:                                         ; preds = %for.cond1
  ret void, !dbg !128
}

declare i32 @__isoc99_fscanf(%struct._IO_FILE*, i8*, ...) #3

; Function Attrs: nounwind uwtable
define void @good17() #0 !dbg !129 {
entry:
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %data = alloca i32, align 4
  %result = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %i, metadata !130, metadata !33), !dbg !131
  call void @llvm.dbg.declare(metadata i32* %j, metadata !132, metadata !33), !dbg !133
  call void @llvm.dbg.declare(metadata i32* %data, metadata !134, metadata !33), !dbg !135
  store i32 0, i32* %data, align 4, !dbg !136
  store i32 0, i32* %i, align 4, !dbg !137
  br label %for.cond, !dbg !139

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !140
  %cmp = icmp slt i32 %0, 1, !dbg !143
  br i1 %cmp, label %for.body, label %for.end, !dbg !144

for.body:                                         ; preds = %for.cond
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !145
  %call = call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i32 0, i32 0), i32* %data), !dbg !147
  br label %for.inc, !dbg !148

for.inc:                                          ; preds = %for.body
  %2 = load i32, i32* %i, align 4, !dbg !149
  %inc = add nsw i32 %2, 1, !dbg !149
  store i32 %inc, i32* %i, align 4, !dbg !149
  br label %for.cond, !dbg !151, !llvm.loop !152

for.end:                                          ; preds = %for.cond
  store i32 0, i32* %j, align 4, !dbg !154
  br label %for.cond1, !dbg !156

for.cond1:                                        ; preds = %for.inc5, %for.end
  %3 = load i32, i32* %j, align 4, !dbg !157
  %cmp2 = icmp slt i32 %3, 1, !dbg !160
  br i1 %cmp2, label %for.body3, label %for.end7, !dbg !161

for.body3:                                        ; preds = %for.cond1
  store i32 2, i32* %data, align 4, !dbg !162
  %4 = load i32, i32* %data, align 4, !dbg !164
  %cmp4 = icmp sgt i32 %4, 0, !dbg !166
  br i1 %cmp4, label %if.then, label %if.end, !dbg !167

if.then:                                          ; preds = %for.body3
  call void @llvm.dbg.declare(metadata i32* %result, metadata !168, metadata !33), !dbg !170
  %5 = load i32, i32* %data, align 4, !dbg !171
  %mul = mul nsw i32 %5, 2, !dbg !172
  store i32 %mul, i32* %result, align 4, !dbg !170
  %6 = load i32, i32* %result, align 4, !dbg !173
  call void @printIntLine(i32 %6), !dbg !174
  br label %if.end, !dbg !175

if.end:                                           ; preds = %if.then, %for.body3
  br label %for.inc5, !dbg !176

for.inc5:                                         ; preds = %if.end
  %7 = load i32, i32* %j, align 4, !dbg !177
  %inc6 = add nsw i32 %7, 1, !dbg !177
  store i32 %inc6, i32* %j, align 4, !dbg !177
  br label %for.cond1, !dbg !179, !llvm.loop !180

for.end7:                                         ; preds = %for.cond1
  ret void, !dbg !182
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !183 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @good17(), !dbg !184
  call void @bad17(), !dbg !185
  ret i32 1, !dbg !186
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
!1 = !DIFile(filename: "190_17.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/190")
!2 = !{}
!3 = !{!4, !5}
!4 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64, align: 64)
!6 = !{!7, !10, !11, !12, !13, !14}
!7 = distinct !DIGlobalVariable(name: "GLOBAL_CONST_TRUE", scope: !0, file: !8, line: 10, type: !9, isLocal: false, isDefinition: true, variable: i32* @GLOBAL_CONST_TRUE)
!8 = !DIFile(filename: "./190_17.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/190")
!9 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !4)
!10 = distinct !DIGlobalVariable(name: "GLOBAL_CONST_FALSE", scope: !0, file: !8, line: 11, type: !9, isLocal: false, isDefinition: true, variable: i32* @GLOBAL_CONST_FALSE)
!11 = distinct !DIGlobalVariable(name: "GLOBAL_CONST_FIVE", scope: !0, file: !8, line: 12, type: !9, isLocal: false, isDefinition: true, variable: i32* @GLOBAL_CONST_FIVE)
!12 = distinct !DIGlobalVariable(name: "globalTrue", scope: !0, file: !8, line: 14, type: !4, isLocal: false, isDefinition: true, variable: i32* @globalTrue)
!13 = distinct !DIGlobalVariable(name: "globalFalse", scope: !0, file: !8, line: 15, type: !4, isLocal: false, isDefinition: true, variable: i32* @globalFalse)
!14 = distinct !DIGlobalVariable(name: "globalFive", scope: !0, file: !8, line: 16, type: !4, isLocal: false, isDefinition: true, variable: i32* @globalFive)
!15 = !{i32 2, !"Dwarf Version", i32 4}
!16 = !{i32 2, !"Debug Info Version", i32 3}
!17 = !{!"clang version 3.9.0 (tags/RELEASE_390/final)"}
!18 = distinct !DISubprogram(name: "globalReturnsTrue", scope: !8, file: !8, line: 20, type: !19, isLocal: false, isDefinition: true, scopeLine: 21, isOptimized: false, unit: !0, variables: !2)
!19 = !DISubroutineType(types: !20)
!20 = !{!4}
!21 = !DILocation(line: 22, column: 5, scope: !18)
!22 = distinct !DISubprogram(name: "globalReturnsFalse", scope: !8, file: !8, line: 25, type: !19, isLocal: false, isDefinition: true, scopeLine: 26, isOptimized: false, unit: !0, variables: !2)
!23 = !DILocation(line: 27, column: 5, scope: !22)
!24 = distinct !DISubprogram(name: "globalReturnsTrueOrFalse", scope: !8, file: !8, line: 30, type: !19, isLocal: false, isDefinition: true, scopeLine: 31, isOptimized: false, unit: !0, variables: !2)
!25 = !DILocation(line: 32, column: 13, scope: !24)
!26 = !DILocation(line: 32, column: 20, scope: !24)
!27 = !DILocation(line: 32, column: 5, scope: !24)
!28 = distinct !DISubprogram(name: "printHexCharLine", scope: !8, file: !8, line: 36, type: !29, isLocal: false, isDefinition: true, scopeLine: 37, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!29 = !DISubroutineType(types: !30)
!30 = !{null, !31}
!31 = !DIBasicType(name: "char", size: 8, align: 8, encoding: DW_ATE_signed_char)
!32 = !DILocalVariable(name: "charHex", arg: 1, scope: !28, file: !8, line: 36, type: !31)
!33 = !DIExpression()
!34 = !DILocation(line: 36, column: 29, scope: !28)
!35 = !DILocation(line: 38, column: 25, scope: !28)
!36 = !DILocation(line: 38, column: 20, scope: !28)
!37 = !DILocation(line: 38, column: 5, scope: !28)
!38 = !DILocation(line: 39, column: 1, scope: !28)
!39 = distinct !DISubprogram(name: "printLine", scope: !8, file: !8, line: 41, type: !40, isLocal: false, isDefinition: true, scopeLine: 42, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!40 = !DISubroutineType(types: !41)
!41 = !{null, !42}
!42 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !43, size: 64, align: 64)
!43 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !31)
!44 = !DILocalVariable(name: "line", arg: 1, scope: !39, file: !8, line: 41, type: !42)
!45 = !DILocation(line: 41, column: 30, scope: !39)
!46 = !DILocation(line: 43, column: 8, scope: !47)
!47 = distinct !DILexicalBlock(scope: !39, file: !8, line: 43, column: 8)
!48 = !DILocation(line: 43, column: 13, scope: !47)
!49 = !DILocation(line: 43, column: 8, scope: !39)
!50 = !DILocation(line: 45, column: 24, scope: !51)
!51 = distinct !DILexicalBlock(scope: !47, file: !8, line: 44, column: 5)
!52 = !DILocation(line: 45, column: 9, scope: !51)
!53 = !DILocation(line: 46, column: 5, scope: !51)
!54 = !DILocation(line: 47, column: 1, scope: !39)
!55 = distinct !DISubprogram(name: "printIntLine", scope: !8, file: !8, line: 49, type: !56, isLocal: false, isDefinition: true, scopeLine: 50, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!56 = !DISubroutineType(types: !57)
!57 = !{null, !4}
!58 = !DILocalVariable(name: "intNumber", arg: 1, scope: !55, file: !8, line: 49, type: !4)
!59 = !DILocation(line: 49, column: 24, scope: !55)
!60 = !DILocation(line: 51, column: 20, scope: !55)
!61 = !DILocation(line: 51, column: 5, scope: !55)
!62 = !DILocation(line: 52, column: 1, scope: !55)
!63 = distinct !DISubprogram(name: "printLongLine", scope: !8, file: !8, line: 54, type: !64, isLocal: false, isDefinition: true, scopeLine: 55, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!64 = !DISubroutineType(types: !65)
!65 = !{null, !66}
!66 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !67, line: 197, baseType: !68)
!67 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/sys/types.h", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/190")
!68 = !DIBasicType(name: "long int", size: 64, align: 64, encoding: DW_ATE_signed)
!69 = !DILocalVariable(name: "longIntNumber", arg: 1, scope: !63, file: !8, line: 54, type: !66)
!70 = !DILocation(line: 54, column: 29, scope: !63)
!71 = !DILocation(line: 56, column: 21, scope: !63)
!72 = !DILocation(line: 56, column: 5, scope: !63)
!73 = !DILocation(line: 57, column: 1, scope: !63)
!74 = distinct !DISubprogram(name: "bad17", scope: !8, file: !8, line: 60, type: !75, isLocal: false, isDefinition: true, scopeLine: 61, isOptimized: false, unit: !0, variables: !2)
!75 = !DISubroutineType(types: !76)
!76 = !{null}
!77 = !DILocalVariable(name: "i", scope: !74, file: !8, line: 62, type: !4)
!78 = !DILocation(line: 62, column: 9, scope: !74)
!79 = !DILocalVariable(name: "j", scope: !74, file: !8, line: 62, type: !4)
!80 = !DILocation(line: 62, column: 11, scope: !74)
!81 = !DILocalVariable(name: "data", scope: !74, file: !8, line: 63, type: !4)
!82 = !DILocation(line: 63, column: 9, scope: !74)
!83 = !DILocation(line: 65, column: 10, scope: !74)
!84 = !DILocation(line: 66, column: 11, scope: !85)
!85 = distinct !DILexicalBlock(scope: !74, file: !8, line: 66, column: 5)
!86 = !DILocation(line: 66, column: 9, scope: !85)
!87 = !DILocation(line: 66, column: 16, scope: !88)
!88 = !DILexicalBlockFile(scope: !89, file: !8, discriminator: 1)
!89 = distinct !DILexicalBlock(scope: !85, file: !8, line: 66, column: 5)
!90 = !DILocation(line: 66, column: 18, scope: !88)
!91 = !DILocation(line: 66, column: 5, scope: !88)
!92 = !DILocation(line: 69, column: 16, scope: !93)
!93 = distinct !DILexicalBlock(scope: !89, file: !8, line: 67, column: 5)
!94 = !DILocation(line: 69, column: 9, scope: !93)
!95 = !DILocation(line: 70, column: 5, scope: !93)
!96 = !DILocation(line: 66, column: 24, scope: !97)
!97 = !DILexicalBlockFile(scope: !89, file: !8, discriminator: 2)
!98 = !DILocation(line: 66, column: 5, scope: !97)
!99 = distinct !{!99, !100}
!100 = !DILocation(line: 66, column: 5, scope: !74)
!101 = !DILocation(line: 71, column: 11, scope: !102)
!102 = distinct !DILexicalBlock(scope: !74, file: !8, line: 71, column: 5)
!103 = !DILocation(line: 71, column: 9, scope: !102)
!104 = !DILocation(line: 71, column: 16, scope: !105)
!105 = !DILexicalBlockFile(scope: !106, file: !8, discriminator: 1)
!106 = distinct !DILexicalBlock(scope: !102, file: !8, line: 71, column: 5)
!107 = !DILocation(line: 71, column: 18, scope: !105)
!108 = !DILocation(line: 71, column: 5, scope: !105)
!109 = !DILocation(line: 73, column: 12, scope: !110)
!110 = distinct !DILexicalBlock(scope: !111, file: !8, line: 73, column: 12)
!111 = distinct !DILexicalBlock(scope: !106, file: !8, line: 72, column: 5)
!112 = !DILocation(line: 73, column: 17, scope: !110)
!113 = !DILocation(line: 73, column: 12, scope: !111)
!114 = !DILocalVariable(name: "result", scope: !115, file: !8, line: 76, type: !4)
!115 = distinct !DILexicalBlock(scope: !110, file: !8, line: 74, column: 9)
!116 = !DILocation(line: 76, column: 17, scope: !115)
!117 = !DILocation(line: 76, column: 26, scope: !115)
!118 = !DILocation(line: 76, column: 31, scope: !115)
!119 = !DILocation(line: 77, column: 26, scope: !115)
!120 = !DILocation(line: 77, column: 13, scope: !115)
!121 = !DILocation(line: 78, column: 9, scope: !115)
!122 = !DILocation(line: 79, column: 5, scope: !111)
!123 = !DILocation(line: 71, column: 24, scope: !124)
!124 = !DILexicalBlockFile(scope: !106, file: !8, discriminator: 2)
!125 = !DILocation(line: 71, column: 5, scope: !124)
!126 = distinct !{!126, !127}
!127 = !DILocation(line: 71, column: 5, scope: !74)
!128 = !DILocation(line: 80, column: 1, scope: !74)
!129 = distinct !DISubprogram(name: "good17", scope: !8, file: !8, line: 82, type: !75, isLocal: false, isDefinition: true, scopeLine: 83, isOptimized: false, unit: !0, variables: !2)
!130 = !DILocalVariable(name: "i", scope: !129, file: !8, line: 84, type: !4)
!131 = !DILocation(line: 84, column: 9, scope: !129)
!132 = !DILocalVariable(name: "j", scope: !129, file: !8, line: 84, type: !4)
!133 = !DILocation(line: 84, column: 11, scope: !129)
!134 = !DILocalVariable(name: "data", scope: !129, file: !8, line: 85, type: !4)
!135 = !DILocation(line: 85, column: 9, scope: !129)
!136 = !DILocation(line: 87, column: 10, scope: !129)
!137 = !DILocation(line: 88, column: 11, scope: !138)
!138 = distinct !DILexicalBlock(scope: !129, file: !8, line: 88, column: 5)
!139 = !DILocation(line: 88, column: 9, scope: !138)
!140 = !DILocation(line: 88, column: 16, scope: !141)
!141 = !DILexicalBlockFile(scope: !142, file: !8, discriminator: 1)
!142 = distinct !DILexicalBlock(scope: !138, file: !8, line: 88, column: 5)
!143 = !DILocation(line: 88, column: 18, scope: !141)
!144 = !DILocation(line: 88, column: 5, scope: !141)
!145 = !DILocation(line: 91, column: 16, scope: !146)
!146 = distinct !DILexicalBlock(scope: !142, file: !8, line: 89, column: 5)
!147 = !DILocation(line: 91, column: 9, scope: !146)
!148 = !DILocation(line: 92, column: 5, scope: !146)
!149 = !DILocation(line: 88, column: 24, scope: !150)
!150 = !DILexicalBlockFile(scope: !142, file: !8, discriminator: 2)
!151 = !DILocation(line: 88, column: 5, scope: !150)
!152 = distinct !{!152, !153}
!153 = !DILocation(line: 88, column: 5, scope: !129)
!154 = !DILocation(line: 93, column: 11, scope: !155)
!155 = distinct !DILexicalBlock(scope: !129, file: !8, line: 93, column: 5)
!156 = !DILocation(line: 93, column: 9, scope: !155)
!157 = !DILocation(line: 93, column: 16, scope: !158)
!158 = !DILexicalBlockFile(scope: !159, file: !8, discriminator: 1)
!159 = distinct !DILexicalBlock(scope: !155, file: !8, line: 93, column: 5)
!160 = !DILocation(line: 93, column: 18, scope: !158)
!161 = !DILocation(line: 93, column: 5, scope: !158)
!162 = !DILocation(line: 95, column: 14, scope: !163)
!163 = distinct !DILexicalBlock(scope: !159, file: !8, line: 94, column: 5)
!164 = !DILocation(line: 96, column: 12, scope: !165)
!165 = distinct !DILexicalBlock(scope: !163, file: !8, line: 96, column: 12)
!166 = !DILocation(line: 96, column: 17, scope: !165)
!167 = !DILocation(line: 96, column: 12, scope: !163)
!168 = !DILocalVariable(name: "result", scope: !169, file: !8, line: 99, type: !4)
!169 = distinct !DILexicalBlock(scope: !165, file: !8, line: 97, column: 9)
!170 = !DILocation(line: 99, column: 17, scope: !169)
!171 = !DILocation(line: 99, column: 26, scope: !169)
!172 = !DILocation(line: 99, column: 31, scope: !169)
!173 = !DILocation(line: 100, column: 26, scope: !169)
!174 = !DILocation(line: 100, column: 13, scope: !169)
!175 = !DILocation(line: 101, column: 9, scope: !169)
!176 = !DILocation(line: 102, column: 5, scope: !163)
!177 = !DILocation(line: 93, column: 24, scope: !178)
!178 = !DILexicalBlockFile(scope: !159, file: !8, discriminator: 2)
!179 = !DILocation(line: 93, column: 5, scope: !178)
!180 = distinct !{!180, !181}
!181 = !DILocation(line: 93, column: 5, scope: !129)
!182 = !DILocation(line: 103, column: 1, scope: !129)
!183 = distinct !DISubprogram(name: "main", scope: !8, file: !8, line: 105, type: !19, isLocal: false, isDefinition: true, scopeLine: 105, isOptimized: false, unit: !0, variables: !2)
!184 = !DILocation(line: 106, column: 5, scope: !183)
!185 = !DILocation(line: 107, column: 5, scope: !183)
!186 = !DILocation(line: 108, column: 5, scope: !183)
