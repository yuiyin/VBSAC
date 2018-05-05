; ModuleID = './191_14.c'
source_filename = "./191_14.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@GLOBAL_CONST_TRUE = constant i32 1, align 4
@GLOBAL_CONST_FALSE = constant i32 0, align 4
@GLOBAL_CONST_FIVE = constant i32 5, align 4
@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@.str.1 = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1
@.str.2 = private unnamed_addr constant [5 x i8] c"%ld\0A\00", align 1
@.str.3 = private unnamed_addr constant [4 x i8] c"%u\0A\00", align 1

; Function Attrs: nounwind uwtable
define void @printHexCharLine(i8 signext %charHex) #0 !dbg !15 {
entry:
  %charHex.addr = alloca i8, align 1
  store i8 %charHex, i8* %charHex.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %charHex.addr, metadata !19, metadata !20), !dbg !21
  %0 = load i8, i8* %charHex.addr, align 1, !dbg !22
  %conv = sext i8 %0 to i32, !dbg !23
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), i32 %conv), !dbg !24
  ret void, !dbg !25
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @printf(i8*, ...) #2

; Function Attrs: nounwind uwtable
define void @printLine(i8* %line) #0 !dbg !26 {
entry:
  %line.addr = alloca i8*, align 8
  store i8* %line, i8** %line.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %line.addr, metadata !31, metadata !20), !dbg !32
  %0 = load i8*, i8** %line.addr, align 8, !dbg !33
  %cmp = icmp ne i8* %0, null, !dbg !35
  br i1 %cmp, label %if.then, label %if.end, !dbg !36

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** %line.addr, align 8, !dbg !37
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i32 0, i32 0), i8* %1), !dbg !39
  br label %if.end, !dbg !40

if.end:                                           ; preds = %if.then, %entry
  ret void, !dbg !41
}

; Function Attrs: nounwind uwtable
define void @printIntLine(i32 %intNumber) #0 !dbg !42 {
entry:
  %intNumber.addr = alloca i32, align 4
  store i32 %intNumber, i32* %intNumber.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %intNumber.addr, metadata !45, metadata !20), !dbg !46
  %0 = load i32, i32* %intNumber.addr, align 4, !dbg !47
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), i32 %0), !dbg !48
  ret void, !dbg !49
}

; Function Attrs: nounwind uwtable
define void @printLongLine(i64 %longIntNumber) #0 !dbg !50 {
entry:
  %longIntNumber.addr = alloca i64, align 8
  store i64 %longIntNumber, i64* %longIntNumber.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %longIntNumber.addr, metadata !56, metadata !20), !dbg !57
  %0 = load i64, i64* %longIntNumber.addr, align 8, !dbg !58
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.2, i32 0, i32 0), i64 %0), !dbg !59
  ret void, !dbg !60
}

; Function Attrs: nounwind uwtable
define void @printUnsignedLine(i32 %unsignedNumber) #0 !dbg !61 {
entry:
  %unsignedNumber.addr = alloca i32, align 4
  store i32 %unsignedNumber, i32* %unsignedNumber.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %unsignedNumber.addr, metadata !65, metadata !20), !dbg !66
  %0 = load i32, i32* %unsignedNumber.addr, align 4, !dbg !67
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i32 0, i32 0), i32 %0), !dbg !68
  ret void, !dbg !69
}

; Function Attrs: nounwind uwtable
define void @bad14() #0 !dbg !70 {
entry:
  %data = alloca i8, align 1
  %result = alloca i8, align 1
  call void @llvm.dbg.declare(metadata i8* %data, metadata !73, metadata !20), !dbg !74
  store i8 32, i8* %data, align 1, !dbg !75
  store i8 -70, i8* %data, align 1, !dbg !76
  %0 = load i8, i8* %data, align 1, !dbg !79
  %conv = sext i8 %0 to i32, !dbg !79
  %cmp = icmp slt i32 %conv, 0, !dbg !83
  br i1 %cmp, label %if.then, label %if.end, !dbg !84

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i8* %result, metadata !85, metadata !20), !dbg !87
  %1 = load i8, i8* %data, align 1, !dbg !88
  %conv2 = sext i8 %1 to i32, !dbg !88
  %mul = mul nsw i32 %conv2, 2, !dbg !89
  %conv3 = trunc i32 %mul to i8, !dbg !88
  store i8 %conv3, i8* %result, align 1, !dbg !87
  %2 = load i8, i8* %result, align 1, !dbg !90
  call void @printHexCharLine(i8 signext %2), !dbg !91
  br label %if.end, !dbg !92

