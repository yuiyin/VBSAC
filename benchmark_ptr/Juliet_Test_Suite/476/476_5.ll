; ModuleID = './476_5.c'
source_filename = "./476_5.c"
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
@.str.3 = private unnamed_addr constant [12 x i8] c"intOne == 5\00", align 1
@staticFalse = internal global i32 0, align 4
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

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
  %call = call i32 @rand() #4, !dbg !27
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
  call void @llvm.dbg.declare(metadata i8* %charHex.addr, metadata !34, metadata !35), !dbg !36
  %0 = load i8, i8* %charHex.addr, align 1, !dbg !37
  %conv = sext i8 %0 to i32, !dbg !38
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), i32 %conv), !dbg !39
  ret void, !dbg !40
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #2

declare i32 @printf(i8*, ...) #3

; Function Attrs: nounwind uwtable
define void @printLine(i8* %line) #0 !dbg !41 {
entry:
  %line.addr = alloca i8*, align 8
  store i8* %line, i8** %line.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %line.addr, metadata !46, metadata !35), !dbg !47
  %0 = load i8*, i8** %line.addr, align 8, !dbg !48
  %cmp = icmp ne i8* %0, null, !dbg !50
  br i1 %cmp, label %if.then, label %if.end, !dbg !51

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** %line.addr, align 8, !dbg !52
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i32 0, i32 0), i8* %1), !dbg !54
  br label %if.end, !dbg !55

if.end:                                           ; preds = %if.then, %entry
  ret void, !dbg !56
}

; Function Attrs: nounwind uwtable
define void @printIntLine(i32 %intNumber) #0 !dbg !57 {
entry:
  %intNumber.addr = alloca i32, align 4
  store i32 %intNumber, i32* %intNumber.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %intNumber.addr, metadata !60, metadata !35), !dbg !61
  %0 = load i32, i32* %intNumber.addr, align 4, !dbg !62
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), i32 %0), !dbg !63
  ret void, !dbg !64
}

; Function Attrs: nounwind uwtable
define void @printLongLine(i64 %longIntNumber) #0 !dbg !65 {
entry:
  %longIntNumber.addr = alloca i64, align 8
  store i64 %longIntNumber, i64* %longIntNumber.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %longIntNumber.addr, metadata !71, metadata !35), !dbg !72
  %0 = load i64, i64* %longIntNumber.addr, align 8, !dbg !73
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.2, i32 0, i32 0), i64 %0), !dbg !74
  ret void, !dbg !75
}

; Function Attrs: nounwind uwtable
define void @bad5() #0 !dbg !76 {
entry:
  %twoIntsStructPointer = alloca %struct._twoIntsStruct*, align 8
  %0 = load i32, i32* @staticTrue, align 4, !dbg !79
  %tobool = icmp ne i32 %0, 0, !dbg !79
  br i1 %tobool, label %if.then, label %if.end5, !dbg !81

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %twoIntsStructPointer, metadata !82, metadata !35), !dbg !92
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %twoIntsStructPointer, align 8, !dbg !92
  %1 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %twoIntsStructPointer, align 8, !dbg !93
  %cmp = icmp ne %struct._twoIntsStruct* %1, null, !dbg !95
  %conv = zext i1 %cmp to i32, !dbg !95
  %2 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %twoIntsStructPointer, align 8, !dbg !96
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %2, i32 0, i32 0, !dbg !97
  %3 = load i32, i32* %intOne, align 4, !dbg !97
  %cmp1 = icmp eq i32 %3, 5, !dbg !98
  %conv2 = zext i1 %cmp1 to i32, !dbg !98
  %and = and i32 %conv, %conv2, !dbg !99
  %tobool3 = icmp ne i32 %and, 0, !dbg !99
  br i1 %tobool3, label %if.then4, label %if.end, !dbg !100

if.then4:                                         ; preds = %if.then
  call void @printLine(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i32 0, i32 0)), !dbg !101
  br label %if.end, !dbg !103

if.end:                                           ; preds = %if.then4, %if.then
  br label %if.end5, !dbg !104

if.end5:                                          ; preds = %if.end, %entry
  ret void, !dbg !105
}

