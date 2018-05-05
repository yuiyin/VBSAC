; ModuleID = './369_42.c'
source_filename = "./369_42.c"
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
@.str = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1
@.str.1 = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@stdin = external global %struct._IO_FILE*, align 8
@.str.2 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.3 = private unnamed_addr constant [38 x i8] c"This would result in a divide by zero\00", align 1

; Function Attrs: nounwind uwtable
define i32 @globalReturnsTrue() #0 !dbg !18 {
entry:
  ret i32 1, !dbg !21
}

; Function Attrs: nounwind uwtable
define i32 @globalReturnsFalse() #0 !dbg !22 {
entry:
  ret i32 0, !dbg !23
}

; Function Attrs: nounwind uwtable
define i32 @globalReturnsTrueOrFalse() #0 !dbg !24 {
entry:
  %call = call i32 @rand() #4, !dbg !25
  %rem = srem i32 %call, 2, !dbg !26
  ret i32 %rem, !dbg !27
}

; Function Attrs: nounwind
declare i32 @rand() #1

; Function Attrs: nounwind uwtable
define void @printLine(i8* %line) #0 !dbg !28 {
entry:
  %line.addr = alloca i8*, align 8
  store i8* %line, i8** %line.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %line.addr, metadata !34, metadata !35), !dbg !36
  %0 = load i8*, i8** %line.addr, align 8, !dbg !37
  %cmp = icmp ne i8* %0, null, !dbg !39
  br i1 %cmp, label %if.then, label %if.end, !dbg !40

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** %line.addr, align 8, !dbg !41
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), i8* %1), !dbg !43
  br label %if.end, !dbg !44

if.end:                                           ; preds = %if.then, %entry
  ret void, !dbg !45
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #2

declare i32 @printf(i8*, ...) #3

; Function Attrs: nounwind uwtable
define void @printIntLine(i32 %intNumber) #0 !dbg !46 {
entry:
  %intNumber.addr = alloca i32, align 4
  store i32 %intNumber, i32* %intNumber.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %intNumber.addr, metadata !49, metadata !35), !dbg !50
  %0 = load i32, i32* %intNumber.addr, align 4, !dbg !51
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i32 0, i32 0), i32 %0), !dbg !52
  ret void, !dbg !53
}

; Function Attrs: nounwind uwtable
define void @bad42() #0 !dbg !54 {
entry:
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %data = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %i, metadata !57, metadata !35), !dbg !58
  call void @llvm.dbg.declare(metadata i32* %j, metadata !59, metadata !35), !dbg !60
  call void @llvm.dbg.declare(metadata i32* %data, metadata !61, metadata !35), !dbg !62
  store i32 -1, i32* %data, align 4, !dbg !63
  store i32 0, i32* %i, align 4, !dbg !64
  br label %for.cond, !dbg !66

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !67
  %cmp = icmp slt i32 %0, 1, !dbg !70
  br i1 %cmp, label %for.body, label %for.end, !dbg !71

for.body:                                         ; preds = %for.cond
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !72
  %call = call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.2, i32 0, i32 0), i32* %data), !dbg !74
  br label %for.inc, !dbg !75

for.inc:                                          ; preds = %for.body
  %2 = load i32, i32* %i, align 4, !dbg !76
  %inc = add nsw i32 %2, 1, !dbg !76
  store i32 %inc, i32* %i, align 4, !dbg !76
  br label %for.cond, !dbg !78, !llvm.loop !79

for.end:                                          ; preds = %for.cond
  store i32 0, i32* %j, align 4, !dbg !81
  br label %for.cond1, !dbg !83

for.cond1:                                        ; preds = %for.inc4, %for.end
  %3 = load i32, i32* %j, align 4, !dbg !84
  %cmp2 = icmp slt i32 %3, 1, !dbg !87
  br i1 %cmp2, label %for.body3, label %for.end6, !dbg !88

for.body3:                                        ; preds = %for.cond1
  %4 = load i32, i32* %data, align 4, !dbg !89
  %rem = srem i32 100, %4, !dbg !91
  call void @printIntLine(i32 %rem), !dbg !92
  br label %for.inc4, !dbg !93

