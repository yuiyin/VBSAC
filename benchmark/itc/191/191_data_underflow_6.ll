; ModuleID = './191_data_underflow_6.c'
source_filename = "./191_data_underflow_6.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: nounwind uwtable
define i32 @data_underflow_010_func_001() #0 !dbg !6 {
entry:
  ret i32 2, !dbg !11
}

; Function Attrs: nounwind uwtable
define void @data_underflow_010_bad() #0 !dbg !12 {
entry:
  %min = alloca i32, align 4
  %ret = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %min, metadata !15, metadata !16), !dbg !17
  store i32 -2147483647, i32* %min, align 4, !dbg !17
  call void @llvm.dbg.declare(metadata i32* %ret, metadata !18, metadata !16), !dbg !19
  %0 = load i32, i32* %min, align 4, !dbg !20
  %call = call i32 @data_underflow_010_func_001(), !dbg !21
  %sub = sub nsw i32 %0, %call, !dbg !22
  store i32 %sub, i32* %ret, align 4, !dbg !23
  ret void, !dbg !24
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind uwtable
define void @data_underflow_010_good() #0 !dbg !25 {
entry:
  %min = alloca i32, align 4
  %ret = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %min, metadata !26, metadata !16), !dbg !27
  store i32 -2147483646, i32* %min, align 4, !dbg !27
  call void @llvm.dbg.declare(metadata i32* %ret, metadata !28, metadata !16), !dbg !29
  %0 = load i32, i32* %min, align 4, !dbg !30
  %call = call i32 @data_underflow_010_func_001(), !dbg !31
  %sub = sub nsw i32 %0, %call, !dbg !32
  store i32 %sub, i32* %ret, align 4, !dbg !33
  ret void, !dbg !34
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !35 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @data_underflow_010_good(), !dbg !36
  call void @data_underflow_010_bad(), !dbg !37
  ret i32 0, !dbg !38
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4}
!llvm.ident = !{!5}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (tags/RELEASE_390/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2)
!1 = !DIFile(filename: "191_data_underflow_6.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/itc/191")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{!"clang version 3.9.0 (tags/RELEASE_390/final)"}
!6 = distinct !DISubprogram(name: "data_underflow_010_func_001", scope: !7, file: !7, line: 7, type: !8, isLocal: false, isDefinition: true, scopeLine: 8, isOptimized: false, unit: !0, variables: !2)
!7 = !DIFile(filename: "./191_data_underflow_6.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/itc/191")
!8 = !DISubroutineType(types: !9)
!9 = !{!10}
!10 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!11 = !DILocation(line: 9, column: 2, scope: !6)
!12 = distinct !DISubprogram(name: "data_underflow_010_bad", scope: !7, file: !7, line: 12, type: !13, isLocal: false, isDefinition: true, scopeLine: 13, isOptimized: false, unit: !0, variables: !2)
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "min", scope: !12, file: !7, line: 14, type: !10)
!16 = !DIExpression()
!17 = !DILocation(line: 14, column: 6, scope: !12)
!18 = !DILocalVariable(name: "ret", scope: !12, file: !7, line: 15, type: !10)
!19 = !DILocation(line: 15, column: 6, scope: !12)
!20 = !DILocation(line: 16, column: 8, scope: !12)
!21 = !DILocation(line: 16, column: 14, scope: !12)
!22 = !DILocation(line: 16, column: 12, scope: !12)
!23 = !DILocation(line: 16, column: 6, scope: !12)
!24 = !DILocation(line: 18, column: 1, scope: !12)
!25 = distinct !DISubprogram(name: "data_underflow_010_good", scope: !7, file: !7, line: 20, type: !13, isLocal: false, isDefinition: true, scopeLine: 21, isOptimized: false, unit: !0, variables: !2)
!26 = !DILocalVariable(name: "min", scope: !25, file: !7, line: 22, type: !10)
!27 = !DILocation(line: 22, column: 6, scope: !25)
!28 = !DILocalVariable(name: "ret", scope: !25, file: !7, line: 23, type: !10)
!29 = !DILocation(line: 23, column: 6, scope: !25)
!30 = !DILocation(line: 24, column: 8, scope: !25)
!31 = !DILocation(line: 24, column: 14, scope: !25)
!32 = !DILocation(line: 24, column: 12, scope: !25)
!33 = !DILocation(line: 24, column: 6, scope: !25)
!34 = !DILocation(line: 26, column: 1, scope: !25)
!35 = distinct !DISubprogram(name: "main", scope: !7, file: !7, line: 28, type: !8, isLocal: false, isDefinition: true, scopeLine: 28, isOptimized: false, unit: !0, variables: !2)
!36 = !DILocation(line: 29, column: 3, scope: !35)
!37 = !DILocation(line: 30, column: 2, scope: !35)
!38 = !DILocation(line: 31, column: 3, scope: !35)
