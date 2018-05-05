; ModuleID = './416_26.c'
source_filename = "./416_26.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._twoIntsStruct = type { i32, i32 }

@GLOBAL_CONST_TRUE = constant i32 1, align 4
@GLOBAL_CONST_FALSE = constant i32 0, align 4
@GLOBAL_CONST_FIVE = constant i32 5, align 4
@globalTrue = global i32 1, align 4
@globalFalse = global i32 0, align 4
@globalFive = global i32 5, align 4
@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@.str.1 = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1
@.str.2 = private unnamed_addr constant [5 x i8] c"%ld\0A\00", align 1
@.str.3 = private unnamed_addr constant [10 x i8] c"%d -- %d\0A\00", align 1
@staticTrue = internal global i32 1, align 4
@staticFalse = internal global i32 0, align 4
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: nounwind uwtable
define i32 @globalReturnsTrue() #0 !dbg !27 {
entry:
  ret i32 1, !dbg !30
}

; Function Attrs: nounwind uwtable
define i32 @globalReturnsFalse() #0 !dbg !31 {
entry:
  ret i32 0, !dbg !32
}

; Function Attrs: nounwind uwtable
define i32 @globalReturnsTrueOrFalse() #0 !dbg !33 {
entry:
  %call = call i32 @rand() #4, !dbg !34
  %rem = srem i32 %call, 2, !dbg !35
  ret i32 %rem, !dbg !36
}

; Function Attrs: nounwind
declare i32 @rand() #1

; Function Attrs: nounwind uwtable
define void @printHexCharLine(i8 signext %charHex) #0 !dbg !37 {
entry:
  %charHex.addr = alloca i8, align 1
  store i8 %charHex, i8* %charHex.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %charHex.addr, metadata !41, metadata !42), !dbg !43
  %0 = load i8, i8* %charHex.addr, align 1, !dbg !44
  %conv = sext i8 %0 to i32, !dbg !45
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), i32 %conv), !dbg !46
  ret void, !dbg !47
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #2

declare i32 @printf(i8*, ...) #3

; Function Attrs: nounwind uwtable
define void @printLine(i8* %line) #0 !dbg !48 {
entry:
  %line.addr = alloca i8*, align 8
  store i8* %line, i8** %line.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %line.addr, metadata !53, metadata !42), !dbg !54
  %0 = load i8*, i8** %line.addr, align 8, !dbg !55
  %cmp = icmp ne i8* %0, null, !dbg !57
  br i1 %cmp, label %if.then, label %if.end, !dbg !58

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** %line.addr, align 8, !dbg !59
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i32 0, i32 0), i8* %1), !dbg !61
  br label %if.end, !dbg !62

if.end:                                           ; preds = %if.then, %entry
  ret void, !dbg !63
}

; Function Attrs: nounwind uwtable
define void @printIntLine(i32 %intNumber) #0 !dbg !64 {
entry:
  %intNumber.addr = alloca i32, align 4
  store i32 %intNumber, i32* %intNumber.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %intNumber.addr, metadata !67, metadata !42), !dbg !68
  %0 = load i32, i32* %intNumber.addr, align 4, !dbg !69
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), i32 %0), !dbg !70
  ret void, !dbg !71
}

; Function Attrs: nounwind uwtable
define void @printLongLine(i64 %longIntNumber) #0 !dbg !72 {
entry:
  %longIntNumber.addr = alloca i64, align 8
  store i64 %longIntNumber, i64* %longIntNumber.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %longIntNumber.addr, metadata !78, metadata !42), !dbg !79
  %0 = load i64, i64* %longIntNumber.addr, align 8, !dbg !80
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.2, i32 0, i32 0), i64 %0), !dbg !81
  ret void, !dbg !82
}

