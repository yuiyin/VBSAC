; ModuleID = './369_37.c'
source_filename = "./369_37.c"
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
define void @printLine(i8* %line) #0 !dbg !18 {
entry:
  %line.addr = alloca i8*, align 8
  store i8* %line, i8** %line.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %line.addr, metadata !24, metadata !25), !dbg !26
  %0 = load i8*, i8** %line.addr, align 8, !dbg !27
  %cmp = icmp ne i8* %0, null, !dbg !29
  br i1 %cmp, label %if.then, label %if.end, !dbg !30

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** %line.addr, align 8, !dbg !31
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), i8* %1), !dbg !33
  br label %if.end, !dbg !34

if.end:                                           ; preds = %if.then, %entry
  ret void, !dbg !35
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @printf(i8*, ...) #2

; Function Attrs: nounwind uwtable
define void @printIntLine(i32 %intNumber) #0 !dbg !36 {
entry:
  %intNumber.addr = alloca i32, align 4
  store i32 %intNumber, i32* %intNumber.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %intNumber.addr, metadata !39, metadata !25), !dbg !40
  %0 = load i32, i32* %intNumber.addr, align 4, !dbg !41
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i32 0, i32 0), i32 %0), !dbg !42
  ret void, !dbg !43
}

; Function Attrs: nounwind uwtable
define i32 @globalReturnsTrueOrFalse() #0 !dbg !44 {
entry:
  %call = call i32 @rand() #4, !dbg !47
  %rem = srem i32 %call, 2, !dbg !48
  ret i32 %rem, !dbg !49
}

; Function Attrs: nounwind
declare i32 @rand() #3

; Function Attrs: nounwind uwtable
define void @bad37() #0 !dbg !50 {
entry:
  %data = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !53, metadata !25), !dbg !54
  store i32 -1, i32* %data, align 4, !dbg !55
  %call = call i32 @globalReturnsTrueOrFalse(), !dbg !56
  %tobool = icmp ne i32 %call, 0, !dbg !56
  br i1 %tobool, label %if.then, label %if.else, !dbg !58

if.then:                                          ; preds = %entry
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !59
  %call1 = call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* %0, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.2, i32 0, i32 0), i32* %data), !dbg !61
  br label %if.end, !dbg !62

if.else:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !63
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %call2 = call i32 @globalReturnsTrueOrFalse(), !dbg !65
  %tobool3 = icmp ne i32 %call2, 0, !dbg !65
  br i1 %tobool3, label %if.then4, label %if.else5, !dbg !67

if.then4:                                         ; preds = %if.end
  %1 = load i32, i32* %data, align 4, !dbg !68
  %rem = srem i32 100, %1, !dbg !70
  call void @printIntLine(i32 %rem), !dbg !71
  br label %if.end10, !dbg !72

if.else5:                                         ; preds = %if.end
  %2 = load i32, i32* %data, align 4, !dbg !73
  %cmp = icmp ne i32 %2, 0, !dbg !76
  br i1 %cmp, label %if.then6, label %if.else8, !dbg !77

if.then6:                                         ; preds = %if.else5
  %3 = load i32, i32* %data, align 4, !dbg !78
  %rem7 = srem i32 100, %3, !dbg !80
  call void @printIntLine(i32 %rem7), !dbg !81
  br label %if.end9, !dbg !82

if.else8:                                         ; preds = %if.else5
  call void @printLine(i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.str.3, i32 0, i32 0)), !dbg !83
  br label %if.end9

if.end9:                                          ; preds = %if.else8, %if.then6
  br label %if.end10

if.end10:                                         ; preds = %if.end9, %if.then4
  ret void, !dbg !85
}

declare i32 @__isoc99_fscanf(%struct._IO_FILE*, i8*, ...) #2

; Function Attrs: nounwind uwtable
define void @good37() #0 !dbg !86 {
entry:
  %data = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !87, metadata !25), !dbg !88
  store i32 -1, i32* %data, align 4, !dbg !89
  %call = call i32 @globalReturnsTrueOrFalse(), !dbg !90
  %tobool = icmp ne i32 %call, 0, !dbg !90
  br i1 %tobool, label %if.then, label %if.else, !dbg !92

