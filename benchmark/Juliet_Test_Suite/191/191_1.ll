; ModuleID = './191_1.c'
source_filename = "./191_1.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@.str.1 = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1
@.str.2 = private unnamed_addr constant [5 x i8] c"%ld\0A\00", align 1
@.str.3 = private unnamed_addr constant [4 x i8] c"%u\0A\00", align 1

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
define void @printUnsignedLine(i32 %unsignedNumber) #0 !dbg !56 {
entry:
  %unsignedNumber.addr = alloca i32, align 4
  store i32 %unsignedNumber, i32* %unsignedNumber.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %unsignedNumber.addr, metadata !60, metadata !15), !dbg !61
  %0 = load i32, i32* %unsignedNumber.addr, align 4, !dbg !62
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i32 0, i32 0), i32 %0), !dbg !63
  ret void, !dbg !64
}

; Function Attrs: nounwind uwtable
define void @bad1() #0 !dbg !65 {
entry:
  %data = alloca i16, align 2
  %result = alloca i16, align 2
  call void @llvm.dbg.declare(metadata i16* %data, metadata !68, metadata !15), !dbg !70
  store i16 0, i16* %data, align 2, !dbg !71
  store i16 -32768, i16* %data, align 2, !dbg !72
  %0 = load i16, i16* %data, align 2, !dbg !73
  %conv = sext i16 %0 to i32, !dbg !73
  %cmp = icmp slt i32 %conv, 0, !dbg !75
  br i1 %cmp, label %if.then, label %if.end, !dbg !76

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i16* %result, metadata !77, metadata !15), !dbg !79
  %1 = load i16, i16* %data, align 2, !dbg !80
  %conv2 = sext i16 %1 to i32, !dbg !80
  %mul = mul nsw i32 %conv2, 2, !dbg !81
  %conv3 = trunc i32 %mul to i16, !dbg !80
  store i16 %conv3, i16* %result, align 2, !dbg !79
  %2 = load i16, i16* %result, align 2, !dbg !82
  %conv4 = sext i16 %2 to i32, !dbg !82
  call void @printIntLine(i32 %conv4), !dbg !83
  br label %if.end, !dbg !84

if.end:                                           ; preds = %if.then, %entry
  ret void, !dbg !85
}

; Function Attrs: nounwind uwtable
define void @good1() #0 !dbg !86 {
entry:
  %data = alloca i16, align 2
  %result = alloca i16, align 2
  call void @llvm.dbg.declare(metadata i16* %data, metadata !87, metadata !15), !dbg !88
  store i16 0, i16* %data, align 2, !dbg !89
  store i16 -2, i16* %data, align 2, !dbg !90
  %0 = load i16, i16* %data, align 2, !dbg !91
  %conv = sext i16 %0 to i32, !dbg !91
  %cmp = icmp slt i32 %conv, 0, !dbg !93
  br i1 %cmp, label %if.then, label %if.end, !dbg !94

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i16* %result, metadata !95, metadata !15), !dbg !97
  %1 = load i16, i16* %data, align 2, !dbg !98
  %conv2 = sext i16 %1 to i32, !dbg !98
  %mul = mul nsw i32 %conv2, 2, !dbg !99
  %conv3 = trunc i32 %mul to i16, !dbg !98
  store i16 %conv3, i16* %result, align 2, !dbg !97
  %2 = load i16, i16* %result, align 2, !dbg !100
  %conv4 = sext i16 %2 to i32, !dbg !100
  call void @printIntLine(i32 %conv4), !dbg !101
  br label %if.end, !dbg !102

