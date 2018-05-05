; ModuleID = './416_44.c'
source_filename = "./416_44.c"
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
define i32 @globalReturnsTrue() #0 !dbg !19 {
entry:
  ret i32 1, !dbg !22
}

; Function Attrs: nounwind uwtable
define i32 @globalReturnsFalse() #0 !dbg !23 {
entry:
  ret i32 0, !dbg !24
}

; Function Attrs: nounwind uwtable
define i32 @globalReturnsTrueOrFalse() #0 !dbg !25 {
entry:
  %call = call i32 @rand() #4, !dbg !26
  %rem = srem i32 %call, 2, !dbg !27
  ret i32 %rem, !dbg !28
}

; Function Attrs: nounwind
declare i32 @rand() #1

; Function Attrs: nounwind uwtable
define void @printHexCharLine(i8 signext %charHex) #0 !dbg !29 {
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
define void @bad44() #0 !dbg !75 {
entry:
  %data = alloca i32*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !78, metadata !34), !dbg !79
  store i32* null, i32** %data, align 8, !dbg !80
  br label %source, !dbg !81

source:                                           ; preds = %entry
  %call = call noalias i8* @malloc(i64 400) #4, !dbg !82
  %0 = bitcast i8* %call to i32*, !dbg !83
  store i32* %0, i32** %data, align 8, !dbg !84
  %1 = load i32*, i32** %data, align 8, !dbg !85
  %cmp = icmp eq i32* %1, null, !dbg !87
  br i1 %cmp, label %if.then, label %if.end, !dbg !88

if.then:                                          ; preds = %source
  br label %return, !dbg !89

if.end:                                           ; preds = %source
  call void @llvm.dbg.declare(metadata i64* %i, metadata !91, metadata !34), !dbg !96
  store i64 0, i64* %i, align 8, !dbg !97
  br label %for.cond, !dbg !99

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !100
  %cmp1 = icmp ult i64 %2, 100, !dbg !103
  br i1 %cmp1, label %for.body, label %for.end, !dbg !104

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !105
  %4 = load i32*, i32** %data, align 8, !dbg !107
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 %3, !dbg !107
  store i32 5, i32* %arrayidx, align 4, !dbg !108
  br label %for.inc, !dbg !109

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !110
  %inc = add i64 %5, 1, !dbg !110
  store i64 %inc, i64* %i, align 8, !dbg !110
  br label %for.cond, !dbg !112, !llvm.loop !113

for.end:                                          ; preds = %for.cond
  %6 = load i32*, i32** %data, align 8, !dbg !115
  %7 = bitcast i32* %6 to i8*, !dbg !115
  call void @free(i8* %7) #4, !dbg !116
  br label %sink, !dbg !117

sink:                                             ; preds = %for.end
  %8 = load i32*, i32** %data, align 8, !dbg !118
  %arrayidx2 = getelementptr inbounds i32, i32* %8, i64 0, !dbg !118
  %9 = load i32, i32* %arrayidx2, align 4, !dbg !118
  call void @printIntLine(i32 %9), !dbg !119
  br label %return, !dbg !120

return:                                           ; preds = %sink, %if.then
  ret void, !dbg !121
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #1

; Function Attrs: nounwind
declare void @free(i8*) #1

; Function Attrs: nounwind uwtable
define void @good44() #0 !dbg !123 {
entry:
  %data = alloca i32*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !124, metadata !34), !dbg !125
  store i32* null, i32** %data, align 8, !dbg !126
  br label %source, !dbg !127

source:                                           ; preds = %entry
  %call = call noalias i8* @malloc(i64 400) #4, !dbg !128
  %0 = bitcast i8* %call to i32*, !dbg !129
  store i32* %0, i32** %data, align 8, !dbg !130
  %1 = load i32*, i32** %data, align 8, !dbg !131
  %cmp = icmp eq i32* %1, null, !dbg !133
  br i1 %cmp, label %if.then, label %if.end, !dbg !134

if.then:                                          ; preds = %source
  br label %sink, !dbg !135

if.end:                                           ; preds = %source
  call void @llvm.dbg.declare(metadata i64* %i, metadata !137, metadata !34), !dbg !139
  store i64 0, i64* %i, align 8, !dbg !140
  br label %for.cond, !dbg !142

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !143
  %cmp1 = icmp ult i64 %2, 100, !dbg !146
  br i1 %cmp1, label %for.body, label %for.end, !dbg !147

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !148
  %4 = load i32*, i32** %data, align 8, !dbg !150
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 %3, !dbg !150
  store i32 5, i32* %arrayidx, align 4, !dbg !151
  br label %for.inc, !dbg !152

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !153
  %inc = add i64 %5, 1, !dbg !153
  store i64 %inc, i64* %i, align 8, !dbg !153
  br label %for.cond, !dbg !155, !llvm.loop !156

