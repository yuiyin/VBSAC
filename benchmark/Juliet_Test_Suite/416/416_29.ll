; ModuleID = './416_29.c'
source_filename = "./416_29.c"
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
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: nounwind uwtable
define i32 @globalReturnsTrue() #0 !dbg !25 {
entry:
  ret i32 1, !dbg !28
}

; Function Attrs: nounwind uwtable
define i32 @globalReturnsFalse() #0 !dbg !29 {
entry:
  ret i32 0, !dbg !30
}

; Function Attrs: nounwind uwtable
define i32 @globalReturnsTrueOrFalse() #0 !dbg !31 {
entry:
  %call = call i32 @rand() #4, !dbg !32
  %rem = srem i32 %call, 2, !dbg !33
  ret i32 %rem, !dbg !34
}

; Function Attrs: nounwind
declare i32 @rand() #1

; Function Attrs: nounwind uwtable
define void @printHexCharLine(i8 signext %charHex) #0 !dbg !35 {
entry:
  %charHex.addr = alloca i8, align 1
  store i8 %charHex, i8* %charHex.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %charHex.addr, metadata !39, metadata !40), !dbg !41
  %0 = load i8, i8* %charHex.addr, align 1, !dbg !42
  %conv = sext i8 %0 to i32, !dbg !43
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), i32 %conv), !dbg !44
  ret void, !dbg !45
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #2

declare i32 @printf(i8*, ...) #3

; Function Attrs: nounwind uwtable
define void @printLine(i8* %line) #0 !dbg !46 {
entry:
  %line.addr = alloca i8*, align 8
  store i8* %line, i8** %line.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %line.addr, metadata !51, metadata !40), !dbg !52
  %0 = load i8*, i8** %line.addr, align 8, !dbg !53
  %cmp = icmp ne i8* %0, null, !dbg !55
  br i1 %cmp, label %if.then, label %if.end, !dbg !56

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** %line.addr, align 8, !dbg !57
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i32 0, i32 0), i8* %1), !dbg !59
  br label %if.end, !dbg !60

if.end:                                           ; preds = %if.then, %entry
  ret void, !dbg !61
}

; Function Attrs: nounwind uwtable
define void @printIntLine(i32 %intNumber) #0 !dbg !62 {
entry:
  %intNumber.addr = alloca i32, align 4
  store i32 %intNumber, i32* %intNumber.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %intNumber.addr, metadata !65, metadata !40), !dbg !66
  %0 = load i32, i32* %intNumber.addr, align 4, !dbg !67
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), i32 %0), !dbg !68
  ret void, !dbg !69
}

; Function Attrs: nounwind uwtable
define void @printLongLine(i64 %longIntNumber) #0 !dbg !70 {
entry:
  %longIntNumber.addr = alloca i64, align 8
  store i64 %longIntNumber, i64* %longIntNumber.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %longIntNumber.addr, metadata !76, metadata !40), !dbg !77
  %0 = load i64, i64* %longIntNumber.addr, align 8, !dbg !78
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.2, i32 0, i32 0), i64 %0), !dbg !79
  ret void, !dbg !80
}

; Function Attrs: nounwind uwtable
define void @printStructLine(%struct._twoIntsStruct* %structTwoIntsStruct) #0 !dbg !81 {
entry:
  %structTwoIntsStruct.addr = alloca %struct._twoIntsStruct*, align 8
  store %struct._twoIntsStruct* %structTwoIntsStruct, %struct._twoIntsStruct** %structTwoIntsStruct.addr, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %structTwoIntsStruct.addr, metadata !86, metadata !40), !dbg !87
  %0 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %structTwoIntsStruct.addr, align 8, !dbg !88
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %0, i32 0, i32 0, !dbg !89
  %1 = load i32, i32* %intOne, align 4, !dbg !89
  %2 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %structTwoIntsStruct.addr, align 8, !dbg !90
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %2, i32 0, i32 1, !dbg !91
  %3 = load i32, i32* %intTwo, align 4, !dbg !91
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.3, i32 0, i32 0), i32 %1, i32 %3), !dbg !92
  ret void, !dbg !93
}

