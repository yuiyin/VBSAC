; ModuleID = './369_8.c'
source_filename = "./369_8.c"
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
define void @bad8() #0 !dbg !36 {
entry:
  %data = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !39, metadata !16), !dbg !40
  store i32 -1, i32* %data, align 4, !dbg !41
  %call = call i32 @staticReturnsTrue(), !dbg !42
  %tobool = icmp ne i32 %call, 0, !dbg !42
  br i1 %tobool, label %if.then, label %if.end, !dbg !44

if.then:                                          ; preds = %entry
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !45
  %call1 = call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* %0, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.2, i32 0, i32 0), i32* %data), !dbg !47
  br label %if.end, !dbg !48

if.end:                                           ; preds = %if.then, %entry
  %call2 = call i32 @staticReturnsTrue(), !dbg !49
  %tobool3 = icmp ne i32 %call2, 0, !dbg !49
  br i1 %tobool3, label %if.then4, label %if.end5, !dbg !51

if.then4:                                         ; preds = %if.end
  %1 = load i32, i32* %data, align 4, !dbg !52
  %div = sdiv i32 100, %1, !dbg !54
  call void @printIntLine(i32 %div), !dbg !55
  br label %if.end5, !dbg !56

if.end5:                                          ; preds = %if.then4, %if.end
  ret void, !dbg !57
}

declare i32 @__isoc99_fscanf(%struct._IO_FILE*, i8*, ...) #2

; Function Attrs: nounwind uwtable
define void @good8() #0 !dbg !58 {
entry:
  %data = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !59, metadata !16), !dbg !60
  store i32 -1, i32* %data, align 4, !dbg !61
  %call = call i32 @staticReturnsTrue(), !dbg !62
  %tobool = icmp ne i32 %call, 0, !dbg !62
  br i1 %tobool, label %if.then, label %if.end, !dbg !64

if.then:                                          ; preds = %entry
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !65
  %call1 = call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* %0, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.2, i32 0, i32 0), i32* %data), !dbg !67
  br label %if.end, !dbg !68

if.end:                                           ; preds = %if.then, %entry
  %call2 = call i32 @staticReturnsFalse(), !dbg !69
  %tobool3 = icmp ne i32 %call2, 0, !dbg !69
  br i1 %tobool3, label %if.then4, label %if.else, !dbg !71

if.then4:                                         ; preds = %if.end
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.3, i32 0, i32 0)), !dbg !72
  br label %if.end8, !dbg !74

if.else:                                          ; preds = %if.end
  %1 = load i32, i32* %data, align 4, !dbg !75
  %cmp = icmp ne i32 %1, 0, !dbg !78
  br i1 %cmp, label %if.then5, label %if.else6, !dbg !79

if.then5:                                         ; preds = %if.else
  %2 = load i32, i32* %data, align 4, !dbg !80
  %div = sdiv i32 100, %2, !dbg !82
  call void @printIntLine(i32 %div), !dbg !83
  br label %if.end7, !dbg !84

if.else6:                                         ; preds = %if.else
  call void @printLine(i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.str.4, i32 0, i32 0)), !dbg !85
  br label %if.end7

if.end7:                                          ; preds = %if.else6, %if.then5
  br label %if.end8

if.end8:                                          ; preds = %if.end7, %if.then4
  ret void, !dbg !87
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !88 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @bad8(), !dbg !91
  call void @good8(), !dbg !92
  ret i32 1, !dbg !93
}

; Function Attrs: nounwind uwtable
define internal i32 @staticReturnsTrue() #0 !dbg !94 {
entry:
  ret i32 1, !dbg !95
}

