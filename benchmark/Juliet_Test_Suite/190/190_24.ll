; ModuleID = './190_24.c'
source_filename = "./190_24.c"
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
define void @bad24() #0 !dbg !57 {
entry:
  %data = alloca i32, align 4
  %result = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !60, metadata !17), !dbg !61
  store i32 0, i32* %data, align 4, !dbg !62
  %0 = load i32, i32* %data, align 4, !dbg !63
  %call = call i32 @badSource(i32 %0), !dbg !64
  store i32 %call, i32* %data, align 4, !dbg !65
  call void @llvm.dbg.declare(metadata i32* %result, metadata !66, metadata !17), !dbg !68
  %1 = load i32, i32* %data, align 4, !dbg !69
  %2 = load i32, i32* %data, align 4, !dbg !70
  %mul = mul nsw i32 %1, %2, !dbg !71
  store i32 %mul, i32* %result, align 4, !dbg !68
  %3 = load i32, i32* %result, align 4, !dbg !72
  call void @printIntLine(i32 %3), !dbg !73
  ret void, !dbg !74
}

; Function Attrs: nounwind uwtable
define internal i32 @badSource(i32 %data) #0 !dbg !75 {
entry:
  %data.addr = alloca i32, align 4
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !78, metadata !17), !dbg !79
  %call = call i32 @rand() #5, !dbg !80
  store i32 %call, i32* %data.addr, align 4, !dbg !81
  %0 = load i32, i32* %data.addr, align 4, !dbg !82
  ret i32 %0, !dbg !83
}

; Function Attrs: nounwind uwtable
define void @good24() #0 !dbg !84 {
entry:
  %data = alloca i32, align 4
  %result = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !85, metadata !17), !dbg !86
  store i32 0, i32* %data, align 4, !dbg !87
  %0 = load i32, i32* %data, align 4, !dbg !88
  %call = call i32 @badSource(i32 %0), !dbg !89
  store i32 %call, i32* %data, align 4, !dbg !90
  %1 = load i32, i32* %data, align 4, !dbg !91
  %conv = sext i32 %1 to i64, !dbg !93
  %call1 = call i64 @labs(i64 %conv) #1, !dbg !94
  %call2 = call double @sqrt(double 0x41DFFFFFFFC00000) #5, !dbg !95
  %conv3 = fptosi double %call2 to i64, !dbg !97
  %cmp = icmp sle i64 %call1, %conv3, !dbg !98
  br i1 %cmp, label %if.then, label %if.else, !dbg !99

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %result, metadata !100, metadata !17), !dbg !102
  %2 = load i32, i32* %data, align 4, !dbg !103
  %3 = load i32, i32* %data, align 4, !dbg !104
  %mul = mul nsw i32 %2, %3, !dbg !105
  store i32 %mul, i32* %result, align 4, !dbg !102
  %4 = load i32, i32* %result, align 4, !dbg !106
  call void @printIntLine(i32 %4), !dbg !107
  br label %if.end, !dbg !108

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([54 x i8], [54 x i8]* @.str.3, i32 0, i32 0)), !dbg !109
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !111
}

; Function Attrs: nounwind readnone
declare i64 @labs(i64) #3

; Function Attrs: nounwind
declare double @sqrt(double) #4

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !112 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @good24(), !dbg !115
  call void @bad24(), !dbg !116
  ret i32 1, !dbg !117
}

