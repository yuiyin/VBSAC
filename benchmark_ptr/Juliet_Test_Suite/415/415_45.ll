; ModuleID = './415_45.c'
source_filename = "./415_45.c"
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
@staticTrue = internal global i32 1, align 4
@staticFalse = internal global i32 0, align 4
@.str.3 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

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
define void @bad45() #0 !dbg !83 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !86, metadata !42), !dbg !87
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !88
  %0 = load i32, i32* @staticTrue, align 4, !dbg !89
  %tobool = icmp ne i32 %0, 0, !dbg !89
  br i1 %tobool, label %if.then, label %if.end2, !dbg !91

if.then:                                          ; preds = %entry
  %call = call noalias i8* @malloc(i64 800) #4, !dbg !92
  %1 = bitcast i8* %call to %struct._twoIntsStruct*, !dbg !94
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %data, align 8, !dbg !95
  %2 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !96
  %cmp = icmp eq %struct._twoIntsStruct* %2, null, !dbg !98
  br i1 %cmp, label %if.then1, label %if.end, !dbg !99

if.then1:                                         ; preds = %if.then
  br label %if.end5, !dbg !100

if.end:                                           ; preds = %if.then
  %3 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !102
  %4 = bitcast %struct._twoIntsStruct* %3 to i8*, !dbg !102
  call void @free(i8* %4) #4, !dbg !103
  br label %if.end2, !dbg !104

if.end2:                                          ; preds = %if.end, %entry
  %5 = load i32, i32* @staticTrue, align 4, !dbg !105
  %tobool3 = icmp ne i32 %5, 0, !dbg !105
  br i1 %tobool3, label %if.then4, label %if.end5, !dbg !107

if.then4:                                         ; preds = %if.end2
  %6 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !108
  %7 = bitcast %struct._twoIntsStruct* %6 to i8*, !dbg !108
  call void @free(i8* %7) #4, !dbg !110
  br label %if.end5, !dbg !111

if.end5:                                          ; preds = %if.then1, %if.then4, %if.end2
  ret void, !dbg !112
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #1

; Function Attrs: nounwind
declare void @free(i8*) #1

; Function Attrs: nounwind uwtable
define void @good45() #0 !dbg !113 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !114, metadata !42), !dbg !115
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !116
  %0 = load i32, i32* @staticTrue, align 4, !dbg !117
  %tobool = icmp ne i32 %0, 0, !dbg !117
  br i1 %tobool, label %if.then, label %if.end2, !dbg !119

if.then:                                          ; preds = %entry
  %call = call noalias i8* @malloc(i64 800) #4, !dbg !120
  %1 = bitcast i8* %call to %struct._twoIntsStruct*, !dbg !122
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %data, align 8, !dbg !123
  %2 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !124
  %cmp = icmp eq %struct._twoIntsStruct* %2, null, !dbg !126
  br i1 %cmp, label %if.then1, label %if.end, !dbg !127

if.then1:                                         ; preds = %if.then
  br label %if.end5, !dbg !128

if.end:                                           ; preds = %if.then
  %3 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !130
  %4 = bitcast %struct._twoIntsStruct* %3 to i8*, !dbg !130
  call void @free(i8* %4) #4, !dbg !131
  br label %if.end2, !dbg !132

if.end2:                                          ; preds = %if.end, %entry
  %5 = load i32, i32* @staticFalse, align 4, !dbg !133
  %tobool3 = icmp ne i32 %5, 0, !dbg !133
  br i1 %tobool3, label %if.then4, label %if.else, !dbg !135

if.then4:                                         ; preds = %if.end2
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.3, i32 0, i32 0)), !dbg !136
  br label %if.end5, !dbg !138

if.else:                                          ; preds = %if.end2
  br label %if.end5

