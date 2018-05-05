; ModuleID = './369_40.c'
source_filename = "./369_40.c"
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
define void @bad40() #0 !dbg !54 {
entry:
  %data = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !57, metadata !35), !dbg !58
  store i32 -1, i32* %data, align 4, !dbg !59
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !60
  %call = call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* %0, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.2, i32 0, i32 0), i32* %data), !dbg !61
  %1 = load i32, i32* %data, align 4, !dbg !62
  %rem = srem i32 100, %1, !dbg !63
  call void @printIntLine(i32 %rem), !dbg !64
  ret void, !dbg !65
}

declare i32 @__isoc99_fscanf(%struct._IO_FILE*, i8*, ...) #3

; Function Attrs: nounwind uwtable
define void @good40() #0 !dbg !66 {
entry:
  %data = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !67, metadata !35), !dbg !68
  store i32 -1, i32* %data, align 4, !dbg !69
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !70
  %call = call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* %0, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.2, i32 0, i32 0), i32* %data), !dbg !71
  %1 = load i32, i32* %data, align 4, !dbg !72
  %cmp = icmp ne i32 %1, 0, !dbg !74
  br i1 %cmp, label %if.then, label %if.else, !dbg !75

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %data, align 4, !dbg !76
  %rem = srem i32 100, %2, !dbg !78
  call void @printIntLine(i32 %rem), !dbg !79
  br label %if.end, !dbg !80

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.str.3, i32 0, i32 0)), !dbg !81
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !83
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !84 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @good40(), !dbg !85
  call void @bad40(), !dbg !86
  ret i32 1, !dbg !87
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
!1 = !DIFile(filename: "369_40.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/369")
!2 = !{}
!3 = !{!4}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64, align: 64)
!5 = !{!6, !10, !11, !12, !13, !14}
!6 = distinct !DIGlobalVariable(name: "GLOBAL_CONST_TRUE", scope: !0, file: !7, line: 10, type: !8, isLocal: false, isDefinition: true, variable: i32* @GLOBAL_CONST_TRUE)
!7 = !DIFile(filename: "./369_40.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/369")
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
!54 = distinct !DISubprogram(name: "bad40", scope: !7, file: !7, line: 51, type: !55, isLocal: false, isDefinition: true, scopeLine: 52, isOptimized: false, unit: !0, variables: !2)
!55 = !DISubroutineType(types: !56)
!56 = !{null}
!57 = !DILocalVariable(name: "data", scope: !54, file: !7, line: 53, type: !9)
!58 = !DILocation(line: 53, column: 9, scope: !54)
!59 = !DILocation(line: 55, column: 10, scope: !54)
!60 = !DILocation(line: 60, column: 16, scope: !54)
!61 = !DILocation(line: 60, column: 9, scope: !54)
!62 = !DILocation(line: 71, column: 28, scope: !54)
!63 = !DILocation(line: 71, column: 26, scope: !54)
!64 = !DILocation(line: 71, column: 9, scope: !54)
!65 = !DILocation(line: 78, column: 1, scope: !54)
!66 = distinct !DISubprogram(name: "good40", scope: !7, file: !7, line: 83, type: !55, isLocal: false, isDefinition: true, scopeLine: 84, isOptimized: false, unit: !0, variables: !2)
!67 = !DILocalVariable(name: "data", scope: !66, file: !7, line: 85, type: !9)
!68 = !DILocation(line: 85, column: 9, scope: !66)
!69 = !DILocation(line: 87, column: 10, scope: !66)
!70 = !DILocation(line: 92, column: 16, scope: !66)
!71 = !DILocation(line: 92, column: 9, scope: !66)
!72 = !DILocation(line: 107, column: 13, scope: !73)
!73 = distinct !DILexicalBlock(scope: !66, file: !7, line: 107, column: 13)
!74 = !DILocation(line: 107, column: 18, scope: !73)
!75 = !DILocation(line: 107, column: 13, scope: !66)
!76 = !DILocation(line: 109, column: 32, scope: !77)
!77 = distinct !DILexicalBlock(scope: !73, file: !7, line: 108, column: 9)
!78 = !DILocation(line: 109, column: 30, scope: !77)
!79 = !DILocation(line: 109, column: 13, scope: !77)
!80 = !DILocation(line: 110, column: 9, scope: !77)
!81 = !DILocation(line: 113, column: 13, scope: !82)
!82 = distinct !DILexicalBlock(scope: !73, file: !7, line: 112, column: 9)
!83 = !DILocation(line: 117, column: 1, scope: !66)
!84 = distinct !DISubprogram(name: "main", scope: !7, file: !7, line: 120, type: !19, isLocal: false, isDefinition: true, scopeLine: 120, isOptimized: false, unit: !0, variables: !2)
!85 = !DILocation(line: 121, column: 5, scope: !84)
!86 = !DILocation(line: 122, column: 5, scope: !84)
!87 = !DILocation(line: 123, column: 5, scope: !84)