; Function Attrs: nounwind uwtable
define internal i32 @staticReturnsFalse() #0 !dbg !96 {
entry:
  ret i32 0, !dbg !97
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6}
!llvm.ident = !{!7}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (tags/RELEASE_390/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3)
!1 = !DIFile(filename: "369_8.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/369")
!2 = !{}
!3 = !{!4}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64, align: 64)
!5 = !{i32 2, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{!"clang version 3.9.0 (tags/RELEASE_390/final)"}
!8 = distinct !DISubprogram(name: "printLine", scope: !9, file: !9, line: 10, type: !10, isLocal: false, isDefinition: true, scopeLine: 11, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!9 = !DIFile(filename: "./369_8.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/369")
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
!36 = distinct !DISubprogram(name: "bad8", scope: !9, file: !9, line: 40, type: !37, isLocal: false, isDefinition: true, scopeLine: 41, isOptimized: false, unit: !0, variables: !2)
!37 = !DISubroutineType(types: !38)
!38 = !{null}
!39 = !DILocalVariable(name: "data", scope: !36, file: !9, line: 42, type: !30)
!40 = !DILocation(line: 42, column: 9, scope: !36)
!41 = !DILocation(line: 44, column: 10, scope: !36)
!42 = !DILocation(line: 45, column: 8, scope: !43)
!43 = distinct !DILexicalBlock(scope: !36, file: !9, line: 45, column: 8)
!44 = !DILocation(line: 45, column: 8, scope: !36)
!45 = !DILocation(line: 48, column: 16, scope: !46)
!46 = distinct !DILexicalBlock(scope: !43, file: !9, line: 46, column: 5)
!47 = !DILocation(line: 48, column: 9, scope: !46)
!48 = !DILocation(line: 49, column: 5, scope: !46)
!49 = !DILocation(line: 50, column: 8, scope: !50)
!50 = distinct !DILexicalBlock(scope: !36, file: !9, line: 50, column: 8)
!51 = !DILocation(line: 50, column: 8, scope: !36)
!52 = !DILocation(line: 53, column: 28, scope: !53)
!53 = distinct !DILexicalBlock(scope: !50, file: !9, line: 51, column: 5)
!54 = !DILocation(line: 53, column: 26, scope: !53)
!55 = !DILocation(line: 53, column: 9, scope: !53)
!56 = !DILocation(line: 54, column: 5, scope: !53)
!57 = !DILocation(line: 55, column: 1, scope: !36)
!58 = distinct !DISubprogram(name: "good8", scope: !9, file: !9, line: 60, type: !37, isLocal: false, isDefinition: true, scopeLine: 61, isOptimized: false, unit: !0, variables: !2)
!59 = !DILocalVariable(name: "data", scope: !58, file: !9, line: 62, type: !30)
!60 = !DILocation(line: 62, column: 9, scope: !58)
!61 = !DILocation(line: 64, column: 10, scope: !58)
!62 = !DILocation(line: 65, column: 8, scope: !63)
!63 = distinct !DILexicalBlock(scope: !58, file: !9, line: 65, column: 8)
!64 = !DILocation(line: 65, column: 8, scope: !58)
!65 = !DILocation(line: 68, column: 16, scope: !66)
!66 = distinct !DILexicalBlock(scope: !63, file: !9, line: 66, column: 5)
!67 = !DILocation(line: 68, column: 9, scope: !66)
!68 = !DILocation(line: 69, column: 5, scope: !66)
!69 = !DILocation(line: 70, column: 8, scope: !70)
!70 = distinct !DILexicalBlock(scope: !58, file: !9, line: 70, column: 8)
!71 = !DILocation(line: 70, column: 8, scope: !58)
!72 = !DILocation(line: 73, column: 9, scope: !73)
!73 = distinct !DILexicalBlock(scope: !70, file: !9, line: 71, column: 5)
!74 = !DILocation(line: 74, column: 5, scope: !73)
!75 = !DILocation(line: 78, column: 13, scope: !76)
!76 = distinct !DILexicalBlock(scope: !77, file: !9, line: 78, column: 13)
!77 = distinct !DILexicalBlock(scope: !70, file: !9, line: 76, column: 5)
!78 = !DILocation(line: 78, column: 18, scope: !76)
!79 = !DILocation(line: 78, column: 13, scope: !77)
!80 = !DILocation(line: 80, column: 32, scope: !81)
!81 = distinct !DILexicalBlock(scope: !76, file: !9, line: 79, column: 9)
!82 = !DILocation(line: 80, column: 30, scope: !81)
!83 = !DILocation(line: 80, column: 13, scope: !81)
!84 = !DILocation(line: 81, column: 9, scope: !81)
!85 = !DILocation(line: 84, column: 13, scope: !86)
!86 = distinct !DILexicalBlock(scope: !76, file: !9, line: 83, column: 9)
!87 = !DILocation(line: 87, column: 1, scope: !58)
!88 = distinct !DISubprogram(name: "main", scope: !9, file: !9, line: 90, type: !89, isLocal: false, isDefinition: true, scopeLine: 90, isOptimized: false, unit: !0, variables: !2)
!89 = !DISubroutineType(types: !90)
!90 = !{!30}
!91 = !DILocation(line: 91, column: 2, scope: !88)
!92 = !DILocation(line: 92, column: 2, scope: !88)
!93 = !DILocation(line: 93, column: 5, scope: !88)
!94 = distinct !DISubprogram(name: "staticReturnsTrue", scope: !9, file: !9, line: 23, type: !89, isLocal: true, isDefinition: true, scopeLine: 24, isOptimized: false, unit: !0, variables: !2)
!95 = !DILocation(line: 25, column: 5, scope: !94)
!96 = distinct !DISubprogram(name: "staticReturnsFalse", scope: !9, file: !9, line: 28, type: !89, isLocal: true, isDefinition: true, scopeLine: 29, isOptimized: false, unit: !0, variables: !2)
!97 = !DILocation(line: 30, column: 5, scope: !96)
