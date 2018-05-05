; ModuleID = './191_49.c'
source_filename = "./191_49.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@.str.1 = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1
@.str.2 = private unnamed_addr constant [5 x i8] c"%ld\0A\00", align 1
@.str.3 = private unnamed_addr constant [4 x i8] c"%u\0A\00", align 1
@stdin = external global %struct._IO_FILE*, align 8
@.str.4 = private unnamed_addr constant [4 x i8] c"%hd\00", align 1
@.str.5 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@.str.6 = private unnamed_addr constant [51 x i8] c"data value is too small to perform multiplication.\00", align 1

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
define void @bad49() #0 !dbg !65 {
entry:
  %data = alloca i16, align 2
  %result = alloca i16, align 2
  call void @llvm.dbg.declare(metadata i16* %data, metadata !68, metadata !15), !dbg !70
  store i16 0, i16* %data, align 2, !dbg !71
  %call = call i32 @staticReturnsTrue(), !dbg !72
  %tobool = icmp ne i32 %call, 0, !dbg !72
  br i1 %tobool, label %if.then, label %if.end, !dbg !74

if.then:                                          ; preds = %entry
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !75
  %call1 = call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* %0, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.4, i32 0, i32 0), i16* %data), !dbg !77
  br label %if.end, !dbg !78

if.end:                                           ; preds = %if.then, %entry
  %call2 = call i32 @staticReturnsTrue(), !dbg !79
  %tobool3 = icmp ne i32 %call2, 0, !dbg !79
  br i1 %tobool3, label %if.then4, label %if.end11, !dbg !81

if.then4:                                         ; preds = %if.end
  %1 = load i16, i16* %data, align 2, !dbg !82
  %conv = sext i16 %1 to i32, !dbg !82
  %cmp = icmp slt i32 %conv, 0, !dbg !85
  br i1 %cmp, label %if.then6, label %if.end10, !dbg !86

if.then6:                                         ; preds = %if.then4
  call void @llvm.dbg.declare(metadata i16* %result, metadata !87, metadata !15), !dbg !89
  %2 = load i16, i16* %data, align 2, !dbg !90
  %conv7 = sext i16 %2 to i32, !dbg !90
  %mul = mul nsw i32 %conv7, 2, !dbg !91
  %conv8 = trunc i32 %mul to i16, !dbg !90
  store i16 %conv8, i16* %result, align 2, !dbg !89
  %3 = load i16, i16* %result, align 2, !dbg !92
  %conv9 = sext i16 %3 to i32, !dbg !92
  call void @printIntLine(i32 %conv9), !dbg !93
  br label %if.end10, !dbg !94

if.end10:                                         ; preds = %if.then6, %if.then4
  br label %if.end11, !dbg !95

if.end11:                                         ; preds = %if.end10, %if.end
  ret void, !dbg !96
}

declare i32 @__isoc99_fscanf(%struct._IO_FILE*, i8*, ...) #2

; Function Attrs: nounwind uwtable
define void @good49() #0 !dbg !97 {
entry:
  %data = alloca i16, align 2
  %result = alloca i16, align 2
  call void @llvm.dbg.declare(metadata i16* %data, metadata !98, metadata !15), !dbg !99
  store i16 0, i16* %data, align 2, !dbg !100
  %call = call i32 @staticReturnsTrue(), !dbg !101
  %tobool = icmp ne i32 %call, 0, !dbg !101
  br i1 %tobool, label %if.then, label %if.end, !dbg !103

if.then:                                          ; preds = %entry
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !104
  %call1 = call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* %0, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.4, i32 0, i32 0), i16* %data), !dbg !106
  br label %if.end, !dbg !107

if.end:                                           ; preds = %if.then, %entry
  %call2 = call i32 @staticReturnsFalse(), !dbg !108
  %tobool3 = icmp ne i32 %call2, 0, !dbg !108
  br i1 %tobool3, label %if.then4, label %if.else, !dbg !110

if.then4:                                         ; preds = %if.end
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.5, i32 0, i32 0)), !dbg !111
  br label %if.end17, !dbg !113

if.else:                                          ; preds = %if.end
  %1 = load i16, i16* %data, align 2, !dbg !114
  %conv = sext i16 %1 to i32, !dbg !114
  %cmp = icmp slt i32 %conv, 0, !dbg !117
  br i1 %cmp, label %if.then6, label %if.end16, !dbg !118

if.then6:                                         ; preds = %if.else
  %2 = load i16, i16* %data, align 2, !dbg !119
  %conv7 = sext i16 %2 to i32, !dbg !119
  %cmp8 = icmp sgt i32 %conv7, -16384, !dbg !122
  br i1 %cmp8, label %if.then10, label %if.else14, !dbg !123

