; ModuleID = './369_zero_division_4.c'
source_filename = "./369_zero_division_4.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@zero_division_004_dividend_gbl = global i32 1000, align 4
@zero_division_004_divisor_gbl_bad = internal global i32 1, align 4
@zero_division_004_divisor_gbl_good = internal global i32 11, align 4

; Function Attrs: nounwind uwtable
define void @zero_division_004_func_001_bad() #0 !dbg !12 {
entry:
  %0 = load i32, i32* @zero_division_004_divisor_gbl_bad, align 4, !dbg !15
  %1 = load i32, i32* @zero_division_004_dividend_gbl, align 4, !dbg !16
  %rem = srem i32 %1, %0, !dbg !16
  store i32 %rem, i32* @zero_division_004_dividend_gbl, align 4, !dbg !16
  ret void, !dbg !17
}

; Function Attrs: nounwind uwtable
define void @zero_division_004_bad() #0 !dbg !18 {
entry:
  %0 = load i32, i32* @zero_division_004_divisor_gbl_bad, align 4, !dbg !19
  %dec = add nsw i32 %0, -1, !dbg !19
  store i32 %dec, i32* @zero_division_004_divisor_gbl_bad, align 4, !dbg !19
  call void @zero_division_004_func_001_bad(), !dbg !20
  ret void, !dbg !21
}

; Function Attrs: nounwind uwtable
define void @zero_division_004_func_001_good() #0 !dbg !22 {
entry:
  %0 = load i32, i32* @zero_division_004_divisor_gbl_good, align 4, !dbg !23
  %1 = load i32, i32* @zero_division_004_dividend_gbl, align 4, !dbg !24
  %rem = srem i32 %1, %0, !dbg !24
  store i32 %rem, i32* @zero_division_004_dividend_gbl, align 4, !dbg !24
  ret void, !dbg !25
}

; Function Attrs: nounwind uwtable
define void @zero_division_004_good() #0 !dbg !26 {
entry:
  %0 = load i32, i32* @zero_division_004_divisor_gbl_good, align 4, !dbg !27
  %dec = add nsw i32 %0, -1, !dbg !27
  store i32 %dec, i32* @zero_division_004_divisor_gbl_good, align 4, !dbg !27
  call void @zero_division_004_func_001_good(), !dbg !28
  ret void, !dbg !29
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !30 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @zero_division_004_good(), !dbg !33
  call void @zero_division_004_bad(), !dbg !34
  ret i32 0, !dbg !35
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!9, !10}
!llvm.ident = !{!11}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (tags/RELEASE_390/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, globals: !3)
!1 = !DIFile(filename: "369_zero_division_4.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/itc/369")
!2 = !{}
!3 = !{!4, !7, !8}
!4 = distinct !DIGlobalVariable(name: "zero_division_004_dividend_gbl", scope: !0, file: !5, line: 7, type: !6, isLocal: false, isDefinition: true, variable: i32* @zero_division_004_dividend_gbl)
!5 = !DIFile(filename: "./369_zero_division_4.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/itc/369")
!6 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!7 = distinct !DIGlobalVariable(name: "zero_division_004_divisor_gbl_bad", scope: !0, file: !5, line: 8, type: !6, isLocal: true, isDefinition: true, variable: i32* @zero_division_004_divisor_gbl_bad)
!8 = distinct !DIGlobalVariable(name: "zero_division_004_divisor_gbl_good", scope: !0, file: !5, line: 25, type: !6, isLocal: true, isDefinition: true, variable: i32* @zero_division_004_divisor_gbl_good)
!9 = !{i32 2, !"Dwarf Version", i32 4}
!10 = !{i32 2, !"Debug Info Version", i32 3}
!11 = !{!"clang version 3.9.0 (tags/RELEASE_390/final)"}
!12 = distinct !DISubprogram(name: "zero_division_004_func_001_bad", scope: !5, file: !5, line: 9, type: !13, isLocal: false, isDefinition: true, scopeLine: 10, isOptimized: false, unit: !0, variables: !2)
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocation(line: 11, column: 36, scope: !12)
!16 = !DILocation(line: 11, column: 33, scope: !12)
!17 = !DILocation(line: 12, column: 1, scope: !12)
!18 = distinct !DISubprogram(name: "zero_division_004_bad", scope: !5, file: !5, line: 13, type: !13, isLocal: false, isDefinition: true, scopeLine: 14, isOptimized: false, unit: !0, variables: !2)
!19 = !DILocation(line: 16, column: 35, scope: !18)
!20 = !DILocation(line: 17, column: 2, scope: !18)
!21 = !DILocation(line: 19, column: 1, scope: !18)
!22 = distinct !DISubprogram(name: "zero_division_004_func_001_good", scope: !5, file: !5, line: 26, type: !13, isLocal: false, isDefinition: true, scopeLine: 27, isOptimized: false, unit: !0, variables: !2)
!23 = !DILocation(line: 28, column: 36, scope: !22)
!24 = !DILocation(line: 28, column: 33, scope: !22)
!25 = !DILocation(line: 29, column: 1, scope: !22)
!26 = distinct !DISubprogram(name: "zero_division_004_good", scope: !5, file: !5, line: 30, type: !13, isLocal: false, isDefinition: true, scopeLine: 31, isOptimized: false, unit: !0, variables: !2)
!27 = !DILocation(line: 32, column: 36, scope: !26)
!28 = !DILocation(line: 33, column: 2, scope: !26)
!29 = !DILocation(line: 34, column: 1, scope: !26)
!30 = distinct !DISubprogram(name: "main", scope: !5, file: !5, line: 36, type: !31, isLocal: false, isDefinition: true, scopeLine: 36, isOptimized: false, unit: !0, variables: !2)
!31 = !DISubroutineType(types: !32)
!32 = !{!6}
!33 = !DILocation(line: 37, column: 2, scope: !30)
!34 = !DILocation(line: 38, column: 3, scope: !30)
!35 = !DILocation(line: 39, column: 3, scope: !30)
