; ModuleID = './416_50.c'
source_filename = "./416_50.c"
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
define void @bad50() #0 !dbg !75 {
entry:
  %reversedString = alloca i8*, align 8
  br label %while.body, !dbg !78

while.body:                                       ; preds = %entry
  call void @llvm.dbg.declare(metadata i8** %reversedString, metadata !79, metadata !34), !dbg !82
  %call = call i8* @helperBad(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.3, i32 0, i32 0)), !dbg !83
  store i8* %call, i8** %reversedString, align 8, !dbg !82
  %0 = load i8*, i8** %reversedString, align 8, !dbg !84
  %cmp = icmp eq i8* %0, null, !dbg !86
  br i1 %cmp, label %if.then, label %if.end, !dbg !87

if.then:                                          ; preds = %while.body
  br label %while.end, !dbg !88

if.end:                                           ; preds = %while.body
  %1 = load i8*, i8** %reversedString, align 8, !dbg !90
  call void @printLine(i8* %1), !dbg !91
  br label %while.end, !dbg !92

while.end:                                        ; preds = %if.then, %if.end
  ret void, !dbg !93
}

; Function Attrs: nounwind uwtable
define internal i8* @helperBad(i8* %aString) #0 !dbg !94 {
entry:
  %retval = alloca i8*, align 8
  %aString.addr = alloca i8*, align 8
  %i = alloca i64, align 8
  %j = alloca i64, align 8
  %reversedString = alloca i8*, align 8
  store i8* %aString, i8** %aString.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %aString.addr, metadata !97, metadata !34), !dbg !98
  call void @llvm.dbg.declare(metadata i64* %i, metadata !99, metadata !34), !dbg !103
  store i64 0, i64* %i, align 8, !dbg !103
  call void @llvm.dbg.declare(metadata i64* %j, metadata !104, metadata !34), !dbg !105
  call void @llvm.dbg.declare(metadata i8** %reversedString, metadata !106, metadata !34), !dbg !107
  store i8* null, i8** %reversedString, align 8, !dbg !107
  %0 = load i8*, i8** %aString.addr, align 8, !dbg !108
  %cmp = icmp ne i8* %0, null, !dbg !110
  br i1 %cmp, label %if.then, label %if.else, !dbg !111

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** %aString.addr, align 8, !dbg !112
  %call = call i64 @strlen(i8* %1) #6, !dbg !114
  store i64 %call, i64* %i, align 8, !dbg !115
  %2 = load i64, i64* %i, align 8, !dbg !116
  %add = add i64 %2, 1, !dbg !117
  %call1 = call noalias i8* @malloc(i64 %add) #5, !dbg !118
  store i8* %call1, i8** %reversedString, align 8, !dbg !119
  %3 = load i8*, i8** %reversedString, align 8, !dbg !120
  %cmp2 = icmp eq i8* %3, null, !dbg !122
  br i1 %cmp2, label %if.then3, label %if.end, !dbg !123

if.then3:                                         ; preds = %if.then
  store i8* null, i8** %retval, align 8, !dbg !124
  br label %return, !dbg !124

if.end:                                           ; preds = %if.then
  store i64 0, i64* %j, align 8, !dbg !126
  br label %for.cond, !dbg !128

for.cond:                                         ; preds = %for.inc, %if.end
  %4 = load i64, i64* %j, align 8, !dbg !129
  %5 = load i64, i64* %i, align 8, !dbg !132
  %cmp4 = icmp ult i64 %4, %5, !dbg !133
  br i1 %cmp4, label %for.body, label %for.end, !dbg !134

for.body:                                         ; preds = %for.cond
  %6 = load i64, i64* %i, align 8, !dbg !135
  %7 = load i64, i64* %j, align 8, !dbg !137
  %sub = sub i64 %6, %7, !dbg !138
  %sub5 = sub i64 %sub, 1, !dbg !139
  %8 = load i8*, i8** %aString.addr, align 8, !dbg !140
  %arrayidx = getelementptr inbounds i8, i8* %8, i64 %sub5, !dbg !140
  %9 = load i8, i8* %arrayidx, align 1, !dbg !140
  %10 = load i64, i64* %j, align 8, !dbg !141
  %11 = load i8*, i8** %reversedString, align 8, !dbg !142
  %arrayidx6 = getelementptr inbounds i8, i8* %11, i64 %10, !dbg !142
  store i8 %9, i8* %arrayidx6, align 1, !dbg !143
  br label %for.inc, !dbg !144

