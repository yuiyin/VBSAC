; ModuleID = './401_memory_leak_6.c'
source_filename = "./401_memory_leak_6.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: nounwind uwtable
define i32 @memory_leak_006_func_001_bad(i32 %flag) #0 !dbg !10 {
entry:
  %flag.addr = alloca i32, align 4
  %ret = alloca i32, align 4
  store i32 %flag, i32* %flag.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %flag.addr, metadata !15, metadata !16), !dbg !17
  call void @llvm.dbg.declare(metadata i32* %ret, metadata !18, metadata !16), !dbg !19
  %0 = load i32, i32* %flag.addr, align 4, !dbg !20
  %cmp = icmp eq i32 %0, 0, !dbg !22
  br i1 %cmp, label %if.then, label %if.else, !dbg !23

if.then:                                          ; preds = %entry
  store i32 0, i32* %ret, align 4, !dbg !24
  br label %if.end, !dbg !25

if.else:                                          ; preds = %entry
  store i32 1, i32* %ret, align 4, !dbg !26
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %1 = load i32, i32* %ret, align 4, !dbg !27
  ret i32 %1, !dbg !28
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind uwtable
define void @memory_leak_006_bad() #0 !dbg !29 {
entry:
  %dptr = alloca double*, align 8
  %flag = alloca i32, align 4
  call void @llvm.dbg.declare(metadata double** %dptr, metadata !32, metadata !16), !dbg !33
  call void @llvm.dbg.declare(metadata i32* %flag, metadata !34, metadata !16), !dbg !35
  store i32 0, i32* %flag, align 4, !dbg !35
  %0 = load i32, i32* %flag, align 4, !dbg !36
  %call = call i32 @memory_leak_006_func_001_bad(i32 %0), !dbg !38
  %cmp = icmp eq i32 %call, 0, !dbg !39
  br i1 %cmp, label %if.then, label %if.end4, !dbg !40

if.then:                                          ; preds = %entry
  %call1 = call noalias i8* @malloc(i64 40) #3, !dbg !41
  %1 = bitcast i8* %call1 to double*, !dbg !43
  store double* %1, double** %dptr, align 8, !dbg !44
  %2 = load double*, double** %dptr, align 8, !dbg !45
  %cmp2 = icmp ne double* %2, null, !dbg !47
  br i1 %cmp2, label %if.then3, label %if.end, !dbg !48

if.then3:                                         ; preds = %if.then
  %3 = load double*, double** %dptr, align 8, !dbg !49
  %add.ptr = getelementptr inbounds double, double* %3, i64 1, !dbg !51
  store double 1.050000e+01, double* %add.ptr, align 8, !dbg !52
  br label %if.end, !dbg !53

if.end:                                           ; preds = %if.then3, %if.then
  br label %if.end4, !dbg !54

if.end4:                                          ; preds = %if.end, %entry
  %4 = load i32, i32* %flag, align 4, !dbg !55
  %call5 = call i32 @memory_leak_006_func_001_bad(i32 %4), !dbg !57
  %cmp6 = icmp ne i32 %call5, 0, !dbg !58
  br i1 %cmp6, label %if.then7, label %if.end8, !dbg !59

if.then7:                                         ; preds = %if.end4
  %5 = load double*, double** %dptr, align 8, !dbg !60
  %6 = bitcast double* %5 to i8*, !dbg !60
  call void @free(i8* %6) #3, !dbg !61
  br label %if.end8, !dbg !61

if.end8:                                          ; preds = %if.then7, %if.end4
  ret void, !dbg !62
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #2

; Function Attrs: nounwind
declare void @free(i8*) #2

; Function Attrs: nounwind uwtable
define i32 @memory_leak_006_func_001_good(i32 %flag) #0 !dbg !63 {
entry:
  %flag.addr = alloca i32, align 4
  %ret = alloca i32, align 4
  store i32 %flag, i32* %flag.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %flag.addr, metadata !64, metadata !16), !dbg !65
  call void @llvm.dbg.declare(metadata i32* %ret, metadata !66, metadata !16), !dbg !67
  %0 = load i32, i32* %flag.addr, align 4, !dbg !68
  %cmp = icmp eq i32 %0, 0, !dbg !70
  br i1 %cmp, label %if.then, label %if.else, !dbg !71

if.then:                                          ; preds = %entry
  store i32 0, i32* %ret, align 4, !dbg !72
  br label %if.end, !dbg !73

if.else:                                          ; preds = %entry
  store i32 1, i32* %ret, align 4, !dbg !74
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %1 = load i32, i32* %ret, align 4, !dbg !75
  ret i32 %1, !dbg !76
}

; Function Attrs: nounwind uwtable
define void @memory_leak_006_good() #0 !dbg !77 {
entry:
  %dptr = alloca double*, align 8
  %flag = alloca i32, align 4
  call void @llvm.dbg.declare(metadata double** %dptr, metadata !78, metadata !16), !dbg !79
  call void @llvm.dbg.declare(metadata i32* %flag, metadata !80, metadata !16), !dbg !81
  store i32 0, i32* %flag, align 4, !dbg !81
  %0 = load i32, i32* %flag, align 4, !dbg !82
  %call = call i32 @memory_leak_006_func_001_good(i32 %0), !dbg !84
  %cmp = icmp eq i32 %call, 0, !dbg !85
  br i1 %cmp, label %if.then, label %if.end4, !dbg !86