; Function Attrs: nounwind uwtable
define void @bad29() #0 !dbg !94 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !97, metadata !40), !dbg !98
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !99
  %call = call i32 @staticReturnsTrue(), !dbg !100
  %tobool = icmp ne i32 %call, 0, !dbg !100
  br i1 %tobool, label %if.then, label %if.end5, !dbg !102

if.then:                                          ; preds = %entry
  %call1 = call noalias i8* @malloc(i64 800) #4, !dbg !103
  %0 = bitcast i8* %call1 to %struct._twoIntsStruct*, !dbg !105
  store %struct._twoIntsStruct* %0, %struct._twoIntsStruct** %data, align 8, !dbg !106
  %1 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !107
  %cmp = icmp eq %struct._twoIntsStruct* %1, null, !dbg !109
  br i1 %cmp, label %if.then2, label %if.end, !dbg !110

if.then2:                                         ; preds = %if.then
  br label %if.end10, !dbg !111

if.end:                                           ; preds = %if.then
  call void @llvm.dbg.declare(metadata i64* %i, metadata !113, metadata !40), !dbg !118
  store i64 0, i64* %i, align 8, !dbg !119
  br label %for.cond, !dbg !121

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !122
  %cmp3 = icmp ult i64 %2, 100, !dbg !125
  br i1 %cmp3, label %for.body, label %for.end, !dbg !126

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !127
  %4 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !129
  %arrayidx = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %4, i64 %3, !dbg !129
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !130
  store i32 1, i32* %intOne, align 4, !dbg !131
  %5 = load i64, i64* %i, align 8, !dbg !132
  %6 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !133
  %arrayidx4 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %6, i64 %5, !dbg !133
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx4, i32 0, i32 1, !dbg !134
  store i32 2, i32* %intTwo, align 4, !dbg !135
  br label %for.inc, !dbg !136

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !137
  %inc = add i64 %7, 1, !dbg !137
  store i64 %inc, i64* %i, align 8, !dbg !137
  br label %for.cond, !dbg !139, !llvm.loop !140

for.end:                                          ; preds = %for.cond
  %8 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !142
  %9 = bitcast %struct._twoIntsStruct* %8 to i8*, !dbg !142
  call void @free(i8* %9) #4, !dbg !143
  br label %if.end5, !dbg !144

if.end5:                                          ; preds = %for.end, %entry
  %call6 = call i32 @staticReturnsTrue(), !dbg !145
  %tobool7 = icmp ne i32 %call6, 0, !dbg !145
  br i1 %tobool7, label %if.then8, label %if.end10, !dbg !147

if.then8:                                         ; preds = %if.end5
  %10 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !148
  %arrayidx9 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %10, i64 0, !dbg !148
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx9), !dbg !150
  br label %if.end10, !dbg !151

if.end10:                                         ; preds = %if.then2, %if.then8, %if.end5
  ret void, !dbg !152
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #1

; Function Attrs: nounwind
declare void @free(i8*) #1

; Function Attrs: nounwind uwtable
define void @good29() #0 !dbg !153 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !154, metadata !40), !dbg !155
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !156
  %call = call i32 @staticReturnsTrue(), !dbg !157
  %tobool = icmp ne i32 %call, 0, !dbg !157
  br i1 %tobool, label %if.then, label %if.end5, !dbg !159

if.then:                                          ; preds = %entry
  %call1 = call noalias i8* @malloc(i64 800) #4, !dbg !160
  %0 = bitcast i8* %call1 to %struct._twoIntsStruct*, !dbg !162
  store %struct._twoIntsStruct* %0, %struct._twoIntsStruct** %data, align 8, !dbg !163
  %1 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !164
  %cmp = icmp eq %struct._twoIntsStruct* %1, null, !dbg !166
  br i1 %cmp, label %if.then2, label %if.end, !dbg !167

