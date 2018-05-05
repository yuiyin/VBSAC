; ModuleID = './416_40.c'
source_filename = "./416_40.c"
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
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@.str.5 = private unnamed_addr constant [9 x i8] c"GoodSink\00", align 1

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
define void @bad40() #0 !dbg !75 {
entry:
  %reversedString = alloca i8*, align 8
  %0 = load i32, i32* @globalTrue, align 4, !dbg !78
  %tobool = icmp ne i32 %0, 0, !dbg !78
  br i1 %tobool, label %if.then, label %if.end2, !dbg !80

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i8** %reversedString, metadata !81, metadata !34), !dbg !84
  %call = call i8* @helperBad(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.3, i32 0, i32 0)), !dbg !85
  store i8* %call, i8** %reversedString, align 8, !dbg !84
  %1 = load i8*, i8** %reversedString, align 8, !dbg !86
  %cmp = icmp eq i8* %1, null, !dbg !88
  br i1 %cmp, label %if.then1, label %if.end, !dbg !89

if.then1:                                         ; preds = %if.then
  br label %if.end2, !dbg !90

if.end:                                           ; preds = %if.then
  %2 = load i8*, i8** %reversedString, align 8, !dbg !92
  call void @printLine(i8* %2), !dbg !93
  br label %if.end2, !dbg !94

if.end2:                                          ; preds = %if.then1, %if.end, %entry
  ret void, !dbg !95
}

; Function Attrs: nounwind uwtable
define internal i8* @helperBad(i8* %aString) #0 !dbg !96 {
entry:
  %retval = alloca i8*, align 8
  %aString.addr = alloca i8*, align 8
  %i = alloca i64, align 8
  %j = alloca i64, align 8
  %reversedString = alloca i8*, align 8
  store i8* %aString, i8** %aString.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %aString.addr, metadata !99, metadata !34), !dbg !100
  call void @llvm.dbg.declare(metadata i64* %i, metadata !101, metadata !34), !dbg !105
  store i64 0, i64* %i, align 8, !dbg !105
  call void @llvm.dbg.declare(metadata i64* %j, metadata !106, metadata !34), !dbg !107
  call void @llvm.dbg.declare(metadata i8** %reversedString, metadata !108, metadata !34), !dbg !109
  store i8* null, i8** %reversedString, align 8, !dbg !109
  %0 = load i8*, i8** %aString.addr, align 8, !dbg !110
  %cmp = icmp ne i8* %0, null, !dbg !112
  br i1 %cmp, label %if.then, label %if.else, !dbg !113

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** %aString.addr, align 8, !dbg !114
  %call = call i64 @strlen(i8* %1) #6, !dbg !116
  store i64 %call, i64* %i, align 8, !dbg !117
  %2 = load i64, i64* %i, align 8, !dbg !118
  %add = add i64 %2, 1, !dbg !119
  %call1 = call noalias i8* @malloc(i64 %add) #5, !dbg !120
  store i8* %call1, i8** %reversedString, align 8, !dbg !121
  %3 = load i8*, i8** %reversedString, align 8, !dbg !122
  %cmp2 = icmp eq i8* %3, null, !dbg !124
  br i1 %cmp2, label %if.then3, label %if.end, !dbg !125

if.then3:                                         ; preds = %if.then
  store i8* null, i8** %retval, align 8, !dbg !126
  br label %return, !dbg !126

if.end:                                           ; preds = %if.then
  store i64 0, i64* %j, align 8, !dbg !128
  br label %for.cond, !dbg !130

for.cond:                                         ; preds = %for.inc, %if.end
  %4 = load i64, i64* %j, align 8, !dbg !131
  %5 = load i64, i64* %i, align 8, !dbg !134
  %cmp4 = icmp ult i64 %4, %5, !dbg !135
  br i1 %cmp4, label %for.body, label %for.end, !dbg !136

for.body:                                         ; preds = %for.cond
  %6 = load i64, i64* %i, align 8, !dbg !137
  %7 = load i64, i64* %j, align 8, !dbg !139
  %sub = sub i64 %6, %7, !dbg !140
  %sub5 = sub i64 %sub, 1, !dbg !141
  %8 = load i8*, i8** %aString.addr, align 8, !dbg !142
  %arrayidx = getelementptr inbounds i8, i8* %8, i64 %sub5, !dbg !142
  %9 = load i8, i8* %arrayidx, align 1, !dbg !142
  %10 = load i64, i64* %j, align 8, !dbg !143
  %11 = load i8*, i8** %reversedString, align 8, !dbg !144
  %arrayidx6 = getelementptr inbounds i8, i8* %11, i64 %10, !dbg !144
  store i8 %9, i8* %arrayidx6, align 1, !dbg !145
  br label %for.inc, !dbg !146

