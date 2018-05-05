; ModuleID = './416_28.c'
source_filename = "./416_28.c"
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
@staticFive = internal global i32 5, align 4
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: nounwind uwtable
define i32 @globalReturnsTrue() #0 !dbg !26 {
entry:
  ret i32 1, !dbg !29
}

; Function Attrs: nounwind uwtable
define i32 @globalReturnsFalse() #0 !dbg !30 {
entry:
  ret i32 0, !dbg !31
}

; Function Attrs: nounwind uwtable
define i32 @globalReturnsTrueOrFalse() #0 !dbg !32 {
entry:
  %call = call i32 @rand() #4, !dbg !33
  %rem = srem i32 %call, 2, !dbg !34
  ret i32 %rem, !dbg !35
}

; Function Attrs: nounwind
declare i32 @rand() #1

; Function Attrs: nounwind uwtable
define void @printHexCharLine(i8 signext %charHex) #0 !dbg !36 {
entry:
  %charHex.addr = alloca i8, align 1
  store i8 %charHex, i8* %charHex.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %charHex.addr, metadata !40, metadata !41), !dbg !42
  %0 = load i8, i8* %charHex.addr, align 1, !dbg !43
  %conv = sext i8 %0 to i32, !dbg !44
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), i32 %conv), !dbg !45
  ret void, !dbg !46
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #2

declare i32 @printf(i8*, ...) #3

; Function Attrs: nounwind uwtable
define void @printLine(i8* %line) #0 !dbg !47 {
entry:
  %line.addr = alloca i8*, align 8
  store i8* %line, i8** %line.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %line.addr, metadata !52, metadata !41), !dbg !53
  %0 = load i8*, i8** %line.addr, align 8, !dbg !54
  %cmp = icmp ne i8* %0, null, !dbg !56
  br i1 %cmp, label %if.then, label %if.end, !dbg !57

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** %line.addr, align 8, !dbg !58
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i32 0, i32 0), i8* %1), !dbg !60
  br label %if.end, !dbg !61

if.end:                                           ; preds = %if.then, %entry
  ret void, !dbg !62
}

; Function Attrs: nounwind uwtable
define void @printIntLine(i32 %intNumber) #0 !dbg !63 {
entry:
  %intNumber.addr = alloca i32, align 4
  store i32 %intNumber, i32* %intNumber.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %intNumber.addr, metadata !66, metadata !41), !dbg !67
  %0 = load i32, i32* %intNumber.addr, align 4, !dbg !68
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), i32 %0), !dbg !69
  ret void, !dbg !70
}

; Function Attrs: nounwind uwtable
define void @printLongLine(i64 %longIntNumber) #0 !dbg !71 {
entry:
  %longIntNumber.addr = alloca i64, align 8
  store i64 %longIntNumber, i64* %longIntNumber.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %longIntNumber.addr, metadata !77, metadata !41), !dbg !78
  %0 = load i64, i64* %longIntNumber.addr, align 8, !dbg !79
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.2, i32 0, i32 0), i64 %0), !dbg !80
  ret void, !dbg !81
}

; Function Attrs: nounwind uwtable
define void @printStructLine(%struct._twoIntsStruct* %structTwoIntsStruct) #0 !dbg !82 {
entry:
  %structTwoIntsStruct.addr = alloca %struct._twoIntsStruct*, align 8
  store %struct._twoIntsStruct* %structTwoIntsStruct, %struct._twoIntsStruct** %structTwoIntsStruct.addr, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %structTwoIntsStruct.addr, metadata !87, metadata !41), !dbg !88
  %0 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %structTwoIntsStruct.addr, align 8, !dbg !89
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %0, i32 0, i32 0, !dbg !90
  %1 = load i32, i32* %intOne, align 4, !dbg !90
  %2 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %structTwoIntsStruct.addr, align 8, !dbg !91
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %2, i32 0, i32 1, !dbg !92
  %3 = load i32, i32* %intTwo, align 4, !dbg !92
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.3, i32 0, i32 0), i32 %1, i32 %3), !dbg !93
  ret void, !dbg !94
}

; Function Attrs: nounwind uwtable
define void @bad28() #0 !dbg !95 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !98, metadata !41), !dbg !99
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !100
  %0 = load i32, i32* @staticFive, align 4, !dbg !101
  %cmp = icmp eq i32 %0, 5, !dbg !103
  br i1 %cmp, label %if.then, label %if.end5, !dbg !104