if.then:                                          ; preds = %entry
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !93
  %call1 = call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* %0, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.2, i32 0, i32 0), i32* %data), !dbg !95
  br label %if.end, !dbg !96

if.else:                                          ; preds = %entry
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !97
  %call2 = call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.2, i32 0, i32 0), i32* %data), !dbg !99
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %call3 = call i32 @globalReturnsTrueOrFalse(), !dbg !100
  %tobool4 = icmp ne i32 %call3, 0, !dbg !100
  br i1 %tobool4, label %if.then5, label %if.else9, !dbg !102

if.then5:                                         ; preds = %if.end
  %2 = load i32, i32* %data, align 4, !dbg !103
  %cmp = icmp ne i32 %2, 0, !dbg !106
  br i1 %cmp, label %if.then6, label %if.else7, !dbg !107

if.then6:                                         ; preds = %if.then5
  %3 = load i32, i32* %data, align 4, !dbg !108
  %rem = srem i32 100, %3, !dbg !110
  call void @printIntLine(i32 %rem), !dbg !111
  br label %if.end8, !dbg !112

if.else7:                                         ; preds = %if.then5
  call void @printLine(i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.str.3, i32 0, i32 0)), !dbg !113
  br label %if.end8

if.end8:                                          ; preds = %if.else7, %if.then6
  br label %if.end15, !dbg !115

if.else9:                                         ; preds = %if.end
  %4 = load i32, i32* %data, align 4, !dbg !116
  %cmp10 = icmp ne i32 %4, 0, !dbg !119
  br i1 %cmp10, label %if.then11, label %if.else13, !dbg !120

if.then11:                                        ; preds = %if.else9
  %5 = load i32, i32* %data, align 4, !dbg !121
  %rem12 = srem i32 100, %5, !dbg !123
  call void @printIntLine(i32 %rem12), !dbg !124
  br label %if.end14, !dbg !125

if.else13:                                        ; preds = %if.else9
  call void @printLine(i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.str.3, i32 0, i32 0)), !dbg !126
  br label %if.end14

if.end14:                                         ; preds = %if.else13, %if.then11
  br label %if.end15

