; ModuleID = './190_29.c'
source_filename = "./190_29.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@.str.1 = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1
@.str.2 = private unnamed_addr constant [5 x i8] c"%ld\0A\00", align 1
@.str.3 = private unnamed_addr constant [54 x i8] c"data value is too large to perform arithmetic safely.\00", align 1

; Function Attrs: nounwind uwtable
define void @printHexCharLine(i8 signext %charHex) #0 !dbg !11 {
entry:
  %charHex.addr = alloca i8, align 1
  store i8 %charHex, i8* %charHex.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %charHex.addr, metadata !16, metadata !17), !dbg !18
  %0 = load i8, i8* %charHex.addr, align 1, !dbg !19
  %conv = sext i8 %0 to i32, !dbg !20
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), i32 %conv), !dbg !21
  ret void, !dbg !22
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @printf(i8*, ...) #2

; Function Attrs: nounwind uwtable
define void @printLine(i8* %line) #0 !dbg !23 {
entry:
  %line.addr = alloca i8*, align 8
  store i8* %line, i8** %line.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %line.addr, metadata !28, metadata !17), !dbg !29
  %0 = load i8*, i8** %line.addr, align 8, !dbg !30
  %cmp = icmp ne i8* %0, null, !dbg !32
  br i1 %cmp, label %if.then, label %if.end, !dbg !33

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** %line.addr, align 8, !dbg !34
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i32 0, i32 0), i8* %1), !dbg !36
  br label %if.end, !dbg !37

if.end:                                           ; preds = %if.then, %entry
  ret void, !dbg !38
}

; Function Attrs: nounwind uwtable
define void @printIntLine(i32 %intNumber) #0 !dbg !39 {
entry:
  %intNumber.addr = alloca i32, align 4
  store i32 %intNumber, i32* %intNumber.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %intNumber.addr, metadata !42, metadata !17), !dbg !43
  %0 = load i32, i32* %intNumber.addr, align 4, !dbg !44
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), i32 %0), !dbg !45
  ret void, !dbg !46
}

; Function Attrs: nounwind uwtable
define void @printLongLine(i64 %longIntNumber) #0 !dbg !47 {
entry:
  %longIntNumber.addr = alloca i64, align 8
  store i64 %longIntNumber, i64* %longIntNumber.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %longIntNumber.addr, metadata !52, metadata !17), !dbg !53
  %0 = load i64, i64* %longIntNumber.addr, align 8, !dbg !54
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.2, i32 0, i32 0), i64 %0), !dbg !55
  ret void, !dbg !56
}

; Function Attrs: nounwind uwtable
define void @badSink(i16 signext %data) #0 !dbg !57 {
entry:
  %data.addr = alloca i16, align 2
  %result = alloca i16, align 2
  store i16 %data, i16* %data.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %data.addr, metadata !61, metadata !17), !dbg !62
  call void @llvm.dbg.declare(metadata i16* %result, metadata !63, metadata !17), !dbg !65
  %0 = load i16, i16* %data.addr, align 2, !dbg !66
  %conv = sext i16 %0 to i32, !dbg !66
  %1 = load i16, i16* %data.addr, align 2, !dbg !67
  %conv1 = sext i16 %1 to i32, !dbg !67
  %mul = mul nsw i32 %conv, %conv1, !dbg !68
  %conv2 = trunc i32 %mul to i16, !dbg !66
  store i16 %conv2, i16* %result, align 2, !dbg !65
  %2 = load i16, i16* %result, align 2, !dbg !69
  %conv3 = sext i16 %2 to i32, !dbg !69
  call void @printIntLine(i32 %conv3), !dbg !70
  ret void, !dbg !71
}

