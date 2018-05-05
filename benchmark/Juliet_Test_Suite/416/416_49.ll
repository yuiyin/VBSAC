; ModuleID = './416_49.c'
source_filename = "./416_49.c"
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
define void @bad49() #0 !dbg !75 {
entry:
  %reversedString = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %reversedString, metadata !78, metadata !34), !dbg !79
  %call = call i8* @helperBad(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.3, i32 0, i32 0)), !dbg !80
  store i8* %call, i8** %reversedString, align 8, !dbg !79
  %0 = load i8*, i8** %reversedString, align 8, !dbg !81
  %cmp = icmp eq i8* %0, null, !dbg !83
  br i1 %cmp, label %if.then, label %if.end, !dbg !84

if.then:                                          ; preds = %entry
  br label %return, !dbg !85

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %reversedString, align 8, !dbg !87
  call void @printLine(i8* %1), !dbg !88
  br label %return, !dbg !89

return:                                           ; preds = %if.end, %if.then
  ret void, !dbg !90
}

; Function Attrs: nounwind uwtable
define internal i8* @helperBad(i8* %aString) #0 !dbg !92 {
entry:
  %retval = alloca i8*, align 8
  %aString.addr = alloca i8*, align 8
  %i = alloca i64, align 8
  %j = alloca i64, align 8
  %reversedString = alloca i8*, align 8
  store i8* %aString, i8** %aString.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %aString.addr, metadata !95, metadata !34), !dbg !96
  call void @llvm.dbg.declare(metadata i64* %i, metadata !97, metadata !34), !dbg !101
  store i64 0, i64* %i, align 8, !dbg !101
  call void @llvm.dbg.declare(metadata i64* %j, metadata !102, metadata !34), !dbg !103
  call void @llvm.dbg.declare(metadata i8** %reversedString, metadata !104, metadata !34), !dbg !105
  store i8* null, i8** %reversedString, align 8, !dbg !105
  %0 = load i8*, i8** %aString.addr, align 8, !dbg !106
  %cmp = icmp ne i8* %0, null, !dbg !108
  br i1 %cmp, label %if.then, label %if.else, !dbg !109

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** %aString.addr, align 8, !dbg !110
  %call = call i64 @strlen(i8* %1) #6, !dbg !112
  store i64 %call, i64* %i, align 8, !dbg !113
  %2 = load i64, i64* %i, align 8, !dbg !114
  %add = add i64 %2, 1, !dbg !115
  %call1 = call noalias i8* @malloc(i64 %add) #5, !dbg !116
  store i8* %call1, i8** %reversedString, align 8, !dbg !117
  %3 = load i8*, i8** %reversedString, align 8, !dbg !118
  %cmp2 = icmp eq i8* %3, null, !dbg !120
  br i1 %cmp2, label %if.then3, label %if.end, !dbg !121

if.then3:                                         ; preds = %if.then
  store i8* null, i8** %retval, align 8, !dbg !122
  br label %return, !dbg !122

if.end:                                           ; preds = %if.then
  store i64 0, i64* %j, align 8, !dbg !124
  br label %for.cond, !dbg !126

for.cond:                                         ; preds = %for.inc, %if.end
  %4 = load i64, i64* %j, align 8, !dbg !127
  %5 = load i64, i64* %i, align 8, !dbg !130
  %cmp4 = icmp ult i64 %4, %5, !dbg !131
  br i1 %cmp4, label %for.body, label %for.end, !dbg !132

for.body:                                         ; preds = %for.cond
  %6 = load i64, i64* %i, align 8, !dbg !133
  %7 = load i64, i64* %j, align 8, !dbg !135
  %sub = sub i64 %6, %7, !dbg !136
  %sub5 = sub i64 %sub, 1, !dbg !137
  %8 = load i8*, i8** %aString.addr, align 8, !dbg !138
  %arrayidx = getelementptr inbounds i8, i8* %8, i64 %sub5, !dbg !138
  %9 = load i8, i8* %arrayidx, align 1, !dbg !138
  %10 = load i64, i64* %j, align 8, !dbg !139
  %11 = load i8*, i8** %reversedString, align 8, !dbg !140
  %arrayidx6 = getelementptr inbounds i8, i8* %11, i64 %10, !dbg !140
  store i8 %9, i8* %arrayidx6, align 1, !dbg !141
  br label %for.inc, !dbg !142

