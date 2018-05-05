; ModuleID = './369_47.c'
source_filename = "./369_47.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%union.CWE369_Divide_by_Zero__int_fscanf_divide_34_unionType = type { i32 }

@.str = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1
@.str.1 = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@stdin = external global %struct._IO_FILE*, align 8
@.str.2 = private unnamed_addr constant [3 x i8] c"%d\00", align 1

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
define void @bad47() #0 !dbg !36 {
entry:
  %data = alloca i32, align 4
  %myUnion = alloca %union.CWE369_Divide_by_Zero__int_fscanf_divide_34_unionType, align 4
  %data1 = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !39, metadata !16), !dbg !40
  call void @llvm.dbg.declare(metadata %union.CWE369_Divide_by_Zero__int_fscanf_divide_34_unionType* %myUnion, metadata !41, metadata !16), !dbg !47
  store i32 -1, i32* %data, align 4, !dbg !48
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !49
  %call = call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* %0, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.2, i32 0, i32 0), i32* %data), !dbg !50
  %1 = load i32, i32* %data, align 4, !dbg !51
  %unionFirst = bitcast %union.CWE369_Divide_by_Zero__int_fscanf_divide_34_unionType* %myUnion to i32*, !dbg !52
  store i32 %1, i32* %unionFirst, align 4, !dbg !53
  call void @llvm.dbg.declare(metadata i32* %data1, metadata !54, metadata !16), !dbg !56
  %unionSecond = bitcast %union.CWE369_Divide_by_Zero__int_fscanf_divide_34_unionType* %myUnion to i32*, !dbg !57
  %2 = load i32, i32* %unionSecond, align 4, !dbg !57
  store i32 %2, i32* %data1, align 4, !dbg !56
  %3 = load i32, i32* %data1, align 4, !dbg !58
  %rem = srem i32 100, %3, !dbg !59
  call void @printIntLine(i32 %rem), !dbg !60
  ret void, !dbg !61
}

declare i32 @__isoc99_fscanf(%struct._IO_FILE*, i8*, ...) #2

