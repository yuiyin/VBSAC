; ModuleID = './190_12.c'
source_filename = "./190_12.c"
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
@.str.3 = private unnamed_addr constant [4 x i8] c"%ld\00", align 1
@.str.4 = private unnamed_addr constant [54 x i8] c"data value is too large to perform arithmetic safely.\00", align 1

; Function Attrs: nounwind uwtable
define i32 @globalReturnsTrue() #0 !dbg !20 {
entry:
  ret i32 1, !dbg !23
}

; Function Attrs: nounwind uwtable
define i32 @globalReturnsFalse() #0 !dbg !24 {
entry:
  ret i32 0, !dbg !25
}

; Function Attrs: nounwind uwtable
define i32 @globalReturnsTrueOrFalse() #0 !dbg !26 {
entry:
  %call = call i32 @rand() #5, !dbg !27
  %rem = srem i32 %call, 2, !dbg !28
  ret i32 %rem, !dbg !29
}

; Function Attrs: nounwind
declare i32 @rand() #1

; Function Attrs: nounwind uwtable
define void @printHexCharLine(i8 signext %charHex) #0 !dbg !30 {
entry:
  %charHex.addr = alloca i8, align 1
  store i8 %charHex, i8* %charHex.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %charHex.addr, metadata !34, metadata !35), !dbg !36
  %0 = load i8, i8* %charHex.addr, align 1, !dbg !37
  %conv = sext i8 %0 to i32, !dbg !38
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), i32 %conv), !dbg !39
  ret void, !dbg !40
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #2

declare i32 @printf(i8*, ...) #3

; Function Attrs: nounwind uwtable
define void @printLine(i8* %line) #0 !dbg !41 {
entry:
  %line.addr = alloca i8*, align 8
  store i8* %line, i8** %line.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %line.addr, metadata !46, metadata !35), !dbg !47
  %0 = load i8*, i8** %line.addr, align 8, !dbg !48
  %cmp = icmp ne i8* %0, null, !dbg !50
  br i1 %cmp, label %if.then, label %if.end, !dbg !51

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** %line.addr, align 8, !dbg !52
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i32 0, i32 0), i8* %1), !dbg !54
  br label %if.end, !dbg !55

if.end:                                           ; preds = %if.then, %entry
  ret void, !dbg !56
}

; Function Attrs: nounwind uwtable
define void @printIntLine(i32 %intNumber) #0 !dbg !57 {
entry:
  %intNumber.addr = alloca i32, align 4
  store i32 %intNumber, i32* %intNumber.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %intNumber.addr, metadata !60, metadata !35), !dbg !61
  %0 = load i32, i32* %intNumber.addr, align 4, !dbg !62
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), i32 %0), !dbg !63
  ret void, !dbg !64
}

; Function Attrs: nounwind uwtable
define void @printLongLine(i64 %longIntNumber) #0 !dbg !65 {
entry:
  %longIntNumber.addr = alloca i64, align 8
  store i64 %longIntNumber, i64* %longIntNumber.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %longIntNumber.addr, metadata !70, metadata !35), !dbg !71
  %0 = load i64, i64* %longIntNumber.addr, align 8, !dbg !72
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.2, i32 0, i32 0), i64 %0), !dbg !73
  ret void, !dbg !74
}

; Function Attrs: nounwind uwtable
define void @bad12() #0 !dbg !75 {
entry:
  %data = alloca i64, align 8
  %result = alloca i64, align 8
  %result10 = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64* %data, metadata !78, metadata !35), !dbg !79
  store i64 0, i64* %data, align 8, !dbg !80
  %call = call i32 @globalReturnsTrueOrFalse(), !dbg !81
  %tobool = icmp ne i32 %call, 0, !dbg !81
  br i1 %tobool, label %if.then, label %if.else, !dbg !83

if.then:                                          ; preds = %entry
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !84
  %call1 = call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* %0, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i32 0, i32 0), i64* %data), !dbg !86
  br label %if.end, !dbg !87

if.else:                                          ; preds = %entry
  store i64 2, i64* %data, align 8, !dbg !88
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %call2 = call i32 @globalReturnsTrueOrFalse(), !dbg !90
  %tobool3 = icmp ne i32 %call2, 0, !dbg !90
  br i1 %tobool3, label %if.then4, label %if.else5, !dbg !92