if.then2:                                         ; preds = %if.then
  br label %if.end9, !dbg !168

if.end:                                           ; preds = %if.then
  call void @llvm.dbg.declare(metadata i64* %i, metadata !170, metadata !40), !dbg !172
  store i64 0, i64* %i, align 8, !dbg !173
  br label %for.cond, !dbg !175

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !176
  %cmp3 = icmp ult i64 %2, 100, !dbg !179
  br i1 %cmp3, label %for.body, label %for.end, !dbg !180

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !181
  %4 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !183
  %arrayidx = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %4, i64 %3, !dbg !183
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !184
  store i32 1, i32* %intOne, align 4, !dbg !185
  %5 = load i64, i64* %i, align 8, !dbg !186
  %6 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !187
  %arrayidx4 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %6, i64 %5, !dbg !187
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx4, i32 0, i32 1, !dbg !188
  store i32 2, i32* %intTwo, align 4, !dbg !189
  br label %for.inc, !dbg !190

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !191
  %inc = add i64 %7, 1, !dbg !191
  store i64 %inc, i64* %i, align 8, !dbg !191
  br label %for.cond, !dbg !193, !llvm.loop !194

for.end:                                          ; preds = %for.cond
  %8 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !196
  %9 = bitcast %struct._twoIntsStruct* %8 to i8*, !dbg !196
  call void @free(i8* %9) #4, !dbg !197
  br label %if.end5, !dbg !198

if.end5:                                          ; preds = %for.end, %entry
  %call6 = call i32 @staticReturnsFalse(), !dbg !199
  %tobool7 = icmp ne i32 %call6, 0, !dbg !199
  br i1 %tobool7, label %if.then8, label %if.else, !dbg !201

if.then8:                                         ; preds = %if.end5
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i32 0, i32 0)), !dbg !202
  br label %if.end9, !dbg !204

if.else:                                          ; preds = %if.end5
  br label %if.end9

if.end9:                                          ; preds = %if.then2, %if.else, %if.then8
  ret void, !dbg !205
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !206 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @good29(), !dbg !207
  call void @bad29(), !dbg !208
  ret i32 1, !dbg !209
}

; Function Attrs: nounwind uwtable
define internal i32 @staticReturnsTrue() #0 !dbg !210 {
entry:
  ret i32 1, !dbg !211
}

