; ModuleID = './416_47.c'
source_filename = "./416_47.c"
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
define void @bad47() #0 !dbg !75 {
entry:
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %data = alloca i64*, align 8
  %i2 = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32* %i, metadata !78, metadata !35), !dbg !79
  call void @llvm.dbg.declare(metadata i32* %j, metadata !80, metadata !35), !dbg !81
  call void @llvm.dbg.declare(metadata i64** %data, metadata !82, metadata !35), !dbg !83
  store i64* null, i64** %data, align 8, !dbg !84
  store i32 0, i32* %i, align 4, !dbg !85
  br label %for.cond, !dbg !87

for.cond:                                         ; preds = %for.inc6, %entry
  %0 = load i32, i32* %i, align 4, !dbg !88
  %cmp = icmp slt i32 %0, 1, !dbg !91
  br i1 %cmp, label %for.body, label %for.end8, !dbg !92

for.body:                                         ; preds = %for.cond
  %call = call noalias i8* @malloc(i64 80) #4, !dbg !93
  %1 = bitcast i8* %call to i64*, !dbg !95
  store i64* %1, i64** %data, align 8, !dbg !96
  %2 = load i64*, i64** %data, align 8, !dbg !97
  %cmp1 = icmp eq i64* %2, null, !dbg !99
  br i1 %cmp1, label %if.then, label %if.end, !dbg !100

if.then:                                          ; preds = %for.body
  br label %for.end15, !dbg !101

if.end:                                           ; preds = %for.body
  call void @llvm.dbg.declare(metadata i64* %i2, metadata !103, metadata !35), !dbg !108
  store i64 0, i64* %i2, align 8, !dbg !109
  br label %for.cond3, !dbg !111

for.cond3:                                        ; preds = %for.inc, %if.end
  %3 = load i64, i64* %i2, align 8, !dbg !112
  %cmp4 = icmp ult i64 %3, 10, !dbg !115
  br i1 %cmp4, label %for.body5, label %for.end, !dbg !116

for.body5:                                        ; preds = %for.cond3
  %4 = load i64, i64* %i2, align 8, !dbg !117
  %5 = load i64*, i64** %data, align 8, !dbg !119
  %arrayidx = getelementptr inbounds i64, i64* %5, i64 %4, !dbg !119
  store i64 5, i64* %arrayidx, align 8, !dbg !120
  br label %for.inc, !dbg !121

for.inc:                                          ; preds = %for.body5
  %6 = load i64, i64* %i2, align 8, !dbg !122
  %inc = add i64 %6, 1, !dbg !122
  store i64 %inc, i64* %i2, align 8, !dbg !122
  br label %for.cond3, !dbg !124, !llvm.loop !125

for.end:                                          ; preds = %for.cond3
  %7 = load i64*, i64** %data, align 8, !dbg !127
  %8 = bitcast i64* %7 to i8*, !dbg !127
  call void @free(i8* %8) #4, !dbg !128
  br label %for.inc6, !dbg !129

for.inc6:                                         ; preds = %for.end
  %9 = load i32, i32* %i, align 4, !dbg !130
  %inc7 = add nsw i32 %9, 1, !dbg !130
  store i32 %inc7, i32* %i, align 4, !dbg !130
  br label %for.cond, !dbg !132, !llvm.loop !133

for.end8:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4, !dbg !135
  br label %for.cond9, !dbg !137

for.cond9:                                        ; preds = %for.inc13, %for.end8
  %10 = load i32, i32* %j, align 4, !dbg !138
  %cmp10 = icmp slt i32 %10, 1, !dbg !141
  br i1 %cmp10, label %for.body11, label %for.end15, !dbg !142

for.body11:                                       ; preds = %for.cond9
  %11 = load i64*, i64** %data, align 8, !dbg !143
  %arrayidx12 = getelementptr inbounds i64, i64* %11, i64 0, !dbg !143
  %12 = load i64, i64* %arrayidx12, align 8, !dbg !143
  call void @printLongLine(i64 %12), !dbg !145
  br label %for.inc13, !dbg !146

for.inc13:                                        ; preds = %for.body11
  %13 = load i32, i32* %j, align 4, !dbg !147
  %inc14 = add nsw i32 %13, 1, !dbg !147
  store i32 %inc14, i32* %j, align 4, !dbg !147
  br label %for.cond9, !dbg !149, !llvm.loop !150