; Function Attrs: nounwind uwtable
define void @printStructLine(%struct._twoIntsStruct* %structTwoIntsStruct) #0 !dbg !83 {
entry:
  %structTwoIntsStruct.addr = alloca %struct._twoIntsStruct*, align 8
  store %struct._twoIntsStruct* %structTwoIntsStruct, %struct._twoIntsStruct** %structTwoIntsStruct.addr, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %structTwoIntsStruct.addr, metadata !88, metadata !42), !dbg !89
  %0 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %structTwoIntsStruct.addr, align 8, !dbg !90
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %0, i32 0, i32 0, !dbg !91
  %1 = load i32, i32* %intOne, align 4, !dbg !91
  %2 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %structTwoIntsStruct.addr, align 8, !dbg !92
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %2, i32 0, i32 1, !dbg !93
  %3 = load i32, i32* %intTwo, align 4, !dbg !93
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.3, i32 0, i32 0), i32 %1, i32 %3), !dbg !94
  ret void, !dbg !95
}

; Function Attrs: nounwind uwtable
define void @bad26() #0 !dbg !96 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !99, metadata !42), !dbg !100
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !101
  %0 = load i32, i32* @staticTrue, align 4, !dbg !102
  %tobool = icmp ne i32 %0, 0, !dbg !102
  br i1 %tobool, label %if.then, label %if.end4, !dbg !104

if.then:                                          ; preds = %entry
  %call = call noalias i8* @malloc(i64 800) #4, !dbg !105
  %1 = bitcast i8* %call to %struct._twoIntsStruct*, !dbg !107
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %data, align 8, !dbg !108
  %2 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !109
  %cmp = icmp eq %struct._twoIntsStruct* %2, null, !dbg !111
  br i1 %cmp, label %if.then1, label %if.end, !dbg !112

if.then1:                                         ; preds = %if.then
  br label %if.end8, !dbg !113

if.end:                                           ; preds = %if.then
  call void @llvm.dbg.declare(metadata i64* %i, metadata !115, metadata !42), !dbg !120
  store i64 0, i64* %i, align 8, !dbg !121
  br label %for.cond, !dbg !123

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i64, i64* %i, align 8, !dbg !124
  %cmp2 = icmp ult i64 %3, 100, !dbg !127
  br i1 %cmp2, label %for.body, label %for.end, !dbg !128

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !129
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !131
  %arrayidx = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %5, i64 %4, !dbg !131
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !132
  store i32 1, i32* %intOne, align 4, !dbg !133
  %6 = load i64, i64* %i, align 8, !dbg !134
  %7 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !135
  %arrayidx3 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %7, i64 %6, !dbg !135
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx3, i32 0, i32 1, !dbg !136
  store i32 2, i32* %intTwo, align 4, !dbg !137
  br label %for.inc, !dbg !138

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !139
  %inc = add i64 %8, 1, !dbg !139
  store i64 %inc, i64* %i, align 8, !dbg !139
  br label %for.cond, !dbg !141, !llvm.loop !142

for.end:                                          ; preds = %for.cond
  %9 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !144
  %10 = bitcast %struct._twoIntsStruct* %9 to i8*, !dbg !144
  call void @free(i8* %10) #4, !dbg !145
  br label %if.end4, !dbg !146

if.end4:                                          ; preds = %for.end, %entry
  %11 = load i32, i32* @staticTrue, align 4, !dbg !147
  %tobool5 = icmp ne i32 %11, 0, !dbg !147
  br i1 %tobool5, label %if.then6, label %if.end8, !dbg !149

if.then6:                                         ; preds = %if.end4
  %12 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !150
  %arrayidx7 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %12, i64 0, !dbg !150
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx7), !dbg !152
  br label %if.end8, !dbg !153

if.end8:                                          ; preds = %if.then1, %if.then6, %if.end4
  ret void, !dbg !154
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #1

; Function Attrs: nounwind
declare void @free(i8*) #1

; Function Attrs: nounwind uwtable
define void @good26() #0 !dbg !155 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !156, metadata !42), !dbg !157
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !158
  %0 = load i32, i32* @staticTrue, align 4, !dbg !159
  %tobool = icmp ne i32 %0, 0, !dbg !159
  br i1 %tobool, label %if.then, label %if.end4, !dbg !161

