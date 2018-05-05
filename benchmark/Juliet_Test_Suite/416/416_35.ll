; ModuleID = './416_35.c'
source_filename = "./416_35.c"
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
@.str.3 = private unnamed_addr constant [8 x i8] c"BadSink\00", align 1
@staticFalse = internal global i32 0, align 4
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@.str.5 = private unnamed_addr constant [9 x i8] c"GoodSink\00", align 1

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
  %call = call i32 @rand() #5, !dbg !29
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
  call void @llvm.dbg.declare(metadata i8* %charHex.addr, metadata !35, metadata !36), !dbg !37
  %0 = load i8, i8* %charHex.addr, align 1, !dbg !38
  %conv = sext i8 %0 to i32, !dbg !39
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), i32 %conv), !dbg !40
  ret void, !dbg !41
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #2

declare i32 @printf(i8*, ...) #3

; Function Attrs: nounwind uwtable
define void @printLine(i8* %line) #0 !dbg !42 {
entry:
  %line.addr = alloca i8*, align 8
  store i8* %line, i8** %line.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %line.addr, metadata !47, metadata !36), !dbg !48
  %0 = load i8*, i8** %line.addr, align 8, !dbg !49
  %cmp = icmp ne i8* %0, null, !dbg !51
  br i1 %cmp, label %if.then, label %if.end, !dbg !52

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** %line.addr, align 8, !dbg !53
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i32 0, i32 0), i8* %1), !dbg !55
  br label %if.end, !dbg !56

if.end:                                           ; preds = %if.then, %entry
  ret void, !dbg !57
}

; Function Attrs: nounwind uwtable
define void @printIntLine(i32 %intNumber) #0 !dbg !58 {
entry:
  %intNumber.addr = alloca i32, align 4
  store i32 %intNumber, i32* %intNumber.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %intNumber.addr, metadata !61, metadata !36), !dbg !62
  %0 = load i32, i32* %intNumber.addr, align 4, !dbg !63
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), i32 %0), !dbg !64
  ret void, !dbg !65
}

; Function Attrs: nounwind uwtable
define void @printLongLine(i64 %longIntNumber) #0 !dbg !66 {
entry:
  %longIntNumber.addr = alloca i64, align 8
  store i64 %longIntNumber, i64* %longIntNumber.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %longIntNumber.addr, metadata !72, metadata !36), !dbg !73
  %0 = load i64, i64* %longIntNumber.addr, align 8, !dbg !74
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.2, i32 0, i32 0), i64 %0), !dbg !75
  ret void, !dbg !76
}

; Function Attrs: nounwind uwtable
define void @bad35() #0 !dbg !77 {
entry:
  %reversedString = alloca i8*, align 8
  %0 = load i32, i32* @staticTrue, align 4, !dbg !80
  %tobool = icmp ne i32 %0, 0, !dbg !80
  br i1 %tobool, label %if.then, label %if.end2, !dbg !82

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i8** %reversedString, metadata !83, metadata !36), !dbg !86
  %call = call i8* @helperBad(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.3, i32 0, i32 0)), !dbg !87
  store i8* %call, i8** %reversedString, align 8, !dbg !86
  %1 = load i8*, i8** %reversedString, align 8, !dbg !88
  %cmp = icmp eq i8* %1, null, !dbg !90
  br i1 %cmp, label %if.then1, label %if.end, !dbg !91

if.then1:                                         ; preds = %if.then
  br label %if.end2, !dbg !92

if.end:                                           ; preds = %if.then
  %2 = load i8*, i8** %reversedString, align 8, !dbg !94
  call void @printLine(i8* %2), !dbg !95
  br label %if.end2, !dbg !96

if.end2:                                          ; preds = %if.then1, %if.end, %entry
  ret void, !dbg !97
}

