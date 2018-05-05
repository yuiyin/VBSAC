; ModuleID = './416_31.c'
source_filename = "./416_31.c"
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
define void @bad31() #0 !dbg !75 {
entry:
  %reversedString = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %reversedString, metadata !78, metadata !34), !dbg !80
  %call = call i8* @helperBad(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.3, i32 0, i32 0)), !dbg !81
  store i8* %call, i8** %reversedString, align 8, !dbg !80
  %0 = load i8*, i8** %reversedString, align 8, !dbg !82
  %cmp = icmp eq i8* %0, null, !dbg !84
  br i1 %cmp, label %if.then, label %if.end, !dbg !85

if.then:                                          ; preds = %entry
  br label %return, !dbg !86

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %reversedString, align 8, !dbg !88
  call void @printLine(i8* %1), !dbg !89
  br label %return, !dbg !90

return:                                           ; preds = %if.end, %if.then
  ret void, !dbg !91
}

; Function Attrs: nounwind uwtable
define internal i8* @helperBad(i8* %aString) #0 !dbg !93 {
entry:
  %retval = alloca i8*, align 8
  %aString.addr = alloca i8*, align 8
  %i = alloca i64, align 8
  %j = alloca i64, align 8
  %reversedString = alloca i8*, align 8
  store i8* %aString, i8** %aString.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %aString.addr, metadata !96, metadata !34), !dbg !97
  call void @llvm.dbg.declare(metadata i64* %i, metadata !98, metadata !34), !dbg !102
  store i64 0, i64* %i, align 8, !dbg !102
  call void @llvm.dbg.declare(metadata i64* %j, metadata !103, metadata !34), !dbg !104
  call void @llvm.dbg.declare(metadata i8** %reversedString, metadata !105, metadata !34), !dbg !106
  store i8* null, i8** %reversedString, align 8, !dbg !106
  %0 = load i8*, i8** %aString.addr, align 8, !dbg !107
  %cmp = icmp ne i8* %0, null, !dbg !109
  br i1 %cmp, label %if.then, label %if.else, !dbg !110

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** %aString.addr, align 8, !dbg !111
  %call = call i64 @strlen(i8* %1) #6, !dbg !113
  store i64 %call, i64* %i, align 8, !dbg !114
  %2 = load i64, i64* %i, align 8, !dbg !115
  %add = add i64 %2, 1, !dbg !116
  %call1 = call noalias i8* @malloc(i64 %add) #5, !dbg !117
  store i8* %call1, i8** %reversedString, align 8, !dbg !118
  %3 = load i8*, i8** %reversedString, align 8, !dbg !119
  %cmp2 = icmp eq i8* %3, null, !dbg !121
  br i1 %cmp2, label %if.then3, label %if.end, !dbg !122

if.then3:                                         ; preds = %if.then
  store i8* null, i8** %retval, align 8, !dbg !123
  br label %return, !dbg !123

if.end:                                           ; preds = %if.then
  store i64 0, i64* %j, align 8, !dbg !125
  br label %for.cond, !dbg !127

for.cond:                                         ; preds = %for.inc, %if.end
  %4 = load i64, i64* %j, align 8, !dbg !128
  %5 = load i64, i64* %i, align 8, !dbg !131
  %cmp4 = icmp ult i64 %4, %5, !dbg !132
  br i1 %cmp4, label %for.body, label %for.end, !dbg !133

for.body:                                         ; preds = %for.cond
  %6 = load i64, i64* %i, align 8, !dbg !134
  %7 = load i64, i64* %j, align 8, !dbg !136
  %sub = sub i64 %6, %7, !dbg !137
  %sub5 = sub i64 %sub, 1, !dbg !138
  %8 = load i8*, i8** %aString.addr, align 8, !dbg !139
  %arrayidx = getelementptr inbounds i8, i8* %8, i64 %sub5, !dbg !139
  %9 = load i8, i8* %arrayidx, align 1, !dbg !139
  %10 = load i64, i64* %j, align 8, !dbg !140
  %11 = load i8*, i8** %reversedString, align 8, !dbg !141
  %arrayidx6 = getelementptr inbounds i8, i8* %11, i64 %10, !dbg !141
  store i8 %9, i8* %arrayidx6, align 1, !dbg !142
  br label %for.inc, !dbg !143

