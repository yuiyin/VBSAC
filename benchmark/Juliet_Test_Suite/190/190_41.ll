; ModuleID = './190_41.c'
source_filename = "./190_41.c"
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
@staticFive = internal global i32 5, align 4
@stdin = external global %struct._IO_FILE*, align 8
@.str.3 = private unnamed_addr constant [16 x i8] c"fgets() failed.\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@.str.5 = private unnamed_addr constant [54 x i8] c"data value is too large to perform arithmetic safely.\00", align 1

; Function Attrs: nounwind uwtable
define void @printHexCharLine(i8 signext %charHex) #0 !dbg !19 {
entry:
  %charHex.addr = alloca i8, align 1
  store i8 %charHex, i8* %charHex.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %charHex.addr, metadata !23, metadata !24), !dbg !25
  %0 = load i8, i8* %charHex.addr, align 1, !dbg !26
  %conv = sext i8 %0 to i32, !dbg !27
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), i32 %conv), !dbg !28
  ret void, !dbg !29
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @printf(i8*, ...) #2

; Function Attrs: nounwind uwtable
define void @printLine(i8* %line) #0 !dbg !30 {
entry:
  %line.addr = alloca i8*, align 8
  store i8* %line, i8** %line.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %line.addr, metadata !35, metadata !24), !dbg !36
  %0 = load i8*, i8** %line.addr, align 8, !dbg !37
  %cmp = icmp ne i8* %0, null, !dbg !39
  br i1 %cmp, label %if.then, label %if.end, !dbg !40

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** %line.addr, align 8, !dbg !41
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i32 0, i32 0), i8* %1), !dbg !43
  br label %if.end, !dbg !44

if.end:                                           ; preds = %if.then, %entry
  ret void, !dbg !45
}

; Function Attrs: nounwind uwtable
define void @printIntLine(i32 %intNumber) #0 !dbg !46 {
entry:
  %intNumber.addr = alloca i32, align 4
  store i32 %intNumber, i32* %intNumber.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %intNumber.addr, metadata !49, metadata !24), !dbg !50
  %0 = load i32, i32* %intNumber.addr, align 4, !dbg !51
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), i32 %0), !dbg !52
  ret void, !dbg !53
}

; Function Attrs: nounwind uwtable
define void @printLongLine(i64 %longIntNumber) #0 !dbg !54 {
entry:
  %longIntNumber.addr = alloca i64, align 8
  store i64 %longIntNumber, i64* %longIntNumber.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %longIntNumber.addr, metadata !60, metadata !24), !dbg !61
  %0 = load i64, i64* %longIntNumber.addr, align 8, !dbg !62
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.2, i32 0, i32 0), i64 %0), !dbg !63
  ret void, !dbg !64
}

; Function Attrs: nounwind uwtable
define void @bad41() #0 !dbg !65 {
entry:
  %data = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %result = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !68, metadata !24), !dbg !69
  store i32 0, i32* %data, align 4, !dbg !70
  %0 = load i32, i32* @staticFive, align 4, !dbg !71
  %cmp = icmp eq i32 %0, 5, !dbg !73
  br i1 %cmp, label %if.then, label %if.end5, !dbg !74

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !75, metadata !24), !dbg !81
  %1 = bitcast [14 x i8]* %inputBuffer to i8*, !dbg !81
  call void @llvm.memset.p0i8.i64(i8* %1, i8 0, i64 14, i32 1, i1 false), !dbg !81
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i32 0, i32 0, !dbg !82
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !84
  %call = call i8* @fgets(i8* %arraydecay, i32 14, %struct._IO_FILE* %2), !dbg !85
  %cmp1 = icmp ne i8* %call, null, !dbg !86
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !87

if.then2:                                         ; preds = %if.then
  %arraydecay3 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i32 0, i32 0, !dbg !88
  %call4 = call i32 @atoi(i8* %arraydecay3) #5, !dbg !90
  store i32 %call4, i32* %data, align 4, !dbg !91
  br label %if.end, !dbg !92

