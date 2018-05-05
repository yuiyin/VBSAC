; ModuleID = './415_1.c'
source_filename = "./415_1.c"
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
  call void @llvm.dbg.declare(metadata i8* %charHex.addr, metadata !33, metadata !34), !dbg !35
  %0 = load i8, i8* %charHex.addr, align 1, !dbg !36
  %conv = sext i8 %0 to i32, !dbg !37
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), i32 %conv), !dbg !38
  ret void, !dbg !39
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #2

declare i32 @printf(i8*, ...) #3

; Function Attrs: nounwind uwtable
define void @printLine(i8* %line) #0 !dbg !40 {
entry:
  %line.addr = alloca i8*, align 8
  store i8* %line, i8** %line.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %line.addr, metadata !45, metadata !34), !dbg !46
  %0 = load i8*, i8** %line.addr, align 8, !dbg !47
  %cmp = icmp ne i8* %0, null, !dbg !49
  br i1 %cmp, label %if.then, label %if.end, !dbg !50

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** %line.addr, align 8, !dbg !51
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i32 0, i32 0), i8* %1), !dbg !53
  br label %if.end, !dbg !54

if.end:                                           ; preds = %if.then, %entry
  ret void, !dbg !55
}

; Function Attrs: nounwind uwtable
define void @printIntLine(i32 %intNumber) #0 !dbg !56 {
entry:
  %intNumber.addr = alloca i32, align 4
  store i32 %intNumber, i32* %intNumber.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %intNumber.addr, metadata !59, metadata !34), !dbg !60
  %0 = load i32, i32* %intNumber.addr, align 4, !dbg !61
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), i32 %0), !dbg !62
  ret void, !dbg !63
}

; Function Attrs: nounwind uwtable
define void @printLongLine(i64 %longIntNumber) #0 !dbg !64 {
entry:
  %longIntNumber.addr = alloca i64, align 8
  store i64 %longIntNumber, i64* %longIntNumber.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %longIntNumber.addr, metadata !70, metadata !34), !dbg !71
  %0 = load i64, i64* %longIntNumber.addr, align 8, !dbg !72
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.2, i32 0, i32 0), i64 %0), !dbg !73
  ret void, !dbg !74
}

; Function Attrs: nounwind uwtable
define void @bad1() #0 !dbg !75 {
entry:
  %data = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !78, metadata !34), !dbg !79
  store i8* null, i8** %data, align 8, !dbg !80
  %call = call noalias i8* @malloc(i64 100) #4, !dbg !81
  store i8* %call, i8** %data, align 8, !dbg !82
  %0 = load i8*, i8** %data, align 8, !dbg !83
  %cmp = icmp eq i8* %0, null, !dbg !85
  br i1 %cmp, label %if.then, label %if.end, !dbg !86

if.then:                                          ; preds = %entry
  br label %return, !dbg !87

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !89
  call void @free(i8* %1) #4, !dbg !90
  %2 = load i8*, i8** %data, align 8, !dbg !91
  call void @free(i8* %2) #4, !dbg !92
  br label %return, !dbg !93

return:                                           ; preds = %if.end, %if.then
  ret void, !dbg !94
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #1

; Function Attrs: nounwind
declare void @free(i8*) #1

; Function Attrs: nounwind uwtable
define void @good1() #0 !dbg !96 {
entry:
  %data = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !97, metadata !34), !dbg !98
  store i8* null, i8** %data, align 8, !dbg !99
  %call = call noalias i8* @malloc(i64 100) #4, !dbg !100
  store i8* %call, i8** %data, align 8, !dbg !101
  %0 = load i8*, i8** %data, align 8, !dbg !102
  %cmp = icmp eq i8* %0, null, !dbg !104
  br i1 %cmp, label %if.then, label %if.end, !dbg !105

if.then:                                          ; preds = %entry
  br label %return, !dbg !106

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !108
  call void @free(i8* %1) #4, !dbg !109
  br label %return, !dbg !110

