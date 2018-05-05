; ModuleID = './190_32.c'
source_filename = "./190_32.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@.str.1 = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1
@.str.2 = private unnamed_addr constant [5 x i8] c"%ld\0A\00", align 1
@stdin = external global %struct._IO_FILE*, align 8
@.str.3 = private unnamed_addr constant [3 x i8] c"%c\00", align 1
@.str.4 = private unnamed_addr constant [54 x i8] c"data value is too large to perform arithmetic safely.\00", align 1

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
define void @bad32() #0 !dbg !57 {
entry:
  %data = alloca i8, align 1
  %result = alloca i8, align 1
  call void @llvm.dbg.declare(metadata i8* %data, metadata !60, metadata !17), !dbg !61
  store i8 32, i8* %data, align 1, !dbg !62
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !63
  %call = call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* %0, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i32 0, i32 0), i8* %data), !dbg !64
  call void @llvm.dbg.declare(metadata i8* %result, metadata !65, metadata !17), !dbg !67
  %1 = load i8, i8* %data, align 1, !dbg !68
  %conv = sext i8 %1 to i32, !dbg !68
  %2 = load i8, i8* %data, align 1, !dbg !69
  %conv1 = sext i8 %2 to i32, !dbg !69
  %mul = mul nsw i32 %conv, %conv1, !dbg !70
  %conv2 = trunc i32 %mul to i8, !dbg !68
  store i8 %conv2, i8* %result, align 1, !dbg !67
  %3 = load i8, i8* %result, align 1, !dbg !71
  call void @printHexCharLine(i8 signext %3), !dbg !72
  ret void, !dbg !73
}

declare i32 @__isoc99_fscanf(%struct._IO_FILE*, i8*, ...) #2

; Function Attrs: nounwind uwtable
define void @good32() #0 !dbg !74 {
entry:
  %data = alloca i8, align 1
  %result = alloca i8, align 1
  call void @llvm.dbg.declare(metadata i8* %data, metadata !75, metadata !17), !dbg !76
  store i8 32, i8* %data, align 1, !dbg !77
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !78
  %call = call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* %0, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i32 0, i32 0), i8* %data), !dbg !79
  %1 = load i8, i8* %data, align 1, !dbg !80
  %conv = sext i8 %1 to i64, !dbg !82
  %conv1 = trunc i64 %conv to i32, !dbg !82
  %call2 = call i32 @abs(i32 %conv1) #1, !dbg !83
  %conv3 = sext i32 %call2 to i64, !dbg !83
  %call4 = call double @sqrt(double 1.270000e+02) #5, !dbg !84
  %conv5 = fptosi double %call4 to i64, !dbg !86
  %cmp = icmp sle i64 %conv3, %conv5, !dbg !87
  br i1 %cmp, label %if.then, label %if.else, !dbg !88

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i8* %result, metadata !89, metadata !17), !dbg !91
  %2 = load i8, i8* %data, align 1, !dbg !92
  %conv7 = sext i8 %2 to i32, !dbg !92
  %3 = load i8, i8* %data, align 1, !dbg !93
  %conv8 = sext i8 %3 to i32, !dbg !93
  %mul = mul nsw i32 %conv7, %conv8, !dbg !94
  %conv9 = trunc i32 %mul to i8, !dbg !92
  store i8 %conv9, i8* %result, align 1, !dbg !91
  %4 = load i8, i8* %result, align 1, !dbg !95
  call void @printHexCharLine(i8 signext %4), !dbg !96
  br label %if.end, !dbg !97

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([54 x i8], [54 x i8]* @.str.4, i32 0, i32 0)), !dbg !98
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !100
}

; Function Attrs: nounwind readnone
declare i32 @abs(i32) #3

