; ModuleID = './415_48.c'
source_filename = "./415_48.c"
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
@.str.3 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

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
define void @bad48() #0 !dbg !81 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !84, metadata !40), !dbg !85
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !86
  %call = call i32 @staticReturnsTrue(), !dbg !87
  %tobool = icmp ne i32 %call, 0, !dbg !87
  br i1 %tobool, label %if.then, label %if.end3, !dbg !89

if.then:                                          ; preds = %entry
  %call1 = call noalias i8* @malloc(i64 800) #4, !dbg !90
  %0 = bitcast i8* %call1 to %struct._twoIntsStruct*, !dbg !92
  store %struct._twoIntsStruct* %0, %struct._twoIntsStruct** %data, align 8, !dbg !93
  %1 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !94
  %cmp = icmp eq %struct._twoIntsStruct* %1, null, !dbg !96
  br i1 %cmp, label %if.then2, label %if.end, !dbg !97

if.then2:                                         ; preds = %if.then
  br label %if.end7, !dbg !98

if.end:                                           ; preds = %if.then
  %2 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !100
  %3 = bitcast %struct._twoIntsStruct* %2 to i8*, !dbg !100
  call void @free(i8* %3) #4, !dbg !101
  br label %if.end3, !dbg !102

if.end3:                                          ; preds = %if.end, %entry
  %call4 = call i32 @staticReturnsTrue(), !dbg !103
  %tobool5 = icmp ne i32 %call4, 0, !dbg !103
  br i1 %tobool5, label %if.then6, label %if.end7, !dbg !105

if.then6:                                         ; preds = %if.end3
  %4 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !106
  %5 = bitcast %struct._twoIntsStruct* %4 to i8*, !dbg !106
  call void @free(i8* %5) #4, !dbg !108
  br label %if.end7, !dbg !109

if.end7:                                          ; preds = %if.then2, %if.then6, %if.end3
  ret void, !dbg !110
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #1

; Function Attrs: nounwind
declare void @free(i8*) #1

; Function Attrs: nounwind uwtable
define void @good48() #0 !dbg !111 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !112, metadata !40), !dbg !113
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !114
  %call = call i32 @staticReturnsTrue(), !dbg !115
  %tobool = icmp ne i32 %call, 0, !dbg !115
  br i1 %tobool, label %if.then, label %if.end3, !dbg !117

if.then:                                          ; preds = %entry
  %call1 = call noalias i8* @malloc(i64 800) #4, !dbg !118
  %0 = bitcast i8* %call1 to %struct._twoIntsStruct*, !dbg !120
  store %struct._twoIntsStruct* %0, %struct._twoIntsStruct** %data, align 8, !dbg !121
  %1 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !122
  %cmp = icmp eq %struct._twoIntsStruct* %1, null, !dbg !124
  br i1 %cmp, label %if.then2, label %if.end, !dbg !125

if.then2:                                         ; preds = %if.then
  br label %if.end7, !dbg !126

if.end:                                           ; preds = %if.then
  %2 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !128
  %3 = bitcast %struct._twoIntsStruct* %2 to i8*, !dbg !128
  call void @free(i8* %3) #4, !dbg !129
  br label %if.end3, !dbg !130

if.end3:                                          ; preds = %if.end, %entry
  %call4 = call i32 @staticReturnsFalse(), !dbg !131
  %tobool5 = icmp ne i32 %call4, 0, !dbg !131
  br i1 %tobool5, label %if.then6, label %if.else, !dbg !133

if.then6:                                         ; preds = %if.end3
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.3, i32 0, i32 0)), !dbg !134
  br label %if.end7, !dbg !136

if.else:                                          ; preds = %if.end3
  br label %if.end7

if.end7:                                          ; preds = %if.then2, %if.else, %if.then6
  ret void, !dbg !137
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !138 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @good48(), !dbg !139
  call void @bad48(), !dbg !140
  ret i32 1, !dbg !141
}

; Function Attrs: nounwind uwtable
define internal i32 @staticReturnsTrue() #0 !dbg !142 {
entry:
  ret i32 1, !dbg !143
}

