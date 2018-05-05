; ModuleID = './415_36.c'
source_filename = "./415_36.c"
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
  call void @llvm.dbg.declare(metadata i64* %longIntNumber.addr, metadata !70, metadata !35), !dbg !71
  %0 = load i64, i64* %longIntNumber.addr, align 8, !dbg !72
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.2, i32 0, i32 0), i64 %0), !dbg !73
  ret void, !dbg !74
}

; Function Attrs: nounwind uwtable
define void @bad36() #0 !dbg !75 {
entry:
  %data = alloca i64*, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !78, metadata !35), !dbg !79
  store i64* null, i64** %data, align 8, !dbg !80
  %call = call noalias i8* @malloc(i64 800) #4, !dbg !81
  %0 = bitcast i8* %call to i64*, !dbg !84
  store i64* %0, i64** %data, align 8, !dbg !85
  %1 = load i64*, i64** %data, align 8, !dbg !86
  %cmp = icmp eq i64* %1, null, !dbg !88
  br i1 %cmp, label %if.then, label %if.end, !dbg !89

if.then:                                          ; preds = %entry
  br label %return, !dbg !90

if.end:                                           ; preds = %entry
  %2 = load i64*, i64** %data, align 8, !dbg !92
  %3 = bitcast i64* %2 to i8*, !dbg !92
  call void @free(i8* %3) #4, !dbg !93
  %4 = load i64*, i64** %data, align 8, !dbg !94
  %5 = bitcast i64* %4 to i8*, !dbg !94
  call void @free(i8* %5) #4, !dbg !97
  br label %return, !dbg !98

return:                                           ; preds = %if.end, %if.then
  ret void, !dbg !99
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #1

; Function Attrs: nounwind
declare void @free(i8*) #1

; Function Attrs: nounwind uwtable
define void @good36() #0 !dbg !101 {
entry:
  %data = alloca i64*, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !102, metadata !35), !dbg !103
  store i64* null, i64** %data, align 8, !dbg !104
  %call = call noalias i8* @malloc(i64 800) #4, !dbg !105
  %0 = bitcast i8* %call to i64*, !dbg !108
  store i64* %0, i64** %data, align 8, !dbg !109
  %1 = load i64*, i64** %data, align 8, !dbg !110
  %cmp = icmp eq i64* %1, null, !dbg !112
  br i1 %cmp, label %if.then, label %if.end, !dbg !113

if.then:                                          ; preds = %entry
  br label %return, !dbg !114

if.end:                                           ; preds = %entry
  %2 = load i64*, i64** %data, align 8, !dbg !116
  %3 = bitcast i64* %2 to i8*, !dbg !116
  call void @free(i8* %3) #4, !dbg !117
  br label %return, !dbg !118

