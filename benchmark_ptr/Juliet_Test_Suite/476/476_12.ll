; ModuleID = './476_12.c'
source_filename = "./476_12.c"
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
@.str.3 = private unnamed_addr constant [12 x i8] c"intOne == 5\00", align 1

; Function Attrs: nounwind uwtable
define i32 @globalReturnsTrue() #0 !dbg !18 {
entry:
  ret i32 1, !dbg !21
}

; Function Attrs: nounwind uwtable
define i32 @globalReturnsFalse() #0 !dbg !22 {
entry:
  ret i32 0, !dbg !23
}

; Function Attrs: nounwind uwtable
define i32 @globalReturnsTrueOrFalse() #0 !dbg !24 {
entry:
  %call = call i32 @rand() #4, !dbg !25
  %rem = srem i32 %call, 2, !dbg !26
  ret i32 %rem, !dbg !27
}

; Function Attrs: nounwind
declare i32 @rand() #1

; Function Attrs: nounwind uwtable
define void @printHexCharLine(i8 signext %charHex) #0 !dbg !28 {
entry:
  %charHex.addr = alloca i8, align 1
  store i8 %charHex, i8* %charHex.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %charHex.addr, metadata !32, metadata !33), !dbg !34
  %0 = load i8, i8* %charHex.addr, align 1, !dbg !35
  %conv = sext i8 %0 to i32, !dbg !36
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), i32 %conv), !dbg !37
  ret void, !dbg !38
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #2

declare i32 @printf(i8*, ...) #3

; Function Attrs: nounwind uwtable
define void @printLine(i8* %line) #0 !dbg !39 {
entry:
  %line.addr = alloca i8*, align 8
  store i8* %line, i8** %line.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %line.addr, metadata !44, metadata !33), !dbg !45
  %0 = load i8*, i8** %line.addr, align 8, !dbg !46
  %cmp = icmp ne i8* %0, null, !dbg !48
  br i1 %cmp, label %if.then, label %if.end, !dbg !49

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** %line.addr, align 8, !dbg !50
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i32 0, i32 0), i8* %1), !dbg !52
  br label %if.end, !dbg !53

if.end:                                           ; preds = %if.then, %entry
  ret void, !dbg !54
}

; Function Attrs: nounwind uwtable
define void @printIntLine(i32 %intNumber) #0 !dbg !55 {
entry:
  %intNumber.addr = alloca i32, align 4
  store i32 %intNumber, i32* %intNumber.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %intNumber.addr, metadata !58, metadata !33), !dbg !59
  %0 = load i32, i32* %intNumber.addr, align 4, !dbg !60
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), i32 %0), !dbg !61
  ret void, !dbg !62
}

; Function Attrs: nounwind uwtable
define void @printLongLine(i64 %longIntNumber) #0 !dbg !63 {
entry:
  %longIntNumber.addr = alloca i64, align 8
  store i64 %longIntNumber, i64* %longIntNumber.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %longIntNumber.addr, metadata !69, metadata !33), !dbg !70
  %0 = load i64, i64* %longIntNumber.addr, align 8, !dbg !71
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.2, i32 0, i32 0), i64 %0), !dbg !72
  ret void, !dbg !73
}

; Function Attrs: nounwind uwtable
define void @bad12() #0 !dbg !74 {
entry:
  %twoIntsStructPointer = alloca %struct._twoIntsStruct*, align 8
  %twoIntsStructPointer5 = alloca %struct._twoIntsStruct*, align 8
  %call = call i32 @globalReturnsTrueOrFalse(), !dbg !77
  %tobool = icmp ne i32 %call, 0, !dbg !77
  br i1 %tobool, label %if.then, label %if.else, !dbg !79

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %twoIntsStructPointer, metadata !80, metadata !33), !dbg !90
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %twoIntsStructPointer, align 8, !dbg !90
  %0 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %twoIntsStructPointer, align 8, !dbg !91
  %cmp = icmp ne %struct._twoIntsStruct* %0, null, !dbg !93
  %conv = zext i1 %cmp to i32, !dbg !93
  %1 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %twoIntsStructPointer, align 8, !dbg !94
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %1, i32 0, i32 0, !dbg !95
  %2 = load i32, i32* %intOne, align 4, !dbg !95
  %cmp1 = icmp eq i32 %2, 5, !dbg !96
  %conv2 = zext i1 %cmp1 to i32, !dbg !96
  %and = and i32 %conv, %conv2, !dbg !97
  %tobool3 = icmp ne i32 %and, 0, !dbg !97
  br i1 %tobool3, label %if.then4, label %if.end, !dbg !98