if.then:                                          ; preds = %entry
  %call = call noalias i8* @malloc(i64 800) #4, !dbg !105
  %1 = bitcast i8* %call to %struct._twoIntsStruct*, !dbg !107
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %data, align 8, !dbg !108
  %2 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !109
  %cmp1 = icmp eq %struct._twoIntsStruct* %2, null, !dbg !111
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !112

if.then2:                                         ; preds = %if.then
  br label %if.end9, !dbg !113

if.end:                                           ; preds = %if.then
  call void @llvm.dbg.declare(metadata i64* %i, metadata !115, metadata !41), !dbg !120
  store i64 0, i64* %i, align 8, !dbg !121
  br label %for.cond, !dbg !123

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i64, i64* %i, align 8, !dbg !124
  %cmp3 = icmp ult i64 %3, 100, !dbg !127
  br i1 %cmp3, label %for.body, label %for.end, !dbg !128

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !129
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !131
  %arrayidx = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %5, i64 %4, !dbg !131
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !132
  store i32 1, i32* %intOne, align 4, !dbg !133
  %6 = load i64, i64* %i, align 8, !dbg !134
  %7 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !135
  %arrayidx4 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %7, i64 %6, !dbg !135
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx4, i32 0, i32 1, !dbg !136
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
  br label %if.end5, !dbg !146

if.end5:                                          ; preds = %for.end, %entry
  %11 = load i32, i32* @staticFive, align 4, !dbg !147
  %cmp6 = icmp eq i32 %11, 5, !dbg !149
  br i1 %cmp6, label %if.then7, label %if.end9, !dbg !150

if.then7:                                         ; preds = %if.end5
  %12 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !151
  %arrayidx8 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %12, i64 0, !dbg !151
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx8), !dbg !153
  br label %if.end9, !dbg !154

if.end9:                                          ; preds = %if.then2, %if.then7, %if.end5
  ret void, !dbg !155
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #1

; Function Attrs: nounwind
declare void @free(i8*) #1

; Function Attrs: nounwind uwtable
define void @good28() #0 !dbg !156 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !157, metadata !41), !dbg !158
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !159
  %0 = load i32, i32* @staticFive, align 4, !dbg !160
  %cmp = icmp eq i32 %0, 5, !dbg !162
  br i1 %cmp, label %if.then, label %if.end5, !dbg !163

if.then:                                          ; preds = %entry
  %call = call noalias i8* @malloc(i64 800) #4, !dbg !164
  %1 = bitcast i8* %call to %struct._twoIntsStruct*, !dbg !166
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %data, align 8, !dbg !167
  %2 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !168
  %cmp1 = icmp eq %struct._twoIntsStruct* %2, null, !dbg !170
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !171

if.then2:                                         ; preds = %if.then
  br label %if.end8, !dbg !172

if.end:                                           ; preds = %if.then
  call void @llvm.dbg.declare(metadata i64* %i, metadata !174, metadata !41), !dbg !176
  store i64 0, i64* %i, align 8, !dbg !177
  br label %for.cond, !dbg !179

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i64, i64* %i, align 8, !dbg !180
  %cmp3 = icmp ult i64 %3, 100, !dbg !183
  br i1 %cmp3, label %for.body, label %for.end, !dbg !184

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !185
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !187
  %arrayidx = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %5, i64 %4, !dbg !187
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !188
  store i32 1, i32* %intOne, align 4, !dbg !189
  %6 = load i64, i64* %i, align 8, !dbg !190
  %7 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !191
  %arrayidx4 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %7, i64 %6, !dbg !191
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx4, i32 0, i32 1, !dbg !192
  store i32 2, i32* %intTwo, align 4, !dbg !193
  br label %for.inc, !dbg !194

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !195
  %inc = add i64 %8, 1, !dbg !195
  store i64 %inc, i64* %i, align 8, !dbg !195
  br label %for.cond, !dbg !197, !llvm.loop !198

for.end:                                          ; preds = %for.cond
  %9 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !200
  %10 = bitcast %struct._twoIntsStruct* %9 to i8*, !dbg !200
  call void @free(i8* %10) #4, !dbg !201
  br label %if.end5, !dbg !202

if.end5:                                          ; preds = %for.end, %entry
  %11 = load i32, i32* @staticFive, align 4, !dbg !203
  %cmp6 = icmp ne i32 %11, 5, !dbg !205
  br i1 %cmp6, label %if.then7, label %if.else, !dbg !206