if.end15:                                         ; preds = %if.end14, %if.end8
  ret void, !dbg !128
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !129 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @good37(), !dbg !130
  call void @bad37(), !dbg !131
  ret i32 1, !dbg !132
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!15, !16}
!llvm.ident = !{!17}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (tags/RELEASE_390/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, globals: !5)
!1 = !DIFile(filename: "369_37.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/369")
!2 = !{}
!3 = !{!4}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64, align: 64)
!5 = !{!6, !10, !11, !12, !13, !14}
!6 = distinct !DIGlobalVariable(name: "GLOBAL_CONST_TRUE", scope: !0, file: !7, line: 10, type: !8, isLocal: false, isDefinition: true, variable: i32* @GLOBAL_CONST_TRUE)
!7 = !DIFile(filename: "./369_37.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/369")
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
!18 = distinct !DISubprogram(name: "printLine", scope: !7, file: !7, line: 19, type: !19, isLocal: false, isDefinition: true, scopeLine: 20, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!19 = !DISubroutineType(types: !20)
!20 = !{null, !21}
!21 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !22, size: 64, align: 64)
!22 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !23)
!23 = !DIBasicType(name: "char", size: 8, align: 8, encoding: DW_ATE_signed_char)
!24 = !DILocalVariable(name: "line", arg: 1, scope: !18, file: !7, line: 19, type: !21)
!25 = !DIExpression()
!26 = !DILocation(line: 19, column: 30, scope: !18)
!27 = !DILocation(line: 21, column: 8, scope: !28)
!28 = distinct !DILexicalBlock(scope: !18, file: !7, line: 21, column: 8)
!29 = !DILocation(line: 21, column: 13, scope: !28)
!30 = !DILocation(line: 21, column: 8, scope: !18)
!31 = !DILocation(line: 23, column: 24, scope: !32)
!32 = distinct !DILexicalBlock(scope: !28, file: !7, line: 22, column: 5)
!33 = !DILocation(line: 23, column: 9, scope: !32)
!34 = !DILocation(line: 24, column: 5, scope: !32)
!35 = !DILocation(line: 25, column: 1, scope: !18)
!36 = distinct !DISubprogram(name: "printIntLine", scope: !7, file: !7, line: 27, type: !37, isLocal: false, isDefinition: true, scopeLine: 28, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!37 = !DISubroutineType(types: !38)
!38 = !{null, !9}
!39 = !DILocalVariable(name: "intNumber", arg: 1, scope: !36, file: !7, line: 27, type: !9)
!40 = !DILocation(line: 27, column: 24, scope: !36)
!41 = !DILocation(line: 29, column: 20, scope: !36)
!42 = !DILocation(line: 29, column: 5, scope: !36)
!43 = !DILocation(line: 30, column: 1, scope: !36)
!44 = distinct !DISubprogram(name: "globalReturnsTrueOrFalse", scope: !7, file: !7, line: 31, type: !45, isLocal: false, isDefinition: true, scopeLine: 32, isOptimized: false, unit: !0, variables: !2)
!45 = !DISubroutineType(types: !46)
!46 = !{!9}
!47 = !DILocation(line: 33, column: 13, scope: !44)
!48 = !DILocation(line: 33, column: 20, scope: !44)
!49 = !DILocation(line: 33, column: 5, scope: !44)
!50 = distinct !DISubprogram(name: "bad37", scope: !7, file: !7, line: 40, type: !51, isLocal: false, isDefinition: true, scopeLine: 41, isOptimized: false, unit: !0, variables: !2)
!51 = !DISubroutineType(types: !52)
!52 = !{null}
!53 = !DILocalVariable(name: "data", scope: !50, file: !7, line: 42, type: !9)
!54 = !DILocation(line: 42, column: 9, scope: !50)
!55 = !DILocation(line: 44, column: 10, scope: !50)
!56 = !DILocation(line: 45, column: 8, scope: !57)
!57 = distinct !DILexicalBlock(scope: !50, file: !7, line: 45, column: 8)
!58 = !DILocation(line: 45, column: 8, scope: !50)
!59 = !DILocation(line: 48, column: 16, scope: !60)
!60 = distinct !DILexicalBlock(scope: !57, file: !7, line: 46, column: 5)
!61 = !DILocation(line: 48, column: 9, scope: !60)
!62 = !DILocation(line: 49, column: 5, scope: !60)
!63 = !DILocation(line: 53, column: 14, scope: !64)
!64 = distinct !DILexicalBlock(scope: !57, file: !7, line: 51, column: 5)
!65 = !DILocation(line: 55, column: 8, scope: !66)
!66 = distinct !DILexicalBlock(scope: !50, file: !7, line: 55, column: 8)
!67 = !DILocation(line: 55, column: 8, scope: !50)
!68 = !DILocation(line: 58, column: 28, scope: !69)
!69 = distinct !DILexicalBlock(scope: !66, file: !7, line: 56, column: 5)
!70 = !DILocation(line: 58, column: 26, scope: !69)
!71 = !DILocation(line: 58, column: 9, scope: !69)
!72 = !DILocation(line: 59, column: 5, scope: !69)
!73 = !DILocation(line: 63, column: 13, scope: !74)
!74 = distinct !DILexicalBlock(scope: !75, file: !7, line: 63, column: 13)
!75 = distinct !DILexicalBlock(scope: !66, file: !7, line: 61, column: 5)
!76 = !DILocation(line: 63, column: 18, scope: !74)
!77 = !DILocation(line: 63, column: 13, scope: !75)
!78 = !DILocation(line: 65, column: 32, scope: !79)
!79 = distinct !DILexicalBlock(scope: !74, file: !7, line: 64, column: 9)
!80 = !DILocation(line: 65, column: 30, scope: !79)
!81 = !DILocation(line: 65, column: 13, scope: !79)
!82 = !DILocation(line: 66, column: 9, scope: !79)
!83 = !DILocation(line: 69, column: 13, scope: !84)
!84 = distinct !DILexicalBlock(scope: !74, file: !7, line: 68, column: 9)
!85 = !DILocation(line: 72, column: 1, scope: !50)
!86 = distinct !DISubprogram(name: "good37", scope: !7, file: !7, line: 76, type: !51, isLocal: false, isDefinition: true, scopeLine: 77, isOptimized: false, unit: !0, variables: !2)
!87 = !DILocalVariable(name: "data", scope: !86, file: !7, line: 78, type: !9)
!88 = !DILocation(line: 78, column: 13, scope: !86)
!89 = !DILocation(line: 80, column: 10, scope: !86)
!90 = !DILocation(line: 81, column: 8, scope: !91)
!91 = distinct !DILexicalBlock(scope: !86, file: !7, line: 81, column: 8)
!92 = !DILocation(line: 81, column: 8, scope: !86)
!93 = !DILocation(line: 84, column: 16, scope: !94)
!94 = distinct !DILexicalBlock(scope: !91, file: !7, line: 82, column: 5)
!95 = !DILocation(line: 84, column: 9, scope: !94)
!96 = !DILocation(line: 85, column: 5, scope: !94)
!97 = !DILocation(line: 89, column: 16, scope: !98)
!98 = distinct !DILexicalBlock(scope: !91, file: !7, line: 87, column: 5)
!99 = !DILocation(line: 89, column: 9, scope: !98)
!100 = !DILocation(line: 91, column: 8, scope: !101)
!101 = distinct !DILexicalBlock(scope: !86, file: !7, line: 91, column: 8)
!102 = !DILocation(line: 91, column: 8, scope: !86)
!103 = !DILocation(line: 94, column: 13, scope: !104)
!104 = distinct !DILexicalBlock(scope: !105, file: !7, line: 94, column: 13)
!105 = distinct !DILexicalBlock(scope: !101, file: !7, line: 92, column: 5)
!106 = !DILocation(line: 94, column: 18, scope: !104)
!107 = !DILocation(line: 94, column: 13, scope: !105)
!108 = !DILocation(line: 96, column: 32, scope: !109)
!109 = distinct !DILexicalBlock(scope: !104, file: !7, line: 95, column: 9)
!110 = !DILocation(line: 96, column: 30, scope: !109)
!111 = !DILocation(line: 96, column: 13, scope: !109)
!112 = !DILocation(line: 97, column: 9, scope: !109)
!113 = !DILocation(line: 100, column: 13, scope: !114)
!114 = distinct !DILexicalBlock(scope: !104, file: !7, line: 99, column: 9)
!115 = !DILocation(line: 102, column: 5, scope: !105)
!116 = !DILocation(line: 106, column: 13, scope: !117)
!117 = distinct !DILexicalBlock(scope: !118, file: !7, line: 106, column: 13)
!118 = distinct !DILexicalBlock(scope: !101, file: !7, line: 104, column: 5)
!119 = !DILocation(line: 106, column: 18, scope: !117)
!120 = !DILocation(line: 106, column: 13, scope: !118)
!121 = !DILocation(line: 108, column: 32, scope: !122)
!122 = distinct !DILexicalBlock(scope: !117, file: !7, line: 107, column: 9)
!123 = !DILocation(line: 108, column: 30, scope: !122)
!124 = !DILocation(line: 108, column: 13, scope: !122)
!125 = !DILocation(line: 109, column: 9, scope: !122)
!126 = !DILocation(line: 112, column: 13, scope: !127)
!127 = distinct !DILexicalBlock(scope: !117, file: !7, line: 111, column: 9)
!128 = !DILocation(line: 115, column: 1, scope: !86)
!129 = distinct !DISubprogram(name: "main", scope: !7, file: !7, line: 118, type: !45, isLocal: false, isDefinition: true, scopeLine: 118, isOptimized: false, unit: !0, variables: !2)
!130 = !DILocation(line: 119, column: 5, scope: !129)
!131 = !DILocation(line: 120, column: 5, scope: !129)
!132 = !DILocation(line: 121, column: 5, scope: !129)
