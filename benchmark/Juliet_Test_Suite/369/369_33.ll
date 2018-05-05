; ModuleID = './369_33.c'
source_filename = "./369_33.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1
@.str.1 = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@stdin = external global %struct._IO_FILE*, align 8
@.str.2 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.3 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@.str.4 = private unnamed_addr constant [38 x i8] c"This would result in a divide by zero\00", align 1

; Function Attrs: nounwind uwtable
define void @printLine(i8* %line) #0 !dbg !8 {
entry:
  %line.addr = alloca i8*, align 8
  store i8* %line, i8** %line.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %line.addr, metadata !15, metadata !16), !dbg !17
  %0 = load i8*, i8** %line.addr, align 8, !dbg !18
  %cmp = icmp ne i8* %0, null, !dbg !20
  br i1 %cmp, label %if.then, label %if.end, !dbg !21

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** %line.addr, align 8, !dbg !22
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), i8* %1), !dbg !24
  br label %if.end, !dbg !25

if.end:                                           ; preds = %if.then, %entry
  ret void, !dbg !26
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @printf(i8*, ...) #2

; Function Attrs: nounwind uwtable
define void @printIntLine(i32 %intNumber) #0 !dbg !27 {
entry:
  %intNumber.addr = alloca i32, align 4
  store i32 %intNumber, i32* %intNumber.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %intNumber.addr, metadata !31, metadata !16), !dbg !32
  %0 = load i32, i32* %intNumber.addr, align 4, !dbg !33
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i32 0, i32 0), i32 %0), !dbg !34
  ret void, !dbg !35
}

; Function Attrs: nounwind uwtable
define i32 @staticReturnsTrue() #0 !dbg !36 {
entry:
  ret i32 1, !dbg !39
}

; Function Attrs: nounwind uwtable
define i32 @staticReturnsFalse() #0 !dbg !40 {
entry:
  ret i32 0, !dbg !41
}

; Function Attrs: nounwind uwtable
define void @bad33() #0 !dbg !42 {
entry:
  %data = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !45, metadata !16), !dbg !46
  store i32 -1, i32* %data, align 4, !dbg !47
  %call = call i32 @staticReturnsTrue(), !dbg !48
  %tobool = icmp ne i32 %call, 0, !dbg !48
  br i1 %tobool, label %if.then, label %if.end, !dbg !50

if.then:                                          ; preds = %entry
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !51
  %call1 = call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* %0, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.2, i32 0, i32 0), i32* %data), !dbg !53
  br label %if.end, !dbg !54

if.end:                                           ; preds = %if.then, %entry
  %call2 = call i32 @staticReturnsTrue(), !dbg !55
  %tobool3 = icmp ne i32 %call2, 0, !dbg !55
  br i1 %tobool3, label %if.then4, label %if.end5, !dbg !57

if.then4:                                         ; preds = %if.end
  %1 = load i32, i32* %data, align 4, !dbg !58
  %rem = srem i32 100, %1, !dbg !60
  call void @printIntLine(i32 %rem), !dbg !61
  br label %if.end5, !dbg !62

if.end5:                                          ; preds = %if.then4, %if.end
  ret void, !dbg !63
}

declare i32 @__isoc99_fscanf(%struct._IO_FILE*, i8*, ...) #2

; Function Attrs: nounwind uwtable
define void @good33() #0 !dbg !64 {
entry:
  %data = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !65, metadata !16), !dbg !66
  store i32 -1, i32* %data, align 4, !dbg !67
  %call = call i32 @staticReturnsTrue(), !dbg !68
  %tobool = icmp ne i32 %call, 0, !dbg !68
  br i1 %tobool, label %if.then, label %if.end, !dbg !70

if.then:                                          ; preds = %entry
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !71
  %call1 = call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* %0, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.2, i32 0, i32 0), i32* %data), !dbg !73
  br label %if.end, !dbg !74

if.end:                                           ; preds = %if.then, %entry
  %call2 = call i32 @staticReturnsFalse(), !dbg !75
  %tobool3 = icmp ne i32 %call2, 0, !dbg !75
  br i1 %tobool3, label %if.then4, label %if.else, !dbg !77

if.then4:                                         ; preds = %if.end
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.3, i32 0, i32 0)), !dbg !78
  br label %if.end8, !dbg !80

