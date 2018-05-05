; ModuleID = './190_21.c'
source_filename = "./190_21.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@.str.1 = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1
@.str.2 = private unnamed_addr constant [5 x i8] c"%ld\0A\00", align 1

; Function Attrs: nounwind uwtable
define void @printHexCharLine(i8 signext %charHex) #0 !dbg !9 {
entry:
  %charHex.addr = alloca i8, align 1
  store i8 %charHex, i8* %charHex.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %charHex.addr, metadata !14, metadata !15), !dbg !16
  %0 = load i8, i8* %charHex.addr, align 1, !dbg !17
  %conv = sext i8 %0 to i32, !dbg !18
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), i32 %conv), !dbg !19
  ret void, !dbg !20
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @printf(i8*, ...) #2

; Function Attrs: nounwind uwtable
define void @printLine(i8* %line) #0 !dbg !21 {
entry:
  %line.addr = alloca i8*, align 8
  store i8* %line, i8** %line.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %line.addr, metadata !26, metadata !15), !dbg !27
  %0 = load i8*, i8** %line.addr, align 8, !dbg !28
  %cmp = icmp ne i8* %0, null, !dbg !30
  br i1 %cmp, label %if.then, label %if.end, !dbg !31

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** %line.addr, align 8, !dbg !32
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i32 0, i32 0), i8* %1), !dbg !34
  br label %if.end, !dbg !35

if.end:                                           ; preds = %if.then, %entry
  ret void, !dbg !36
}

; Function Attrs: nounwind uwtable
define void @printIntLine(i32 %intNumber) #0 !dbg !37 {
entry:
  %intNumber.addr = alloca i32, align 4
  store i32 %intNumber, i32* %intNumber.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %intNumber.addr, metadata !40, metadata !15), !dbg !41
  %0 = load i32, i32* %intNumber.addr, align 4, !dbg !42
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), i32 %0), !dbg !43
  ret void, !dbg !44
}

; Function Attrs: nounwind uwtable
define void @printLongLine(i64 %longIntNumber) #0 !dbg !45 {
entry:
  %longIntNumber.addr = alloca i64, align 8
  store i64 %longIntNumber, i64* %longIntNumber.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %longIntNumber.addr, metadata !51, metadata !15), !dbg !52
  %0 = load i64, i64* %longIntNumber.addr, align 8, !dbg !53
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.2, i32 0, i32 0), i64 %0), !dbg !54
  ret void, !dbg !55
}

; Function Attrs: nounwind uwtable
define void @bad21() #0 !dbg !56 {
entry:
  %data = alloca i32, align 4
  %dataPtr1 = alloca i32*, align 8
  %dataPtr2 = alloca i32*, align 8
  %data1 = alloca i32, align 4
  %data2 = alloca i32, align 4
  %result = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !59, metadata !15), !dbg !60
  call void @llvm.dbg.declare(metadata i32** %dataPtr1, metadata !61, metadata !15), !dbg !63
  store i32* %data, i32** %dataPtr1, align 8, !dbg !63
  call void @llvm.dbg.declare(metadata i32** %dataPtr2, metadata !64, metadata !15), !dbg !65
  store i32* %data, i32** %dataPtr2, align 8, !dbg !65
  store i32 0, i32* %data, align 4, !dbg !66
  call void @llvm.dbg.declare(metadata i32* %data1, metadata !67, metadata !15), !dbg !69
  %0 = load i32*, i32** %dataPtr1, align 8, !dbg !70
  %1 = load i32, i32* %0, align 4, !dbg !71
  store i32 %1, i32* %data1, align 4, !dbg !69
  store i32 2147483647, i32* %data1, align 4, !dbg !72
  %2 = load i32, i32* %data1, align 4, !dbg !73
  %3 = load i32*, i32** %dataPtr1, align 8, !dbg !74
  store i32 %2, i32* %3, align 4, !dbg !75
  call void @llvm.dbg.declare(metadata i32* %data2, metadata !76, metadata !15), !dbg !78
  %4 = load i32*, i32** %dataPtr2, align 8, !dbg !79
  %5 = load i32, i32* %4, align 4, !dbg !80
  store i32 %5, i32* %data2, align 4, !dbg !78
  call void @llvm.dbg.declare(metadata i32* %result, metadata !81, metadata !15), !dbg !83
  %6 = load i32, i32* %data2, align 4, !dbg !84
  %7 = load i32, i32* %data2, align 4, !dbg !85
  %mul = mul nsw i32 %6, %7, !dbg !86
  store i32 %mul, i32* %result, align 4, !dbg !83
  %8 = load i32, i32* %result, align 4, !dbg !87
  call void @printIntLine(i32 %8), !dbg !88
  ret void, !dbg !89
}