for.inc4:                                         ; preds = %for.body3
  %5 = load i32, i32* %j, align 4, !dbg !94
  %inc5 = add nsw i32 %5, 1, !dbg !94
  store i32 %inc5, i32* %j, align 4, !dbg !94
  br label %for.cond1, !dbg !96, !llvm.loop !97

for.end6:                                         ; preds = %for.cond1
  ret void, !dbg !99
}

declare i32 @__isoc99_fscanf(%struct._IO_FILE*, i8*, ...) #3

; Function Attrs: nounwind uwtable
define void @good42() #0 !dbg !100 {
entry:
  %i = alloca i32, align 4
  %k = alloca i32, align 4
  %data = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %i, metadata !101, metadata !35), !dbg !102
  call void @llvm.dbg.declare(metadata i32* %k, metadata !103, metadata !35), !dbg !104
  call void @llvm.dbg.declare(metadata i32* %data, metadata !105, metadata !35), !dbg !106
  store i32 -1, i32* %data, align 4, !dbg !107
  store i32 0, i32* %i, align 4, !dbg !108
  br label %for.cond, !dbg !110

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !111
  %cmp = icmp slt i32 %0, 1, !dbg !114
  br i1 %cmp, label %for.body, label %for.end, !dbg !115

for.body:                                         ; preds = %for.cond
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !116
  %call = call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.2, i32 0, i32 0), i32* %data), !dbg !118
  br label %for.inc, !dbg !119

for.inc:                                          ; preds = %for.body
  %2 = load i32, i32* %i, align 4, !dbg !120
  %inc = add nsw i32 %2, 1, !dbg !120
  store i32 %inc, i32* %i, align 4, !dbg !120
  br label %for.cond, !dbg !122, !llvm.loop !123

for.end:                                          ; preds = %for.cond
  store i32 0, i32* %k, align 4, !dbg !125
  br label %for.cond1, !dbg !127

for.cond1:                                        ; preds = %for.inc5, %for.end
  %3 = load i32, i32* %k, align 4, !dbg !128
  %cmp2 = icmp slt i32 %3, 1, !dbg !131
  br i1 %cmp2, label %for.body3, label %for.end7, !dbg !132

for.body3:                                        ; preds = %for.cond1
  %4 = load i32, i32* %data, align 4, !dbg !133
  %cmp4 = icmp ne i32 %4, 0, !dbg !136
  br i1 %cmp4, label %if.then, label %if.else, !dbg !137

if.then:                                          ; preds = %for.body3
  %5 = load i32, i32* %data, align 4, !dbg !138
  %rem = srem i32 100, %5, !dbg !140
  call void @printIntLine(i32 %rem), !dbg !141
  br label %if.end, !dbg !142

if.else:                                          ; preds = %for.body3
  call void @printLine(i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.str.3, i32 0, i32 0)), !dbg !143
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  br label %for.inc5, !dbg !145

for.inc5:                                         ; preds = %if.end
  %6 = load i32, i32* %k, align 4, !dbg !146
  %inc6 = add nsw i32 %6, 1, !dbg !146
  store i32 %inc6, i32* %k, align 4, !dbg !146
  br label %for.cond1, !dbg !148, !llvm.loop !149