for.end15:                                        ; preds = %if.then, %for.cond9
  ret void, !dbg !152
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #1

; Function Attrs: nounwind
declare void @free(i8*) #1

; Function Attrs: nounwind uwtable
define void @good47() #0 !dbg !153 {
entry:
  %i = alloca i32, align 4
  %k = alloca i32, align 4
  %data = alloca i64*, align 8
  %i2 = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32* %i, metadata !154, metadata !35), !dbg !155
  call void @llvm.dbg.declare(metadata i32* %k, metadata !156, metadata !35), !dbg !157
  call void @llvm.dbg.declare(metadata i64** %data, metadata !158, metadata !35), !dbg !159
  store i64* null, i64** %data, align 8, !dbg !160
  store i32 0, i32* %i, align 4, !dbg !161
  br label %for.cond, !dbg !163

for.cond:                                         ; preds = %for.inc6, %entry
  %0 = load i32, i32* %i, align 4, !dbg !164
  %cmp = icmp slt i32 %0, 1, !dbg !167
  br i1 %cmp, label %for.body, label %for.end8, !dbg !168

for.body:                                         ; preds = %for.cond
  %call = call noalias i8* @malloc(i64 80) #4, !dbg !169
  %1 = bitcast i8* %call to i64*, !dbg !171
  store i64* %1, i64** %data, align 8, !dbg !172
  %2 = load i64*, i64** %data, align 8, !dbg !173
  %cmp1 = icmp eq i64* %2, null, !dbg !175
  br i1 %cmp1, label %if.then, label %if.end, !dbg !176

if.then:                                          ; preds = %for.body
  br label %for.end14, !dbg !177

if.end:                                           ; preds = %for.body
  call void @llvm.dbg.declare(metadata i64* %i2, metadata !179, metadata !35), !dbg !181
  store i64 0, i64* %i2, align 8, !dbg !182
  br label %for.cond3, !dbg !184

for.cond3:                                        ; preds = %for.inc, %if.end
  %3 = load i64, i64* %i2, align 8, !dbg !185
  %cmp4 = icmp ult i64 %3, 10, !dbg !188
  br i1 %cmp4, label %for.body5, label %for.end, !dbg !189

for.body5:                                        ; preds = %for.cond3
  %4 = load i64, i64* %i2, align 8, !dbg !190
  %5 = load i64*, i64** %data, align 8, !dbg !192
  %arrayidx = getelementptr inbounds i64, i64* %5, i64 %4, !dbg !192
  store i64 5, i64* %arrayidx, align 8, !dbg !193
  br label %for.inc, !dbg !194

for.inc:                                          ; preds = %for.body5
  %6 = load i64, i64* %i2, align 8, !dbg !195
  %inc = add i64 %6, 1, !dbg !195
  store i64 %inc, i64* %i2, align 8, !dbg !195
  br label %for.cond3, !dbg !197, !llvm.loop !198

for.end:                                          ; preds = %for.cond3
  %7 = load i64*, i64** %data, align 8, !dbg !200
  %8 = bitcast i64* %7 to i8*, !dbg !200
  call void @free(i8* %8) #4, !dbg !201
  br label %for.inc6, !dbg !202

for.inc6:                                         ; preds = %for.end
  %9 = load i32, i32* %i, align 4, !dbg !203
  %inc7 = add nsw i32 %9, 1, !dbg !203
  store i32 %inc7, i32* %i, align 4, !dbg !203
  br label %for.cond, !dbg !205, !llvm.loop !206

for.end8:                                         ; preds = %for.cond
  store i32 0, i32* %k, align 4, !dbg !208
  br label %for.cond9, !dbg !210

for.cond9:                                        ; preds = %for.inc12, %for.end8
  %10 = load i32, i32* %k, align 4, !dbg !211
  %cmp10 = icmp slt i32 %10, 1, !dbg !214
  br i1 %cmp10, label %for.body11, label %for.end14, !dbg !215

for.body11:                                       ; preds = %for.cond9
  br label %for.inc12, !dbg !216

for.inc12:                                        ; preds = %for.body11
  %11 = load i32, i32* %k, align 4, !dbg !218
  %inc13 = add nsw i32 %11, 1, !dbg !218
  store i32 %inc13, i32* %k, align 4, !dbg !218
  br label %for.cond9, !dbg !220, !llvm.loop !221

