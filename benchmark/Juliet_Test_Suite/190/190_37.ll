; ModuleID = './190_37.c'
source_filename = "./190_37.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@GLOBAL_CONST_TRUE = constant i32 1, align 4
@GLOBAL_CONST_FALSE = constant i32 0, align 4
@GLOBAL_CONST_FIVE = constant i32 5, align 4
@globalTrue = global i32 1, align 4
@globalFalse = global i32 0, align 4
@globalFive = global i32 5, align 4
@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@.str.1 = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1
@.str.2 = private unnamed_addr constant [5 x i8] c"%ld\0A\00", align 1
@stdin = external global %struct._IO_FILE*, align 8
@.str.3 = private unnamed_addr constant [16 x i8] c"fgets() failed.\00", align 1
@.str.4 = private unnamed_addr constant [54 x i8] c"data value is too large to perform arithmetic safely.\00", align 1

; Function Attrs: nounwind uwtable
define void @printHexCharLine(i8 signext %charHex) #0 !dbg !18 {
entry:
  %charHex.addr = alloca i8, align 1
  store i8 %charHex, i8* %charHex.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %charHex.addr, metadata !22, metadata !23), !dbg !24
  %0 = load i8, i8* %charHex.addr, align 1, !dbg !25
  %conv = sext i8 %0 to i32, !dbg !26
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), i32 %conv), !dbg !27
  ret void, !dbg !28
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @printf(i8*, ...) #2

; Function Attrs: nounwind uwtable
define void @printLine(i8* %line) #0 !dbg !29 {
entry:
  %line.addr = alloca i8*, align 8
  store i8* %line, i8** %line.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %line.addr, metadata !34, metadata !23), !dbg !35
  %0 = load i8*, i8** %line.addr, align 8, !dbg !36
  %cmp = icmp ne i8* %0, null, !dbg !38
  br i1 %cmp, label %if.then, label %if.end, !dbg !39

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** %line.addr, align 8, !dbg !40
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i32 0, i32 0), i8* %1), !dbg !42
  br label %if.end, !dbg !43

if.end:                                           ; preds = %if.then, %entry
  ret void, !dbg !44
}

; Function Attrs: nounwind uwtable
define void @printIntLine(i32 %intNumber) #0 !dbg !45 {
entry:
  %intNumber.addr = alloca i32, align 4
  store i32 %intNumber, i32* %intNumber.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %intNumber.addr, metadata !48, metadata !23), !dbg !49
  %0 = load i32, i32* %intNumber.addr, align 4, !dbg !50
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), i32 %0), !dbg !51
  ret void, !dbg !52
}

; Function Attrs: nounwind uwtable
define void @printLongLine(i64 %longIntNumber) #0 !dbg !53 {
entry:
  %longIntNumber.addr = alloca i64, align 8
  store i64 %longIntNumber, i64* %longIntNumber.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %longIntNumber.addr, metadata !59, metadata !23), !dbg !60
  %0 = load i64, i64* %longIntNumber.addr, align 8, !dbg !61
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.2, i32 0, i32 0), i64 %0), !dbg !62
  ret void, !dbg !63
}

; Function Attrs: nounwind uwtable
define void @bad37() #0 !dbg !64 {
entry:
  %data = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %result = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !67, metadata !23), !dbg !68
  store i32 0, i32* %data, align 4, !dbg !69
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !70, metadata !23), !dbg !77
  %0 = bitcast [14 x i8]* %inputBuffer to i8*, !dbg !77
  call void @llvm.memset.p0i8.i64(i8* %0, i8 0, i64 14, i32 1, i1 false), !dbg !77
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i32 0, i32 0, !dbg !78
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !80
  %call = call i8* @fgets(i8* %arraydecay, i32 14, %struct._IO_FILE* %1), !dbg !81
  %cmp = icmp ne i8* %call, null, !dbg !82
  br i1 %cmp, label %if.then, label %if.else, !dbg !83

if.then:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i32 0, i32 0, !dbg !84
  %call2 = call i32 @atoi(i8* %arraydecay1) #5, !dbg !86
  store i32 %call2, i32* %data, align 4, !dbg !87
  br label %if.end, !dbg !88

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.3, i32 0, i32 0)), !dbg !89
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata i32* %result, metadata !91, metadata !23), !dbg !95
  %2 = load i32, i32* %data, align 4, !dbg !96
  %add = add nsw i32 %2, 1, !dbg !97
  store i32 %add, i32* %result, align 4, !dbg !95
  %3 = load i32, i32* %result, align 4, !dbg !98
  call void @printIntLine(i32 %3), !dbg !99
  ret void, !dbg !100
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #3

declare i8* @fgets(i8*, i32, %struct._IO_FILE*) #2

; Function Attrs: nounwind readonly
declare i32 @atoi(i8*) #4

