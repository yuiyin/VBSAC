; ModuleID = './416_34.c'
source_filename = "./416_34.c"
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
@.str.3 = private unnamed_addr constant [8 x i8] c"BadSink\00", align 1
@.str.4 = private unnamed_addr constant [9 x i8] c"GoodSink\00", align 1

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
  %call = call i32 @rand() #5, !dbg !27
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
  call void @llvm.dbg.declare(metadata i8* %charHex.addr, metadata !33, metadata !34), !dbg !35
  %0 = load i8, i8* %charHex.addr, align 1, !dbg !36
  %conv = sext i8 %0 to i32, !dbg !37
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), i32 %conv), !dbg !38
  ret void, !dbg !39
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #2

declare i32 @printf(i8*, ...) #3

; Function Attrs: nounwind uwtable
define void @printLine(i8* %line) #0 !dbg !40 {
entry:
  %line.addr = alloca i8*, align 8
  store i8* %line, i8** %line.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %line.addr, metadata !45, metadata !34), !dbg !46
  %0 = load i8*, i8** %line.addr, align 8, !dbg !47
  %cmp = icmp ne i8* %0, null, !dbg !49
  br i1 %cmp, label %if.then, label %if.end, !dbg !50

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** %line.addr, align 8, !dbg !51
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i32 0, i32 0), i8* %1), !dbg !53
  br label %if.end, !dbg !54

if.end:                                           ; preds = %if.then, %entry
  ret void, !dbg !55
}

; Function Attrs: nounwind uwtable
define void @printIntLine(i32 %intNumber) #0 !dbg !56 {
entry:
  %intNumber.addr = alloca i32, align 4
  store i32 %intNumber, i32* %intNumber.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %intNumber.addr, metadata !59, metadata !34), !dbg !60
  %0 = load i32, i32* %intNumber.addr, align 4, !dbg !61
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), i32 %0), !dbg !62
  ret void, !dbg !63
}

; Function Attrs: nounwind uwtable
define void @printLongLine(i64 %longIntNumber) #0 !dbg !64 {
entry:
  %longIntNumber.addr = alloca i64, align 8
  store i64 %longIntNumber, i64* %longIntNumber.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %longIntNumber.addr, metadata !70, metadata !34), !dbg !71
  %0 = load i64, i64* %longIntNumber.addr, align 8, !dbg !72
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.2, i32 0, i32 0), i64 %0), !dbg !73
  ret void, !dbg !74
}

; Function Attrs: nounwind uwtable
define void @bad34() #0 !dbg !75 {
entry:
  %reversedString = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %reversedString, metadata !78, metadata !34), !dbg !82
  %call = call i8* @helperBad(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.3, i32 0, i32 0)), !dbg !83
  store i8* %call, i8** %reversedString, align 8, !dbg !82
  %0 = load i8*, i8** %reversedString, align 8, !dbg !84
  %cmp = icmp eq i8* %0, null, !dbg !86
  br i1 %cmp, label %if.then, label %if.end, !dbg !87

if.then:                                          ; preds = %entry
  br label %return, !dbg !88

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %reversedString, align 8, !dbg !90
  call void @printLine(i8* %1), !dbg !91
  br label %return, !dbg !92

return:                                           ; preds = %if.end, %if.then
  ret void, !dbg !93
}

