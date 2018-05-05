; ModuleID = './401_43.c'
source_filename = "./401_43.c"
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

; Function Attrs: nounwind uwtable
define i32 @globalReturnsTrue() #0 !dbg !19 {
entry:
  ret i32 1, !dbg !22
}

; Function Attrs: nounwind uwtable
define i32 @globalReturnsFalse() #0 !dbg !23 {
entry:
  ret i32 0, !dbg !24
}

; Function Attrs: nounwind uwtable
define i32 @globalReturnsTrueOrFalse() #0 !dbg !25 {
entry:
  %call = call i32 @rand() #4, !dbg !26
  %rem = srem i32 %call, 2, !dbg !27
  ret i32 %rem, !dbg !28
}

; Function Attrs: nounwind
declare i32 @rand() #1

; Function Attrs: nounwind uwtable
define void @printLine(i8* %line) #0 !dbg !29 {
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
define void @bad43() #0 !dbg !55 {
entry:
  %data = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !58, metadata !36), !dbg !59
  store i32* null, i32** %data, align 8, !dbg !60
  %call = call noalias i8* @calloc(i64 100, i64 4) #4, !dbg !61
  %0 = bitcast i8* %call to i32*, !dbg !62
  store i32* %0, i32** %data, align 8, !dbg !63
  %1 = load i32*, i32** %data, align 8, !dbg !64
  %cmp = icmp eq i32* %1, null, !dbg !66
  br i1 %cmp, label %if.then, label %if.end, !dbg !67

if.then:                                          ; preds = %entry
  br label %return, !dbg !68

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !70
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 0, !dbg !70
  store i32 5, i32* %arrayidx, align 4, !dbg !71
  %3 = load i32*, i32** %data, align 8, !dbg !72
  %arrayidx1 = getelementptr inbounds i32, i32* %3, i64 0, !dbg !72
  %4 = load i32, i32* %arrayidx1, align 4, !dbg !72
  call void @printIntLine(i32 %4), !dbg !73
  br label %return, !dbg !74

return:                                           ; preds = %if.end, %if.then
  ret void, !dbg !75
}

; Function Attrs: nounwind
declare noalias i8* @calloc(i64, i64) #1

; Function Attrs: nounwind uwtable
define void @good43() #0 !dbg !77 {
entry:
  %data = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !78, metadata !36), !dbg !79
  store i32* null, i32** %data, align 8, !dbg !80
  %0 = alloca i8, i64 400, !dbg !81
  %1 = bitcast i8* %0 to i32*, !dbg !82
  store i32* %1, i32** %data, align 8, !dbg !83
  %2 = load i32*, i32** %data, align 8, !dbg !84
  %cmp = icmp eq i32* %2, null, !dbg !86
  br i1 %cmp, label %if.then, label %if.end, !dbg !87

if.then:                                          ; preds = %entry
  br label %return, !dbg !88

if.end:                                           ; preds = %entry
  %3 = load i32*, i32** %data, align 8, !dbg !90
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 0, !dbg !90
  store i32 5, i32* %arrayidx, align 4, !dbg !91
  %4 = load i32*, i32** %data, align 8, !dbg !92
  %arrayidx1 = getelementptr inbounds i32, i32* %4, i64 0, !dbg !92
  %5 = load i32, i32* %arrayidx1, align 4, !dbg !92
  call void @printIntLine(i32 %5), !dbg !93
  br label %return, !dbg !94