for.inc:                                          ; preds = %for.body
  %12 = load i64, i64* %j, align 8, !dbg !144
  %inc = add i64 %12, 1, !dbg !144
  store i64 %inc, i64* %j, align 8, !dbg !144
  br label %for.cond, !dbg !146, !llvm.loop !147

for.end:                                          ; preds = %for.cond
  %13 = load i64, i64* %i, align 8, !dbg !149
  %14 = load i8*, i8** %reversedString, align 8, !dbg !150
  %arrayidx7 = getelementptr inbounds i8, i8* %14, i64 %13, !dbg !150
  store i8 0, i8* %arrayidx7, align 1, !dbg !151
  %15 = load i8*, i8** %reversedString, align 8, !dbg !152
  call void @free(i8* %15) #5, !dbg !153
  %16 = load i8*, i8** %reversedString, align 8, !dbg !154
  store i8* %16, i8** %retval, align 8, !dbg !155
  br label %return, !dbg !155

if.else:                                          ; preds = %entry
  store i8* null, i8** %retval, align 8, !dbg !156
  br label %return, !dbg !156

return:                                           ; preds = %if.else, %for.end, %if.then3
  %17 = load i8*, i8** %retval, align 8, !dbg !158
  ret i8* %17, !dbg !158
}

; Function Attrs: nounwind uwtable
define void @good31() #0 !dbg !159 {
entry:
  %reversedString = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %reversedString, metadata !160, metadata !34), !dbg !162
  %call = call i8* @helperGood(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.4, i32 0, i32 0)), !dbg !163
  store i8* %call, i8** %reversedString, align 8, !dbg !162
  %0 = load i8*, i8** %reversedString, align 8, !dbg !164
  %cmp = icmp eq i8* %0, null, !dbg !166
  br i1 %cmp, label %if.then, label %if.end, !dbg !167

if.then:                                          ; preds = %entry
  br label %return, !dbg !168

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %reversedString, align 8, !dbg !170
  call void @printLine(i8* %1), !dbg !171
  %2 = load i8*, i8** %reversedString, align 8, !dbg !172
  call void @free(i8* %2) #5, !dbg !173
  br label %return, !dbg !174

return:                                           ; preds = %if.end, %if.then
  ret void, !dbg !175
}

; Function Attrs: nounwind uwtable
define internal i8* @helperGood(i8* %aString) #0 !dbg !177 {
entry:
  %retval = alloca i8*, align 8
  %aString.addr = alloca i8*, align 8
  %i = alloca i64, align 8
  %j = alloca i64, align 8
  %reversedString = alloca i8*, align 8
  store i8* %aString, i8** %aString.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %aString.addr, metadata !178, metadata !34), !dbg !179
  call void @llvm.dbg.declare(metadata i64* %i, metadata !180, metadata !34), !dbg !181
  store i64 0, i64* %i, align 8, !dbg !181
  call void @llvm.dbg.declare(metadata i64* %j, metadata !182, metadata !34), !dbg !183
  call void @llvm.dbg.declare(metadata i8** %reversedString, metadata !184, metadata !34), !dbg !185
  store i8* null, i8** %reversedString, align 8, !dbg !185
  %0 = load i8*, i8** %aString.addr, align 8, !dbg !186
  %cmp = icmp ne i8* %0, null, !dbg !188
  br i1 %cmp, label %if.then, label %if.else, !dbg !189

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** %aString.addr, align 8, !dbg !190
  %call = call i64 @strlen(i8* %1) #6, !dbg !192
  store i64 %call, i64* %i, align 8, !dbg !193
  %2 = load i64, i64* %i, align 8, !dbg !194
  %add = add i64 %2, 1, !dbg !195
  %call1 = call noalias i8* @malloc(i64 %add) #5, !dbg !196
  store i8* %call1, i8** %reversedString, align 8, !dbg !197
  %3 = load i8*, i8** %reversedString, align 8, !dbg !198
  %cmp2 = icmp eq i8* %3, null, !dbg !200
  br i1 %cmp2, label %if.then3, label %if.end, !dbg !201