if.end5:                                          ; preds = %if.then1, %if.else, %if.then4
  ret void, !dbg !139
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !140 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @good45(), !dbg !141
  call void @bad45(), !dbg !142
  ret i32 1, !dbg !143
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
!1 = !DIFile(filename: "415_45.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/415")
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
!13 = !{!14, !17, !18, !19, !20, !21, !22, !23}
!14 = distinct !DIGlobalVariable(name: "GLOBAL_CONST_TRUE", scope: !0, file: !15, line: 10, type: !16, isLocal: false, isDefinition: true, variable: i32* @GLOBAL_CONST_TRUE)
!15 = !DIFile(filename: "./415_45.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/415")
!16 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !4)
!17 = distinct !DIGlobalVariable(name: "GLOBAL_CONST_FALSE", scope: !0, file: !15, line: 11, type: !16, isLocal: false, isDefinition: true, variable: i32* @GLOBAL_CONST_FALSE)
!18 = distinct !DIGlobalVariable(name: "GLOBAL_CONST_FIVE", scope: !0, file: !15, line: 12, type: !16, isLocal: false, isDefinition: true, variable: i32* @GLOBAL_CONST_FIVE)
!19 = distinct !DIGlobalVariable(name: "globalTrue", scope: !0, file: !15, line: 14, type: !4, isLocal: false, isDefinition: true, variable: i32* @globalTrue)
!20 = distinct !DIGlobalVariable(name: "globalFalse", scope: !0, file: !15, line: 15, type: !4, isLocal: false, isDefinition: true, variable: i32* @globalFalse)
!21 = distinct !DIGlobalVariable(name: "globalFive", scope: !0, file: !15, line: 16, type: !4, isLocal: false, isDefinition: true, variable: i32* @globalFive)
!22 = distinct !DIGlobalVariable(name: "staticTrue", scope: !0, file: !15, line: 57, type: !4, isLocal: true, isDefinition: true, variable: i32* @staticTrue)
!23 = distinct !DIGlobalVariable(name: "staticFalse", scope: !0, file: !15, line: 58, type: !4, isLocal: true, isDefinition: true, variable: i32* @staticFalse)
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
!76 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/sys/types.h", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/415")
!77 = !DIBasicType(name: "long int", size: 64, align: 64, encoding: DW_ATE_signed)
!78 = !DILocalVariable(name: "longIntNumber", arg: 1, scope: !72, file: !15, line: 51, type: !75)
!79 = !DILocation(line: 51, column: 29, scope: !72)
!80 = !DILocation(line: 53, column: 21, scope: !72)
!81 = !DILocation(line: 53, column: 5, scope: !72)
!82 = !DILocation(line: 54, column: 1, scope: !72)
!83 = distinct !DISubprogram(name: "bad45", scope: !15, file: !15, line: 62, type: !84, isLocal: false, isDefinition: true, scopeLine: 63, isOptimized: false, unit: !0, variables: !2)
!84 = !DISubroutineType(types: !85)
!85 = !{null}
!86 = !DILocalVariable(name: "data", scope: !83, file: !15, line: 64, type: !6)
!87 = !DILocation(line: 64, column: 21, scope: !83)
!88 = !DILocation(line: 66, column: 10, scope: !83)
!89 = !DILocation(line: 67, column: 8, scope: !90)
!90 = distinct !DILexicalBlock(scope: !83, file: !15, line: 67, column: 8)
!91 = !DILocation(line: 67, column: 8, scope: !83)
!92 = !DILocation(line: 69, column: 33, scope: !93)
!93 = distinct !DILexicalBlock(scope: !90, file: !15, line: 68, column: 5)
!94 = !DILocation(line: 69, column: 16, scope: !93)
!95 = !DILocation(line: 69, column: 14, scope: !93)
!96 = !DILocation(line: 71, column: 13, scope: !97)
!97 = distinct !DILexicalBlock(scope: !93, file: !15, line: 71, column: 13)
!98 = !DILocation(line: 71, column: 18, scope: !97)
!99 = !DILocation(line: 71, column: 13, scope: !93)
!100 = !DILocation(line: 71, column: 27, scope: !101)
!101 = !DILexicalBlockFile(scope: !97, file: !15, discriminator: 1)
!102 = !DILocation(line: 72, column: 14, scope: !93)
!103 = !DILocation(line: 72, column: 9, scope: !93)
!104 = !DILocation(line: 73, column: 5, scope: !93)
!105 = !DILocation(line: 74, column: 8, scope: !106)
!106 = distinct !DILexicalBlock(scope: !83, file: !15, line: 74, column: 8)
!107 = !DILocation(line: 74, column: 8, scope: !83)
!108 = !DILocation(line: 77, column: 14, scope: !109)
!109 = distinct !DILexicalBlock(scope: !106, file: !15, line: 75, column: 5)
!110 = !DILocation(line: 77, column: 9, scope: !109)
!111 = !DILocation(line: 78, column: 5, scope: !109)
!112 = !DILocation(line: 79, column: 1, scope: !83)
!113 = distinct !DISubprogram(name: "good45", scope: !15, file: !15, line: 85, type: !84, isLocal: false, isDefinition: true, scopeLine: 86, isOptimized: false, unit: !0, variables: !2)
!114 = !DILocalVariable(name: "data", scope: !113, file: !15, line: 87, type: !6)
!115 = !DILocation(line: 87, column: 21, scope: !113)
!116 = !DILocation(line: 89, column: 10, scope: !113)
!117 = !DILocation(line: 90, column: 8, scope: !118)
!118 = distinct !DILexicalBlock(scope: !113, file: !15, line: 90, column: 8)
!119 = !DILocation(line: 90, column: 8, scope: !113)
!120 = !DILocation(line: 92, column: 33, scope: !121)
!121 = distinct !DILexicalBlock(scope: !118, file: !15, line: 91, column: 5)
!122 = !DILocation(line: 92, column: 16, scope: !121)
!123 = !DILocation(line: 92, column: 14, scope: !121)
!124 = !DILocation(line: 94, column: 13, scope: !125)
!125 = distinct !DILexicalBlock(scope: !121, file: !15, line: 94, column: 13)
!126 = !DILocation(line: 94, column: 18, scope: !125)
!127 = !DILocation(line: 94, column: 13, scope: !121)
!128 = !DILocation(line: 94, column: 27, scope: !129)
!129 = !DILexicalBlockFile(scope: !125, file: !15, discriminator: 1)
!130 = !DILocation(line: 95, column: 14, scope: !121)
!131 = !DILocation(line: 95, column: 9, scope: !121)
!132 = !DILocation(line: 96, column: 5, scope: !121)
!133 = !DILocation(line: 97, column: 8, scope: !134)
!134 = distinct !DILexicalBlock(scope: !113, file: !15, line: 97, column: 8)
!135 = !DILocation(line: 97, column: 8, scope: !113)
!136 = !DILocation(line: 100, column: 9, scope: !137)
!137 = distinct !DILexicalBlock(scope: !134, file: !15, line: 98, column: 5)
!138 = !DILocation(line: 101, column: 5, scope: !137)
!139 = !DILocation(line: 108, column: 1, scope: !113)
!140 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 112, type: !28, isLocal: false, isDefinition: true, scopeLine: 112, isOptimized: false, unit: !0, variables: !2)
!141 = !DILocation(line: 113, column: 5, scope: !140)
!142 = !DILocation(line: 114, column: 2, scope: !140)
!143 = !DILocation(line: 115, column: 5, scope: !140)