; Function Attrs: nounwind uwtable
define void @good5() #0 !dbg !106 {
entry:
  %twoIntsStructPointer = alloca %struct._twoIntsStruct*, align 8
  %0 = load i32, i32* @staticFalse, align 4, !dbg !107
  %tobool = icmp ne i32 %0, 0, !dbg !107
  br i1 %tobool, label %if.then, label %if.else, !dbg !109

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i32 0, i32 0)), !dbg !110
  br label %if.end3, !dbg !112

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %twoIntsStructPointer, metadata !113, metadata !35), !dbg !116
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %twoIntsStructPointer, align 8, !dbg !116
  %1 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %twoIntsStructPointer, align 8, !dbg !117
  %cmp = icmp ne %struct._twoIntsStruct* %1, null, !dbg !119
  br i1 %cmp, label %land.lhs.true, label %if.end, !dbg !120

land.lhs.true:                                    ; preds = %if.else
  %2 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %twoIntsStructPointer, align 8, !dbg !121
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %2, i32 0, i32 0, !dbg !123
  %3 = load i32, i32* %intOne, align 4, !dbg !123
  %cmp1 = icmp eq i32 %3, 5, !dbg !124
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !125

if.then2:                                         ; preds = %land.lhs.true
  call void @printLine(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i32 0, i32 0)), !dbg !126
  br label %if.end, !dbg !128

if.end:                                           ; preds = %if.then2, %land.lhs.true, %if.else
  br label %if.end3