if.end:                                           ; preds = %if.then, %entry
  ret void, !dbg !93
}

; Function Attrs: nounwind uwtable
define void @good14() #0 !dbg !94 {
entry:
  %data = alloca i8, align 1
  %result = alloca i8, align 1
  call void @llvm.dbg.declare(metadata i8* %data, metadata !95, metadata !20), !dbg !96
  store i8 32, i8* %data, align 1, !dbg !97
  store i8 -2, i8* %data, align 1, !dbg !98
  %0 = load i8, i8* %data, align 1, !dbg !101
  %conv = sext i8 %0 to i32, !dbg !101
  %cmp = icmp slt i32 %conv, 0, !dbg !105
  br i1 %cmp, label %if.then, label %if.end, !dbg !106

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i8* %result, metadata !107, metadata !20), !dbg !109
  %1 = load i8, i8* %data, align 1, !dbg !110
  %conv2 = sext i8 %1 to i32, !dbg !110
  %mul = mul nsw i32 %conv2, 2, !dbg !111
  %conv3 = trunc i32 %mul to i8, !dbg !110
  store i8 %conv3, i8* %result, align 1, !dbg !109
  %2 = load i8, i8* %result, align 1, !dbg !112
  call void @printHexCharLine(i8 signext %2), !dbg !113
  br label %if.end, !dbg !114

