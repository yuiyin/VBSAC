; ModuleID = './190_8.c'
source_filename = "./190_8.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@.str.1 = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1
@.str.2 = private unnamed_addr constant [5 x i8] c"%ld\0A\00", align 1
@.str.3 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@.str.4 = private unnamed_addr constant [54 x i8] c"data value is too large to perform arithmetic safely.\00", align 1

; Function Attrs: nounwind uwtable
define void @printHexCharLine(i8 signext %charHex) #0 !dbg !10 {
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
define void @bad8() #0 !dbg !56 {
entry:
  %data = alloca i8, align 1
  %result = alloca i8, align 1
  call void @llvm.dbg.declare(metadata i8* %data, metadata !59, metadata !15), !dbg !60
  store i8 32, i8* %data, align 1, !dbg !61
  %call = call i32 @staticReturnsTrue(), !dbg !62
  %tobool = icmp ne i32 %call, 0, !dbg !62
  br i1 %tobool, label %if.then, label %if.end7, !dbg !64

if.then:                                          ; preds = %entry
  %call1 = call i32 @rand() #4, !dbg !65
  %conv = trunc i32 %call1 to i8, !dbg !67
  store i8 %conv, i8* %data, align 1, !dbg !68
  %0 = load i8, i8* %data, align 1, !dbg !69
  %conv2 = sext i8 %0 to i32, !dbg !69
  %cmp = icmp slt i32 %conv2, 0, !dbg !71
  br i1 %cmp, label %if.then4, label %if.end, !dbg !72

if.then4:                                         ; preds = %if.then
  %1 = load i8, i8* %data, align 1, !dbg !73
  %conv5 = sext i8 %1 to i32, !dbg !73
  %sub = sub nsw i32 0, %conv5, !dbg !75
  %conv6 = trunc i32 %sub to i8, !dbg !75
  store i8 %conv6, i8* %data, align 1, !dbg !76
  br label %if.end, !dbg !77

if.end:                                           ; preds = %if.then4, %if.then
  br label %if.end7, !dbg !78

if.end7:                                          ; preds = %if.end, %entry
  %call8 = call i32 @staticReturnsTrue(), !dbg !79
  %tobool9 = icmp ne i32 %call8, 0, !dbg !79
  br i1 %tobool9, label %if.then10, label %if.end18, !dbg !81

if.then10:                                        ; preds = %if.end7
  %2 = load i8, i8* %data, align 1, !dbg !82
  %conv11 = sext i8 %2 to i32, !dbg !82
  %cmp12 = icmp sgt i32 %conv11, 0, !dbg !85
  br i1 %cmp12, label %if.then14, label %if.end17, !dbg !86

if.then14:                                        ; preds = %if.then10
  call void @llvm.dbg.declare(metadata i8* %result, metadata !87, metadata !15), !dbg !89
  %3 = load i8, i8* %data, align 1, !dbg !90
  %conv15 = sext i8 %3 to i32, !dbg !90
  %mul = mul nsw i32 %conv15, 2, !dbg !91
  %conv16 = trunc i32 %mul to i8, !dbg !90
  store i8 %conv16, i8* %result, align 1, !dbg !89
  %4 = load i8, i8* %result, align 1, !dbg !92
  call void @printHexCharLine(i8 signext %4), !dbg !93
  br label %if.end17, !dbg !94

if.end17:                                         ; preds = %if.then14, %if.then10
  br label %if.end18, !dbg !95

if.end18:                                         ; preds = %if.end17, %if.end7
  ret void, !dbg !96
}

; Function Attrs: nounwind
declare i32 @rand() #3

; Function Attrs: nounwind uwtable
define void @good8() #0 !dbg !97 {
entry:
  %data = alloca i8, align 1
  %result = alloca i8, align 1
  call void @llvm.dbg.declare(metadata i8* %data, metadata !98, metadata !15), !dbg !99
  store i8 32, i8* %data, align 1, !dbg !100
  %call = call i32 @staticReturnsTrue(), !dbg !101
  %tobool = icmp ne i32 %call, 0, !dbg !101
  br i1 %tobool, label %if.then, label %if.end7, !dbg !103