; Function Attrs: nounwind uwtable
define internal i8* @helperBad(i8* %aString) #0 !dbg !95 {
entry:
  %retval = alloca i8*, align 8
  %aString.addr = alloca i8*, align 8
  %i = alloca i64, align 8
  %j = alloca i64, align 8
  %reversedString = alloca i8*, align 8
  store i8* %aString, i8** %aString.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %aString.addr, metadata !98, metadata !34), !dbg !99
  call void @llvm.dbg.declare(metadata i64* %i, metadata !100, metadata !34), !dbg !104
  store i64 0, i64* %i, align 8, !dbg !104
  call void @llvm.dbg.declare(metadata i64* %j, metadata !105, metadata !34), !dbg !106
  call void @llvm.dbg.declare(metadata i8** %reversedString, metadata !107, metadata !34), !dbg !108
  store i8* null, i8** %reversedString, align 8, !dbg !108
  %0 = load i8*, i8** %aString.addr, align 8, !dbg !109
  %cmp = icmp ne i8* %0, null, !dbg !111
  br i1 %cmp, label %if.then, label %if.else, !dbg !112

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** %aString.addr, align 8, !dbg !113
  %call = call i64 @strlen(i8* %1) #6, !dbg !115
  store i64 %call, i64* %i, align 8, !dbg !116
  %2 = load i64, i64* %i, align 8, !dbg !117
  %add = add i64 %2, 1, !dbg !118
  %call1 = call noalias i8* @malloc(i64 %add) #5, !dbg !119
  store i8* %call1, i8** %reversedString, align 8, !dbg !120
  %3 = load i8*, i8** %reversedString, align 8, !dbg !121
  %cmp2 = icmp eq i8* %3, null, !dbg !123
  br i1 %cmp2, label %if.then3, label %if.end, !dbg !124

if.then3:                                         ; preds = %if.then
  store i8* null, i8** %retval, align 8, !dbg !125
  br label %return, !dbg !125

if.end:                                           ; preds = %if.then
  store i64 0, i64* %j, align 8, !dbg !127
  br label %for.cond, !dbg !129

for.cond:                                         ; preds = %for.inc, %if.end
  %4 = load i64, i64* %j, align 8, !dbg !130
  %5 = load i64, i64* %i, align 8, !dbg !133
  %cmp4 = icmp ult i64 %4, %5, !dbg !134
  br i1 %cmp4, label %for.body, label %for.end, !dbg !135

for.body:                                         ; preds = %for.cond
  %6 = load i64, i64* %i, align 8, !dbg !136
  %7 = load i64, i64* %j, align 8, !dbg !138
  %sub = sub i64 %6, %7, !dbg !139
  %sub5 = sub i64 %sub, 1, !dbg !140
  %8 = load i8*, i8** %aString.addr, align 8, !dbg !141
  %arrayidx = getelementptr inbounds i8, i8* %8, i64 %sub5, !dbg !141
  %9 = load i8, i8* %arrayidx, align 1, !dbg !141
  %10 = load i64, i64* %j, align 8, !dbg !142
  %11 = load i8*, i8** %reversedString, align 8, !dbg !143
  %arrayidx6 = getelementptr inbounds i8, i8* %11, i64 %10, !dbg !143
  store i8 %9, i8* %arrayidx6, align 1, !dbg !144
  br label %for.inc, !dbg !145

for.inc:                                          ; preds = %for.body
  %12 = load i64, i64* %j, align 8, !dbg !146
  %inc = add i64 %12, 1, !dbg !146
  store i64 %inc, i64* %j, align 8, !dbg !146
  br label %for.cond, !dbg !148, !llvm.loop !149

for.end:                                          ; preds = %for.cond
  %13 = load i64, i64* %i, align 8, !dbg !151
  %14 = load i8*, i8** %reversedString, align 8, !dbg !152
  %arrayidx7 = getelementptr inbounds i8, i8* %14, i64 %13, !dbg !152
  store i8 0, i8* %arrayidx7, align 1, !dbg !153
  %15 = load i8*, i8** %reversedString, align 8, !dbg !154
  call void @free(i8* %15) #5, !dbg !155
  %16 = load i8*, i8** %reversedString, align 8, !dbg !156
  store i8* %16, i8** %retval, align 8, !dbg !157
  br label %return, !dbg !157

if.else:                                          ; preds = %entry
  store i8* null, i8** %retval, align 8, !dbg !158
  br label %return, !dbg !158