if.end:                                           ; preds = %if.then, %entry
  ret void, !dbg !115
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !116 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @good14(), !dbg !119
  call void @bad14(), !dbg !120
  ret i32 1, !dbg !121
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!12, !13}
!llvm.ident = !{!14}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (tags/RELEASE_390/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, globals: !6)
!1 = !DIFile(filename: "191_14.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/191")
!2 = !{}
!3 = !{!4, !5}
!4 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64, align: 64)
!6 = !{!7, !10, !11}
!7 = distinct !DIGlobalVariable(name: "GLOBAL_CONST_TRUE", scope: !0, file: !8, line: 10, type: !9, isLocal: false, isDefinition: true, variable: i32* @GLOBAL_CONST_TRUE)
!8 = !DIFile(filename: "./191_14.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/191")
!9 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !4)
!10 = distinct !DIGlobalVariable(name: "GLOBAL_CONST_FALSE", scope: !0, file: !8, line: 11, type: !9, isLocal: false, isDefinition: true, variable: i32* @GLOBAL_CONST_FALSE)
!11 = distinct !DIGlobalVariable(name: "GLOBAL_CONST_FIVE", scope: !0, file: !8, line: 12, type: !9, isLocal: false, isDefinition: true, variable: i32* @GLOBAL_CONST_FIVE)
!12 = !{i32 2, !"Dwarf Version", i32 4}
!13 = !{i32 2, !"Debug Info Version", i32 3}
!14 = !{!"clang version 3.9.0 (tags/RELEASE_390/final)"}
!15 = distinct !DISubprogram(name: "printHexCharLine", scope: !8, file: !8, line: 14, type: !16, isLocal: false, isDefinition: true, scopeLine: 15, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!16 = !DISubroutineType(types: !17)
!17 = !{null, !18}
!18 = !DIBasicType(name: "char", size: 8, align: 8, encoding: DW_ATE_signed_char)
!19 = !DILocalVariable(name: "charHex", arg: 1, scope: !15, file: !8, line: 14, type: !18)
!20 = !DIExpression()
!21 = !DILocation(line: 14, column: 29, scope: !15)
!22 = !DILocation(line: 16, column: 25, scope: !15)
!23 = !DILocation(line: 16, column: 20, scope: !15)
!24 = !DILocation(line: 16, column: 5, scope: !15)
!25 = !DILocation(line: 17, column: 1, scope: !15)
!26 = distinct !DISubprogram(name: "printLine", scope: !8, file: !8, line: 19, type: !27, isLocal: false, isDefinition: true, scopeLine: 20, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!27 = !DISubroutineType(types: !28)
!28 = !{null, !29}
!29 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !30, size: 64, align: 64)
!30 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !18)
!31 = !DILocalVariable(name: "line", arg: 1, scope: !26, file: !8, line: 19, type: !29)
!32 = !DILocation(line: 19, column: 30, scope: !26)
!33 = !DILocation(line: 21, column: 8, scope: !34)
!34 = distinct !DILexicalBlock(scope: !26, file: !8, line: 21, column: 8)
!35 = !DILocation(line: 21, column: 13, scope: !34)
!36 = !DILocation(line: 21, column: 8, scope: !26)
!37 = !DILocation(line: 23, column: 24, scope: !38)
!38 = distinct !DILexicalBlock(scope: !34, file: !8, line: 22, column: 5)
!39 = !DILocation(line: 23, column: 9, scope: !38)
!40 = !DILocation(line: 24, column: 5, scope: !38)
!41 = !DILocation(line: 25, column: 1, scope: !26)
!42 = distinct !DISubprogram(name: "printIntLine", scope: !8, file: !8, line: 27, type: !43, isLocal: false, isDefinition: true, scopeLine: 28, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!43 = !DISubroutineType(types: !44)
!44 = !{null, !4}
!45 = !DILocalVariable(name: "intNumber", arg: 1, scope: !42, file: !8, line: 27, type: !4)
!46 = !DILocation(line: 27, column: 24, scope: !42)
!47 = !DILocation(line: 29, column: 20, scope: !42)
!48 = !DILocation(line: 29, column: 5, scope: !42)
!49 = !DILocation(line: 30, column: 1, scope: !42)
!50 = distinct !DISubprogram(name: "printLongLine", scope: !8, file: !8, line: 32, type: !51, isLocal: false, isDefinition: true, scopeLine: 33, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!51 = !DISubroutineType(types: !52)
!52 = !{null, !53}
!53 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !54, line: 197, baseType: !55)
!54 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/sys/types.h", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/191")
!55 = !DIBasicType(name: "long int", size: 64, align: 64, encoding: DW_ATE_signed)
!56 = !DILocalVariable(name: "longIntNumber", arg: 1, scope: !50, file: !8, line: 32, type: !53)
!57 = !DILocation(line: 32, column: 29, scope: !50)
!58 = !DILocation(line: 34, column: 21, scope: !50)
!59 = !DILocation(line: 34, column: 5, scope: !50)
!60 = !DILocation(line: 35, column: 1, scope: !50)
!61 = distinct !DISubprogram(name: "printUnsignedLine", scope: !8, file: !8, line: 37, type: !62, isLocal: false, isDefinition: true, scopeLine: 38, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!62 = !DISubroutineType(types: !63)
!63 = !{null, !64}
!64 = !DIBasicType(name: "unsigned int", size: 32, align: 32, encoding: DW_ATE_unsigned)
!65 = !DILocalVariable(name: "unsignedNumber", arg: 1, scope: !61, file: !8, line: 37, type: !64)
!66 = !DILocation(line: 37, column: 33, scope: !61)
!67 = !DILocation(line: 39, column: 20, scope: !61)
!68 = !DILocation(line: 39, column: 5, scope: !61)
!69 = !DILocation(line: 40, column: 1, scope: !61)
!70 = distinct !DISubprogram(name: "bad14", scope: !8, file: !8, line: 45, type: !71, isLocal: false, isDefinition: true, scopeLine: 46, isOptimized: false, unit: !0, variables: !2)
!71 = !DISubroutineType(types: !72)
!72 = !{null}
!73 = !DILocalVariable(name: "data", scope: !70, file: !8, line: 47, type: !18)
!74 = !DILocation(line: 47, column: 10, scope: !70)
!75 = !DILocation(line: 48, column: 10, scope: !70)
!76 = !DILocation(line: 51, column: 14, scope: !77)
!77 = distinct !DILexicalBlock(scope: !78, file: !8, line: 50, column: 5)
!78 = distinct !DILexicalBlock(scope: !70, file: !8, line: 49, column: 8)
!79 = !DILocation(line: 55, column: 12, scope: !80)
!80 = distinct !DILexicalBlock(scope: !81, file: !8, line: 55, column: 12)
!81 = distinct !DILexicalBlock(scope: !82, file: !8, line: 54, column: 5)
!82 = distinct !DILexicalBlock(scope: !70, file: !8, line: 53, column: 8)
!83 = !DILocation(line: 55, column: 17, scope: !80)
!84 = !DILocation(line: 55, column: 12, scope: !81)
!85 = !DILocalVariable(name: "result", scope: !86, file: !8, line: 58, type: !18)
!86 = distinct !DILexicalBlock(scope: !80, file: !8, line: 56, column: 9)
!87 = !DILocation(line: 58, column: 18, scope: !86)
!88 = !DILocation(line: 58, column: 27, scope: !86)
!89 = !DILocation(line: 58, column: 32, scope: !86)
!90 = !DILocation(line: 59, column: 30, scope: !86)
!91 = !DILocation(line: 59, column: 13, scope: !86)
!92 = !DILocation(line: 60, column: 9, scope: !86)
!93 = !DILocation(line: 62, column: 1, scope: !70)
!94 = distinct !DISubprogram(name: "good14", scope: !8, file: !8, line: 68, type: !71, isLocal: false, isDefinition: true, scopeLine: 69, isOptimized: false, unit: !0, variables: !2)
!95 = !DILocalVariable(name: "data", scope: !94, file: !8, line: 70, type: !18)
!96 = !DILocation(line: 70, column: 10, scope: !94)
!97 = !DILocation(line: 71, column: 10, scope: !94)
!98 = !DILocation(line: 80, column: 14, scope: !99)
!99 = distinct !DILexicalBlock(scope: !100, file: !8, line: 78, column: 5)
!100 = distinct !DILexicalBlock(scope: !94, file: !8, line: 72, column: 8)
!101 = !DILocation(line: 84, column: 12, scope: !102)
!102 = distinct !DILexicalBlock(scope: !103, file: !8, line: 84, column: 12)
!103 = distinct !DILexicalBlock(scope: !104, file: !8, line: 83, column: 5)
!104 = distinct !DILexicalBlock(scope: !94, file: !8, line: 82, column: 8)
!105 = !DILocation(line: 84, column: 17, scope: !102)
!106 = !DILocation(line: 84, column: 12, scope: !103)
!107 = !DILocalVariable(name: "result", scope: !108, file: !8, line: 87, type: !18)
!108 = distinct !DILexicalBlock(scope: !102, file: !8, line: 85, column: 9)
!109 = !DILocation(line: 87, column: 18, scope: !108)
!110 = !DILocation(line: 87, column: 27, scope: !108)
!111 = !DILocation(line: 87, column: 32, scope: !108)
!112 = !DILocation(line: 88, column: 30, scope: !108)
!113 = !DILocation(line: 88, column: 13, scope: !108)
!114 = !DILocation(line: 89, column: 9, scope: !108)
!115 = !DILocation(line: 91, column: 1, scope: !94)
!116 = distinct !DISubprogram(name: "main", scope: !8, file: !8, line: 96, type: !117, isLocal: false, isDefinition: true, scopeLine: 96, isOptimized: false, unit: !0, variables: !2)
!117 = !DISubroutineType(types: !118)
!118 = !{!4}
!119 = !DILocation(line: 97, column: 5, scope: !116)
!120 = !DILocation(line: 98, column: 2, scope: !116)
!121 = !DILocation(line: 99, column: 5, scope: !116)