if.then4:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i64* %result, metadata !93, metadata !35), !dbg !96
  %1 = load i64, i64* %data, align 8, !dbg !97
  %2 = load i64, i64* %data, align 8, !dbg !98
  %mul = mul nsw i64 %1, %2, !dbg !99
  store i64 %mul, i64* %result, align 8, !dbg !96
  %3 = load i64, i64* %result, align 8, !dbg !100
  call void @printLongLine(i64 %3), !dbg !101
  br label %if.end14, !dbg !102

if.else5:                                         ; preds = %if.end
  %4 = load i64, i64* %data, align 8, !dbg !103
  %call6 = call i64 @labs(i64 %4) #2, !dbg !106
  %call7 = call double @sqrt(double 0x43E0000000000000) #5, !dbg !107
  %conv = fptosi double %call7 to i64, !dbg !109
  %cmp = icmp sle i64 %call6, %conv, !dbg !110
  br i1 %cmp, label %if.then9, label %if.else12, !dbg !111

if.then9:                                         ; preds = %if.else5
  call void @llvm.dbg.declare(metadata i64* %result10, metadata !112, metadata !35), !dbg !114
  %5 = load i64, i64* %data, align 8, !dbg !115
  %6 = load i64, i64* %data, align 8, !dbg !116
  %mul11 = mul nsw i64 %5, %6, !dbg !117
  store i64 %mul11, i64* %result10, align 8, !dbg !114
  %7 = load i64, i64* %result10, align 8, !dbg !118
  call void @printLongLine(i64 %7), !dbg !119
  br label %if.end13, !dbg !120

if.else12:                                        ; preds = %if.else5
  call void @printLine(i8* getelementptr inbounds ([54 x i8], [54 x i8]* @.str.4, i32 0, i32 0)), !dbg !121
  br label %if.end13

if.end13:                                         ; preds = %if.else12, %if.then9
  br label %if.end14

if.end14:                                         ; preds = %if.end13, %if.then4
  ret void, !dbg !123
}

declare i32 @__isoc99_fscanf(%struct._IO_FILE*, i8*, ...) #3

; Function Attrs: nounwind readnone
declare i64 @labs(i64) #4

; Function Attrs: nounwind
declare double @sqrt(double) #1

; Function Attrs: nounwind uwtable
define void @good12() #0 !dbg !124 {
entry:
  %data = alloca i64, align 8
  %result = alloca i64, align 8
  %result19 = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64* %data, metadata !125, metadata !35), !dbg !126
  store i64 0, i64* %data, align 8, !dbg !127
  %call = call i32 @globalReturnsTrueOrFalse(), !dbg !128
  %tobool = icmp ne i32 %call, 0, !dbg !128
  br i1 %tobool, label %if.then, label %if.else, !dbg !130

if.then:                                          ; preds = %entry
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !131
  %call1 = call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* %0, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i32 0, i32 0), i64* %data), !dbg !133
  br label %if.end, !dbg !134

if.else:                                          ; preds = %entry
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !135
  %call2 = call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i32 0, i32 0), i64* %data), !dbg !137
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %call3 = call i32 @globalReturnsTrueOrFalse(), !dbg !138
  %tobool4 = icmp ne i32 %call3, 0, !dbg !138
  br i1 %tobool4, label %if.then5, label %if.else12, !dbg !140

if.then5:                                         ; preds = %if.end
  %2 = load i64, i64* %data, align 8, !dbg !141
  %call6 = call i64 @labs(i64 %2) #2, !dbg !144
  %call7 = call double @sqrt(double 0x43E0000000000000) #5, !dbg !145
  %conv = fptosi double %call7 to i64, !dbg !147
  %cmp = icmp sle i64 %call6, %conv, !dbg !148
  br i1 %cmp, label %if.then9, label %if.else10, !dbg !149

if.then9:                                         ; preds = %if.then5
  call void @llvm.dbg.declare(metadata i64* %result, metadata !150, metadata !35), !dbg !152
  %3 = load i64, i64* %data, align 8, !dbg !153
  %4 = load i64, i64* %data, align 8, !dbg !154
  %mul = mul nsw i64 %3, %4, !dbg !155
  store i64 %mul, i64* %result, align 8, !dbg !152
  %5 = load i64, i64* %result, align 8, !dbg !156
  call void @printLongLine(i64 %5), !dbg !157
  br label %if.end11, !dbg !158