; Function Attrs: nounwind uwtable
define void @good47() #0 !dbg !62 {
entry:
  %data = alloca i32, align 4
  %myUnion = alloca %union.CWE369_Divide_by_Zero__int_fscanf_divide_34_unionType, align 4
  %data1 = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !63, metadata !16), !dbg !64
  call void @llvm.dbg.declare(metadata %union.CWE369_Divide_by_Zero__int_fscanf_divide_34_unionType* %myUnion, metadata !65, metadata !16), !dbg !66
  store i32 -1, i32* %data, align 4, !dbg !67
  store i32 7, i32* %data, align 4, !dbg !68
  %0 = load i32, i32* %data, align 4, !dbg !69
  %unionFirst = bitcast %union.CWE369_Divide_by_Zero__int_fscanf_divide_34_unionType* %myUnion to i32*, !dbg !70
  store i32 %0, i32* %unionFirst, align 4, !dbg !71
  call void @llvm.dbg.declare(metadata i32* %data1, metadata !72, metadata !16), !dbg !74
  %unionSecond = bitcast %union.CWE369_Divide_by_Zero__int_fscanf_divide_34_unionType* %myUnion to i32*, !dbg !75
  %1 = load i32, i32* %unionSecond, align 4, !dbg !75
  store i32 %1, i32* %data1, align 4, !dbg !74
  %2 = load i32, i32* %data1, align 4, !dbg !76
  %rem = srem i32 100, %2, !dbg !77
  call void @printIntLine(i32 %rem), !dbg !78
  ret void, !dbg !79
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !80 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @good47(), !dbg !83
  call void @bad47(), !dbg !84
  ret i32 1, !dbg !85
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6}
!llvm.ident = !{!7}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (tags/RELEASE_390/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3)
!1 = !DIFile(filename: "369_47.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/369")
!2 = !{}
!3 = !{!4}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64, align: 64)
!5 = !{i32 2, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{!"clang version 3.9.0 (tags/RELEASE_390/final)"}
!8 = distinct !DISubprogram(name: "printLine", scope: !9, file: !9, line: 17, type: !10, isLocal: false, isDefinition: true, scopeLine: 18, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!9 = !DIFile(filename: "./369_47.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/369")
!10 = !DISubroutineType(types: !11)
!11 = !{null, !12}
!12 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !13, size: 64, align: 64)
!13 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !14)
!14 = !DIBasicType(name: "char", size: 8, align: 8, encoding: DW_ATE_signed_char)
!15 = !DILocalVariable(name: "line", arg: 1, scope: !8, file: !9, line: 17, type: !12)
!16 = !DIExpression()
!17 = !DILocation(line: 17, column: 30, scope: !8)
!18 = !DILocation(line: 19, column: 8, scope: !19)
!19 = distinct !DILexicalBlock(scope: !8, file: !9, line: 19, column: 8)
!20 = !DILocation(line: 19, column: 13, scope: !19)
!21 = !DILocation(line: 19, column: 8, scope: !8)
!22 = !DILocation(line: 21, column: 24, scope: !23)
!23 = distinct !DILexicalBlock(scope: !19, file: !9, line: 20, column: 5)
!24 = !DILocation(line: 21, column: 9, scope: !23)
!25 = !DILocation(line: 22, column: 5, scope: !23)
!26 = !DILocation(line: 23, column: 1, scope: !8)
!27 = distinct !DISubprogram(name: "printIntLine", scope: !9, file: !9, line: 25, type: !28, isLocal: false, isDefinition: true, scopeLine: 26, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!28 = !DISubroutineType(types: !29)
!29 = !{null, !30}
!30 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!31 = !DILocalVariable(name: "intNumber", arg: 1, scope: !27, file: !9, line: 25, type: !30)
!32 = !DILocation(line: 25, column: 24, scope: !27)
!33 = !DILocation(line: 27, column: 20, scope: !27)
!34 = !DILocation(line: 27, column: 5, scope: !27)
!35 = !DILocation(line: 28, column: 1, scope: !27)
!36 = distinct !DISubprogram(name: "bad47", scope: !9, file: !9, line: 32, type: !37, isLocal: false, isDefinition: true, scopeLine: 33, isOptimized: false, unit: !0, variables: !2)
!37 = !DISubroutineType(types: !38)
!38 = !{null}
!39 = !DILocalVariable(name: "data", scope: !36, file: !9, line: 34, type: !30)
!40 = !DILocation(line: 34, column: 9, scope: !36)
!41 = !DILocalVariable(name: "myUnion", scope: !36, file: !9, line: 35, type: !42)
!42 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE369_Divide_by_Zero__int_fscanf_divide_34_unionType", file: !9, line: 14, baseType: !43)
!43 = distinct !DICompositeType(tag: DW_TAG_union_type, file: !9, line: 10, size: 32, align: 32, elements: !44)
!44 = !{!45, !46}
!45 = !DIDerivedType(tag: DW_TAG_member, name: "unionFirst", scope: !43, file: !9, line: 12, baseType: !30, size: 32, align: 32)
!46 = !DIDerivedType(tag: DW_TAG_member, name: "unionSecond", scope: !43, file: !9, line: 13, baseType: !30, size: 32, align: 32)
!47 = !DILocation(line: 35, column: 59, scope: !36)
!48 = !DILocation(line: 37, column: 10, scope: !36)
!49 = !DILocation(line: 39, column: 12, scope: !36)
!50 = !DILocation(line: 39, column: 5, scope: !36)
!51 = !DILocation(line: 40, column: 26, scope: !36)
!52 = !DILocation(line: 40, column: 13, scope: !36)
!53 = !DILocation(line: 40, column: 24, scope: !36)
!54 = !DILocalVariable(name: "data", scope: !55, file: !9, line: 42, type: !30)
!55 = distinct !DILexicalBlock(scope: !36, file: !9, line: 41, column: 5)
!56 = !DILocation(line: 42, column: 13, scope: !55)
!57 = !DILocation(line: 42, column: 28, scope: !55)
!58 = !DILocation(line: 44, column: 28, scope: !55)
!59 = !DILocation(line: 44, column: 26, scope: !55)
!60 = !DILocation(line: 44, column: 9, scope: !55)
!61 = !DILocation(line: 46, column: 1, scope: !36)
!62 = distinct !DISubprogram(name: "good47", scope: !9, file: !9, line: 52, type: !37, isLocal: false, isDefinition: true, scopeLine: 53, isOptimized: false, unit: !0, variables: !2)
!63 = !DILocalVariable(name: "data", scope: !62, file: !9, line: 54, type: !30)
!64 = !DILocation(line: 54, column: 9, scope: !62)
!65 = !DILocalVariable(name: "myUnion", scope: !62, file: !9, line: 55, type: !42)
!66 = !DILocation(line: 55, column: 59, scope: !62)
!67 = !DILocation(line: 57, column: 10, scope: !62)
!68 = !DILocation(line: 59, column: 10, scope: !62)
!69 = !DILocation(line: 60, column: 26, scope: !62)
!70 = !DILocation(line: 60, column: 13, scope: !62)
!71 = !DILocation(line: 60, column: 24, scope: !62)
!72 = !DILocalVariable(name: "data", scope: !73, file: !9, line: 62, type: !30)
!73 = distinct !DILexicalBlock(scope: !62, file: !9, line: 61, column: 5)
!74 = !DILocation(line: 62, column: 13, scope: !73)
!75 = !DILocation(line: 62, column: 28, scope: !73)
!76 = !DILocation(line: 64, column: 28, scope: !73)
!77 = !DILocation(line: 64, column: 26, scope: !73)
!78 = !DILocation(line: 64, column: 9, scope: !73)
!79 = !DILocation(line: 66, column: 1, scope: !62)
!80 = distinct !DISubprogram(name: "main", scope: !9, file: !9, line: 70, type: !81, isLocal: false, isDefinition: true, scopeLine: 70, isOptimized: false, unit: !0, variables: !2)
!81 = !DISubroutineType(types: !82)
!82 = !{!30}
!83 = !DILocation(line: 71, column: 5, scope: !80)
!84 = !DILocation(line: 72, column: 5, scope: !80)
!85 = !DILocation(line: 73, column: 5, scope: !80)