for.inc:                                          ; preds = %for.body
  %12 = load i64, i64* %j, align 8, !dbg !143
  %inc = add i64 %12, 1, !dbg !143
  store i64 %inc, i64* %j, align 8, !dbg !143
  br label %for.cond, !dbg !145, !llvm.loop !146

for.end:                                          ; preds = %for.cond
  %13 = load i64, i64* %i, align 8, !dbg !148
  %14 = load i8*, i8** %reversedString, align 8, !dbg !149
  %arrayidx7 = getelementptr inbounds i8, i8* %14, i64 %13, !dbg !149
  store i8 0, i8* %arrayidx7, align 1, !dbg !150
  %15 = load i8*, i8** %reversedString, align 8, !dbg !151
  call void @free(i8* %15) #5, !dbg !152
  %16 = load i8*, i8** %reversedString, align 8, !dbg !153
  store i8* %16, i8** %retval, align 8, !dbg !154
  br label %return, !dbg !154

if.else:                                          ; preds = %entry
  store i8* null, i8** %retval, align 8, !dbg !155
  br label %return, !dbg !155

return:                                           ; preds = %if.else, %for.end, %if.then3
  %17 = load i8*, i8** %retval, align 8, !dbg !157
  ret i8* %17, !dbg !157
}

; Function Attrs: nounwind uwtable
define void @good49() #0 !dbg !158 {
entry:
  %reversedString = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %reversedString, metadata !159, metadata !34), !dbg !160
  %call = call i8* @helperGood(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.4, i32 0, i32 0)), !dbg !161
  store i8* %call, i8** %reversedString, align 8, !dbg !160
  %0 = load i8*, i8** %reversedString, align 8, !dbg !162
  %cmp = icmp eq i8* %0, null, !dbg !164
  br i1 %cmp, label %if.then, label %if.end, !dbg !165

if.then:                                          ; preds = %entry
  br label %return, !dbg !166

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %reversedString, align 8, !dbg !168
  call void @printLine(i8* %1), !dbg !169
  %2 = load i8*, i8** %reversedString, align 8, !dbg !170
  call void @free(i8* %2) #5, !dbg !171
  br label %return, !dbg !172

return:                                           ; preds = %if.end, %if.then
  ret void, !dbg !173
}

; Function Attrs: nounwind uwtable
define internal i8* @helperGood(i8* %aString) #0 !dbg !175 {
entry:
  %retval = alloca i8*, align 8
  %aString.addr = alloca i8*, align 8
  %i = alloca i64, align 8
  %j = alloca i64, align 8
  %reversedString = alloca i8*, align 8
  store i8* %aString, i8** %aString.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %aString.addr, metadata !176, metadata !34), !dbg !177
  call void @llvm.dbg.declare(metadata i64* %i, metadata !178, metadata !34), !dbg !179
  store i64 0, i64* %i, align 8, !dbg !179
  call void @llvm.dbg.declare(metadata i64* %j, metadata !180, metadata !34), !dbg !181
  call void @llvm.dbg.declare(metadata i8** %reversedString, metadata !182, metadata !34), !dbg !183
  store i8* null, i8** %reversedString, align 8, !dbg !183
  %0 = load i8*, i8** %aString.addr, align 8, !dbg !184
  %cmp = icmp ne i8* %0, null, !dbg !186
  br i1 %cmp, label %if.then, label %if.else, !dbg !187

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** %aString.addr, align 8, !dbg !188
  %call = call i64 @strlen(i8* %1) #6, !dbg !190
  store i64 %call, i64* %i, align 8, !dbg !191
  %2 = load i64, i64* %i, align 8, !dbg !192
  %add = add i64 %2, 1, !dbg !193
  %call1 = call noalias i8* @malloc(i64 %add) #5, !dbg !194
  store i8* %call1, i8** %reversedString, align 8, !dbg !195
  %3 = load i8*, i8** %reversedString, align 8, !dbg !196
  %cmp2 = icmp eq i8* %3, null, !dbg !198
  br i1 %cmp2, label %if.then3, label %if.end, !dbg !199