if.else:                                          ; preds = %if.then
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.3, i32 0, i32 0)), !dbg !93
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then2
  br label %if.end5, !dbg !95

if.end5:                                          ; preds = %if.end, %entry
  %3 = load i32, i32* @staticFive, align 4, !dbg !96
  %cmp6 = icmp eq i32 %3, 5, !dbg !98
  br i1 %cmp6, label %if.then7, label %if.end11, !dbg !99

if.then7:                                         ; preds = %if.end5
  %4 = load i32, i32* %data, align 4, !dbg !100
  %cmp8 = icmp sgt i32 %4, 0, !dbg !103
  br i1 %cmp8, label %if.then9, label %if.end10, !dbg !104

if.then9:                                         ; preds = %if.then7
  call void @llvm.dbg.declare(metadata i32* %result, metadata !105, metadata !24), !dbg !107
  %5 = load i32, i32* %data, align 4, !dbg !108
  %mul = mul nsw i32 %5, 2, !dbg !109
  store i32 %mul, i32* %result, align 4, !dbg !107
  %6 = load i32, i32* %result, align 4, !dbg !110
  call void @printIntLine(i32 %6), !dbg !111
  br label %if.end10, !dbg !112

if.end10:                                         ; preds = %if.then9, %if.then7
  br label %if.end11, !dbg !113

if.end11:                                         ; preds = %if.end10, %if.end5
  ret void, !dbg !114
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #3

declare i8* @fgets(i8*, i32, %struct._IO_FILE*) #2

; Function Attrs: nounwind readonly
declare i32 @atoi(i8*) #4

; Function Attrs: nounwind uwtable
define void @good41() #0 !dbg !115 {
entry:
  %data = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %result = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !116, metadata !24), !dbg !117
  store i32 0, i32* %data, align 4, !dbg !118
  %0 = load i32, i32* @staticFive, align 4, !dbg !119
  %cmp = icmp eq i32 %0, 5, !dbg !121
  br i1 %cmp, label %if.then, label %if.end5, !dbg !122

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !123, metadata !24), !dbg !126
  %1 = bitcast [14 x i8]* %inputBuffer to i8*, !dbg !126
  call void @llvm.memset.p0i8.i64(i8* %1, i8 0, i64 14, i32 1, i1 false), !dbg !126
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i32 0, i32 0, !dbg !127
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !129
  %call = call i8* @fgets(i8* %arraydecay, i32 14, %struct._IO_FILE* %2), !dbg !130
  %cmp1 = icmp ne i8* %call, null, !dbg !131
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !132

if.then2:                                         ; preds = %if.then
  %arraydecay3 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i32 0, i32 0, !dbg !133
  %call4 = call i32 @atoi(i8* %arraydecay3) #5, !dbg !135
  store i32 %call4, i32* %data, align 4, !dbg !136
  br label %if.end, !dbg !137

if.else:                                          ; preds = %if.then
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.3, i32 0, i32 0)), !dbg !138
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then2
  br label %if.end5, !dbg !140

if.end5:                                          ; preds = %if.end, %entry
  %3 = load i32, i32* @staticFive, align 4, !dbg !141
  %cmp6 = icmp ne i32 %3, 5, !dbg !143
  br i1 %cmp6, label %if.then7, label %if.else8, !dbg !144

if.then7:                                         ; preds = %if.end5
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i32 0, i32 0)), !dbg !145
  br label %if.end16, !dbg !147

if.else8:                                         ; preds = %if.end5
  %4 = load i32, i32* %data, align 4, !dbg !148
  %cmp9 = icmp sgt i32 %4, 0, !dbg !151
  br i1 %cmp9, label %if.then10, label %if.end15, !dbg !152

if.then10:                                        ; preds = %if.else8
  %5 = load i32, i32* %data, align 4, !dbg !153
  %cmp11 = icmp slt i32 %5, 1073741823, !dbg !156
  br i1 %cmp11, label %if.then12, label %if.else13, !dbg !157