if.then:                                          ; preds = %entry
  %call = call noalias i8* @malloc(i64 800) #4, !dbg !162
  %1 = bitcast i8* %call to %struct._twoIntsStruct*, !dbg !164
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %data, align 8, !dbg !165
  %2 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !166
  %cmp = icmp eq %struct._twoIntsStruct* %2, null, !dbg !168
  br i1 %cmp, label %if.then1, label %if.end, !dbg !169

if.then1:                                         ; preds = %if.then
  br label %if.end7, !dbg !170

if.end:                                           ; preds = %if.then
  call void @llvm.dbg.declare(metadata i64* %i, metadata !172, metadata !42), !dbg !174
  store i64 0, i64* %i, align 8, !dbg !175
  br label %for.cond, !dbg !177

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i64, i64* %i, align 8, !dbg !178
  %cmp2 = icmp ult i64 %3, 100, !dbg !181
  br i1 %cmp2, label %for.body, label %for.end, !dbg !182

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !183
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !185
  %arrayidx = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %5, i64 %4, !dbg !185
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !186
  store i32 1, i32* %intOne, align 4, !dbg !187
  %6 = load i64, i64* %i, align 8, !dbg !188
  %7 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !189
  %arrayidx3 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %7, i64 %6, !dbg !189
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx3, i32 0, i32 1, !dbg !190
  store i32 2, i32* %intTwo, align 4, !dbg !191
  br label %for.inc, !dbg !192

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !193
  %inc = add i64 %8, 1, !dbg !193
  store i64 %inc, i64* %i, align 8, !dbg !193
  br label %for.cond, !dbg !195, !llvm.loop !196

for.end:                                          ; preds = %for.cond
  %9 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !198
  %10 = bitcast %struct._twoIntsStruct* %9 to i8*, !dbg !198
  call void @free(i8* %10) #4, !dbg !199
  br label %if.end4, !dbg !200

if.end4:                                          ; preds = %for.end, %entry
  %11 = load i32, i32* @staticFalse, align 4, !dbg !201
  %tobool5 = icmp ne i32 %11, 0, !dbg !201
  br i1 %tobool5, label %if.then6, label %if.else, !dbg !203

if.then6:                                         ; preds = %if.end4
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i32 0, i32 0)), !dbg !204
  br label %if.end7, !dbg !206

if.else:                                          ; preds = %if.end4
  br label %if.end7

