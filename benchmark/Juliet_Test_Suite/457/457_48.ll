; ModuleID = './457_48.c'
source_filename = "./457_48.c"
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
define void @bad48() #0 !dbg !74 {
entry:
  %data = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64* %data, metadata !77, metadata !33), !dbg !78
  %call = call i32 @globalReturnsTrueOrFalse(), !dbg !79
  %tobool = icmp ne i32 %call, 0, !dbg !79
  br i1 %tobool, label %if.then, label %if.else, !dbg !81

if.then:                                          ; preds = %entry
  br label %if.end, !dbg !82

if.else:                                          ; preds = %entry
  store i64 5, i64* %data, align 8, !dbg !84
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %call1 = call i32 @globalReturnsTrueOrFalse(), !dbg !86
  %tobool2 = icmp ne i32 %call1, 0, !dbg !86
  br i1 %tobool2, label %if.then3, label %if.else4, !dbg !88

if.then3:                                         ; preds = %if.end
  %0 = load i64, i64* %data, align 8, !dbg !89
  call void @printLongLine(i64 %0), !dbg !91
  br label %if.end5, !dbg !92

if.else4:                                         ; preds = %if.end
  store i64 5, i64* %data, align 8, !dbg !93
  %1 = load i64, i64* %data, align 8, !dbg !95
  call void @printLongLine(i64 %1), !dbg !96
  br label %if.end5

if.end5:                                          ; preds = %if.else4, %if.then3
  ret void, !dbg !97
}

; Function Attrs: nounwind uwtable
define void @good48() #0 !dbg !98 {
entry:
  %data = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64* %data, metadata !99, metadata !33), !dbg !100
  %call = call i32 @globalReturnsTrueOrFalse(), !dbg !101
  %tobool = icmp ne i32 %call, 0, !dbg !101
  br i1 %tobool, label %if.then, label %if.else, !dbg !103

if.then:                                          ; preds = %entry
  br label %if.end, !dbg !104

if.else:                                          ; preds = %entry
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %call1 = call i32 @globalReturnsTrueOrFalse(), !dbg !106
  %tobool2 = icmp ne i32 %call1, 0, !dbg !106
  br i1 %tobool2, label %if.then3, label %if.else4, !dbg !108

if.then3:                                         ; preds = %if.end
  store i64 5, i64* %data, align 8, !dbg !109
  %0 = load i64, i64* %data, align 8, !dbg !111
  call void @printLongLine(i64 %0), !dbg !112
  br label %if.end5, !dbg !113

if.else4:                                         ; preds = %if.end
  store i64 5, i64* %data, align 8, !dbg !114
  %1 = load i64, i64* %data, align 8, !dbg !116
  call void @printLongLine(i64 %1), !dbg !117
  br label %if.end5