; Function Attrs: nounwind uwtable
define void @good37() #0 !dbg !101 {
entry:
  %data = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %result = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !102, metadata !23), !dbg !103
  store i32 0, i32* %data, align 4, !dbg !104
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !105, metadata !23), !dbg !109
  %0 = bitcast [14 x i8]* %inputBuffer to i8*, !dbg !109
  call void @llvm.memset.p0i8.i64(i8* %0, i8 0, i64 14, i32 1, i1 false), !dbg !109
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i32 0, i32 0, !dbg !110
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !112
  %call = call i8* @fgets(i8* %arraydecay, i32 14, %struct._IO_FILE* %1), !dbg !113
  %cmp = icmp ne i8* %call, null, !dbg !114
  br i1 %cmp, label %if.then, label %if.else, !dbg !115

if.then:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i32 0, i32 0, !dbg !116
  %call2 = call i32 @atoi(i8* %arraydecay1) #5, !dbg !118
  store i32 %call2, i32* %data, align 4, !dbg !119
  br label %if.end, !dbg !120

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.3, i32 0, i32 0)), !dbg !121
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %2 = load i32, i32* %data, align 4, !dbg !123
  %cmp3 = icmp slt i32 %2, 2147483647, !dbg !127
  br i1 %cmp3, label %if.then4, label %if.else5, !dbg !128

if.then4:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %result, metadata !129, metadata !23), !dbg !131
  %3 = load i32, i32* %data, align 4, !dbg !132
  %add = add nsw i32 %3, 1, !dbg !133
  store i32 %add, i32* %result, align 4, !dbg !131
  %4 = load i32, i32* %result, align 4, !dbg !134
  call void @printIntLine(i32 %4), !dbg !135
  br label %if.end6, !dbg !136

if.else5:                                         ; preds = %if.end
  call void @printLine(i8* getelementptr inbounds ([54 x i8], [54 x i8]* @.str.4, i32 0, i32 0)), !dbg !137
  br label %if.end6

