; ModuleID = './415_47.c'
source_filename = "./415_47.c"
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
@staticFive = internal global i32 5, align 4
@.str.3 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

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
define void @bad47() #0 !dbg !82 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !85, metadata !41), !dbg !86
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !87
  %0 = load i32, i32* @staticFive, align 4, !dbg !88
  %cmp = icmp eq i32 %0, 5, !dbg !90
  br i1 %cmp, label %if.then, label %if.end3, !dbg !91

if.then:                                          ; preds = %entry
  %call = call noalias i8* @malloc(i64 800) #4, !dbg !92
  %1 = bitcast i8* %call to %struct._twoIntsStruct*, !dbg !94
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %data, align 8, !dbg !95
  %2 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !96
  %cmp1 = icmp eq %struct._twoIntsStruct* %2, null, !dbg !98
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !99

if.then2:                                         ; preds = %if.then
  br label %if.end6, !dbg !100

if.end:                                           ; preds = %if.then
  %3 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !102
  %4 = bitcast %struct._twoIntsStruct* %3 to i8*, !dbg !102
  call void @free(i8* %4) #4, !dbg !103
  br label %if.end3, !dbg !104

if.end3:                                          ; preds = %if.end, %entry
  %5 = load i32, i32* @staticFive, align 4, !dbg !105
  %cmp4 = icmp eq i32 %5, 5, !dbg !107
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !108

if.then5:                                         ; preds = %if.end3
  %6 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !109
  %7 = bitcast %struct._twoIntsStruct* %6 to i8*, !dbg !109
  call void @free(i8* %7) #4, !dbg !111
  br label %if.end6, !dbg !112

if.end6:                                          ; preds = %if.then2, %if.then5, %if.end3
  ret void, !dbg !113
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #1

; Function Attrs: nounwind
declare void @free(i8*) #1

; Function Attrs: nounwind uwtable
define void @good47() #0 !dbg !114 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !115, metadata !41), !dbg !116
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !117
  %0 = load i32, i32* @staticFive, align 4, !dbg !118
  %cmp = icmp eq i32 %0, 5, !dbg !120
  br i1 %cmp, label %if.then, label %if.end3, !dbg !121

if.then:                                          ; preds = %entry
  %call = call noalias i8* @malloc(i64 800) #4, !dbg !122
  %1 = bitcast i8* %call to %struct._twoIntsStruct*, !dbg !124
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %data, align 8, !dbg !125
  %2 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !126
  %cmp1 = icmp eq %struct._twoIntsStruct* %2, null, !dbg !128
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !129

if.then2:                                         ; preds = %if.then
  br label %if.end6, !dbg !130

if.end:                                           ; preds = %if.then
  %3 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !132
  %4 = bitcast %struct._twoIntsStruct* %3 to i8*, !dbg !132
  call void @free(i8* %4) #4, !dbg !133
  br label %if.end3, !dbg !134

if.end3:                                          ; preds = %if.end, %entry
  %5 = load i32, i32* @staticFive, align 4, !dbg !135
  %cmp4 = icmp ne i32 %5, 5, !dbg !137
  br i1 %cmp4, label %if.then5, label %if.else, !dbg !138

if.then5:                                         ; preds = %if.end3
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.3, i32 0, i32 0)), !dbg !139
  br label %if.end6, !dbg !141

if.else:                                          ; preds = %if.end3
  br label %if.end6

