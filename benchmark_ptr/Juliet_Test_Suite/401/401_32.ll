; ModuleID = './401_32.c'
source_filename = "./401_32.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@GLOBAL_CONST_TRUE = constant i32 1, align 4
@GLOBAL_CONST_FALSE = constant i32 0, align 4
@GLOBAL_CONST_FIVE = constant i32 5, align 4
@globalTrue = global i32 1, align 4
@globalFalse = global i32 0, align 4
@globalFive = global i32 5, align 4
@.str = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1
@.str.1 = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@.str.2 = private unnamed_addr constant [9 x i8] c"A String\00", align 1

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
  %call = call i32 @rand() #4, !dbg !27
  %rem = srem i32 %call, 2, !dbg !28
  ret i32 %rem, !dbg !29
}

; Function Attrs: nounwind
declare i32 @rand() #1

; Function Attrs: nounwind uwtable
define void @printLine(i8* %line) #0 !dbg !30 {
entry:
  %line.addr = alloca i8*, align 8
  store i8* %line, i8** %line.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %line.addr, metadata !35, metadata !36), !dbg !37
  %0 = load i8*, i8** %line.addr, align 8, !dbg !38
  %cmp = icmp ne i8* %0, null, !dbg !40
  br i1 %cmp, label %if.then, label %if.end, !dbg !41

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** %line.addr, align 8, !dbg !42
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), i8* %1), !dbg !44
  br label %if.end, !dbg !45

if.end:                                           ; preds = %if.then, %entry
  ret void, !dbg !46
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #2

declare i32 @printf(i8*, ...) #3

; Function Attrs: nounwind uwtable
define void @printIntLine(i32 %intNumber) #0 !dbg !47 {
entry:
  %intNumber.addr = alloca i32, align 4
  store i32 %intNumber, i32* %intNumber.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %intNumber.addr, metadata !50, metadata !36), !dbg !51
  %0 = load i32, i32* %intNumber.addr, align 4, !dbg !52
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i32 0, i32 0), i32 %0), !dbg !53
  ret void, !dbg !54
}

; Function Attrs: nounwind uwtable
define void @bad32() #0 !dbg !55 {
entry:
  %data = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !58, metadata !36), !dbg !59
  store i8* null, i8** %data, align 8, !dbg !60
  %0 = load i8*, i8** %data, align 8, !dbg !61
  %call = call i8* @realloc(i8* %0, i64 100) #4, !dbg !62
  store i8* %call, i8** %data, align 8, !dbg !63
  %1 = load i8*, i8** %data, align 8, !dbg !64
  %cmp = icmp eq i8* %1, null, !dbg !66
  br i1 %cmp, label %if.then, label %if.end, !dbg !67

if.then:                                          ; preds = %entry
  br label %return, !dbg !68

if.end:                                           ; preds = %entry
  %2 = load i8*, i8** %data, align 8, !dbg !70
  %call1 = call i8* @strcpy(i8* %2, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.2, i32 0, i32 0)) #4, !dbg !71
  %3 = load i8*, i8** %data, align 8, !dbg !72
  call void @printLine(i8* %3), !dbg !73
  br label %return, !dbg !74

return:                                           ; preds = %if.end, %if.then
  ret void, !dbg !75
}

; Function Attrs: nounwind
declare i8* @realloc(i8*, i64) #1

; Function Attrs: nounwind
declare i8* @strcpy(i8*, i8*) #1

; Function Attrs: nounwind uwtable
define void @good32() #0 !dbg !77 {
entry:
  %data = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !78, metadata !36), !dbg !79
  store i8* null, i8** %data, align 8, !dbg !80
  %0 = alloca i8, i64 100, !dbg !81
  store i8* %0, i8** %data, align 8, !dbg !82
  %1 = load i8*, i8** %data, align 8, !dbg !83
  %cmp = icmp eq i8* %1, null, !dbg !85
  br i1 %cmp, label %if.then, label %if.end, !dbg !86

if.then:                                          ; preds = %entry
  br label %return, !dbg !87

if.end:                                           ; preds = %entry
  %2 = load i8*, i8** %data, align 8, !dbg !89
  %call = call i8* @strcpy(i8* %2, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.2, i32 0, i32 0)) #4, !dbg !90
  %3 = load i8*, i8** %data, align 8, !dbg !91
  call void @printLine(i8* %3), !dbg !92
  br label %return, !dbg !93