if.then:                                          ; preds = %entry
  %call1 = call noalias i8* @malloc(i64 40) #3, !dbg !87
  %1 = bitcast i8* %call1 to double*, !dbg !89
  store double* %1, double** %dptr, align 8, !dbg !90
  %2 = load double*, double** %dptr, align 8, !dbg !91
  %cmp2 = icmp ne double* %2, null, !dbg !93
  br i1 %cmp2, label %if.then3, label %if.end, !dbg !94

if.then3:                                         ; preds = %if.then
  %3 = load double*, double** %dptr, align 8, !dbg !95
  %add.ptr = getelementptr inbounds double, double* %3, i64 1, !dbg !97
  store double 1.050000e+01, double* %add.ptr, align 8, !dbg !98
  %4 = load double*, double** %dptr, align 8, !dbg !99
  %5 = bitcast double* %4 to i8*, !dbg !99
  call void @free(i8* %5) #3, !dbg !100
  br label %if.end, !dbg !101

if.end:                                           ; preds = %if.then3, %if.then
  br label %if.end4, !dbg !102

if.end4:                                          ; preds = %if.end, %entry
  ret void, !dbg !103
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !104 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @memory_leak_006_good(), !dbg !107
  call void @memory_leak_006_bad(), !dbg !108
  ret i32 0, !dbg !109
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8}
!llvm.ident = !{!9}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (tags/RELEASE_390/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3)
!1 = !DIFile(filename: "401_memory_leak_6.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/itc/401")
!2 = !{}
!3 = !{!4, !6}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64, align: 64)
!5 = !DIBasicType(name: "double", size: 64, align: 64, encoding: DW_ATE_float)
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64, align: 64)
!7 = !{i32 2, !"Dwarf Version", i32 4}
!8 = !{i32 2, !"Debug Info Version", i32 3}
!9 = !{!"clang version 3.9.0 (tags/RELEASE_390/final)"}
!10 = distinct !DISubprogram(name: "memory_leak_006_func_001_bad", scope: !11, file: !11, line: 17, type: !12, isLocal: false, isDefinition: true, scopeLine: 18, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!11 = !DIFile(filename: "./401_memory_leak_6.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/itc/401")
!12 = !DISubroutineType(types: !13)
!13 = !{!14, !14}
!14 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!15 = !DILocalVariable(name: "flag", arg: 1, scope: !10, file: !11, line: 17, type: !14)
!16 = !DIExpression()
!17 = !DILocation(line: 17, column: 38, scope: !10)
!18 = !DILocalVariable(name: "ret", scope: !10, file: !11, line: 19, type: !14)
!19 = !DILocation(line: 19, column: 8, scope: !10)
!20 = !DILocation(line: 20, column: 8, scope: !21)
!21 = distinct !DILexicalBlock(scope: !10, file: !11, line: 20, column: 8)
!22 = !DILocation(line: 20, column: 13, scope: !21)
!23 = !DILocation(line: 20, column: 8, scope: !10)
!24 = !DILocation(line: 21, column: 9, scope: !21)
!25 = !DILocation(line: 21, column: 5, scope: !21)
!26 = !DILocation(line: 23, column: 8, scope: !21)
!27 = !DILocation(line: 24, column: 11, scope: !10)
!28 = !DILocation(line: 24, column: 4, scope: !10)
!29 = distinct !DISubprogram(name: "memory_leak_006_bad", scope: !11, file: !11, line: 27, type: !30, isLocal: false, isDefinition: true, scopeLine: 28, isOptimized: false, unit: !0, variables: !2)
!30 = !DISubroutineType(types: !31)
!31 = !{null}
!32 = !DILocalVariable(name: "dptr", scope: !29, file: !11, line: 29, type: !4)
!33 = !DILocation(line: 29, column: 10, scope: !29)
!34 = !DILocalVariable(name: "flag", scope: !29, file: !11, line: 30, type: !14)
!35 = !DILocation(line: 30, column: 6, scope: !29)
!36 = !DILocation(line: 32, column: 34, scope: !37)
!37 = distinct !DILexicalBlock(scope: !29, file: !11, line: 32, column: 5)
!38 = !DILocation(line: 32, column: 5, scope: !37)
!39 = !DILocation(line: 32, column: 39, scope: !37)
!40 = !DILocation(line: 32, column: 5, scope: !29)
!41 = !DILocation(line: 34, column: 19, scope: !42)
!42 = distinct !DILexicalBlock(scope: !37, file: !11, line: 33, column: 2)
!43 = !DILocation(line: 34, column: 9, scope: !42)
!44 = !DILocation(line: 34, column: 7, scope: !42)
!45 = !DILocation(line: 35, column: 6, scope: !46)
!46 = distinct !DILexicalBlock(scope: !42, file: !11, line: 35, column: 6)
!47 = !DILocation(line: 35, column: 10, scope: !46)
!48 = !DILocation(line: 35, column: 6, scope: !42)
!49 = !DILocation(line: 37, column: 14, scope: !50)
!50 = distinct !DILexicalBlock(scope: !46, file: !11, line: 36, column: 3)
!51 = !DILocation(line: 37, column: 18, scope: !50)
!52 = !DILocation(line: 37, column: 22, scope: !50)
!53 = !DILocation(line: 38, column: 3, scope: !50)
!54 = !DILocation(line: 39, column: 2, scope: !42)
!55 = !DILocation(line: 40, column: 37, scope: !56)
!56 = distinct !DILexicalBlock(scope: !29, file: !11, line: 40, column: 8)
!57 = !DILocation(line: 40, column: 8, scope: !56)
!58 = !DILocation(line: 40, column: 43, scope: !56)
!59 = !DILocation(line: 40, column: 8, scope: !29)
!60 = !DILocation(line: 41, column: 7, scope: !56)
!61 = !DILocation(line: 41, column: 2, scope: !56)
!62 = !DILocation(line: 42, column: 1, scope: !29)
!63 = distinct !DISubprogram(name: "memory_leak_006_func_001_good", scope: !11, file: !11, line: 48, type: !12, isLocal: false, isDefinition: true, scopeLine: 49, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!64 = !DILocalVariable(name: "flag", arg: 1, scope: !63, file: !11, line: 48, type: !14)
!65 = !DILocation(line: 48, column: 39, scope: !63)
!66 = !DILocalVariable(name: "ret", scope: !63, file: !11, line: 50, type: !14)
!67 = !DILocation(line: 50, column: 8, scope: !63)
!68 = !DILocation(line: 51, column: 8, scope: !69)
!69 = distinct !DILexicalBlock(scope: !63, file: !11, line: 51, column: 8)
!70 = !DILocation(line: 51, column: 13, scope: !69)
!71 = !DILocation(line: 51, column: 8, scope: !63)
!72 = !DILocation(line: 52, column: 9, scope: !69)
!73 = !DILocation(line: 52, column: 5, scope: !69)
!74 = !DILocation(line: 54, column: 8, scope: !69)
!75 = !DILocation(line: 55, column: 11, scope: !63)
!76 = !DILocation(line: 55, column: 4, scope: !63)
!77 = distinct !DISubprogram(name: "memory_leak_006_good", scope: !11, file: !11, line: 58, type: !30, isLocal: false, isDefinition: true, scopeLine: 59, isOptimized: false, unit: !0, variables: !2)
!78 = !DILocalVariable(name: "dptr", scope: !77, file: !11, line: 60, type: !4)
!79 = !DILocation(line: 60, column: 10, scope: !77)
!80 = !DILocalVariable(name: "flag", scope: !77, file: !11, line: 61, type: !14)
!81 = !DILocation(line: 61, column: 6, scope: !77)
!82 = !DILocation(line: 63, column: 35, scope: !83)
!83 = distinct !DILexicalBlock(scope: !77, file: !11, line: 63, column: 5)
!84 = !DILocation(line: 63, column: 5, scope: !83)
!85 = !DILocation(line: 63, column: 40, scope: !83)
!86 = !DILocation(line: 63, column: 5, scope: !77)
!87 = !DILocation(line: 65, column: 19, scope: !88)
!88 = distinct !DILexicalBlock(scope: !83, file: !11, line: 64, column: 2)
!89 = !DILocation(line: 65, column: 9, scope: !88)
!90 = !DILocation(line: 65, column: 7, scope: !88)
!91 = !DILocation(line: 66, column: 6, scope: !92)
!92 = distinct !DILexicalBlock(scope: !88, file: !11, line: 66, column: 6)
!93 = !DILocation(line: 66, column: 10, scope: !92)
!94 = !DILocation(line: 66, column: 6, scope: !88)
!95 = !DILocation(line: 68, column: 14, scope: !96)
!96 = distinct !DILexicalBlock(scope: !92, file: !11, line: 67, column: 3)
!97 = !DILocation(line: 68, column: 18, scope: !96)
!98 = !DILocation(line: 68, column: 22, scope: !96)
!99 = !DILocation(line: 69, column: 17, scope: !96)
!100 = !DILocation(line: 69, column: 12, scope: !96)
!101 = !DILocation(line: 70, column: 3, scope: !96)
!102 = !DILocation(line: 71, column: 2, scope: !88)
!103 = !DILocation(line: 72, column: 1, scope: !77)
!104 = distinct !DISubprogram(name: "main", scope: !11, file: !11, line: 79, type: !105, isLocal: false, isDefinition: true, scopeLine: 80, isOptimized: false, unit: !0, variables: !2)
!105 = !DISubroutineType(types: !106)
!106 = !{!14}
!107 = !DILocation(line: 81, column: 2, scope: !104)
!108 = !DILocation(line: 82, column: 3, scope: !104)
!109 = !DILocation(line: 83, column: 2, scope: !104)
