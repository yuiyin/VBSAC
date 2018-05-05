; ModuleID = './190_data_overflow_10.c'
source_filename = "./190_data_overflow_10.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: nounwind uwtable
define void @data_overflow_016_bad() #0 !dbg !6 {
entry:
  %max = alloca i32, align 4
  %ret = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %max, metadata !10, metadata !12), !dbg !13
  store i32 429496729, i32* %max, align 4, !dbg !13
  call void @llvm.dbg.declare(metadata i32* %ret, metadata !14, metadata !12), !dbg !15
  %0 = load i32, i32* %max, align 4, !dbg !16
  %mul = mul nsw i32 5, %0, !dbg !17
  %add = add nsw i32 %mul, 3, !dbg !18
  store i32 %add, i32* %ret, align 4, !dbg !19
  ret void, !dbg !20
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind uwtable
define void @data_overflow_016_good() #0 !dbg !21 {
entry:
  %max = alloca i32, align 4
  %ret = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %max, metadata !22, metadata !12), !dbg !23
  store i32 429496729, i32* %max, align 4, !dbg !23
  call void @llvm.dbg.declare(metadata i32* %ret, metadata !24, metadata !12), !dbg !25
  %0 = load i32, i32* %max, align 4, !dbg !26
  %mul = mul nsw i32 5, %0, !dbg !27
  %add = add nsw i32 %mul, 2, !dbg !28
  store i32 %add, i32* %ret, align 4, !dbg !29
  ret void, !dbg !30
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !31 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @data_overflow_016_good(), !dbg !34
  call void @data_overflow_016_bad(), !dbg !35
  ret i32 0, !dbg !36
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4}
!llvm.ident = !{!5}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (tags/RELEASE_390/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2)
!1 = !DIFile(filename: "190_data_overflow_10.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/itc/190")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{!"clang version 3.9.0 (tags/RELEASE_390/final)"}
!6 = distinct !DISubprogram(name: "data_overflow_016_bad", scope: !7, file: !7, line: 7, type: !8, isLocal: false, isDefinition: true, scopeLine: 8, isOptimized: false, unit: !0, variables: !2)
!7 = !DIFile(filename: "./190_data_overflow_10.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/itc/190")
!8 = !DISubroutineType(types: !9)
!9 = !{null}
!10 = !DILocalVariable(name: "max", scope: !6, file: !7, line: 9, type: !11)
!11 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!12 = !DIExpression()
!13 = !DILocation(line: 9, column: 6, scope: !6)
!14 = !DILocalVariable(name: "ret", scope: !6, file: !7, line: 10, type: !11)
!15 = !DILocation(line: 10, column: 6, scope: !6)
!16 = !DILocation(line: 11, column: 13, scope: !6)
!17 = !DILocation(line: 11, column: 11, scope: !6)
!18 = !DILocation(line: 11, column: 18, scope: !6)
!19 = !DILocation(line: 11, column: 6, scope: !6)
!20 = !DILocation(line: 13, column: 1, scope: !6)
!21 = distinct !DISubprogram(name: "data_overflow_016_good", scope: !7, file: !7, line: 19, type: !8, isLocal: false, isDefinition: true, scopeLine: 20, isOptimized: false, unit: !0, variables: !2)
!22 = !DILocalVariable(name: "max", scope: !21, file: !7, line: 21, type: !11)
!23 = !DILocation(line: 21, column: 6, scope: !21)
!24 = !DILocalVariable(name: "ret", scope: !21, file: !7, line: 22, type: !11)
!25 = !DILocation(line: 22, column: 6, scope: !21)
!26 = !DILocation(line: 23, column: 13, scope: !21)
!27 = !DILocation(line: 23, column: 11, scope: !21)
!28 = !DILocation(line: 23, column: 18, scope: !21)
!29 = !DILocation(line: 23, column: 6, scope: !21)
!30 = !DILocation(line: 25, column: 1, scope: !21)
!31 = distinct !DISubprogram(name: "main", scope: !7, file: !7, line: 27, type: !32, isLocal: false, isDefinition: true, scopeLine: 27, isOptimized: false, unit: !0, variables: !2)
!32 = !DISubroutineType(types: !33)
!33 = !{!11}
!34 = !DILocation(line: 28, column: 2, scope: !31)
!35 = !DILocation(line: 29, column: 2, scope: !31)
!36 = !DILocation(line: 30, column: 2, scope: !31)