if.end6:                                          ; preds = %if.else5, %if.then4
  ret void, !dbg !139
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !140 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @good37(), !dbg !143
  call void @bad37(), !dbg !144
  ret i32 1, !dbg !145
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { argmemonly nounwind }
attributes #4 = { nounwind readonly "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind readonly }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!15, !16}
!llvm.ident = !{!17}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (tags/RELEASE_390/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, globals: !6)
!1 = !DIFile(filename: "190_37.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/190")
!2 = !{}
!3 = !{!4, !5}
!4 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64, align: 64)
!6 = !{!7, !10, !11, !12, !13, !14}
!7 = distinct !DIGlobalVariable(name: "GLOBAL_CONST_TRUE", scope: !0, file: !8, line: 12, type: !9, isLocal: false, isDefinition: true, variable: i32* @GLOBAL_CONST_TRUE)
!8 = !DIFile(filename: "./190_37.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/190")
!9 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !4)
!10 = distinct !DIGlobalVariable(name: "GLOBAL_CONST_FALSE", scope: !0, file: !8, line: 13, type: !9, isLocal: false, isDefinition: true, variable: i32* @GLOBAL_CONST_FALSE)
!11 = distinct !DIGlobalVariable(name: "GLOBAL_CONST_FIVE", scope: !0, file: !8, line: 14, type: !9, isLocal: false, isDefinition: true, variable: i32* @GLOBAL_CONST_FIVE)
!12 = distinct !DIGlobalVariable(name: "globalTrue", scope: !0, file: !8, line: 16, type: !4, isLocal: false, isDefinition: true, variable: i32* @globalTrue)
!13 = distinct !DIGlobalVariable(name: "globalFalse", scope: !0, file: !8, line: 17, type: !4, isLocal: false, isDefinition: true, variable: i32* @globalFalse)
!14 = distinct !DIGlobalVariable(name: "globalFive", scope: !0, file: !8, line: 18, type: !4, isLocal: false, isDefinition: true, variable: i32* @globalFive)
!15 = !{i32 2, !"Dwarf Version", i32 4}
!16 = !{i32 2, !"Debug Info Version", i32 3}
!17 = !{!"clang version 3.9.0 (tags/RELEASE_390/final)"}
!18 = distinct !DISubprogram(name: "printHexCharLine", scope: !8, file: !8, line: 20, type: !19, isLocal: false, isDefinition: true, scopeLine: 21, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!19 = !DISubroutineType(types: !20)
!20 = !{null, !21}
!21 = !DIBasicType(name: "char", size: 8, align: 8, encoding: DW_ATE_signed_char)
!22 = !DILocalVariable(name: "charHex", arg: 1, scope: !18, file: !8, line: 20, type: !21)
!23 = !DIExpression()
!24 = !DILocation(line: 20, column: 29, scope: !18)
!25 = !DILocation(line: 22, column: 25, scope: !18)
!26 = !DILocation(line: 22, column: 20, scope: !18)
!27 = !DILocation(line: 22, column: 5, scope: !18)
!28 = !DILocation(line: 23, column: 1, scope: !18)
!29 = distinct !DISubprogram(name: "printLine", scope: !8, file: !8, line: 25, type: !30, isLocal: false, isDefinition: true, scopeLine: 26, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!30 = !DISubroutineType(types: !31)
!31 = !{null, !32}
!32 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !33, size: 64, align: 64)
!33 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !21)
!34 = !DILocalVariable(name: "line", arg: 1, scope: !29, file: !8, line: 25, type: !32)
!35 = !DILocation(line: 25, column: 30, scope: !29)
!36 = !DILocation(line: 27, column: 8, scope: !37)
!37 = distinct !DILexicalBlock(scope: !29, file: !8, line: 27, column: 8)
!38 = !DILocation(line: 27, column: 13, scope: !37)
!39 = !DILocation(line: 27, column: 8, scope: !29)
!40 = !DILocation(line: 29, column: 24, scope: !41)
!41 = distinct !DILexicalBlock(scope: !37, file: !8, line: 28, column: 5)
!42 = !DILocation(line: 29, column: 9, scope: !41)
!43 = !DILocation(line: 30, column: 5, scope: !41)
!44 = !DILocation(line: 31, column: 1, scope: !29)
!45 = distinct !DISubprogram(name: "printIntLine", scope: !8, file: !8, line: 33, type: !46, isLocal: false, isDefinition: true, scopeLine: 34, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!46 = !DISubroutineType(types: !47)
!47 = !{null, !4}
!48 = !DILocalVariable(name: "intNumber", arg: 1, scope: !45, file: !8, line: 33, type: !4)
!49 = !DILocation(line: 33, column: 24, scope: !45)
!50 = !DILocation(line: 35, column: 20, scope: !45)
!51 = !DILocation(line: 35, column: 5, scope: !45)
!52 = !DILocation(line: 36, column: 1, scope: !45)
!53 = distinct !DISubprogram(name: "printLongLine", scope: !8, file: !8, line: 38, type: !54, isLocal: false, isDefinition: true, scopeLine: 39, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!54 = !DISubroutineType(types: !55)
!55 = !{null, !56}
!56 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !57, line: 197, baseType: !58)
!57 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/sys/types.h", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/190")
!58 = !DIBasicType(name: "long int", size: 64, align: 64, encoding: DW_ATE_signed)
!59 = !DILocalVariable(name: "longIntNumber", arg: 1, scope: !53, file: !8, line: 38, type: !56)
!60 = !DILocation(line: 38, column: 29, scope: !53)
!61 = !DILocation(line: 40, column: 21, scope: !53)
!62 = !DILocation(line: 40, column: 5, scope: !53)
!63 = !DILocation(line: 41, column: 1, scope: !53)
!64 = distinct !DISubprogram(name: "bad37", scope: !8, file: !8, line: 46, type: !65, isLocal: false, isDefinition: true, scopeLine: 47, isOptimized: false, unit: !0, variables: !2)
!65 = !DISubroutineType(types: !66)
!66 = !{null}
!67 = !DILocalVariable(name: "data", scope: !64, file: !8, line: 48, type: !4)
!68 = !DILocation(line: 48, column: 9, scope: !64)
!69 = !DILocation(line: 50, column: 10, scope: !64)
!70 = !DILocalVariable(name: "inputBuffer", scope: !71, file: !8, line: 54, type: !74)
!71 = distinct !DILexicalBlock(scope: !72, file: !8, line: 53, column: 9)
!72 = distinct !DILexicalBlock(scope: !73, file: !8, line: 52, column: 5)
!73 = distinct !DILexicalBlock(scope: !64, file: !8, line: 51, column: 8)
!74 = !DICompositeType(tag: DW_TAG_array_type, baseType: !21, size: 112, align: 8, elements: !75)
!75 = !{!76}
!76 = !DISubrange(count: 14)
!77 = !DILocation(line: 54, column: 18, scope: !71)
!78 = !DILocation(line: 56, column: 23, scope: !79)
!79 = distinct !DILexicalBlock(scope: !71, file: !8, line: 56, column: 17)
!80 = !DILocation(line: 56, column: 53, scope: !79)
!81 = !DILocation(line: 56, column: 17, scope: !79)
!82 = !DILocation(line: 56, column: 60, scope: !79)
!83 = !DILocation(line: 56, column: 17, scope: !71)
!84 = !DILocation(line: 59, column: 29, scope: !85)
!85 = distinct !DILexicalBlock(scope: !79, file: !8, line: 57, column: 13)
!86 = !DILocation(line: 59, column: 24, scope: !85)
!87 = !DILocation(line: 59, column: 22, scope: !85)
!88 = !DILocation(line: 60, column: 13, scope: !85)
!89 = !DILocation(line: 63, column: 17, scope: !90)
!90 = distinct !DILexicalBlock(scope: !79, file: !8, line: 62, column: 13)
!91 = !DILocalVariable(name: "result", scope: !92, file: !8, line: 71, type: !4)
!92 = distinct !DILexicalBlock(scope: !93, file: !8, line: 69, column: 9)
!93 = distinct !DILexicalBlock(scope: !94, file: !8, line: 68, column: 5)
!94 = distinct !DILexicalBlock(scope: !64, file: !8, line: 67, column: 8)
!95 = !DILocation(line: 71, column: 17, scope: !92)
!96 = !DILocation(line: 71, column: 26, scope: !92)
!97 = !DILocation(line: 71, column: 31, scope: !92)
!98 = !DILocation(line: 72, column: 26, scope: !92)
!99 = !DILocation(line: 72, column: 13, scope: !92)
!100 = !DILocation(line: 75, column: 1, scope: !64)
!101 = distinct !DISubprogram(name: "good37", scope: !8, file: !8, line: 81, type: !65, isLocal: false, isDefinition: true, scopeLine: 82, isOptimized: false, unit: !0, variables: !2)
!102 = !DILocalVariable(name: "data", scope: !101, file: !8, line: 83, type: !4)
!103 = !DILocation(line: 83, column: 9, scope: !101)
!104 = !DILocation(line: 85, column: 10, scope: !101)
!105 = !DILocalVariable(name: "inputBuffer", scope: !106, file: !8, line: 89, type: !74)
!106 = distinct !DILexicalBlock(scope: !107, file: !8, line: 88, column: 9)
!107 = distinct !DILexicalBlock(scope: !108, file: !8, line: 87, column: 5)
!108 = distinct !DILexicalBlock(scope: !101, file: !8, line: 86, column: 8)
!109 = !DILocation(line: 89, column: 18, scope: !106)
!110 = !DILocation(line: 91, column: 23, scope: !111)
!111 = distinct !DILexicalBlock(scope: !106, file: !8, line: 91, column: 17)
!112 = !DILocation(line: 91, column: 53, scope: !111)
!113 = !DILocation(line: 91, column: 17, scope: !111)
!114 = !DILocation(line: 91, column: 60, scope: !111)
!115 = !DILocation(line: 91, column: 17, scope: !106)
!116 = !DILocation(line: 94, column: 29, scope: !117)
!117 = distinct !DILexicalBlock(scope: !111, file: !8, line: 92, column: 13)
!118 = !DILocation(line: 94, column: 24, scope: !117)
!119 = !DILocation(line: 94, column: 22, scope: !117)
!120 = !DILocation(line: 95, column: 13, scope: !117)
!121 = !DILocation(line: 98, column: 17, scope: !122)
!122 = distinct !DILexicalBlock(scope: !111, file: !8, line: 97, column: 13)
!123 = !DILocation(line: 110, column: 13, scope: !124)
!124 = distinct !DILexicalBlock(scope: !125, file: !8, line: 110, column: 13)
!125 = distinct !DILexicalBlock(scope: !126, file: !8, line: 108, column: 5)
!126 = distinct !DILexicalBlock(scope: !101, file: !8, line: 102, column: 8)
!127 = !DILocation(line: 110, column: 18, scope: !124)
!128 = !DILocation(line: 110, column: 13, scope: !125)
!129 = !DILocalVariable(name: "result", scope: !130, file: !8, line: 112, type: !4)
!130 = distinct !DILexicalBlock(scope: !124, file: !8, line: 111, column: 9)
!131 = !DILocation(line: 112, column: 17, scope: !130)
!132 = !DILocation(line: 112, column: 26, scope: !130)
!133 = !DILocation(line: 112, column: 31, scope: !130)
!134 = !DILocation(line: 113, column: 26, scope: !130)
!135 = !DILocation(line: 113, column: 13, scope: !130)
!136 = !DILocation(line: 114, column: 9, scope: !130)
!137 = !DILocation(line: 117, column: 13, scope: !138)
!138 = distinct !DILexicalBlock(scope: !124, file: !8, line: 116, column: 9)
!139 = !DILocation(line: 120, column: 1, scope: !101)
!140 = distinct !DISubprogram(name: "main", scope: !8, file: !8, line: 124, type: !141, isLocal: false, isDefinition: true, scopeLine: 124, isOptimized: false, unit: !0, variables: !2)
!141 = !DISubroutineType(types: !142)
!142 = !{!4}
!143 = !DILocation(line: 125, column: 5, scope: !140)
!144 = !DILocation(line: 126, column: 5, scope: !140)
!145 = !DILocation(line: 127, column: 5, scope: !140)
