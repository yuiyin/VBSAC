; ModuleID = './369_zero_division_14.c'
source_filename = "./369_zero_division_14.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@zero_division_016_gbl_divisor_bad = common global i32* null, align 8
@zero_division_016_gbl_divisor_good = common global i32* null, align 8

; Function Attrs: nounwind uwtable
define void @zero_division_016_func_001_bad() #0 !dbg !12 {
entry:
  %call = call noalias i8* @malloc(i64 4) #3, !dbg !15
  %0 = bitcast i8* %call to i32*, !dbg !15
  store i32* %0, i32** @zero_division_016_gbl_divisor_bad, align 8, !dbg !16
  %1 = load i32*, i32** @zero_division_016_gbl_divisor_bad, align 8, !dbg !17
  store i32 -1, i32* %1, align 4, !dbg !18
  ret void, !dbg !19
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #1

; Function Attrs: nounwind uwtable
define void @zero_division_016_func_002_bad() #0 !dbg !20 {
entry:
  %0 = load i32*, i32** @zero_division_016_gbl_divisor_bad, align 8, !dbg !21
  %1 = load i32, i32* %0, align 4, !dbg !22
  %inc = add nsw i32 %1, 1, !dbg !22
  store i32 %inc, i32* %0, align 4, !dbg !22
  ret void, !dbg !23
}

; Function Attrs: nounwind uwtable
define void @zero_division_016_bad() #0 !dbg !24 {
entry:
  %dividend = alloca i32, align 4
  %divisor1 = alloca i32, align 4
  %divisor2 = alloca i32, align 4
  %ret = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %dividend, metadata !25, metadata !26), !dbg !27
  store i32 1000, i32* %dividend, align 4, !dbg !27
  call void @llvm.dbg.declare(metadata i32* %divisor1, metadata !28, metadata !26), !dbg !29
  call void @llvm.dbg.declare(metadata i32* %divisor2, metadata !30, metadata !26), !dbg !31
  call void @llvm.dbg.declare(metadata i32* %ret, metadata !32, metadata !26), !dbg !33
  call void @zero_division_016_func_001_bad(), !dbg !34
  call void @zero_division_016_func_002_bad(), !dbg !35
  %0 = load i32*, i32** @zero_division_016_gbl_divisor_bad, align 8, !dbg !36
  %1 = load i32, i32* %0, align 4, !dbg !37
  store i32 %1, i32* %divisor1, align 4, !dbg !38
  %2 = load i32, i32* %divisor1, align 4, !dbg !39
  store i32 %2, i32* %divisor2, align 4, !dbg !40
  %3 = load i32, i32* %dividend, align 4, !dbg !41
  %4 = load i32, i32* %divisor2, align 4, !dbg !42
  %div = sdiv i32 %3, %4, !dbg !43
  store i32 %div, i32* %ret, align 4, !dbg !44
  ret void, !dbg !45
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #2

; Function Attrs: nounwind uwtable
define void @zero_division_016_func_001_good() #0 !dbg !46 {
entry:
  %call = call noalias i8* @malloc(i64 4) #3, !dbg !47
  %0 = bitcast i8* %call to i32*, !dbg !47
  store i32* %0, i32** @zero_division_016_gbl_divisor_good, align 8, !dbg !48
  %1 = load i32*, i32** @zero_division_016_gbl_divisor_good, align 8, !dbg !49
  store i32 1, i32* %1, align 4, !dbg !50
  ret void, !dbg !51
}

; Function Attrs: nounwind uwtable
define void @zero_division_016_func_002_good() #0 !dbg !52 {
entry:
  %0 = load i32*, i32** @zero_division_016_gbl_divisor_good, align 8, !dbg !53
  %1 = load i32, i32* %0, align 4, !dbg !54
  %inc = add nsw i32 %1, 1, !dbg !54
  store i32 %inc, i32* %0, align 4, !dbg !54
  ret void, !dbg !55
}