; Function Attrs: nounwind uwtable
define internal i32 @staticReturnsFalse() #0 !dbg !144 {
entry:
  ret i32 0, !dbg !145
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
!1 = !DIFile(filename: "415_48.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/415")
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
!13 = !{!14, !17, !18, !19, !20, !21}
!14 = distinct !DIGlobalVariable(name: "GLOBAL_CONST_TRUE", scope: !0, file: !15, line: 10, type: !16, isLocal: false, isDefinition: true, variable: i32* @GLOBAL_CONST_TRUE)
!15 = !DIFile(filename: "./415_48.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/415")
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
!74 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/sys/types.h", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/415")
!75 = !DIBasicType(name: "long int", size: 64, align: 64, encoding: DW_ATE_signed)
!76 = !DILocalVariable(name: "longIntNumber", arg: 1, scope: !70, file: !15, line: 51, type: !73)
!77 = !DILocation(line: 51, column: 29, scope: !70)
!78 = !DILocation(line: 53, column: 21, scope: !70)
!79 = !DILocation(line: 53, column: 5, scope: !70)
!80 = !DILocation(line: 54, column: 1, scope: !70)
!81 = distinct !DISubprogram(name: "bad48", scope: !15, file: !15, line: 69, type: !82, isLocal: false, isDefinition: true, scopeLine: 70, isOptimized: false, unit: !0, variables: !2)
!82 = !DISubroutineType(types: !83)
!83 = !{null}
!84 = !DILocalVariable(name: "data", scope: !81, file: !15, line: 71, type: !6)
!85 = !DILocation(line: 71, column: 21, scope: !81)
!86 = !DILocation(line: 73, column: 10, scope: !81)
!87 = !DILocation(line: 74, column: 8, scope: !88)
!88 = distinct !DILexicalBlock(scope: !81, file: !15, line: 74, column: 8)
!89 = !DILocation(line: 74, column: 8, scope: !81)
!90 = !DILocation(line: 76, column: 33, scope: !91)
!91 = distinct !DILexicalBlock(scope: !88, file: !15, line: 75, column: 5)
!92 = !DILocation(line: 76, column: 16, scope: !91)
!93 = !DILocation(line: 76, column: 14, scope: !91)
!94 = !DILocation(line: 78, column: 13, scope: !95)
!95 = distinct !DILexicalBlock(scope: !91, file: !15, line: 78, column: 13)
!96 = !DILocation(line: 78, column: 18, scope: !95)
!97 = !DILocation(line: 78, column: 13, scope: !91)
!98 = !DILocation(line: 78, column: 27, scope: !99)
!99 = !DILexicalBlockFile(scope: !95, file: !15, discriminator: 1)
!100 = !DILocation(line: 79, column: 14, scope: !91)
!101 = !DILocation(line: 79, column: 9, scope: !91)
!102 = !DILocation(line: 80, column: 5, scope: !91)
!103 = !DILocation(line: 81, column: 8, scope: !104)
!104 = distinct !DILexicalBlock(scope: !81, file: !15, line: 81, column: 8)
!105 = !DILocation(line: 81, column: 8, scope: !81)
!106 = !DILocation(line: 84, column: 14, scope: !107)
!107 = distinct !DILexicalBlock(scope: !104, file: !15, line: 82, column: 5)
!108 = !DILocation(line: 84, column: 9, scope: !107)
!109 = !DILocation(line: 85, column: 5, scope: !107)
!110 = !DILocation(line: 86, column: 1, scope: !81)
!111 = distinct !DISubprogram(name: "good48", scope: !15, file: !15, line: 92, type: !82, isLocal: false, isDefinition: true, scopeLine: 93, isOptimized: false, unit: !0, variables: !2)
!112 = !DILocalVariable(name: "data", scope: !111, file: !15, line: 94, type: !6)
!113 = !DILocation(line: 94, column: 21, scope: !111)
!114 = !DILocation(line: 96, column: 10, scope: !111)
!115 = !DILocation(line: 97, column: 8, scope: !116)
!116 = distinct !DILexicalBlock(scope: !111, file: !15, line: 97, column: 8)
!117 = !DILocation(line: 97, column: 8, scope: !111)
!118 = !DILocation(line: 99, column: 33, scope: !119)
!119 = distinct !DILexicalBlock(scope: !116, file: !15, line: 98, column: 5)
!120 = !DILocation(line: 99, column: 16, scope: !119)
!121 = !DILocation(line: 99, column: 14, scope: !119)
!122 = !DILocation(line: 101, column: 13, scope: !123)
!123 = distinct !DILexicalBlock(scope: !119, file: !15, line: 101, column: 13)
!124 = !DILocation(line: 101, column: 18, scope: !123)
!125 = !DILocation(line: 101, column: 13, scope: !119)
!126 = !DILocation(line: 101, column: 27, scope: !127)
!127 = !DILexicalBlockFile(scope: !123, file: !15, discriminator: 1)
!128 = !DILocation(line: 102, column: 14, scope: !119)
!129 = !DILocation(line: 102, column: 9, scope: !119)
!130 = !DILocation(line: 103, column: 5, scope: !119)
!131 = !DILocation(line: 104, column: 8, scope: !132)
!132 = distinct !DILexicalBlock(scope: !111, file: !15, line: 104, column: 8)
!133 = !DILocation(line: 104, column: 8, scope: !111)
!134 = !DILocation(line: 107, column: 9, scope: !135)
!135 = distinct !DILexicalBlock(scope: !132, file: !15, line: 105, column: 5)
!136 = !DILocation(line: 108, column: 5, scope: !135)
!137 = !DILocation(line: 115, column: 1, scope: !111)
!138 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 119, type: !26, isLocal: false, isDefinition: true, scopeLine: 119, isOptimized: false, unit: !0, variables: !2)
!139 = !DILocation(line: 120, column: 5, scope: !138)
!140 = !DILocation(line: 121, column: 2, scope: !138)
!141 = !DILocation(line: 122, column: 5, scope: !138)
!142 = distinct !DISubprogram(name: "staticReturnsTrue", scope: !15, file: !15, line: 57, type: !26, isLocal: true, isDefinition: true, scopeLine: 58, isOptimized: false, unit: !0, variables: !2)
!143 = !DILocation(line: 59, column: 5, scope: !142)
!144 = distinct !DISubprogram(name: "staticReturnsFalse", scope: !15, file: !15, line: 62, type: !26, isLocal: true, isDefinition: true, scopeLine: 63, isOptimized: false, unit: !0, variables: !2)
!145 = !DILocation(line: 64, column: 5, scope: !144)