; Function Attrs: nounwind
declare double @sqrt(double) #4

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !101 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @good32(), !dbg !104
  call void @bad32(), !dbg !105
  ret i32 1, !dbg !106
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
!1 = !DIFile(filename: "190_32.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/190")
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
!12 = !DIFile(filename: "./190_32.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/190")
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
!57 = distinct !DISubprogram(name: "bad32", scope: !12, file: !12, line: 33, type: !58, isLocal: false, isDefinition: true, scopeLine: 34, isOptimized: false, unit: !0, variables: !2)
!58 = !DISubroutineType(types: !59)
!59 = !{null}
!60 = !DILocalVariable(name: "data", scope: !57, file: !12, line: 35, type: !15)
!61 = !DILocation(line: 35, column: 10, scope: !57)
!62 = !DILocation(line: 36, column: 10, scope: !57)
!63 = !DILocation(line: 38, column: 13, scope: !57)
!64 = !DILocation(line: 38, column: 5, scope: !57)
!65 = !DILocalVariable(name: "result", scope: !66, file: !12, line: 41, type: !15)
!66 = distinct !DILexicalBlock(scope: !57, file: !12, line: 39, column: 5)
!67 = !DILocation(line: 41, column: 14, scope: !66)
!68 = !DILocation(line: 41, column: 23, scope: !66)
!69 = !DILocation(line: 41, column: 30, scope: !66)
!70 = !DILocation(line: 41, column: 28, scope: !66)
!71 = !DILocation(line: 42, column: 26, scope: !66)
!72 = !DILocation(line: 42, column: 9, scope: !66)
!73 = !DILocation(line: 44, column: 1, scope: !57)
!74 = distinct !DISubprogram(name: "good32", scope: !12, file: !12, line: 46, type: !58, isLocal: false, isDefinition: true, scopeLine: 47, isOptimized: false, unit: !0, variables: !2)
!75 = !DILocalVariable(name: "data", scope: !74, file: !12, line: 48, type: !15)
!76 = !DILocation(line: 48, column: 10, scope: !74)
!77 = !DILocation(line: 49, column: 10, scope: !74)
!78 = !DILocation(line: 51, column: 13, scope: !74)
!79 = !DILocation(line: 51, column: 5, scope: !74)
!80 = !DILocation(line: 53, column: 19, scope: !81)
!81 = distinct !DILexicalBlock(scope: !74, file: !12, line: 53, column: 9)
!82 = !DILocation(line: 53, column: 13, scope: !81)
!83 = !DILocation(line: 53, column: 9, scope: !81)
!84 = !DILocation(line: 53, column: 34, scope: !85)
!85 = !DILexicalBlockFile(scope: !81, file: !12, discriminator: 1)
!86 = !DILocation(line: 53, column: 28, scope: !81)
!87 = !DILocation(line: 53, column: 25, scope: !81)
!88 = !DILocation(line: 53, column: 9, scope: !74)
!89 = !DILocalVariable(name: "result", scope: !90, file: !12, line: 55, type: !15)
!90 = distinct !DILexicalBlock(scope: !81, file: !12, line: 54, column: 5)
!91 = !DILocation(line: 55, column: 14, scope: !90)
!92 = !DILocation(line: 55, column: 23, scope: !90)
!93 = !DILocation(line: 55, column: 30, scope: !90)
!94 = !DILocation(line: 55, column: 28, scope: !90)
!95 = !DILocation(line: 56, column: 26, scope: !90)
!96 = !DILocation(line: 56, column: 9, scope: !90)
!97 = !DILocation(line: 57, column: 5, scope: !90)
!98 = !DILocation(line: 60, column: 9, scope: !99)
!99 = distinct !DILexicalBlock(scope: !81, file: !12, line: 59, column: 5)
!100 = !DILocation(line: 62, column: 1, scope: !74)
!101 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 64, type: !102, isLocal: false, isDefinition: true, scopeLine: 64, isOptimized: false, unit: !0, variables: !2)
!102 = !DISubroutineType(types: !103)
!103 = !{!4}
!104 = !DILocation(line: 65, column: 5, scope: !101)
!105 = !DILocation(line: 66, column: 5, scope: !101)
!106 = !DILocation(line: 67, column: 5, scope: !101)