; Function Attrs: nounwind uwtable
define void @goodSink(i16 signext %data) #0 !dbg !72 {
entry:
  %data.addr = alloca i16, align 2
  %result = alloca i16, align 2
  store i16 %data, i16* %data.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %data.addr, metadata !73, metadata !17), !dbg !74
  %0 = load i16, i16* %data.addr, align 2, !dbg !75
  %conv = sext i16 %0 to i64, !dbg !77
  %call = call i64 @labs(i64 %conv) #1, !dbg !78
  %call1 = call double @sqrt(double 3.276700e+04) #5, !dbg !79
  %conv2 = fptosi double %call1 to i64, !dbg !81
  %cmp = icmp sle i64 %call, %conv2, !dbg !82
  br i1 %cmp, label %if.then, label %if.else, !dbg !83

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i16* %result, metadata !84, metadata !17), !dbg !86
  %1 = load i16, i16* %data.addr, align 2, !dbg !87
  %conv4 = sext i16 %1 to i32, !dbg !87
  %2 = load i16, i16* %data.addr, align 2, !dbg !88
  %conv5 = sext i16 %2 to i32, !dbg !88
  %mul = mul nsw i32 %conv4, %conv5, !dbg !89
  %conv6 = trunc i32 %mul to i16, !dbg !87
  store i16 %conv6, i16* %result, align 2, !dbg !86
  %3 = load i16, i16* %result, align 2, !dbg !90
  %conv7 = sext i16 %3 to i32, !dbg !90
  call void @printIntLine(i32 %conv7), !dbg !91
  br label %if.end, !dbg !92

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([54 x i8], [54 x i8]* @.str.3, i32 0, i32 0)), !dbg !93
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !95
}

; Function Attrs: nounwind readnone
declare i64 @labs(i64) #3

; Function Attrs: nounwind
declare double @sqrt(double) #4

; Function Attrs: nounwind uwtable
define void @bad29() #0 !dbg !96 {
entry:
  %data = alloca i16, align 2
  %funcPtr = alloca void (i16)*, align 8
  call void @llvm.dbg.declare(metadata i16* %data, metadata !99, metadata !17), !dbg !100
  call void @llvm.dbg.declare(metadata void (i16)** %funcPtr, metadata !101, metadata !17), !dbg !103
  store void (i16)* @badSink, void (i16)** %funcPtr, align 8, !dbg !103
  store i16 0, i16* %data, align 2, !dbg !104
  store i16 32767, i16* %data, align 2, !dbg !105
  %0 = load void (i16)*, void (i16)** %funcPtr, align 8, !dbg !106
  %1 = load i16, i16* %data, align 2, !dbg !107
  call void %0(i16 signext %1), !dbg !106
  ret void, !dbg !108
}