return:                                           ; preds = %if.else, %for.end, %if.then3
  %17 = load i8*, i8** %retval, align 8, !dbg !160
  ret i8* %17, !dbg !160
}

; Function Attrs: nounwind uwtable
define void @good34() #0 !dbg !161 {
entry:
  %reversedString = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %reversedString, metadata !162, metadata !34), !dbg !166
  %call = call i8* @helperGood(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.4, i32 0, i32 0)), !dbg !167
  store i8* %call, i8** %reversedString, align 8, !dbg !166
  %0 = load i8*, i8** %reversedString, align 8, !dbg !168
  %cmp = icmp eq i8* %0, null, !dbg !170
  br i1 %cmp, label %if.then, label %if.end, !dbg !171

if.then:                                          ; preds = %entry
  br label %return, !dbg !172

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %reversedString, align 8, !dbg !174
  call void @printLine(i8* %1), !dbg !175
  %2 = load i8*, i8** %reversedString, align 8, !dbg !176
  call void @free(i8* %2) #5, !dbg !177
  br label %return, !dbg !178

return:                                           ; preds = %if.end, %if.then
  ret void, !dbg !179
}

; Function Attrs: nounwind uwtable
define internal i8* @helperGood(i8* %aString) #0 !dbg !181 {
entry:
  %retval = alloca i8*, align 8
  %aString.addr = alloca i8*, align 8
  %i = alloca i64, align 8
  %j = alloca i64, align 8
  %reversedString = alloca i8*, align 8
  store i8* %aString, i8** %aString.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %aString.addr, metadata !182, metadata !34), !dbg !183
  call void @llvm.dbg.declare(metadata i64* %i, metadata !184, metadata !34), !dbg !185
  store i64 0, i64* %i, align 8, !dbg !185
  call void @llvm.dbg.declare(metadata i64* %j, metadata !186, metadata !34), !dbg !187
  call void @llvm.dbg.declare(metadata i8** %reversedString, metadata !188, metadata !34), !dbg !189
  store i8* null, i8** %reversedString, align 8, !dbg !189
  %0 = load i8*, i8** %aString.addr, align 8, !dbg !190
  %cmp = icmp ne i8* %0, null, !dbg !192
  br i1 %cmp, label %if.then, label %if.else, !dbg !193

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** %aString.addr, align 8, !dbg !194
  %call = call i64 @strlen(i8* %1) #6, !dbg !196
  store i64 %call, i64* %i, align 8, !dbg !197
  %2 = load i64, i64* %i, align 8, !dbg !198
  %add = add i64 %2, 1, !dbg !199
  %call1 = call noalias i8* @malloc(i64 %add) #5, !dbg !200
  store i8* %call1, i8** %reversedString, align 8, !dbg !201
  %3 = load i8*, i8** %reversedString, align 8, !dbg !202
  %cmp2 = icmp eq i8* %3, null, !dbg !204
  br i1 %cmp2, label %if.then3, label %if.end, !dbg !205

if.then3:                                         ; preds = %if.then
  store i8* null, i8** %retval, align 8, !dbg !206
  br label %return, !dbg !206

if.end:                                           ; preds = %if.then
  store i64 0, i64* %j, align 8, !dbg !208
  br label %for.cond, !dbg !210

for.cond:                                         ; preds = %for.inc, %if.end
  %4 = load i64, i64* %j, align 8, !dbg !211
  %5 = load i64, i64* %i, align 8, !dbg !214
  %cmp4 = icmp ult i64 %4, %5, !dbg !215
  br i1 %cmp4, label %for.body, label %for.end, !dbg !216