for.inc:                                          ; preds = %for.body
  %12 = load i64, i64* %j, align 8, !dbg !147
  %inc = add i64 %12, 1, !dbg !147
  store i64 %inc, i64* %j, align 8, !dbg !147
  br label %for.cond, !dbg !149, !llvm.loop !150

for.end:                                          ; preds = %for.cond
  %13 = load i64, i64* %i, align 8, !dbg !152
  %14 = load i8*, i8** %reversedString, align 8, !dbg !153
  %arrayidx7 = getelementptr inbounds i8, i8* %14, i64 %13, !dbg !153
  store i8 0, i8* %arrayidx7, align 1, !dbg !154
  %15 = load i8*, i8** %reversedString, align 8, !dbg !155
  call void @free(i8* %15) #5, !dbg !156
  %16 = load i8*, i8** %reversedString, align 8, !dbg !157
  store i8* %16, i8** %retval, align 8, !dbg !158
  br label %return, !dbg !158

if.else:                                          ; preds = %entry
  store i8* null, i8** %retval, align 8, !dbg !159
  br label %return, !dbg !159

return:                                           ; preds = %if.else, %for.end, %if.then3
  %17 = load i8*, i8** %retval, align 8, !dbg !161
  ret i8* %17, !dbg !161
}

; Function Attrs: nounwind uwtable
define void @good40() #0 !dbg !162 {
entry:
  %reversedString = alloca i8*, align 8
  %0 = load i32, i32* @globalFalse, align 4, !dbg !163
  %tobool = icmp ne i32 %0, 0, !dbg !163
  br i1 %tobool, label %if.then, label %if.else, !dbg !165

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i32 0, i32 0)), !dbg !166
  br label %if.end2, !dbg !168

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i8** %reversedString, metadata !169, metadata !34), !dbg !172
  %call = call i8* @helperGood(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.5, i32 0, i32 0)), !dbg !173
  store i8* %call, i8** %reversedString, align 8, !dbg !172
  %1 = load i8*, i8** %reversedString, align 8, !dbg !174
  %cmp = icmp eq i8* %1, null, !dbg !176
  br i1 %cmp, label %if.then1, label %if.end, !dbg !177

if.then1:                                         ; preds = %if.else
  br label %if.end2, !dbg !178

if.end:                                           ; preds = %if.else
  %2 = load i8*, i8** %reversedString, align 8, !dbg !180
  call void @printLine(i8* %2), !dbg !181
  %3 = load i8*, i8** %reversedString, align 8, !dbg !182
  call void @free(i8* %3) #5, !dbg !183
  br label %if.end2

if.end2:                                          ; preds = %if.then1, %if.end, %if.then
  ret void, !dbg !184
}

; Function Attrs: nounwind uwtable
define internal i8* @helperGood(i8* %aString) #0 !dbg !185 {
entry:
  %retval = alloca i8*, align 8
  %aString.addr = alloca i8*, align 8
  %i = alloca i64, align 8
  %j = alloca i64, align 8
  %reversedString = alloca i8*, align 8
  store i8* %aString, i8** %aString.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %aString.addr, metadata !186, metadata !34), !dbg !187
  call void @llvm.dbg.declare(metadata i64* %i, metadata !188, metadata !34), !dbg !189
  store i64 0, i64* %i, align 8, !dbg !189
  call void @llvm.dbg.declare(metadata i64* %j, metadata !190, metadata !34), !dbg !191
  call void @llvm.dbg.declare(metadata i8** %reversedString, metadata !192, metadata !34), !dbg !193
  store i8* null, i8** %reversedString, align 8, !dbg !193
  %0 = load i8*, i8** %aString.addr, align 8, !dbg !194
  %cmp = icmp ne i8* %0, null, !dbg !196
  br i1 %cmp, label %if.then, label %if.else, !dbg !197

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** %aString.addr, align 8, !dbg !198
  %call = call i64 @strlen(i8* %1) #6, !dbg !200
  store i64 %call, i64* %i, align 8, !dbg !201
  %2 = load i64, i64* %i, align 8, !dbg !202
  %add = add i64 %2, 1, !dbg !203
  %call1 = call noalias i8* @malloc(i64 %add) #5, !dbg !204
  store i8* %call1, i8** %reversedString, align 8, !dbg !205
  %3 = load i8*, i8** %reversedString, align 8, !dbg !206
  %cmp2 = icmp eq i8* %3, null, !dbg !208
  br i1 %cmp2, label %if.then3, label %if.end, !dbg !209