; Function Attrs: nounwind uwtable
define void @good29() #0 !dbg !109 {
entry:
  %data = alloca i16, align 2
  %funcPtr = alloca void (i16)*, align 8
  call void @llvm.dbg.declare(metadata i16* %data, metadata !110, metadata !17), !dbg !111
  call void @llvm.dbg.declare(metadata void (i16)** %funcPtr, metadata !112, metadata !17), !dbg !113
  store void (i16)* @goodSink, void (i16)** %funcPtr, align 8, !dbg !113
  store i16 0, i16* %data, align 2, !dbg !114
  store i16 32767, i16* %data, align 2, !dbg !115
  %0 = load void (i16)*, void (i16)** %funcPtr, align 8, !dbg !116
  %1 = load i16, i16* %data, align 2, !dbg !117
  call void %0(i16 signext %1), !dbg !116
  ret void, !dbg !118
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !119 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @good29(), !dbg !122
  call void @bad29(), !dbg !123
  ret i32 1, !dbg !124
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readnone "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (tags/RELEASE_390/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3)
!1 = !DIFile(filename: "190_29.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/190")
!2 = !{}
!3 = !{!4, !5, !6, !7}
!4 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64, align: 64)
!6 = !DIBasicType(name: "long int", size: 64, align: 64, encoding: DW_ATE_signed)
!7 = !DIBasicType(name: "double", size: 64, align: 64, encoding: DW_ATE_float)
!8 = !{i32 2, !"Dwarf Version", i32 4}
!9 = !{i32 2, !"Debug Info Version", i32 3}
!10 = !{!"clang version 3.9.0 (tags/RELEASE_390/final)"}
!11 = distinct !DISubprogram(name: "printHexCharLine", scope: !12, file: !12, line: 10, type: !13, isLocal: false, isDefinition: true, scopeLine: 11, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!12 = !DIFile(filename: "./190_29.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/190")
!13 = !DISubroutineType(types: !14)
!14 = !{null, !15}
!15 = !DIBasicType(name: "char", size: 8, align: 8, encoding: DW_ATE_signed_char)
!16 = !DILocalVariable(name: "charHex", arg: 1, scope: !11, file: !12, line: 10, type: !15)
!17 = !DIExpression()
!18 = !DILocation(line: 10, column: 29, scope: !11)
!19 = !DILocation(line: 12, column: 25, scope: !11)
!20 = !DILocation(line: 12, column: 20, scope: !11)
!21 = !DILocation(line: 12, column: 5, scope: !11)
!22 = !DILocation(line: 13, column: 1, scope: !11)
!23 = distinct !DISubprogram(name: "printLine", scope: !12, file: !12, line: 15, type: !24, isLocal: false, isDefinition: true, scopeLine: 16, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!24 = !DISubroutineType(types: !25)
!25 = !{null, !26}
!26 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !27, size: 64, align: 64)
!27 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !15)
!28 = !DILocalVariable(name: "line", arg: 1, scope: !23, file: !12, line: 15, type: !26)
!29 = !DILocation(line: 15, column: 30, scope: !23)
!30 = !DILocation(line: 17, column: 8, scope: !31)
!31 = distinct !DILexicalBlock(scope: !23, file: !12, line: 17, column: 8)
!32 = !DILocation(line: 17, column: 13, scope: !31)
!33 = !DILocation(line: 17, column: 8, scope: !23)
!34 = !DILocation(line: 19, column: 24, scope: !35)
!35 = distinct !DILexicalBlock(scope: !31, file: !12, line: 18, column: 5)
!36 = !DILocation(line: 19, column: 9, scope: !35)
!37 = !DILocation(line: 20, column: 5, scope: !35)
!38 = !DILocation(line: 21, column: 1, scope: !23)
!39 = distinct !DISubprogram(name: "printIntLine", scope: !12, file: !12, line: 23, type: !40, isLocal: false, isDefinition: true, scopeLine: 24, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!40 = !DISubroutineType(types: !41)
!41 = !{null, !4}
!42 = !DILocalVariable(name: "intNumber", arg: 1, scope: !39, file: !12, line: 23, type: !4)
!43 = !DILocation(line: 23, column: 24, scope: !39)
!44 = !DILocation(line: 25, column: 20, scope: !39)
!45 = !DILocation(line: 25, column: 5, scope: !39)
!46 = !DILocation(line: 26, column: 1, scope: !39)
!47 = distinct !DISubprogram(name: "printLongLine", scope: !12, file: !12, line: 28, type: !48, isLocal: false, isDefinition: true, scopeLine: 29, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!48 = !DISubroutineType(types: !49)
!49 = !{null, !50}
!50 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !51, line: 197, baseType: !6)
!51 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/sys/types.h", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/190")
!52 = !DILocalVariable(name: "longIntNumber", arg: 1, scope: !47, file: !12, line: 28, type: !50)
!53 = !DILocation(line: 28, column: 29, scope: !47)
!54 = !DILocation(line: 30, column: 21, scope: !47)
!55 = !DILocation(line: 30, column: 5, scope: !47)
!56 = !DILocation(line: 31, column: 1, scope: !47)
!57 = distinct !DISubprogram(name: "badSink", scope: !12, file: !12, line: 33, type: !58, isLocal: false, isDefinition: true, scopeLine: 34, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!58 = !DISubroutineType(types: !59)
!59 = !{null, !60}
!60 = !DIBasicType(name: "short", size: 16, align: 16, encoding: DW_ATE_signed)
!61 = !DILocalVariable(name: "data", arg: 1, scope: !57, file: !12, line: 33, type: !60)
!62 = !DILocation(line: 33, column: 20, scope: !57)
!63 = !DILocalVariable(name: "result", scope: !64, file: !12, line: 37, type: !60)
!64 = distinct !DILexicalBlock(scope: !57, file: !12, line: 35, column: 5)
!65 = !DILocation(line: 37, column: 15, scope: !64)
!66 = !DILocation(line: 37, column: 24, scope: !64)
!67 = !DILocation(line: 37, column: 31, scope: !64)
!68 = !DILocation(line: 37, column: 29, scope: !64)
!69 = !DILocation(line: 38, column: 22, scope: !64)
!70 = !DILocation(line: 38, column: 9, scope: !64)
!71 = !DILocation(line: 40, column: 1, scope: !57)
!72 = distinct !DISubprogram(name: "goodSink", scope: !12, file: !12, line: 42, type: !58, isLocal: false, isDefinition: true, scopeLine: 43, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!73 = !DILocalVariable(name: "data", arg: 1, scope: !72, file: !12, line: 42, type: !60)
!74 = !DILocation(line: 42, column: 21, scope: !72)
!75 = !DILocation(line: 45, column: 20, scope: !76)
!76 = distinct !DILexicalBlock(scope: !72, file: !12, line: 45, column: 9)
!77 = !DILocation(line: 45, column: 14, scope: !76)
!78 = !DILocation(line: 45, column: 9, scope: !76)
!79 = !DILocation(line: 45, column: 35, scope: !80)
!80 = !DILexicalBlockFile(scope: !76, file: !12, discriminator: 1)
!81 = !DILocation(line: 45, column: 29, scope: !76)
!82 = !DILocation(line: 45, column: 26, scope: !76)
!83 = !DILocation(line: 45, column: 9, scope: !72)
!84 = !DILocalVariable(name: "result", scope: !85, file: !12, line: 47, type: !60)
!85 = distinct !DILexicalBlock(scope: !76, file: !12, line: 46, column: 5)
!86 = !DILocation(line: 47, column: 15, scope: !85)
!87 = !DILocation(line: 47, column: 24, scope: !85)
!88 = !DILocation(line: 47, column: 31, scope: !85)
!89 = !DILocation(line: 47, column: 29, scope: !85)
!90 = !DILocation(line: 48, column: 22, scope: !85)
!91 = !DILocation(line: 48, column: 9, scope: !85)
!92 = !DILocation(line: 49, column: 5, scope: !85)
!93 = !DILocation(line: 52, column: 9, scope: !94)
!94 = distinct !DILexicalBlock(scope: !76, file: !12, line: 51, column: 5)
!95 = !DILocation(line: 54, column: 1, scope: !72)
!96 = distinct !DISubprogram(name: "bad29", scope: !12, file: !12, line: 56, type: !97, isLocal: false, isDefinition: true, scopeLine: 57, isOptimized: false, unit: !0, variables: !2)
!97 = !DISubroutineType(types: !98)
!98 = !{null}
!99 = !DILocalVariable(name: "data", scope: !96, file: !12, line: 58, type: !60)
!100 = !DILocation(line: 58, column: 11, scope: !96)
!101 = !DILocalVariable(name: "funcPtr", scope: !96, file: !12, line: 60, type: !102)
!102 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !58, size: 64, align: 64)
!103 = !DILocation(line: 60, column: 12, scope: !96)
!104 = !DILocation(line: 61, column: 10, scope: !96)
!105 = !DILocation(line: 63, column: 10, scope: !96)
!106 = !DILocation(line: 65, column: 5, scope: !96)
!107 = !DILocation(line: 65, column: 13, scope: !96)
!108 = !DILocation(line: 66, column: 1, scope: !96)
!109 = distinct !DISubprogram(name: "good29", scope: !12, file: !12, line: 68, type: !97, isLocal: false, isDefinition: true, scopeLine: 69, isOptimized: false, unit: !0, variables: !2)
!110 = !DILocalVariable(name: "data", scope: !109, file: !12, line: 70, type: !60)
!111 = !DILocation(line: 70, column: 11, scope: !109)
!112 = !DILocalVariable(name: "funcPtr", scope: !109, file: !12, line: 72, type: !102)
!113 = !DILocation(line: 72, column: 12, scope: !109)
!114 = !DILocation(line: 73, column: 10, scope: !109)
!115 = !DILocation(line: 75, column: 10, scope: !109)
!116 = !DILocation(line: 77, column: 5, scope: !109)
!117 = !DILocation(line: 77, column: 13, scope: !109)
!118 = !DILocation(line: 78, column: 1, scope: !109)
!119 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 80, type: !120, isLocal: false, isDefinition: true, scopeLine: 80, isOptimized: false, unit: !0, variables: !2)
!120 = !DISubroutineType(types: !121)
!121 = !{!4}
!122 = !DILocation(line: 81, column: 5, scope: !119)
!123 = !DILocation(line: 82, column: 5, scope: !119)
!124 = !DILocation(line: 83, column: 5, scope: !119)