; Function Attrs: nounwind uwtable
define internal i8* @helperBad(i8* %aString) #0 !dbg !98 {
entry:
  %retval = alloca i8*, align 8
  %aString.addr = alloca i8*, align 8
  %i = alloca i64, align 8
  %j = alloca i64, align 8
  %reversedString = alloca i8*, align 8
  store i8* %aString, i8** %aString.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %aString.addr, metadata !101, metadata !36), !dbg !102
  call void @llvm.dbg.declare(metadata i64* %i, metadata !103, metadata !36), !dbg !107
  store i64 0, i64* %i, align 8, !dbg !107
  call void @llvm.dbg.declare(metadata i64* %j, metadata !108, metadata !36), !dbg !109
  call void @llvm.dbg.declare(metadata i8** %reversedString, metadata !110, metadata !36), !dbg !111
  store i8* null, i8** %reversedString, align 8, !dbg !111
  %0 = load i8*, i8** %aString.addr, align 8, !dbg !112
  %cmp = icmp ne i8* %0, null, !dbg !114
  br i1 %cmp, label %if.then, label %if.else, !dbg !115

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** %aString.addr, align 8, !dbg !116
  %call = call i64 @strlen(i8* %1) #6, !dbg !118
  store i64 %call, i64* %i, align 8, !dbg !119
  %2 = load i64, i64* %i, align 8, !dbg !120
  %add = add i64 %2, 1, !dbg !121
  %call1 = call noalias i8* @malloc(i64 %add) #5, !dbg !122
  store i8* %call1, i8** %reversedString, align 8, !dbg !123
  %3 = load i8*, i8** %reversedString, align 8, !dbg !124
  %cmp2 = icmp eq i8* %3, null, !dbg !126
  br i1 %cmp2, label %if.then3, label %if.end, !dbg !127

if.then3:                                         ; preds = %if.then
  store i8* null, i8** %retval, align 8, !dbg !128
  br label %return, !dbg !128

if.end:                                           ; preds = %if.then
  store i64 0, i64* %j, align 8, !dbg !130
  br label %for.cond, !dbg !132

for.cond:                                         ; preds = %for.inc, %if.end
  %4 = load i64, i64* %j, align 8, !dbg !133
  %5 = load i64, i64* %i, align 8, !dbg !136
  %cmp4 = icmp ult i64 %4, %5, !dbg !137
  br i1 %cmp4, label %for.body, label %for.end, !dbg !138

for.body:                                         ; preds = %for.cond
  %6 = load i64, i64* %i, align 8, !dbg !139
  %7 = load i64, i64* %j, align 8, !dbg !141
  %sub = sub i64 %6, %7, !dbg !142
  %sub5 = sub i64 %sub, 1, !dbg !143
  %8 = load i8*, i8** %aString.addr, align 8, !dbg !144
  %arrayidx = getelementptr inbounds i8, i8* %8, i64 %sub5, !dbg !144
  %9 = load i8, i8* %arrayidx, align 1, !dbg !144
  %10 = load i64, i64* %j, align 8, !dbg !145
  %11 = load i8*, i8** %reversedString, align 8, !dbg !146
  %arrayidx6 = getelementptr inbounds i8, i8* %11, i64 %10, !dbg !146
  store i8 %9, i8* %arrayidx6, align 1, !dbg !147
  br label %for.inc, !dbg !148

for.inc:                                          ; preds = %for.body
  %12 = load i64, i64* %j, align 8, !dbg !149
  %inc = add i64 %12, 1, !dbg !149
  store i64 %inc, i64* %j, align 8, !dbg !149
  br label %for.cond, !dbg !151, !llvm.loop !152

for.end:                                          ; preds = %for.cond
  %13 = load i64, i64* %i, align 8, !dbg !154
  %14 = load i8*, i8** %reversedString, align 8, !dbg !155
  %arrayidx7 = getelementptr inbounds i8, i8* %14, i64 %13, !dbg !155
  store i8 0, i8* %arrayidx7, align 1, !dbg !156
  %15 = load i8*, i8** %reversedString, align 8, !dbg !157
  call void @free(i8* %15) #5, !dbg !158
  %16 = load i8*, i8** %reversedString, align 8, !dbg !159
  store i8* %16, i8** %retval, align 8, !dbg !160
  br label %return, !dbg !160

if.else:                                          ; preds = %entry
  store i8* null, i8** %retval, align 8, !dbg !161
  br label %return, !dbg !161

return:                                           ; preds = %if.else, %for.end, %if.then3
  %17 = load i8*, i8** %retval, align 8, !dbg !163
  ret i8* %17, !dbg !163
}

