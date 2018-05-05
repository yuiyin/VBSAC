; ModuleID = './416_24.c'
source_filename = "./416_24.c"
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
define void @bad24() #0 !dbg !94 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !97, metadata !40), !dbg !98
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !99
  %call = call noalias i8* @malloc(i64 800) #4, !dbg !100
  %0 = bitcast i8* %call to %struct._twoIntsStruct*, !dbg !103
  store %struct._twoIntsStruct* %0, %struct._twoIntsStruct** %data, align 8, !dbg !104
  %1 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !105
  %cmp = icmp eq %struct._twoIntsStruct* %1, null, !dbg !107
  br i1 %cmp, label %if.then, label %if.end, !dbg !108

if.then:                                          ; preds = %entry
  br label %return, !dbg !109

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !111, metadata !40), !dbg !116
  store i64 0, i64* %i, align 8, !dbg !117
  br label %for.cond, !dbg !119

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !120
  %cmp1 = icmp ult i64 %2, 100, !dbg !123
  br i1 %cmp1, label %for.body, label %for.end, !dbg !124

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !125
  %4 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !127
  %arrayidx = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %4, i64 %3, !dbg !127
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !128
  store i32 1, i32* %intOne, align 4, !dbg !129
  %5 = load i64, i64* %i, align 8, !dbg !130
  %6 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !131
  %arrayidx2 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %6, i64 %5, !dbg !131
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx2, i32 0, i32 1, !dbg !132
  store i32 2, i32* %intTwo, align 4, !dbg !133
  br label %for.inc, !dbg !134

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !135
  %inc = add i64 %7, 1, !dbg !135
  store i64 %inc, i64* %i, align 8, !dbg !135
  br label %for.cond, !dbg !137, !llvm.loop !138

for.end:                                          ; preds = %for.cond
  %8 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !140
  %9 = bitcast %struct._twoIntsStruct* %8 to i8*, !dbg !140
  call void @free(i8* %9) #4, !dbg !141
  %10 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !142
  %arrayidx3 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %10, i64 0, !dbg !142
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx3), !dbg !145
  br label %return, !dbg !146

return:                                           ; preds = %for.end, %if.then
  ret void, !dbg !147
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #1

; Function Attrs: nounwind
declare void @free(i8*) #1

; Function Attrs: nounwind uwtable
define void @good24() #0 !dbg !149 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !150, metadata !40), !dbg !151
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !152
  %call = call noalias i8* @malloc(i64 800) #4, !dbg !153
  %0 = bitcast i8* %call to %struct._twoIntsStruct*, !dbg !156
  store %struct._twoIntsStruct* %0, %struct._twoIntsStruct** %data, align 8, !dbg !157
  %1 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !158
  %cmp = icmp eq %struct._twoIntsStruct* %1, null, !dbg !160
  br i1 %cmp, label %if.then, label %if.end, !dbg !161

if.then:                                          ; preds = %entry
  br label %return, !dbg !162

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !164, metadata !40), !dbg !166
  store i64 0, i64* %i, align 8, !dbg !167
  br label %for.cond, !dbg !169

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !170
  %cmp1 = icmp ult i64 %2, 100, !dbg !173
  br i1 %cmp1, label %for.body, label %for.end, !dbg !174

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !175
  %4 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !177
  %arrayidx = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %4, i64 %3, !dbg !177
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !178
  store i32 1, i32* %intOne, align 4, !dbg !179
  %5 = load i64, i64* %i, align 8, !dbg !180
  %6 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !181
  %arrayidx2 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %6, i64 %5, !dbg !181
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx2, i32 0, i32 1, !dbg !182
  store i32 2, i32* %intTwo, align 4, !dbg !183
  br label %for.inc, !dbg !184

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !185
  %inc = add i64 %7, 1, !dbg !185
  store i64 %inc, i64* %i, align 8, !dbg !185
  br label %for.cond, !dbg !187, !llvm.loop !188

for.end:                                          ; preds = %for.cond
  %8 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !190
  %9 = bitcast %struct._twoIntsStruct* %8 to i8*, !dbg !190
  call void @free(i8* %9) #4, !dbg !191
  br label %return, !dbg !192

