; ModuleID = './369_15.c'
source_filename = "./369_15.c"
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
define void @bad15() #0 !dbg !50 {
entry:
  %data = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !53, metadata !25), !dbg !54
  store i32 -1, i32* %data, align 4, !dbg !55
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !56
  %call = call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* %0, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.2, i32 0, i32 0), i32* %data), !dbg !57
  %1 = load i32, i32* %data, align 4, !dbg !58
  %div = sdiv i32 100, %1, !dbg !59
  call void @printIntLine(i32 %div), !dbg !60
  ret void, !dbg !61
}

declare i32 @__isoc99_fscanf(%struct._IO_FILE*, i8*, ...) #2

; Function Attrs: nounwind uwtable
define void @good15() #0 !dbg !62 {
entry:
  %data = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !63, metadata !25), !dbg !64
  store i32 -1, i32* %data, align 4, !dbg !65
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !66
  %call = call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* %0, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.2, i32 0, i32 0), i32* %data), !dbg !67
  %1 = load i32, i32* %data, align 4, !dbg !68
  %cmp = icmp ne i32 %1, 0, !dbg !70
  br i1 %cmp, label %if.then, label %if.else, !dbg !71

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %data, align 4, !dbg !72
  %div = sdiv i32 100, %2, !dbg !74
  call void @printIntLine(i32 %div), !dbg !75
  br label %if.end, !dbg !76

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.str.3, i32 0, i32 0)), !dbg !77
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !79
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !80 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @good15(), !dbg !81
  call void @bad15(), !dbg !82
  ret i32 1, !dbg !83
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
!1 = !DIFile(filename: "369_15.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/369")
!2 = !{}
!3 = !{!4}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64, align: 64)
!5 = !{!6, !10, !11, !12, !13, !14}
!6 = distinct !DIGlobalVariable(name: "GLOBAL_CONST_TRUE", scope: !0, file: !7, line: 10, type: !8, isLocal: false, isDefinition: true, variable: i32* @GLOBAL_CONST_TRUE)
!7 = !DIFile(filename: "./369_15.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/369")
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
!44 = distinct !DISubprogram(name: "globalReturnsTrueOrFalse", scope: !7, file: !7, line: 32, type: !45, isLocal: false, isDefinition: true, scopeLine: 33, isOptimized: false, unit: !0, variables: !2)
!45 = !DISubroutineType(types: !46)
!46 = !{!9}
!47 = !DILocation(line: 34, column: 13, scope: !44)
!48 = !DILocation(line: 34, column: 20, scope: !44)
!49 = !DILocation(line: 34, column: 5, scope: !44)
!50 = distinct !DISubprogram(name: "bad15", scope: !7, file: !7, line: 41, type: !51, isLocal: false, isDefinition: true, scopeLine: 42, isOptimized: false, unit: !0, variables: !2)
!51 = !DISubroutineType(types: !52)
!52 = !{null}
!53 = !DILocalVariable(name: "data", scope: !50, file: !7, line: 43, type: !9)
!54 = !DILocation(line: 43, column: 9, scope: !50)
!55 = !DILocation(line: 45, column: 10, scope: !50)
!56 = !DILocation(line: 50, column: 16, scope: !50)
!57 = !DILocation(line: 50, column: 9, scope: !50)
!58 = !DILocation(line: 61, column: 28, scope: !50)
!59 = !DILocation(line: 61, column: 26, scope: !50)
!60 = !DILocation(line: 61, column: 9, scope: !50)
!61 = !DILocation(line: 68, column: 1, scope: !50)
!62 = distinct !DISubprogram(name: "good15", scope: !7, file: !7, line: 73, type: !51, isLocal: false, isDefinition: true, scopeLine: 74, isOptimized: false, unit: !0, variables: !2)
!63 = !DILocalVariable(name: "data", scope: !62, file: !7, line: 75, type: !9)
!64 = !DILocation(line: 75, column: 9, scope: !62)
!65 = !DILocation(line: 77, column: 10, scope: !62)
!66 = !DILocation(line: 82, column: 16, scope: !62)
!67 = !DILocation(line: 82, column: 9, scope: !62)
!68 = !DILocation(line: 97, column: 13, scope: !69)
!69 = distinct !DILexicalBlock(scope: !62, file: !7, line: 97, column: 13)
!70 = !DILocation(line: 97, column: 18, scope: !69)
!71 = !DILocation(line: 97, column: 13, scope: !62)
!72 = !DILocation(line: 99, column: 32, scope: !73)
!73 = distinct !DILexicalBlock(scope: !69, file: !7, line: 98, column: 9)
!74 = !DILocation(line: 99, column: 30, scope: !73)
!75 = !DILocation(line: 99, column: 13, scope: !73)
!76 = !DILocation(line: 100, column: 9, scope: !73)
!77 = !DILocation(line: 103, column: 13, scope: !78)
!78 = distinct !DILexicalBlock(scope: !69, file: !7, line: 102, column: 9)
!79 = !DILocation(line: 107, column: 1, scope: !62)
!80 = distinct !DISubprogram(name: "main", scope: !7, file: !7, line: 110, type: !45, isLocal: false, isDefinition: true, scopeLine: 110, isOptimized: false, unit: !0, variables: !2)
!81 = !DILocation(line: 111, column: 2, scope: !80)
!82 = !DILocation(line: 112, column: 5, scope: !80)
!83 = !DILocation(line: 113, column: 5, scope: !80)