if.then3:                                         ; preds = %if.then
  store i8* null, i8** %retval, align 8, !dbg !202
  br label %return, !dbg !202

if.end:                                           ; preds = %if.then
  store i64 0, i64* %j, align 8, !dbg !204
  br label %for.cond, !dbg !206

for.cond:                                         ; preds = %for.inc, %if.end
  %4 = load i64, i64* %j, align 8, !dbg !207
  %5 = load i64, i64* %i, align 8, !dbg !210
  %cmp4 = icmp ult i64 %4, %5, !dbg !211
  br i1 %cmp4, label %for.body, label %for.end, !dbg !212

for.body:                                         ; preds = %for.cond
  %6 = load i64, i64* %i, align 8, !dbg !213
  %7 = load i64, i64* %j, align 8, !dbg !215
  %sub = sub i64 %6, %7, !dbg !216
  %sub5 = sub i64 %sub, 1, !dbg !217
  %8 = load i8*, i8** %aString.addr, align 8, !dbg !218
  %arrayidx = getelementptr inbounds i8, i8* %8, i64 %sub5, !dbg !218
  %9 = load i8, i8* %arrayidx, align 1, !dbg !218
  %10 = load i64, i64* %j, align 8, !dbg !219
  %11 = load i8*, i8** %reversedString, align 8, !dbg !220
  %arrayidx6 = getelementptr inbounds i8, i8* %11, i64 %10, !dbg !220
  store i8 %9, i8* %arrayidx6, align 1, !dbg !221
  br label %for.inc, !dbg !222

for.inc:                                          ; preds = %for.body
  %12 = load i64, i64* %j, align 8, !dbg !223
  %inc = add i64 %12, 1, !dbg !223
  store i64 %inc, i64* %j, align 8, !dbg !223
  br label %for.cond, !dbg !225, !llvm.loop !226

for.end:                                          ; preds = %for.cond
  %13 = load i64, i64* %i, align 8, !dbg !228
  %14 = load i8*, i8** %reversedString, align 8, !dbg !229
  %arrayidx7 = getelementptr inbounds i8, i8* %14, i64 %13, !dbg !229
  store i8 0, i8* %arrayidx7, align 1, !dbg !230
  %15 = load i8*, i8** %reversedString, align 8, !dbg !231
  store i8* %15, i8** %retval, align 8, !dbg !232
  br label %return, !dbg !232

if.else:                                          ; preds = %entry
  store i8* null, i8** %retval, align 8, !dbg !233
  br label %return, !dbg !233

return:                                           ; preds = %if.else, %for.end, %if.then3
  %16 = load i8*, i8** %retval, align 8, !dbg !235
  ret i8* %16, !dbg !235
}