return:                                           ; preds = %for.end, %if.then
  ret void, !dbg !193
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !195 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @good24(), !dbg !196
  call void @bad24(), !dbg !197
  ret i32 1, !dbg !198
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
!1 = !DIFile(filename: "416_24.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/416")
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
!15 = !DIFile(filename: "./416_24.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/416")
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
!81 = distinct !DISubprogram(name: "printStructLine", scope: !15, file: !15, line: 56, type: !82, isLocal: false, isDefinition: true, scopeLine: 57, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!82 = !DISubroutineType(types: !83)
!83 = !{null, !84}
!84 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !85, size: 64, align: 64)
!85 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !7)
!86 = !DILocalVariable(name: "structTwoIntsStruct", arg: 1, scope: !81, file: !15, line: 56, type: !84)
!87 = !DILocation(line: 56, column: 45, scope: !81)
!88 = !DILocation(line: 58, column: 26, scope: !81)
!89 = !DILocation(line: 58, column: 47, scope: !81)
!90 = !DILocation(line: 58, column: 55, scope: !81)
!91 = !DILocation(line: 58, column: 76, scope: !81)
!92 = !DILocation(line: 58, column: 5, scope: !81)
!93 = !DILocation(line: 59, column: 1, scope: !81)
!94 = distinct !DISubprogram(name: "bad24", scope: !15, file: !15, line: 63, type: !95, isLocal: false, isDefinition: true, scopeLine: 64, isOptimized: false, unit: !0, variables: !2)
!95 = !DISubroutineType(types: !96)
!96 = !{null}
!97 = !DILocalVariable(name: "data", scope: !94, file: !15, line: 65, type: !6)
!98 = !DILocation(line: 65, column: 21, scope: !94)
!99 = !DILocation(line: 67, column: 10, scope: !94)
!100 = !DILocation(line: 70, column: 33, scope: !101)
!101 = distinct !DILexicalBlock(scope: !102, file: !15, line: 69, column: 5)
!102 = distinct !DILexicalBlock(scope: !94, file: !15, line: 68, column: 8)
!103 = !DILocation(line: 70, column: 16, scope: !101)
!104 = !DILocation(line: 70, column: 14, scope: !101)
!105 = !DILocation(line: 71, column: 13, scope: !106)
!106 = distinct !DILexicalBlock(scope: !101, file: !15, line: 71, column: 13)
!107 = !DILocation(line: 71, column: 18, scope: !106)
!108 = !DILocation(line: 71, column: 13, scope: !101)
!109 = !DILocation(line: 71, column: 27, scope: !110)
!110 = !DILexicalBlockFile(scope: !106, file: !15, discriminator: 1)
!111 = !DILocalVariable(name: "i", scope: !112, file: !15, line: 73, type: !113)
!112 = distinct !DILexicalBlock(scope: !101, file: !15, line: 72, column: 9)
!113 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !114, line: 62, baseType: !115)
!114 = !DIFile(filename: "/usr/local/bin/../lib/clang/3.9.0/include/stddef.h", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/416")
!115 = !DIBasicType(name: "long unsigned int", size: 64, align: 64, encoding: DW_ATE_unsigned)
!116 = !DILocation(line: 73, column: 20, scope: !112)
!117 = !DILocation(line: 74, column: 19, scope: !118)
!118 = distinct !DILexicalBlock(scope: !112, file: !15, line: 74, column: 13)
!119 = !DILocation(line: 74, column: 17, scope: !118)
!120 = !DILocation(line: 74, column: 24, scope: !121)
!121 = !DILexicalBlockFile(scope: !122, file: !15, discriminator: 1)
!122 = distinct !DILexicalBlock(scope: !118, file: !15, line: 74, column: 13)
!123 = !DILocation(line: 74, column: 26, scope: !121)
!124 = !DILocation(line: 74, column: 13, scope: !121)
!125 = !DILocation(line: 76, column: 22, scope: !126)
!126 = distinct !DILexicalBlock(scope: !122, file: !15, line: 75, column: 13)
!127 = !DILocation(line: 76, column: 17, scope: !126)
!128 = !DILocation(line: 76, column: 25, scope: !126)
!129 = !DILocation(line: 76, column: 32, scope: !126)
!130 = !DILocation(line: 77, column: 22, scope: !126)
!131 = !DILocation(line: 77, column: 17, scope: !126)
!132 = !DILocation(line: 77, column: 25, scope: !126)
!133 = !DILocation(line: 77, column: 32, scope: !126)
!134 = !DILocation(line: 78, column: 13, scope: !126)
!135 = !DILocation(line: 74, column: 34, scope: !136)
!136 = !DILexicalBlockFile(scope: !122, file: !15, discriminator: 2)
!137 = !DILocation(line: 74, column: 13, scope: !136)
!138 = distinct !{!138, !139}
!139 = !DILocation(line: 74, column: 13, scope: !112)
!140 = !DILocation(line: 81, column: 14, scope: !101)
!141 = !DILocation(line: 81, column: 9, scope: !101)
!142 = !DILocation(line: 86, column: 26, scope: !143)
!143 = distinct !DILexicalBlock(scope: !144, file: !15, line: 84, column: 5)
!144 = distinct !DILexicalBlock(scope: !94, file: !15, line: 83, column: 8)
!145 = !DILocation(line: 86, column: 9, scope: !143)
!146 = !DILocation(line: 89, column: 1, scope: !94)
!147 = !DILocation(line: 89, column: 1, scope: !148)
!148 = !DILexicalBlockFile(scope: !94, file: !15, discriminator: 1)
!149 = distinct !DISubprogram(name: "good24", scope: !15, file: !15, line: 95, type: !95, isLocal: false, isDefinition: true, scopeLine: 96, isOptimized: false, unit: !0, variables: !2)
!150 = !DILocalVariable(name: "data", scope: !149, file: !15, line: 97, type: !6)
!151 = !DILocation(line: 97, column: 21, scope: !149)
!152 = !DILocation(line: 99, column: 10, scope: !149)
!153 = !DILocation(line: 102, column: 33, scope: !154)
!154 = distinct !DILexicalBlock(scope: !155, file: !15, line: 101, column: 5)
!155 = distinct !DILexicalBlock(scope: !149, file: !15, line: 100, column: 8)
!156 = !DILocation(line: 102, column: 16, scope: !154)
!157 = !DILocation(line: 102, column: 14, scope: !154)
!158 = !DILocation(line: 103, column: 13, scope: !159)
!159 = distinct !DILexicalBlock(scope: !154, file: !15, line: 103, column: 13)
!160 = !DILocation(line: 103, column: 18, scope: !159)
!161 = !DILocation(line: 103, column: 13, scope: !154)
!162 = !DILocation(line: 103, column: 27, scope: !163)
!163 = !DILexicalBlockFile(scope: !159, file: !15, discriminator: 1)
!164 = !DILocalVariable(name: "i", scope: !165, file: !15, line: 105, type: !113)
!165 = distinct !DILexicalBlock(scope: !154, file: !15, line: 104, column: 9)
!166 = !DILocation(line: 105, column: 20, scope: !165)
!167 = !DILocation(line: 106, column: 19, scope: !168)
!168 = distinct !DILexicalBlock(scope: !165, file: !15, line: 106, column: 13)
!169 = !DILocation(line: 106, column: 17, scope: !168)
!170 = !DILocation(line: 106, column: 24, scope: !171)
!171 = !DILexicalBlockFile(scope: !172, file: !15, discriminator: 1)
!172 = distinct !DILexicalBlock(scope: !168, file: !15, line: 106, column: 13)
!173 = !DILocation(line: 106, column: 26, scope: !171)
!174 = !DILocation(line: 106, column: 13, scope: !171)
!175 = !DILocation(line: 108, column: 22, scope: !176)
!176 = distinct !DILexicalBlock(scope: !172, file: !15, line: 107, column: 13)
!177 = !DILocation(line: 108, column: 17, scope: !176)
!178 = !DILocation(line: 108, column: 25, scope: !176)
!179 = !DILocation(line: 108, column: 32, scope: !176)
!180 = !DILocation(line: 109, column: 22, scope: !176)
!181 = !DILocation(line: 109, column: 17, scope: !176)
!182 = !DILocation(line: 109, column: 25, scope: !176)
!183 = !DILocation(line: 109, column: 32, scope: !176)
!184 = !DILocation(line: 110, column: 13, scope: !176)
!185 = !DILocation(line: 106, column: 34, scope: !186)
!186 = !DILexicalBlockFile(scope: !172, file: !15, discriminator: 2)
!187 = !DILocation(line: 106, column: 13, scope: !186)
!188 = distinct !{!188, !189}
!189 = !DILocation(line: 106, column: 13, scope: !165)
!190 = !DILocation(line: 113, column: 14, scope: !154)
!191 = !DILocation(line: 113, column: 9, scope: !154)
!192 = !DILocation(line: 127, column: 1, scope: !149)
!193 = !DILocation(line: 127, column: 1, scope: !194)
!194 = !DILexicalBlockFile(scope: !149, file: !15, discriminator: 1)
!195 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 130, type: !26, isLocal: false, isDefinition: true, scopeLine: 130, isOptimized: false, unit: !0, variables: !2)
!196 = !DILocation(line: 131, column: 5, scope: !195)
!197 = !DILocation(line: 132, column: 2, scope: !195)
!198 = !DILocation(line: 133, column: 5, scope: !195)
