; ModuleID = './369_zero_division_12.c'
source_filename = "./369_zero_division_12.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: nounwind uwtable
define void @zero_division_014_func_001(i32 %divisor) #0 !dbg !6 {
entry:
  %divisor.addr = alloca i32, align 4
  %dividend = alloca i32, align 4
  %ret = alloca i32, align 4
  store i32 %divisor, i32* %divisor.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %divisor.addr, metadata !11, metadata !12), !dbg !13
  call void @llvm.dbg.declare(metadata i32* %dividend, metadata !14, metadata !12), !dbg !15
  store i32 1000, i32* %dividend, align 4, !dbg !15
  call void @llvm.dbg.declare(metadata i32* %ret, metadata !16, metadata !12), !dbg !17
  %0 = load i32, i32* %dividend, align 4, !dbg !18
  %1 = load i32, i32* %divisor.addr, align 4, !dbg !19
  %div = sdiv i32 %0, %1, !dbg !20
  store i32 %div, i32* %ret, align 4, !dbg !21
  ret void, !dbg !22
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind uwtable
define void @zero_division_014_bad() #0 !dbg !23 {
entry:
  call void @zero_division_014_func_001(i32 0), !dbg !26
  ret void, !dbg !27
}

; Function Attrs: nounwind uwtable
define void @zero_division_014_good() #0 !dbg !28 {
entry:
  call void @zero_division_014_func_001(i32 1), !dbg !29
  ret void, !dbg !30
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !31 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @zero_division_014_good(), !dbg !34
  call void @zero_division_014_bad(), !dbg !35
  ret i32 0, !dbg !36
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4}
!llvm.ident = !{!5}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (tags/RELEASE_390/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2)
!1 = !DIFile(filename: "369_zero_division_12.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/itc/369")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{!"clang version 3.9.0 (tags/RELEASE_390/final)"}
!6 = distinct !DISubprogram(name: "zero_division_014_func_001", scope: !7, file: !7, line: 7, type: !8, isLocal: false, isDefinition: true, scopeLine: 8, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!7 = !DIFile(filename: "./369_zero_division_12.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/itc/369")
!8 = !DISubroutineType(types: !9)
!9 = !{null, !10}
!10 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!11 = !DILocalVariable(name: "divisor", arg: 1, scope: !6, file: !7, line: 7, type: !10)
!12 = !DIExpression()
!13 = !DILocation(line: 7, column: 38, scope: !6)
!14 = !DILocalVariable(name: "dividend", scope: !6, file: !7, line: 9, type: !10)
!15 = !DILocation(line: 9, column: 6, scope: !6)
!16 = !DILocalVariable(name: "ret", scope: !6, file: !7, line: 10, type: !10)
!17 = !DILocation(line: 10, column: 6, scope: !6)
!18 = !DILocation(line: 11, column: 8, scope: !6)
!19 = !DILocation(line: 11, column: 19, scope: !6)
!20 = !DILocation(line: 11, column: 17, scope: !6)
!21 = !DILocation(line: 11, column: 6, scope: !6)
!22 = !DILocation(line: 12, column: 1, scope: !6)
!23 = distinct !DISubprogram(name: "zero_division_014_bad", scope: !7, file: !7, line: 14, type: !24, isLocal: false, isDefinition: true, scopeLine: 15, isOptimized: false, unit: !0, variables: !2)
!24 = !DISubroutineType(types: !25)
!25 = !{null}
!26 = !DILocation(line: 16, column: 2, scope: !23)
!27 = !DILocation(line: 17, column: 1, scope: !23)
!28 = distinct !DISubprogram(name: "zero_division_014_good", scope: !7, file: !7, line: 19, type: !24, isLocal: false, isDefinition: true, scopeLine: 20, isOptimized: false, unit: !0, variables: !2)
!29 = !DILocation(line: 21, column: 2, scope: !28)
!30 = !DILocation(line: 22, column: 1, scope: !28)
!31 = distinct !DISubprogram(name: "main", scope: !7, file: !7, line: 24, type: !32, isLocal: false, isDefinition: true, scopeLine: 24, isOptimized: false, unit: !0, variables: !2)
!32 = !DISubroutineType(types: !33)
!33 = !{!10}
!34 = !DILocation(line: 25, column: 2, scope: !31)
!35 = !DILocation(line: 26, column: 3, scope: !31)
!36 = !DILocation(line: 27, column: 3, scope: !31)