return:                                           ; preds = %if.end, %if.then
  ret void, !dbg !94
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !96 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @good32(), !dbg !97
  call void @bad32(), !dbg !98
  ret i32 1, !dbg !99
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone }
attributes #3 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!17, !18}
!llvm.ident = !{!19}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (tags/RELEASE_390/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, globals: !7)
!1 = !DIFile(filename: "401_32.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/401")
!2 = !{}
!3 = !{!4, !5}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64, align: 64)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64, align: 64)
!6 = !DIBasicType(name: "char", size: 8, align: 8, encoding: DW_ATE_signed_char)
!7 = !{!8, !12, !13, !14, !15, !16}
!8 = distinct !DIGlobalVariable(name: "GLOBAL_CONST_TRUE", scope: !0, file: !9, line: 10, type: !10, isLocal: false, isDefinition: true, variable: i32* @GLOBAL_CONST_TRUE)
!9 = !DIFile(filename: "./401_32.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/401")
!10 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !11)
!11 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!12 = distinct !DIGlobalVariable(name: "GLOBAL_CONST_FALSE", scope: !0, file: !9, line: 11, type: !10, isLocal: false, isDefinition: true, variable: i32* @GLOBAL_CONST_FALSE)
!13 = distinct !DIGlobalVariable(name: "GLOBAL_CONST_FIVE", scope: !0, file: !9, line: 12, type: !10, isLocal: false, isDefinition: true, variable: i32* @GLOBAL_CONST_FIVE)
!14 = distinct !DIGlobalVariable(name: "globalTrue", scope: !0, file: !9, line: 15, type: !11, isLocal: false, isDefinition: true, variable: i32* @globalTrue)
!15 = distinct !DIGlobalVariable(name: "globalFalse", scope: !0, file: !9, line: 16, type: !11, isLocal: false, isDefinition: true, variable: i32* @globalFalse)
!16 = distinct !DIGlobalVariable(name: "globalFive", scope: !0, file: !9, line: 17, type: !11, isLocal: false, isDefinition: true, variable: i32* @globalFive)
!17 = !{i32 2, !"Dwarf Version", i32 4}
!18 = !{i32 2, !"Debug Info Version", i32 3}
!19 = !{!"clang version 3.9.0 (tags/RELEASE_390/final)"}
!20 = distinct !DISubprogram(name: "globalReturnsTrue", scope: !9, file: !9, line: 19, type: !21, isLocal: false, isDefinition: true, scopeLine: 20, isOptimized: false, unit: !0, variables: !2)
!21 = !DISubroutineType(types: !22)
!22 = !{!11}
!23 = !DILocation(line: 21, column: 5, scope: !20)
!24 = distinct !DISubprogram(name: "globalReturnsFalse", scope: !9, file: !9, line: 24, type: !21, isLocal: false, isDefinition: true, scopeLine: 25, isOptimized: false, unit: !0, variables: !2)
!25 = !DILocation(line: 26, column: 5, scope: !24)
!26 = distinct !DISubprogram(name: "globalReturnsTrueOrFalse", scope: !9, file: !9, line: 29, type: !21, isLocal: false, isDefinition: true, scopeLine: 30, isOptimized: false, unit: !0, variables: !2)
!27 = !DILocation(line: 31, column: 13, scope: !26)
!28 = !DILocation(line: 31, column: 20, scope: !26)
!29 = !DILocation(line: 31, column: 5, scope: !26)
!30 = distinct !DISubprogram(name: "printLine", scope: !9, file: !9, line: 34, type: !31, isLocal: false, isDefinition: true, scopeLine: 35, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!31 = !DISubroutineType(types: !32)
!32 = !{null, !33}
!33 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !34, size: 64, align: 64)
!34 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !6)
!35 = !DILocalVariable(name: "line", arg: 1, scope: !30, file: !9, line: 34, type: !33)
!36 = !DIExpression()
!37 = !DILocation(line: 34, column: 30, scope: !30)
!38 = !DILocation(line: 36, column: 8, scope: !39)
!39 = distinct !DILexicalBlock(scope: !30, file: !9, line: 36, column: 8)
!40 = !DILocation(line: 36, column: 13, scope: !39)
!41 = !DILocation(line: 36, column: 8, scope: !30)
!42 = !DILocation(line: 38, column: 24, scope: !43)
!43 = distinct !DILexicalBlock(scope: !39, file: !9, line: 37, column: 5)
!44 = !DILocation(line: 38, column: 9, scope: !43)
!45 = !DILocation(line: 39, column: 5, scope: !43)
!46 = !DILocation(line: 40, column: 1, scope: !30)
!47 = distinct !DISubprogram(name: "printIntLine", scope: !9, file: !9, line: 42, type: !48, isLocal: false, isDefinition: true, scopeLine: 43, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!48 = !DISubroutineType(types: !49)
!49 = !{null, !11}
!50 = !DILocalVariable(name: "intNumber", arg: 1, scope: !47, file: !9, line: 42, type: !11)
!51 = !DILocation(line: 42, column: 24, scope: !47)
!52 = !DILocation(line: 44, column: 20, scope: !47)
!53 = !DILocation(line: 44, column: 5, scope: !47)
!54 = !DILocation(line: 45, column: 1, scope: !47)
!55 = distinct !DISubprogram(name: "bad32", scope: !9, file: !9, line: 49, type: !56, isLocal: false, isDefinition: true, scopeLine: 50, isOptimized: false, unit: !0, variables: !2)
!56 = !DISubroutineType(types: !57)
!57 = !{null}
!58 = !DILocalVariable(name: "data", scope: !55, file: !9, line: 51, type: !5)
!59 = !DILocation(line: 51, column: 12, scope: !55)
!60 = !DILocation(line: 52, column: 10, scope: !55)
!61 = !DILocation(line: 54, column: 28, scope: !55)
!62 = !DILocation(line: 54, column: 20, scope: !55)
!63 = !DILocation(line: 54, column: 10, scope: !55)
!64 = !DILocation(line: 55, column: 9, scope: !65)
!65 = distinct !DILexicalBlock(scope: !55, file: !9, line: 55, column: 9)
!66 = !DILocation(line: 55, column: 14, scope: !65)
!67 = !DILocation(line: 55, column: 9, scope: !55)
!68 = !DILocation(line: 55, column: 23, scope: !69)
!69 = !DILexicalBlockFile(scope: !65, file: !9, discriminator: 1)
!70 = !DILocation(line: 57, column: 12, scope: !55)
!71 = !DILocation(line: 57, column: 5, scope: !55)
!72 = !DILocation(line: 58, column: 15, scope: !55)
!73 = !DILocation(line: 58, column: 5, scope: !55)
!74 = !DILocation(line: 61, column: 1, scope: !55)
!75 = !DILocation(line: 61, column: 1, scope: !76)
!76 = !DILexicalBlockFile(scope: !55, file: !9, discriminator: 1)
!77 = distinct !DISubprogram(name: "good32", scope: !9, file: !9, line: 67, type: !56, isLocal: false, isDefinition: true, scopeLine: 68, isOptimized: false, unit: !0, variables: !2)
!78 = !DILocalVariable(name: "data", scope: !77, file: !9, line: 69, type: !5)
!79 = !DILocation(line: 69, column: 12, scope: !77)
!80 = !DILocation(line: 70, column: 10, scope: !77)
!81 = !DILocation(line: 72, column: 20, scope: !77)
!82 = !DILocation(line: 72, column: 10, scope: !77)
!83 = !DILocation(line: 73, column: 9, scope: !84)
!84 = distinct !DILexicalBlock(scope: !77, file: !9, line: 73, column: 9)
!85 = !DILocation(line: 73, column: 14, scope: !84)
!86 = !DILocation(line: 73, column: 9, scope: !77)
!87 = !DILocation(line: 73, column: 23, scope: !88)
!88 = !DILexicalBlockFile(scope: !84, file: !9, discriminator: 1)
!89 = !DILocation(line: 75, column: 12, scope: !77)
!90 = !DILocation(line: 75, column: 5, scope: !77)
!91 = !DILocation(line: 76, column: 15, scope: !77)
!92 = !DILocation(line: 76, column: 5, scope: !77)
!93 = !DILocation(line: 79, column: 1, scope: !77)
!94 = !DILocation(line: 79, column: 1, scope: !95)
!95 = !DILexicalBlockFile(scope: !77, file: !9, discriminator: 1)
!96 = distinct !DISubprogram(name: "main", scope: !9, file: !9, line: 83, type: !21, isLocal: false, isDefinition: true, scopeLine: 83, isOptimized: false, unit: !0, variables: !2)
!97 = !DILocation(line: 84, column: 5, scope: !96)
!98 = !DILocation(line: 85, column: 2, scope: !96)
!99 = !DILocation(line: 86, column: 5, scope: !96)