; Function Attrs: nounwind uwtable
define void @good35() #0 !dbg !164 {
entry:
  %reversedString = alloca i8*, align 8
  %0 = load i32, i32* @staticFalse, align 4, !dbg !165
  %tobool = icmp ne i32 %0, 0, !dbg !165
  br i1 %tobool, label %if.then, label %if.else, !dbg !167

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i32 0, i32 0)), !dbg !168
  br label %if.end2, !dbg !170

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i8** %reversedString, metadata !171, metadata !36), !dbg !174
  %call = call i8* @helperGood(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.5, i32 0, i32 0)), !dbg !175
  store i8* %call, i8** %reversedString, align 8, !dbg !174
  %1 = load i8*, i8** %reversedString, align 8, !dbg !176
  %cmp = icmp eq i8* %1, null, !dbg !178
  br i1 %cmp, label %if.then1, label %if.end, !dbg !179

if.then1:                                         ; preds = %if.else
  br label %if.end2, !dbg !180

if.end:                                           ; preds = %if.else
  %2 = load i8*, i8** %reversedString, align 8, !dbg !182
  call void @printLine(i8* %2), !dbg !183
  %3 = load i8*, i8** %reversedString, align 8, !dbg !184
  call void @free(i8* %3) #5, !dbg !185
  br label %if.end2

if.end2:                                          ; preds = %if.then1, %if.end, %if.then
  ret void, !dbg !186
}

; Function Attrs: nounwind uwtable
define internal i8* @helperGood(i8* %aString) #0 !dbg !187 {
entry:
  %retval = alloca i8*, align 8
  %aString.addr = alloca i8*, align 8
  %i = alloca i64, align 8
  %j = alloca i64, align 8
  %reversedString = alloca i8*, align 8
  store i8* %aString, i8** %aString.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %aString.addr, metadata !188, metadata !36), !dbg !189
  call void @llvm.dbg.declare(metadata i64* %i, metadata !190, metadata !36), !dbg !191
  store i64 0, i64* %i, align 8, !dbg !191
  call void @llvm.dbg.declare(metadata i64* %j, metadata !192, metadata !36), !dbg !193
  call void @llvm.dbg.declare(metadata i8** %reversedString, metadata !194, metadata !36), !dbg !195
  store i8* null, i8** %reversedString, align 8, !dbg !195
  %0 = load i8*, i8** %aString.addr, align 8, !dbg !196
  %cmp = icmp ne i8* %0, null, !dbg !198
  br i1 %cmp, label %if.then, label %if.else, !dbg !199

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** %aString.addr, align 8, !dbg !200
  %call = call i64 @strlen(i8* %1) #6, !dbg !202
  store i64 %call, i64* %i, align 8, !dbg !203
  %2 = load i64, i64* %i, align 8, !dbg !204
  %add = add i64 %2, 1, !dbg !205
  %call1 = call noalias i8* @malloc(i64 %add) #5, !dbg !206
  store i8* %call1, i8** %reversedString, align 8, !dbg !207
  %3 = load i8*, i8** %reversedString, align 8, !dbg !208
  %cmp2 = icmp eq i8* %3, null, !dbg !210
  br i1 %cmp2, label %if.then3, label %if.end, !dbg !211

if.then3:                                         ; preds = %if.then
  store i8* null, i8** %retval, align 8, !dbg !212
  br label %return, !dbg !212

if.end:                                           ; preds = %if.then
  store i64 0, i64* %j, align 8, !dbg !214
  br label %for.cond, !dbg !216

for.cond:                                         ; preds = %for.inc, %if.end
  %4 = load i64, i64* %j, align 8, !dbg !217
  %5 = load i64, i64* %i, align 8, !dbg !220
  %cmp4 = icmp ult i64 %4, %5, !dbg !221
  br i1 %cmp4, label %for.body, label %for.end, !dbg !222