for.inc:                                          ; preds = %for.body
  %12 = load i64, i64* %j, align 8, !dbg !145
  %inc = add i64 %12, 1, !dbg !145
  store i64 %inc, i64* %j, align 8, !dbg !145
  br label %for.cond, !dbg !147, !llvm.loop !148

for.end:                                          ; preds = %for.cond
  %13 = load i64, i64* %i, align 8, !dbg !150
  %14 = load i8*, i8** %reversedString, align 8, !dbg !151
  %arrayidx7 = getelementptr inbounds i8, i8* %14, i64 %13, !dbg !151
  store i8 0, i8* %arrayidx7, align 1, !dbg !152
  %15 = load i8*, i8** %reversedString, align 8, !dbg !153
  call void @free(i8* %15) #5, !dbg !154
  %16 = load i8*, i8** %reversedString, align 8, !dbg !155
  store i8* %16, i8** %retval, align 8, !dbg !156
  br label %return, !dbg !156

if.else:                                          ; preds = %entry
  store i8* null, i8** %retval, align 8, !dbg !157
  br label %return, !dbg !157

return:                                           ; preds = %if.else, %for.end, %if.then3
  %17 = load i8*, i8** %retval, align 8, !dbg !159
  ret i8* %17, !dbg !159
}

; Function Attrs: nounwind uwtable
define void @good50() #0 !dbg !160 {
entry:
  %reversedString = alloca i8*, align 8
  br label %while.body, !dbg !161

while.body:                                       ; preds = %entry
  call void @llvm.dbg.declare(metadata i8** %reversedString, metadata !162, metadata !34), !dbg !165
  %call = call i8* @helperGood(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.4, i32 0, i32 0)), !dbg !166
  store i8* %call, i8** %reversedString, align 8, !dbg !165
  %0 = load i8*, i8** %reversedString, align 8, !dbg !167
  %cmp = icmp eq i8* %0, null, !dbg !169
  br i1 %cmp, label %if.then, label %if.end, !dbg !170

if.then:                                          ; preds = %while.body
  br label %while.end, !dbg !171

if.end:                                           ; preds = %while.body
  %1 = load i8*, i8** %reversedString, align 8, !dbg !173
  call void @printLine(i8* %1), !dbg !174
  %2 = load i8*, i8** %reversedString, align 8, !dbg !175
  call void @free(i8* %2) #5, !dbg !176
  br label %while.end, !dbg !177

while.end:                                        ; preds = %if.then, %if.end
  ret void, !dbg !178
}

; Function Attrs: nounwind uwtable
define internal i8* @helperGood(i8* %aString) #0 !dbg !179 {
entry:
  %retval = alloca i8*, align 8
  %aString.addr = alloca i8*, align 8
  %i = alloca i64, align 8
  %j = alloca i64, align 8
  %reversedString = alloca i8*, align 8
  store i8* %aString, i8** %aString.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %aString.addr, metadata !180, metadata !34), !dbg !181
  call void @llvm.dbg.declare(metadata i64* %i, metadata !182, metadata !34), !dbg !183
  store i64 0, i64* %i, align 8, !dbg !183
  call void @llvm.dbg.declare(metadata i64* %j, metadata !184, metadata !34), !dbg !185
  call void @llvm.dbg.declare(metadata i8** %reversedString, metadata !186, metadata !34), !dbg !187
  store i8* null, i8** %reversedString, align 8, !dbg !187
  %0 = load i8*, i8** %aString.addr, align 8, !dbg !188
  %cmp = icmp ne i8* %0, null, !dbg !190
  br i1 %cmp, label %if.then, label %if.else, !dbg !191

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** %aString.addr, align 8, !dbg !192
  %call = call i64 @strlen(i8* %1) #6, !dbg !194
  store i64 %call, i64* %i, align 8, !dbg !195
  %2 = load i64, i64* %i, align 8, !dbg !196
  %add = add i64 %2, 1, !dbg !197
  %call1 = call noalias i8* @malloc(i64 %add) #5, !dbg !198
  store i8* %call1, i8** %reversedString, align 8, !dbg !199
  %3 = load i8*, i8** %reversedString, align 8, !dbg !200
  %cmp2 = icmp eq i8* %3, null, !dbg !202
  br i1 %cmp2, label %if.then3, label %if.end, !dbg !203