if.end6:                                          ; preds = %if.then2, %if.else, %if.then5
  ret void, !dbg !142
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !143 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @good47(), !dbg !144
  call void @bad47(), !dbg !145
  ret i32 1, !dbg !146
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
!1 = !DIFile(filename: "415_47.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/415")
!2 = !{}
!3 = !{!4, !5, !6}
!4 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64, align: 64)
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64, align: 64)
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "twoIntsStruct", file: !8, line: 14, baseType: !9)
!8 = !DIFile(filename: "./415.h", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/415")
!9 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_twoIntsStruct", file: !8, line: 10, size: 64, align: 32, elements: !10)
!10 = !{!11, !12}
!11 = !DIDerivedType(tag: DW_TAG_member, name: "intOne", scope: !9, file: !8, line: 12, baseType: !4, size: 32, align: 32)
!12 = !DIDerivedType(tag: DW_TAG_member, name: "intTwo", scope: !9, file: !8, line: 13, baseType: !4, size: 32, align: 32, offset: 32)
!13 = !{!14, !17, !18, !19, !20, !21, !22}
!14 = distinct !DIGlobalVariable(name: "GLOBAL_CONST_TRUE", scope: !0, file: !15, line: 10, type: !16, isLocal: false, isDefinition: true, variable: i32* @GLOBAL_CONST_TRUE)
!15 = !DIFile(filename: "./415_47.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/415")
!16 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !4)
!17 = distinct !DIGlobalVariable(name: "GLOBAL_CONST_FALSE", scope: !0, file: !15, line: 11, type: !16, isLocal: false, isDefinition: true, variable: i32* @GLOBAL_CONST_FALSE)
!18 = distinct !DIGlobalVariable(name: "GLOBAL_CONST_FIVE", scope: !0, file: !15, line: 12, type: !16, isLocal: false, isDefinition: true, variable: i32* @GLOBAL_CONST_FIVE)
!19 = distinct !DIGlobalVariable(name: "globalTrue", scope: !0, file: !15, line: 14, type: !4, isLocal: false, isDefinition: true, variable: i32* @globalTrue)
!20 = distinct !DIGlobalVariable(name: "globalFalse", scope: !0, file: !15, line: 15, type: !4, isLocal: false, isDefinition: true, variable: i32* @globalFalse)
!21 = distinct !DIGlobalVariable(name: "globalFive", scope: !0, file: !15, line: 16, type: !4, isLocal: false, isDefinition: true, variable: i32* @globalFive)
!22 = distinct !DIGlobalVariable(name: "staticFive", scope: !0, file: !15, line: 57, type: !4, isLocal: true, isDefinition: true, variable: i32* @staticFive)
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
!75 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/sys/types.h", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/415")
!76 = !DIBasicType(name: "long int", size: 64, align: 64, encoding: DW_ATE_signed)
!77 = !DILocalVariable(name: "longIntNumber", arg: 1, scope: !71, file: !15, line: 51, type: !74)
!78 = !DILocation(line: 51, column: 29, scope: !71)
!79 = !DILocation(line: 53, column: 21, scope: !71)
!80 = !DILocation(line: 53, column: 5, scope: !71)
!81 = !DILocation(line: 54, column: 1, scope: !71)
!82 = distinct !DISubprogram(name: "bad47", scope: !15, file: !15, line: 61, type: !83, isLocal: false, isDefinition: true, scopeLine: 62, isOptimized: false, unit: !0, variables: !2)
!83 = !DISubroutineType(types: !84)
!84 = !{null}
!85 = !DILocalVariable(name: "data", scope: !82, file: !15, line: 63, type: !6)
!86 = !DILocation(line: 63, column: 21, scope: !82)
!87 = !DILocation(line: 65, column: 10, scope: !82)
!88 = !DILocation(line: 66, column: 8, scope: !89)
!89 = distinct !DILexicalBlock(scope: !82, file: !15, line: 66, column: 8)
!90 = !DILocation(line: 66, column: 18, scope: !89)
!91 = !DILocation(line: 66, column: 8, scope: !82)
!92 = !DILocation(line: 68, column: 33, scope: !93)
!93 = distinct !DILexicalBlock(scope: !89, file: !15, line: 67, column: 5)
!94 = !DILocation(line: 68, column: 16, scope: !93)
!95 = !DILocation(line: 68, column: 14, scope: !93)
!96 = !DILocation(line: 70, column: 13, scope: !97)
!97 = distinct !DILexicalBlock(scope: !93, file: !15, line: 70, column: 13)
!98 = !DILocation(line: 70, column: 18, scope: !97)
!99 = !DILocation(line: 70, column: 13, scope: !93)
!100 = !DILocation(line: 70, column: 27, scope: !101)
!101 = !DILexicalBlockFile(scope: !97, file: !15, discriminator: 1)
!102 = !DILocation(line: 71, column: 14, scope: !93)
!103 = !DILocation(line: 71, column: 9, scope: !93)
!104 = !DILocation(line: 72, column: 5, scope: !93)
!105 = !DILocation(line: 73, column: 8, scope: !106)
!106 = distinct !DILexicalBlock(scope: !82, file: !15, line: 73, column: 8)
!107 = !DILocation(line: 73, column: 18, scope: !106)
!108 = !DILocation(line: 73, column: 8, scope: !82)
!109 = !DILocation(line: 76, column: 14, scope: !110)
!110 = distinct !DILexicalBlock(scope: !106, file: !15, line: 74, column: 5)
!111 = !DILocation(line: 76, column: 9, scope: !110)
!112 = !DILocation(line: 77, column: 5, scope: !110)
!113 = !DILocation(line: 78, column: 1, scope: !82)
!114 = distinct !DISubprogram(name: "good47", scope: !15, file: !15, line: 84, type: !83, isLocal: false, isDefinition: true, scopeLine: 85, isOptimized: false, unit: !0, variables: !2)
!115 = !DILocalVariable(name: "data", scope: !114, file: !15, line: 86, type: !6)
!116 = !DILocation(line: 86, column: 21, scope: !114)
!117 = !DILocation(line: 88, column: 10, scope: !114)
!118 = !DILocation(line: 89, column: 8, scope: !119)
!119 = distinct !DILexicalBlock(scope: !114, file: !15, line: 89, column: 8)
!120 = !DILocation(line: 89, column: 18, scope: !119)
!121 = !DILocation(line: 89, column: 8, scope: !114)
!122 = !DILocation(line: 91, column: 33, scope: !123)
!123 = distinct !DILexicalBlock(scope: !119, file: !15, line: 90, column: 5)
!124 = !DILocation(line: 91, column: 16, scope: !123)
!125 = !DILocation(line: 91, column: 14, scope: !123)
!126 = !DILocation(line: 93, column: 13, scope: !127)
!127 = distinct !DILexicalBlock(scope: !123, file: !15, line: 93, column: 13)
!128 = !DILocation(line: 93, column: 18, scope: !127)
!129 = !DILocation(line: 93, column: 13, scope: !123)
!130 = !DILocation(line: 93, column: 27, scope: !131)
!131 = !DILexicalBlockFile(scope: !127, file: !15, discriminator: 1)
!132 = !DILocation(line: 94, column: 14, scope: !123)
!133 = !DILocation(line: 94, column: 9, scope: !123)
!134 = !DILocation(line: 95, column: 5, scope: !123)
!135 = !DILocation(line: 96, column: 8, scope: !136)
!136 = distinct !DILexicalBlock(scope: !114, file: !15, line: 96, column: 8)
!137 = !DILocation(line: 96, column: 18, scope: !136)
!138 = !DILocation(line: 96, column: 8, scope: !114)
!139 = !DILocation(line: 99, column: 9, scope: !140)
!140 = distinct !DILexicalBlock(scope: !136, file: !15, line: 97, column: 5)
!141 = !DILocation(line: 100, column: 5, scope: !140)
!142 = !DILocation(line: 107, column: 1, scope: !114)
!143 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 111, type: !27, isLocal: false, isDefinition: true, scopeLine: 111, isOptimized: false, unit: !0, variables: !2)
!144 = !DILocation(line: 112, column: 5, scope: !143)
!145 = !DILocation(line: 113, column: 2, scope: !143)
!146 = !DILocation(line: 114, column: 5, scope: !143)