for.end14:                                        ; preds = %if.then, %for.cond9
  ret void, !dbg !223
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !224 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @good47(), !dbg !225
  call void @bad47(), !dbg !226
  ret i32 1, !dbg !227
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
!1 = !DIFile(filename: "416_47.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/416")
!2 = !{}
!3 = !{!4, !5, !6}
!4 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64, align: 64)
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64, align: 64)
!7 = !DIBasicType(name: "long int", size: 64, align: 64, encoding: DW_ATE_signed)
!8 = !{!9, !12, !13, !14, !15, !16}
!9 = distinct !DIGlobalVariable(name: "GLOBAL_CONST_TRUE", scope: !0, file: !10, line: 10, type: !11, isLocal: false, isDefinition: true, variable: i32* @GLOBAL_CONST_TRUE)
!10 = !DIFile(filename: "./416_47.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/416")
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
!75 = distinct !DISubprogram(name: "bad47", scope: !10, file: !10, line: 59, type: !76, isLocal: false, isDefinition: true, scopeLine: 60, isOptimized: false, unit: !0, variables: !2)
!76 = !DISubroutineType(types: !77)
!77 = !{null}
!78 = !DILocalVariable(name: "i", scope: !75, file: !10, line: 61, type: !4)
!79 = !DILocation(line: 61, column: 9, scope: !75)
!80 = !DILocalVariable(name: "j", scope: !75, file: !10, line: 61, type: !4)
!81 = !DILocation(line: 61, column: 11, scope: !75)
!82 = !DILocalVariable(name: "data", scope: !75, file: !10, line: 62, type: !6)
!83 = !DILocation(line: 62, column: 12, scope: !75)
!84 = !DILocation(line: 64, column: 10, scope: !75)
!85 = !DILocation(line: 65, column: 11, scope: !86)
!86 = distinct !DILexicalBlock(scope: !75, file: !10, line: 65, column: 5)
!87 = !DILocation(line: 65, column: 9, scope: !86)
!88 = !DILocation(line: 65, column: 16, scope: !89)
!89 = !DILexicalBlockFile(scope: !90, file: !10, discriminator: 1)
!90 = distinct !DILexicalBlock(scope: !86, file: !10, line: 65, column: 5)
!91 = !DILocation(line: 65, column: 18, scope: !89)
!92 = !DILocation(line: 65, column: 5, scope: !89)
!93 = !DILocation(line: 67, column: 24, scope: !94)
!94 = distinct !DILexicalBlock(scope: !90, file: !10, line: 66, column: 5)
!95 = !DILocation(line: 67, column: 16, scope: !94)
!96 = !DILocation(line: 67, column: 14, scope: !94)
!97 = !DILocation(line: 68, column: 13, scope: !98)
!98 = distinct !DILexicalBlock(scope: !94, file: !10, line: 68, column: 13)
!99 = !DILocation(line: 68, column: 18, scope: !98)
!100 = !DILocation(line: 68, column: 13, scope: !94)
!101 = !DILocation(line: 68, column: 27, scope: !102)
!102 = !DILexicalBlockFile(scope: !98, file: !10, discriminator: 1)
!103 = !DILocalVariable(name: "i", scope: !104, file: !10, line: 70, type: !105)
!104 = distinct !DILexicalBlock(scope: !94, file: !10, line: 69, column: 9)
!105 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !106, line: 62, baseType: !107)
!106 = !DIFile(filename: "/usr/local/bin/../lib/clang/3.9.0/include/stddef.h", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/416")
!107 = !DIBasicType(name: "long unsigned int", size: 64, align: 64, encoding: DW_ATE_unsigned)
!108 = !DILocation(line: 70, column: 20, scope: !104)
!109 = !DILocation(line: 71, column: 19, scope: !110)
!110 = distinct !DILexicalBlock(scope: !104, file: !10, line: 71, column: 13)
!111 = !DILocation(line: 71, column: 17, scope: !110)
!112 = !DILocation(line: 71, column: 24, scope: !113)
!113 = !DILexicalBlockFile(scope: !114, file: !10, discriminator: 1)
!114 = distinct !DILexicalBlock(scope: !110, file: !10, line: 71, column: 13)
!115 = !DILocation(line: 71, column: 26, scope: !113)
!116 = !DILocation(line: 71, column: 13, scope: !113)
!117 = !DILocation(line: 73, column: 22, scope: !118)
!118 = distinct !DILexicalBlock(scope: !114, file: !10, line: 72, column: 13)
!119 = !DILocation(line: 73, column: 17, scope: !118)
!120 = !DILocation(line: 73, column: 25, scope: !118)
!121 = !DILocation(line: 74, column: 13, scope: !118)
!122 = !DILocation(line: 71, column: 33, scope: !123)
!123 = !DILexicalBlockFile(scope: !114, file: !10, discriminator: 2)
!124 = !DILocation(line: 71, column: 13, scope: !123)
!125 = distinct !{!125, !126}
!126 = !DILocation(line: 71, column: 13, scope: !104)
!127 = !DILocation(line: 77, column: 14, scope: !94)
!128 = !DILocation(line: 77, column: 9, scope: !94)
!129 = !DILocation(line: 78, column: 5, scope: !94)
!130 = !DILocation(line: 65, column: 24, scope: !131)
!131 = !DILexicalBlockFile(scope: !90, file: !10, discriminator: 2)
!132 = !DILocation(line: 65, column: 5, scope: !131)
!133 = distinct !{!133, !134}
!134 = !DILocation(line: 65, column: 5, scope: !75)
!135 = !DILocation(line: 79, column: 11, scope: !136)
!136 = distinct !DILexicalBlock(scope: !75, file: !10, line: 79, column: 5)
!137 = !DILocation(line: 79, column: 9, scope: !136)
!138 = !DILocation(line: 79, column: 16, scope: !139)
!139 = !DILexicalBlockFile(scope: !140, file: !10, discriminator: 1)
!140 = distinct !DILexicalBlock(scope: !136, file: !10, line: 79, column: 5)
!141 = !DILocation(line: 79, column: 18, scope: !139)
!142 = !DILocation(line: 79, column: 5, scope: !139)
!143 = !DILocation(line: 82, column: 23, scope: !144)
!144 = distinct !DILexicalBlock(scope: !140, file: !10, line: 80, column: 5)
!145 = !DILocation(line: 82, column: 9, scope: !144)
!146 = !DILocation(line: 84, column: 5, scope: !144)
!147 = !DILocation(line: 79, column: 24, scope: !148)
!148 = !DILexicalBlockFile(scope: !140, file: !10, discriminator: 2)
!149 = !DILocation(line: 79, column: 5, scope: !148)
!150 = distinct !{!150, !151}
!151 = !DILocation(line: 79, column: 5, scope: !75)
!152 = !DILocation(line: 85, column: 1, scope: !75)
!153 = distinct !DISubprogram(name: "good47", scope: !10, file: !10, line: 91, type: !76, isLocal: false, isDefinition: true, scopeLine: 92, isOptimized: false, unit: !0, variables: !2)
!154 = !DILocalVariable(name: "i", scope: !153, file: !10, line: 93, type: !4)
!155 = !DILocation(line: 93, column: 9, scope: !153)
!156 = !DILocalVariable(name: "k", scope: !153, file: !10, line: 93, type: !4)
!157 = !DILocation(line: 93, column: 11, scope: !153)
!158 = !DILocalVariable(name: "data", scope: !153, file: !10, line: 94, type: !6)
!159 = !DILocation(line: 94, column: 12, scope: !153)
!160 = !DILocation(line: 96, column: 10, scope: !153)
!161 = !DILocation(line: 97, column: 11, scope: !162)
!162 = distinct !DILexicalBlock(scope: !153, file: !10, line: 97, column: 5)
!163 = !DILocation(line: 97, column: 9, scope: !162)
!164 = !DILocation(line: 97, column: 16, scope: !165)
!165 = !DILexicalBlockFile(scope: !166, file: !10, discriminator: 1)
!166 = distinct !DILexicalBlock(scope: !162, file: !10, line: 97, column: 5)
!167 = !DILocation(line: 97, column: 18, scope: !165)
!168 = !DILocation(line: 97, column: 5, scope: !165)
!169 = !DILocation(line: 99, column: 24, scope: !170)
!170 = distinct !DILexicalBlock(scope: !166, file: !10, line: 98, column: 5)
!171 = !DILocation(line: 99, column: 16, scope: !170)
!172 = !DILocation(line: 99, column: 14, scope: !170)
!173 = !DILocation(line: 100, column: 13, scope: !174)
!174 = distinct !DILexicalBlock(scope: !170, file: !10, line: 100, column: 13)
!175 = !DILocation(line: 100, column: 18, scope: !174)
!176 = !DILocation(line: 100, column: 13, scope: !170)
!177 = !DILocation(line: 100, column: 27, scope: !178)
!178 = !DILexicalBlockFile(scope: !174, file: !10, discriminator: 1)
!179 = !DILocalVariable(name: "i", scope: !180, file: !10, line: 102, type: !105)
!180 = distinct !DILexicalBlock(scope: !170, file: !10, line: 101, column: 9)
!181 = !DILocation(line: 102, column: 20, scope: !180)
!182 = !DILocation(line: 103, column: 19, scope: !183)
!183 = distinct !DILexicalBlock(scope: !180, file: !10, line: 103, column: 13)
!184 = !DILocation(line: 103, column: 17, scope: !183)
!185 = !DILocation(line: 103, column: 24, scope: !186)
!186 = !DILexicalBlockFile(scope: !187, file: !10, discriminator: 1)
!187 = distinct !DILexicalBlock(scope: !183, file: !10, line: 103, column: 13)
!188 = !DILocation(line: 103, column: 26, scope: !186)
!189 = !DILocation(line: 103, column: 13, scope: !186)
!190 = !DILocation(line: 105, column: 22, scope: !191)
!191 = distinct !DILexicalBlock(scope: !187, file: !10, line: 104, column: 13)
!192 = !DILocation(line: 105, column: 17, scope: !191)
!193 = !DILocation(line: 105, column: 25, scope: !191)
!194 = !DILocation(line: 106, column: 13, scope: !191)
!195 = !DILocation(line: 103, column: 33, scope: !196)
!196 = !DILexicalBlockFile(scope: !187, file: !10, discriminator: 2)
!197 = !DILocation(line: 103, column: 13, scope: !196)
!198 = distinct !{!198, !199}
!199 = !DILocation(line: 103, column: 13, scope: !180)
!200 = !DILocation(line: 109, column: 14, scope: !170)
!201 = !DILocation(line: 109, column: 9, scope: !170)
!202 = !DILocation(line: 110, column: 5, scope: !170)
!203 = !DILocation(line: 97, column: 24, scope: !204)
!204 = !DILexicalBlockFile(scope: !166, file: !10, discriminator: 2)
!205 = !DILocation(line: 97, column: 5, scope: !204)
!206 = distinct !{!206, !207}
!207 = !DILocation(line: 97, column: 5, scope: !153)
!208 = !DILocation(line: 111, column: 11, scope: !209)
!209 = distinct !DILexicalBlock(scope: !153, file: !10, line: 111, column: 5)
!210 = !DILocation(line: 111, column: 9, scope: !209)
!211 = !DILocation(line: 111, column: 16, scope: !212)
!212 = !DILexicalBlockFile(scope: !213, file: !10, discriminator: 1)
!213 = distinct !DILexicalBlock(scope: !209, file: !10, line: 111, column: 5)
!214 = !DILocation(line: 111, column: 18, scope: !212)
!215 = !DILocation(line: 111, column: 5, scope: !212)
!216 = !DILocation(line: 117, column: 5, scope: !217)
!217 = distinct !DILexicalBlock(scope: !213, file: !10, line: 112, column: 5)
!218 = !DILocation(line: 111, column: 24, scope: !219)
!219 = !DILexicalBlockFile(scope: !213, file: !10, discriminator: 2)
!220 = !DILocation(line: 111, column: 5, scope: !219)
!221 = distinct !{!221, !222}
!222 = !DILocation(line: 111, column: 5, scope: !153)
!223 = !DILocation(line: 118, column: 1, scope: !153)
!224 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 121, type: !21, isLocal: false, isDefinition: true, scopeLine: 121, isOptimized: false, unit: !0, variables: !2)
!225 = !DILocation(line: 122, column: 5, scope: !224)
!226 = !DILocation(line: 123, column: 2, scope: !224)
!227 = !DILocation(line: 124, column: 5, scope: !224)