if.then3:                                         ; preds = %if.then
  store i8* null, i8** %retval, align 8, !dbg !204
  br label %return, !dbg !204

if.end:                                           ; preds = %if.then
  store i64 0, i64* %j, align 8, !dbg !206
  br label %for.cond, !dbg !208

for.cond:                                         ; preds = %for.inc, %if.end
  %4 = load i64, i64* %j, align 8, !dbg !209
  %5 = load i64, i64* %i, align 8, !dbg !212
  %cmp4 = icmp ult i64 %4, %5, !dbg !213
  br i1 %cmp4, label %for.body, label %for.end, !dbg !214

for.body:                                         ; preds = %for.cond
  %6 = load i64, i64* %i, align 8, !dbg !215
  %7 = load i64, i64* %j, align 8, !dbg !217
  %sub = sub i64 %6, %7, !dbg !218
  %sub5 = sub i64 %sub, 1, !dbg !219
  %8 = load i8*, i8** %aString.addr, align 8, !dbg !220
  %arrayidx = getelementptr inbounds i8, i8* %8, i64 %sub5, !dbg !220
  %9 = load i8, i8* %arrayidx, align 1, !dbg !220
  %10 = load i64, i64* %j, align 8, !dbg !221
  %11 = load i8*, i8** %reversedString, align 8, !dbg !222
  %arrayidx6 = getelementptr inbounds i8, i8* %11, i64 %10, !dbg !222
  store i8 %9, i8* %arrayidx6, align 1, !dbg !223
  br label %for.inc, !dbg !224

for.inc:                                          ; preds = %for.body
  %12 = load i64, i64* %j, align 8, !dbg !225
  %inc = add i64 %12, 1, !dbg !225
  store i64 %inc, i64* %j, align 8, !dbg !225
  br label %for.cond, !dbg !227, !llvm.loop !228

for.end:                                          ; preds = %for.cond
  %13 = load i64, i64* %i, align 8, !dbg !230
  %14 = load i8*, i8** %reversedString, align 8, !dbg !231
  %arrayidx7 = getelementptr inbounds i8, i8* %14, i64 %13, !dbg !231
  store i8 0, i8* %arrayidx7, align 1, !dbg !232
  %15 = load i8*, i8** %reversedString, align 8, !dbg !233
  store i8* %15, i8** %retval, align 8, !dbg !234
  br label %return, !dbg !234

if.else:                                          ; preds = %entry
  store i8* null, i8** %retval, align 8, !dbg !235
  br label %return, !dbg !235

return:                                           ; preds = %if.else, %for.end, %if.then3
  %16 = load i8*, i8** %retval, align 8, !dbg !237
  ret i8* %16, !dbg !237
}