if.then10:                                        ; preds = %if.then6
  call void @llvm.dbg.declare(metadata i16* %result, metadata !124, metadata !15), !dbg !126
  %3 = load i16, i16* %data, align 2, !dbg !127
  %conv11 = sext i16 %3 to i32, !dbg !127
  %mul = mul nsw i32 %conv11, 2, !dbg !128
  %conv12 = trunc i32 %mul to i16, !dbg !127
  store i16 %conv12, i16* %result, align 2, !dbg !126
  %4 = load i16, i16* %result, align 2, !dbg !129
  %conv13 = sext i16 %4 to i32, !dbg !129
  call void @printIntLine(i32 %conv13), !dbg !130
  br label %if.end15, !dbg !131

if.else14:                                        ; preds = %if.then6
  call void @printLine(i8* getelementptr inbounds ([51 x i8], [51 x i8]* @.str.6, i32 0, i32 0)), !dbg !132
  br label %if.end15

if.end15:                                         ; preds = %if.else14, %if.then10
  br label %if.end16, !dbg !134

if.end16:                                         ; preds = %if.end15, %if.else
  br label %if.end17

if.end17:                                         ; preds = %if.end16, %if.then4
  ret void, !dbg !135
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !136 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @good49(), !dbg !139
  call void @bad49(), !dbg !140
  ret i32 1, !dbg !141
}

; Function Attrs: nounwind uwtable
define internal i32 @staticReturnsTrue() #0 !dbg !142 {
entry:
  ret i32 1, !dbg !143
}