for.end7:                                         ; preds = %for.cond1
  ret void, !dbg !151
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !152 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @good42(), !dbg !153
  call void @bad42(), !dbg !154
  ret i32 1, !dbg !155
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone }
attributes #3 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!15, !16}
!llvm.ident = !{!17}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (tags/RELEASE_390/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, globals: !5)
!1 = !DIFile(filename: "369_42.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/369")
!2 = !{}
!3 = !{!4}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64, align: 64)
!5 = !{!6, !10, !11, !12, !13, !14}
!6 = distinct !DIGlobalVariable(name: "GLOBAL_CONST_TRUE", scope: !0, file: !7, line: 10, type: !8, isLocal: false, isDefinition: true, variable: i32* @GLOBAL_CONST_TRUE)
!7 = !DIFile(filename: "./369_42.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/369")
!8 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !9)
!9 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!10 = distinct !DIGlobalVariable(name: "GLOBAL_CONST_FALSE", scope: !0, file: !7, line: 11, type: !8, isLocal: false, isDefinition: true, variable: i32* @GLOBAL_CONST_FALSE)
!11 = distinct !DIGlobalVariable(name: "GLOBAL_CONST_FIVE", scope: !0, file: !7, line: 12, type: !8, isLocal: false, isDefinition: true, variable: i32* @GLOBAL_CONST_FIVE)
!12 = distinct !DIGlobalVariable(name: "globalTrue", scope: !0, file: !7, line: 15, type: !9, isLocal: false, isDefinition: true, variable: i32* @globalTrue)
!13 = distinct !DIGlobalVariable(name: "globalFalse", scope: !0, file: !7, line: 16, type: !9, isLocal: false, isDefinition: true, variable: i32* @globalFalse)
!14 = distinct !DIGlobalVariable(name: "globalFive", scope: !0, file: !7, line: 17, type: !9, isLocal: false, isDefinition: true, variable: i32* @globalFive)
!15 = !{i32 2, !"Dwarf Version", i32 4}
!16 = !{i32 2, !"Debug Info Version", i32 3}
!17 = !{!"clang version 3.9.0 (tags/RELEASE_390/final)"}
!18 = distinct !DISubprogram(name: "globalReturnsTrue", scope: !7, file: !7, line: 19, type: !19, isLocal: false, isDefinition: true, scopeLine: 20, isOptimized: false, unit: !0, variables: !2)
!19 = !DISubroutineType(types: !20)
!20 = !{!9}
!21 = !DILocation(line: 21, column: 5, scope: !18)
!22 = distinct !DISubprogram(name: "globalReturnsFalse", scope: !7, file: !7, line: 24, type: !19, isLocal: false, isDefinition: true, scopeLine: 25, isOptimized: false, unit: !0, variables: !2)
!23 = !DILocation(line: 26, column: 5, scope: !22)
!24 = distinct !DISubprogram(name: "globalReturnsTrueOrFalse", scope: !7, file: !7, line: 29, type: !19, isLocal: false, isDefinition: true, scopeLine: 30, isOptimized: false, unit: !0, variables: !2)
!25 = !DILocation(line: 31, column: 13, scope: !24)
!26 = !DILocation(line: 31, column: 20, scope: !24)
!27 = !DILocation(line: 31, column: 5, scope: !24)
!28 = distinct !DISubprogram(name: "printLine", scope: !7, file: !7, line: 34, type: !29, isLocal: false, isDefinition: true, scopeLine: 35, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!29 = !DISubroutineType(types: !30)
!30 = !{null, !31}
!31 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !32, size: 64, align: 64)
!32 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !33)
!33 = !DIBasicType(name: "char", size: 8, align: 8, encoding: DW_ATE_signed_char)
!34 = !DILocalVariable(name: "line", arg: 1, scope: !28, file: !7, line: 34, type: !31)
!35 = !DIExpression()
!36 = !DILocation(line: 34, column: 30, scope: !28)
!37 = !DILocation(line: 36, column: 8, scope: !38)
!38 = distinct !DILexicalBlock(scope: !28, file: !7, line: 36, column: 8)
!39 = !DILocation(line: 36, column: 13, scope: !38)
!40 = !DILocation(line: 36, column: 8, scope: !28)
!41 = !DILocation(line: 38, column: 24, scope: !42)
!42 = distinct !DILexicalBlock(scope: !38, file: !7, line: 37, column: 5)
!43 = !DILocation(line: 38, column: 9, scope: !42)
!44 = !DILocation(line: 39, column: 5, scope: !42)
!45 = !DILocation(line: 40, column: 1, scope: !28)
!46 = distinct !DISubprogram(name: "printIntLine", scope: !7, file: !7, line: 42, type: !47, isLocal: false, isDefinition: true, scopeLine: 43, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!47 = !DISubroutineType(types: !48)
!48 = !{null, !9}
!49 = !DILocalVariable(name: "intNumber", arg: 1, scope: !46, file: !7, line: 42, type: !9)
!50 = !DILocation(line: 42, column: 24, scope: !46)
!51 = !DILocation(line: 44, column: 20, scope: !46)
!52 = !DILocation(line: 44, column: 5, scope: !46)
!53 = !DILocation(line: 45, column: 1, scope: !46)
!54 = distinct !DISubprogram(name: "bad42", scope: !7, file: !7, line: 51, type: !55, isLocal: false, isDefinition: true, scopeLine: 52, isOptimized: false, unit: !0, variables: !2)
!55 = !DISubroutineType(types: !56)
!56 = !{null}
!57 = !DILocalVariable(name: "i", scope: !54, file: !7, line: 53, type: !9)
!58 = !DILocation(line: 53, column: 9, scope: !54)
!59 = !DILocalVariable(name: "j", scope: !54, file: !7, line: 53, type: !9)
!60 = !DILocation(line: 53, column: 11, scope: !54)
!61 = !DILocalVariable(name: "data", scope: !54, file: !7, line: 54, type: !9)
!62 = !DILocation(line: 54, column: 9, scope: !54)
!63 = !DILocation(line: 56, column: 10, scope: !54)
!64 = !DILocation(line: 57, column: 11, scope: !65)
!65 = distinct !DILexicalBlock(scope: !54, file: !7, line: 57, column: 5)
!66 = !DILocation(line: 57, column: 9, scope: !65)
!67 = !DILocation(line: 57, column: 16, scope: !68)
!68 = !DILexicalBlockFile(scope: !69, file: !7, discriminator: 1)
!69 = distinct !DILexicalBlock(scope: !65, file: !7, line: 57, column: 5)
!70 = !DILocation(line: 57, column: 18, scope: !68)
!71 = !DILocation(line: 57, column: 5, scope: !68)
!72 = !DILocation(line: 60, column: 16, scope: !73)
!73 = distinct !DILexicalBlock(scope: !69, file: !7, line: 58, column: 5)
!74 = !DILocation(line: 60, column: 9, scope: !73)
!75 = !DILocation(line: 61, column: 5, scope: !73)
!76 = !DILocation(line: 57, column: 24, scope: !77)
!77 = !DILexicalBlockFile(scope: !69, file: !7, discriminator: 2)
!78 = !DILocation(line: 57, column: 5, scope: !77)
!79 = distinct !{!79, !80}
!80 = !DILocation(line: 57, column: 5, scope: !54)
!81 = !DILocation(line: 62, column: 11, scope: !82)
!82 = distinct !DILexicalBlock(scope: !54, file: !7, line: 62, column: 5)
!83 = !DILocation(line: 62, column: 9, scope: !82)
!84 = !DILocation(line: 62, column: 16, scope: !85)
!85 = !DILexicalBlockFile(scope: !86, file: !7, discriminator: 1)
!86 = distinct !DILexicalBlock(scope: !82, file: !7, line: 62, column: 5)
!87 = !DILocation(line: 62, column: 18, scope: !85)
!88 = !DILocation(line: 62, column: 5, scope: !85)
!89 = !DILocation(line: 65, column: 28, scope: !90)
!90 = distinct !DILexicalBlock(scope: !86, file: !7, line: 63, column: 5)
!91 = !DILocation(line: 65, column: 26, scope: !90)
!92 = !DILocation(line: 65, column: 9, scope: !90)
!93 = !DILocation(line: 66, column: 5, scope: !90)
!94 = !DILocation(line: 62, column: 24, scope: !95)
!95 = !DILexicalBlockFile(scope: !86, file: !7, discriminator: 2)
!96 = !DILocation(line: 62, column: 5, scope: !95)
!97 = distinct !{!97, !98}
!98 = !DILocation(line: 62, column: 5, scope: !54)
!99 = !DILocation(line: 67, column: 1, scope: !54)
!100 = distinct !DISubprogram(name: "good42", scope: !7, file: !7, line: 71, type: !55, isLocal: false, isDefinition: true, scopeLine: 72, isOptimized: false, unit: !0, variables: !2)
!101 = !DILocalVariable(name: "i", scope: !100, file: !7, line: 73, type: !9)
!102 = !DILocation(line: 73, column: 9, scope: !100)
!103 = !DILocalVariable(name: "k", scope: !100, file: !7, line: 73, type: !9)
!104 = !DILocation(line: 73, column: 11, scope: !100)
!105 = !DILocalVariable(name: "data", scope: !100, file: !7, line: 74, type: !9)
!106 = !DILocation(line: 74, column: 9, scope: !100)
!107 = !DILocation(line: 76, column: 10, scope: !100)
!108 = !DILocation(line: 77, column: 11, scope: !109)
!109 = distinct !DILexicalBlock(scope: !100, file: !7, line: 77, column: 5)
!110 = !DILocation(line: 77, column: 9, scope: !109)
!111 = !DILocation(line: 77, column: 16, scope: !112)
!112 = !DILexicalBlockFile(scope: !113, file: !7, discriminator: 1)
!113 = distinct !DILexicalBlock(scope: !109, file: !7, line: 77, column: 5)
!114 = !DILocation(line: 77, column: 18, scope: !112)
!115 = !DILocation(line: 77, column: 5, scope: !112)
!116 = !DILocation(line: 80, column: 16, scope: !117)
!117 = distinct !DILexicalBlock(scope: !113, file: !7, line: 78, column: 5)
!118 = !DILocation(line: 80, column: 9, scope: !117)
!119 = !DILocation(line: 81, column: 5, scope: !117)
!120 = !DILocation(line: 77, column: 24, scope: !121)
!121 = !DILexicalBlockFile(scope: !113, file: !7, discriminator: 2)
!122 = !DILocation(line: 77, column: 5, scope: !121)
!123 = distinct !{!123, !124}
!124 = !DILocation(line: 77, column: 5, scope: !100)
!125 = !DILocation(line: 82, column: 11, scope: !126)
!126 = distinct !DILexicalBlock(scope: !100, file: !7, line: 82, column: 5)
!127 = !DILocation(line: 82, column: 9, scope: !126)
!128 = !DILocation(line: 82, column: 16, scope: !129)
!129 = !DILexicalBlockFile(scope: !130, file: !7, discriminator: 1)
!130 = distinct !DILexicalBlock(scope: !126, file: !7, line: 82, column: 5)
!131 = !DILocation(line: 82, column: 18, scope: !129)
!132 = !DILocation(line: 82, column: 5, scope: !129)
!133 = !DILocation(line: 85, column: 13, scope: !134)
!134 = distinct !DILexicalBlock(scope: !135, file: !7, line: 85, column: 13)
!135 = distinct !DILexicalBlock(scope: !130, file: !7, line: 83, column: 5)
!136 = !DILocation(line: 85, column: 18, scope: !134)
!137 = !DILocation(line: 85, column: 13, scope: !135)
!138 = !DILocation(line: 87, column: 32, scope: !139)
!139 = distinct !DILexicalBlock(scope: !134, file: !7, line: 86, column: 9)
!140 = !DILocation(line: 87, column: 30, scope: !139)
!141 = !DILocation(line: 87, column: 13, scope: !139)
!142 = !DILocation(line: 88, column: 9, scope: !139)
!143 = !DILocation(line: 91, column: 13, scope: !144)
!144 = distinct !DILexicalBlock(scope: !134, file: !7, line: 90, column: 9)
!145 = !DILocation(line: 93, column: 5, scope: !135)
!146 = !DILocation(line: 82, column: 24, scope: !147)
!147 = !DILexicalBlockFile(scope: !130, file: !7, discriminator: 2)
!148 = !DILocation(line: 82, column: 5, scope: !147)
!149 = distinct !{!149, !150}
!150 = !DILocation(line: 82, column: 5, scope: !100)
!151 = !DILocation(line: 94, column: 1, scope: !100)
!152 = distinct !DISubprogram(name: "main", scope: !7, file: !7, line: 98, type: !19, isLocal: false, isDefinition: true, scopeLine: 98, isOptimized: false, unit: !0, variables: !2)
!153 = !DILocation(line: 99, column: 5, scope: !152)
!154 = !DILocation(line: 100, column: 5, scope: !152)
!155 = !DILocation(line: 101, column: 5, scope: !152)
