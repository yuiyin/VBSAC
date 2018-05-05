; ModuleID = './191_data_underflow_7.c'
source_filename = "./191_data_underflow_7.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: nounwind uwtable
define void @data_underflow_011_func_001_bad(i32 %d) #0 !dbg !6 {
entry:
  %d.addr = alloca i32, align 4
  %min = alloca i32, align 4
  %ret = alloca i32, align 4
  store i32 %d, i32* %d.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %d.addr, metadata !11, metadata !12), !dbg !13
  call void @llvm.dbg.declare(metadata i32* %min, metadata !14, metadata !12), !dbg !15
  store i32 -2147483647, i32* %min, align 4, !dbg !15
  call void @llvm.dbg.declare(metadata i32* %ret, metadata !16, metadata !12), !dbg !17
  %0 = load i32, i32* %min, align 4, !dbg !18
  %1 = load i32, i32* %d.addr, align 4, !dbg !19
  %sub = sub nsw i32 %0, %1, !dbg !20
  store i32 %sub, i32* %ret, align 4, !dbg !21
  ret void, !dbg !22
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind uwtable
define void @data_underflow_011_bad() #0 !dbg !23 {
entry:
  call void @data_underflow_011_func_001_bad(i32 2), !dbg !26
  ret void, !dbg !27
}

; Function Attrs: nounwind uwtable
define void @data_underflow_011_func_001_good(i32 %d) #0 !dbg !28 {
entry:
  %d.addr = alloca i32, align 4
  %min = alloca i32, align 4
  %ret = alloca i32, align 4
  store i32 %d, i32* %d.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %d.addr, metadata !29, metadata !12), !dbg !30
  call void @llvm.dbg.declare(metadata i32* %min, metadata !31, metadata !12), !dbg !32
  store i32 -2147483646, i32* %min, align 4, !dbg !32
  call void @llvm.dbg.declare(metadata i32* %ret, metadata !33, metadata !12), !dbg !34
  %0 = load i32, i32* %min, align 4, !dbg !35
  %1 = load i32, i32* %d.addr, align 4, !dbg !36
  %sub = sub nsw i32 %0, %1, !dbg !37
  store i32 %sub, i32* %ret, align 4, !dbg !38
  ret void, !dbg !39
}

; Function Attrs: nounwind uwtable
define void @data_underflow_011_good() #0 !dbg !40 {
entry:
  call void @data_underflow_011_func_001_good(i32 2), !dbg !41
  ret void, !dbg !42
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !43 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @data_underflow_011_good(), !dbg !46
  call void @data_underflow_011_bad(), !dbg !47
  ret i32 0, !dbg !48
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4}
!llvm.ident = !{!5}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (tags/RELEASE_390/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2)
!1 = !DIFile(filename: "191_data_underflow_7.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/itc/191")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{!"clang version 3.9.0 (tags/RELEASE_390/final)"}
!6 = distinct !DISubprogram(name: "data_underflow_011_func_001_bad", scope: !7, file: !7, line: 7, type: !8, isLocal: false, isDefinition: true, scopeLine: 8, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!7 = !DIFile(filename: "./191_data_underflow_7.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/itc/191")
!8 = !DISubroutineType(types: !9)
!9 = !{null, !10}
!10 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!11 = !DILocalVariable(name: "d", arg: 1, scope: !6, file: !7, line: 7, type: !10)
!12 = !DIExpression()
!13 = !DILocation(line: 7, column: 43, scope: !6)
!14 = !DILocalVariable(name: "min", scope: !6, file: !7, line: 9, type: !10)
!15 = !DILocation(line: 9, column: 6, scope: !6)
!16 = !DILocalVariable(name: "ret", scope: !6, file: !7, line: 10, type: !10)
!17 = !DILocation(line: 10, column: 6, scope: !6)
!18 = !DILocation(line: 11, column: 8, scope: !6)
!19 = !DILocation(line: 11, column: 14, scope: !6)
!20 = !DILocation(line: 11, column: 12, scope: !6)
!21 = !DILocation(line: 11, column: 6, scope: !6)
!22 = !DILocation(line: 13, column: 1, scope: !6)
!23 = distinct !DISubprogram(name: "data_underflow_011_bad", scope: !7, file: !7, line: 15, type: !24, isLocal: false, isDefinition: true, scopeLine: 16, isOptimized: false, unit: !0, variables: !2)
!24 = !DISubroutineType(types: !25)
!25 = !{null}
!26 = !DILocation(line: 17, column: 2, scope: !23)
!27 = !DILocation(line: 18, column: 1, scope: !23)
!28 = distinct !DISubprogram(name: "data_underflow_011_func_001_good", scope: !7, file: !7, line: 24, type: !8, isLocal: false, isDefinition: true, scopeLine: 25, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!29 = !DILocalVariable(name: "d", arg: 1, scope: !28, file: !7, line: 24, type: !10)
!30 = !DILocation(line: 24, column: 44, scope: !28)
!31 = !DILocalVariable(name: "min", scope: !28, file: !7, line: 26, type: !10)
!32 = !DILocation(line: 26, column: 6, scope: !28)
!33 = !DILocalVariable(name: "ret", scope: !28, file: !7, line: 27, type: !10)
!34 = !DILocation(line: 27, column: 6, scope: !28)
!35 = !DILocation(line: 28, column: 8, scope: !28)
!36 = !DILocation(line: 28, column: 14, scope: !28)
!37 = !DILocation(line: 28, column: 12, scope: !28)
!38 = !DILocation(line: 28, column: 6, scope: !28)
!39 = !DILocation(line: 30, column: 1, scope: !28)
!40 = distinct !DISubprogram(name: "data_underflow_011_good", scope: !7, file: !7, line: 32, type: !24, isLocal: false, isDefinition: true, scopeLine: 33, isOptimized: false, unit: !0, variables: !2)
!41 = !DILocation(line: 34, column: 2, scope: !40)
!42 = !DILocation(line: 35, column: 1, scope: !40)
!43 = distinct !DISubprogram(name: "main", scope: !7, file: !7, line: 37, type: !44, isLocal: false, isDefinition: true, scopeLine: 37, isOptimized: false, unit: !0, variables: !2)
!44 = !DISubroutineType(types: !45)
!45 = !{!10}
!46 = !DILocation(line: 38, column: 2, scope: !43)
!47 = !DILocation(line: 39, column: 3, scope: !43)
!48 = !DILocation(line: 40, column: 3, scope: !43)
