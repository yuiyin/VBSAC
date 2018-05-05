; ModuleID = './369_zero_division_9.c'
source_filename = "./369_zero_division_9.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: nounwind uwtable
define void @zero_division_011_bad() #0 !dbg !6 {
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
  %mul = mul nsw i32 2, %1, !dbg !20
  %sub = sub nsw i32 %mul, 4, !dbg !21
  %div = sdiv i32 %0, %sub, !dbg !22
  store i32 %div, i32* %ret, align 4, !dbg !23
  ret void, !dbg !24
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind uwtable
define void @zero_division_011_good() #0 !dbg !25 {
entry:
  %dividend = alloca i32, align 4
  %divisor = alloca i32, align 4
  %ret = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %dividend, metadata !26, metadata !12), !dbg !27
  store i32 1000, i32* %dividend, align 4, !dbg !27
  call void @llvm.dbg.declare(metadata i32* %divisor, metadata !28, metadata !12), !dbg !29
  store i32 2, i32* %divisor, align 4, !dbg !29
  call void @llvm.dbg.declare(metadata i32* %ret, metadata !30, metadata !12), !dbg !31
  %0 = load i32, i32* %dividend, align 4, !dbg !32
  %1 = load i32, i32* %divisor, align 4, !dbg !33
  %mul = mul nsw i32 2, %1, !dbg !34
  %sub = sub nsw i32 %mul, 3, !dbg !35
  %div = sdiv i32 %0, %sub, !dbg !36
  store i32 %div, i32* %ret, align 4, !dbg !37
  ret void, !dbg !38
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !39 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @zero_division_011_good(), !dbg !42
  call void @zero_division_011_bad(), !dbg !43
  ret i32 0, !dbg !44
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4}
!llvm.ident = !{!5}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (tags/RELEASE_390/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2)
!1 = !DIFile(filename: "369_zero_division_9.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/itc/369")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{!"clang version 3.9.0 (tags/RELEASE_390/final)"}
!6 = distinct !DISubprogram(name: "zero_division_011_bad", scope: !7, file: !7, line: 7, type: !8, isLocal: false, isDefinition: true, scopeLine: 8, isOptimized: false, unit: !0, variables: !2)
!7 = !DIFile(filename: "./369_zero_division_9.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/itc/369")
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
!19 = !DILocation(line: 12, column: 24, scope: !6)
!20 = !DILocation(line: 12, column: 22, scope: !6)
!21 = !DILocation(line: 12, column: 32, scope: !6)
!22 = !DILocation(line: 12, column: 17, scope: !6)
!23 = !DILocation(line: 12, column: 6, scope: !6)
!24 = !DILocation(line: 13, column: 1, scope: !6)
!25 = distinct !DISubprogram(name: "zero_division_011_good", scope: !7, file: !7, line: 19, type: !8, isLocal: false, isDefinition: true, scopeLine: 20, isOptimized: false, unit: !0, variables: !2)
!26 = !DILocalVariable(name: "dividend", scope: !25, file: !7, line: 21, type: !11)
!27 = !DILocation(line: 21, column: 6, scope: !25)
!28 = !DILocalVariable(name: "divisor", scope: !25, file: !7, line: 22, type: !11)
!29 = !DILocation(line: 22, column: 6, scope: !25)
!30 = !DILocalVariable(name: "ret", scope: !25, file: !7, line: 23, type: !11)
!31 = !DILocation(line: 23, column: 6, scope: !25)
!32 = !DILocation(line: 24, column: 8, scope: !25)
!33 = !DILocation(line: 24, column: 24, scope: !25)
!34 = !DILocation(line: 24, column: 22, scope: !25)
!35 = !DILocation(line: 24, column: 32, scope: !25)
!36 = !DILocation(line: 24, column: 17, scope: !25)
!37 = !DILocation(line: 24, column: 6, scope: !25)
!38 = !DILocation(line: 25, column: 1, scope: !25)
!39 = distinct !DISubprogram(name: "main", scope: !7, file: !7, line: 27, type: !40, isLocal: false, isDefinition: true, scopeLine: 27, isOptimized: false, unit: !0, variables: !2)
!40 = !DISubroutineType(types: !41)
!41 = !{!11}
!42 = !DILocation(line: 28, column: 2, scope: !39)
!43 = !DILocation(line: 29, column: 3, scope: !39)
!44 = !DILocation(line: 30, column: 3, scope: !39)