; Function Attrs: nounwind
declare void @free(i8*) #1

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !238 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @good50(), !dbg !239
  call void @bad50(), !dbg !240
  ret i32 1, !dbg !241
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
!1 = !DIFile(filename: "416_50.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/416")
!2 = !{}
!3 = !{!4, !5, !6}
!4 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64, align: 64)
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64, align: 64)
!7 = !DIBasicType(name: "char", size: 8, align: 8, encoding: DW_ATE_signed_char)
!8 = !{!9, !12, !13, !14, !15, !16}
!9 = distinct !DIGlobalVariable(name: "GLOBAL_CONST_TRUE", scope: !0, file: !10, line: 10, type: !11, isLocal: false, isDefinition: true, variable: i32* @GLOBAL_CONST_TRUE)
!10 = !DIFile(filename: "./416_50.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/416")
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
!75 = distinct !DISubprogram(name: "bad50", scope: !10, file: !10, line: 108, type: !76, isLocal: false, isDefinition: true, scopeLine: 109, isOptimized: false, unit: !0, variables: !2)
!76 = !DISubroutineType(types: !77)
!77 = !{null}
!78 = !DILocation(line: 110, column: 5, scope: !75)
!79 = !DILocalVariable(name: "reversedString", scope: !80, file: !10, line: 114, type: !6)
!80 = distinct !DILexicalBlock(scope: !81, file: !10, line: 112, column: 9)
!81 = distinct !DILexicalBlock(scope: !75, file: !10, line: 111, column: 5)
!82 = !DILocation(line: 114, column: 20, scope: !80)
!83 = !DILocation(line: 114, column: 37, scope: !80)
!84 = !DILocation(line: 115, column: 17, scope: !85)
!85 = distinct !DILexicalBlock(scope: !80, file: !10, line: 115, column: 17)
!86 = !DILocation(line: 115, column: 32, scope: !85)
!87 = !DILocation(line: 115, column: 17, scope: !80)
!88 = !DILocation(line: 115, column: 41, scope: !89)
!89 = !DILexicalBlockFile(scope: !85, file: !10, discriminator: 1)
!90 = !DILocation(line: 116, column: 23, scope: !80)
!91 = !DILocation(line: 116, column: 13, scope: !80)
!92 = !DILocation(line: 119, column: 9, scope: !81)
!93 = !DILocation(line: 121, column: 1, scope: !75)
!94 = distinct !DISubprogram(name: "helperBad", scope: !10, file: !10, line: 57, type: !95, isLocal: true, isDefinition: true, scopeLine: 58, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!95 = !DISubroutineType(types: !96)
!96 = !{!6, !6}
!97 = !DILocalVariable(name: "aString", arg: 1, scope: !94, file: !10, line: 57, type: !6)
!98 = !DILocation(line: 57, column: 32, scope: !94)
!99 = !DILocalVariable(name: "i", scope: !94, file: !10, line: 59, type: !100)
!100 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !101, line: 62, baseType: !102)
!101 = !DIFile(filename: "/usr/local/bin/../lib/clang/3.9.0/include/stddef.h", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/416")
!102 = !DIBasicType(name: "long unsigned int", size: 64, align: 64, encoding: DW_ATE_unsigned)
!103 = !DILocation(line: 59, column: 12, scope: !94)
!104 = !DILocalVariable(name: "j", scope: !94, file: !10, line: 60, type: !100)
!105 = !DILocation(line: 60, column: 12, scope: !94)
!106 = !DILocalVariable(name: "reversedString", scope: !94, file: !10, line: 61, type: !6)
!107 = !DILocation(line: 61, column: 12, scope: !94)
!108 = !DILocation(line: 62, column: 9, scope: !109)
!109 = distinct !DILexicalBlock(scope: !94, file: !10, line: 62, column: 9)
!110 = !DILocation(line: 62, column: 17, scope: !109)
!111 = !DILocation(line: 62, column: 9, scope: !94)
!112 = !DILocation(line: 64, column: 20, scope: !113)
!113 = distinct !DILexicalBlock(scope: !109, file: !10, line: 63, column: 5)
!114 = !DILocation(line: 64, column: 13, scope: !113)
!115 = !DILocation(line: 64, column: 11, scope: !113)
!116 = !DILocation(line: 65, column: 42, scope: !113)
!117 = !DILocation(line: 65, column: 43, scope: !113)
!118 = !DILocation(line: 65, column: 35, scope: !113)
!119 = !DILocation(line: 65, column: 24, scope: !113)
!120 = !DILocation(line: 66, column: 13, scope: !121)
!121 = distinct !DILexicalBlock(scope: !113, file: !10, line: 66, column: 13)
!122 = !DILocation(line: 66, column: 28, scope: !121)
!123 = !DILocation(line: 66, column: 13, scope: !113)
!124 = !DILocation(line: 66, column: 37, scope: !125)
!125 = !DILexicalBlockFile(scope: !121, file: !10, discriminator: 1)
!126 = !DILocation(line: 67, column: 16, scope: !127)
!127 = distinct !DILexicalBlock(scope: !113, file: !10, line: 67, column: 9)
!128 = !DILocation(line: 67, column: 14, scope: !127)
!129 = !DILocation(line: 67, column: 21, scope: !130)
!130 = !DILexicalBlockFile(scope: !131, file: !10, discriminator: 1)
!131 = distinct !DILexicalBlock(scope: !127, file: !10, line: 67, column: 9)
!132 = !DILocation(line: 67, column: 25, scope: !130)
!133 = !DILocation(line: 67, column: 23, scope: !130)
!134 = !DILocation(line: 67, column: 9, scope: !130)
!135 = !DILocation(line: 69, column: 41, scope: !136)
!136 = distinct !DILexicalBlock(scope: !131, file: !10, line: 68, column: 9)
!137 = !DILocation(line: 69, column: 43, scope: !136)
!138 = !DILocation(line: 69, column: 42, scope: !136)
!139 = !DILocation(line: 69, column: 44, scope: !136)
!140 = !DILocation(line: 69, column: 33, scope: !136)
!141 = !DILocation(line: 69, column: 28, scope: !136)
!142 = !DILocation(line: 69, column: 13, scope: !136)
!143 = !DILocation(line: 69, column: 31, scope: !136)
!144 = !DILocation(line: 70, column: 9, scope: !136)
!145 = !DILocation(line: 67, column: 29, scope: !146)
!146 = !DILexicalBlockFile(scope: !131, file: !10, discriminator: 2)
!147 = !DILocation(line: 67, column: 9, scope: !146)
!148 = distinct !{!148, !149}
!149 = !DILocation(line: 67, column: 9, scope: !113)
!150 = !DILocation(line: 71, column: 24, scope: !113)
!151 = !DILocation(line: 71, column: 9, scope: !113)
!152 = !DILocation(line: 71, column: 27, scope: !113)
!153 = !DILocation(line: 73, column: 14, scope: !113)
!154 = !DILocation(line: 73, column: 9, scope: !113)
!155 = !DILocation(line: 74, column: 16, scope: !113)
!156 = !DILocation(line: 74, column: 9, scope: !113)
!157 = !DILocation(line: 78, column: 9, scope: !158)
!158 = distinct !DILexicalBlock(scope: !109, file: !10, line: 77, column: 5)
!159 = !DILocation(line: 80, column: 1, scope: !94)
!160 = distinct !DISubprogram(name: "good50", scope: !10, file: !10, line: 127, type: !76, isLocal: false, isDefinition: true, scopeLine: 128, isOptimized: false, unit: !0, variables: !2)
!161 = !DILocation(line: 129, column: 5, scope: !160)
!162 = !DILocalVariable(name: "reversedString", scope: !163, file: !10, line: 133, type: !6)
!163 = distinct !DILexicalBlock(scope: !164, file: !10, line: 131, column: 9)
!164 = distinct !DILexicalBlock(scope: !160, file: !10, line: 130, column: 5)
!165 = !DILocation(line: 133, column: 20, scope: !163)
!166 = !DILocation(line: 133, column: 37, scope: !163)
!167 = !DILocation(line: 134, column: 17, scope: !168)
!168 = distinct !DILexicalBlock(scope: !163, file: !10, line: 134, column: 17)
!169 = !DILocation(line: 134, column: 32, scope: !168)
!170 = !DILocation(line: 134, column: 17, scope: !163)
!171 = !DILocation(line: 134, column: 41, scope: !172)
!172 = !DILexicalBlockFile(scope: !168, file: !10, discriminator: 1)
!173 = !DILocation(line: 135, column: 23, scope: !163)
!174 = !DILocation(line: 135, column: 13, scope: !163)
!175 = !DILocation(line: 136, column: 18, scope: !163)
!176 = !DILocation(line: 136, column: 13, scope: !163)
!177 = !DILocation(line: 139, column: 9, scope: !164)
!178 = !DILocation(line: 141, column: 1, scope: !160)
!179 = distinct !DISubprogram(name: "helperGood", scope: !10, file: !10, line: 82, type: !95, isLocal: true, isDefinition: true, scopeLine: 83, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!180 = !DILocalVariable(name: "aString", arg: 1, scope: !179, file: !10, line: 82, type: !6)
!181 = !DILocation(line: 82, column: 33, scope: !179)
!182 = !DILocalVariable(name: "i", scope: !179, file: !10, line: 84, type: !100)
!183 = !DILocation(line: 84, column: 12, scope: !179)
!184 = !DILocalVariable(name: "j", scope: !179, file: !10, line: 85, type: !100)
!185 = !DILocation(line: 85, column: 12, scope: !179)
!186 = !DILocalVariable(name: "reversedString", scope: !179, file: !10, line: 86, type: !6)
!187 = !DILocation(line: 86, column: 12, scope: !179)
!188 = !DILocation(line: 87, column: 9, scope: !189)
!189 = distinct !DILexicalBlock(scope: !179, file: !10, line: 87, column: 9)
!190 = !DILocation(line: 87, column: 17, scope: !189)
!191 = !DILocation(line: 87, column: 9, scope: !179)
!192 = !DILocation(line: 89, column: 20, scope: !193)
!193 = distinct !DILexicalBlock(scope: !189, file: !10, line: 88, column: 5)
!194 = !DILocation(line: 89, column: 13, scope: !193)
!195 = !DILocation(line: 89, column: 11, scope: !193)
!196 = !DILocation(line: 90, column: 42, scope: !193)
!197 = !DILocation(line: 90, column: 43, scope: !193)
!198 = !DILocation(line: 90, column: 35, scope: !193)
!199 = !DILocation(line: 90, column: 24, scope: !193)
!200 = !DILocation(line: 91, column: 13, scope: !201)
!201 = distinct !DILexicalBlock(scope: !193, file: !10, line: 91, column: 13)
!202 = !DILocation(line: 91, column: 28, scope: !201)
!203 = !DILocation(line: 91, column: 13, scope: !193)
!204 = !DILocation(line: 91, column: 37, scope: !205)
!205 = !DILexicalBlockFile(scope: !201, file: !10, discriminator: 1)
!206 = !DILocation(line: 92, column: 16, scope: !207)
!207 = distinct !DILexicalBlock(scope: !193, file: !10, line: 92, column: 9)
!208 = !DILocation(line: 92, column: 14, scope: !207)
!209 = !DILocation(line: 92, column: 21, scope: !210)
!210 = !DILexicalBlockFile(scope: !211, file: !10, discriminator: 1)
!211 = distinct !DILexicalBlock(scope: !207, file: !10, line: 92, column: 9)
!212 = !DILocation(line: 92, column: 25, scope: !210)
!213 = !DILocation(line: 92, column: 23, scope: !210)
!214 = !DILocation(line: 92, column: 9, scope: !210)
!215 = !DILocation(line: 94, column: 41, scope: !216)
!216 = distinct !DILexicalBlock(scope: !211, file: !10, line: 93, column: 9)
!217 = !DILocation(line: 94, column: 43, scope: !216)
!218 = !DILocation(line: 94, column: 42, scope: !216)
!219 = !DILocation(line: 94, column: 44, scope: !216)
!220 = !DILocation(line: 94, column: 33, scope: !216)
!221 = !DILocation(line: 94, column: 28, scope: !216)
!222 = !DILocation(line: 94, column: 13, scope: !216)
!223 = !DILocation(line: 94, column: 31, scope: !216)
!224 = !DILocation(line: 95, column: 9, scope: !216)
!225 = !DILocation(line: 92, column: 29, scope: !226)
!226 = !DILexicalBlockFile(scope: !211, file: !10, discriminator: 2)
!227 = !DILocation(line: 92, column: 9, scope: !226)
!228 = distinct !{!228, !229}
!229 = !DILocation(line: 92, column: 9, scope: !193)
!230 = !DILocation(line: 96, column: 24, scope: !193)
!231 = !DILocation(line: 96, column: 9, scope: !193)
!232 = !DILocation(line: 96, column: 27, scope: !193)
!233 = !DILocation(line: 98, column: 16, scope: !193)
!234 = !DILocation(line: 98, column: 9, scope: !193)
!235 = !DILocation(line: 102, column: 9, scope: !236)
!236 = distinct !DILexicalBlock(scope: !189, file: !10, line: 101, column: 5)
!237 = !DILocation(line: 104, column: 1, scope: !179)
!238 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 145, type: !21, isLocal: false, isDefinition: true, scopeLine: 145, isOptimized: false, unit: !0, variables: !2)
!239 = !DILocation(line: 146, column: 5, scope: !238)
!240 = !DILocation(line: 147, column: 2, scope: !238)
!241 = !DILocation(line: 148, column: 5, scope: !238)