if.then3:                                         ; preds = %if.then
  store i8* null, i8** %retval, align 8, !dbg !200
  br label %return, !dbg !200

if.end:                                           ; preds = %if.then
  store i64 0, i64* %j, align 8, !dbg !202
  br label %for.cond, !dbg !204

for.cond:                                         ; preds = %for.inc, %if.end
  %4 = load i64, i64* %j, align 8, !dbg !205
  %5 = load i64, i64* %i, align 8, !dbg !208
  %cmp4 = icmp ult i64 %4, %5, !dbg !209
  br i1 %cmp4, label %for.body, label %for.end, !dbg !210

for.body:                                         ; preds = %for.cond
  %6 = load i64, i64* %i, align 8, !dbg !211
  %7 = load i64, i64* %j, align 8, !dbg !213
  %sub = sub i64 %6, %7, !dbg !214
  %sub5 = sub i64 %sub, 1, !dbg !215
  %8 = load i8*, i8** %aString.addr, align 8, !dbg !216
  %arrayidx = getelementptr inbounds i8, i8* %8, i64 %sub5, !dbg !216
  %9 = load i8, i8* %arrayidx, align 1, !dbg !216
  %10 = load i64, i64* %j, align 8, !dbg !217
  %11 = load i8*, i8** %reversedString, align 8, !dbg !218
  %arrayidx6 = getelementptr inbounds i8, i8* %11, i64 %10, !dbg !218
  store i8 %9, i8* %arrayidx6, align 1, !dbg !219
  br label %for.inc, !dbg !220

for.inc:                                          ; preds = %for.body
  %12 = load i64, i64* %j, align 8, !dbg !221
  %inc = add i64 %12, 1, !dbg !221
  store i64 %inc, i64* %j, align 8, !dbg !221
  br label %for.cond, !dbg !223, !llvm.loop !224

for.end:                                          ; preds = %for.cond
  %13 = load i64, i64* %i, align 8, !dbg !226
  %14 = load i8*, i8** %reversedString, align 8, !dbg !227
  %arrayidx7 = getelementptr inbounds i8, i8* %14, i64 %13, !dbg !227
  store i8 0, i8* %arrayidx7, align 1, !dbg !228
  %15 = load i8*, i8** %reversedString, align 8, !dbg !229
  store i8* %15, i8** %retval, align 8, !dbg !230
  br label %return, !dbg !230

if.else:                                          ; preds = %entry
  store i8* null, i8** %retval, align 8, !dbg !231
  br label %return, !dbg !231

return:                                           ; preds = %if.else, %for.end, %if.then3
  %16 = load i8*, i8** %retval, align 8, !dbg !233
  ret i8* %16, !dbg !233
}