if.else10:                                        ; preds = %if.then5
  call void @printLine(i8* getelementptr inbounds ([54 x i8], [54 x i8]* @.str.4, i32 0, i32 0)), !dbg !159
  br label %if.end11

if.end11:                                         ; preds = %if.else10, %if.then9
  br label %if.end23, !dbg !161

if.else12:                                        ; preds = %if.end
  %6 = load i64, i64* %data, align 8, !dbg !162
  %call13 = call i64 @labs(i64 %6) #2, !dbg !165
  %call14 = call double @sqrt(double 0x43E0000000000000) #5, !dbg !166
  %conv15 = fptosi double %call14 to i64, !dbg !168
  %cmp16 = icmp sle i64 %call13, %conv15, !dbg !169
  br i1 %cmp16, label %if.then18, label %if.else21, !dbg !170

if.then18:                                        ; preds = %if.else12
  call void @llvm.dbg.declare(metadata i64* %result19, metadata !171, metadata !35), !dbg !173
  %7 = load i64, i64* %data, align 8, !dbg !174
  %8 = load i64, i64* %data, align 8, !dbg !175
  %mul20 = mul nsw i64 %7, %8, !dbg !176
  store i64 %mul20, i64* %result19, align 8, !dbg !173
  %9 = load i64, i64* %result19, align 8, !dbg !177
  call void @printLongLine(i64 %9), !dbg !178
  br label %if.end22, !dbg !179

if.else21:                                        ; preds = %if.else12
  call void @printLine(i8* getelementptr inbounds ([54 x i8], [54 x i8]* @.str.4, i32 0, i32 0)), !dbg !180
  br label %if.end22

if.end22:                                         ; preds = %if.else21, %if.then18
  br label %if.end23