; Function Attrs: nounwind
declare void @free(i8*) #1

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !236 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @good31(), !dbg !237
  call void @bad31(), !dbg !238
  ret i32 1, !dbg !239
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
!1 = !DIFile(filename: "416_31.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/416")
!2 = !{}
!3 = !{!4, !5, !6}
!4 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64, align: 64)
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64, align: 64)
!7 = !DIBasicType(name: "char", size: 8, align: 8, encoding: DW_ATE_signed_char)
!8 = !{!9, !12, !13, !14, !15, !16}
!9 = distinct !DIGlobalVariable(name: "GLOBAL_CONST_TRUE", scope: !0, file: !10, line: 10, type: !11, isLocal: false, isDefinition: true, variable: i32* @GLOBAL_CONST_TRUE)
!10 = !DIFile(filename: "./416_31.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/416")
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
!75 = distinct !DISubprogram(name: "bad31", scope: !10, file: !10, line: 108, type: !76, isLocal: false, isDefinition: true, scopeLine: 109, isOptimized: false, unit: !0, variables: !2)
!76 = !DISubroutineType(types: !77)
!77 = !{null}
!78 = !DILocalVariable(name: "reversedString", scope: !79, file: !10, line: 112, type: !6)
!79 = distinct !DILexicalBlock(scope: !75, file: !10, line: 110, column: 5)
!80 = !DILocation(line: 112, column: 16, scope: !79)
!81 = !DILocation(line: 112, column: 33, scope: !79)
!82 = !DILocation(line: 113, column: 13, scope: !83)
!83 = distinct !DILexicalBlock(scope: !79, file: !10, line: 113, column: 13)
!84 = !DILocation(line: 113, column: 28, scope: !83)
!85 = !DILocation(line: 113, column: 13, scope: !79)
!86 = !DILocation(line: 113, column: 37, scope: !87)
!87 = !DILexicalBlockFile(scope: !83, file: !10, discriminator: 1)
!88 = !DILocation(line: 115, column: 19, scope: !79)
!89 = !DILocation(line: 115, column: 9, scope: !79)
!90 = !DILocation(line: 121, column: 1, scope: !75)
!91 = !DILocation(line: 121, column: 1, scope: !92)
!92 = !DILexicalBlockFile(scope: !75, file: !10, discriminator: 1)
!93 = distinct !DISubprogram(name: "helperBad", scope: !10, file: !10, line: 57, type: !94, isLocal: true, isDefinition: true, scopeLine: 58, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!94 = !DISubroutineType(types: !95)
!95 = !{!6, !6}
!96 = !DILocalVariable(name: "aString", arg: 1, scope: !93, file: !10, line: 57, type: !6)
!97 = !DILocation(line: 57, column: 32, scope: !93)
!98 = !DILocalVariable(name: "i", scope: !93, file: !10, line: 59, type: !99)
!99 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !100, line: 62, baseType: !101)
!100 = !DIFile(filename: "/usr/local/bin/../lib/clang/3.9.0/include/stddef.h", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/416")
!101 = !DIBasicType(name: "long unsigned int", size: 64, align: 64, encoding: DW_ATE_unsigned)
!102 = !DILocation(line: 59, column: 12, scope: !93)
!103 = !DILocalVariable(name: "j", scope: !93, file: !10, line: 60, type: !99)
!104 = !DILocation(line: 60, column: 12, scope: !93)
!105 = !DILocalVariable(name: "reversedString", scope: !93, file: !10, line: 61, type: !6)
!106 = !DILocation(line: 61, column: 12, scope: !93)
!107 = !DILocation(line: 62, column: 9, scope: !108)
!108 = distinct !DILexicalBlock(scope: !93, file: !10, line: 62, column: 9)
!109 = !DILocation(line: 62, column: 17, scope: !108)
!110 = !DILocation(line: 62, column: 9, scope: !93)
!111 = !DILocation(line: 64, column: 20, scope: !112)
!112 = distinct !DILexicalBlock(scope: !108, file: !10, line: 63, column: 5)
!113 = !DILocation(line: 64, column: 13, scope: !112)
!114 = !DILocation(line: 64, column: 11, scope: !112)
!115 = !DILocation(line: 65, column: 42, scope: !112)
!116 = !DILocation(line: 65, column: 43, scope: !112)
!117 = !DILocation(line: 65, column: 35, scope: !112)
!118 = !DILocation(line: 65, column: 24, scope: !112)
!119 = !DILocation(line: 66, column: 13, scope: !120)
!120 = distinct !DILexicalBlock(scope: !112, file: !10, line: 66, column: 13)
!121 = !DILocation(line: 66, column: 28, scope: !120)
!122 = !DILocation(line: 66, column: 13, scope: !112)
!123 = !DILocation(line: 66, column: 37, scope: !124)
!124 = !DILexicalBlockFile(scope: !120, file: !10, discriminator: 1)
!125 = !DILocation(line: 67, column: 16, scope: !126)
!126 = distinct !DILexicalBlock(scope: !112, file: !10, line: 67, column: 9)
!127 = !DILocation(line: 67, column: 14, scope: !126)
!128 = !DILocation(line: 67, column: 21, scope: !129)
!129 = !DILexicalBlockFile(scope: !130, file: !10, discriminator: 1)
!130 = distinct !DILexicalBlock(scope: !126, file: !10, line: 67, column: 9)
!131 = !DILocation(line: 67, column: 25, scope: !129)
!132 = !DILocation(line: 67, column: 23, scope: !129)
!133 = !DILocation(line: 67, column: 9, scope: !129)
!134 = !DILocation(line: 69, column: 41, scope: !135)
!135 = distinct !DILexicalBlock(scope: !130, file: !10, line: 68, column: 9)
!136 = !DILocation(line: 69, column: 43, scope: !135)
!137 = !DILocation(line: 69, column: 42, scope: !135)
!138 = !DILocation(line: 69, column: 44, scope: !135)
!139 = !DILocation(line: 69, column: 33, scope: !135)
!140 = !DILocation(line: 69, column: 28, scope: !135)
!141 = !DILocation(line: 69, column: 13, scope: !135)
!142 = !DILocation(line: 69, column: 31, scope: !135)
!143 = !DILocation(line: 70, column: 9, scope: !135)
!144 = !DILocation(line: 67, column: 29, scope: !145)
!145 = !DILexicalBlockFile(scope: !130, file: !10, discriminator: 2)
!146 = !DILocation(line: 67, column: 9, scope: !145)
!147 = distinct !{!147, !148}
!148 = !DILocation(line: 67, column: 9, scope: !112)
!149 = !DILocation(line: 71, column: 24, scope: !112)
!150 = !DILocation(line: 71, column: 9, scope: !112)
!151 = !DILocation(line: 71, column: 27, scope: !112)
!152 = !DILocation(line: 73, column: 14, scope: !112)
!153 = !DILocation(line: 73, column: 9, scope: !112)
!154 = !DILocation(line: 74, column: 16, scope: !112)
!155 = !DILocation(line: 74, column: 9, scope: !112)
!156 = !DILocation(line: 78, column: 9, scope: !157)
!157 = distinct !DILexicalBlock(scope: !108, file: !10, line: 77, column: 5)
!158 = !DILocation(line: 80, column: 1, scope: !93)
!159 = distinct !DISubprogram(name: "good31", scope: !10, file: !10, line: 127, type: !76, isLocal: false, isDefinition: true, scopeLine: 128, isOptimized: false, unit: !0, variables: !2)
!160 = !DILocalVariable(name: "reversedString", scope: !161, file: !10, line: 131, type: !6)
!161 = distinct !DILexicalBlock(scope: !159, file: !10, line: 129, column: 5)
!162 = !DILocation(line: 131, column: 16, scope: !161)
!163 = !DILocation(line: 131, column: 33, scope: !161)
!164 = !DILocation(line: 132, column: 13, scope: !165)
!165 = distinct !DILexicalBlock(scope: !161, file: !10, line: 132, column: 13)
!166 = !DILocation(line: 132, column: 28, scope: !165)
!167 = !DILocation(line: 132, column: 13, scope: !161)
!168 = !DILocation(line: 132, column: 37, scope: !169)
!169 = !DILexicalBlockFile(scope: !165, file: !10, discriminator: 1)
!170 = !DILocation(line: 133, column: 19, scope: !161)
!171 = !DILocation(line: 133, column: 9, scope: !161)
!172 = !DILocation(line: 134, column: 14, scope: !161)
!173 = !DILocation(line: 134, column: 9, scope: !161)
!174 = !DILocation(line: 136, column: 1, scope: !159)
!175 = !DILocation(line: 136, column: 1, scope: !176)
!176 = !DILexicalBlockFile(scope: !159, file: !10, discriminator: 1)
!177 = distinct !DISubprogram(name: "helperGood", scope: !10, file: !10, line: 82, type: !94, isLocal: true, isDefinition: true, scopeLine: 83, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!178 = !DILocalVariable(name: "aString", arg: 1, scope: !177, file: !10, line: 82, type: !6)
!179 = !DILocation(line: 82, column: 33, scope: !177)
!180 = !DILocalVariable(name: "i", scope: !177, file: !10, line: 84, type: !99)
!181 = !DILocation(line: 84, column: 12, scope: !177)
!182 = !DILocalVariable(name: "j", scope: !177, file: !10, line: 85, type: !99)
!183 = !DILocation(line: 85, column: 12, scope: !177)
!184 = !DILocalVariable(name: "reversedString", scope: !177, file: !10, line: 86, type: !6)
!185 = !DILocation(line: 86, column: 12, scope: !177)
!186 = !DILocation(line: 87, column: 9, scope: !187)
!187 = distinct !DILexicalBlock(scope: !177, file: !10, line: 87, column: 9)
!188 = !DILocation(line: 87, column: 17, scope: !187)
!189 = !DILocation(line: 87, column: 9, scope: !177)
!190 = !DILocation(line: 89, column: 20, scope: !191)
!191 = distinct !DILexicalBlock(scope: !187, file: !10, line: 88, column: 5)
!192 = !DILocation(line: 89, column: 13, scope: !191)
!193 = !DILocation(line: 89, column: 11, scope: !191)
!194 = !DILocation(line: 90, column: 42, scope: !191)
!195 = !DILocation(line: 90, column: 43, scope: !191)
!196 = !DILocation(line: 90, column: 35, scope: !191)
!197 = !DILocation(line: 90, column: 24, scope: !191)
!198 = !DILocation(line: 91, column: 13, scope: !199)
!199 = distinct !DILexicalBlock(scope: !191, file: !10, line: 91, column: 13)
!200 = !DILocation(line: 91, column: 28, scope: !199)
!201 = !DILocation(line: 91, column: 13, scope: !191)
!202 = !DILocation(line: 91, column: 37, scope: !203)
!203 = !DILexicalBlockFile(scope: !199, file: !10, discriminator: 1)
!204 = !DILocation(line: 92, column: 16, scope: !205)
!205 = distinct !DILexicalBlock(scope: !191, file: !10, line: 92, column: 9)
!206 = !DILocation(line: 92, column: 14, scope: !205)
!207 = !DILocation(line: 92, column: 21, scope: !208)
!208 = !DILexicalBlockFile(scope: !209, file: !10, discriminator: 1)
!209 = distinct !DILexicalBlock(scope: !205, file: !10, line: 92, column: 9)
!210 = !DILocation(line: 92, column: 25, scope: !208)
!211 = !DILocation(line: 92, column: 23, scope: !208)
!212 = !DILocation(line: 92, column: 9, scope: !208)
!213 = !DILocation(line: 94, column: 41, scope: !214)
!214 = distinct !DILexicalBlock(scope: !209, file: !10, line: 93, column: 9)
!215 = !DILocation(line: 94, column: 43, scope: !214)
!216 = !DILocation(line: 94, column: 42, scope: !214)
!217 = !DILocation(line: 94, column: 44, scope: !214)
!218 = !DILocation(line: 94, column: 33, scope: !214)
!219 = !DILocation(line: 94, column: 28, scope: !214)
!220 = !DILocation(line: 94, column: 13, scope: !214)
!221 = !DILocation(line: 94, column: 31, scope: !214)
!222 = !DILocation(line: 95, column: 9, scope: !214)
!223 = !DILocation(line: 92, column: 29, scope: !224)
!224 = !DILexicalBlockFile(scope: !209, file: !10, discriminator: 2)
!225 = !DILocation(line: 92, column: 9, scope: !224)
!226 = distinct !{!226, !227}
!227 = !DILocation(line: 92, column: 9, scope: !191)
!228 = !DILocation(line: 96, column: 24, scope: !191)
!229 = !DILocation(line: 96, column: 9, scope: !191)
!230 = !DILocation(line: 96, column: 27, scope: !191)
!231 = !DILocation(line: 98, column: 16, scope: !191)
!232 = !DILocation(line: 98, column: 9, scope: !191)
!233 = !DILocation(line: 102, column: 9, scope: !234)
!234 = distinct !DILexicalBlock(scope: !187, file: !10, line: 101, column: 5)
!235 = !DILocation(line: 104, column: 1, scope: !177)
!236 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 141, type: !21, isLocal: false, isDefinition: true, scopeLine: 141, isOptimized: false, unit: !0, variables: !2)
!237 = !DILocation(line: 142, column: 5, scope: !236)
!238 = !DILocation(line: 143, column: 2, scope: !236)
!239 = !DILocation(line: 144, column: 5, scope: !236)