if.end3:                                          ; preds = %if.end, %if.then
  ret void, !dbg !129
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !130 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @good5(), !dbg !131
  call void @bad5(), !dbg !132
  ret i32 1, !dbg !133
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone }
attributes #3 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!17, !18}
!llvm.ident = !{!19}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (tags/RELEASE_390/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, globals: !6)
!1 = !DIFile(filename: "476_5.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/476")
!2 = !{}
!3 = !{!4, !5}
!4 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64, align: 64)
!6 = !{!7, !10, !11, !12, !13, !14, !15, !16}
!7 = distinct !DIGlobalVariable(name: "GLOBAL_CONST_TRUE", scope: !0, file: !8, line: 10, type: !9, isLocal: false, isDefinition: true, variable: i32* @GLOBAL_CONST_TRUE)
!8 = !DIFile(filename: "./476_5.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/476")
!9 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !4)
!10 = distinct !DIGlobalVariable(name: "GLOBAL_CONST_FALSE", scope: !0, file: !8, line: 11, type: !9, isLocal: false, isDefinition: true, variable: i32* @GLOBAL_CONST_FALSE)
!11 = distinct !DIGlobalVariable(name: "GLOBAL_CONST_FIVE", scope: !0, file: !8, line: 12, type: !9, isLocal: false, isDefinition: true, variable: i32* @GLOBAL_CONST_FIVE)
!12 = distinct !DIGlobalVariable(name: "globalTrue", scope: !0, file: !8, line: 14, type: !4, isLocal: false, isDefinition: true, variable: i32* @globalTrue)
!13 = distinct !DIGlobalVariable(name: "globalFalse", scope: !0, file: !8, line: 15, type: !4, isLocal: false, isDefinition: true, variable: i32* @globalFalse)
!14 = distinct !DIGlobalVariable(name: "globalFive", scope: !0, file: !8, line: 16, type: !4, isLocal: false, isDefinition: true, variable: i32* @globalFive)
!15 = distinct !DIGlobalVariable(name: "staticTrue", scope: !0, file: !8, line: 57, type: !4, isLocal: true, isDefinition: true, variable: i32* @staticTrue)
!16 = distinct !DIGlobalVariable(name: "staticFalse", scope: !0, file: !8, line: 58, type: !4, isLocal: true, isDefinition: true, variable: i32* @staticFalse)
!17 = !{i32 2, !"Dwarf Version", i32 4}
!18 = !{i32 2, !"Debug Info Version", i32 3}
!19 = !{!"clang version 3.9.0 (tags/RELEASE_390/final)"}
!20 = distinct !DISubprogram(name: "globalReturnsTrue", scope: !8, file: !8, line: 18, type: !21, isLocal: false, isDefinition: true, scopeLine: 19, isOptimized: false, unit: !0, variables: !2)
!21 = !DISubroutineType(types: !22)
!22 = !{!4}
!23 = !DILocation(line: 20, column: 5, scope: !20)
!24 = distinct !DISubprogram(name: "globalReturnsFalse", scope: !8, file: !8, line: 23, type: !21, isLocal: false, isDefinition: true, scopeLine: 24, isOptimized: false, unit: !0, variables: !2)
!25 = !DILocation(line: 25, column: 5, scope: !24)
!26 = distinct !DISubprogram(name: "globalReturnsTrueOrFalse", scope: !8, file: !8, line: 28, type: !21, isLocal: false, isDefinition: true, scopeLine: 29, isOptimized: false, unit: !0, variables: !2)
!27 = !DILocation(line: 30, column: 13, scope: !26)
!28 = !DILocation(line: 30, column: 20, scope: !26)
!29 = !DILocation(line: 30, column: 5, scope: !26)
!30 = distinct !DISubprogram(name: "printHexCharLine", scope: !8, file: !8, line: 33, type: !31, isLocal: false, isDefinition: true, scopeLine: 34, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!31 = !DISubroutineType(types: !32)
!32 = !{null, !33}
!33 = !DIBasicType(name: "char", size: 8, align: 8, encoding: DW_ATE_signed_char)
!34 = !DILocalVariable(name: "charHex", arg: 1, scope: !30, file: !8, line: 33, type: !33)
!35 = !DIExpression()
!36 = !DILocation(line: 33, column: 29, scope: !30)
!37 = !DILocation(line: 35, column: 25, scope: !30)
!38 = !DILocation(line: 35, column: 20, scope: !30)
!39 = !DILocation(line: 35, column: 5, scope: !30)
!40 = !DILocation(line: 36, column: 1, scope: !30)
!41 = distinct !DISubprogram(name: "printLine", scope: !8, file: !8, line: 38, type: !42, isLocal: false, isDefinition: true, scopeLine: 39, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!42 = !DISubroutineType(types: !43)
!43 = !{null, !44}
!44 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !45, size: 64, align: 64)
!45 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !33)
!46 = !DILocalVariable(name: "line", arg: 1, scope: !41, file: !8, line: 38, type: !44)
!47 = !DILocation(line: 38, column: 30, scope: !41)
!48 = !DILocation(line: 40, column: 8, scope: !49)
!49 = distinct !DILexicalBlock(scope: !41, file: !8, line: 40, column: 8)
!50 = !DILocation(line: 40, column: 13, scope: !49)
!51 = !DILocation(line: 40, column: 8, scope: !41)
!52 = !DILocation(line: 42, column: 24, scope: !53)
!53 = distinct !DILexicalBlock(scope: !49, file: !8, line: 41, column: 5)
!54 = !DILocation(line: 42, column: 9, scope: !53)
!55 = !DILocation(line: 43, column: 5, scope: !53)
!56 = !DILocation(line: 44, column: 1, scope: !41)
!57 = distinct !DISubprogram(name: "printIntLine", scope: !8, file: !8, line: 46, type: !58, isLocal: false, isDefinition: true, scopeLine: 47, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!58 = !DISubroutineType(types: !59)
!59 = !{null, !4}
!60 = !DILocalVariable(name: "intNumber", arg: 1, scope: !57, file: !8, line: 46, type: !4)
!61 = !DILocation(line: 46, column: 24, scope: !57)
!62 = !DILocation(line: 48, column: 20, scope: !57)
!63 = !DILocation(line: 48, column: 5, scope: !57)
!64 = !DILocation(line: 49, column: 1, scope: !57)
!65 = distinct !DISubprogram(name: "printLongLine", scope: !8, file: !8, line: 51, type: !66, isLocal: false, isDefinition: true, scopeLine: 52, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!66 = !DISubroutineType(types: !67)
!67 = !{null, !68}
!68 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !69, line: 197, baseType: !70)
!69 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/sys/types.h", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/476")
!70 = !DIBasicType(name: "long int", size: 64, align: 64, encoding: DW_ATE_signed)
!71 = !DILocalVariable(name: "longIntNumber", arg: 1, scope: !65, file: !8, line: 51, type: !68)
!72 = !DILocation(line: 51, column: 29, scope: !65)
!73 = !DILocation(line: 53, column: 21, scope: !65)
!74 = !DILocation(line: 53, column: 5, scope: !65)
!75 = !DILocation(line: 54, column: 1, scope: !65)
!76 = distinct !DISubprogram(name: "bad5", scope: !8, file: !8, line: 62, type: !77, isLocal: false, isDefinition: true, scopeLine: 63, isOptimized: false, unit: !0, variables: !2)
!77 = !DISubroutineType(types: !78)
!78 = !{null}
!79 = !DILocation(line: 64, column: 8, scope: !80)
!80 = distinct !DILexicalBlock(scope: !76, file: !8, line: 64, column: 8)
!81 = !DILocation(line: 64, column: 8, scope: !76)
!82 = !DILocalVariable(name: "twoIntsStructPointer", scope: !83, file: !8, line: 67, type: !85)
!83 = distinct !DILexicalBlock(scope: !84, file: !8, line: 66, column: 9)
!84 = distinct !DILexicalBlock(scope: !80, file: !8, line: 65, column: 5)
!85 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !86, size: 64, align: 64)
!86 = !DIDerivedType(tag: DW_TAG_typedef, name: "twoIntsStruct", file: !87, line: 14, baseType: !88)
!87 = !DIFile(filename: "./476.h", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/476")
!88 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_twoIntsStruct", file: !87, line: 10, size: 64, align: 32, elements: !89)
!89 = !{!90, !91}
!90 = !DIDerivedType(tag: DW_TAG_member, name: "intOne", scope: !88, file: !87, line: 12, baseType: !4, size: 32, align: 32)
!91 = !DIDerivedType(tag: DW_TAG_member, name: "intTwo", scope: !88, file: !87, line: 13, baseType: !4, size: 32, align: 32, offset: 32)
!92 = !DILocation(line: 67, column: 28, scope: !83)
!93 = !DILocation(line: 70, column: 18, scope: !94)
!94 = distinct !DILexicalBlock(scope: !83, file: !8, line: 70, column: 17)
!95 = !DILocation(line: 70, column: 39, scope: !94)
!96 = !DILocation(line: 70, column: 51, scope: !94)
!97 = !DILocation(line: 70, column: 73, scope: !94)
!98 = !DILocation(line: 70, column: 80, scope: !94)
!99 = !DILocation(line: 70, column: 48, scope: !94)
!100 = !DILocation(line: 70, column: 17, scope: !83)
!101 = !DILocation(line: 72, column: 17, scope: !102)
!102 = distinct !DILexicalBlock(scope: !94, file: !8, line: 71, column: 13)
!103 = !DILocation(line: 73, column: 13, scope: !102)
!104 = !DILocation(line: 75, column: 5, scope: !84)
!105 = !DILocation(line: 76, column: 1, scope: !76)
!106 = distinct !DISubprogram(name: "good5", scope: !8, file: !8, line: 82, type: !77, isLocal: false, isDefinition: true, scopeLine: 83, isOptimized: false, unit: !0, variables: !2)
!107 = !DILocation(line: 84, column: 8, scope: !108)
!108 = distinct !DILexicalBlock(scope: !106, file: !8, line: 84, column: 8)
!109 = !DILocation(line: 84, column: 8, scope: !106)
!110 = !DILocation(line: 87, column: 9, scope: !111)
!111 = distinct !DILexicalBlock(scope: !108, file: !8, line: 85, column: 5)
!112 = !DILocation(line: 88, column: 5, scope: !111)
!113 = !DILocalVariable(name: "twoIntsStructPointer", scope: !114, file: !8, line: 92, type: !85)
!114 = distinct !DILexicalBlock(scope: !115, file: !8, line: 91, column: 9)
!115 = distinct !DILexicalBlock(scope: !108, file: !8, line: 90, column: 5)
!116 = !DILocation(line: 92, column: 28, scope: !114)
!117 = !DILocation(line: 95, column: 18, scope: !118)
!118 = distinct !DILexicalBlock(scope: !114, file: !8, line: 95, column: 17)
!119 = !DILocation(line: 95, column: 39, scope: !118)
!120 = !DILocation(line: 95, column: 48, scope: !118)
!121 = !DILocation(line: 95, column: 52, scope: !122)
!122 = !DILexicalBlockFile(scope: !118, file: !8, discriminator: 1)
!123 = !DILocation(line: 95, column: 74, scope: !122)
!124 = !DILocation(line: 95, column: 81, scope: !122)
!125 = !DILocation(line: 95, column: 17, scope: !122)
!126 = !DILocation(line: 97, column: 17, scope: !127)
!127 = distinct !DILexicalBlock(scope: !118, file: !8, line: 96, column: 13)
!128 = !DILocation(line: 98, column: 13, scope: !127)
!129 = !DILocation(line: 101, column: 1, scope: !106)
!130 = distinct !DISubprogram(name: "main", scope: !8, file: !8, line: 104, type: !21, isLocal: false, isDefinition: true, scopeLine: 104, isOptimized: false, unit: !0, variables: !2)
!131 = !DILocation(line: 105, column: 5, scope: !130)
!132 = !DILocation(line: 106, column: 2, scope: !130)
!133 = !DILocation(line: 107, column: 5, scope: !130)