for.end:                                          ; preds = %for.cond
  %6 = load i32*, i32** %data, align 8, !dbg !158
  %7 = bitcast i32* %6 to i8*, !dbg !158
  call void @free(i8* %7) #4, !dbg !159
  br label %sink, !dbg !160

sink:                                             ; preds = %if.then, %for.end
  ret void, !dbg !161
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !162 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @bad44(), !dbg !163
  call void @good44(), !dbg !164
  ret i32 1, !dbg !165
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone }
attributes #3 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!16, !17}
!llvm.ident = !{!18}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (tags/RELEASE_390/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, globals: !7)
!1 = !DIFile(filename: "416_44.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/416")
!2 = !{}
!3 = !{!4, !5, !6}
!4 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64, align: 64)
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64, align: 64)
!7 = !{!8, !11, !12, !13, !14, !15}
!8 = distinct !DIGlobalVariable(name: "GLOBAL_CONST_TRUE", scope: !0, file: !9, line: 10, type: !10, isLocal: false, isDefinition: true, variable: i32* @GLOBAL_CONST_TRUE)
!9 = !DIFile(filename: "./416_44.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/416")
!10 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !4)
!11 = distinct !DIGlobalVariable(name: "GLOBAL_CONST_FALSE", scope: !0, file: !9, line: 11, type: !10, isLocal: false, isDefinition: true, variable: i32* @GLOBAL_CONST_FALSE)
!12 = distinct !DIGlobalVariable(name: "GLOBAL_CONST_FIVE", scope: !0, file: !9, line: 12, type: !10, isLocal: false, isDefinition: true, variable: i32* @GLOBAL_CONST_FIVE)
!13 = distinct !DIGlobalVariable(name: "globalTrue", scope: !0, file: !9, line: 14, type: !4, isLocal: false, isDefinition: true, variable: i32* @globalTrue)
!14 = distinct !DIGlobalVariable(name: "globalFalse", scope: !0, file: !9, line: 15, type: !4, isLocal: false, isDefinition: true, variable: i32* @globalFalse)
!15 = distinct !DIGlobalVariable(name: "globalFive", scope: !0, file: !9, line: 16, type: !4, isLocal: false, isDefinition: true, variable: i32* @globalFive)
!16 = !{i32 2, !"Dwarf Version", i32 4}
!17 = !{i32 2, !"Debug Info Version", i32 3}
!18 = !{!"clang version 3.9.0 (tags/RELEASE_390/final)"}
!19 = distinct !DISubprogram(name: "globalReturnsTrue", scope: !9, file: !9, line: 18, type: !20, isLocal: false, isDefinition: true, scopeLine: 19, isOptimized: false, unit: !0, variables: !2)
!20 = !DISubroutineType(types: !21)
!21 = !{!4}
!22 = !DILocation(line: 20, column: 5, scope: !19)
!23 = distinct !DISubprogram(name: "globalReturnsFalse", scope: !9, file: !9, line: 23, type: !20, isLocal: false, isDefinition: true, scopeLine: 24, isOptimized: false, unit: !0, variables: !2)
!24 = !DILocation(line: 25, column: 5, scope: !23)
!25 = distinct !DISubprogram(name: "globalReturnsTrueOrFalse", scope: !9, file: !9, line: 28, type: !20, isLocal: false, isDefinition: true, scopeLine: 29, isOptimized: false, unit: !0, variables: !2)
!26 = !DILocation(line: 30, column: 13, scope: !25)
!27 = !DILocation(line: 30, column: 20, scope: !25)
!28 = !DILocation(line: 30, column: 5, scope: !25)
!29 = distinct !DISubprogram(name: "printHexCharLine", scope: !9, file: !9, line: 33, type: !30, isLocal: false, isDefinition: true, scopeLine: 34, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!30 = !DISubroutineType(types: !31)
!31 = !{null, !32}
!32 = !DIBasicType(name: "char", size: 8, align: 8, encoding: DW_ATE_signed_char)
!33 = !DILocalVariable(name: "charHex", arg: 1, scope: !29, file: !9, line: 33, type: !32)
!34 = !DIExpression()
!35 = !DILocation(line: 33, column: 29, scope: !29)
!36 = !DILocation(line: 35, column: 25, scope: !29)
!37 = !DILocation(line: 35, column: 20, scope: !29)
!38 = !DILocation(line: 35, column: 5, scope: !29)
!39 = !DILocation(line: 36, column: 1, scope: !29)
!40 = distinct !DISubprogram(name: "printLine", scope: !9, file: !9, line: 38, type: !41, isLocal: false, isDefinition: true, scopeLine: 39, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!41 = !DISubroutineType(types: !42)
!42 = !{null, !43}
!43 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !44, size: 64, align: 64)
!44 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !32)
!45 = !DILocalVariable(name: "line", arg: 1, scope: !40, file: !9, line: 38, type: !43)
!46 = !DILocation(line: 38, column: 30, scope: !40)
!47 = !DILocation(line: 40, column: 8, scope: !48)
!48 = distinct !DILexicalBlock(scope: !40, file: !9, line: 40, column: 8)
!49 = !DILocation(line: 40, column: 13, scope: !48)
!50 = !DILocation(line: 40, column: 8, scope: !40)
!51 = !DILocation(line: 42, column: 24, scope: !52)
!52 = distinct !DILexicalBlock(scope: !48, file: !9, line: 41, column: 5)
!53 = !DILocation(line: 42, column: 9, scope: !52)
!54 = !DILocation(line: 43, column: 5, scope: !52)
!55 = !DILocation(line: 44, column: 1, scope: !40)
!56 = distinct !DISubprogram(name: "printIntLine", scope: !9, file: !9, line: 46, type: !57, isLocal: false, isDefinition: true, scopeLine: 47, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!57 = !DISubroutineType(types: !58)
!58 = !{null, !4}
!59 = !DILocalVariable(name: "intNumber", arg: 1, scope: !56, file: !9, line: 46, type: !4)
!60 = !DILocation(line: 46, column: 24, scope: !56)
!61 = !DILocation(line: 48, column: 20, scope: !56)
!62 = !DILocation(line: 48, column: 5, scope: !56)
!63 = !DILocation(line: 49, column: 1, scope: !56)
!64 = distinct !DISubprogram(name: "printLongLine", scope: !9, file: !9, line: 51, type: !65, isLocal: false, isDefinition: true, scopeLine: 52, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!65 = !DISubroutineType(types: !66)
!66 = !{null, !67}
!67 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !68, line: 197, baseType: !69)
!68 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/sys/types.h", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/416")
!69 = !DIBasicType(name: "long int", size: 64, align: 64, encoding: DW_ATE_signed)
!70 = !DILocalVariable(name: "longIntNumber", arg: 1, scope: !64, file: !9, line: 51, type: !67)
!71 = !DILocation(line: 51, column: 29, scope: !64)
!72 = !DILocation(line: 53, column: 21, scope: !64)
!73 = !DILocation(line: 53, column: 5, scope: !64)
!74 = !DILocation(line: 54, column: 1, scope: !64)
!75 = distinct !DISubprogram(name: "bad44", scope: !9, file: !9, line: 59, type: !76, isLocal: false, isDefinition: true, scopeLine: 60, isOptimized: false, unit: !0, variables: !2)
!76 = !DISubroutineType(types: !77)
!77 = !{null}
!78 = !DILocalVariable(name: "data", scope: !75, file: !9, line: 61, type: !6)
!79 = !DILocation(line: 61, column: 11, scope: !75)
!80 = !DILocation(line: 63, column: 10, scope: !75)
!81 = !DILocation(line: 64, column: 5, scope: !75)
!82 = !DILocation(line: 66, column: 19, scope: !75)
!83 = !DILocation(line: 66, column: 12, scope: !75)
!84 = !DILocation(line: 66, column: 10, scope: !75)
!85 = !DILocation(line: 67, column: 9, scope: !86)
!86 = distinct !DILexicalBlock(scope: !75, file: !9, line: 67, column: 9)
!87 = !DILocation(line: 67, column: 14, scope: !86)
!88 = !DILocation(line: 67, column: 9, scope: !75)
!89 = !DILocation(line: 67, column: 23, scope: !90)
!90 = !DILexicalBlockFile(scope: !86, file: !9, discriminator: 1)
!91 = !DILocalVariable(name: "i", scope: !92, file: !9, line: 69, type: !93)
!92 = distinct !DILexicalBlock(scope: !75, file: !9, line: 68, column: 5)
!93 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !94, line: 62, baseType: !95)
!94 = !DIFile(filename: "/usr/local/bin/../lib/clang/3.9.0/include/stddef.h", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/416")
!95 = !DIBasicType(name: "long unsigned int", size: 64, align: 64, encoding: DW_ATE_unsigned)
!96 = !DILocation(line: 69, column: 16, scope: !92)
!97 = !DILocation(line: 70, column: 15, scope: !98)
!98 = distinct !DILexicalBlock(scope: !92, file: !9, line: 70, column: 9)
!99 = !DILocation(line: 70, column: 13, scope: !98)
!100 = !DILocation(line: 70, column: 20, scope: !101)
!101 = !DILexicalBlockFile(scope: !102, file: !9, discriminator: 1)
!102 = distinct !DILexicalBlock(scope: !98, file: !9, line: 70, column: 9)
!103 = !DILocation(line: 70, column: 22, scope: !101)
!104 = !DILocation(line: 70, column: 9, scope: !101)
!105 = !DILocation(line: 72, column: 18, scope: !106)
!106 = distinct !DILexicalBlock(scope: !102, file: !9, line: 71, column: 9)
!107 = !DILocation(line: 72, column: 13, scope: !106)
!108 = !DILocation(line: 72, column: 21, scope: !106)
!109 = !DILocation(line: 73, column: 9, scope: !106)
!110 = !DILocation(line: 70, column: 30, scope: !111)
!111 = !DILexicalBlockFile(scope: !102, file: !9, discriminator: 2)
!112 = !DILocation(line: 70, column: 9, scope: !111)
!113 = distinct !{!113, !114}
!114 = !DILocation(line: 70, column: 9, scope: !92)
!115 = !DILocation(line: 76, column: 10, scope: !75)
!116 = !DILocation(line: 76, column: 5, scope: !75)
!117 = !DILocation(line: 77, column: 5, scope: !75)
!118 = !DILocation(line: 80, column: 18, scope: !75)
!119 = !DILocation(line: 80, column: 5, scope: !75)
!120 = !DILocation(line: 82, column: 1, scope: !75)
!121 = !DILocation(line: 82, column: 1, scope: !122)
!122 = !DILexicalBlockFile(scope: !75, file: !9, discriminator: 1)
!123 = distinct !DISubprogram(name: "good44", scope: !9, file: !9, line: 88, type: !76, isLocal: false, isDefinition: true, scopeLine: 89, isOptimized: false, unit: !0, variables: !2)
!124 = !DILocalVariable(name: "data", scope: !123, file: !9, line: 90, type: !6)
!125 = !DILocation(line: 90, column: 11, scope: !123)
!126 = !DILocation(line: 92, column: 10, scope: !123)
!127 = !DILocation(line: 93, column: 5, scope: !123)
!128 = !DILocation(line: 95, column: 19, scope: !123)
!129 = !DILocation(line: 95, column: 12, scope: !123)
!130 = !DILocation(line: 95, column: 10, scope: !123)
!131 = !DILocation(line: 96, column: 9, scope: !132)
!132 = distinct !DILexicalBlock(scope: !123, file: !9, line: 96, column: 9)
!133 = !DILocation(line: 96, column: 14, scope: !132)
!134 = !DILocation(line: 96, column: 9, scope: !123)
!135 = !DILocation(line: 96, column: 23, scope: !136)
!136 = !DILexicalBlockFile(scope: !132, file: !9, discriminator: 1)
!137 = !DILocalVariable(name: "i", scope: !138, file: !9, line: 98, type: !93)
!138 = distinct !DILexicalBlock(scope: !123, file: !9, line: 97, column: 5)
!139 = !DILocation(line: 98, column: 16, scope: !138)
!140 = !DILocation(line: 99, column: 15, scope: !141)
!141 = distinct !DILexicalBlock(scope: !138, file: !9, line: 99, column: 9)
!142 = !DILocation(line: 99, column: 13, scope: !141)
!143 = !DILocation(line: 99, column: 20, scope: !144)
!144 = !DILexicalBlockFile(scope: !145, file: !9, discriminator: 1)
!145 = distinct !DILexicalBlock(scope: !141, file: !9, line: 99, column: 9)
!146 = !DILocation(line: 99, column: 22, scope: !144)
!147 = !DILocation(line: 99, column: 9, scope: !144)
!148 = !DILocation(line: 101, column: 18, scope: !149)
!149 = distinct !DILexicalBlock(scope: !145, file: !9, line: 100, column: 9)
!150 = !DILocation(line: 101, column: 13, scope: !149)
!151 = !DILocation(line: 101, column: 21, scope: !149)
!152 = !DILocation(line: 102, column: 9, scope: !149)
!153 = !DILocation(line: 99, column: 30, scope: !154)
!154 = !DILexicalBlockFile(scope: !145, file: !9, discriminator: 2)
!155 = !DILocation(line: 99, column: 9, scope: !154)
!156 = distinct !{!156, !157}
!157 = !DILocation(line: 99, column: 9, scope: !138)
!158 = !DILocation(line: 105, column: 10, scope: !123)
!159 = !DILocation(line: 105, column: 5, scope: !123)
!160 = !DILocation(line: 106, column: 5, scope: !123)
!161 = !DILocation(line: 112, column: 1, scope: !123)
!162 = distinct !DISubprogram(name: "main", scope: !9, file: !9, line: 115, type: !20, isLocal: false, isDefinition: true, scopeLine: 115, isOptimized: false, unit: !0, variables: !2)
!163 = !DILocation(line: 116, column: 2, scope: !162)
!164 = !DILocation(line: 117, column: 2, scope: !162)
!165 = !DILocation(line: 118, column: 5, scope: !162)