for.body:                                         ; preds = %for.cond
  %6 = load i64, i64* %i, align 8, !dbg !217
  %7 = load i64, i64* %j, align 8, !dbg !219
  %sub = sub i64 %6, %7, !dbg !220
  %sub5 = sub i64 %sub, 1, !dbg !221
  %8 = load i8*, i8** %aString.addr, align 8, !dbg !222
  %arrayidx = getelementptr inbounds i8, i8* %8, i64 %sub5, !dbg !222
  %9 = load i8, i8* %arrayidx, align 1, !dbg !222
  %10 = load i64, i64* %j, align 8, !dbg !223
  %11 = load i8*, i8** %reversedString, align 8, !dbg !224
  %arrayidx6 = getelementptr inbounds i8, i8* %11, i64 %10, !dbg !224
  store i8 %9, i8* %arrayidx6, align 1, !dbg !225
  br label %for.inc, !dbg !226

for.inc:                                          ; preds = %for.body
  %12 = load i64, i64* %j, align 8, !dbg !227
  %inc = add i64 %12, 1, !dbg !227
  store i64 %inc, i64* %j, align 8, !dbg !227
  br label %for.cond, !dbg !229, !llvm.loop !230

for.end:                                          ; preds = %for.cond
  %13 = load i64, i64* %i, align 8, !dbg !232
  %14 = load i8*, i8** %reversedString, align 8, !dbg !233
  %arrayidx7 = getelementptr inbounds i8, i8* %14, i64 %13, !dbg !233
  store i8 0, i8* %arrayidx7, align 1, !dbg !234
  %15 = load i8*, i8** %reversedString, align 8, !dbg !235
  store i8* %15, i8** %retval, align 8, !dbg !236
  br label %return, !dbg !236

if.else:                                          ; preds = %entry
  store i8* null, i8** %retval, align 8, !dbg !237
  br label %return, !dbg !237

return:                                           ; preds = %if.else, %for.end, %if.then3
  %16 = load i8*, i8** %retval, align 8, !dbg !239
  ret i8* %16, !dbg !239
}

; Function Attrs: nounwind
declare void @free(i8*) #1

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !240 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @good34(), !dbg !241
  call void @bad34(), !dbg !242
  ret i32 1, !dbg !243
}