if.then:                                          ; preds = %entry
  %call1 = call i32 @rand() #4, !dbg !104
  %conv = trunc i32 %call1 to i8, !dbg !106
  store i8 %conv, i8* %data, align 1, !dbg !107
  %0 = load i8, i8* %data, align 1, !dbg !108
  %conv2 = sext i8 %0 to i32, !dbg !108
  %cmp = icmp slt i32 %conv2, 0, !dbg !110
  br i1 %cmp, label %if.then4, label %if.end, !dbg !111

if.then4:                                         ; preds = %if.then
  %1 = load i8, i8* %data, align 1, !dbg !112
  %conv5 = sext i8 %1 to i32, !dbg !112
  %sub = sub nsw i32 0, %conv5, !dbg !114
  %conv6 = trunc i32 %sub to i8, !dbg !114
  store i8 %conv6, i8* %data, align 1, !dbg !115
  br label %if.end, !dbg !116

if.end:                                           ; preds = %if.then4, %if.then
  br label %if.end7, !dbg !117

if.end7:                                          ; preds = %if.end, %entry
  %call8 = call i32 @staticReturnsFalse(), !dbg !118
  %tobool9 = icmp ne i32 %call8, 0, !dbg !118
  br i1 %tobool9, label %if.then10, label %if.else, !dbg !120

if.then10:                                        ; preds = %if.end7
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.3, i32 0, i32 0)), !dbg !121
  br label %if.end24, !dbg !123

if.else:                                          ; preds = %if.end7
  %2 = load i8, i8* %data, align 1, !dbg !124
  %conv11 = sext i8 %2 to i32, !dbg !124
  %cmp12 = icmp sgt i32 %conv11, 0, !dbg !127
  br i1 %cmp12, label %if.then14, label %if.end23, !dbg !128

if.then14:                                        ; preds = %if.else
  %3 = load i8, i8* %data, align 1, !dbg !129
  %conv15 = sext i8 %3 to i32, !dbg !129
  %cmp16 = icmp slt i32 %conv15, 63, !dbg !132
  br i1 %cmp16, label %if.then18, label %if.else21, !dbg !133

if.then18:                                        ; preds = %if.then14
  call void @llvm.dbg.declare(metadata i8* %result, metadata !134, metadata !15), !dbg !136
  %4 = load i8, i8* %data, align 1, !dbg !137
  %conv19 = sext i8 %4 to i32, !dbg !137
  %mul = mul nsw i32 %conv19, 2, !dbg !138
  %conv20 = trunc i32 %mul to i8, !dbg !137
  store i8 %conv20, i8* %result, align 1, !dbg !136
  %5 = load i8, i8* %result, align 1, !dbg !139
  call void @printHexCharLine(i8 signext %5), !dbg !140
  br label %if.end22, !dbg !141

if.else21:                                        ; preds = %if.then14
  call void @printLine(i8* getelementptr inbounds ([54 x i8], [54 x i8]* @.str.4, i32 0, i32 0)), !dbg !142
  br label %if.end22

if.end22:                                         ; preds = %if.else21, %if.then18
  br label %if.end23, !dbg !144

if.end23:                                         ; preds = %if.end22, %if.else
  br label %if.end24

if.end24:                                         ; preds = %if.end23, %if.then10
  ret void, !dbg !145
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !146 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @good8(), !dbg !149
  call void @bad8(), !dbg !150
  ret i32 1, !dbg !151
}

; Function Attrs: nounwind uwtable
define internal i32 @staticReturnsTrue() #0 !dbg !152 {
entry:
  ret i32 1, !dbg !153
}