; Function Attrs: nounwind uwtable
define void @zero_division_016_good() #0 !dbg !56 {
entry:
  %dividend = alloca i32, align 4
  %divisor1 = alloca i32, align 4
  %divisor2 = alloca i32, align 4
  %ret = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %dividend, metadata !57, metadata !26), !dbg !58
  store i32 1000, i32* %dividend, align 4, !dbg !58
  call void @llvm.dbg.declare(metadata i32* %divisor1, metadata !59, metadata !26), !dbg !60
  call void @llvm.dbg.declare(metadata i32* %divisor2, metadata !61, metadata !26), !dbg !62
  call void @llvm.dbg.declare(metadata i32* %ret, metadata !63, metadata !26), !dbg !64
  call void @zero_division_016_func_001_good(), !dbg !65
  call void @zero_division_016_func_002_good(), !dbg !66
  %0 = load i32*, i32** @zero_division_016_gbl_divisor_good, align 8, !dbg !67
  %1 = load i32, i32* %0, align 4, !dbg !68
  store i32 %1, i32* %divisor1, align 4, !dbg !69
  %2 = load i32, i32* %divisor1, align 4, !dbg !70
  store i32 %2, i32* %divisor2, align 4, !dbg !71
  %3 = load i32, i32* %dividend, align 4, !dbg !72
  %4 = load i32, i32* %divisor2, align 4, !dbg !73
  %div = sdiv i32 %3, %4, !dbg !74
  store i32 %div, i32* %ret, align 4, !dbg !75
  ret void, !dbg !76
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !77 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @zero_division_016_good(), !dbg !80
  call void @zero_division_016_bad(), !dbg !81
  ret i32 0, !dbg !82
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone }
attributes #3 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!9, !10}
!llvm.ident = !{!11}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (tags/RELEASE_390/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, globals: !3)
!1 = !DIFile(filename: "369_zero_division_14.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/itc/369")
!2 = !{}
!3 = !{!4, !8}
!4 = distinct !DIGlobalVariable(name: "zero_division_016_gbl_divisor_bad", scope: !0, file: !5, line: 9, type: !6, isLocal: false, isDefinition: true, variable: i32** @zero_division_016_gbl_divisor_bad)
!5 = !DIFile(filename: "./369_zero_division_14.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/itc/369")
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64, align: 64)
!7 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!8 = distinct !DIGlobalVariable(name: "zero_division_016_gbl_divisor_good", scope: !0, file: !5, line: 39, type: !6, isLocal: false, isDefinition: true, variable: i32** @zero_division_016_gbl_divisor_good)
!9 = !{i32 2, !"Dwarf Version", i32 4}
!10 = !{i32 2, !"Debug Info Version", i32 3}
!11 = !{!"clang version 3.9.0 (tags/RELEASE_390/final)"}
!12 = distinct !DISubprogram(name: "zero_division_016_func_001_bad", scope: !5, file: !5, line: 11, type: !13, isLocal: false, isDefinition: true, scopeLine: 12, isOptimized: false, unit: !0, variables: !2)
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocation(line: 13, column: 38, scope: !12)
!16 = !DILocation(line: 13, column: 36, scope: !12)
!17 = !DILocation(line: 14, column: 3, scope: !12)
!18 = !DILocation(line: 14, column: 37, scope: !12)
!19 = !DILocation(line: 15, column: 1, scope: !12)
!20 = distinct !DISubprogram(name: "zero_division_016_func_002_bad", scope: !5, file: !5, line: 17, type: !13, isLocal: false, isDefinition: true, scopeLine: 18, isOptimized: false, unit: !0, variables: !2)
!21 = !DILocation(line: 19, column: 4, scope: !20)
!22 = !DILocation(line: 19, column: 38, scope: !20)
!23 = !DILocation(line: 20, column: 1, scope: !20)
!24 = distinct !DISubprogram(name: "zero_division_016_bad", scope: !5, file: !5, line: 22, type: !13, isLocal: false, isDefinition: true, scopeLine: 23, isOptimized: false, unit: !0, variables: !2)
!25 = !DILocalVariable(name: "dividend", scope: !24, file: !5, line: 24, type: !7)
!26 = !DIExpression()
!27 = !DILocation(line: 24, column: 6, scope: !24)
!28 = !DILocalVariable(name: "divisor1", scope: !24, file: !5, line: 25, type: !7)
!29 = !DILocation(line: 25, column: 6, scope: !24)
!30 = !DILocalVariable(name: "divisor2", scope: !24, file: !5, line: 26, type: !7)
!31 = !DILocation(line: 26, column: 6, scope: !24)
!32 = !DILocalVariable(name: "ret", scope: !24, file: !5, line: 27, type: !7)
!33 = !DILocation(line: 27, column: 6, scope: !24)
!34 = !DILocation(line: 28, column: 2, scope: !24)
!35 = !DILocation(line: 29, column: 2, scope: !24)
!36 = !DILocation(line: 30, column: 14, scope: !24)
!37 = !DILocation(line: 30, column: 13, scope: !24)
!38 = !DILocation(line: 30, column: 11, scope: !24)
!39 = !DILocation(line: 31, column: 13, scope: !24)
!40 = !DILocation(line: 31, column: 11, scope: !24)
!41 = !DILocation(line: 32, column: 8, scope: !24)
!42 = !DILocation(line: 32, column: 19, scope: !24)
!43 = !DILocation(line: 32, column: 17, scope: !24)
!44 = !DILocation(line: 32, column: 6, scope: !24)
!45 = !DILocation(line: 33, column: 1, scope: !24)
!46 = distinct !DISubprogram(name: "zero_division_016_func_001_good", scope: !5, file: !5, line: 41, type: !13, isLocal: false, isDefinition: true, scopeLine: 42, isOptimized: false, unit: !0, variables: !2)
!47 = !DILocation(line: 43, column: 39, scope: !46)
!48 = !DILocation(line: 43, column: 37, scope: !46)
!49 = !DILocation(line: 44, column: 3, scope: !46)
!50 = !DILocation(line: 44, column: 37, scope: !46)
!51 = !DILocation(line: 45, column: 1, scope: !46)
!52 = distinct !DISubprogram(name: "zero_division_016_func_002_good", scope: !5, file: !5, line: 47, type: !13, isLocal: false, isDefinition: true, scopeLine: 48, isOptimized: false, unit: !0, variables: !2)
!53 = !DILocation(line: 49, column: 4, scope: !52)
!54 = !DILocation(line: 49, column: 39, scope: !52)
!55 = !DILocation(line: 50, column: 1, scope: !52)
!56 = distinct !DISubprogram(name: "zero_division_016_good", scope: !5, file: !5, line: 52, type: !13, isLocal: false, isDefinition: true, scopeLine: 53, isOptimized: false, unit: !0, variables: !2)
!57 = !DILocalVariable(name: "dividend", scope: !56, file: !5, line: 54, type: !7)
!58 = !DILocation(line: 54, column: 6, scope: !56)
!59 = !DILocalVariable(name: "divisor1", scope: !56, file: !5, line: 55, type: !7)
!60 = !DILocation(line: 55, column: 6, scope: !56)
!61 = !DILocalVariable(name: "divisor2", scope: !56, file: !5, line: 56, type: !7)
!62 = !DILocation(line: 56, column: 6, scope: !56)
!63 = !DILocalVariable(name: "ret", scope: !56, file: !5, line: 57, type: !7)
!64 = !DILocation(line: 57, column: 6, scope: !56)
!65 = !DILocation(line: 58, column: 2, scope: !56)
!66 = !DILocation(line: 59, column: 2, scope: !56)
!67 = !DILocation(line: 60, column: 14, scope: !56)
!68 = !DILocation(line: 60, column: 13, scope: !56)
!69 = !DILocation(line: 60, column: 11, scope: !56)
!70 = !DILocation(line: 61, column: 13, scope: !56)
!71 = !DILocation(line: 61, column: 11, scope: !56)
!72 = !DILocation(line: 62, column: 8, scope: !56)
!73 = !DILocation(line: 62, column: 19, scope: !56)
!74 = !DILocation(line: 62, column: 17, scope: !56)
!75 = !DILocation(line: 62, column: 6, scope: !56)
!76 = !DILocation(line: 63, column: 1, scope: !56)
!77 = distinct !DISubprogram(name: "main", scope: !5, file: !5, line: 65, type: !78, isLocal: false, isDefinition: true, scopeLine: 65, isOptimized: false, unit: !0, variables: !2)
!78 = !DISubroutineType(types: !79)
!79 = !{!7}
!80 = !DILocation(line: 66, column: 3, scope: !77)
!81 = !DILocation(line: 67, column: 2, scope: !77)
!82 = !DILocation(line: 68, column: 3, scope: !77)
