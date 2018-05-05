; ModuleID = './369_zero_division_10.c'
source_filename = "./369_zero_division_10.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: nounwind uwtable
define void @zero_division_012_bad() #0 !dbg !6 {
entry:
  %dividend = alloca i32, align 4
  %divisor = alloca i32, align 4
  %ret = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %dividend, metadata !10, metadata !12), !dbg !13
  store i32 1000, i32* %dividend, align 4, !dbg !13
  call void @llvm.dbg.declare(metadata i32* %divisor, metadata !14, metadata !12), !dbg !15
  store i32 2, i32* %divisor, align 4, !dbg !15
  call void @llvm.dbg.declare(metadata i32* %ret, metadata !16, metadata !12), !dbg !17
  %0 = load i32, i32* %dividend, align 4, !dbg !18
  %1 = load i32, i32* %divisor, align 4, !dbg !19
  %2 = load i32, i32* %divisor, align 4, !dbg !20
  %mul = mul nsw i32 %1, %2, !dbg !21
  %sub = sub nsw i32 %mul, 4, !dbg !22
  %div = sdiv i32 %0, %sub, !dbg !23
  store i32 %div, i32* %ret, align 4, !dbg !24
  ret void, !dbg !25
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind uwtable
define void @zero_division_012_good() #0 !dbg !26 {
entry:
  %dividend = alloca i32, align 4
  %divisor = alloca i32, align 4
  %ret = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %dividend, metadata !27, metadata !12), !dbg !28
  store i32 1000, i32* %dividend, align 4, !dbg !28
  call void @llvm.dbg.declare(metadata i32* %divisor, metadata !29, metadata !12), !dbg !30
  store i32 2, i32* %divisor, align 4, !dbg !30
  call void @llvm.dbg.declare(metadata i32* %ret, metadata !31, metadata !12), !dbg !32
  %0 = load i32, i32* %dividend, align 4, !dbg !33
  %1 = load i32, i32* %divisor, align 4, !dbg !34
  %2 = load i32, i32* %divisor, align 4, !dbg !35
  %mul = mul nsw i32 %1, %2, !dbg !36
  %sub = sub nsw i32 %mul, 3, !dbg !37
  %div = sdiv i32 %0, %sub, !dbg !38
  store i32 %div, i32* %ret, align 4, !dbg !39
  ret void, !dbg !40
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !41 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @zero_division_012_good(), !dbg !44
  call void @zero_division_012_bad(), !dbg !45
  ret i32 0, !dbg !46
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4}
!llvm.ident = !{!5}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (tags/RELEASE_390/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2)
!1 = !DIFile(filename: "369_zero_division_10.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/itc/369")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{!"clang version 3.9.0 (tags/RELEASE_390/final)"}
!6 = distinct !DISubprogram(name: "zero_division_012_bad", scope: !7, file: !7, line: 7, type: !8, isLocal: false, isDefinition: true, scopeLine: 8, isOptimized: false, unit: !0, variables: !2)
!7 = !DIFile(filename: "./369_zero_division_10.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/itc/369")
!8 = !DISubroutineType(types: !9)
!9 = !{null}
!10 = !DILocalVariable(name: "dividend", scope: !6, file: !7, line: 9, type: !11)
!11 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!12 = !DIExpression()
!13 = !DILocation(line: 9, column: 6, scope: !6)
!14 = !DILocalVariable(name: "divisor", scope: !6, file: !7, line: 10, type: !11)
!15 = !DILocation(line: 10, column: 6, scope: !6)
!16 = !DILocalVariable(name: "ret", scope: !6, file: !7, line: 11, type: !11)
!17 = !DILocation(line: 11, column: 6, scope: !6)
!18 = !DILocation(line: 12, column: 8, scope: !6)
!19 = !DILocation(line: 12, column: 20, scope: !6)
!20 = !DILocation(line: 12, column: 30, scope: !6)
!21 = !DILocation(line: 12, column: 28, scope: !6)
!22 = !DILocation(line: 12, column: 38, scope: !6)
!23 = !DILocation(line: 12, column: 17, scope: !6)
!24 = !DILocation(line: 12, column: 6, scope: !6)
!25 = !DILocation(line: 14, column: 1, scope: !6)
!26 = distinct !DISubprogram(name: "zero_division_012_good", scope: !7, file: !7, line: 20, type: !8, isLocal: false, isDefinition: true, scopeLine: 21, isOptimized: false, unit: !0, variables: !2)
!27 = !DILocalVariable(name: "dividend", scope: !26, file: !7, line: 22, type: !11)
!28 = !DILocation(line: 22, column: 6, scope: !26)
!29 = !DILocalVariable(name: "divisor", scope: !26, file: !7, line: 23, type: !11)
!30 = !DILocation(line: 23, column: 6, scope: !26)
!31 = !DILocalVariable(name: "ret", scope: !26, file: !7, line: 24, type: !11)
!32 = !DILocation(line: 24, column: 6, scope: !26)
!33 = !DILocation(line: 25, column: 8, scope: !26)
!34 = !DILocation(line: 25, column: 20, scope: !26)
!35 = !DILocation(line: 25, column: 30, scope: !26)
!36 = !DILocation(line: 25, column: 28, scope: !26)
!37 = !DILocation(line: 25, column: 38, scope: !26)
!38 = !DILocation(line: 25, column: 17, scope: !26)
!39 = !DILocation(line: 25, column: 6, scope: !26)
!40 = !DILocation(line: 27, column: 1, scope: !26)
!41 = distinct !DISubprogram(name: "main", scope: !7, file: !7, line: 29, type: !42, isLocal: false, isDefinition: true, scopeLine: 29, isOptimized: false, unit: !0, variables: !2)
!42 = !DISubroutineType(types: !43)
!43 = !{!11}
!44 = !DILocation(line: 30, column: 3, scope: !41)
!45 = !DILocation(line: 31, column: 2, scope: !41)
!46 = !DILocation(line: 32, column: 3, scope: !41)