if.end5:                                          ; preds = %if.else4, %if.then3
  ret void, !dbg !118
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !119 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @good48(), !dbg !120
  call void @bad48(), !dbg !121
  ret i32 1, !dbg !122
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
!1 = !DIFile(filename: "457_48.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/457")
!2 = !{}
!3 = !{!4, !5}
!4 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64, align: 64)
!6 = !{!7, !10, !11, !12, !13, !14}
!7 = distinct !DIGlobalVariable(name: "GLOBAL_CONST_TRUE", scope: !0, file: !8, line: 10, type: !9, isLocal: false, isDefinition: true, variable: i32* @GLOBAL_CONST_TRUE)
!8 = !DIFile(filename: "./457_48.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/457")
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
!67 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/sys/types.h", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/457")
!68 = !DIBasicType(name: "long int", size: 64, align: 64, encoding: DW_ATE_signed)
!69 = !DILocalVariable(name: "longIntNumber", arg: 1, scope: !63, file: !8, line: 51, type: !66)
!70 = !DILocation(line: 51, column: 29, scope: !63)
!71 = !DILocation(line: 53, column: 21, scope: !63)
!72 = !DILocation(line: 53, column: 5, scope: !63)
!73 = !DILocation(line: 54, column: 1, scope: !63)
!74 = distinct !DISubprogram(name: "bad48", scope: !8, file: !8, line: 59, type: !75, isLocal: false, isDefinition: true, scopeLine: 60, isOptimized: false, unit: !0, variables: !2)
!75 = !DISubroutineType(types: !76)
!76 = !{null}
!77 = !DILocalVariable(name: "data", scope: !74, file: !8, line: 61, type: !66)
!78 = !DILocation(line: 61, column: 13, scope: !74)
!79 = !DILocation(line: 62, column: 8, scope: !80)
!80 = distinct !DILexicalBlock(scope: !74, file: !8, line: 62, column: 8)
!81 = !DILocation(line: 62, column: 8, scope: !74)
!82 = !DILocation(line: 66, column: 5, scope: !83)
!83 = distinct !DILexicalBlock(scope: !80, file: !8, line: 63, column: 5)
!84 = !DILocation(line: 70, column: 14, scope: !85)
!85 = distinct !DILexicalBlock(scope: !80, file: !8, line: 68, column: 5)
!86 = !DILocation(line: 72, column: 8, scope: !87)
!87 = distinct !DILexicalBlock(scope: !74, file: !8, line: 72, column: 8)
!88 = !DILocation(line: 72, column: 8, scope: !74)
!89 = !DILocation(line: 75, column: 23, scope: !90)
!90 = distinct !DILexicalBlock(scope: !87, file: !8, line: 73, column: 5)
!91 = !DILocation(line: 75, column: 9, scope: !90)
!92 = !DILocation(line: 76, column: 5, scope: !90)
!93 = !DILocation(line: 80, column: 14, scope: !94)
!94 = distinct !DILexicalBlock(scope: !87, file: !8, line: 78, column: 5)
!95 = !DILocation(line: 81, column: 23, scope: !94)
!96 = !DILocation(line: 81, column: 9, scope: !94)
!97 = !DILocation(line: 83, column: 1, scope: !74)
!98 = distinct !DISubprogram(name: "good48", scope: !8, file: !8, line: 89, type: !75, isLocal: false, isDefinition: true, scopeLine: 90, isOptimized: false, unit: !0, variables: !2)
!99 = !DILocalVariable(name: "data", scope: !98, file: !8, line: 91, type: !66)
!100 = !DILocation(line: 91, column: 13, scope: !98)
!101 = !DILocation(line: 92, column: 8, scope: !102)
!102 = distinct !DILexicalBlock(scope: !98, file: !8, line: 92, column: 8)
!103 = !DILocation(line: 92, column: 8, scope: !98)
!104 = !DILocation(line: 96, column: 5, scope: !105)
!105 = distinct !DILexicalBlock(scope: !102, file: !8, line: 93, column: 5)
!106 = !DILocation(line: 102, column: 8, scope: !107)
!107 = distinct !DILexicalBlock(scope: !98, file: !8, line: 102, column: 8)
!108 = !DILocation(line: 102, column: 8, scope: !98)
!109 = !DILocation(line: 105, column: 14, scope: !110)
!110 = distinct !DILexicalBlock(scope: !107, file: !8, line: 103, column: 5)
!111 = !DILocation(line: 106, column: 23, scope: !110)
!112 = !DILocation(line: 106, column: 9, scope: !110)
!113 = !DILocation(line: 107, column: 5, scope: !110)
!114 = !DILocation(line: 111, column: 14, scope: !115)
!115 = distinct !DILexicalBlock(scope: !107, file: !8, line: 109, column: 5)
!116 = !DILocation(line: 112, column: 23, scope: !115)
!117 = !DILocation(line: 112, column: 9, scope: !115)
!118 = !DILocation(line: 114, column: 1, scope: !98)
!119 = distinct !DISubprogram(name: "main", scope: !8, file: !8, line: 117, type: !19, isLocal: false, isDefinition: true, scopeLine: 117, isOptimized: false, unit: !0, variables: !2)
!120 = !DILocation(line: 118, column: 5, scope: !119)
!121 = !DILocation(line: 119, column: 2, scope: !119)
!122 = !DILocation(line: 120, column: 5, scope: !119)