; Function Attrs: nounwind uwtable
define internal i32 @staticReturnsFalse() #0 !dbg !154 {
entry:
  ret i32 0, !dbg !155
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8}
!llvm.ident = !{!9}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (tags/RELEASE_390/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3)
!1 = !DIFile(filename: "190_8.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/190")
!2 = !{}
!3 = !{!4, !5, !6}
!4 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64, align: 64)
!6 = !DIBasicType(name: "char", size: 8, align: 8, encoding: DW_ATE_signed_char)
!7 = !{i32 2, !"Dwarf Version", i32 4}
!8 = !{i32 2, !"Debug Info Version", i32 3}
!9 = !{!"clang version 3.9.0 (tags/RELEASE_390/final)"}
!10 = distinct !DISubprogram(name: "printHexCharLine", scope: !11, file: !11, line: 10, type: !12, isLocal: false, isDefinition: true, scopeLine: 11, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!11 = !DIFile(filename: "./190_8.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/190")
!12 = !DISubroutineType(types: !13)
!13 = !{null, !6}
!14 = !DILocalVariable(name: "charHex", arg: 1, scope: !10, file: !11, line: 10, type: !6)
!15 = !DIExpression()
!16 = !DILocation(line: 10, column: 29, scope: !10)
!17 = !DILocation(line: 12, column: 25, scope: !10)
!18 = !DILocation(line: 12, column: 20, scope: !10)
!19 = !DILocation(line: 12, column: 5, scope: !10)
!20 = !DILocation(line: 13, column: 1, scope: !10)
!21 = distinct !DISubprogram(name: "printLine", scope: !11, file: !11, line: 15, type: !22, isLocal: false, isDefinition: true, scopeLine: 16, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!22 = !DISubroutineType(types: !23)
!23 = !{null, !24}
!24 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !25, size: 64, align: 64)
!25 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !6)
!26 = !DILocalVariable(name: "line", arg: 1, scope: !21, file: !11, line: 15, type: !24)
!27 = !DILocation(line: 15, column: 30, scope: !21)
!28 = !DILocation(line: 17, column: 8, scope: !29)
!29 = distinct !DILexicalBlock(scope: !21, file: !11, line: 17, column: 8)
!30 = !DILocation(line: 17, column: 13, scope: !29)
!31 = !DILocation(line: 17, column: 8, scope: !21)
!32 = !DILocation(line: 19, column: 24, scope: !33)
!33 = distinct !DILexicalBlock(scope: !29, file: !11, line: 18, column: 5)
!34 = !DILocation(line: 19, column: 9, scope: !33)
!35 = !DILocation(line: 20, column: 5, scope: !33)
!36 = !DILocation(line: 21, column: 1, scope: !21)
!37 = distinct !DISubprogram(name: "printIntLine", scope: !11, file: !11, line: 23, type: !38, isLocal: false, isDefinition: true, scopeLine: 24, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!38 = !DISubroutineType(types: !39)
!39 = !{null, !4}
!40 = !DILocalVariable(name: "intNumber", arg: 1, scope: !37, file: !11, line: 23, type: !4)
!41 = !DILocation(line: 23, column: 24, scope: !37)
!42 = !DILocation(line: 25, column: 20, scope: !37)
!43 = !DILocation(line: 25, column: 5, scope: !37)
!44 = !DILocation(line: 26, column: 1, scope: !37)
!45 = distinct !DISubprogram(name: "printLongLine", scope: !11, file: !11, line: 28, type: !46, isLocal: false, isDefinition: true, scopeLine: 29, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!46 = !DISubroutineType(types: !47)
!47 = !{null, !48}
!48 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !49, line: 197, baseType: !50)
!49 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/sys/types.h", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/190")
!50 = !DIBasicType(name: "long int", size: 64, align: 64, encoding: DW_ATE_signed)
!51 = !DILocalVariable(name: "longIntNumber", arg: 1, scope: !45, file: !11, line: 28, type: !48)
!52 = !DILocation(line: 28, column: 29, scope: !45)
!53 = !DILocation(line: 30, column: 21, scope: !45)
!54 = !DILocation(line: 30, column: 5, scope: !45)
!55 = !DILocation(line: 31, column: 1, scope: !45)
!56 = distinct !DISubprogram(name: "bad8", scope: !11, file: !11, line: 44, type: !57, isLocal: false, isDefinition: true, scopeLine: 45, isOptimized: false, unit: !0, variables: !2)
!57 = !DISubroutineType(types: !58)
!58 = !{null}
!59 = !DILocalVariable(name: "data", scope: !56, file: !11, line: 46, type: !6)
!60 = !DILocation(line: 46, column: 10, scope: !56)
!61 = !DILocation(line: 47, column: 10, scope: !56)
!62 = !DILocation(line: 48, column: 8, scope: !63)
!63 = distinct !DILexicalBlock(scope: !56, file: !11, line: 48, column: 8)
!64 = !DILocation(line: 48, column: 8, scope: !56)
!65 = !DILocation(line: 51, column: 22, scope: !66)
!66 = distinct !DILexicalBlock(scope: !63, file: !11, line: 49, column: 5)
!67 = !DILocation(line: 51, column: 16, scope: !66)
!68 = !DILocation(line: 51, column: 14, scope: !66)
!69 = !DILocation(line: 52, column: 13, scope: !70)
!70 = distinct !DILexicalBlock(scope: !66, file: !11, line: 52, column: 13)
!71 = !DILocation(line: 52, column: 18, scope: !70)
!72 = !DILocation(line: 52, column: 13, scope: !66)
!73 = !DILocation(line: 54, column: 21, scope: !74)
!74 = distinct !DILexicalBlock(scope: !70, file: !11, line: 53, column: 9)
!75 = !DILocation(line: 54, column: 20, scope: !74)
!76 = !DILocation(line: 54, column: 18, scope: !74)
!77 = !DILocation(line: 55, column: 9, scope: !74)
!78 = !DILocation(line: 56, column: 5, scope: !66)
!79 = !DILocation(line: 57, column: 8, scope: !80)
!80 = distinct !DILexicalBlock(scope: !56, file: !11, line: 57, column: 8)
!81 = !DILocation(line: 57, column: 8, scope: !56)
!82 = !DILocation(line: 59, column: 12, scope: !83)
!83 = distinct !DILexicalBlock(scope: !84, file: !11, line: 59, column: 12)
!84 = distinct !DILexicalBlock(scope: !80, file: !11, line: 58, column: 5)
!85 = !DILocation(line: 59, column: 17, scope: !83)
!86 = !DILocation(line: 59, column: 12, scope: !84)
!87 = !DILocalVariable(name: "result", scope: !88, file: !11, line: 62, type: !6)
!88 = distinct !DILexicalBlock(scope: !83, file: !11, line: 60, column: 9)
!89 = !DILocation(line: 62, column: 18, scope: !88)
!90 = !DILocation(line: 62, column: 27, scope: !88)
!91 = !DILocation(line: 62, column: 32, scope: !88)
!92 = !DILocation(line: 63, column: 30, scope: !88)
!93 = !DILocation(line: 63, column: 13, scope: !88)
!94 = !DILocation(line: 64, column: 9, scope: !88)
!95 = !DILocation(line: 65, column: 5, scope: !84)
!96 = !DILocation(line: 66, column: 1, scope: !56)
!97 = distinct !DISubprogram(name: "good8", scope: !11, file: !11, line: 68, type: !57, isLocal: false, isDefinition: true, scopeLine: 69, isOptimized: false, unit: !0, variables: !2)
!98 = !DILocalVariable(name: "data", scope: !97, file: !11, line: 70, type: !6)
!99 = !DILocation(line: 70, column: 10, scope: !97)
!100 = !DILocation(line: 71, column: 10, scope: !97)
!101 = !DILocation(line: 72, column: 8, scope: !102)
!102 = distinct !DILexicalBlock(scope: !97, file: !11, line: 72, column: 8)
!103 = !DILocation(line: 72, column: 8, scope: !97)
!104 = !DILocation(line: 75, column: 22, scope: !105)
!105 = distinct !DILexicalBlock(scope: !102, file: !11, line: 73, column: 5)
!106 = !DILocation(line: 75, column: 16, scope: !105)
!107 = !DILocation(line: 75, column: 14, scope: !105)
!108 = !DILocation(line: 76, column: 13, scope: !109)
!109 = distinct !DILexicalBlock(scope: !105, file: !11, line: 76, column: 13)
!110 = !DILocation(line: 76, column: 18, scope: !109)
!111 = !DILocation(line: 76, column: 13, scope: !105)
!112 = !DILocation(line: 78, column: 21, scope: !113)
!113 = distinct !DILexicalBlock(scope: !109, file: !11, line: 77, column: 9)
!114 = !DILocation(line: 78, column: 20, scope: !113)
!115 = !DILocation(line: 78, column: 18, scope: !113)
!116 = !DILocation(line: 79, column: 9, scope: !113)
!117 = !DILocation(line: 80, column: 5, scope: !105)
!118 = !DILocation(line: 81, column: 8, scope: !119)
!119 = distinct !DILexicalBlock(scope: !97, file: !11, line: 81, column: 8)
!120 = !DILocation(line: 81, column: 8, scope: !97)
!121 = !DILocation(line: 84, column: 9, scope: !122)
!122 = distinct !DILexicalBlock(scope: !119, file: !11, line: 82, column: 5)
!123 = !DILocation(line: 85, column: 5, scope: !122)
!124 = !DILocation(line: 88, column: 12, scope: !125)
!125 = distinct !DILexicalBlock(scope: !126, file: !11, line: 88, column: 12)
!126 = distinct !DILexicalBlock(scope: !119, file: !11, line: 87, column: 5)
!127 = !DILocation(line: 88, column: 17, scope: !125)
!128 = !DILocation(line: 88, column: 12, scope: !126)
!129 = !DILocation(line: 91, column: 17, scope: !130)
!130 = distinct !DILexicalBlock(scope: !131, file: !11, line: 91, column: 17)
!131 = distinct !DILexicalBlock(scope: !125, file: !11, line: 89, column: 9)
!132 = !DILocation(line: 91, column: 22, scope: !130)
!133 = !DILocation(line: 91, column: 17, scope: !131)
!134 = !DILocalVariable(name: "result", scope: !135, file: !11, line: 93, type: !6)
!135 = distinct !DILexicalBlock(scope: !130, file: !11, line: 92, column: 13)
!136 = !DILocation(line: 93, column: 22, scope: !135)
!137 = !DILocation(line: 93, column: 31, scope: !135)
!138 = !DILocation(line: 93, column: 36, scope: !135)
!139 = !DILocation(line: 94, column: 34, scope: !135)
!140 = !DILocation(line: 94, column: 17, scope: !135)
!141 = !DILocation(line: 95, column: 13, scope: !135)
!142 = !DILocation(line: 98, column: 17, scope: !143)
!143 = distinct !DILexicalBlock(scope: !130, file: !11, line: 97, column: 13)
!144 = !DILocation(line: 100, column: 9, scope: !131)
!145 = !DILocation(line: 102, column: 1, scope: !97)
!146 = distinct !DISubprogram(name: "main", scope: !11, file: !11, line: 105, type: !147, isLocal: false, isDefinition: true, scopeLine: 105, isOptimized: false, unit: !0, variables: !2)
!147 = !DISubroutineType(types: !148)
!148 = !{!4}
!149 = !DILocation(line: 106, column: 5, scope: !146)
!150 = !DILocation(line: 107, column: 5, scope: !146)
!151 = !DILocation(line: 108, column: 5, scope: !146)
!152 = distinct !DISubprogram(name: "staticReturnsTrue", scope: !11, file: !11, line: 34, type: !147, isLocal: true, isDefinition: true, scopeLine: 35, isOptimized: false, unit: !0, variables: !2)
!153 = !DILocation(line: 36, column: 5, scope: !152)
!154 = distinct !DISubprogram(name: "staticReturnsFalse", scope: !11, file: !11, line: 39, type: !147, isLocal: true, isDefinition: true, scopeLine: 40, isOptimized: false, unit: !0, variables: !2)
!155 = !DILocation(line: 41, column: 5, scope: !154)