return:                                           ; preds = %if.end, %if.then
  ret void, !dbg !111
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !113 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @good1(), !dbg !114
  call void @bad1(), !dbg !115
  ret i32 1, !dbg !116
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
!1 = !DIFile(filename: "415_1.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/415")
!2 = !{}
!3 = !{!4, !5, !6}
!4 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64, align: 64)
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64, align: 64)
!7 = !DIBasicType(name: "char", size: 8, align: 8, encoding: DW_ATE_signed_char)
!8 = !{!9, !12, !13, !14, !15, !16}
!9 = distinct !DIGlobalVariable(name: "GLOBAL_CONST_TRUE", scope: !0, file: !10, line: 9, type: !11, isLocal: false, isDefinition: true, variable: i32* @GLOBAL_CONST_TRUE)
!10 = !DIFile(filename: "./415_1.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/415")
!11 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !4)
!12 = distinct !DIGlobalVariable(name: "GLOBAL_CONST_FALSE", scope: !0, file: !10, line: 10, type: !11, isLocal: false, isDefinition: true, variable: i32* @GLOBAL_CONST_FALSE)
!13 = distinct !DIGlobalVariable(name: "GLOBAL_CONST_FIVE", scope: !0, file: !10, line: 11, type: !11, isLocal: false, isDefinition: true, variable: i32* @GLOBAL_CONST_FIVE)
!14 = distinct !DIGlobalVariable(name: "globalTrue", scope: !0, file: !10, line: 13, type: !4, isLocal: false, isDefinition: true, variable: i32* @globalTrue)
!15 = distinct !DIGlobalVariable(name: "globalFalse", scope: !0, file: !10, line: 14, type: !4, isLocal: false, isDefinition: true, variable: i32* @globalFalse)
!16 = distinct !DIGlobalVariable(name: "globalFive", scope: !0, file: !10, line: 15, type: !4, isLocal: false, isDefinition: true, variable: i32* @globalFive)
!17 = !{i32 2, !"Dwarf Version", i32 4}
!18 = !{i32 2, !"Debug Info Version", i32 3}
!19 = !{!"clang version 3.9.0 (tags/RELEASE_390/final)"}
!20 = distinct !DISubprogram(name: "globalReturnsTrue", scope: !10, file: !10, line: 17, type: !21, isLocal: false, isDefinition: true, scopeLine: 18, isOptimized: false, unit: !0, variables: !2)
!21 = !DISubroutineType(types: !22)
!22 = !{!4}
!23 = !DILocation(line: 19, column: 5, scope: !20)
!24 = distinct !DISubprogram(name: "globalReturnsFalse", scope: !10, file: !10, line: 22, type: !21, isLocal: false, isDefinition: true, scopeLine: 23, isOptimized: false, unit: !0, variables: !2)
!25 = !DILocation(line: 24, column: 5, scope: !24)
!26 = distinct !DISubprogram(name: "globalReturnsTrueOrFalse", scope: !10, file: !10, line: 27, type: !21, isLocal: false, isDefinition: true, scopeLine: 28, isOptimized: false, unit: !0, variables: !2)
!27 = !DILocation(line: 29, column: 13, scope: !26)
!28 = !DILocation(line: 29, column: 20, scope: !26)
!29 = !DILocation(line: 29, column: 5, scope: !26)
!30 = distinct !DISubprogram(name: "printHexCharLine", scope: !10, file: !10, line: 32, type: !31, isLocal: false, isDefinition: true, scopeLine: 33, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!31 = !DISubroutineType(types: !32)
!32 = !{null, !7}
!33 = !DILocalVariable(name: "charHex", arg: 1, scope: !30, file: !10, line: 32, type: !7)
!34 = !DIExpression()
!35 = !DILocation(line: 32, column: 29, scope: !30)
!36 = !DILocation(line: 34, column: 25, scope: !30)
!37 = !DILocation(line: 34, column: 20, scope: !30)
!38 = !DILocation(line: 34, column: 5, scope: !30)
!39 = !DILocation(line: 35, column: 1, scope: !30)
!40 = distinct !DISubprogram(name: "printLine", scope: !10, file: !10, line: 37, type: !41, isLocal: false, isDefinition: true, scopeLine: 38, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!41 = !DISubroutineType(types: !42)
!42 = !{null, !43}
!43 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !44, size: 64, align: 64)
!44 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !7)
!45 = !DILocalVariable(name: "line", arg: 1, scope: !40, file: !10, line: 37, type: !43)
!46 = !DILocation(line: 37, column: 30, scope: !40)
!47 = !DILocation(line: 39, column: 8, scope: !48)
!48 = distinct !DILexicalBlock(scope: !40, file: !10, line: 39, column: 8)
!49 = !DILocation(line: 39, column: 13, scope: !48)
!50 = !DILocation(line: 39, column: 8, scope: !40)
!51 = !DILocation(line: 41, column: 24, scope: !52)
!52 = distinct !DILexicalBlock(scope: !48, file: !10, line: 40, column: 5)
!53 = !DILocation(line: 41, column: 9, scope: !52)
!54 = !DILocation(line: 42, column: 5, scope: !52)
!55 = !DILocation(line: 43, column: 1, scope: !40)
!56 = distinct !DISubprogram(name: "printIntLine", scope: !10, file: !10, line: 45, type: !57, isLocal: false, isDefinition: true, scopeLine: 46, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!57 = !DISubroutineType(types: !58)
!58 = !{null, !4}
!59 = !DILocalVariable(name: "intNumber", arg: 1, scope: !56, file: !10, line: 45, type: !4)
!60 = !DILocation(line: 45, column: 24, scope: !56)
!61 = !DILocation(line: 47, column: 20, scope: !56)
!62 = !DILocation(line: 47, column: 5, scope: !56)
!63 = !DILocation(line: 48, column: 1, scope: !56)
!64 = distinct !DISubprogram(name: "printLongLine", scope: !10, file: !10, line: 50, type: !65, isLocal: false, isDefinition: true, scopeLine: 51, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!65 = !DISubroutineType(types: !66)
!66 = !{null, !67}
!67 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !68, line: 197, baseType: !69)
!68 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/sys/types.h", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/415")
!69 = !DIBasicType(name: "long int", size: 64, align: 64, encoding: DW_ATE_signed)
!70 = !DILocalVariable(name: "longIntNumber", arg: 1, scope: !64, file: !10, line: 50, type: !67)
!71 = !DILocation(line: 50, column: 29, scope: !64)
!72 = !DILocation(line: 52, column: 21, scope: !64)
!73 = !DILocation(line: 52, column: 5, scope: !64)
!74 = !DILocation(line: 53, column: 1, scope: !64)
!75 = distinct !DISubprogram(name: "bad1", scope: !10, file: !10, line: 58, type: !76, isLocal: false, isDefinition: true, scopeLine: 59, isOptimized: false, unit: !0, variables: !2)
!76 = !DISubroutineType(types: !77)
!77 = !{null}
!78 = !DILocalVariable(name: "data", scope: !75, file: !10, line: 60, type: !6)
!79 = !DILocation(line: 60, column: 12, scope: !75)
!80 = !DILocation(line: 62, column: 10, scope: !75)
!81 = !DILocation(line: 63, column: 20, scope: !75)
!82 = !DILocation(line: 63, column: 10, scope: !75)
!83 = !DILocation(line: 64, column: 9, scope: !84)
!84 = distinct !DILexicalBlock(scope: !75, file: !10, line: 64, column: 9)
!85 = !DILocation(line: 64, column: 14, scope: !84)
!86 = !DILocation(line: 64, column: 9, scope: !75)
!87 = !DILocation(line: 64, column: 23, scope: !88)
!88 = !DILexicalBlockFile(scope: !84, file: !10, discriminator: 1)
!89 = !DILocation(line: 66, column: 10, scope: !75)
!90 = !DILocation(line: 66, column: 5, scope: !75)
!91 = !DILocation(line: 68, column: 10, scope: !75)
!92 = !DILocation(line: 68, column: 5, scope: !75)
!93 = !DILocation(line: 69, column: 1, scope: !75)
!94 = !DILocation(line: 69, column: 1, scope: !95)
!95 = !DILexicalBlockFile(scope: !75, file: !10, discriminator: 1)
!96 = distinct !DISubprogram(name: "good1", scope: !10, file: !10, line: 75, type: !76, isLocal: false, isDefinition: true, scopeLine: 76, isOptimized: false, unit: !0, variables: !2)
!97 = !DILocalVariable(name: "data", scope: !96, file: !10, line: 77, type: !6)
!98 = !DILocation(line: 77, column: 12, scope: !96)
!99 = !DILocation(line: 79, column: 10, scope: !96)
!100 = !DILocation(line: 80, column: 20, scope: !96)
!101 = !DILocation(line: 80, column: 10, scope: !96)
!102 = !DILocation(line: 81, column: 9, scope: !103)
!103 = distinct !DILexicalBlock(scope: !96, file: !10, line: 81, column: 9)
!104 = !DILocation(line: 81, column: 14, scope: !103)
!105 = !DILocation(line: 81, column: 9, scope: !96)
!106 = !DILocation(line: 81, column: 23, scope: !107)
!107 = !DILexicalBlockFile(scope: !103, file: !10, discriminator: 1)
!108 = !DILocation(line: 85, column: 10, scope: !96)
!109 = !DILocation(line: 85, column: 5, scope: !96)
!110 = !DILocation(line: 86, column: 1, scope: !96)
!111 = !DILocation(line: 86, column: 1, scope: !112)
!112 = !DILexicalBlockFile(scope: !96, file: !10, discriminator: 1)
!113 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 91, type: !21, isLocal: false, isDefinition: true, scopeLine: 91, isOptimized: false, unit: !0, variables: !2)
!114 = !DILocation(line: 92, column: 5, scope: !113)
!115 = !DILocation(line: 93, column: 2, scope: !113)
!116 = !DILocation(line: 94, column: 5, scope: !113)