return:                                           ; preds = %if.end, %if.then
  ret void, !dbg !119
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !121 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @good36(), !dbg !122
  call void @bad36(), !dbg !123
  ret i32 1, !dbg !124
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone }
attributes #3 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!17, !18}
!llvm.ident = !{!19}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (tags/RELEASE_390/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, globals: !8)
!1 = !DIFile(filename: "415_36.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/415")
!2 = !{}
!3 = !{!4, !5, !6}
!4 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64, align: 64)
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64, align: 64)
!7 = !DIBasicType(name: "long int", size: 64, align: 64, encoding: DW_ATE_signed)
!8 = !{!9, !12, !13, !14, !15, !16}
!9 = distinct !DIGlobalVariable(name: "GLOBAL_CONST_TRUE", scope: !0, file: !10, line: 10, type: !11, isLocal: false, isDefinition: true, variable: i32* @GLOBAL_CONST_TRUE)
!10 = !DIFile(filename: "./415_36.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/415")
!11 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !4)
!12 = distinct !DIGlobalVariable(name: "GLOBAL_CONST_FALSE", scope: !0, file: !10, line: 11, type: !11, isLocal: false, isDefinition: true, variable: i32* @GLOBAL_CONST_FALSE)
!13 = distinct !DIGlobalVariable(name: "GLOBAL_CONST_FIVE", scope: !0, file: !10, line: 12, type: !11, isLocal: false, isDefinition: true, variable: i32* @GLOBAL_CONST_FIVE)
!14 = distinct !DIGlobalVariable(name: "globalTrue", scope: !0, file: !10, line: 14, type: !4, isLocal: false, isDefinition: true, variable: i32* @globalTrue)
!15 = distinct !DIGlobalVariable(name: "globalFalse", scope: !0, file: !10, line: 15, type: !4, isLocal: false, isDefinition: true, variable: i32* @globalFalse)
!16 = distinct !DIGlobalVariable(name: "globalFive", scope: !0, file: !10, line: 16, type: !4, isLocal: false, isDefinition: true, variable: i32* @globalFive)
!17 = !{i32 2, !"Dwarf Version", i32 4}
!18 = !{i32 2, !"Debug Info Version", i32 3}
!19 = !{!"clang version 3.9.0 (tags/RELEASE_390/final)"}
!20 = distinct !DISubprogram(name: "globalReturnsTrue", scope: !10, file: !10, line: 18, type: !21, isLocal: false, isDefinition: true, scopeLine: 19, isOptimized: false, unit: !0, variables: !2)
!21 = !DISubroutineType(types: !22)
!22 = !{!4}
!23 = !DILocation(line: 20, column: 5, scope: !20)
!24 = distinct !DISubprogram(name: "globalReturnsFalse", scope: !10, file: !10, line: 23, type: !21, isLocal: false, isDefinition: true, scopeLine: 24, isOptimized: false, unit: !0, variables: !2)
!25 = !DILocation(line: 25, column: 5, scope: !24)
!26 = distinct !DISubprogram(name: "globalReturnsTrueOrFalse", scope: !10, file: !10, line: 28, type: !21, isLocal: false, isDefinition: true, scopeLine: 29, isOptimized: false, unit: !0, variables: !2)
!27 = !DILocation(line: 30, column: 13, scope: !26)
!28 = !DILocation(line: 30, column: 20, scope: !26)
!29 = !DILocation(line: 30, column: 5, scope: !26)
!30 = distinct !DISubprogram(name: "printHexCharLine", scope: !10, file: !10, line: 33, type: !31, isLocal: false, isDefinition: true, scopeLine: 34, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!31 = !DISubroutineType(types: !32)
!32 = !{null, !33}
!33 = !DIBasicType(name: "char", size: 8, align: 8, encoding: DW_ATE_signed_char)
!34 = !DILocalVariable(name: "charHex", arg: 1, scope: !30, file: !10, line: 33, type: !33)
!35 = !DIExpression()
!36 = !DILocation(line: 33, column: 29, scope: !30)
!37 = !DILocation(line: 35, column: 25, scope: !30)
!38 = !DILocation(line: 35, column: 20, scope: !30)
!39 = !DILocation(line: 35, column: 5, scope: !30)
!40 = !DILocation(line: 36, column: 1, scope: !30)
!41 = distinct !DISubprogram(name: "printLine", scope: !10, file: !10, line: 38, type: !42, isLocal: false, isDefinition: true, scopeLine: 39, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!42 = !DISubroutineType(types: !43)
!43 = !{null, !44}
!44 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !45, size: 64, align: 64)
!45 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !33)
!46 = !DILocalVariable(name: "line", arg: 1, scope: !41, file: !10, line: 38, type: !44)
!47 = !DILocation(line: 38, column: 30, scope: !41)
!48 = !DILocation(line: 40, column: 8, scope: !49)
!49 = distinct !DILexicalBlock(scope: !41, file: !10, line: 40, column: 8)
!50 = !DILocation(line: 40, column: 13, scope: !49)
!51 = !DILocation(line: 40, column: 8, scope: !41)
!52 = !DILocation(line: 42, column: 24, scope: !53)
!53 = distinct !DILexicalBlock(scope: !49, file: !10, line: 41, column: 5)
!54 = !DILocation(line: 42, column: 9, scope: !53)
!55 = !DILocation(line: 43, column: 5, scope: !53)
!56 = !DILocation(line: 44, column: 1, scope: !41)
!57 = distinct !DISubprogram(name: "printIntLine", scope: !10, file: !10, line: 46, type: !58, isLocal: false, isDefinition: true, scopeLine: 47, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!58 = !DISubroutineType(types: !59)
!59 = !{null, !4}
!60 = !DILocalVariable(name: "intNumber", arg: 1, scope: !57, file: !10, line: 46, type: !4)
!61 = !DILocation(line: 46, column: 24, scope: !57)
!62 = !DILocation(line: 48, column: 20, scope: !57)
!63 = !DILocation(line: 48, column: 5, scope: !57)
!64 = !DILocation(line: 49, column: 1, scope: !57)
!65 = distinct !DISubprogram(name: "printLongLine", scope: !10, file: !10, line: 51, type: !66, isLocal: false, isDefinition: true, scopeLine: 52, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!66 = !DISubroutineType(types: !67)
!67 = !{null, !68}
!68 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !69, line: 197, baseType: !7)
!69 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/sys/types.h", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/415")
!70 = !DILocalVariable(name: "longIntNumber", arg: 1, scope: !65, file: !10, line: 51, type: !68)
!71 = !DILocation(line: 51, column: 29, scope: !65)
!72 = !DILocation(line: 53, column: 21, scope: !65)
!73 = !DILocation(line: 53, column: 5, scope: !65)
!74 = !DILocation(line: 54, column: 1, scope: !65)
!75 = distinct !DISubprogram(name: "bad36", scope: !10, file: !10, line: 61, type: !76, isLocal: false, isDefinition: true, scopeLine: 62, isOptimized: false, unit: !0, variables: !2)
!76 = !DISubroutineType(types: !77)
!77 = !{null}
!78 = !DILocalVariable(name: "data", scope: !75, file: !10, line: 63, type: !6)
!79 = !DILocation(line: 63, column: 12, scope: !75)
!80 = !DILocation(line: 65, column: 10, scope: !75)
!81 = !DILocation(line: 68, column: 24, scope: !82)
!82 = distinct !DILexicalBlock(scope: !83, file: !10, line: 67, column: 5)
!83 = distinct !DILexicalBlock(scope: !75, file: !10, line: 66, column: 8)
!84 = !DILocation(line: 68, column: 16, scope: !82)
!85 = !DILocation(line: 68, column: 14, scope: !82)
!86 = !DILocation(line: 69, column: 13, scope: !87)
!87 = distinct !DILexicalBlock(scope: !82, file: !10, line: 69, column: 13)
!88 = !DILocation(line: 69, column: 18, scope: !87)
!89 = !DILocation(line: 69, column: 13, scope: !82)
!90 = !DILocation(line: 69, column: 27, scope: !91)
!91 = !DILexicalBlockFile(scope: !87, file: !10, discriminator: 1)
!92 = !DILocation(line: 71, column: 14, scope: !82)
!93 = !DILocation(line: 71, column: 9, scope: !82)
!94 = !DILocation(line: 76, column: 14, scope: !95)
!95 = distinct !DILexicalBlock(scope: !96, file: !10, line: 74, column: 5)
!96 = distinct !DILexicalBlock(scope: !75, file: !10, line: 73, column: 8)
!97 = !DILocation(line: 76, column: 9, scope: !95)
!98 = !DILocation(line: 78, column: 1, scope: !75)
!99 = !DILocation(line: 78, column: 1, scope: !100)
!100 = !DILexicalBlockFile(scope: !75, file: !10, discriminator: 1)
!101 = distinct !DISubprogram(name: "good36", scope: !10, file: !10, line: 84, type: !76, isLocal: false, isDefinition: true, scopeLine: 85, isOptimized: false, unit: !0, variables: !2)
!102 = !DILocalVariable(name: "data", scope: !101, file: !10, line: 86, type: !6)
!103 = !DILocation(line: 86, column: 12, scope: !101)
!104 = !DILocation(line: 88, column: 10, scope: !101)
!105 = !DILocation(line: 91, column: 24, scope: !106)
!106 = distinct !DILexicalBlock(scope: !107, file: !10, line: 90, column: 5)
!107 = distinct !DILexicalBlock(scope: !101, file: !10, line: 89, column: 8)
!108 = !DILocation(line: 91, column: 16, scope: !106)
!109 = !DILocation(line: 91, column: 14, scope: !106)
!110 = !DILocation(line: 92, column: 13, scope: !111)
!111 = distinct !DILexicalBlock(scope: !106, file: !10, line: 92, column: 13)
!112 = !DILocation(line: 92, column: 18, scope: !111)
!113 = !DILocation(line: 92, column: 13, scope: !106)
!114 = !DILocation(line: 92, column: 27, scope: !115)
!115 = !DILexicalBlockFile(scope: !111, file: !10, discriminator: 1)
!116 = !DILocation(line: 94, column: 14, scope: !106)
!117 = !DILocation(line: 94, column: 9, scope: !106)
!118 = !DILocation(line: 107, column: 1, scope: !101)
!119 = !DILocation(line: 107, column: 1, scope: !120)
!120 = !DILexicalBlockFile(scope: !101, file: !10, discriminator: 1)
!121 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 111, type: !21, isLocal: false, isDefinition: true, scopeLine: 111, isOptimized: false, unit: !0, variables: !2)
!122 = !DILocation(line: 112, column: 5, scope: !121)
!123 = !DILocation(line: 113, column: 2, scope: !121)
!124 = !DILocation(line: 114, column: 5, scope: !121)