; Function Attrs: nounwind uwtable
define internal i32 @staticReturnsFalse() #0 !dbg !212 {
entry:
  ret i32 0, !dbg !213
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone }
attributes #3 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!22, !23}
!llvm.ident = !{!24}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (tags/RELEASE_390/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, globals: !13)
!1 = !DIFile(filename: "416_29.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/416")
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
!13 = !{!14, !17, !18, !19, !20, !21}
!14 = distinct !DIGlobalVariable(name: "GLOBAL_CONST_TRUE", scope: !0, file: !15, line: 10, type: !16, isLocal: false, isDefinition: true, variable: i32* @GLOBAL_CONST_TRUE)
!15 = !DIFile(filename: "./416_29.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/416")
!16 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !4)
!17 = distinct !DIGlobalVariable(name: "GLOBAL_CONST_FALSE", scope: !0, file: !15, line: 11, type: !16, isLocal: false, isDefinition: true, variable: i32* @GLOBAL_CONST_FALSE)
!18 = distinct !DIGlobalVariable(name: "GLOBAL_CONST_FIVE", scope: !0, file: !15, line: 12, type: !16, isLocal: false, isDefinition: true, variable: i32* @GLOBAL_CONST_FIVE)
!19 = distinct !DIGlobalVariable(name: "globalTrue", scope: !0, file: !15, line: 14, type: !4, isLocal: false, isDefinition: true, variable: i32* @globalTrue)
!20 = distinct !DIGlobalVariable(name: "globalFalse", scope: !0, file: !15, line: 15, type: !4, isLocal: false, isDefinition: true, variable: i32* @globalFalse)
!21 = distinct !DIGlobalVariable(name: "globalFive", scope: !0, file: !15, line: 16, type: !4, isLocal: false, isDefinition: true, variable: i32* @globalFive)
!22 = !{i32 2, !"Dwarf Version", i32 4}
!23 = !{i32 2, !"Debug Info Version", i32 3}
!24 = !{!"clang version 3.9.0 (tags/RELEASE_390/final)"}
!25 = distinct !DISubprogram(name: "globalReturnsTrue", scope: !15, file: !15, line: 18, type: !26, isLocal: false, isDefinition: true, scopeLine: 19, isOptimized: false, unit: !0, variables: !2)
!26 = !DISubroutineType(types: !27)
!27 = !{!4}
!28 = !DILocation(line: 20, column: 5, scope: !25)
!29 = distinct !DISubprogram(name: "globalReturnsFalse", scope: !15, file: !15, line: 23, type: !26, isLocal: false, isDefinition: true, scopeLine: 24, isOptimized: false, unit: !0, variables: !2)
!30 = !DILocation(line: 25, column: 5, scope: !29)
!31 = distinct !DISubprogram(name: "globalReturnsTrueOrFalse", scope: !15, file: !15, line: 28, type: !26, isLocal: false, isDefinition: true, scopeLine: 29, isOptimized: false, unit: !0, variables: !2)
!32 = !DILocation(line: 30, column: 13, scope: !31)
!33 = !DILocation(line: 30, column: 20, scope: !31)
!34 = !DILocation(line: 30, column: 5, scope: !31)
!35 = distinct !DISubprogram(name: "printHexCharLine", scope: !15, file: !15, line: 33, type: !36, isLocal: false, isDefinition: true, scopeLine: 34, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!36 = !DISubroutineType(types: !37)
!37 = !{null, !38}
!38 = !DIBasicType(name: "char", size: 8, align: 8, encoding: DW_ATE_signed_char)
!39 = !DILocalVariable(name: "charHex", arg: 1, scope: !35, file: !15, line: 33, type: !38)
!40 = !DIExpression()
!41 = !DILocation(line: 33, column: 29, scope: !35)
!42 = !DILocation(line: 35, column: 25, scope: !35)
!43 = !DILocation(line: 35, column: 20, scope: !35)
!44 = !DILocation(line: 35, column: 5, scope: !35)
!45 = !DILocation(line: 36, column: 1, scope: !35)
!46 = distinct !DISubprogram(name: "printLine", scope: !15, file: !15, line: 38, type: !47, isLocal: false, isDefinition: true, scopeLine: 39, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!47 = !DISubroutineType(types: !48)
!48 = !{null, !49}
!49 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !50, size: 64, align: 64)
!50 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !38)
!51 = !DILocalVariable(name: "line", arg: 1, scope: !46, file: !15, line: 38, type: !49)
!52 = !DILocation(line: 38, column: 30, scope: !46)
!53 = !DILocation(line: 40, column: 8, scope: !54)
!54 = distinct !DILexicalBlock(scope: !46, file: !15, line: 40, column: 8)
!55 = !DILocation(line: 40, column: 13, scope: !54)
!56 = !DILocation(line: 40, column: 8, scope: !46)
!57 = !DILocation(line: 42, column: 24, scope: !58)
!58 = distinct !DILexicalBlock(scope: !54, file: !15, line: 41, column: 5)
!59 = !DILocation(line: 42, column: 9, scope: !58)
!60 = !DILocation(line: 43, column: 5, scope: !58)
!61 = !DILocation(line: 44, column: 1, scope: !46)
!62 = distinct !DISubprogram(name: "printIntLine", scope: !15, file: !15, line: 46, type: !63, isLocal: false, isDefinition: true, scopeLine: 47, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!63 = !DISubroutineType(types: !64)
!64 = !{null, !4}
!65 = !DILocalVariable(name: "intNumber", arg: 1, scope: !62, file: !15, line: 46, type: !4)
!66 = !DILocation(line: 46, column: 24, scope: !62)
!67 = !DILocation(line: 48, column: 20, scope: !62)
!68 = !DILocation(line: 48, column: 5, scope: !62)
!69 = !DILocation(line: 49, column: 1, scope: !62)
!70 = distinct !DISubprogram(name: "printLongLine", scope: !15, file: !15, line: 51, type: !71, isLocal: false, isDefinition: true, scopeLine: 52, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!71 = !DISubroutineType(types: !72)
!72 = !{null, !73}
!73 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !74, line: 197, baseType: !75)
!74 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/sys/types.h", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/416")
!75 = !DIBasicType(name: "long int", size: 64, align: 64, encoding: DW_ATE_signed)
!76 = !DILocalVariable(name: "longIntNumber", arg: 1, scope: !70, file: !15, line: 51, type: !73)
!77 = !DILocation(line: 51, column: 29, scope: !70)
!78 = !DILocation(line: 53, column: 21, scope: !70)
!79 = !DILocation(line: 53, column: 5, scope: !70)
!80 = !DILocation(line: 54, column: 1, scope: !70)
!81 = distinct !DISubprogram(name: "printStructLine", scope: !15, file: !15, line: 67, type: !82, isLocal: false, isDefinition: true, scopeLine: 68, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!82 = !DISubroutineType(types: !83)
!83 = !{null, !84}
!84 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !85, size: 64, align: 64)
!85 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !7)
!86 = !DILocalVariable(name: "structTwoIntsStruct", arg: 1, scope: !81, file: !15, line: 67, type: !84)
!87 = !DILocation(line: 67, column: 45, scope: !81)
!88 = !DILocation(line: 69, column: 26, scope: !81)
!89 = !DILocation(line: 69, column: 47, scope: !81)
!90 = !DILocation(line: 69, column: 55, scope: !81)
!91 = !DILocation(line: 69, column: 76, scope: !81)
!92 = !DILocation(line: 69, column: 5, scope: !81)
!93 = !DILocation(line: 70, column: 1, scope: !81)
!94 = distinct !DISubprogram(name: "bad29", scope: !15, file: !15, line: 74, type: !95, isLocal: false, isDefinition: true, scopeLine: 75, isOptimized: false, unit: !0, variables: !2)
!95 = !DISubroutineType(types: !96)
!96 = !{null}
!97 = !DILocalVariable(name: "data", scope: !94, file: !15, line: 76, type: !6)
!98 = !DILocation(line: 76, column: 21, scope: !94)
!99 = !DILocation(line: 78, column: 10, scope: !94)
!100 = !DILocation(line: 79, column: 8, scope: !101)
!101 = distinct !DILexicalBlock(scope: !94, file: !15, line: 79, column: 8)
!102 = !DILocation(line: 79, column: 8, scope: !94)
!103 = !DILocation(line: 81, column: 33, scope: !104)
!104 = distinct !DILexicalBlock(scope: !101, file: !15, line: 80, column: 5)
!105 = !DILocation(line: 81, column: 16, scope: !104)
!106 = !DILocation(line: 81, column: 14, scope: !104)
!107 = !DILocation(line: 82, column: 13, scope: !108)
!108 = distinct !DILexicalBlock(scope: !104, file: !15, line: 82, column: 13)
!109 = !DILocation(line: 82, column: 18, scope: !108)
!110 = !DILocation(line: 82, column: 13, scope: !104)
!111 = !DILocation(line: 82, column: 27, scope: !112)
!112 = !DILexicalBlockFile(scope: !108, file: !15, discriminator: 1)
!113 = !DILocalVariable(name: "i", scope: !114, file: !15, line: 84, type: !115)
!114 = distinct !DILexicalBlock(scope: !104, file: !15, line: 83, column: 9)
!115 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !116, line: 62, baseType: !117)
!116 = !DIFile(filename: "/usr/local/bin/../lib/clang/3.9.0/include/stddef.h", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/416")
!117 = !DIBasicType(name: "long unsigned int", size: 64, align: 64, encoding: DW_ATE_unsigned)
!118 = !DILocation(line: 84, column: 20, scope: !114)
!119 = !DILocation(line: 85, column: 19, scope: !120)
!120 = distinct !DILexicalBlock(scope: !114, file: !15, line: 85, column: 13)
!121 = !DILocation(line: 85, column: 17, scope: !120)
!122 = !DILocation(line: 85, column: 24, scope: !123)
!123 = !DILexicalBlockFile(scope: !124, file: !15, discriminator: 1)
!124 = distinct !DILexicalBlock(scope: !120, file: !15, line: 85, column: 13)
!125 = !DILocation(line: 85, column: 26, scope: !123)
!126 = !DILocation(line: 85, column: 13, scope: !123)
!127 = !DILocation(line: 87, column: 22, scope: !128)
!128 = distinct !DILexicalBlock(scope: !124, file: !15, line: 86, column: 13)
!129 = !DILocation(line: 87, column: 17, scope: !128)
!130 = !DILocation(line: 87, column: 25, scope: !128)
!131 = !DILocation(line: 87, column: 32, scope: !128)
!132 = !DILocation(line: 88, column: 22, scope: !128)
!133 = !DILocation(line: 88, column: 17, scope: !128)
!134 = !DILocation(line: 88, column: 25, scope: !128)
!135 = !DILocation(line: 88, column: 32, scope: !128)
!136 = !DILocation(line: 89, column: 13, scope: !128)
!137 = !DILocation(line: 85, column: 34, scope: !138)
!138 = !DILexicalBlockFile(scope: !124, file: !15, discriminator: 2)
!139 = !DILocation(line: 85, column: 13, scope: !138)
!140 = distinct !{!140, !141}
!141 = !DILocation(line: 85, column: 13, scope: !114)
!142 = !DILocation(line: 92, column: 14, scope: !104)
!143 = !DILocation(line: 92, column: 9, scope: !104)
!144 = !DILocation(line: 93, column: 5, scope: !104)
!145 = !DILocation(line: 94, column: 8, scope: !146)
!146 = distinct !DILexicalBlock(scope: !94, file: !15, line: 94, column: 8)
!147 = !DILocation(line: 94, column: 8, scope: !94)
!148 = !DILocation(line: 97, column: 26, scope: !149)
!149 = distinct !DILexicalBlock(scope: !146, file: !15, line: 95, column: 5)
!150 = !DILocation(line: 97, column: 9, scope: !149)
!151 = !DILocation(line: 99, column: 5, scope: !149)
!152 = !DILocation(line: 100, column: 1, scope: !94)
!153 = distinct !DISubprogram(name: "good29", scope: !15, file: !15, line: 106, type: !95, isLocal: false, isDefinition: true, scopeLine: 107, isOptimized: false, unit: !0, variables: !2)
!154 = !DILocalVariable(name: "data", scope: !153, file: !15, line: 108, type: !6)
!155 = !DILocation(line: 108, column: 21, scope: !153)
!156 = !DILocation(line: 110, column: 10, scope: !153)
!157 = !DILocation(line: 111, column: 8, scope: !158)
!158 = distinct !DILexicalBlock(scope: !153, file: !15, line: 111, column: 8)
!159 = !DILocation(line: 111, column: 8, scope: !153)
!160 = !DILocation(line: 113, column: 33, scope: !161)
!161 = distinct !DILexicalBlock(scope: !158, file: !15, line: 112, column: 5)
!162 = !DILocation(line: 113, column: 16, scope: !161)
!163 = !DILocation(line: 113, column: 14, scope: !161)
!164 = !DILocation(line: 114, column: 13, scope: !165)
!165 = distinct !DILexicalBlock(scope: !161, file: !15, line: 114, column: 13)
!166 = !DILocation(line: 114, column: 18, scope: !165)
!167 = !DILocation(line: 114, column: 13, scope: !161)
!168 = !DILocation(line: 114, column: 27, scope: !169)
!169 = !DILexicalBlockFile(scope: !165, file: !15, discriminator: 1)
!170 = !DILocalVariable(name: "i", scope: !171, file: !15, line: 116, type: !115)
!171 = distinct !DILexicalBlock(scope: !161, file: !15, line: 115, column: 9)
!172 = !DILocation(line: 116, column: 20, scope: !171)
!173 = !DILocation(line: 117, column: 19, scope: !174)
!174 = distinct !DILexicalBlock(scope: !171, file: !15, line: 117, column: 13)
!175 = !DILocation(line: 117, column: 17, scope: !174)
!176 = !DILocation(line: 117, column: 24, scope: !177)
!177 = !DILexicalBlockFile(scope: !178, file: !15, discriminator: 1)
!178 = distinct !DILexicalBlock(scope: !174, file: !15, line: 117, column: 13)
!179 = !DILocation(line: 117, column: 26, scope: !177)
!180 = !DILocation(line: 117, column: 13, scope: !177)
!181 = !DILocation(line: 119, column: 22, scope: !182)
!182 = distinct !DILexicalBlock(scope: !178, file: !15, line: 118, column: 13)
!183 = !DILocation(line: 119, column: 17, scope: !182)
!184 = !DILocation(line: 119, column: 25, scope: !182)
!185 = !DILocation(line: 119, column: 32, scope: !182)
!186 = !DILocation(line: 120, column: 22, scope: !182)
!187 = !DILocation(line: 120, column: 17, scope: !182)
!188 = !DILocation(line: 120, column: 25, scope: !182)
!189 = !DILocation(line: 120, column: 32, scope: !182)
!190 = !DILocation(line: 121, column: 13, scope: !182)
!191 = !DILocation(line: 117, column: 34, scope: !192)
!192 = !DILexicalBlockFile(scope: !178, file: !15, discriminator: 2)
!193 = !DILocation(line: 117, column: 13, scope: !192)
!194 = distinct !{!194, !195}
!195 = !DILocation(line: 117, column: 13, scope: !171)
!196 = !DILocation(line: 124, column: 14, scope: !161)
!197 = !DILocation(line: 124, column: 9, scope: !161)
!198 = !DILocation(line: 125, column: 5, scope: !161)
!199 = !DILocation(line: 126, column: 8, scope: !200)
!200 = distinct !DILexicalBlock(scope: !153, file: !15, line: 126, column: 8)
!201 = !DILocation(line: 126, column: 8, scope: !153)
!202 = !DILocation(line: 129, column: 9, scope: !203)
!203 = distinct !DILexicalBlock(scope: !200, file: !15, line: 127, column: 5)
!204 = !DILocation(line: 130, column: 5, scope: !203)
!205 = !DILocation(line: 138, column: 1, scope: !153)
!206 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 141, type: !26, isLocal: false, isDefinition: true, scopeLine: 141, isOptimized: false, unit: !0, variables: !2)
!207 = !DILocation(line: 142, column: 5, scope: !206)
!208 = !DILocation(line: 143, column: 2, scope: !206)
!209 = !DILocation(line: 144, column: 5, scope: !206)
!210 = distinct !DISubprogram(name: "staticReturnsTrue", scope: !15, file: !15, line: 57, type: !26, isLocal: true, isDefinition: true, scopeLine: 58, isOptimized: false, unit: !0, variables: !2)
!211 = !DILocation(line: 59, column: 5, scope: !210)
!212 = distinct !DISubprogram(name: "staticReturnsFalse", scope: !15, file: !15, line: 62, type: !26, isLocal: true, isDefinition: true, scopeLine: 63, isOptimized: false, unit: !0, variables: !2)
!213 = !DILocation(line: 64, column: 5, scope: !212)