if.then4:                                         ; preds = %if.then
  call void @printLine(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i32 0, i32 0)), !dbg !99
  br label %if.end, !dbg !101

if.end:                                           ; preds = %if.then4, %if.then
  br label %if.end13, !dbg !102

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %twoIntsStructPointer5, metadata !103, metadata !33), !dbg !106
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %twoIntsStructPointer5, align 8, !dbg !106
  %3 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %twoIntsStructPointer5, align 8, !dbg !107
  %cmp6 = icmp ne %struct._twoIntsStruct* %3, null, !dbg !109
  br i1 %cmp6, label %land.lhs.true, label %if.end12, !dbg !110

land.lhs.true:                                    ; preds = %if.else
  %4 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %twoIntsStructPointer5, align 8, !dbg !111
  %intOne8 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %4, i32 0, i32 0, !dbg !113
  %5 = load i32, i32* %intOne8, align 4, !dbg !113
  %cmp9 = icmp eq i32 %5, 5, !dbg !114
  br i1 %cmp9, label %if.then11, label %if.end12, !dbg !115

if.then11:                                        ; preds = %land.lhs.true
  call void @printLine(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i32 0, i32 0)), !dbg !116
  br label %if.end12, !dbg !118

if.end12:                                         ; preds = %if.then11, %land.lhs.true, %if.else
  br label %if.end13

if.end13:                                         ; preds = %if.end12, %if.end
  ret void, !dbg !119
}

; Function Attrs: nounwind uwtable
define void @good12() #0 !dbg !120 {
entry:
  %twoIntsStructPointer = alloca %struct._twoIntsStruct*, align 8
  %twoIntsStructPointer3 = alloca %struct._twoIntsStruct*, align 8
  %call = call i32 @globalReturnsTrueOrFalse(), !dbg !121
  %tobool = icmp ne i32 %call, 0, !dbg !121
  br i1 %tobool, label %if.then, label %if.else, !dbg !123

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %twoIntsStructPointer, metadata !124, metadata !33), !dbg !127
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %twoIntsStructPointer, align 8, !dbg !127
  %0 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %twoIntsStructPointer, align 8, !dbg !128
  %cmp = icmp ne %struct._twoIntsStruct* %0, null, !dbg !130
  br i1 %cmp, label %land.lhs.true, label %if.end, !dbg !131

land.lhs.true:                                    ; preds = %if.then
  %1 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %twoIntsStructPointer, align 8, !dbg !132
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %1, i32 0, i32 0, !dbg !134
  %2 = load i32, i32* %intOne, align 4, !dbg !134
  %cmp1 = icmp eq i32 %2, 5, !dbg !135
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !136

if.then2:                                         ; preds = %land.lhs.true
  call void @printLine(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i32 0, i32 0)), !dbg !137
  br label %if.end, !dbg !139

if.end:                                           ; preds = %if.then2, %land.lhs.true, %if.then
  br label %if.end10, !dbg !140

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %twoIntsStructPointer3, metadata !141, metadata !33), !dbg !144
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %twoIntsStructPointer3, align 8, !dbg !144
  %3 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %twoIntsStructPointer3, align 8, !dbg !145
  %cmp4 = icmp ne %struct._twoIntsStruct* %3, null, !dbg !147
  br i1 %cmp4, label %land.lhs.true5, label %if.end9, !dbg !148

land.lhs.true5:                                   ; preds = %if.else
  %4 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %twoIntsStructPointer3, align 8, !dbg !149
  %intOne6 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %4, i32 0, i32 0, !dbg !151
  %5 = load i32, i32* %intOne6, align 4, !dbg !151
  %cmp7 = icmp eq i32 %5, 5, !dbg !152
  br i1 %cmp7, label %if.then8, label %if.end9, !dbg !153

if.then8:                                         ; preds = %land.lhs.true5
  call void @printLine(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i32 0, i32 0)), !dbg !154
  br label %if.end9, !dbg !156

if.end9:                                          ; preds = %if.then8, %land.lhs.true5, %if.else
  br label %if.end10