if.end:                                           ; preds = %if.then, %entry
  ret void, !dbg !103
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !104 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @good1(), !dbg !107
  call void @bad1(), !dbg !108
  ret i32 1, !dbg !109
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (tags/RELEASE_390/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3)
!1 = !DIFile(filename: "191_1.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/191")
!2 = !{}
!3 = !{!4, !5}
!4 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64, align: 64)
!6 = !{i32 2, !"Dwarf Version", i32 4}
!7 = !{i32 2, !"Debug Info Version", i32 3}
!8 = !{!"clang version 3.9.0 (tags/RELEASE_390/final)"}
!9 = distinct !DISubprogram(name: "printHexCharLine", scope: !10, file: !10, line: 10, type: !11, isLocal: false, isDefinition: true, scopeLine: 11, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!10 = !DIFile(filename: "./191_1.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/191")
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
!49 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/sys/types.h", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/191")
!50 = !DIBasicType(name: "long int", size: 64, align: 64, encoding: DW_ATE_signed)
!51 = !DILocalVariable(name: "longIntNumber", arg: 1, scope: !45, file: !10, line: 28, type: !48)
!52 = !DILocation(line: 28, column: 29, scope: !45)
!53 = !DILocation(line: 30, column: 21, scope: !45)
!54 = !DILocation(line: 30, column: 5, scope: !45)
!55 = !DILocation(line: 31, column: 1, scope: !45)
!56 = distinct !DISubprogram(name: "printUnsignedLine", scope: !10, file: !10, line: 33, type: !57, isLocal: false, isDefinition: true, scopeLine: 34, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!57 = !DISubroutineType(types: !58)
!58 = !{null, !59}
!59 = !DIBasicType(name: "unsigned int", size: 32, align: 32, encoding: DW_ATE_unsigned)
!60 = !DILocalVariable(name: "unsignedNumber", arg: 1, scope: !56, file: !10, line: 33, type: !59)
!61 = !DILocation(line: 33, column: 33, scope: !56)
!62 = !DILocation(line: 35, column: 20, scope: !56)
!63 = !DILocation(line: 35, column: 5, scope: !56)
!64 = !DILocation(line: 36, column: 1, scope: !56)
!65 = distinct !DISubprogram(name: "bad1", scope: !10, file: !10, line: 39, type: !66, isLocal: false, isDefinition: true, scopeLine: 40, isOptimized: false, unit: !0, variables: !2)
!66 = !DISubroutineType(types: !67)
!67 = !{null}
!68 = !DILocalVariable(name: "data", scope: !65, file: !10, line: 41, type: !69)
!69 = !DIBasicType(name: "short", size: 16, align: 16, encoding: DW_ATE_signed)
!70 = !DILocation(line: 41, column: 10, scope: !65)
!71 = !DILocation(line: 42, column: 10, scope: !65)
!72 = !DILocation(line: 44, column: 10, scope: !65)
!73 = !DILocation(line: 45, column: 8, scope: !74)
!74 = distinct !DILexicalBlock(scope: !65, file: !10, line: 45, column: 8)
!75 = !DILocation(line: 45, column: 13, scope: !74)
!76 = !DILocation(line: 45, column: 8, scope: !65)
!77 = !DILocalVariable(name: "result", scope: !78, file: !10, line: 48, type: !69)
!78 = distinct !DILexicalBlock(scope: !74, file: !10, line: 46, column: 5)
!79 = !DILocation(line: 48, column: 15, scope: !78)
!80 = !DILocation(line: 48, column: 24, scope: !78)
!81 = !DILocation(line: 48, column: 29, scope: !78)
!82 = !DILocation(line: 49, column: 22, scope: !78)
!83 = !DILocation(line: 49, column: 9, scope: !78)
!84 = !DILocation(line: 50, column: 5, scope: !78)
!85 = !DILocation(line: 51, column: 1, scope: !65)
!86 = distinct !DISubprogram(name: "good1", scope: !10, file: !10, line: 53, type: !66, isLocal: false, isDefinition: true, scopeLine: 54, isOptimized: false, unit: !0, variables: !2)
!87 = !DILocalVariable(name: "data", scope: !86, file: !10, line: 55, type: !69)
!88 = !DILocation(line: 55, column: 11, scope: !86)
!89 = !DILocation(line: 56, column: 10, scope: !86)
!90 = !DILocation(line: 58, column: 10, scope: !86)
!91 = !DILocation(line: 59, column: 8, scope: !92)
!92 = distinct !DILexicalBlock(scope: !86, file: !10, line: 59, column: 8)
!93 = !DILocation(line: 59, column: 13, scope: !92)
!94 = !DILocation(line: 59, column: 8, scope: !86)
!95 = !DILocalVariable(name: "result", scope: !96, file: !10, line: 62, type: !69)
!96 = distinct !DILexicalBlock(scope: !92, file: !10, line: 60, column: 5)
!97 = !DILocation(line: 62, column: 15, scope: !96)
!98 = !DILocation(line: 62, column: 24, scope: !96)
!99 = !DILocation(line: 62, column: 29, scope: !96)
!100 = !DILocation(line: 63, column: 22, scope: !96)
!101 = !DILocation(line: 63, column: 9, scope: !96)
!102 = !DILocation(line: 64, column: 5, scope: !96)
!103 = !DILocation(line: 65, column: 1, scope: !86)
!104 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 67, type: !105, isLocal: false, isDefinition: true, scopeLine: 67, isOptimized: false, unit: !0, variables: !2)
!105 = !DISubroutineType(types: !106)
!106 = !{!4}
!107 = !DILocation(line: 68, column: 5, scope: !104)
!108 = !DILocation(line: 69, column: 2, scope: !104)
!109 = !DILocation(line: 70, column: 5, scope: !104)
