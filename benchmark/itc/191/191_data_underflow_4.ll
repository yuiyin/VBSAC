; ModuleID = './191_data_underflow_4.c'
source_filename = "./191_data_underflow_4.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: nounwind uwtable
define void @data_underflow_005_bad() #0 !dbg !6 {
entry:
  %min = alloca i32, align 4
  %ret = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %min, metadata !10, metadata !12), !dbg !13
  store i32 -1073741825, i32* %min, align 4, !dbg !13
  call void @llvm.dbg.declare(metadata i32* %ret, metadata !14, metadata !12), !dbg !15
  %0 = load i32, i32* %min, align 4, !dbg !16
  %mul = mul nsw i32 %0, 2, !dbg !17
  store i32 %mul, i32* %ret, align 4, !dbg !18
  ret void, !dbg !19
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind uwtable
define void @data_underflow_005_good() #0 !dbg !20 {
entry:
  %min = alloca i32, align 4
  %ret = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %min, metadata !21, metadata !12), !dbg !22
  store i32 -1073741824, i32* %min, align 4, !dbg !22
  call void @llvm.dbg.declare(metadata i32* %ret, metadata !23, metadata !12), !dbg !24
  %0 = load i32, i32* %min, align 4, !dbg !25
  %mul = mul nsw i32 %0, 2, !dbg !26
  store i32 %mul, i32* %ret, align 4, !dbg !27
  ret void, !dbg !28
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !29 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @data_underflow_005_good(), !dbg !32
  call void @data_underflow_005_bad(), !dbg !33
  ret i32 0, !dbg !34
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4}
!llvm.ident = !{!5}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (tags/RELEASE_390/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2)
!1 = !DIFile(filename: "191_data_underflow_4.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/itc/191")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{!"clang version 3.9.0 (tags/RELEASE_390/final)"}
!6 = distinct !DISubprogram(name: "data_underflow_005_bad", scope: !7, file: !7, line: 7, type: !8, isLocal: false, isDefinition: true, scopeLine: 8, isOptimized: false, unit: !0, variables: !2)
!7 = !DIFile(filename: "./191_data_underflow_4.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/itc/191")
!8 = !DISubroutineType(types: !9)
!9 = !{null}
!10 = !DILocalVariable(name: "min", scope: !6, file: !7, line: 9, type: !11)
!11 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!12 = !DIExpression()
!13 = !DILocation(line: 9, column: 6, scope: !6)
!14 = !DILocalVariable(name: "ret", scope: !6, file: !7, line: 10, type: !11)
!15 = !DILocation(line: 10, column: 6, scope: !6)
!16 = !DILocation(line: 11, column: 8, scope: !6)
!17 = !DILocation(line: 11, column: 12, scope: !6)
!18 = !DILocation(line: 11, column: 6, scope: !6)
!19 = !DILocation(line: 13, column: 1, scope: !6)
!20 = distinct !DISubprogram(name: "data_underflow_005_good", scope: !7, file: !7, line: 19, type: !8, isLocal: false, isDefinition: true, scopeLine: 20, isOptimized: false, unit: !0, variables: !2)
!21 = !DILocalVariable(name: "min", scope: !20, file: !7, line: 21, type: !11)
!22 = !DILocation(line: 21, column: 6, scope: !20)
!23 = !DILocalVariable(name: "ret", scope: !20, file: !7, line: 22, type: !11)
!24 = !DILocation(line: 22, column: 6, scope: !20)
!25 = !DILocation(line: 23, column: 8, scope: !20)
!26 = !DILocation(line: 23, column: 12, scope: !20)
!27 = !DILocation(line: 23, column: 6, scope: !20)
!28 = !DILocation(line: 25, column: 1, scope: !20)
!29 = distinct !DISubprogram(name: "main", scope: !7, file: !7, line: 27, type: !30, isLocal: false, isDefinition: true, scopeLine: 27, isOptimized: false, unit: !0, variables: !2)
!30 = !DISubroutineType(types: !31)
!31 = !{!11}
!32 = !DILocation(line: 28, column: 3, scope: !29)
!33 = !DILocation(line: 29, column: 2, scope: !29)
!34 = !DILocation(line: 30, column: 3, scope: !29)