if.end7:                                          ; preds = %if.then1, %if.else, %if.then6
  ret void, !dbg !207
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !208 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @good26(), !dbg !209
  call void @bad26(), !dbg !210
  ret i32 1, !dbg !211
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone }
attributes #3 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!24, !25}
!llvm.ident = !{!26}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (tags/RELEASE_390/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, globals: !13)
!1 = !DIFile(filename: "416_26.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/416")
!2 = !{}
!3 = !{!4, !5, !6}
!4 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64, align: 64)
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64, align: 64)
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "twoIntsStruct", file: !8, line: 14, baseType: !9)
!8 = !DIFile(filename: "./416.h", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/416")
!9 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_twoIntsStruct", file: !8, line: 10, size: 64, align: 32, elements: !10)
!10 = !{!11, !12}
!11 = !DIDerivedType(tag: DW_TAG_member, name: "intOne", scope: !9, file: !8, line: 12, baseType: !4, size: 32, align: 32)
!12 = !DIDerivedType(tag: DW_TAG_member, name: "intTwo", scope: !9, file: !8, line: 13, baseType: !4, size: 32, align: 32, offset: 32)
!13 = !{!14, !17, !18, !19, !20, !21, !22, !23}
!14 = distinct !DIGlobalVariable(name: "GLOBAL_CONST_TRUE", scope: !0, file: !15, line: 10, type: !16, isLocal: false, isDefinition: true, variable: i32* @GLOBAL_CONST_TRUE)
!15 = !DIFile(filename: "./416_26.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/416")
!16 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !4)
!17 = distinct !DIGlobalVariable(name: "GLOBAL_CONST_FALSE", scope: !0, file: !15, line: 11, type: !16, isLocal: false, isDefinition: true, variable: i32* @GLOBAL_CONST_FALSE)
!18 = distinct !DIGlobalVariable(name: "GLOBAL_CONST_FIVE", scope: !0, file: !15, line: 12, type: !16, isLocal: false, isDefinition: true, variable: i32* @GLOBAL_CONST_FIVE)
!19 = distinct !DIGlobalVariable(name: "globalTrue", scope: !0, file: !15, line: 14, type: !4, isLocal: false, isDefinition: true, variable: i32* @globalTrue)
!20 = distinct !DIGlobalVariable(name: "globalFalse", scope: !0, file: !15, line: 15, type: !4, isLocal: false, isDefinition: true, variable: i32* @globalFalse)
!21 = distinct !DIGlobalVariable(name: "globalFive", scope: !0, file: !15, line: 16, type: !4, isLocal: false, isDefinition: true, variable: i32* @globalFive)
!22 = distinct !DIGlobalVariable(name: "staticTrue", scope: !0, file: !15, line: 61, type: !4, isLocal: true, isDefinition: true, variable: i32* @staticTrue)
!23 = distinct !DIGlobalVariable(name: "staticFalse", scope: !0, file: !15, line: 62, type: !4, isLocal: true, isDefinition: true, variable: i32* @staticFalse)
!24 = !{i32 2, !"Dwarf Version", i32 4}
!25 = !{i32 2, !"Debug Info Version", i32 3}
!26 = !{!"clang version 3.9.0 (tags/RELEASE_390/final)"}
!27 = distinct !DISubprogram(name: "globalReturnsTrue", scope: !15, file: !15, line: 18, type: !28, isLocal: false, isDefinition: true, scopeLine: 19, isOptimized: false, unit: !0, variables: !2)
!28 = !DISubroutineType(types: !29)
!29 = !{!4}
!30 = !DILocation(line: 20, column: 5, scope: !27)
!31 = distinct !DISubprogram(name: "globalReturnsFalse", scope: !15, file: !15, line: 23, type: !28, isLocal: false, isDefinition: true, scopeLine: 24, isOptimized: false, unit: !0, variables: !2)
!32 = !DILocation(line: 25, column: 5, scope: !31)
!33 = distinct !DISubprogram(name: "globalReturnsTrueOrFalse", scope: !15, file: !15, line: 28, type: !28, isLocal: false, isDefinition: true, scopeLine: 29, isOptimized: false, unit: !0, variables: !2)
!34 = !DILocation(line: 30, column: 13, scope: !33)
!35 = !DILocation(line: 30, column: 20, scope: !33)
!36 = !DILocation(line: 30, column: 5, scope: !33)
!37 = distinct !DISubprogram(name: "printHexCharLine", scope: !15, file: !15, line: 33, type: !38, isLocal: false, isDefinition: true, scopeLine: 34, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!38 = !DISubroutineType(types: !39)
!39 = !{null, !40}
!40 = !DIBasicType(name: "char", size: 8, align: 8, encoding: DW_ATE_signed_char)
!41 = !DILocalVariable(name: "charHex", arg: 1, scope: !37, file: !15, line: 33, type: !40)
!42 = !DIExpression()
!43 = !DILocation(line: 33, column: 29, scope: !37)
!44 = !DILocation(line: 35, column: 25, scope: !37)
!45 = !DILocation(line: 35, column: 20, scope: !37)
!46 = !DILocation(line: 35, column: 5, scope: !37)
!47 = !DILocation(line: 36, column: 1, scope: !37)
!48 = distinct !DISubprogram(name: "printLine", scope: !15, file: !15, line: 38, type: !49, isLocal: false, isDefinition: true, scopeLine: 39, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!49 = !DISubroutineType(types: !50)
!50 = !{null, !51}
!51 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !52, size: 64, align: 64)
!52 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !40)
!53 = !DILocalVariable(name: "line", arg: 1, scope: !48, file: !15, line: 38, type: !51)
!54 = !DILocation(line: 38, column: 30, scope: !48)
!55 = !DILocation(line: 40, column: 8, scope: !56)
!56 = distinct !DILexicalBlock(scope: !48, file: !15, line: 40, column: 8)
!57 = !DILocation(line: 40, column: 13, scope: !56)
!58 = !DILocation(line: 40, column: 8, scope: !48)
!59 = !DILocation(line: 42, column: 24, scope: !60)
!60 = distinct !DILexicalBlock(scope: !56, file: !15, line: 41, column: 5)
!61 = !DILocation(line: 42, column: 9, scope: !60)
!62 = !DILocation(line: 43, column: 5, scope: !60)
!63 = !DILocation(line: 44, column: 1, scope: !48)
!64 = distinct !DISubprogram(name: "printIntLine", scope: !15, file: !15, line: 46, type: !65, isLocal: false, isDefinition: true, scopeLine: 47, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!65 = !DISubroutineType(types: !66)
!66 = !{null, !4}
!67 = !DILocalVariable(name: "intNumber", arg: 1, scope: !64, file: !15, line: 46, type: !4)
!68 = !DILocation(line: 46, column: 24, scope: !64)
!69 = !DILocation(line: 48, column: 20, scope: !64)
!70 = !DILocation(line: 48, column: 5, scope: !64)
!71 = !DILocation(line: 49, column: 1, scope: !64)
!72 = distinct !DISubprogram(name: "printLongLine", scope: !15, file: !15, line: 51, type: !73, isLocal: false, isDefinition: true, scopeLine: 52, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!73 = !DISubroutineType(types: !74)
!74 = !{null, !75}
!75 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !76, line: 197, baseType: !77)
!76 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/sys/types.h", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/416")
!77 = !DIBasicType(name: "long int", size: 64, align: 64, encoding: DW_ATE_signed)
!78 = !DILocalVariable(name: "longIntNumber", arg: 1, scope: !72, file: !15, line: 51, type: !75)
!79 = !DILocation(line: 51, column: 29, scope: !72)
!80 = !DILocation(line: 53, column: 21, scope: !72)
!81 = !DILocation(line: 53, column: 5, scope: !72)
!82 = !DILocation(line: 54, column: 1, scope: !72)
!83 = distinct !DISubprogram(name: "printStructLine", scope: !15, file: !15, line: 56, type: !84, isLocal: false, isDefinition: true, scopeLine: 57, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!84 = !DISubroutineType(types: !85)
!85 = !{null, !86}
!86 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !87, size: 64, align: 64)
!87 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !7)
!88 = !DILocalVariable(name: "structTwoIntsStruct", arg: 1, scope: !83, file: !15, line: 56, type: !86)
!89 = !DILocation(line: 56, column: 45, scope: !83)
!90 = !DILocation(line: 58, column: 26, scope: !83)
!91 = !DILocation(line: 58, column: 47, scope: !83)
!92 = !DILocation(line: 58, column: 55, scope: !83)
!93 = !DILocation(line: 58, column: 76, scope: !83)
!94 = !DILocation(line: 58, column: 5, scope: !83)
!95 = !DILocation(line: 59, column: 1, scope: !83)
!96 = distinct !DISubprogram(name: "bad26", scope: !15, file: !15, line: 66, type: !97, isLocal: false, isDefinition: true, scopeLine: 67, isOptimized: false, unit: !0, variables: !2)
!97 = !DISubroutineType(types: !98)
!98 = !{null}
!99 = !DILocalVariable(name: "data", scope: !96, file: !15, line: 68, type: !6)
!100 = !DILocation(line: 68, column: 21, scope: !96)
!101 = !DILocation(line: 70, column: 10, scope: !96)
!102 = !DILocation(line: 71, column: 8, scope: !103)
!103 = distinct !DILexicalBlock(scope: !96, file: !15, line: 71, column: 8)
!104 = !DILocation(line: 71, column: 8, scope: !96)
!105 = !DILocation(line: 73, column: 33, scope: !106)
!106 = distinct !DILexicalBlock(scope: !103, file: !15, line: 72, column: 5)
!107 = !DILocation(line: 73, column: 16, scope: !106)
!108 = !DILocation(line: 73, column: 14, scope: !106)
!109 = !DILocation(line: 74, column: 13, scope: !110)
!110 = distinct !DILexicalBlock(scope: !106, file: !15, line: 74, column: 13)
!111 = !DILocation(line: 74, column: 18, scope: !110)
!112 = !DILocation(line: 74, column: 13, scope: !106)
!113 = !DILocation(line: 74, column: 27, scope: !114)
!114 = !DILexicalBlockFile(scope: !110, file: !15, discriminator: 1)
!115 = !DILocalVariable(name: "i", scope: !116, file: !15, line: 76, type: !117)
!116 = distinct !DILexicalBlock(scope: !106, file: !15, line: 75, column: 9)
!117 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !118, line: 62, baseType: !119)
!118 = !DIFile(filename: "/usr/local/bin/../lib/clang/3.9.0/include/stddef.h", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/416")
!119 = !DIBasicType(name: "long unsigned int", size: 64, align: 64, encoding: DW_ATE_unsigned)
!120 = !DILocation(line: 76, column: 20, scope: !116)
!121 = !DILocation(line: 77, column: 19, scope: !122)
!122 = distinct !DILexicalBlock(scope: !116, file: !15, line: 77, column: 13)
!123 = !DILocation(line: 77, column: 17, scope: !122)
!124 = !DILocation(line: 77, column: 24, scope: !125)
!125 = !DILexicalBlockFile(scope: !126, file: !15, discriminator: 1)
!126 = distinct !DILexicalBlock(scope: !122, file: !15, line: 77, column: 13)
!127 = !DILocation(line: 77, column: 26, scope: !125)
!128 = !DILocation(line: 77, column: 13, scope: !125)
!129 = !DILocation(line: 79, column: 22, scope: !130)
!130 = distinct !DILexicalBlock(scope: !126, file: !15, line: 78, column: 13)
!131 = !DILocation(line: 79, column: 17, scope: !130)
!132 = !DILocation(line: 79, column: 25, scope: !130)
!133 = !DILocation(line: 79, column: 32, scope: !130)
!134 = !DILocation(line: 80, column: 22, scope: !130)
!135 = !DILocation(line: 80, column: 17, scope: !130)
!136 = !DILocation(line: 80, column: 25, scope: !130)
!137 = !DILocation(line: 80, column: 32, scope: !130)
!138 = !DILocation(line: 81, column: 13, scope: !130)
!139 = !DILocation(line: 77, column: 34, scope: !140)
!140 = !DILexicalBlockFile(scope: !126, file: !15, discriminator: 2)
!141 = !DILocation(line: 77, column: 13, scope: !140)
!142 = distinct !{!142, !143}
!143 = !DILocation(line: 77, column: 13, scope: !116)
!144 = !DILocation(line: 84, column: 14, scope: !106)
!145 = !DILocation(line: 84, column: 9, scope: !106)
!146 = !DILocation(line: 85, column: 5, scope: !106)
!147 = !DILocation(line: 86, column: 8, scope: !148)
!148 = distinct !DILexicalBlock(scope: !96, file: !15, line: 86, column: 8)
!149 = !DILocation(line: 86, column: 8, scope: !96)
!150 = !DILocation(line: 89, column: 26, scope: !151)
!151 = distinct !DILexicalBlock(scope: !148, file: !15, line: 87, column: 5)
!152 = !DILocation(line: 89, column: 9, scope: !151)
!153 = !DILocation(line: 91, column: 5, scope: !151)
!154 = !DILocation(line: 92, column: 1, scope: !96)
!155 = distinct !DISubprogram(name: "good26", scope: !15, file: !15, line: 98, type: !97, isLocal: false, isDefinition: true, scopeLine: 99, isOptimized: false, unit: !0, variables: !2)
!156 = !DILocalVariable(name: "data", scope: !155, file: !15, line: 100, type: !6)
!157 = !DILocation(line: 100, column: 21, scope: !155)
!158 = !DILocation(line: 102, column: 10, scope: !155)
!159 = !DILocation(line: 103, column: 8, scope: !160)
!160 = distinct !DILexicalBlock(scope: !155, file: !15, line: 103, column: 8)
!161 = !DILocation(line: 103, column: 8, scope: !155)
!162 = !DILocation(line: 105, column: 33, scope: !163)
!163 = distinct !DILexicalBlock(scope: !160, file: !15, line: 104, column: 5)
!164 = !DILocation(line: 105, column: 16, scope: !163)
!165 = !DILocation(line: 105, column: 14, scope: !163)
!166 = !DILocation(line: 106, column: 13, scope: !167)
!167 = distinct !DILexicalBlock(scope: !163, file: !15, line: 106, column: 13)
!168 = !DILocation(line: 106, column: 18, scope: !167)
!169 = !DILocation(line: 106, column: 13, scope: !163)
!170 = !DILocation(line: 106, column: 27, scope: !171)
!171 = !DILexicalBlockFile(scope: !167, file: !15, discriminator: 1)
!172 = !DILocalVariable(name: "i", scope: !173, file: !15, line: 108, type: !117)
!173 = distinct !DILexicalBlock(scope: !163, file: !15, line: 107, column: 9)
!174 = !DILocation(line: 108, column: 20, scope: !173)
!175 = !DILocation(line: 109, column: 19, scope: !176)
!176 = distinct !DILexicalBlock(scope: !173, file: !15, line: 109, column: 13)
!177 = !DILocation(line: 109, column: 17, scope: !176)
!178 = !DILocation(line: 109, column: 24, scope: !179)
!179 = !DILexicalBlockFile(scope: !180, file: !15, discriminator: 1)
!180 = distinct !DILexicalBlock(scope: !176, file: !15, line: 109, column: 13)
!181 = !DILocation(line: 109, column: 26, scope: !179)
!182 = !DILocation(line: 109, column: 13, scope: !179)
!183 = !DILocation(line: 111, column: 22, scope: !184)
!184 = distinct !DILexicalBlock(scope: !180, file: !15, line: 110, column: 13)
!185 = !DILocation(line: 111, column: 17, scope: !184)
!186 = !DILocation(line: 111, column: 25, scope: !184)
!187 = !DILocation(line: 111, column: 32, scope: !184)
!188 = !DILocation(line: 112, column: 22, scope: !184)
!189 = !DILocation(line: 112, column: 17, scope: !184)
!190 = !DILocation(line: 112, column: 25, scope: !184)
!191 = !DILocation(line: 112, column: 32, scope: !184)
!192 = !DILocation(line: 113, column: 13, scope: !184)
!193 = !DILocation(line: 109, column: 34, scope: !194)
!194 = !DILexicalBlockFile(scope: !180, file: !15, discriminator: 2)
!195 = !DILocation(line: 109, column: 13, scope: !194)
!196 = distinct !{!196, !197}
!197 = !DILocation(line: 109, column: 13, scope: !173)
!198 = !DILocation(line: 116, column: 14, scope: !163)
!199 = !DILocation(line: 116, column: 9, scope: !163)
!200 = !DILocation(line: 117, column: 5, scope: !163)
!201 = !DILocation(line: 118, column: 8, scope: !202)
!202 = distinct !DILexicalBlock(scope: !155, file: !15, line: 118, column: 8)
!203 = !DILocation(line: 118, column: 8, scope: !155)
!204 = !DILocation(line: 121, column: 9, scope: !205)
!205 = distinct !DILexicalBlock(scope: !202, file: !15, line: 119, column: 5)
!206 = !DILocation(line: 122, column: 5, scope: !205)
!207 = !DILocation(line: 130, column: 1, scope: !155)
!208 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 133, type: !28, isLocal: false, isDefinition: true, scopeLine: 133, isOptimized: false, unit: !0, variables: !2)
!209 = !DILocation(line: 134, column: 5, scope: !208)
!210 = !DILocation(line: 135, column: 2, scope: !208)
!211 = !DILocation(line: 136, column: 5, scope: !208)