; Function Attrs: nounwind uwtable
define void @good21() #0 !dbg !90 {
entry:
  %data = alloca i32, align 4
  %dataPtr1 = alloca i32*, align 8
  %dataPtr2 = alloca i32*, align 8
  %data1 = alloca i32, align 4
  %data2 = alloca i32, align 4
  %result = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !91, metadata !15), !dbg !92
  call void @llvm.dbg.declare(metadata i32** %dataPtr1, metadata !93, metadata !15), !dbg !94
  store i32* %data, i32** %dataPtr1, align 8, !dbg !94
  call void @llvm.dbg.declare(metadata i32** %dataPtr2, metadata !95, metadata !15), !dbg !96
  store i32* %data, i32** %dataPtr2, align 8, !dbg !96
  store i32 0, i32* %data, align 4, !dbg !97
  call void @llvm.dbg.declare(metadata i32* %data1, metadata !98, metadata !15), !dbg !100
  %0 = load i32*, i32** %dataPtr1, align 8, !dbg !101
  %1 = load i32, i32* %0, align 4, !dbg !102
  store i32 %1, i32* %data1, align 4, !dbg !100
  store i32 2, i32* %data1, align 4, !dbg !103
  %2 = load i32, i32* %data1, align 4, !dbg !104
  %3 = load i32*, i32** %dataPtr1, align 8, !dbg !105
  store i32 %2, i32* %3, align 4, !dbg !106
  call void @llvm.dbg.declare(metadata i32* %data2, metadata !107, metadata !15), !dbg !109
  %4 = load i32*, i32** %dataPtr2, align 8, !dbg !110
  %5 = load i32, i32* %4, align 4, !dbg !111
  store i32 %5, i32* %data2, align 4, !dbg !109
  call void @llvm.dbg.declare(metadata i32* %result, metadata !112, metadata !15), !dbg !114
  %6 = load i32, i32* %data2, align 4, !dbg !115
  %7 = load i32, i32* %data2, align 4, !dbg !116
  %mul = mul nsw i32 %6, %7, !dbg !117
  store i32 %mul, i32* %result, align 4, !dbg !114
  %8 = load i32, i32* %result, align 4, !dbg !118
  call void @printIntLine(i32 %8), !dbg !119
  ret void, !dbg !120
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !121 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @good21(), !dbg !124
  call void @bad21(), !dbg !125
  ret i32 1, !dbg !126
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (tags/RELEASE_390/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3)
!1 = !DIFile(filename: "190_21.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/190")
!2 = !{}
!3 = !{!4, !5}
!4 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64, align: 64)
!6 = !{i32 2, !"Dwarf Version", i32 4}
!7 = !{i32 2, !"Debug Info Version", i32 3}
!8 = !{!"clang version 3.9.0 (tags/RELEASE_390/final)"}
!9 = distinct !DISubprogram(name: "printHexCharLine", scope: !10, file: !10, line: 10, type: !11, isLocal: false, isDefinition: true, scopeLine: 11, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!10 = !DIFile(filename: "./190_21.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/190")
!11 = !DISubroutineType(types: !12)
!12 = !{null, !13}
!13 = !DIBasicType(name: "char", size: 8, align: 8, encoding: DW_ATE_signed_char)
!14 = !DILocalVariable(name: "charHex", arg: 1, scope: !9, file: !10, line: 10, type: !13)
!15 = !DIExpression()
!16 = !DILocation(line: 10, column: 29, scope: !9)
!17 = !DILocation(line: 12, column: 25, scope: !9)
!18 = !DILocation(line: 12, column: 20, scope: !9)
!19 = !DILocation(line: 12, column: 5, scope: !9)
!20 = !DILocation(line: 13, column: 1, scope: !9)
!21 = distinct !DISubprogram(name: "printLine", scope: !10, file: !10, line: 15, type: !22, isLocal: false, isDefinition: true, scopeLine: 16, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!22 = !DISubroutineType(types: !23)
!23 = !{null, !24}
!24 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !25, size: 64, align: 64)
!25 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !13)
!26 = !DILocalVariable(name: "line", arg: 1, scope: !21, file: !10, line: 15, type: !24)
!27 = !DILocation(line: 15, column: 30, scope: !21)
!28 = !DILocation(line: 17, column: 8, scope: !29)
!29 = distinct !DILexicalBlock(scope: !21, file: !10, line: 17, column: 8)
!30 = !DILocation(line: 17, column: 13, scope: !29)
!31 = !DILocation(line: 17, column: 8, scope: !21)
!32 = !DILocation(line: 19, column: 24, scope: !33)
!33 = distinct !DILexicalBlock(scope: !29, file: !10, line: 18, column: 5)
!34 = !DILocation(line: 19, column: 9, scope: !33)
!35 = !DILocation(line: 20, column: 5, scope: !33)
!36 = !DILocation(line: 21, column: 1, scope: !21)
!37 = distinct !DISubprogram(name: "printIntLine", scope: !10, file: !10, line: 23, type: !38, isLocal: false, isDefinition: true, scopeLine: 24, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!38 = !DISubroutineType(types: !39)
!39 = !{null, !4}
!40 = !DILocalVariable(name: "intNumber", arg: 1, scope: !37, file: !10, line: 23, type: !4)
!41 = !DILocation(line: 23, column: 24, scope: !37)
!42 = !DILocation(line: 25, column: 20, scope: !37)
!43 = !DILocation(line: 25, column: 5, scope: !37)
!44 = !DILocation(line: 26, column: 1, scope: !37)
!45 = distinct !DISubprogram(name: "printLongLine", scope: !10, file: !10, line: 28, type: !46, isLocal: false, isDefinition: true, scopeLine: 29, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!46 = !DISubroutineType(types: !47)
!47 = !{null, !48}
!48 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !49, line: 197, baseType: !50)
!49 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/sys/types.h", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/190")
!50 = !DIBasicType(name: "long int", size: 64, align: 64, encoding: DW_ATE_signed)
!51 = !DILocalVariable(name: "longIntNumber", arg: 1, scope: !45, file: !10, line: 28, type: !48)
!52 = !DILocation(line: 28, column: 29, scope: !45)
!53 = !DILocation(line: 30, column: 21, scope: !45)
!54 = !DILocation(line: 30, column: 5, scope: !45)
!55 = !DILocation(line: 31, column: 1, scope: !45)
!56 = distinct !DISubprogram(name: "bad21", scope: !10, file: !10, line: 34, type: !57, isLocal: false, isDefinition: true, scopeLine: 35, isOptimized: false, unit: !0, variables: !2)
!57 = !DISubroutineType(types: !58)
!58 = !{null}
!59 = !DILocalVariable(name: "data", scope: !56, file: !10, line: 36, type: !4)
!60 = !DILocation(line: 36, column: 9, scope: !56)
!61 = !DILocalVariable(name: "dataPtr1", scope: !56, file: !10, line: 37, type: !62)
!62 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64, align: 64)
!63 = !DILocation(line: 37, column: 10, scope: !56)
!64 = !DILocalVariable(name: "dataPtr2", scope: !56, file: !10, line: 38, type: !62)
!65 = !DILocation(line: 38, column: 10, scope: !56)
!66 = !DILocation(line: 40, column: 10, scope: !56)
!67 = !DILocalVariable(name: "data", scope: !68, file: !10, line: 42, type: !4)
!68 = distinct !DILexicalBlock(scope: !56, file: !10, line: 41, column: 5)
!69 = !DILocation(line: 42, column: 13, scope: !68)
!70 = !DILocation(line: 42, column: 21, scope: !68)
!71 = !DILocation(line: 42, column: 20, scope: !68)
!72 = !DILocation(line: 44, column: 14, scope: !68)
!73 = !DILocation(line: 45, column: 21, scope: !68)
!74 = !DILocation(line: 45, column: 10, scope: !68)
!75 = !DILocation(line: 45, column: 19, scope: !68)
!76 = !DILocalVariable(name: "data", scope: !77, file: !10, line: 48, type: !4)
!77 = distinct !DILexicalBlock(scope: !56, file: !10, line: 47, column: 5)
!78 = !DILocation(line: 48, column: 13, scope: !77)
!79 = !DILocation(line: 48, column: 21, scope: !77)
!80 = !DILocation(line: 48, column: 20, scope: !77)
!81 = !DILocalVariable(name: "result", scope: !82, file: !10, line: 51, type: !4)
!82 = distinct !DILexicalBlock(scope: !77, file: !10, line: 49, column: 9)
!83 = !DILocation(line: 51, column: 17, scope: !82)
!84 = !DILocation(line: 51, column: 26, scope: !82)
!85 = !DILocation(line: 51, column: 33, scope: !82)
!86 = !DILocation(line: 51, column: 31, scope: !82)
!87 = !DILocation(line: 52, column: 26, scope: !82)
!88 = !DILocation(line: 52, column: 13, scope: !82)
!89 = !DILocation(line: 55, column: 1, scope: !56)
!90 = distinct !DISubprogram(name: "good21", scope: !10, file: !10, line: 57, type: !57, isLocal: false, isDefinition: true, scopeLine: 58, isOptimized: false, unit: !0, variables: !2)
!91 = !DILocalVariable(name: "data", scope: !90, file: !10, line: 59, type: !4)
!92 = !DILocation(line: 59, column: 9, scope: !90)
!93 = !DILocalVariable(name: "dataPtr1", scope: !90, file: !10, line: 60, type: !62)
!94 = !DILocation(line: 60, column: 10, scope: !90)
!95 = !DILocalVariable(name: "dataPtr2", scope: !90, file: !10, line: 61, type: !62)
!96 = !DILocation(line: 61, column: 10, scope: !90)
!97 = !DILocation(line: 63, column: 10, scope: !90)
!98 = !DILocalVariable(name: "data", scope: !99, file: !10, line: 65, type: !4)
!99 = distinct !DILexicalBlock(scope: !90, file: !10, line: 64, column: 5)
!100 = !DILocation(line: 65, column: 13, scope: !99)
!101 = !DILocation(line: 65, column: 21, scope: !99)
!102 = !DILocation(line: 65, column: 20, scope: !99)
!103 = !DILocation(line: 67, column: 14, scope: !99)
!104 = !DILocation(line: 68, column: 21, scope: !99)
!105 = !DILocation(line: 68, column: 10, scope: !99)
!106 = !DILocation(line: 68, column: 19, scope: !99)
!107 = !DILocalVariable(name: "data", scope: !108, file: !10, line: 71, type: !4)
!108 = distinct !DILexicalBlock(scope: !90, file: !10, line: 70, column: 5)
!109 = !DILocation(line: 71, column: 13, scope: !108)
!110 = !DILocation(line: 71, column: 21, scope: !108)
!111 = !DILocation(line: 71, column: 20, scope: !108)
!112 = !DILocalVariable(name: "result", scope: !113, file: !10, line: 74, type: !4)
!113 = distinct !DILexicalBlock(scope: !108, file: !10, line: 72, column: 9)
!114 = !DILocation(line: 74, column: 17, scope: !113)
!115 = !DILocation(line: 74, column: 26, scope: !113)
!116 = !DILocation(line: 74, column: 33, scope: !113)
!117 = !DILocation(line: 74, column: 31, scope: !113)
!118 = !DILocation(line: 75, column: 26, scope: !113)
!119 = !DILocation(line: 75, column: 13, scope: !113)
!120 = !DILocation(line: 78, column: 1, scope: !90)
!121 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 80, type: !122, isLocal: false, isDefinition: true, scopeLine: 80, isOptimized: false, unit: !0, variables: !2)
!122 = !DISubroutineType(types: !123)
!123 = !{!4}
!124 = !DILocation(line: 81, column: 5, scope: !121)
!125 = !DILocation(line: 82, column: 5, scope: !121)
!126 = !DILocation(line: 83, column: 5, scope: !121)