; Function Attrs: nounwind
declare void @free(i8*) #1

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !234 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @good49(), !dbg !235
  call void @bad49(), !dbg !236
  ret i32 1, !dbg !237
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
!1 = !DIFile(filename: "416_49.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/416")
!2 = !{}
!3 = !{!4, !5, !6}
!4 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64, align: 64)
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64, align: 64)
!7 = !DIBasicType(name: "char", size: 8, align: 8, encoding: DW_ATE_signed_char)
!8 = !{!9, !12, !13, !14, !15, !16}
!9 = distinct !DIGlobalVariable(name: "GLOBAL_CONST_TRUE", scope: !0, file: !10, line: 10, type: !11, isLocal: false, isDefinition: true, variable: i32* @GLOBAL_CONST_TRUE)
!10 = !DIFile(filename: "./416_49.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/416")
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
!75 = distinct !DISubprogram(name: "bad49", scope: !10, file: !10, line: 108, type: !76, isLocal: false, isDefinition: true, scopeLine: 109, isOptimized: false, unit: !0, variables: !2)
!76 = !DISubroutineType(types: !77)
!77 = !{null}
!78 = !DILocalVariable(name: "reversedString", scope: !75, file: !10, line: 115, type: !6)
!79 = !DILocation(line: 115, column: 16, scope: !75)
!80 = !DILocation(line: 115, column: 33, scope: !75)
!81 = !DILocation(line: 116, column: 13, scope: !82)
!82 = distinct !DILexicalBlock(scope: !75, file: !10, line: 116, column: 13)
!83 = !DILocation(line: 116, column: 28, scope: !82)
!84 = !DILocation(line: 116, column: 13, scope: !75)
!85 = !DILocation(line: 116, column: 37, scope: !86)
!86 = !DILexicalBlockFile(scope: !82, file: !10, discriminator: 1)
!87 = !DILocation(line: 117, column: 19, scope: !75)
!88 = !DILocation(line: 117, column: 9, scope: !75)
!89 = !DILocation(line: 129, column: 1, scope: !75)
!90 = !DILocation(line: 129, column: 1, scope: !91)
!91 = !DILexicalBlockFile(scope: !75, file: !10, discriminator: 1)
!92 = distinct !DISubprogram(name: "helperBad", scope: !10, file: !10, line: 57, type: !93, isLocal: true, isDefinition: true, scopeLine: 58, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!93 = !DISubroutineType(types: !94)
!94 = !{!6, !6}
!95 = !DILocalVariable(name: "aString", arg: 1, scope: !92, file: !10, line: 57, type: !6)
!96 = !DILocation(line: 57, column: 32, scope: !92)
!97 = !DILocalVariable(name: "i", scope: !92, file: !10, line: 59, type: !98)
!98 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !99, line: 62, baseType: !100)
!99 = !DIFile(filename: "/usr/local/bin/../lib/clang/3.9.0/include/stddef.h", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/416")
!100 = !DIBasicType(name: "long unsigned int", size: 64, align: 64, encoding: DW_ATE_unsigned)
!101 = !DILocation(line: 59, column: 12, scope: !92)
!102 = !DILocalVariable(name: "j", scope: !92, file: !10, line: 60, type: !98)
!103 = !DILocation(line: 60, column: 12, scope: !92)
!104 = !DILocalVariable(name: "reversedString", scope: !92, file: !10, line: 61, type: !6)
!105 = !DILocation(line: 61, column: 12, scope: !92)
!106 = !DILocation(line: 62, column: 9, scope: !107)
!107 = distinct !DILexicalBlock(scope: !92, file: !10, line: 62, column: 9)
!108 = !DILocation(line: 62, column: 17, scope: !107)
!109 = !DILocation(line: 62, column: 9, scope: !92)
!110 = !DILocation(line: 64, column: 20, scope: !111)
!111 = distinct !DILexicalBlock(scope: !107, file: !10, line: 63, column: 5)
!112 = !DILocation(line: 64, column: 13, scope: !111)
!113 = !DILocation(line: 64, column: 11, scope: !111)
!114 = !DILocation(line: 65, column: 42, scope: !111)
!115 = !DILocation(line: 65, column: 43, scope: !111)
!116 = !DILocation(line: 65, column: 35, scope: !111)
!117 = !DILocation(line: 65, column: 24, scope: !111)
!118 = !DILocation(line: 66, column: 13, scope: !119)
!119 = distinct !DILexicalBlock(scope: !111, file: !10, line: 66, column: 13)
!120 = !DILocation(line: 66, column: 28, scope: !119)
!121 = !DILocation(line: 66, column: 13, scope: !111)
!122 = !DILocation(line: 66, column: 37, scope: !123)
!123 = !DILexicalBlockFile(scope: !119, file: !10, discriminator: 1)
!124 = !DILocation(line: 67, column: 16, scope: !125)
!125 = distinct !DILexicalBlock(scope: !111, file: !10, line: 67, column: 9)
!126 = !DILocation(line: 67, column: 14, scope: !125)
!127 = !DILocation(line: 67, column: 21, scope: !128)
!128 = !DILexicalBlockFile(scope: !129, file: !10, discriminator: 1)
!129 = distinct !DILexicalBlock(scope: !125, file: !10, line: 67, column: 9)
!130 = !DILocation(line: 67, column: 25, scope: !128)
!131 = !DILocation(line: 67, column: 23, scope: !128)
!132 = !DILocation(line: 67, column: 9, scope: !128)
!133 = !DILocation(line: 69, column: 41, scope: !134)
!134 = distinct !DILexicalBlock(scope: !129, file: !10, line: 68, column: 9)
!135 = !DILocation(line: 69, column: 43, scope: !134)
!136 = !DILocation(line: 69, column: 42, scope: !134)
!137 = !DILocation(line: 69, column: 44, scope: !134)
!138 = !DILocation(line: 69, column: 33, scope: !134)
!139 = !DILocation(line: 69, column: 28, scope: !134)
!140 = !DILocation(line: 69, column: 13, scope: !134)
!141 = !DILocation(line: 69, column: 31, scope: !134)
!142 = !DILocation(line: 70, column: 9, scope: !134)
!143 = !DILocation(line: 67, column: 29, scope: !144)
!144 = !DILexicalBlockFile(scope: !129, file: !10, discriminator: 2)
!145 = !DILocation(line: 67, column: 9, scope: !144)
!146 = distinct !{!146, !147}
!147 = !DILocation(line: 67, column: 9, scope: !111)
!148 = !DILocation(line: 71, column: 24, scope: !111)
!149 = !DILocation(line: 71, column: 9, scope: !111)
!150 = !DILocation(line: 71, column: 27, scope: !111)
!151 = !DILocation(line: 73, column: 14, scope: !111)
!152 = !DILocation(line: 73, column: 9, scope: !111)
!153 = !DILocation(line: 74, column: 16, scope: !111)
!154 = !DILocation(line: 74, column: 9, scope: !111)
!155 = !DILocation(line: 78, column: 9, scope: !156)
!156 = distinct !DILexicalBlock(scope: !107, file: !10, line: 77, column: 5)
!157 = !DILocation(line: 80, column: 1, scope: !92)
!158 = distinct !DISubprogram(name: "good49", scope: !10, file: !10, line: 134, type: !76, isLocal: false, isDefinition: true, scopeLine: 135, isOptimized: false, unit: !0, variables: !2)
!159 = !DILocalVariable(name: "reversedString", scope: !158, file: !10, line: 145, type: !6)
!160 = !DILocation(line: 145, column: 16, scope: !158)
!161 = !DILocation(line: 145, column: 33, scope: !158)
!162 = !DILocation(line: 146, column: 13, scope: !163)
!163 = distinct !DILexicalBlock(scope: !158, file: !10, line: 146, column: 13)
!164 = !DILocation(line: 146, column: 28, scope: !163)
!165 = !DILocation(line: 146, column: 13, scope: !158)
!166 = !DILocation(line: 146, column: 37, scope: !167)
!167 = !DILexicalBlockFile(scope: !163, file: !10, discriminator: 1)
!168 = !DILocation(line: 147, column: 19, scope: !158)
!169 = !DILocation(line: 147, column: 9, scope: !158)
!170 = !DILocation(line: 148, column: 14, scope: !158)
!171 = !DILocation(line: 148, column: 9, scope: !158)
!172 = !DILocation(line: 152, column: 1, scope: !158)
!173 = !DILocation(line: 152, column: 1, scope: !174)
!174 = !DILexicalBlockFile(scope: !158, file: !10, discriminator: 1)
!175 = distinct !DISubprogram(name: "helperGood", scope: !10, file: !10, line: 82, type: !93, isLocal: true, isDefinition: true, scopeLine: 83, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!176 = !DILocalVariable(name: "aString", arg: 1, scope: !175, file: !10, line: 82, type: !6)
!177 = !DILocation(line: 82, column: 33, scope: !175)
!178 = !DILocalVariable(name: "i", scope: !175, file: !10, line: 84, type: !98)
!179 = !DILocation(line: 84, column: 12, scope: !175)
!180 = !DILocalVariable(name: "j", scope: !175, file: !10, line: 85, type: !98)
!181 = !DILocation(line: 85, column: 12, scope: !175)
!182 = !DILocalVariable(name: "reversedString", scope: !175, file: !10, line: 86, type: !6)
!183 = !DILocation(line: 86, column: 12, scope: !175)
!184 = !DILocation(line: 87, column: 9, scope: !185)
!185 = distinct !DILexicalBlock(scope: !175, file: !10, line: 87, column: 9)
!186 = !DILocation(line: 87, column: 17, scope: !185)
!187 = !DILocation(line: 87, column: 9, scope: !175)
!188 = !DILocation(line: 89, column: 20, scope: !189)
!189 = distinct !DILexicalBlock(scope: !185, file: !10, line: 88, column: 5)
!190 = !DILocation(line: 89, column: 13, scope: !189)
!191 = !DILocation(line: 89, column: 11, scope: !189)
!192 = !DILocation(line: 90, column: 42, scope: !189)
!193 = !DILocation(line: 90, column: 43, scope: !189)
!194 = !DILocation(line: 90, column: 35, scope: !189)
!195 = !DILocation(line: 90, column: 24, scope: !189)
!196 = !DILocation(line: 91, column: 13, scope: !197)
!197 = distinct !DILexicalBlock(scope: !189, file: !10, line: 91, column: 13)
!198 = !DILocation(line: 91, column: 28, scope: !197)
!199 = !DILocation(line: 91, column: 13, scope: !189)
!200 = !DILocation(line: 91, column: 37, scope: !201)
!201 = !DILexicalBlockFile(scope: !197, file: !10, discriminator: 1)
!202 = !DILocation(line: 92, column: 16, scope: !203)
!203 = distinct !DILexicalBlock(scope: !189, file: !10, line: 92, column: 9)
!204 = !DILocation(line: 92, column: 14, scope: !203)
!205 = !DILocation(line: 92, column: 21, scope: !206)
!206 = !DILexicalBlockFile(scope: !207, file: !10, discriminator: 1)
!207 = distinct !DILexicalBlock(scope: !203, file: !10, line: 92, column: 9)
!208 = !DILocation(line: 92, column: 25, scope: !206)
!209 = !DILocation(line: 92, column: 23, scope: !206)
!210 = !DILocation(line: 92, column: 9, scope: !206)
!211 = !DILocation(line: 94, column: 41, scope: !212)
!212 = distinct !DILexicalBlock(scope: !207, file: !10, line: 93, column: 9)
!213 = !DILocation(line: 94, column: 43, scope: !212)
!214 = !DILocation(line: 94, column: 42, scope: !212)
!215 = !DILocation(line: 94, column: 44, scope: !212)
!216 = !DILocation(line: 94, column: 33, scope: !212)
!217 = !DILocation(line: 94, column: 28, scope: !212)
!218 = !DILocation(line: 94, column: 13, scope: !212)
!219 = !DILocation(line: 94, column: 31, scope: !212)
!220 = !DILocation(line: 95, column: 9, scope: !212)
!221 = !DILocation(line: 92, column: 29, scope: !222)
!222 = !DILexicalBlockFile(scope: !207, file: !10, discriminator: 2)
!223 = !DILocation(line: 92, column: 9, scope: !222)
!224 = distinct !{!224, !225}
!225 = !DILocation(line: 92, column: 9, scope: !189)
!226 = !DILocation(line: 96, column: 24, scope: !189)
!227 = !DILocation(line: 96, column: 9, scope: !189)
!228 = !DILocation(line: 96, column: 27, scope: !189)
!229 = !DILocation(line: 98, column: 16, scope: !189)
!230 = !DILocation(line: 98, column: 9, scope: !189)
!231 = !DILocation(line: 102, column: 9, scope: !232)
!232 = distinct !DILexicalBlock(scope: !185, file: !10, line: 101, column: 5)
!233 = !DILocation(line: 104, column: 1, scope: !175)
!234 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 155, type: !21, isLocal: false, isDefinition: true, scopeLine: 155, isOptimized: false, unit: !0, variables: !2)
!235 = !DILocation(line: 156, column: 5, scope: !234)
!236 = !DILocation(line: 157, column: 2, scope: !234)
!237 = !DILocation(line: 158, column: 5, scope: !234)