if.end10:                                         ; preds = %if.end9, %if.end
  ret void, !dbg !157
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !158 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @good12(), !dbg !159
  call void @bad12(), !dbg !160
  ret i32 1, !dbg !161
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone }
attributes #3 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!15, !16}
!llvm.ident = !{!17}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (tags/RELEASE_390/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, globals: !6)
!1 = !DIFile(filename: "476_12.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/476")
!2 = !{}
!3 = !{!4, !5}
!4 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64, align: 64)
!6 = !{!7, !10, !11, !12, !13, !14}
!7 = distinct !DIGlobalVariable(name: "GLOBAL_CONST_TRUE", scope: !0, file: !8, line: 10, type: !9, isLocal: false, isDefinition: true, variable: i32* @GLOBAL_CONST_TRUE)
!8 = !DIFile(filename: "./476_12.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/476")
!9 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !4)
!10 = distinct !DIGlobalVariable(name: "GLOBAL_CONST_FALSE", scope: !0, file: !8, line: 11, type: !9, isLocal: false, isDefinition: true, variable: i32* @GLOBAL_CONST_FALSE)
!11 = distinct !DIGlobalVariable(name: "GLOBAL_CONST_FIVE", scope: !0, file: !8, line: 12, type: !9, isLocal: false, isDefinition: true, variable: i32* @GLOBAL_CONST_FIVE)
!12 = distinct !DIGlobalVariable(name: "globalTrue", scope: !0, file: !8, line: 14, type: !4, isLocal: false, isDefinition: true, variable: i32* @globalTrue)
!13 = distinct !DIGlobalVariable(name: "globalFalse", scope: !0, file: !8, line: 15, type: !4, isLocal: false, isDefinition: true, variable: i32* @globalFalse)
!14 = distinct !DIGlobalVariable(name: "globalFive", scope: !0, file: !8, line: 16, type: !4, isLocal: false, isDefinition: true, variable: i32* @globalFive)
!15 = !{i32 2, !"Dwarf Version", i32 4}
!16 = !{i32 2, !"Debug Info Version", i32 3}
!17 = !{!"clang version 3.9.0 (tags/RELEASE_390/final)"}
!18 = distinct !DISubprogram(name: "globalReturnsTrue", scope: !8, file: !8, line: 18, type: !19, isLocal: false, isDefinition: true, scopeLine: 19, isOptimized: false, unit: !0, variables: !2)
!19 = !DISubroutineType(types: !20)
!20 = !{!4}
!21 = !DILocation(line: 20, column: 5, scope: !18)
!22 = distinct !DISubprogram(name: "globalReturnsFalse", scope: !8, file: !8, line: 23, type: !19, isLocal: false, isDefinition: true, scopeLine: 24, isOptimized: false, unit: !0, variables: !2)
!23 = !DILocation(line: 25, column: 5, scope: !22)
!24 = distinct !DISubprogram(name: "globalReturnsTrueOrFalse", scope: !8, file: !8, line: 28, type: !19, isLocal: false, isDefinition: true, scopeLine: 29, isOptimized: false, unit: !0, variables: !2)
!25 = !DILocation(line: 30, column: 13, scope: !24)
!26 = !DILocation(line: 30, column: 20, scope: !24)
!27 = !DILocation(line: 30, column: 5, scope: !24)
!28 = distinct !DISubprogram(name: "printHexCharLine", scope: !8, file: !8, line: 33, type: !29, isLocal: false, isDefinition: true, scopeLine: 34, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!29 = !DISubroutineType(types: !30)
!30 = !{null, !31}
!31 = !DIBasicType(name: "char", size: 8, align: 8, encoding: DW_ATE_signed_char)
!32 = !DILocalVariable(name: "charHex", arg: 1, scope: !28, file: !8, line: 33, type: !31)
!33 = !DIExpression()
!34 = !DILocation(line: 33, column: 29, scope: !28)
!35 = !DILocation(line: 35, column: 25, scope: !28)
!36 = !DILocation(line: 35, column: 20, scope: !28)
!37 = !DILocation(line: 35, column: 5, scope: !28)
!38 = !DILocation(line: 36, column: 1, scope: !28)
!39 = distinct !DISubprogram(name: "printLine", scope: !8, file: !8, line: 38, type: !40, isLocal: false, isDefinition: true, scopeLine: 39, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!40 = !DISubroutineType(types: !41)
!41 = !{null, !42}
!42 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !43, size: 64, align: 64)
!43 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !31)
!44 = !DILocalVariable(name: "line", arg: 1, scope: !39, file: !8, line: 38, type: !42)
!45 = !DILocation(line: 38, column: 30, scope: !39)
!46 = !DILocation(line: 40, column: 8, scope: !47)
!47 = distinct !DILexicalBlock(scope: !39, file: !8, line: 40, column: 8)
!48 = !DILocation(line: 40, column: 13, scope: !47)
!49 = !DILocation(line: 40, column: 8, scope: !39)
!50 = !DILocation(line: 42, column: 24, scope: !51)
!51 = distinct !DILexicalBlock(scope: !47, file: !8, line: 41, column: 5)
!52 = !DILocation(line: 42, column: 9, scope: !51)
!53 = !DILocation(line: 43, column: 5, scope: !51)
!54 = !DILocation(line: 44, column: 1, scope: !39)
!55 = distinct !DISubprogram(name: "printIntLine", scope: !8, file: !8, line: 46, type: !56, isLocal: false, isDefinition: true, scopeLine: 47, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!56 = !DISubroutineType(types: !57)
!57 = !{null, !4}
!58 = !DILocalVariable(name: "intNumber", arg: 1, scope: !55, file: !8, line: 46, type: !4)
!59 = !DILocation(line: 46, column: 24, scope: !55)
!60 = !DILocation(line: 48, column: 20, scope: !55)
!61 = !DILocation(line: 48, column: 5, scope: !55)
!62 = !DILocation(line: 49, column: 1, scope: !55)
!63 = distinct !DISubprogram(name: "printLongLine", scope: !8, file: !8, line: 51, type: !64, isLocal: false, isDefinition: true, scopeLine: 52, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!64 = !DISubroutineType(types: !65)
!65 = !{null, !66}
!66 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !67, line: 197, baseType: !68)
!67 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/sys/types.h", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/476")
!68 = !DIBasicType(name: "long int", size: 64, align: 64, encoding: DW_ATE_signed)
!69 = !DILocalVariable(name: "longIntNumber", arg: 1, scope: !63, file: !8, line: 51, type: !66)
!70 = !DILocation(line: 51, column: 29, scope: !63)
!71 = !DILocation(line: 53, column: 21, scope: !63)
!72 = !DILocation(line: 53, column: 5, scope: !63)
!73 = !DILocation(line: 54, column: 1, scope: !63)
!74 = distinct !DISubprogram(name: "bad12", scope: !8, file: !8, line: 59, type: !75, isLocal: false, isDefinition: true, scopeLine: 60, isOptimized: false, unit: !0, variables: !2)
!75 = !DISubroutineType(types: !76)
!76 = !{null}
!77 = !DILocation(line: 61, column: 8, scope: !78)
!78 = distinct !DILexicalBlock(scope: !74, file: !8, line: 61, column: 8)
!79 = !DILocation(line: 61, column: 8, scope: !74)
!80 = !DILocalVariable(name: "twoIntsStructPointer", scope: !81, file: !8, line: 64, type: !83)
!81 = distinct !DILexicalBlock(scope: !82, file: !8, line: 63, column: 9)
!82 = distinct !DILexicalBlock(scope: !78, file: !8, line: 62, column: 5)
!83 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !84, size: 64, align: 64)
!84 = !DIDerivedType(tag: DW_TAG_typedef, name: "twoIntsStruct", file: !85, line: 14, baseType: !86)
!85 = !DIFile(filename: "./476.h", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/476")
!86 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_twoIntsStruct", file: !85, line: 10, size: 64, align: 32, elements: !87)
!87 = !{!88, !89}
!88 = !DIDerivedType(tag: DW_TAG_member, name: "intOne", scope: !86, file: !85, line: 12, baseType: !4, size: 32, align: 32)
!89 = !DIDerivedType(tag: DW_TAG_member, name: "intTwo", scope: !86, file: !85, line: 13, baseType: !4, size: 32, align: 32, offset: 32)
!90 = !DILocation(line: 64, column: 28, scope: !81)
!91 = !DILocation(line: 67, column: 18, scope: !92)
!92 = distinct !DILexicalBlock(scope: !81, file: !8, line: 67, column: 17)
!93 = !DILocation(line: 67, column: 39, scope: !92)
!94 = !DILocation(line: 67, column: 51, scope: !92)
!95 = !DILocation(line: 67, column: 73, scope: !92)
!96 = !DILocation(line: 67, column: 80, scope: !92)
!97 = !DILocation(line: 67, column: 48, scope: !92)
!98 = !DILocation(line: 67, column: 17, scope: !81)
!99 = !DILocation(line: 69, column: 17, scope: !100)
!100 = distinct !DILexicalBlock(scope: !92, file: !8, line: 68, column: 13)
!101 = !DILocation(line: 70, column: 13, scope: !100)
!102 = !DILocation(line: 72, column: 5, scope: !82)
!103 = !DILocalVariable(name: "twoIntsStructPointer", scope: !104, file: !8, line: 76, type: !83)
!104 = distinct !DILexicalBlock(scope: !105, file: !8, line: 75, column: 9)
!105 = distinct !DILexicalBlock(scope: !78, file: !8, line: 74, column: 5)
!106 = !DILocation(line: 76, column: 28, scope: !104)
!107 = !DILocation(line: 79, column: 18, scope: !108)
!108 = distinct !DILexicalBlock(scope: !104, file: !8, line: 79, column: 17)
!109 = !DILocation(line: 79, column: 39, scope: !108)
!110 = !DILocation(line: 79, column: 48, scope: !108)
!111 = !DILocation(line: 79, column: 52, scope: !112)
!112 = !DILexicalBlockFile(scope: !108, file: !8, discriminator: 1)
!113 = !DILocation(line: 79, column: 74, scope: !112)
!114 = !DILocation(line: 79, column: 81, scope: !112)
!115 = !DILocation(line: 79, column: 17, scope: !112)
!116 = !DILocation(line: 81, column: 17, scope: !117)
!117 = distinct !DILexicalBlock(scope: !108, file: !8, line: 80, column: 13)
!118 = !DILocation(line: 82, column: 13, scope: !117)
!119 = !DILocation(line: 85, column: 1, scope: !74)
!120 = distinct !DISubprogram(name: "good12", scope: !8, file: !8, line: 91, type: !75, isLocal: false, isDefinition: true, scopeLine: 92, isOptimized: false, unit: !0, variables: !2)
!121 = !DILocation(line: 93, column: 8, scope: !122)
!122 = distinct !DILexicalBlock(scope: !120, file: !8, line: 93, column: 8)
!123 = !DILocation(line: 93, column: 8, scope: !120)
!124 = !DILocalVariable(name: "twoIntsStructPointer", scope: !125, file: !8, line: 96, type: !83)
!125 = distinct !DILexicalBlock(scope: !126, file: !8, line: 95, column: 9)
!126 = distinct !DILexicalBlock(scope: !122, file: !8, line: 94, column: 5)
!127 = !DILocation(line: 96, column: 28, scope: !125)
!128 = !DILocation(line: 99, column: 18, scope: !129)
!129 = distinct !DILexicalBlock(scope: !125, file: !8, line: 99, column: 17)
!130 = !DILocation(line: 99, column: 39, scope: !129)
!131 = !DILocation(line: 99, column: 48, scope: !129)
!132 = !DILocation(line: 99, column: 52, scope: !133)
!133 = !DILexicalBlockFile(scope: !129, file: !8, discriminator: 1)
!134 = !DILocation(line: 99, column: 74, scope: !133)
!135 = !DILocation(line: 99, column: 81, scope: !133)
!136 = !DILocation(line: 99, column: 17, scope: !133)
!137 = !DILocation(line: 101, column: 17, scope: !138)
!138 = distinct !DILexicalBlock(scope: !129, file: !8, line: 100, column: 13)
!139 = !DILocation(line: 102, column: 13, scope: !138)
!140 = !DILocation(line: 104, column: 5, scope: !126)
!141 = !DILocalVariable(name: "twoIntsStructPointer", scope: !142, file: !8, line: 108, type: !83)
!142 = distinct !DILexicalBlock(scope: !143, file: !8, line: 107, column: 9)
!143 = distinct !DILexicalBlock(scope: !122, file: !8, line: 106, column: 5)
!144 = !DILocation(line: 108, column: 28, scope: !142)
!145 = !DILocation(line: 111, column: 18, scope: !146)
!146 = distinct !DILexicalBlock(scope: !142, file: !8, line: 111, column: 17)
!147 = !DILocation(line: 111, column: 39, scope: !146)
!148 = !DILocation(line: 111, column: 48, scope: !146)
!149 = !DILocation(line: 111, column: 52, scope: !150)
!150 = !DILexicalBlockFile(scope: !146, file: !8, discriminator: 1)
!151 = !DILocation(line: 111, column: 74, scope: !150)
!152 = !DILocation(line: 111, column: 81, scope: !150)
!153 = !DILocation(line: 111, column: 17, scope: !150)
!154 = !DILocation(line: 113, column: 17, scope: !155)
!155 = distinct !DILexicalBlock(scope: !146, file: !8, line: 112, column: 13)
!156 = !DILocation(line: 114, column: 13, scope: !155)
!157 = !DILocation(line: 117, column: 1, scope: !120)
!158 = distinct !DISubprogram(name: "main", scope: !8, file: !8, line: 122, type: !19, isLocal: false, isDefinition: true, scopeLine: 122, isOptimized: false, unit: !0, variables: !2)
!159 = !DILocation(line: 123, column: 2, scope: !158)
!160 = !DILocation(line: 124, column: 5, scope: !158)
!161 = !DILocation(line: 125, column: 5, scope: !158)