if.end23:                                         ; preds = %if.end22, %if.end11
  ret void, !dbg !182
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !183 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @good12(), !dbg !184
  call void @bad12(), !dbg !185
  ret i32 1, !dbg !186
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone }
attributes #3 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readnone "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!17, !18}
!llvm.ident = !{!19}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (tags/RELEASE_390/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, globals: !8)
!1 = !DIFile(filename: "190_12.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/190")
!2 = !{}
!3 = !{!4, !5, !6, !7}
!4 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64, align: 64)
!6 = !DIBasicType(name: "long int", size: 64, align: 64, encoding: DW_ATE_signed)
!7 = !DIBasicType(name: "double", size: 64, align: 64, encoding: DW_ATE_float)
!8 = !{!9, !12, !13, !14, !15, !16}
!9 = distinct !DIGlobalVariable(name: "GLOBAL_CONST_TRUE", scope: !0, file: !10, line: 10, type: !11, isLocal: false, isDefinition: true, variable: i32* @GLOBAL_CONST_TRUE)
!10 = !DIFile(filename: "./190_12.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/190")
!11 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !4)
!12 = distinct !DIGlobalVariable(name: "GLOBAL_CONST_FALSE", scope: !0, file: !10, line: 11, type: !11, isLocal: false, isDefinition: true, variable: i32* @GLOBAL_CONST_FALSE)
!13 = distinct !DIGlobalVariable(name: "GLOBAL_CONST_FIVE", scope: !0, file: !10, line: 12, type: !11, isLocal: false, isDefinition: true, variable: i32* @GLOBAL_CONST_FIVE)
!14 = distinct !DIGlobalVariable(name: "globalTrue", scope: !0, file: !10, line: 14, type: !4, isLocal: false, isDefinition: true, variable: i32* @globalTrue)
!15 = distinct !DIGlobalVariable(name: "globalFalse", scope: !0, file: !10, line: 15, type: !4, isLocal: false, isDefinition: true, variable: i32* @globalFalse)
!16 = distinct !DIGlobalVariable(name: "globalFive", scope: !0, file: !10, line: 16, type: !4, isLocal: false, isDefinition: true, variable: i32* @globalFive)
!17 = !{i32 2, !"Dwarf Version", i32 4}
!18 = !{i32 2, !"Debug Info Version", i32 3}
!19 = !{!"clang version 3.9.0 (tags/RELEASE_390/final)"}
!20 = distinct !DISubprogram(name: "globalReturnsTrue", scope: !10, file: !10, line: 20, type: !21, isLocal: false, isDefinition: true, scopeLine: 21, isOptimized: false, unit: !0, variables: !2)
!21 = !DISubroutineType(types: !22)
!22 = !{!4}
!23 = !DILocation(line: 22, column: 5, scope: !20)
!24 = distinct !DISubprogram(name: "globalReturnsFalse", scope: !10, file: !10, line: 25, type: !21, isLocal: false, isDefinition: true, scopeLine: 26, isOptimized: false, unit: !0, variables: !2)
!25 = !DILocation(line: 27, column: 5, scope: !24)
!26 = distinct !DISubprogram(name: "globalReturnsTrueOrFalse", scope: !10, file: !10, line: 30, type: !21, isLocal: false, isDefinition: true, scopeLine: 31, isOptimized: false, unit: !0, variables: !2)
!27 = !DILocation(line: 32, column: 13, scope: !26)
!28 = !DILocation(line: 32, column: 20, scope: !26)
!29 = !DILocation(line: 32, column: 5, scope: !26)
!30 = distinct !DISubprogram(name: "printHexCharLine", scope: !10, file: !10, line: 36, type: !31, isLocal: false, isDefinition: true, scopeLine: 37, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!31 = !DISubroutineType(types: !32)
!32 = !{null, !33}
!33 = !DIBasicType(name: "char", size: 8, align: 8, encoding: DW_ATE_signed_char)
!34 = !DILocalVariable(name: "charHex", arg: 1, scope: !30, file: !10, line: 36, type: !33)
!35 = !DIExpression()
!36 = !DILocation(line: 36, column: 29, scope: !30)
!37 = !DILocation(line: 38, column: 25, scope: !30)
!38 = !DILocation(line: 38, column: 20, scope: !30)
!39 = !DILocation(line: 38, column: 5, scope: !30)
!40 = !DILocation(line: 39, column: 1, scope: !30)
!41 = distinct !DISubprogram(name: "printLine", scope: !10, file: !10, line: 41, type: !42, isLocal: false, isDefinition: true, scopeLine: 42, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!42 = !DISubroutineType(types: !43)
!43 = !{null, !44}
!44 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !45, size: 64, align: 64)
!45 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !33)
!46 = !DILocalVariable(name: "line", arg: 1, scope: !41, file: !10, line: 41, type: !44)
!47 = !DILocation(line: 41, column: 30, scope: !41)
!48 = !DILocation(line: 43, column: 8, scope: !49)
!49 = distinct !DILexicalBlock(scope: !41, file: !10, line: 43, column: 8)
!50 = !DILocation(line: 43, column: 13, scope: !49)
!51 = !DILocation(line: 43, column: 8, scope: !41)
!52 = !DILocation(line: 45, column: 24, scope: !53)
!53 = distinct !DILexicalBlock(scope: !49, file: !10, line: 44, column: 5)
!54 = !DILocation(line: 45, column: 9, scope: !53)
!55 = !DILocation(line: 46, column: 5, scope: !53)
!56 = !DILocation(line: 47, column: 1, scope: !41)
!57 = distinct !DISubprogram(name: "printIntLine", scope: !10, file: !10, line: 49, type: !58, isLocal: false, isDefinition: true, scopeLine: 50, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!58 = !DISubroutineType(types: !59)
!59 = !{null, !4}
!60 = !DILocalVariable(name: "intNumber", arg: 1, scope: !57, file: !10, line: 49, type: !4)
!61 = !DILocation(line: 49, column: 24, scope: !57)
!62 = !DILocation(line: 51, column: 20, scope: !57)
!63 = !DILocation(line: 51, column: 5, scope: !57)
!64 = !DILocation(line: 52, column: 1, scope: !57)
!65 = distinct !DISubprogram(name: "printLongLine", scope: !10, file: !10, line: 54, type: !66, isLocal: false, isDefinition: true, scopeLine: 55, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!66 = !DISubroutineType(types: !67)
!67 = !{null, !68}
!68 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !69, line: 197, baseType: !6)
!69 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/sys/types.h", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/190")
!70 = !DILocalVariable(name: "longIntNumber", arg: 1, scope: !65, file: !10, line: 54, type: !68)
!71 = !DILocation(line: 54, column: 29, scope: !65)
!72 = !DILocation(line: 56, column: 21, scope: !65)
!73 = !DILocation(line: 56, column: 5, scope: !65)
!74 = !DILocation(line: 57, column: 1, scope: !65)
!75 = distinct !DISubprogram(name: "bad12", scope: !10, file: !10, line: 60, type: !76, isLocal: false, isDefinition: true, scopeLine: 61, isOptimized: false, unit: !0, variables: !2)
!76 = !DISubroutineType(types: !77)
!77 = !{null}
!78 = !DILocalVariable(name: "data", scope: !75, file: !10, line: 62, type: !68)
!79 = !DILocation(line: 62, column: 13, scope: !75)
!80 = !DILocation(line: 63, column: 10, scope: !75)
!81 = !DILocation(line: 64, column: 8, scope: !82)
!82 = distinct !DILexicalBlock(scope: !75, file: !10, line: 64, column: 8)
!83 = !DILocation(line: 64, column: 8, scope: !75)
!84 = !DILocation(line: 67, column: 17, scope: !85)
!85 = distinct !DILexicalBlock(scope: !82, file: !10, line: 65, column: 5)
!86 = !DILocation(line: 67, column: 9, scope: !85)
!87 = !DILocation(line: 68, column: 5, scope: !85)
!88 = !DILocation(line: 72, column: 14, scope: !89)
!89 = distinct !DILexicalBlock(scope: !82, file: !10, line: 70, column: 5)
!90 = !DILocation(line: 74, column: 8, scope: !91)
!91 = distinct !DILexicalBlock(scope: !75, file: !10, line: 74, column: 8)
!92 = !DILocation(line: 74, column: 8, scope: !75)
!93 = !DILocalVariable(name: "result", scope: !94, file: !10, line: 78, type: !68)
!94 = distinct !DILexicalBlock(scope: !95, file: !10, line: 76, column: 9)
!95 = distinct !DILexicalBlock(scope: !91, file: !10, line: 75, column: 5)
!96 = !DILocation(line: 78, column: 21, scope: !94)
!97 = !DILocation(line: 78, column: 30, scope: !94)
!98 = !DILocation(line: 78, column: 37, scope: !94)
!99 = !DILocation(line: 78, column: 35, scope: !94)
!100 = !DILocation(line: 79, column: 27, scope: !94)
!101 = !DILocation(line: 79, column: 13, scope: !94)
!102 = !DILocation(line: 81, column: 5, scope: !95)
!103 = !DILocation(line: 85, column: 24, scope: !104)
!104 = distinct !DILexicalBlock(scope: !105, file: !10, line: 85, column: 13)
!105 = distinct !DILexicalBlock(scope: !91, file: !10, line: 83, column: 5)
!106 = !DILocation(line: 85, column: 13, scope: !104)
!107 = !DILocation(line: 85, column: 39, scope: !108)
!108 = !DILexicalBlockFile(scope: !104, file: !10, discriminator: 1)
!109 = !DILocation(line: 85, column: 33, scope: !104)
!110 = !DILocation(line: 85, column: 30, scope: !104)
!111 = !DILocation(line: 85, column: 13, scope: !105)
!112 = !DILocalVariable(name: "result", scope: !113, file: !10, line: 87, type: !68)
!113 = distinct !DILexicalBlock(scope: !104, file: !10, line: 86, column: 9)
!114 = !DILocation(line: 87, column: 21, scope: !113)
!115 = !DILocation(line: 87, column: 30, scope: !113)
!116 = !DILocation(line: 87, column: 37, scope: !113)
!117 = !DILocation(line: 87, column: 35, scope: !113)
!118 = !DILocation(line: 88, column: 27, scope: !113)
!119 = !DILocation(line: 88, column: 13, scope: !113)
!120 = !DILocation(line: 89, column: 9, scope: !113)
!121 = !DILocation(line: 92, column: 13, scope: !122)
!122 = distinct !DILexicalBlock(scope: !104, file: !10, line: 91, column: 9)
!123 = !DILocation(line: 95, column: 1, scope: !75)
!124 = distinct !DISubprogram(name: "good12", scope: !10, file: !10, line: 97, type: !76, isLocal: false, isDefinition: true, scopeLine: 98, isOptimized: false, unit: !0, variables: !2)
!125 = !DILocalVariable(name: "data", scope: !124, file: !10, line: 99, type: !68)
!126 = !DILocation(line: 99, column: 13, scope: !124)
!127 = !DILocation(line: 100, column: 10, scope: !124)
!128 = !DILocation(line: 101, column: 8, scope: !129)
!129 = distinct !DILexicalBlock(scope: !124, file: !10, line: 101, column: 8)
!130 = !DILocation(line: 101, column: 8, scope: !124)
!131 = !DILocation(line: 104, column: 17, scope: !132)
!132 = distinct !DILexicalBlock(scope: !129, file: !10, line: 102, column: 5)
!133 = !DILocation(line: 104, column: 9, scope: !132)
!134 = !DILocation(line: 105, column: 5, scope: !132)
!135 = !DILocation(line: 109, column: 17, scope: !136)
!136 = distinct !DILexicalBlock(scope: !129, file: !10, line: 107, column: 5)
!137 = !DILocation(line: 109, column: 9, scope: !136)
!138 = !DILocation(line: 111, column: 8, scope: !139)
!139 = distinct !DILexicalBlock(scope: !124, file: !10, line: 111, column: 8)
!140 = !DILocation(line: 111, column: 8, scope: !124)
!141 = !DILocation(line: 114, column: 24, scope: !142)
!142 = distinct !DILexicalBlock(scope: !143, file: !10, line: 114, column: 13)
!143 = distinct !DILexicalBlock(scope: !139, file: !10, line: 112, column: 5)
!144 = !DILocation(line: 114, column: 13, scope: !142)
!145 = !DILocation(line: 114, column: 39, scope: !146)
!146 = !DILexicalBlockFile(scope: !142, file: !10, discriminator: 1)
!147 = !DILocation(line: 114, column: 33, scope: !142)
!148 = !DILocation(line: 114, column: 30, scope: !142)
!149 = !DILocation(line: 114, column: 13, scope: !143)
!150 = !DILocalVariable(name: "result", scope: !151, file: !10, line: 116, type: !68)
!151 = distinct !DILexicalBlock(scope: !142, file: !10, line: 115, column: 9)
!152 = !DILocation(line: 116, column: 21, scope: !151)
!153 = !DILocation(line: 116, column: 30, scope: !151)
!154 = !DILocation(line: 116, column: 37, scope: !151)
!155 = !DILocation(line: 116, column: 35, scope: !151)
!156 = !DILocation(line: 117, column: 27, scope: !151)
!157 = !DILocation(line: 117, column: 13, scope: !151)
!158 = !DILocation(line: 118, column: 9, scope: !151)
!159 = !DILocation(line: 121, column: 13, scope: !160)
!160 = distinct !DILexicalBlock(scope: !142, file: !10, line: 120, column: 9)
!161 = !DILocation(line: 123, column: 5, scope: !143)
!162 = !DILocation(line: 127, column: 24, scope: !163)
!163 = distinct !DILexicalBlock(scope: !164, file: !10, line: 127, column: 13)
!164 = distinct !DILexicalBlock(scope: !139, file: !10, line: 125, column: 5)
!165 = !DILocation(line: 127, column: 13, scope: !163)
!166 = !DILocation(line: 127, column: 39, scope: !167)
!167 = !DILexicalBlockFile(scope: !163, file: !10, discriminator: 1)
!168 = !DILocation(line: 127, column: 33, scope: !163)
!169 = !DILocation(line: 127, column: 30, scope: !163)
!170 = !DILocation(line: 127, column: 13, scope: !164)
!171 = !DILocalVariable(name: "result", scope: !172, file: !10, line: 129, type: !68)
!172 = distinct !DILexicalBlock(scope: !163, file: !10, line: 128, column: 9)
!173 = !DILocation(line: 129, column: 21, scope: !172)
!174 = !DILocation(line: 129, column: 30, scope: !172)
!175 = !DILocation(line: 129, column: 37, scope: !172)
!176 = !DILocation(line: 129, column: 35, scope: !172)
!177 = !DILocation(line: 130, column: 27, scope: !172)
!178 = !DILocation(line: 130, column: 13, scope: !172)
!179 = !DILocation(line: 131, column: 9, scope: !172)
!180 = !DILocation(line: 134, column: 13, scope: !181)
!181 = distinct !DILexicalBlock(scope: !163, file: !10, line: 133, column: 9)
!182 = !DILocation(line: 137, column: 1, scope: !124)
!183 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 139, type: !21, isLocal: false, isDefinition: true, scopeLine: 139, isOptimized: false, unit: !0, variables: !2)
!184 = !DILocation(line: 140, column: 5, scope: !183)
!185 = !DILocation(line: 141, column: 5, scope: !183)
!186 = !DILocation(line: 142, column: 5, scope: !183)