for.body:                                         ; preds = %for.cond
  %6 = load i64, i64* %i, align 8, !dbg !223
  %7 = load i64, i64* %j, align 8, !dbg !225
  %sub = sub i64 %6, %7, !dbg !226
  %sub5 = sub i64 %sub, 1, !dbg !227
  %8 = load i8*, i8** %aString.addr, align 8, !dbg !228
  %arrayidx = getelementptr inbounds i8, i8* %8, i64 %sub5, !dbg !228
  %9 = load i8, i8* %arrayidx, align 1, !dbg !228
  %10 = load i64, i64* %j, align 8, !dbg !229
  %11 = load i8*, i8** %reversedString, align 8, !dbg !230
  %arrayidx6 = getelementptr inbounds i8, i8* %11, i64 %10, !dbg !230
  store i8 %9, i8* %arrayidx6, align 1, !dbg !231
  br label %for.inc, !dbg !232

for.inc:                                          ; preds = %for.body
  %12 = load i64, i64* %j, align 8, !dbg !233
  %inc = add i64 %12, 1, !dbg !233
  store i64 %inc, i64* %j, align 8, !dbg !233
  br label %for.cond, !dbg !235, !llvm.loop !236

for.end:                                          ; preds = %for.cond
  %13 = load i64, i64* %i, align 8, !dbg !238
  %14 = load i8*, i8** %reversedString, align 8, !dbg !239
  %arrayidx7 = getelementptr inbounds i8, i8* %14, i64 %13, !dbg !239
  store i8 0, i8* %arrayidx7, align 1, !dbg !240
  %15 = load i8*, i8** %reversedString, align 8, !dbg !241
  store i8* %15, i8** %retval, align 8, !dbg !242
  br label %return, !dbg !242

if.else:                                          ; preds = %entry
  store i8* null, i8** %retval, align 8, !dbg !243
  br label %return, !dbg !243

return:                                           ; preds = %if.else, %for.end, %if.then3
  %16 = load i8*, i8** %retval, align 8, !dbg !245
  ret i8* %16, !dbg !245
}