if.then3:                                         ; preds = %if.then
  store i8* null, i8** %retval, align 8, !dbg !210
  br label %return, !dbg !210

if.end:                                           ; preds = %if.then
  store i64 0, i64* %j, align 8, !dbg !212
  br label %for.cond, !dbg !214

for.cond:                                         ; preds = %for.inc, %if.end
  %4 = load i64, i64* %j, align 8, !dbg !215
  %5 = load i64, i64* %i, align 8, !dbg !218
  %cmp4 = icmp ult i64 %4, %5, !dbg !219
  br i1 %cmp4, label %for.body, label %for.end, !dbg !220

for.body:                                         ; preds = %for.cond
  %6 = load i64, i64* %i, align 8, !dbg !221
  %7 = load i64, i64* %j, align 8, !dbg !223
  %sub = sub i64 %6, %7, !dbg !224
  %sub5 = sub i64 %sub, 1, !dbg !225
  %8 = load i8*, i8** %aString.addr, align 8, !dbg !226
  %arrayidx = getelementptr inbounds i8, i8* %8, i64 %sub5, !dbg !226
  %9 = load i8, i8* %arrayidx, align 1, !dbg !226
  %10 = load i64, i64* %j, align 8, !dbg !227
  %11 = load i8*, i8** %reversedString, align 8, !dbg !228
  %arrayidx6 = getelementptr inbounds i8, i8* %11, i64 %10, !dbg !228
  store i8 %9, i8* %arrayidx6, align 1, !dbg !229
  br label %for.inc, !dbg !230

for.inc:                                          ; preds = %for.body
  %12 = load i64, i64* %j, align 8, !dbg !231
  %inc = add i64 %12, 1, !dbg !231
  store i64 %inc, i64* %j, align 8, !dbg !231
  br label %for.cond, !dbg !233, !llvm.loop !234

for.end:                                          ; preds = %for.cond
  %13 = load i64, i64* %i, align 8, !dbg !236
  %14 = load i8*, i8** %reversedString, align 8, !dbg !237
  %arrayidx7 = getelementptr inbounds i8, i8* %14, i64 %13, !dbg !237
  store i8 0, i8* %arrayidx7, align 1, !dbg !238
  %15 = load i8*, i8** %reversedString, align 8, !dbg !239
  store i8* %15, i8** %retval, align 8, !dbg !240
  br label %return, !dbg !240

if.else:                                          ; preds = %entry
  store i8* null, i8** %retval, align 8, !dbg !241
  br label %return, !dbg !241

return:                                           ; preds = %if.else, %for.end, %if.then3
  %16 = load i8*, i8** %retval, align 8, !dbg !243
  ret i8* %16, !dbg !243
}