if.then7:                                         ; preds = %if.end5
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i32 0, i32 0)), !dbg !207
  br label %if.end8, !dbg !209

if.else:                                          ; preds = %if.end5
  br label %if.end8

if.end8:                                          ; preds = %if.then2, %if.else, %if.then7
  ret void, !dbg !210
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !211 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @good28(), !dbg !212
  call void @bad28(), !dbg !213
  ret i32 1, !dbg !214
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone }
attributes #3 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!23, !24}
!llvm.ident = !{!25}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (tags/RELEASE_390/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, globals: !13)
!1 = !DIFile(filename: "416_28.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/416")
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
!13 = !{!14, !17, !18, !19, !20, !21, !22}
!14 = distinct !DIGlobalVariable(name: "GLOBAL_CONST_TRUE", scope: !0, file: !15, line: 10, type: !16, isLocal: false, isDefinition: true, variable: i32* @GLOBAL_CONST_TRUE)
!15 = !DIFile(filename: "./416_28.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/416")
!16 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !4)
!17 = distinct !DIGlobalVariable(name: "GLOBAL_CONST_FALSE", scope: !0, file: !15, line: 11, type: !16, isLocal: false, isDefinition: true, variable: i32* @GLOBAL_CONST_FALSE)
!18 = distinct !DIGlobalVariable(name: "GLOBAL_CONST_FIVE", scope: !0, file: !15, line: 12, type: !16, isLocal: false, isDefinition: true, variable: i32* @GLOBAL_CONST_FIVE)
!19 = distinct !DIGlobalVariable(name: "globalTrue", scope: !0, file: !15, line: 14, type: !4, isLocal: false, isDefinition: true, variable: i32* @globalTrue)
!20 = distinct !DIGlobalVariable(name: "globalFalse", scope: !0, file: !15, line: 15, type: !4, isLocal: false, isDefinition: true, variable: i32* @globalFalse)
!21 = distinct !DIGlobalVariable(name: "globalFive", scope: !0, file: !15, line: 16, type: !4, isLocal: false, isDefinition: true, variable: i32* @globalFive)
!22 = distinct !DIGlobalVariable(name: "staticFive", scope: !0, file: !15, line: 61, type: !4, isLocal: true, isDefinition: true, variable: i32* @staticFive)
!23 = !{i32 2, !"Dwarf Version", i32 4}
!24 = !{i32 2, !"Debug Info Version", i32 3}
!25 = !{!"clang version 3.9.0 (tags/RELEASE_390/final)"}
!26 = distinct !DISubprogram(name: "globalReturnsTrue", scope: !15, file: !15, line: 18, type: !27, isLocal: false, isDefinition: true, scopeLine: 19, isOptimized: false, unit: !0, variables: !2)
!27 = !DISubroutineType(types: !28)
!28 = !{!4}
!29 = !DILocation(line: 20, column: 5, scope: !26)
!30 = distinct !DISubprogram(name: "globalReturnsFalse", scope: !15, file: !15, line: 23, type: !27, isLocal: false, isDefinition: true, scopeLine: 24, isOptimized: false, unit: !0, variables: !2)
!31 = !DILocation(line: 25, column: 5, scope: !30)
!32 = distinct !DISubprogram(name: "globalReturnsTrueOrFalse", scope: !15, file: !15, line: 28, type: !27, isLocal: false, isDefinition: true, scopeLine: 29, isOptimized: false, unit: !0, variables: !2)
!33 = !DILocation(line: 30, column: 13, scope: !32)
!34 = !DILocation(line: 30, column: 20, scope: !32)
!35 = !DILocation(line: 30, column: 5, scope: !32)
!36 = distinct !DISubprogram(name: "printHexCharLine", scope: !15, file: !15, line: 33, type: !37, isLocal: false, isDefinition: true, scopeLine: 34, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!37 = !DISubroutineType(types: !38)
!38 = !{null, !39}
!39 = !DIBasicType(name: "char", size: 8, align: 8, encoding: DW_ATE_signed_char)
!40 = !DILocalVariable(name: "charHex", arg: 1, scope: !36, file: !15, line: 33, type: !39)
!41 = !DIExpression()
!42 = !DILocation(line: 33, column: 29, scope: !36)
!43 = !DILocation(line: 35, column: 25, scope: !36)
!44 = !DILocation(line: 35, column: 20, scope: !36)
!45 = !DILocation(line: 35, column: 5, scope: !36)
!46 = !DILocation(line: 36, column: 1, scope: !36)
!47 = distinct !DISubprogram(name: "printLine", scope: !15, file: !15, line: 38, type: !48, isLocal: false, isDefinition: true, scopeLine: 39, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!48 = !DISubroutineType(types: !49)
!49 = !{null, !50}
!50 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !51, size: 64, align: 64)
!51 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !39)
!52 = !DILocalVariable(name: "line", arg: 1, scope: !47, file: !15, line: 38, type: !50)
!53 = !DILocation(line: 38, column: 30, scope: !47)
!54 = !DILocation(line: 40, column: 8, scope: !55)
!55 = distinct !DILexicalBlock(scope: !47, file: !15, line: 40, column: 8)
!56 = !DILocation(line: 40, column: 13, scope: !55)
!57 = !DILocation(line: 40, column: 8, scope: !47)
!58 = !DILocation(line: 42, column: 24, scope: !59)
!59 = distinct !DILexicalBlock(scope: !55, file: !15, line: 41, column: 5)
!60 = !DILocation(line: 42, column: 9, scope: !59)
!61 = !DILocation(line: 43, column: 5, scope: !59)
!62 = !DILocation(line: 44, column: 1, scope: !47)
!63 = distinct !DISubprogram(name: "printIntLine", scope: !15, file: !15, line: 46, type: !64, isLocal: false, isDefinition: true, scopeLine: 47, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!64 = !DISubroutineType(types: !65)
!65 = !{null, !4}
!66 = !DILocalVariable(name: "intNumber", arg: 1, scope: !63, file: !15, line: 46, type: !4)
!67 = !DILocation(line: 46, column: 24, scope: !63)
!68 = !DILocation(line: 48, column: 20, scope: !63)
!69 = !DILocation(line: 48, column: 5, scope: !63)
!70 = !DILocation(line: 49, column: 1, scope: !63)
!71 = distinct !DISubprogram(name: "printLongLine", scope: !15, file: !15, line: 51, type: !72, isLocal: false, isDefinition: true, scopeLine: 52, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!72 = !DISubroutineType(types: !73)
!73 = !{null, !74}
!74 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !75, line: 197, baseType: !76)
!75 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/sys/types.h", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/416")
!76 = !DIBasicType(name: "long int", size: 64, align: 64, encoding: DW_ATE_signed)
!77 = !DILocalVariable(name: "longIntNumber", arg: 1, scope: !71, file: !15, line: 51, type: !74)
!78 = !DILocation(line: 51, column: 29, scope: !71)
!79 = !DILocation(line: 53, column: 21, scope: !71)
!80 = !DILocation(line: 53, column: 5, scope: !71)
!81 = !DILocation(line: 54, column: 1, scope: !71)
!82 = distinct !DISubprogram(name: "printStructLine", scope: !15, file: !15, line: 56, type: !83, isLocal: false, isDefinition: true, scopeLine: 57, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!83 = !DISubroutineType(types: !84)
!84 = !{null, !85}
!85 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !86, size: 64, align: 64)
!86 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !7)
!87 = !DILocalVariable(name: "structTwoIntsStruct", arg: 1, scope: !82, file: !15, line: 56, type: !85)
!88 = !DILocation(line: 56, column: 45, scope: !82)
!89 = !DILocation(line: 58, column: 26, scope: !82)
!90 = !DILocation(line: 58, column: 47, scope: !82)
!91 = !DILocation(line: 58, column: 55, scope: !82)
!92 = !DILocation(line: 58, column: 76, scope: !82)
!93 = !DILocation(line: 58, column: 5, scope: !82)
!94 = !DILocation(line: 59, column: 1, scope: !82)
!95 = distinct !DISubprogram(name: "bad28", scope: !15, file: !15, line: 65, type: !96, isLocal: false, isDefinition: true, scopeLine: 66, isOptimized: false, unit: !0, variables: !2)
!96 = !DISubroutineType(types: !97)
!97 = !{null}
!98 = !DILocalVariable(name: "data", scope: !95, file: !15, line: 67, type: !6)
!99 = !DILocation(line: 67, column: 21, scope: !95)
!100 = !DILocation(line: 69, column: 10, scope: !95)
!101 = !DILocation(line: 70, column: 8, scope: !102)
!102 = distinct !DILexicalBlock(scope: !95, file: !15, line: 70, column: 8)
!103 = !DILocation(line: 70, column: 18, scope: !102)
!104 = !DILocation(line: 70, column: 8, scope: !95)
!105 = !DILocation(line: 72, column: 33, scope: !106)
!106 = distinct !DILexicalBlock(scope: !102, file: !15, line: 71, column: 5)
!107 = !DILocation(line: 72, column: 16, scope: !106)
!108 = !DILocation(line: 72, column: 14, scope: !106)
!109 = !DILocation(line: 73, column: 13, scope: !110)
!110 = distinct !DILexicalBlock(scope: !106, file: !15, line: 73, column: 13)
!111 = !DILocation(line: 73, column: 18, scope: !110)
!112 = !DILocation(line: 73, column: 13, scope: !106)
!113 = !DILocation(line: 73, column: 27, scope: !114)
!114 = !DILexicalBlockFile(scope: !110, file: !15, discriminator: 1)
!115 = !DILocalVariable(name: "i", scope: !116, file: !15, line: 75, type: !117)
!116 = distinct !DILexicalBlock(scope: !106, file: !15, line: 74, column: 9)
!117 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !118, line: 62, baseType: !119)
!118 = !DIFile(filename: "/usr/local/bin/../lib/clang/3.9.0/include/stddef.h", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/416")
!119 = !DIBasicType(name: "long unsigned int", size: 64, align: 64, encoding: DW_ATE_unsigned)
!120 = !DILocation(line: 75, column: 20, scope: !116)
!121 = !DILocation(line: 76, column: 19, scope: !122)
!122 = distinct !DILexicalBlock(scope: !116, file: !15, line: 76, column: 13)
!123 = !DILocation(line: 76, column: 17, scope: !122)
!124 = !DILocation(line: 76, column: 24, scope: !125)
!125 = !DILexicalBlockFile(scope: !126, file: !15, discriminator: 1)
!126 = distinct !DILexicalBlock(scope: !122, file: !15, line: 76, column: 13)
!127 = !DILocation(line: 76, column: 26, scope: !125)
!128 = !DILocation(line: 76, column: 13, scope: !125)
!129 = !DILocation(line: 78, column: 22, scope: !130)
!130 = distinct !DILexicalBlock(scope: !126, file: !15, line: 77, column: 13)
!131 = !DILocation(line: 78, column: 17, scope: !130)
!132 = !DILocation(line: 78, column: 25, scope: !130)
!133 = !DILocation(line: 78, column: 32, scope: !130)
!134 = !DILocation(line: 79, column: 22, scope: !130)
!135 = !DILocation(line: 79, column: 17, scope: !130)
!136 = !DILocation(line: 79, column: 25, scope: !130)
!137 = !DILocation(line: 79, column: 32, scope: !130)
!138 = !DILocation(line: 80, column: 13, scope: !130)
!139 = !DILocation(line: 76, column: 34, scope: !140)
!140 = !DILexicalBlockFile(scope: !126, file: !15, discriminator: 2)
!141 = !DILocation(line: 76, column: 13, scope: !140)
!142 = distinct !{!142, !143}
!143 = !DILocation(line: 76, column: 13, scope: !116)
!144 = !DILocation(line: 83, column: 14, scope: !106)
!145 = !DILocation(line: 83, column: 9, scope: !106)
!146 = !DILocation(line: 84, column: 5, scope: !106)
!147 = !DILocation(line: 85, column: 8, scope: !148)
!148 = distinct !DILexicalBlock(scope: !95, file: !15, line: 85, column: 8)
!149 = !DILocation(line: 85, column: 18, scope: !148)
!150 = !DILocation(line: 85, column: 8, scope: !95)
!151 = !DILocation(line: 88, column: 26, scope: !152)
!152 = distinct !DILexicalBlock(scope: !148, file: !15, line: 86, column: 5)
!153 = !DILocation(line: 88, column: 9, scope: !152)
!154 = !DILocation(line: 90, column: 5, scope: !152)
!155 = !DILocation(line: 91, column: 1, scope: !95)
!156 = distinct !DISubprogram(name: "good28", scope: !15, file: !15, line: 97, type: !96, isLocal: false, isDefinition: true, scopeLine: 98, isOptimized: false, unit: !0, variables: !2)
!157 = !DILocalVariable(name: "data", scope: !156, file: !15, line: 99, type: !6)
!158 = !DILocation(line: 99, column: 21, scope: !156)
!159 = !DILocation(line: 101, column: 10, scope: !156)
!160 = !DILocation(line: 102, column: 8, scope: !161)
!161 = distinct !DILexicalBlock(scope: !156, file: !15, line: 102, column: 8)
!162 = !DILocation(line: 102, column: 18, scope: !161)
!163 = !DILocation(line: 102, column: 8, scope: !156)
!164 = !DILocation(line: 104, column: 33, scope: !165)
!165 = distinct !DILexicalBlock(scope: !161, file: !15, line: 103, column: 5)
!166 = !DILocation(line: 104, column: 16, scope: !165)
!167 = !DILocation(line: 104, column: 14, scope: !165)
!168 = !DILocation(line: 105, column: 13, scope: !169)
!169 = distinct !DILexicalBlock(scope: !165, file: !15, line: 105, column: 13)
!170 = !DILocation(line: 105, column: 18, scope: !169)
!171 = !DILocation(line: 105, column: 13, scope: !165)
!172 = !DILocation(line: 105, column: 27, scope: !173)
!173 = !DILexicalBlockFile(scope: !169, file: !15, discriminator: 1)
!174 = !DILocalVariable(name: "i", scope: !175, file: !15, line: 107, type: !117)
!175 = distinct !DILexicalBlock(scope: !165, file: !15, line: 106, column: 9)
!176 = !DILocation(line: 107, column: 20, scope: !175)
!177 = !DILocation(line: 108, column: 19, scope: !178)
!178 = distinct !DILexicalBlock(scope: !175, file: !15, line: 108, column: 13)
!179 = !DILocation(line: 108, column: 17, scope: !178)
!180 = !DILocation(line: 108, column: 24, scope: !181)
!181 = !DILexicalBlockFile(scope: !182, file: !15, discriminator: 1)
!182 = distinct !DILexicalBlock(scope: !178, file: !15, line: 108, column: 13)
!183 = !DILocation(line: 108, column: 26, scope: !181)
!184 = !DILocation(line: 108, column: 13, scope: !181)
!185 = !DILocation(line: 110, column: 22, scope: !186)
!186 = distinct !DILexicalBlock(scope: !182, file: !15, line: 109, column: 13)
!187 = !DILocation(line: 110, column: 17, scope: !186)
!188 = !DILocation(line: 110, column: 25, scope: !186)
!189 = !DILocation(line: 110, column: 32, scope: !186)
!190 = !DILocation(line: 111, column: 22, scope: !186)
!191 = !DILocation(line: 111, column: 17, scope: !186)
!192 = !DILocation(line: 111, column: 25, scope: !186)
!193 = !DILocation(line: 111, column: 32, scope: !186)
!194 = !DILocation(line: 112, column: 13, scope: !186)
!195 = !DILocation(line: 108, column: 34, scope: !196)
!196 = !DILexicalBlockFile(scope: !182, file: !15, discriminator: 2)
!197 = !DILocation(line: 108, column: 13, scope: !196)
!198 = distinct !{!198, !199}
!199 = !DILocation(line: 108, column: 13, scope: !175)
!200 = !DILocation(line: 115, column: 14, scope: !165)
!201 = !DILocation(line: 115, column: 9, scope: !165)
!202 = !DILocation(line: 116, column: 5, scope: !165)
!203 = !DILocation(line: 117, column: 8, scope: !204)
!204 = distinct !DILexicalBlock(scope: !156, file: !15, line: 117, column: 8)
!205 = !DILocation(line: 117, column: 18, scope: !204)
!206 = !DILocation(line: 117, column: 8, scope: !156)
!207 = !DILocation(line: 120, column: 9, scope: !208)
!208 = distinct !DILexicalBlock(scope: !204, file: !15, line: 118, column: 5)
!209 = !DILocation(line: 121, column: 5, scope: !208)
!210 = !DILocation(line: 129, column: 1, scope: !156)
!211 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 132, type: !27, isLocal: false, isDefinition: true, scopeLine: 132, isOptimized: false, unit: !0, variables: !2)
!212 = !DILocation(line: 133, column: 5, scope: !211)
!213 = !DILocation(line: 134, column: 2, scope: !211)
!214 = !DILocation(line: 135, column: 5, scope: !211)