; Function Attrs: nounwind
declare void @free(i8*) #1

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !246 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @good35(), !dbg !247
  call void @bad35(), !dbg !248
  ret i32 1, !dbg !249
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
!llvm.module.flags = !{!19, !20}
!llvm.ident = !{!21}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (tags/RELEASE_390/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, globals: !8)
!1 = !DIFile(filename: "416_35.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/416")
!2 = !{}
!3 = !{!4, !5, !6}
!4 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64, align: 64)
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64, align: 64)
!7 = !DIBasicType(name: "char", size: 8, align: 8, encoding: DW_ATE_signed_char)
!8 = !{!9, !12, !13, !14, !15, !16, !17, !18}
!9 = distinct !DIGlobalVariable(name: "GLOBAL_CONST_TRUE", scope: !0, file: !10, line: 10, type: !11, isLocal: false, isDefinition: true, variable: i32* @GLOBAL_CONST_TRUE)
!10 = !DIFile(filename: "./416_35.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/416")
!11 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !4)
!12 = distinct !DIGlobalVariable(name: "GLOBAL_CONST_FALSE", scope: !0, file: !10, line: 11, type: !11, isLocal: false, isDefinition: true, variable: i32* @GLOBAL_CONST_FALSE)
!13 = distinct !DIGlobalVariable(name: "GLOBAL_CONST_FIVE", scope: !0, file: !10, line: 12, type: !11, isLocal: false, isDefinition: true, variable: i32* @GLOBAL_CONST_FIVE)
!14 = distinct !DIGlobalVariable(name: "globalTrue", scope: !0, file: !10, line: 14, type: !4, isLocal: false, isDefinition: true, variable: i32* @globalTrue)
!15 = distinct !DIGlobalVariable(name: "globalFalse", scope: !0, file: !10, line: 15, type: !4, isLocal: false, isDefinition: true, variable: i32* @globalFalse)
!16 = distinct !DIGlobalVariable(name: "globalFive", scope: !0, file: !10, line: 16, type: !4, isLocal: false, isDefinition: true, variable: i32* @globalFive)
!17 = distinct !DIGlobalVariable(name: "staticTrue", scope: !0, file: !10, line: 109, type: !4, isLocal: true, isDefinition: true, variable: i32* @staticTrue)
!18 = distinct !DIGlobalVariable(name: "staticFalse", scope: !0, file: !10, line: 110, type: !4, isLocal: true, isDefinition: true, variable: i32* @staticFalse)
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
!34 = !{null, !7}
!35 = !DILocalVariable(name: "charHex", arg: 1, scope: !32, file: !10, line: 33, type: !7)
!36 = !DIExpression()
!37 = !DILocation(line: 33, column: 29, scope: !32)
!38 = !DILocation(line: 35, column: 25, scope: !32)
!39 = !DILocation(line: 35, column: 20, scope: !32)
!40 = !DILocation(line: 35, column: 5, scope: !32)
!41 = !DILocation(line: 36, column: 1, scope: !32)
!42 = distinct !DISubprogram(name: "printLine", scope: !10, file: !10, line: 38, type: !43, isLocal: false, isDefinition: true, scopeLine: 39, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!43 = !DISubroutineType(types: !44)
!44 = !{null, !45}
!45 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !46, size: 64, align: 64)
!46 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !7)
!47 = !DILocalVariable(name: "line", arg: 1, scope: !42, file: !10, line: 38, type: !45)
!48 = !DILocation(line: 38, column: 30, scope: !42)
!49 = !DILocation(line: 40, column: 8, scope: !50)
!50 = distinct !DILexicalBlock(scope: !42, file: !10, line: 40, column: 8)
!51 = !DILocation(line: 40, column: 13, scope: !50)
!52 = !DILocation(line: 40, column: 8, scope: !42)
!53 = !DILocation(line: 42, column: 24, scope: !54)
!54 = distinct !DILexicalBlock(scope: !50, file: !10, line: 41, column: 5)
!55 = !DILocation(line: 42, column: 9, scope: !54)
!56 = !DILocation(line: 43, column: 5, scope: !54)
!57 = !DILocation(line: 44, column: 1, scope: !42)
!58 = distinct !DISubprogram(name: "printIntLine", scope: !10, file: !10, line: 46, type: !59, isLocal: false, isDefinition: true, scopeLine: 47, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!59 = !DISubroutineType(types: !60)
!60 = !{null, !4}
!61 = !DILocalVariable(name: "intNumber", arg: 1, scope: !58, file: !10, line: 46, type: !4)
!62 = !DILocation(line: 46, column: 24, scope: !58)
!63 = !DILocation(line: 48, column: 20, scope: !58)
!64 = !DILocation(line: 48, column: 5, scope: !58)
!65 = !DILocation(line: 49, column: 1, scope: !58)
!66 = distinct !DISubprogram(name: "printLongLine", scope: !10, file: !10, line: 51, type: !67, isLocal: false, isDefinition: true, scopeLine: 52, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!67 = !DISubroutineType(types: !68)
!68 = !{null, !69}
!69 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !70, line: 197, baseType: !71)
!70 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/sys/types.h", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/416")
!71 = !DIBasicType(name: "long int", size: 64, align: 64, encoding: DW_ATE_signed)
!72 = !DILocalVariable(name: "longIntNumber", arg: 1, scope: !66, file: !10, line: 51, type: !69)
!73 = !DILocation(line: 51, column: 29, scope: !66)
!74 = !DILocation(line: 53, column: 21, scope: !66)
!75 = !DILocation(line: 53, column: 5, scope: !66)
!76 = !DILocation(line: 54, column: 1, scope: !66)
!77 = distinct !DISubprogram(name: "bad35", scope: !10, file: !10, line: 114, type: !78, isLocal: false, isDefinition: true, scopeLine: 115, isOptimized: false, unit: !0, variables: !2)
!78 = !DISubroutineType(types: !79)
!79 = !{null}
!80 = !DILocation(line: 116, column: 8, scope: !81)
!81 = distinct !DILexicalBlock(scope: !77, file: !10, line: 116, column: 8)
!82 = !DILocation(line: 116, column: 8, scope: !77)
!83 = !DILocalVariable(name: "reversedString", scope: !84, file: !10, line: 120, type: !6)
!84 = distinct !DILexicalBlock(scope: !85, file: !10, line: 118, column: 9)
!85 = distinct !DILexicalBlock(scope: !81, file: !10, line: 117, column: 5)
!86 = !DILocation(line: 120, column: 20, scope: !84)
!87 = !DILocation(line: 120, column: 37, scope: !84)
!88 = !DILocation(line: 121, column: 17, scope: !89)
!89 = distinct !DILexicalBlock(scope: !84, file: !10, line: 121, column: 17)
!90 = !DILocation(line: 121, column: 32, scope: !89)
!91 = !DILocation(line: 121, column: 17, scope: !84)
!92 = !DILocation(line: 121, column: 41, scope: !93)
!93 = !DILexicalBlockFile(scope: !89, file: !10, discriminator: 1)
!94 = !DILocation(line: 122, column: 23, scope: !84)
!95 = !DILocation(line: 122, column: 13, scope: !84)
!96 = !DILocation(line: 125, column: 5, scope: !85)
!97 = !DILocation(line: 126, column: 1, scope: !77)
!98 = distinct !DISubprogram(name: "helperBad", scope: !10, file: !10, line: 57, type: !99, isLocal: true, isDefinition: true, scopeLine: 58, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!99 = !DISubroutineType(types: !100)
!100 = !{!6, !6}
!101 = !DILocalVariable(name: "aString", arg: 1, scope: !98, file: !10, line: 57, type: !6)
!102 = !DILocation(line: 57, column: 32, scope: !98)
!103 = !DILocalVariable(name: "i", scope: !98, file: !10, line: 59, type: !104)
!104 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !105, line: 62, baseType: !106)
!105 = !DIFile(filename: "/usr/local/bin/../lib/clang/3.9.0/include/stddef.h", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/416")
!106 = !DIBasicType(name: "long unsigned int", size: 64, align: 64, encoding: DW_ATE_unsigned)
!107 = !DILocation(line: 59, column: 12, scope: !98)
!108 = !DILocalVariable(name: "j", scope: !98, file: !10, line: 60, type: !104)
!109 = !DILocation(line: 60, column: 12, scope: !98)
!110 = !DILocalVariable(name: "reversedString", scope: !98, file: !10, line: 61, type: !6)
!111 = !DILocation(line: 61, column: 12, scope: !98)
!112 = !DILocation(line: 62, column: 9, scope: !113)
!113 = distinct !DILexicalBlock(scope: !98, file: !10, line: 62, column: 9)
!114 = !DILocation(line: 62, column: 17, scope: !113)
!115 = !DILocation(line: 62, column: 9, scope: !98)
!116 = !DILocation(line: 64, column: 20, scope: !117)
!117 = distinct !DILexicalBlock(scope: !113, file: !10, line: 63, column: 5)
!118 = !DILocation(line: 64, column: 13, scope: !117)
!119 = !DILocation(line: 64, column: 11, scope: !117)
!120 = !DILocation(line: 65, column: 42, scope: !117)
!121 = !DILocation(line: 65, column: 43, scope: !117)
!122 = !DILocation(line: 65, column: 35, scope: !117)
!123 = !DILocation(line: 65, column: 24, scope: !117)
!124 = !DILocation(line: 66, column: 13, scope: !125)
!125 = distinct !DILexicalBlock(scope: !117, file: !10, line: 66, column: 13)
!126 = !DILocation(line: 66, column: 28, scope: !125)
!127 = !DILocation(line: 66, column: 13, scope: !117)
!128 = !DILocation(line: 66, column: 37, scope: !129)
!129 = !DILexicalBlockFile(scope: !125, file: !10, discriminator: 1)
!130 = !DILocation(line: 67, column: 16, scope: !131)
!131 = distinct !DILexicalBlock(scope: !117, file: !10, line: 67, column: 9)
!132 = !DILocation(line: 67, column: 14, scope: !131)
!133 = !DILocation(line: 67, column: 21, scope: !134)
!134 = !DILexicalBlockFile(scope: !135, file: !10, discriminator: 1)
!135 = distinct !DILexicalBlock(scope: !131, file: !10, line: 67, column: 9)
!136 = !DILocation(line: 67, column: 25, scope: !134)
!137 = !DILocation(line: 67, column: 23, scope: !134)
!138 = !DILocation(line: 67, column: 9, scope: !134)
!139 = !DILocation(line: 69, column: 41, scope: !140)
!140 = distinct !DILexicalBlock(scope: !135, file: !10, line: 68, column: 9)
!141 = !DILocation(line: 69, column: 43, scope: !140)
!142 = !DILocation(line: 69, column: 42, scope: !140)
!143 = !DILocation(line: 69, column: 44, scope: !140)
!144 = !DILocation(line: 69, column: 33, scope: !140)
!145 = !DILocation(line: 69, column: 28, scope: !140)
!146 = !DILocation(line: 69, column: 13, scope: !140)
!147 = !DILocation(line: 69, column: 31, scope: !140)
!148 = !DILocation(line: 70, column: 9, scope: !140)
!149 = !DILocation(line: 67, column: 29, scope: !150)
!150 = !DILexicalBlockFile(scope: !135, file: !10, discriminator: 2)
!151 = !DILocation(line: 67, column: 9, scope: !150)
!152 = distinct !{!152, !153}
!153 = !DILocation(line: 67, column: 9, scope: !117)
!154 = !DILocation(line: 71, column: 24, scope: !117)
!155 = !DILocation(line: 71, column: 9, scope: !117)
!156 = !DILocation(line: 71, column: 27, scope: !117)
!157 = !DILocation(line: 73, column: 14, scope: !117)
!158 = !DILocation(line: 73, column: 9, scope: !117)
!159 = !DILocation(line: 74, column: 16, scope: !117)
!160 = !DILocation(line: 74, column: 9, scope: !117)
!161 = !DILocation(line: 78, column: 9, scope: !162)
!162 = distinct !DILexicalBlock(scope: !113, file: !10, line: 77, column: 5)
!163 = !DILocation(line: 80, column: 1, scope: !98)
!164 = distinct !DISubprogram(name: "good35", scope: !10, file: !10, line: 132, type: !78, isLocal: false, isDefinition: true, scopeLine: 133, isOptimized: false, unit: !0, variables: !2)
!165 = !DILocation(line: 134, column: 8, scope: !166)
!166 = distinct !DILexicalBlock(scope: !164, file: !10, line: 134, column: 8)
!167 = !DILocation(line: 134, column: 8, scope: !164)
!168 = !DILocation(line: 137, column: 9, scope: !169)
!169 = distinct !DILexicalBlock(scope: !166, file: !10, line: 135, column: 5)
!170 = !DILocation(line: 138, column: 5, scope: !169)
!171 = !DILocalVariable(name: "reversedString", scope: !172, file: !10, line: 143, type: !6)
!172 = distinct !DILexicalBlock(scope: !173, file: !10, line: 141, column: 9)
!173 = distinct !DILexicalBlock(scope: !166, file: !10, line: 140, column: 5)
!174 = !DILocation(line: 143, column: 20, scope: !172)
!175 = !DILocation(line: 143, column: 37, scope: !172)
!176 = !DILocation(line: 144, column: 17, scope: !177)
!177 = distinct !DILexicalBlock(scope: !172, file: !10, line: 144, column: 17)
!178 = !DILocation(line: 144, column: 32, scope: !177)
!179 = !DILocation(line: 144, column: 17, scope: !172)
!180 = !DILocation(line: 144, column: 41, scope: !181)
!181 = !DILexicalBlockFile(scope: !177, file: !10, discriminator: 1)
!182 = !DILocation(line: 145, column: 23, scope: !172)
!183 = !DILocation(line: 145, column: 13, scope: !172)
!184 = !DILocation(line: 146, column: 18, scope: !172)
!185 = !DILocation(line: 146, column: 13, scope: !172)
!186 = !DILocation(line: 149, column: 1, scope: !164)
!187 = distinct !DISubprogram(name: "helperGood", scope: !10, file: !10, line: 82, type: !99, isLocal: true, isDefinition: true, scopeLine: 83, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!188 = !DILocalVariable(name: "aString", arg: 1, scope: !187, file: !10, line: 82, type: !6)
!189 = !DILocation(line: 82, column: 33, scope: !187)
!190 = !DILocalVariable(name: "i", scope: !187, file: !10, line: 84, type: !104)
!191 = !DILocation(line: 84, column: 12, scope: !187)
!192 = !DILocalVariable(name: "j", scope: !187, file: !10, line: 85, type: !104)
!193 = !DILocation(line: 85, column: 12, scope: !187)
!194 = !DILocalVariable(name: "reversedString", scope: !187, file: !10, line: 86, type: !6)
!195 = !DILocation(line: 86, column: 12, scope: !187)
!196 = !DILocation(line: 87, column: 9, scope: !197)
!197 = distinct !DILexicalBlock(scope: !187, file: !10, line: 87, column: 9)
!198 = !DILocation(line: 87, column: 17, scope: !197)
!199 = !DILocation(line: 87, column: 9, scope: !187)
!200 = !DILocation(line: 89, column: 20, scope: !201)
!201 = distinct !DILexicalBlock(scope: !197, file: !10, line: 88, column: 5)
!202 = !DILocation(line: 89, column: 13, scope: !201)
!203 = !DILocation(line: 89, column: 11, scope: !201)
!204 = !DILocation(line: 90, column: 42, scope: !201)
!205 = !DILocation(line: 90, column: 43, scope: !201)
!206 = !DILocation(line: 90, column: 35, scope: !201)
!207 = !DILocation(line: 90, column: 24, scope: !201)
!208 = !DILocation(line: 91, column: 13, scope: !209)
!209 = distinct !DILexicalBlock(scope: !201, file: !10, line: 91, column: 13)
!210 = !DILocation(line: 91, column: 28, scope: !209)
!211 = !DILocation(line: 91, column: 13, scope: !201)
!212 = !DILocation(line: 91, column: 37, scope: !213)
!213 = !DILexicalBlockFile(scope: !209, file: !10, discriminator: 1)
!214 = !DILocation(line: 92, column: 16, scope: !215)
!215 = distinct !DILexicalBlock(scope: !201, file: !10, line: 92, column: 9)
!216 = !DILocation(line: 92, column: 14, scope: !215)
!217 = !DILocation(line: 92, column: 21, scope: !218)
!218 = !DILexicalBlockFile(scope: !219, file: !10, discriminator: 1)
!219 = distinct !DILexicalBlock(scope: !215, file: !10, line: 92, column: 9)
!220 = !DILocation(line: 92, column: 25, scope: !218)
!221 = !DILocation(line: 92, column: 23, scope: !218)
!222 = !DILocation(line: 92, column: 9, scope: !218)
!223 = !DILocation(line: 94, column: 41, scope: !224)
!224 = distinct !DILexicalBlock(scope: !219, file: !10, line: 93, column: 9)
!225 = !DILocation(line: 94, column: 43, scope: !224)
!226 = !DILocation(line: 94, column: 42, scope: !224)
!227 = !DILocation(line: 94, column: 44, scope: !224)
!228 = !DILocation(line: 94, column: 33, scope: !224)
!229 = !DILocation(line: 94, column: 28, scope: !224)
!230 = !DILocation(line: 94, column: 13, scope: !224)
!231 = !DILocation(line: 94, column: 31, scope: !224)
!232 = !DILocation(line: 95, column: 9, scope: !224)
!233 = !DILocation(line: 92, column: 29, scope: !234)
!234 = !DILexicalBlockFile(scope: !219, file: !10, discriminator: 2)
!235 = !DILocation(line: 92, column: 9, scope: !234)
!236 = distinct !{!236, !237}
!237 = !DILocation(line: 92, column: 9, scope: !201)
!238 = !DILocation(line: 96, column: 24, scope: !201)
!239 = !DILocation(line: 96, column: 9, scope: !201)
!240 = !DILocation(line: 96, column: 27, scope: !201)
!241 = !DILocation(line: 98, column: 16, scope: !201)
!242 = !DILocation(line: 98, column: 9, scope: !201)
!243 = !DILocation(line: 102, column: 9, scope: !244)
!244 = distinct !DILexicalBlock(scope: !197, file: !10, line: 101, column: 5)
!245 = !DILocation(line: 104, column: 1, scope: !187)
!246 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 153, type: !23, isLocal: false, isDefinition: true, scopeLine: 153, isOptimized: false, unit: !0, variables: !2)
!247 = !DILocation(line: 154, column: 5, scope: !246)
!248 = !DILocation(line: 155, column: 2, scope: !246)
!249 = !DILocation(line: 156, column: 5, scope: !246)