; Function Attrs: nounwind
declare i32 @rand() #4

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
!1 = !DIFile(filename: "190_24.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/190")
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
!12 = !DIFile(filename: "./190_24.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/190")
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
!57 = distinct !DISubprogram(name: "bad24", scope: !12, file: !12, line: 41, type: !58, isLocal: false, isDefinition: true, scopeLine: 42, isOptimized: false, unit: !0, variables: !2)
!58 = !DISubroutineType(types: !59)
!59 = !{null}
!60 = !DILocalVariable(name: "data", scope: !57, file: !12, line: 43, type: !4)
!61 = !DILocation(line: 43, column: 9, scope: !57)
!62 = !DILocation(line: 45, column: 10, scope: !57)
!63 = !DILocation(line: 46, column: 22, scope: !57)
!64 = !DILocation(line: 46, column: 12, scope: !57)
!65 = !DILocation(line: 46, column: 10, scope: !57)
!66 = !DILocalVariable(name: "result", scope: !67, file: !12, line: 49, type: !4)
!67 = distinct !DILexicalBlock(scope: !57, file: !12, line: 47, column: 5)
!68 = !DILocation(line: 49, column: 13, scope: !67)
!69 = !DILocation(line: 49, column: 22, scope: !67)
!70 = !DILocation(line: 49, column: 29, scope: !67)
!71 = !DILocation(line: 49, column: 27, scope: !67)
!72 = !DILocation(line: 50, column: 22, scope: !67)
!73 = !DILocation(line: 50, column: 9, scope: !67)
!74 = !DILocation(line: 52, column: 1, scope: !57)
!75 = distinct !DISubprogram(name: "badSource", scope: !12, file: !12, line: 34, type: !76, isLocal: true, isDefinition: true, scopeLine: 35, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!76 = !DISubroutineType(types: !77)
!77 = !{!4, !4}
!78 = !DILocalVariable(name: "data", arg: 1, scope: !75, file: !12, line: 34, type: !4)
!79 = !DILocation(line: 34, column: 26, scope: !75)
!80 = !DILocation(line: 37, column: 12, scope: !75)
!81 = !DILocation(line: 37, column: 10, scope: !75)
!82 = !DILocation(line: 38, column: 12, scope: !75)
!83 = !DILocation(line: 38, column: 5, scope: !75)
!84 = distinct !DISubprogram(name: "good24", scope: !12, file: !12, line: 54, type: !58, isLocal: false, isDefinition: true, scopeLine: 55, isOptimized: false, unit: !0, variables: !2)
!85 = !DILocalVariable(name: "data", scope: !84, file: !12, line: 56, type: !4)
!86 = !DILocation(line: 56, column: 9, scope: !84)
!87 = !DILocation(line: 58, column: 10, scope: !84)
!88 = !DILocation(line: 59, column: 22, scope: !84)
!89 = !DILocation(line: 59, column: 12, scope: !84)
!90 = !DILocation(line: 59, column: 10, scope: !84)
!91 = !DILocation(line: 61, column: 20, scope: !92)
!92 = distinct !DILexicalBlock(scope: !84, file: !12, line: 61, column: 9)
!93 = !DILocation(line: 61, column: 14, scope: !92)
!94 = !DILocation(line: 61, column: 9, scope: !92)
!95 = !DILocation(line: 61, column: 35, scope: !96)
!96 = !DILexicalBlockFile(scope: !92, file: !12, discriminator: 1)
!97 = !DILocation(line: 61, column: 29, scope: !92)
!98 = !DILocation(line: 61, column: 26, scope: !92)
!99 = !DILocation(line: 61, column: 9, scope: !84)
!100 = !DILocalVariable(name: "result", scope: !101, file: !12, line: 63, type: !4)
!101 = distinct !DILexicalBlock(scope: !92, file: !12, line: 62, column: 5)
!102 = !DILocation(line: 63, column: 13, scope: !101)
!103 = !DILocation(line: 63, column: 22, scope: !101)
!104 = !DILocation(line: 63, column: 29, scope: !101)
!105 = !DILocation(line: 63, column: 27, scope: !101)
!106 = !DILocation(line: 64, column: 22, scope: !101)
!107 = !DILocation(line: 64, column: 9, scope: !101)
!108 = !DILocation(line: 65, column: 5, scope: !101)
!109 = !DILocation(line: 68, column: 9, scope: !110)
!110 = distinct !DILexicalBlock(scope: !92, file: !12, line: 67, column: 5)
!111 = !DILocation(line: 70, column: 1, scope: !84)
!112 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 72, type: !113, isLocal: false, isDefinition: true, scopeLine: 72, isOptimized: false, unit: !0, variables: !2)
!113 = !DISubroutineType(types: !114)
!114 = !{!4}
!115 = !DILocation(line: 73, column: 5, scope: !112)
!116 = !DILocation(line: 74, column: 5, scope: !112)
!117 = !DILocation(line: 75, column: 5, scope: !112)