if.then12:                                        ; preds = %if.then10
  call void @llvm.dbg.declare(metadata i32* %result, metadata !158, metadata !24), !dbg !160
  %6 = load i32, i32* %data, align 4, !dbg !161
  %mul = mul nsw i32 %6, 2, !dbg !162
  store i32 %mul, i32* %result, align 4, !dbg !160
  %7 = load i32, i32* %result, align 4, !dbg !163
  call void @printIntLine(i32 %7), !dbg !164
  br label %if.end14, !dbg !165

if.else13:                                        ; preds = %if.then10
  call void @printLine(i8* getelementptr inbounds ([54 x i8], [54 x i8]* @.str.5, i32 0, i32 0)), !dbg !166
  br label %if.end14

if.end14:                                         ; preds = %if.else13, %if.then12
  br label %if.end15, !dbg !168

if.end15:                                         ; preds = %if.end14, %if.else8
  br label %if.end16

if.end16:                                         ; preds = %if.end15, %if.then7
  ret void, !dbg !169
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !170 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @good41(), !dbg !173
  call void @bad41(), !dbg !174
  ret i32 1, !dbg !175
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { argmemonly nounwind }
attributes #4 = { nounwind readonly "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind readonly }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!16, !17}
!llvm.ident = !{!18}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (tags/RELEASE_390/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, globals: !6)
!1 = !DIFile(filename: "190_41.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/190")
!2 = !{}
!3 = !{!4, !5}
!4 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64, align: 64)
!6 = !{!7, !10, !11, !12, !13, !14, !15}
!7 = distinct !DIGlobalVariable(name: "GLOBAL_CONST_TRUE", scope: !0, file: !8, line: 10, type: !9, isLocal: false, isDefinition: true, variable: i32* @GLOBAL_CONST_TRUE)
!8 = !DIFile(filename: "./190_41.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/190")
!9 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !4)
!10 = distinct !DIGlobalVariable(name: "GLOBAL_CONST_FALSE", scope: !0, file: !8, line: 11, type: !9, isLocal: false, isDefinition: true, variable: i32* @GLOBAL_CONST_FALSE)
!11 = distinct !DIGlobalVariable(name: "GLOBAL_CONST_FIVE", scope: !0, file: !8, line: 12, type: !9, isLocal: false, isDefinition: true, variable: i32* @GLOBAL_CONST_FIVE)
!12 = distinct !DIGlobalVariable(name: "globalTrue", scope: !0, file: !8, line: 14, type: !4, isLocal: false, isDefinition: true, variable: i32* @globalTrue)
!13 = distinct !DIGlobalVariable(name: "globalFalse", scope: !0, file: !8, line: 15, type: !4, isLocal: false, isDefinition: true, variable: i32* @globalFalse)
!14 = distinct !DIGlobalVariable(name: "globalFive", scope: !0, file: !8, line: 16, type: !4, isLocal: false, isDefinition: true, variable: i32* @globalFive)
!15 = distinct !DIGlobalVariable(name: "staticFive", scope: !0, file: !8, line: 46, type: !4, isLocal: true, isDefinition: true, variable: i32* @staticFive)
!16 = !{i32 2, !"Dwarf Version", i32 4}
!17 = !{i32 2, !"Debug Info Version", i32 3}
!18 = !{!"clang version 3.9.0 (tags/RELEASE_390/final)"}
!19 = distinct !DISubprogram(name: "printHexCharLine", scope: !8, file: !8, line: 18, type: !20, isLocal: false, isDefinition: true, scopeLine: 19, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!20 = !DISubroutineType(types: !21)
!21 = !{null, !22}
!22 = !DIBasicType(name: "char", size: 8, align: 8, encoding: DW_ATE_signed_char)
!23 = !DILocalVariable(name: "charHex", arg: 1, scope: !19, file: !8, line: 18, type: !22)
!24 = !DIExpression()
!25 = !DILocation(line: 18, column: 29, scope: !19)
!26 = !DILocation(line: 20, column: 25, scope: !19)
!27 = !DILocation(line: 20, column: 20, scope: !19)
!28 = !DILocation(line: 20, column: 5, scope: !19)
!29 = !DILocation(line: 21, column: 1, scope: !19)
!30 = distinct !DISubprogram(name: "printLine", scope: !8, file: !8, line: 23, type: !31, isLocal: false, isDefinition: true, scopeLine: 24, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!31 = !DISubroutineType(types: !32)
!32 = !{null, !33}
!33 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !34, size: 64, align: 64)
!34 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !22)
!35 = !DILocalVariable(name: "line", arg: 1, scope: !30, file: !8, line: 23, type: !33)
!36 = !DILocation(line: 23, column: 30, scope: !30)
!37 = !DILocation(line: 25, column: 8, scope: !38)
!38 = distinct !DILexicalBlock(scope: !30, file: !8, line: 25, column: 8)
!39 = !DILocation(line: 25, column: 13, scope: !38)
!40 = !DILocation(line: 25, column: 8, scope: !30)
!41 = !DILocation(line: 27, column: 24, scope: !42)
!42 = distinct !DILexicalBlock(scope: !38, file: !8, line: 26, column: 5)
!43 = !DILocation(line: 27, column: 9, scope: !42)
!44 = !DILocation(line: 28, column: 5, scope: !42)
!45 = !DILocation(line: 29, column: 1, scope: !30)
!46 = distinct !DISubprogram(name: "printIntLine", scope: !8, file: !8, line: 31, type: !47, isLocal: false, isDefinition: true, scopeLine: 32, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!47 = !DISubroutineType(types: !48)
!48 = !{null, !4}
!49 = !DILocalVariable(name: "intNumber", arg: 1, scope: !46, file: !8, line: 31, type: !4)
!50 = !DILocation(line: 31, column: 24, scope: !46)
!51 = !DILocation(line: 33, column: 20, scope: !46)
!52 = !DILocation(line: 33, column: 5, scope: !46)
!53 = !DILocation(line: 34, column: 1, scope: !46)
!54 = distinct !DISubprogram(name: "printLongLine", scope: !8, file: !8, line: 36, type: !55, isLocal: false, isDefinition: true, scopeLine: 37, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!55 = !DISubroutineType(types: !56)
!56 = !{null, !57}
!57 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !58, line: 197, baseType: !59)
!58 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/sys/types.h", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/190")
!59 = !DIBasicType(name: "long int", size: 64, align: 64, encoding: DW_ATE_signed)
!60 = !DILocalVariable(name: "longIntNumber", arg: 1, scope: !54, file: !8, line: 36, type: !57)
!61 = !DILocation(line: 36, column: 29, scope: !54)
!62 = !DILocation(line: 38, column: 21, scope: !54)
!63 = !DILocation(line: 38, column: 5, scope: !54)
!64 = !DILocation(line: 39, column: 1, scope: !54)
!65 = distinct !DISubprogram(name: "bad41", scope: !8, file: !8, line: 50, type: !66, isLocal: false, isDefinition: true, scopeLine: 51, isOptimized: false, unit: !0, variables: !2)
!66 = !DISubroutineType(types: !67)
!67 = !{null}
!68 = !DILocalVariable(name: "data", scope: !65, file: !8, line: 52, type: !4)
!69 = !DILocation(line: 52, column: 9, scope: !65)
!70 = !DILocation(line: 54, column: 10, scope: !65)
!71 = !DILocation(line: 55, column: 8, scope: !72)
!72 = distinct !DILexicalBlock(scope: !65, file: !8, line: 55, column: 8)
!73 = !DILocation(line: 55, column: 18, scope: !72)
!74 = !DILocation(line: 55, column: 8, scope: !65)
!75 = !DILocalVariable(name: "inputBuffer", scope: !76, file: !8, line: 58, type: !78)
!76 = distinct !DILexicalBlock(scope: !77, file: !8, line: 57, column: 9)
!77 = distinct !DILexicalBlock(scope: !72, file: !8, line: 56, column: 5)
!78 = !DICompositeType(tag: DW_TAG_array_type, baseType: !22, size: 112, align: 8, elements: !79)
!79 = !{!80}
!80 = !DISubrange(count: 14)
!81 = !DILocation(line: 58, column: 18, scope: !76)
!82 = !DILocation(line: 60, column: 23, scope: !83)
!83 = distinct !DILexicalBlock(scope: !76, file: !8, line: 60, column: 17)
!84 = !DILocation(line: 60, column: 53, scope: !83)
!85 = !DILocation(line: 60, column: 17, scope: !83)
!86 = !DILocation(line: 60, column: 60, scope: !83)
!87 = !DILocation(line: 60, column: 17, scope: !76)
!88 = !DILocation(line: 63, column: 29, scope: !89)
!89 = distinct !DILexicalBlock(scope: !83, file: !8, line: 61, column: 13)
!90 = !DILocation(line: 63, column: 24, scope: !89)
!91 = !DILocation(line: 63, column: 22, scope: !89)
!92 = !DILocation(line: 64, column: 13, scope: !89)
!93 = !DILocation(line: 67, column: 17, scope: !94)
!94 = distinct !DILexicalBlock(scope: !83, file: !8, line: 66, column: 13)
!95 = !DILocation(line: 70, column: 5, scope: !77)
!96 = !DILocation(line: 71, column: 8, scope: !97)
!97 = distinct !DILexicalBlock(scope: !65, file: !8, line: 71, column: 8)
!98 = !DILocation(line: 71, column: 18, scope: !97)
!99 = !DILocation(line: 71, column: 8, scope: !65)
!100 = !DILocation(line: 73, column: 12, scope: !101)
!101 = distinct !DILexicalBlock(scope: !102, file: !8, line: 73, column: 12)
!102 = distinct !DILexicalBlock(scope: !97, file: !8, line: 72, column: 5)
!103 = !DILocation(line: 73, column: 17, scope: !101)
!104 = !DILocation(line: 73, column: 12, scope: !102)
!105 = !DILocalVariable(name: "result", scope: !106, file: !8, line: 76, type: !4)
!106 = distinct !DILexicalBlock(scope: !101, file: !8, line: 74, column: 9)
!107 = !DILocation(line: 76, column: 17, scope: !106)
!108 = !DILocation(line: 76, column: 26, scope: !106)
!109 = !DILocation(line: 76, column: 31, scope: !106)
!110 = !DILocation(line: 77, column: 26, scope: !106)
!111 = !DILocation(line: 77, column: 13, scope: !106)
!112 = !DILocation(line: 78, column: 9, scope: !106)
!113 = !DILocation(line: 79, column: 5, scope: !102)
!114 = !DILocation(line: 80, column: 1, scope: !65)
!115 = distinct !DISubprogram(name: "good41", scope: !8, file: !8, line: 86, type: !66, isLocal: false, isDefinition: true, scopeLine: 87, isOptimized: false, unit: !0, variables: !2)
!116 = !DILocalVariable(name: "data", scope: !115, file: !8, line: 88, type: !4)
!117 = !DILocation(line: 88, column: 9, scope: !115)
!118 = !DILocation(line: 90, column: 10, scope: !115)
!119 = !DILocation(line: 91, column: 8, scope: !120)
!120 = distinct !DILexicalBlock(scope: !115, file: !8, line: 91, column: 8)
!121 = !DILocation(line: 91, column: 18, scope: !120)
!122 = !DILocation(line: 91, column: 8, scope: !115)
!123 = !DILocalVariable(name: "inputBuffer", scope: !124, file: !8, line: 94, type: !78)
!124 = distinct !DILexicalBlock(scope: !125, file: !8, line: 93, column: 9)
!125 = distinct !DILexicalBlock(scope: !120, file: !8, line: 92, column: 5)
!126 = !DILocation(line: 94, column: 18, scope: !124)
!127 = !DILocation(line: 96, column: 23, scope: !128)
!128 = distinct !DILexicalBlock(scope: !124, file: !8, line: 96, column: 17)
!129 = !DILocation(line: 96, column: 53, scope: !128)
!130 = !DILocation(line: 96, column: 17, scope: !128)
!131 = !DILocation(line: 96, column: 60, scope: !128)
!132 = !DILocation(line: 96, column: 17, scope: !124)
!133 = !DILocation(line: 99, column: 29, scope: !134)
!134 = distinct !DILexicalBlock(scope: !128, file: !8, line: 97, column: 13)
!135 = !DILocation(line: 99, column: 24, scope: !134)
!136 = !DILocation(line: 99, column: 22, scope: !134)
!137 = !DILocation(line: 100, column: 13, scope: !134)
!138 = !DILocation(line: 103, column: 17, scope: !139)
!139 = distinct !DILexicalBlock(scope: !128, file: !8, line: 102, column: 13)
!140 = !DILocation(line: 106, column: 5, scope: !125)
!141 = !DILocation(line: 107, column: 8, scope: !142)
!142 = distinct !DILexicalBlock(scope: !115, file: !8, line: 107, column: 8)
!143 = !DILocation(line: 107, column: 18, scope: !142)
!144 = !DILocation(line: 107, column: 8, scope: !115)
!145 = !DILocation(line: 110, column: 9, scope: !146)
!146 = distinct !DILexicalBlock(scope: !142, file: !8, line: 108, column: 5)
!147 = !DILocation(line: 111, column: 5, scope: !146)
!148 = !DILocation(line: 114, column: 12, scope: !149)
!149 = distinct !DILexicalBlock(scope: !150, file: !8, line: 114, column: 12)
!150 = distinct !DILexicalBlock(scope: !142, file: !8, line: 113, column: 5)
!151 = !DILocation(line: 114, column: 17, scope: !149)
!152 = !DILocation(line: 114, column: 12, scope: !150)
!153 = !DILocation(line: 117, column: 17, scope: !154)
!154 = distinct !DILexicalBlock(scope: !155, file: !8, line: 117, column: 17)
!155 = distinct !DILexicalBlock(scope: !149, file: !8, line: 115, column: 9)
!156 = !DILocation(line: 117, column: 22, scope: !154)
!157 = !DILocation(line: 117, column: 17, scope: !155)
!158 = !DILocalVariable(name: "result", scope: !159, file: !8, line: 119, type: !4)
!159 = distinct !DILexicalBlock(scope: !154, file: !8, line: 118, column: 13)
!160 = !DILocation(line: 119, column: 21, scope: !159)
!161 = !DILocation(line: 119, column: 30, scope: !159)
!162 = !DILocation(line: 119, column: 35, scope: !159)
!163 = !DILocation(line: 120, column: 30, scope: !159)
!164 = !DILocation(line: 120, column: 17, scope: !159)
!165 = !DILocation(line: 121, column: 13, scope: !159)
!166 = !DILocation(line: 124, column: 17, scope: !167)
!167 = distinct !DILexicalBlock(scope: !154, file: !8, line: 123, column: 13)
!168 = !DILocation(line: 126, column: 9, scope: !155)
!169 = !DILocation(line: 128, column: 1, scope: !115)
!170 = distinct !DISubprogram(name: "main", scope: !8, file: !8, line: 132, type: !171, isLocal: false, isDefinition: true, scopeLine: 132, isOptimized: false, unit: !0, variables: !2)
!171 = !DISubroutineType(types: !172)
!172 = !{!4}
!173 = !DILocation(line: 133, column: 5, scope: !170)
!174 = !DILocation(line: 134, column: 5, scope: !170)
!175 = !DILocation(line: 135, column: 5, scope: !170)