; Function Attrs: nounwind
declare void @free(i8*) #1

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !244 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @good40(), !dbg !245
  call void @bad40(), !dbg !246
  ret i32 1, !dbg !247
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
!1 = !DIFile(filename: "416_40.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/416")
!2 = !{}
!3 = !{!4, !5, !6}
!4 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64, align: 64)
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64, align: 64)
!7 = !DIBasicType(name: "char", size: 8, align: 8, encoding: DW_ATE_signed_char)
!8 = !{!9, !12, !13, !14, !15, !16}
!9 = distinct !DIGlobalVariable(name: "GLOBAL_CONST_TRUE", scope: !0, file: !10, line: 10, type: !11, isLocal: false, isDefinition: true, variable: i32* @GLOBAL_CONST_TRUE)
!10 = !DIFile(filename: "./416_40.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/416")
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
!75 = distinct !DISubprogram(name: "bad40", scope: !10, file: !10, line: 108, type: !76, isLocal: false, isDefinition: true, scopeLine: 109, isOptimized: false, unit: !0, variables: !2)
!76 = !DISubroutineType(types: !77)
!77 = !{null}
!78 = !DILocation(line: 110, column: 8, scope: !79)
!79 = distinct !DILexicalBlock(scope: !75, file: !10, line: 110, column: 8)
!80 = !DILocation(line: 110, column: 8, scope: !75)
!81 = !DILocalVariable(name: "reversedString", scope: !82, file: !10, line: 114, type: !6)
!82 = distinct !DILexicalBlock(scope: !83, file: !10, line: 112, column: 9)
!83 = distinct !DILexicalBlock(scope: !79, file: !10, line: 111, column: 5)
!84 = !DILocation(line: 114, column: 20, scope: !82)
!85 = !DILocation(line: 114, column: 37, scope: !82)
!86 = !DILocation(line: 115, column: 17, scope: !87)
!87 = distinct !DILexicalBlock(scope: !82, file: !10, line: 115, column: 17)
!88 = !DILocation(line: 115, column: 32, scope: !87)
!89 = !DILocation(line: 115, column: 17, scope: !82)
!90 = !DILocation(line: 115, column: 41, scope: !91)
!91 = !DILexicalBlockFile(scope: !87, file: !10, discriminator: 1)
!92 = !DILocation(line: 116, column: 23, scope: !82)
!93 = !DILocation(line: 116, column: 13, scope: !82)
!94 = !DILocation(line: 120, column: 5, scope: !83)
!95 = !DILocation(line: 121, column: 1, scope: !75)
!96 = distinct !DISubprogram(name: "helperBad", scope: !10, file: !10, line: 57, type: !97, isLocal: true, isDefinition: true, scopeLine: 58, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!97 = !DISubroutineType(types: !98)
!98 = !{!6, !6}
!99 = !DILocalVariable(name: "aString", arg: 1, scope: !96, file: !10, line: 57, type: !6)
!100 = !DILocation(line: 57, column: 32, scope: !96)
!101 = !DILocalVariable(name: "i", scope: !96, file: !10, line: 59, type: !102)
!102 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !103, line: 62, baseType: !104)
!103 = !DIFile(filename: "/usr/local/bin/../lib/clang/3.9.0/include/stddef.h", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/416")
!104 = !DIBasicType(name: "long unsigned int", size: 64, align: 64, encoding: DW_ATE_unsigned)
!105 = !DILocation(line: 59, column: 12, scope: !96)
!106 = !DILocalVariable(name: "j", scope: !96, file: !10, line: 60, type: !102)
!107 = !DILocation(line: 60, column: 12, scope: !96)
!108 = !DILocalVariable(name: "reversedString", scope: !96, file: !10, line: 61, type: !6)
!109 = !DILocation(line: 61, column: 12, scope: !96)
!110 = !DILocation(line: 62, column: 9, scope: !111)
!111 = distinct !DILexicalBlock(scope: !96, file: !10, line: 62, column: 9)
!112 = !DILocation(line: 62, column: 17, scope: !111)
!113 = !DILocation(line: 62, column: 9, scope: !96)
!114 = !DILocation(line: 64, column: 20, scope: !115)
!115 = distinct !DILexicalBlock(scope: !111, file: !10, line: 63, column: 5)
!116 = !DILocation(line: 64, column: 13, scope: !115)
!117 = !DILocation(line: 64, column: 11, scope: !115)
!118 = !DILocation(line: 65, column: 42, scope: !115)
!119 = !DILocation(line: 65, column: 43, scope: !115)
!120 = !DILocation(line: 65, column: 35, scope: !115)
!121 = !DILocation(line: 65, column: 24, scope: !115)
!122 = !DILocation(line: 66, column: 13, scope: !123)
!123 = distinct !DILexicalBlock(scope: !115, file: !10, line: 66, column: 13)
!124 = !DILocation(line: 66, column: 28, scope: !123)
!125 = !DILocation(line: 66, column: 13, scope: !115)
!126 = !DILocation(line: 66, column: 37, scope: !127)
!127 = !DILexicalBlockFile(scope: !123, file: !10, discriminator: 1)
!128 = !DILocation(line: 67, column: 16, scope: !129)
!129 = distinct !DILexicalBlock(scope: !115, file: !10, line: 67, column: 9)
!130 = !DILocation(line: 67, column: 14, scope: !129)
!131 = !DILocation(line: 67, column: 21, scope: !132)
!132 = !DILexicalBlockFile(scope: !133, file: !10, discriminator: 1)
!133 = distinct !DILexicalBlock(scope: !129, file: !10, line: 67, column: 9)
!134 = !DILocation(line: 67, column: 25, scope: !132)
!135 = !DILocation(line: 67, column: 23, scope: !132)
!136 = !DILocation(line: 67, column: 9, scope: !132)
!137 = !DILocation(line: 69, column: 41, scope: !138)
!138 = distinct !DILexicalBlock(scope: !133, file: !10, line: 68, column: 9)
!139 = !DILocation(line: 69, column: 43, scope: !138)
!140 = !DILocation(line: 69, column: 42, scope: !138)
!141 = !DILocation(line: 69, column: 44, scope: !138)
!142 = !DILocation(line: 69, column: 33, scope: !138)
!143 = !DILocation(line: 69, column: 28, scope: !138)
!144 = !DILocation(line: 69, column: 13, scope: !138)
!145 = !DILocation(line: 69, column: 31, scope: !138)
!146 = !DILocation(line: 70, column: 9, scope: !138)
!147 = !DILocation(line: 67, column: 29, scope: !148)
!148 = !DILexicalBlockFile(scope: !133, file: !10, discriminator: 2)
!149 = !DILocation(line: 67, column: 9, scope: !148)
!150 = distinct !{!150, !151}
!151 = !DILocation(line: 67, column: 9, scope: !115)
!152 = !DILocation(line: 71, column: 24, scope: !115)
!153 = !DILocation(line: 71, column: 9, scope: !115)
!154 = !DILocation(line: 71, column: 27, scope: !115)
!155 = !DILocation(line: 73, column: 14, scope: !115)
!156 = !DILocation(line: 73, column: 9, scope: !115)
!157 = !DILocation(line: 74, column: 16, scope: !115)
!158 = !DILocation(line: 74, column: 9, scope: !115)
!159 = !DILocation(line: 78, column: 9, scope: !160)
!160 = distinct !DILexicalBlock(scope: !111, file: !10, line: 77, column: 5)
!161 = !DILocation(line: 80, column: 1, scope: !96)
!162 = distinct !DISubprogram(name: "good40", scope: !10, file: !10, line: 127, type: !76, isLocal: false, isDefinition: true, scopeLine: 128, isOptimized: false, unit: !0, variables: !2)
!163 = !DILocation(line: 129, column: 8, scope: !164)
!164 = distinct !DILexicalBlock(scope: !162, file: !10, line: 129, column: 8)
!165 = !DILocation(line: 129, column: 8, scope: !162)
!166 = !DILocation(line: 132, column: 9, scope: !167)
!167 = distinct !DILexicalBlock(scope: !164, file: !10, line: 130, column: 5)
!168 = !DILocation(line: 133, column: 5, scope: !167)
!169 = !DILocalVariable(name: "reversedString", scope: !170, file: !10, line: 138, type: !6)
!170 = distinct !DILexicalBlock(scope: !171, file: !10, line: 136, column: 9)
!171 = distinct !DILexicalBlock(scope: !164, file: !10, line: 135, column: 5)
!172 = !DILocation(line: 138, column: 20, scope: !170)
!173 = !DILocation(line: 138, column: 37, scope: !170)
!174 = !DILocation(line: 139, column: 17, scope: !175)
!175 = distinct !DILexicalBlock(scope: !170, file: !10, line: 139, column: 17)
!176 = !DILocation(line: 139, column: 32, scope: !175)
!177 = !DILocation(line: 139, column: 17, scope: !170)
!178 = !DILocation(line: 139, column: 41, scope: !179)
!179 = !DILexicalBlockFile(scope: !175, file: !10, discriminator: 1)
!180 = !DILocation(line: 140, column: 23, scope: !170)
!181 = !DILocation(line: 140, column: 13, scope: !170)
!182 = !DILocation(line: 141, column: 18, scope: !170)
!183 = !DILocation(line: 141, column: 13, scope: !170)
!184 = !DILocation(line: 145, column: 1, scope: !162)
!185 = distinct !DISubprogram(name: "helperGood", scope: !10, file: !10, line: 82, type: !97, isLocal: true, isDefinition: true, scopeLine: 83, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!186 = !DILocalVariable(name: "aString", arg: 1, scope: !185, file: !10, line: 82, type: !6)
!187 = !DILocation(line: 82, column: 33, scope: !185)
!188 = !DILocalVariable(name: "i", scope: !185, file: !10, line: 84, type: !102)
!189 = !DILocation(line: 84, column: 12, scope: !185)
!190 = !DILocalVariable(name: "j", scope: !185, file: !10, line: 85, type: !102)
!191 = !DILocation(line: 85, column: 12, scope: !185)
!192 = !DILocalVariable(name: "reversedString", scope: !185, file: !10, line: 86, type: !6)
!193 = !DILocation(line: 86, column: 12, scope: !185)
!194 = !DILocation(line: 87, column: 9, scope: !195)
!195 = distinct !DILexicalBlock(scope: !185, file: !10, line: 87, column: 9)
!196 = !DILocation(line: 87, column: 17, scope: !195)
!197 = !DILocation(line: 87, column: 9, scope: !185)
!198 = !DILocation(line: 89, column: 20, scope: !199)
!199 = distinct !DILexicalBlock(scope: !195, file: !10, line: 88, column: 5)
!200 = !DILocation(line: 89, column: 13, scope: !199)
!201 = !DILocation(line: 89, column: 11, scope: !199)
!202 = !DILocation(line: 90, column: 42, scope: !199)
!203 = !DILocation(line: 90, column: 43, scope: !199)
!204 = !DILocation(line: 90, column: 35, scope: !199)
!205 = !DILocation(line: 90, column: 24, scope: !199)
!206 = !DILocation(line: 91, column: 13, scope: !207)
!207 = distinct !DILexicalBlock(scope: !199, file: !10, line: 91, column: 13)
!208 = !DILocation(line: 91, column: 28, scope: !207)
!209 = !DILocation(line: 91, column: 13, scope: !199)
!210 = !DILocation(line: 91, column: 37, scope: !211)
!211 = !DILexicalBlockFile(scope: !207, file: !10, discriminator: 1)
!212 = !DILocation(line: 92, column: 16, scope: !213)
!213 = distinct !DILexicalBlock(scope: !199, file: !10, line: 92, column: 9)
!214 = !DILocation(line: 92, column: 14, scope: !213)
!215 = !DILocation(line: 92, column: 21, scope: !216)
!216 = !DILexicalBlockFile(scope: !217, file: !10, discriminator: 1)
!217 = distinct !DILexicalBlock(scope: !213, file: !10, line: 92, column: 9)
!218 = !DILocation(line: 92, column: 25, scope: !216)
!219 = !DILocation(line: 92, column: 23, scope: !216)
!220 = !DILocation(line: 92, column: 9, scope: !216)
!221 = !DILocation(line: 94, column: 41, scope: !222)
!222 = distinct !DILexicalBlock(scope: !217, file: !10, line: 93, column: 9)
!223 = !DILocation(line: 94, column: 43, scope: !222)
!224 = !DILocation(line: 94, column: 42, scope: !222)
!225 = !DILocation(line: 94, column: 44, scope: !222)
!226 = !DILocation(line: 94, column: 33, scope: !222)
!227 = !DILocation(line: 94, column: 28, scope: !222)
!228 = !DILocation(line: 94, column: 13, scope: !222)
!229 = !DILocation(line: 94, column: 31, scope: !222)
!230 = !DILocation(line: 95, column: 9, scope: !222)
!231 = !DILocation(line: 92, column: 29, scope: !232)
!232 = !DILexicalBlockFile(scope: !217, file: !10, discriminator: 2)
!233 = !DILocation(line: 92, column: 9, scope: !232)
!234 = distinct !{!234, !235}
!235 = !DILocation(line: 92, column: 9, scope: !199)
!236 = !DILocation(line: 96, column: 24, scope: !199)
!237 = !DILocation(line: 96, column: 9, scope: !199)
!238 = !DILocation(line: 96, column: 27, scope: !199)
!239 = !DILocation(line: 98, column: 16, scope: !199)
!240 = !DILocation(line: 98, column: 9, scope: !199)
!241 = !DILocation(line: 102, column: 9, scope: !242)
!242 = distinct !DILexicalBlock(scope: !195, file: !10, line: 101, column: 5)
!243 = !DILocation(line: 104, column: 1, scope: !185)
!244 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 149, type: !21, isLocal: false, isDefinition: true, scopeLine: 149, isOptimized: false, unit: !0, variables: !2)
!245 = !DILocation(line: 150, column: 5, scope: !244)
!246 = !DILocation(line: 151, column: 2, scope: !244)
!247 = !DILocation(line: 152, column: 5, scope: !244)