; Function Attrs: nounwind uwtable
define internal i32 @staticReturnsFalse() #0 !dbg !144 {
entry:
  ret i32 0, !dbg !145
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (tags/RELEASE_390/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3)
!1 = !DIFile(filename: "191_49.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/191")
!2 = !{}
!3 = !{!4, !5}
!4 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64, align: 64)
!6 = !{i32 2, !"Dwarf Version", i32 4}
!7 = !{i32 2, !"Debug Info Version", i32 3}
!8 = !{!"clang version 3.9.0 (tags/RELEASE_390/final)"}
!9 = distinct !DISubprogram(name: "printHexCharLine", scope: !10, file: !10, line: 10, type: !11, isLocal: false, isDefinition: true, scopeLine: 11, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!10 = !DIFile(filename: "./191_49.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/191")
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
!65 = distinct !DISubprogram(name: "bad49", scope: !10, file: !10, line: 51, type: !66, isLocal: false, isDefinition: true, scopeLine: 52, isOptimized: false, unit: !0, variables: !2)
!66 = !DISubroutineType(types: !67)
!67 = !{null}
!68 = !DILocalVariable(name: "data", scope: !65, file: !10, line: 53, type: !69)
!69 = !DIBasicType(name: "short", size: 16, align: 16, encoding: DW_ATE_signed)
!70 = !DILocation(line: 53, column: 11, scope: !65)
!71 = !DILocation(line: 54, column: 10, scope: !65)
!72 = !DILocation(line: 55, column: 8, scope: !73)
!73 = distinct !DILexicalBlock(scope: !65, file: !10, line: 55, column: 8)
!74 = !DILocation(line: 55, column: 8, scope: !65)
!75 = !DILocation(line: 58, column: 17, scope: !76)
!76 = distinct !DILexicalBlock(scope: !73, file: !10, line: 56, column: 5)
!77 = !DILocation(line: 58, column: 9, scope: !76)
!78 = !DILocation(line: 59, column: 5, scope: !76)
!79 = !DILocation(line: 60, column: 8, scope: !80)
!80 = distinct !DILexicalBlock(scope: !65, file: !10, line: 60, column: 8)
!81 = !DILocation(line: 60, column: 8, scope: !65)
!82 = !DILocation(line: 62, column: 12, scope: !83)
!83 = distinct !DILexicalBlock(scope: !84, file: !10, line: 62, column: 12)
!84 = distinct !DILexicalBlock(scope: !80, file: !10, line: 61, column: 5)
!85 = !DILocation(line: 62, column: 17, scope: !83)
!86 = !DILocation(line: 62, column: 12, scope: !84)
!87 = !DILocalVariable(name: "result", scope: !88, file: !10, line: 65, type: !69)
!88 = distinct !DILexicalBlock(scope: !83, file: !10, line: 63, column: 9)
!89 = !DILocation(line: 65, column: 19, scope: !88)
!90 = !DILocation(line: 65, column: 28, scope: !88)
!91 = !DILocation(line: 65, column: 33, scope: !88)
!92 = !DILocation(line: 66, column: 26, scope: !88)
!93 = !DILocation(line: 66, column: 13, scope: !88)
!94 = !DILocation(line: 67, column: 9, scope: !88)
!95 = !DILocation(line: 68, column: 5, scope: !84)
!96 = !DILocation(line: 69, column: 1, scope: !65)
!97 = distinct !DISubprogram(name: "good49", scope: !10, file: !10, line: 75, type: !66, isLocal: false, isDefinition: true, scopeLine: 76, isOptimized: false, unit: !0, variables: !2)
!98 = !DILocalVariable(name: "data", scope: !97, file: !10, line: 77, type: !69)
!99 = !DILocation(line: 77, column: 11, scope: !97)
!100 = !DILocation(line: 78, column: 10, scope: !97)
!101 = !DILocation(line: 79, column: 8, scope: !102)
!102 = distinct !DILexicalBlock(scope: !97, file: !10, line: 79, column: 8)
!103 = !DILocation(line: 79, column: 8, scope: !97)
!104 = !DILocation(line: 82, column: 17, scope: !105)
!105 = distinct !DILexicalBlock(scope: !102, file: !10, line: 80, column: 5)
!106 = !DILocation(line: 82, column: 9, scope: !105)
!107 = !DILocation(line: 83, column: 5, scope: !105)
!108 = !DILocation(line: 84, column: 8, scope: !109)
!109 = distinct !DILexicalBlock(scope: !97, file: !10, line: 84, column: 8)
!110 = !DILocation(line: 84, column: 8, scope: !97)
!111 = !DILocation(line: 87, column: 9, scope: !112)
!112 = distinct !DILexicalBlock(scope: !109, file: !10, line: 85, column: 5)
!113 = !DILocation(line: 88, column: 5, scope: !112)
!114 = !DILocation(line: 91, column: 12, scope: !115)
!115 = distinct !DILexicalBlock(scope: !116, file: !10, line: 91, column: 12)
!116 = distinct !DILexicalBlock(scope: !109, file: !10, line: 90, column: 5)
!117 = !DILocation(line: 91, column: 17, scope: !115)
!118 = !DILocation(line: 91, column: 12, scope: !116)
!119 = !DILocation(line: 94, column: 17, scope: !120)
!120 = distinct !DILexicalBlock(scope: !121, file: !10, line: 94, column: 17)
!121 = distinct !DILexicalBlock(scope: !115, file: !10, line: 92, column: 9)
!122 = !DILocation(line: 94, column: 22, scope: !120)
!123 = !DILocation(line: 94, column: 17, scope: !121)
!124 = !DILocalVariable(name: "result", scope: !125, file: !10, line: 96, type: !69)
!125 = distinct !DILexicalBlock(scope: !120, file: !10, line: 95, column: 13)
!126 = !DILocation(line: 96, column: 23, scope: !125)
!127 = !DILocation(line: 96, column: 32, scope: !125)
!128 = !DILocation(line: 96, column: 37, scope: !125)
!129 = !DILocation(line: 97, column: 30, scope: !125)
!130 = !DILocation(line: 97, column: 17, scope: !125)
!131 = !DILocation(line: 98, column: 13, scope: !125)
!132 = !DILocation(line: 101, column: 17, scope: !133)
!133 = distinct !DILexicalBlock(scope: !120, file: !10, line: 100, column: 13)
!134 = !DILocation(line: 103, column: 9, scope: !121)
!135 = !DILocation(line: 105, column: 1, scope: !97)
!136 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 112, type: !137, isLocal: false, isDefinition: true, scopeLine: 112, isOptimized: false, unit: !0, variables: !2)
!137 = !DISubroutineType(types: !138)
!138 = !{!4}
!139 = !DILocation(line: 113, column: 2, scope: !136)
!140 = !DILocation(line: 114, column: 5, scope: !136)
!141 = !DILocation(line: 115, column: 5, scope: !136)
!142 = distinct !DISubprogram(name: "staticReturnsTrue", scope: !10, file: !10, line: 39, type: !137, isLocal: true, isDefinition: true, scopeLine: 40, isOptimized: false, unit: !0, variables: !2)
!143 = !DILocation(line: 41, column: 5, scope: !142)
!144 = distinct !DISubprogram(name: "staticReturnsFalse", scope: !10, file: !10, line: 44, type: !137, isLocal: true, isDefinition: true, scopeLine: 45, isOptimized: false, unit: !0, variables: !2)
!145 = !DILocation(line: 46, column: 5, scope: !144)