if.else:                                          ; preds = %if.end
  %1 = load i32, i32* %data, align 4, !dbg !81
  %cmp = icmp ne i32 %1, 0, !dbg !84
  br i1 %cmp, label %if.then5, label %if.else6, !dbg !85

if.then5:                                         ; preds = %if.else
  %2 = load i32, i32* %data, align 4, !dbg !86
  %rem = srem i32 100, %2, !dbg !88
  call void @printIntLine(i32 %rem), !dbg !89
  br label %if.end7, !dbg !90

if.else6:                                         ; preds = %if.else
  call void @printLine(i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.str.4, i32 0, i32 0)), !dbg !91
  br label %if.end7

if.end7:                                          ; preds = %if.else6, %if.then5
  br label %if.end8

if.end8:                                          ; preds = %if.end7, %if.then4
  ret void, !dbg !93
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !94 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @good33(), !dbg !95
  call void @bad33(), !dbg !96
  ret i32 1, !dbg !97
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6}
!llvm.ident = !{!7}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (tags/RELEASE_390/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3)
!1 = !DIFile(filename: "369_33.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/369")
!2 = !{}
!3 = !{!4}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64, align: 64)
!5 = !{i32 2, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{!"clang version 3.9.0 (tags/RELEASE_390/final)"}
!8 = distinct !DISubprogram(name: "printLine", scope: !9, file: !9, line: 10, type: !10, isLocal: false, isDefinition: true, scopeLine: 11, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!9 = !DIFile(filename: "./369_33.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/369")
!10 = !DISubroutineType(types: !11)
!11 = !{null, !12}
!12 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !13, size: 64, align: 64)
!13 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !14)
!14 = !DIBasicType(name: "char", size: 8, align: 8, encoding: DW_ATE_signed_char)
!15 = !DILocalVariable(name: "line", arg: 1, scope: !8, file: !9, line: 10, type: !12)
!16 = !DIExpression()
!17 = !DILocation(line: 10, column: 30, scope: !8)
!18 = !DILocation(line: 12, column: 8, scope: !19)
!19 = distinct !DILexicalBlock(scope: !8, file: !9, line: 12, column: 8)
!20 = !DILocation(line: 12, column: 13, scope: !19)
!21 = !DILocation(line: 12, column: 8, scope: !8)
!22 = !DILocation(line: 14, column: 24, scope: !23)
!23 = distinct !DILexicalBlock(scope: !19, file: !9, line: 13, column: 5)
!24 = !DILocation(line: 14, column: 9, scope: !23)
!25 = !DILocation(line: 15, column: 5, scope: !23)
!26 = !DILocation(line: 16, column: 1, scope: !8)
!27 = distinct !DISubprogram(name: "printIntLine", scope: !9, file: !9, line: 18, type: !28, isLocal: false, isDefinition: true, scopeLine: 19, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!28 = !DISubroutineType(types: !29)
!29 = !{null, !30}
!30 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!31 = !DILocalVariable(name: "intNumber", arg: 1, scope: !27, file: !9, line: 18, type: !30)
!32 = !DILocation(line: 18, column: 24, scope: !27)
!33 = !DILocation(line: 20, column: 20, scope: !27)
!34 = !DILocation(line: 20, column: 5, scope: !27)
!35 = !DILocation(line: 21, column: 1, scope: !27)
!36 = distinct !DISubprogram(name: "staticReturnsTrue", scope: !9, file: !9, line: 23, type: !37, isLocal: false, isDefinition: true, scopeLine: 23, isOptimized: false, unit: !0, variables: !2)
!37 = !DISubroutineType(types: !38)
!38 = !{!30}
!39 = !DILocation(line: 24, column: 5, scope: !36)
!40 = distinct !DISubprogram(name: "staticReturnsFalse", scope: !9, file: !9, line: 27, type: !37, isLocal: false, isDefinition: true, scopeLine: 27, isOptimized: false, unit: !0, variables: !2)
!41 = !DILocation(line: 28, column: 5, scope: !40)
!42 = distinct !DISubprogram(name: "bad33", scope: !9, file: !9, line: 33, type: !43, isLocal: false, isDefinition: true, scopeLine: 34, isOptimized: false, unit: !0, variables: !2)
!43 = !DISubroutineType(types: !44)
!44 = !{null}
!45 = !DILocalVariable(name: "data", scope: !42, file: !9, line: 35, type: !30)
!46 = !DILocation(line: 35, column: 9, scope: !42)
!47 = !DILocation(line: 37, column: 10, scope: !42)
!48 = !DILocation(line: 38, column: 8, scope: !49)
!49 = distinct !DILexicalBlock(scope: !42, file: !9, line: 38, column: 8)
!50 = !DILocation(line: 38, column: 8, scope: !42)
!51 = !DILocation(line: 41, column: 16, scope: !52)
!52 = distinct !DILexicalBlock(scope: !49, file: !9, line: 39, column: 5)
!53 = !DILocation(line: 41, column: 9, scope: !52)
!54 = !DILocation(line: 42, column: 5, scope: !52)
!55 = !DILocation(line: 43, column: 8, scope: !56)
!56 = distinct !DILexicalBlock(scope: !42, file: !9, line: 43, column: 8)
!57 = !DILocation(line: 43, column: 8, scope: !42)
!58 = !DILocation(line: 46, column: 28, scope: !59)
!59 = distinct !DILexicalBlock(scope: !56, file: !9, line: 44, column: 5)
!60 = !DILocation(line: 46, column: 26, scope: !59)
!61 = !DILocation(line: 46, column: 9, scope: !59)
!62 = !DILocation(line: 47, column: 5, scope: !59)
!63 = !DILocation(line: 48, column: 1, scope: !42)
!64 = distinct !DISubprogram(name: "good33", scope: !9, file: !9, line: 53, type: !43, isLocal: false, isDefinition: true, scopeLine: 54, isOptimized: false, unit: !0, variables: !2)
!65 = !DILocalVariable(name: "data", scope: !64, file: !9, line: 55, type: !30)
!66 = !DILocation(line: 55, column: 9, scope: !64)
!67 = !DILocation(line: 57, column: 10, scope: !64)
!68 = !DILocation(line: 58, column: 8, scope: !69)
!69 = distinct !DILexicalBlock(scope: !64, file: !9, line: 58, column: 8)
!70 = !DILocation(line: 58, column: 8, scope: !64)
!71 = !DILocation(line: 61, column: 16, scope: !72)
!72 = distinct !DILexicalBlock(scope: !69, file: !9, line: 59, column: 5)
!73 = !DILocation(line: 61, column: 9, scope: !72)
!74 = !DILocation(line: 62, column: 5, scope: !72)
!75 = !DILocation(line: 63, column: 8, scope: !76)
!76 = distinct !DILexicalBlock(scope: !64, file: !9, line: 63, column: 8)
!77 = !DILocation(line: 63, column: 8, scope: !64)
!78 = !DILocation(line: 66, column: 9, scope: !79)
!79 = distinct !DILexicalBlock(scope: !76, file: !9, line: 64, column: 5)
!80 = !DILocation(line: 67, column: 5, scope: !79)
!81 = !DILocation(line: 71, column: 13, scope: !82)
!82 = distinct !DILexicalBlock(scope: !83, file: !9, line: 71, column: 13)
!83 = distinct !DILexicalBlock(scope: !76, file: !9, line: 69, column: 5)
!84 = !DILocation(line: 71, column: 18, scope: !82)
!85 = !DILocation(line: 71, column: 13, scope: !83)
!86 = !DILocation(line: 73, column: 32, scope: !87)
!87 = distinct !DILexicalBlock(scope: !82, file: !9, line: 72, column: 9)
!88 = !DILocation(line: 73, column: 30, scope: !87)
!89 = !DILocation(line: 73, column: 13, scope: !87)
!90 = !DILocation(line: 74, column: 9, scope: !87)
!91 = !DILocation(line: 77, column: 13, scope: !92)
!92 = distinct !DILexicalBlock(scope: !82, file: !9, line: 76, column: 9)
!93 = !DILocation(line: 80, column: 1, scope: !64)
!94 = distinct !DISubprogram(name: "main", scope: !9, file: !9, line: 83, type: !37, isLocal: false, isDefinition: true, scopeLine: 83, isOptimized: false, unit: !0, variables: !2)
!95 = !DILocation(line: 84, column: 5, scope: !94)
!96 = !DILocation(line: 85, column: 5, scope: !94)
!97 = !DILocation(line: 86, column: 5, scope: !94)