return:                                           ; preds = %if.end, %if.then
  ret void, !dbg !95
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !97 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @good43(), !dbg !98
  call void @bad43(), !dbg !99
  ret i32 1, !dbg !100
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone }
attributes #3 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!16, !17}
!llvm.ident = !{!18}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (tags/RELEASE_390/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, globals: !7)
!1 = !DIFile(filename: "401_43.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/401")
!2 = !{}
!3 = !{!4, !5}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64, align: 64)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64, align: 64)
!6 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!7 = !{!8, !11, !12, !13, !14, !15}
!8 = distinct !DIGlobalVariable(name: "GLOBAL_CONST_TRUE", scope: !0, file: !9, line: 10, type: !10, isLocal: false, isDefinition: true, variable: i32* @GLOBAL_CONST_TRUE)
!9 = !DIFile(filename: "./401_43.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/401")
!10 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !6)
!11 = distinct !DIGlobalVariable(name: "GLOBAL_CONST_FALSE", scope: !0, file: !9, line: 11, type: !10, isLocal: false, isDefinition: true, variable: i32* @GLOBAL_CONST_FALSE)
!12 = distinct !DIGlobalVariable(name: "GLOBAL_CONST_FIVE", scope: !0, file: !9, line: 12, type: !10, isLocal: false, isDefinition: true, variable: i32* @GLOBAL_CONST_FIVE)
!13 = distinct !DIGlobalVariable(name: "globalTrue", scope: !0, file: !9, line: 15, type: !6, isLocal: false, isDefinition: true, variable: i32* @globalTrue)
!14 = distinct !DIGlobalVariable(name: "globalFalse", scope: !0, file: !9, line: 16, type: !6, isLocal: false, isDefinition: true, variable: i32* @globalFalse)
!15 = distinct !DIGlobalVariable(name: "globalFive", scope: !0, file: !9, line: 17, type: !6, isLocal: false, isDefinition: true, variable: i32* @globalFive)
!16 = !{i32 2, !"Dwarf Version", i32 4}
!17 = !{i32 2, !"Debug Info Version", i32 3}
!18 = !{!"clang version 3.9.0 (tags/RELEASE_390/final)"}
!19 = distinct !DISubprogram(name: "globalReturnsTrue", scope: !9, file: !9, line: 19, type: !20, isLocal: false, isDefinition: true, scopeLine: 20, isOptimized: false, unit: !0, variables: !2)
!20 = !DISubroutineType(types: !21)
!21 = !{!6}
!22 = !DILocation(line: 21, column: 5, scope: !19)
!23 = distinct !DISubprogram(name: "globalReturnsFalse", scope: !9, file: !9, line: 24, type: !20, isLocal: false, isDefinition: true, scopeLine: 25, isOptimized: false, unit: !0, variables: !2)
!24 = !DILocation(line: 26, column: 5, scope: !23)
!25 = distinct !DISubprogram(name: "globalReturnsTrueOrFalse", scope: !9, file: !9, line: 29, type: !20, isLocal: false, isDefinition: true, scopeLine: 30, isOptimized: false, unit: !0, variables: !2)
!26 = !DILocation(line: 31, column: 13, scope: !25)
!27 = !DILocation(line: 31, column: 20, scope: !25)
!28 = !DILocation(line: 31, column: 5, scope: !25)
!29 = distinct !DISubprogram(name: "printLine", scope: !9, file: !9, line: 34, type: !30, isLocal: false, isDefinition: true, scopeLine: 35, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!30 = !DISubroutineType(types: !31)
!31 = !{null, !32}
!32 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !33, size: 64, align: 64)
!33 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !34)
!34 = !DIBasicType(name: "char", size: 8, align: 8, encoding: DW_ATE_signed_char)
!35 = !DILocalVariable(name: "line", arg: 1, scope: !29, file: !9, line: 34, type: !32)
!36 = !DIExpression()
!37 = !DILocation(line: 34, column: 30, scope: !29)
!38 = !DILocation(line: 36, column: 8, scope: !39)
!39 = distinct !DILexicalBlock(scope: !29, file: !9, line: 36, column: 8)
!40 = !DILocation(line: 36, column: 13, scope: !39)
!41 = !DILocation(line: 36, column: 8, scope: !29)
!42 = !DILocation(line: 38, column: 24, scope: !43)
!43 = distinct !DILexicalBlock(scope: !39, file: !9, line: 37, column: 5)
!44 = !DILocation(line: 38, column: 9, scope: !43)
!45 = !DILocation(line: 39, column: 5, scope: !43)
!46 = !DILocation(line: 40, column: 1, scope: !29)
!47 = distinct !DISubprogram(name: "printIntLine", scope: !9, file: !9, line: 42, type: !48, isLocal: false, isDefinition: true, scopeLine: 43, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!48 = !DISubroutineType(types: !49)
!49 = !{null, !6}
!50 = !DILocalVariable(name: "intNumber", arg: 1, scope: !47, file: !9, line: 42, type: !6)
!51 = !DILocation(line: 42, column: 24, scope: !47)
!52 = !DILocation(line: 44, column: 20, scope: !47)
!53 = !DILocation(line: 44, column: 5, scope: !47)
!54 = !DILocation(line: 45, column: 1, scope: !47)
!55 = distinct !DISubprogram(name: "bad43", scope: !9, file: !9, line: 49, type: !56, isLocal: false, isDefinition: true, scopeLine: 50, isOptimized: false, unit: !0, variables: !2)
!56 = !DISubroutineType(types: !57)
!57 = !{null}
!58 = !DILocalVariable(name: "data", scope: !55, file: !9, line: 51, type: !5)
!59 = !DILocation(line: 51, column: 11, scope: !55)
!60 = !DILocation(line: 52, column: 10, scope: !55)
!61 = !DILocation(line: 54, column: 19, scope: !55)
!62 = !DILocation(line: 54, column: 12, scope: !55)
!63 = !DILocation(line: 54, column: 10, scope: !55)
!64 = !DILocation(line: 55, column: 9, scope: !65)
!65 = distinct !DILexicalBlock(scope: !55, file: !9, line: 55, column: 9)
!66 = !DILocation(line: 55, column: 14, scope: !65)
!67 = !DILocation(line: 55, column: 9, scope: !55)
!68 = !DILocation(line: 55, column: 23, scope: !69)
!69 = !DILexicalBlockFile(scope: !65, file: !9, discriminator: 1)
!70 = !DILocation(line: 57, column: 5, scope: !55)
!71 = !DILocation(line: 57, column: 13, scope: !55)
!72 = !DILocation(line: 58, column: 18, scope: !55)
!73 = !DILocation(line: 58, column: 5, scope: !55)
!74 = !DILocation(line: 61, column: 1, scope: !55)
!75 = !DILocation(line: 61, column: 1, scope: !76)
!76 = !DILexicalBlockFile(scope: !55, file: !9, discriminator: 1)
!77 = distinct !DISubprogram(name: "good43", scope: !9, file: !9, line: 66, type: !56, isLocal: false, isDefinition: true, scopeLine: 67, isOptimized: false, unit: !0, variables: !2)
!78 = !DILocalVariable(name: "data", scope: !77, file: !9, line: 68, type: !5)
!79 = !DILocation(line: 68, column: 11, scope: !77)
!80 = !DILocation(line: 69, column: 10, scope: !77)
!81 = !DILocation(line: 71, column: 19, scope: !77)
!82 = !DILocation(line: 71, column: 12, scope: !77)
!83 = !DILocation(line: 71, column: 10, scope: !77)
!84 = !DILocation(line: 72, column: 9, scope: !85)
!85 = distinct !DILexicalBlock(scope: !77, file: !9, line: 72, column: 9)
!86 = !DILocation(line: 72, column: 14, scope: !85)
!87 = !DILocation(line: 72, column: 9, scope: !77)
!88 = !DILocation(line: 72, column: 23, scope: !89)
!89 = !DILexicalBlockFile(scope: !85, file: !9, discriminator: 1)
!90 = !DILocation(line: 74, column: 5, scope: !77)
!91 = !DILocation(line: 74, column: 13, scope: !77)
!92 = !DILocation(line: 75, column: 18, scope: !77)
!93 = !DILocation(line: 75, column: 5, scope: !77)
!94 = !DILocation(line: 78, column: 1, scope: !77)
!95 = !DILocation(line: 78, column: 1, scope: !96)
!96 = !DILexicalBlockFile(scope: !77, file: !9, discriminator: 1)
!97 = distinct !DISubprogram(name: "main", scope: !9, file: !9, line: 82, type: !20, isLocal: false, isDefinition: true, scopeLine: 82, isOptimized: false, unit: !0, variables: !2)
!98 = !DILocation(line: 83, column: 2, scope: !97)
!99 = !DILocation(line: 84, column: 5, scope: !97)
!100 = !DILocation(line: 85, column: 5, scope: !97)