; Function Attrs: nounwind readonly
declare i64 @strlen(i8*) #4

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #1

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone }
attributes #3 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readonly "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind }
attributes #6 = { nounwind readonly }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!17, !18}
!llvm.ident = !{!19}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (tags/RELEASE_390/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, globals: !8)
!1 = !DIFile(filename: "416_34.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/416")
!2 = !{}
!3 = !{!4, !5, !6}
!4 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64, align: 64)
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64, align: 64)
!7 = !DIBasicType(name: "char", size: 8, align: 8, encoding: DW_ATE_signed_char)
!8 = !{!9, !12, !13, !14, !15, !16}
!9 = distinct !DIGlobalVariable(name: "GLOBAL_CONST_TRUE", scope: !0, file: !10, line: 10, type: !11, isLocal: false, isDefinition: true, variable: i32* @GLOBAL_CONST_TRUE)
!10 = !DIFile(filename: "./416_34.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/416")
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
!32 = !{null, !7}
!33 = !DILocalVariable(name: "charHex", arg: 1, scope: !30, file: !10, line: 33, type: !7)
!34 = !DIExpression()
!35 = !DILocation(line: 33, column: 29, scope: !30)
!36 = !DILocation(line: 35, column: 25, scope: !30)
!37 = !DILocation(line: 35, column: 20, scope: !30)
!38 = !DILocation(line: 35, column: 5, scope: !30)
!39 = !DILocation(line: 36, column: 1, scope: !30)
!40 = distinct !DISubprogram(name: "printLine", scope: !10, file: !10, line: 38, type: !41, isLocal: false, isDefinition: true, scopeLine: 39, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!41 = !DISubroutineType(types: !42)
!42 = !{null, !43}
!43 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !44, size: 64, align: 64)
!44 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !7)
!45 = !DILocalVariable(name: "line", arg: 1, scope: !40, file: !10, line: 38, type: !43)
!46 = !DILocation(line: 38, column: 30, scope: !40)
!47 = !DILocation(line: 40, column: 8, scope: !48)
!48 = distinct !DILexicalBlock(scope: !40, file: !10, line: 40, column: 8)
!49 = !DILocation(line: 40, column: 13, scope: !48)
!50 = !DILocation(line: 40, column: 8, scope: !40)
!51 = !DILocation(line: 42, column: 24, scope: !52)
!52 = distinct !DILexicalBlock(scope: !48, file: !10, line: 41, column: 5)
!53 = !DILocation(line: 42, column: 9, scope: !52)
!54 = !DILocation(line: 43, column: 5, scope: !52)
!55 = !DILocation(line: 44, column: 1, scope: !40)
!56 = distinct !DISubprogram(name: "printIntLine", scope: !10, file: !10, line: 46, type: !57, isLocal: false, isDefinition: true, scopeLine: 47, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!57 = !DISubroutineType(types: !58)
!58 = !{null, !4}
!59 = !DILocalVariable(name: "intNumber", arg: 1, scope: !56, file: !10, line: 46, type: !4)
!60 = !DILocation(line: 46, column: 24, scope: !56)
!61 = !DILocation(line: 48, column: 20, scope: !56)
!62 = !DILocation(line: 48, column: 5, scope: !56)
!63 = !DILocation(line: 49, column: 1, scope: !56)
!64 = distinct !DISubprogram(name: "printLongLine", scope: !10, file: !10, line: 51, type: !65, isLocal: false, isDefinition: true, scopeLine: 52, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!65 = !DISubroutineType(types: !66)
!66 = !{null, !67}
!67 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !68, line: 197, baseType: !69)
!68 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/sys/types.h", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/416")
!69 = !DIBasicType(name: "long int", size: 64, align: 64, encoding: DW_ATE_signed)
!70 = !DILocalVariable(name: "longIntNumber", arg: 1, scope: !64, file: !10, line: 51, type: !67)
!71 = !DILocation(line: 51, column: 29, scope: !64)
!72 = !DILocation(line: 53, column: 21, scope: !64)
!73 = !DILocation(line: 53, column: 5, scope: !64)
!74 = !DILocation(line: 54, column: 1, scope: !64)
!75 = distinct !DISubprogram(name: "bad34", scope: !10, file: !10, line: 114, type: !76, isLocal: false, isDefinition: true, scopeLine: 115, isOptimized: false, unit: !0, variables: !2)
!76 = !DISubroutineType(types: !77)
!77 = !{null}
!78 = !DILocalVariable(name: "reversedString", scope: !79, file: !10, line: 120, type: !6)
!79 = distinct !DILexicalBlock(scope: !80, file: !10, line: 118, column: 9)
!80 = distinct !DILexicalBlock(scope: !81, file: !10, line: 117, column: 5)
!81 = distinct !DILexicalBlock(scope: !75, file: !10, line: 116, column: 8)
!82 = !DILocation(line: 120, column: 20, scope: !79)
!83 = !DILocation(line: 120, column: 37, scope: !79)
!84 = !DILocation(line: 121, column: 17, scope: !85)
!85 = distinct !DILexicalBlock(scope: !79, file: !10, line: 121, column: 17)
!86 = !DILocation(line: 121, column: 32, scope: !85)
!87 = !DILocation(line: 121, column: 17, scope: !79)
!88 = !DILocation(line: 121, column: 41, scope: !89)
!89 = !DILexicalBlockFile(scope: !85, file: !10, discriminator: 1)
!90 = !DILocation(line: 122, column: 23, scope: !79)
!91 = !DILocation(line: 122, column: 13, scope: !79)
!92 = !DILocation(line: 126, column: 1, scope: !75)
!93 = !DILocation(line: 126, column: 1, scope: !94)
!94 = !DILexicalBlockFile(scope: !75, file: !10, discriminator: 1)
!95 = distinct !DISubprogram(name: "helperBad", scope: !10, file: !10, line: 57, type: !96, isLocal: true, isDefinition: true, scopeLine: 58, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!96 = !DISubroutineType(types: !97)
!97 = !{!6, !6}
!98 = !DILocalVariable(name: "aString", arg: 1, scope: !95, file: !10, line: 57, type: !6)
!99 = !DILocation(line: 57, column: 32, scope: !95)
!100 = !DILocalVariable(name: "i", scope: !95, file: !10, line: 59, type: !101)
!101 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !102, line: 62, baseType: !103)
!102 = !DIFile(filename: "/usr/local/bin/../lib/clang/3.9.0/include/stddef.h", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/416")
!103 = !DIBasicType(name: "long unsigned int", size: 64, align: 64, encoding: DW_ATE_unsigned)
!104 = !DILocation(line: 59, column: 12, scope: !95)
!105 = !DILocalVariable(name: "j", scope: !95, file: !10, line: 60, type: !101)
!106 = !DILocation(line: 60, column: 12, scope: !95)
!107 = !DILocalVariable(name: "reversedString", scope: !95, file: !10, line: 61, type: !6)
!108 = !DILocation(line: 61, column: 12, scope: !95)
!109 = !DILocation(line: 62, column: 9, scope: !110)
!110 = distinct !DILexicalBlock(scope: !95, file: !10, line: 62, column: 9)
!111 = !DILocation(line: 62, column: 17, scope: !110)
!112 = !DILocation(line: 62, column: 9, scope: !95)
!113 = !DILocation(line: 64, column: 20, scope: !114)
!114 = distinct !DILexicalBlock(scope: !110, file: !10, line: 63, column: 5)
!115 = !DILocation(line: 64, column: 13, scope: !114)
!116 = !DILocation(line: 64, column: 11, scope: !114)
!117 = !DILocation(line: 65, column: 42, scope: !114)
!118 = !DILocation(line: 65, column: 43, scope: !114)
!119 = !DILocation(line: 65, column: 35, scope: !114)
!120 = !DILocation(line: 65, column: 24, scope: !114)
!121 = !DILocation(line: 66, column: 13, scope: !122)
!122 = distinct !DILexicalBlock(scope: !114, file: !10, line: 66, column: 13)
!123 = !DILocation(line: 66, column: 28, scope: !122)
!124 = !DILocation(line: 66, column: 13, scope: !114)
!125 = !DILocation(line: 66, column: 37, scope: !126)
!126 = !DILexicalBlockFile(scope: !122, file: !10, discriminator: 1)
!127 = !DILocation(line: 67, column: 16, scope: !128)
!128 = distinct !DILexicalBlock(scope: !114, file: !10, line: 67, column: 9)
!129 = !DILocation(line: 67, column: 14, scope: !128)
!130 = !DILocation(line: 67, column: 21, scope: !131)
!131 = !DILexicalBlockFile(scope: !132, file: !10, discriminator: 1)
!132 = distinct !DILexicalBlock(scope: !128, file: !10, line: 67, column: 9)
!133 = !DILocation(line: 67, column: 25, scope: !131)
!134 = !DILocation(line: 67, column: 23, scope: !131)
!135 = !DILocation(line: 67, column: 9, scope: !131)
!136 = !DILocation(line: 69, column: 41, scope: !137)
!137 = distinct !DILexicalBlock(scope: !132, file: !10, line: 68, column: 9)
!138 = !DILocation(line: 69, column: 43, scope: !137)
!139 = !DILocation(line: 69, column: 42, scope: !137)
!140 = !DILocation(line: 69, column: 44, scope: !137)
!141 = !DILocation(line: 69, column: 33, scope: !137)
!142 = !DILocation(line: 69, column: 28, scope: !137)
!143 = !DILocation(line: 69, column: 13, scope: !137)
!144 = !DILocation(line: 69, column: 31, scope: !137)
!145 = !DILocation(line: 70, column: 9, scope: !137)
!146 = !DILocation(line: 67, column: 29, scope: !147)
!147 = !DILexicalBlockFile(scope: !132, file: !10, discriminator: 2)
!148 = !DILocation(line: 67, column: 9, scope: !147)
!149 = distinct !{!149, !150}
!150 = !DILocation(line: 67, column: 9, scope: !114)
!151 = !DILocation(line: 71, column: 24, scope: !114)
!152 = !DILocation(line: 71, column: 9, scope: !114)
!153 = !DILocation(line: 71, column: 27, scope: !114)
!154 = !DILocation(line: 73, column: 14, scope: !114)
!155 = !DILocation(line: 73, column: 9, scope: !114)
!156 = !DILocation(line: 74, column: 16, scope: !114)
!157 = !DILocation(line: 74, column: 9, scope: !114)
!158 = !DILocation(line: 78, column: 9, scope: !159)
!159 = distinct !DILexicalBlock(scope: !110, file: !10, line: 77, column: 5)
!160 = !DILocation(line: 80, column: 1, scope: !95)
!161 = distinct !DISubprogram(name: "good34", scope: !10, file: !10, line: 132, type: !76, isLocal: false, isDefinition: true, scopeLine: 133, isOptimized: false, unit: !0, variables: !2)
!162 = !DILocalVariable(name: "reversedString", scope: !163, file: !10, line: 143, type: !6)
!163 = distinct !DILexicalBlock(scope: !164, file: !10, line: 141, column: 9)
!164 = distinct !DILexicalBlock(scope: !165, file: !10, line: 140, column: 5)
!165 = distinct !DILexicalBlock(scope: !161, file: !10, line: 134, column: 8)
!166 = !DILocation(line: 143, column: 20, scope: !163)
!167 = !DILocation(line: 143, column: 37, scope: !163)
!168 = !DILocation(line: 144, column: 17, scope: !169)
!169 = distinct !DILexicalBlock(scope: !163, file: !10, line: 144, column: 17)
!170 = !DILocation(line: 144, column: 32, scope: !169)
!171 = !DILocation(line: 144, column: 17, scope: !163)
!172 = !DILocation(line: 144, column: 41, scope: !173)
!173 = !DILexicalBlockFile(scope: !169, file: !10, discriminator: 1)
!174 = !DILocation(line: 145, column: 23, scope: !163)
!175 = !DILocation(line: 145, column: 13, scope: !163)
!176 = !DILocation(line: 146, column: 18, scope: !163)
!177 = !DILocation(line: 146, column: 13, scope: !163)
!178 = !DILocation(line: 150, column: 1, scope: !161)
!179 = !DILocation(line: 150, column: 1, scope: !180)
!180 = !DILexicalBlockFile(scope: !161, file: !10, discriminator: 1)
!181 = distinct !DISubprogram(name: "helperGood", scope: !10, file: !10, line: 82, type: !96, isLocal: true, isDefinition: true, scopeLine: 83, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!182 = !DILocalVariable(name: "aString", arg: 1, scope: !181, file: !10, line: 82, type: !6)
!183 = !DILocation(line: 82, column: 33, scope: !181)
!184 = !DILocalVariable(name: "i", scope: !181, file: !10, line: 84, type: !101)
!185 = !DILocation(line: 84, column: 12, scope: !181)
!186 = !DILocalVariable(name: "j", scope: !181, file: !10, line: 85, type: !101)
!187 = !DILocation(line: 85, column: 12, scope: !181)
!188 = !DILocalVariable(name: "reversedString", scope: !181, file: !10, line: 86, type: !6)
!189 = !DILocation(line: 86, column: 12, scope: !181)
!190 = !DILocation(line: 87, column: 9, scope: !191)
!191 = distinct !DILexicalBlock(scope: !181, file: !10, line: 87, column: 9)
!192 = !DILocation(line: 87, column: 17, scope: !191)
!193 = !DILocation(line: 87, column: 9, scope: !181)
!194 = !DILocation(line: 89, column: 20, scope: !195)
!195 = distinct !DILexicalBlock(scope: !191, file: !10, line: 88, column: 5)
!196 = !DILocation(line: 89, column: 13, scope: !195)
!197 = !DILocation(line: 89, column: 11, scope: !195)
!198 = !DILocation(line: 90, column: 42, scope: !195)
!199 = !DILocation(line: 90, column: 43, scope: !195)
!200 = !DILocation(line: 90, column: 35, scope: !195)
!201 = !DILocation(line: 90, column: 24, scope: !195)
!202 = !DILocation(line: 91, column: 13, scope: !203)
!203 = distinct !DILexicalBlock(scope: !195, file: !10, line: 91, column: 13)
!204 = !DILocation(line: 91, column: 28, scope: !203)
!205 = !DILocation(line: 91, column: 13, scope: !195)
!206 = !DILocation(line: 91, column: 37, scope: !207)
!207 = !DILexicalBlockFile(scope: !203, file: !10, discriminator: 1)
!208 = !DILocation(line: 92, column: 16, scope: !209)
!209 = distinct !DILexicalBlock(scope: !195, file: !10, line: 92, column: 9)
!210 = !DILocation(line: 92, column: 14, scope: !209)
!211 = !DILocation(line: 92, column: 21, scope: !212)
!212 = !DILexicalBlockFile(scope: !213, file: !10, discriminator: 1)
!213 = distinct !DILexicalBlock(scope: !209, file: !10, line: 92, column: 9)
!214 = !DILocation(line: 92, column: 25, scope: !212)
!215 = !DILocation(line: 92, column: 23, scope: !212)
!216 = !DILocation(line: 92, column: 9, scope: !212)
!217 = !DILocation(line: 94, column: 41, scope: !218)
!218 = distinct !DILexicalBlock(scope: !213, file: !10, line: 93, column: 9)
!219 = !DILocation(line: 94, column: 43, scope: !218)
!220 = !DILocation(line: 94, column: 42, scope: !218)
!221 = !DILocation(line: 94, column: 44, scope: !218)
!222 = !DILocation(line: 94, column: 33, scope: !218)
!223 = !DILocation(line: 94, column: 28, scope: !218)
!224 = !DILocation(line: 94, column: 13, scope: !218)
!225 = !DILocation(line: 94, column: 31, scope: !218)
!226 = !DILocation(line: 95, column: 9, scope: !218)
!227 = !DILocation(line: 92, column: 29, scope: !228)
!228 = !DILexicalBlockFile(scope: !213, file: !10, discriminator: 2)
!229 = !DILocation(line: 92, column: 9, scope: !228)
!230 = distinct !{!230, !231}
!231 = !DILocation(line: 92, column: 9, scope: !195)
!232 = !DILocation(line: 96, column: 24, scope: !195)
!233 = !DILocation(line: 96, column: 9, scope: !195)
!234 = !DILocation(line: 96, column: 27, scope: !195)
!235 = !DILocation(line: 98, column: 16, scope: !195)
!236 = !DILocation(line: 98, column: 9, scope: !195)
!237 = !DILocation(line: 102, column: 9, scope: !238)
!238 = distinct !DILexicalBlock(scope: !191, file: !10, line: 101, column: 5)
!239 = !DILocation(line: 104, column: 1, scope: !181)
!240 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 155, type: !21, isLocal: false, isDefinition: true, scopeLine: 155, isOptimized: false, unit: !0, variables: !2)
!241 = !DILocation(line: 156, column: 5, scope: !240)
!242 = !DILocation(line: 157, column: 2, scope: !240)
!243 = !DILocation(line: 158, column: 5, scope: !240)
