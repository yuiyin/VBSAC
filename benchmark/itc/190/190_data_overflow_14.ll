; ModuleID = './190_data_overflow_14.c'
source_filename = "./190_data_overflow_14.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: nounwind uwtable
define void @data_overflow_021_bad() #0 !dbg !6 {
entry:
  %max = alloca i32, align 4
  %d = alloca i32, align 4
  %d1 = alloca i32, align 4
  %ret = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %max, metadata !10, metadata !12), !dbg !13
  store i32 2147483647, i32* %max, align 4, !dbg !13
  call void @llvm.dbg.declare(metadata i32* %d, metadata !14, metadata !12), !dbg !15
  store i32 1, i32* %d, align 4, !dbg !15
  call void @llvm.dbg.declare(metadata i32* %d1, metadata !16, metadata !12), !dbg !17
  call void @llvm.dbg.declare(metadata i32* %ret, metadata !18, metadata !12), !dbg !19
  %0 = load i32, i32* %d, align 4, !dbg !20
  store i32 %0, i32* %d1, align 4, !dbg !21
  %1 = load i32, i32* %max, align 4, !dbg !22
  %2 = load i32, i32* %d1, align 4, !dbg !23
  %add = add nsw i32 %1, %2, !dbg !24
  store i32 %add, i32* %ret, align 4, !dbg !25
  ret void, !dbg !26
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind uwtable
define void @data_overflow_021_good() #0 !dbg !27 {
entry:
  %max = alloca i32, align 4
  %d = alloca i32, align 4
  %d1 = alloca i32, align 4
  %ret = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %max, metadata !28, metadata !12), !dbg !29
  store i32 2147483646, i32* %max, align 4, !dbg !29
  call void @llvm.dbg.declare(metadata i32* %d, metadata !30, metadata !12), !dbg !31
  store i32 1, i32* %d, align 4, !dbg !31
  call void @llvm.dbg.declare(metadata i32* %d1, metadata !32, metadata !12), !dbg !33
  call void @llvm.dbg.declare(metadata i32* %ret, metadata !34, metadata !12), !dbg !35
  %0 = load i32, i32* %d, align 4, !dbg !36
  store i32 %0, i32* %d1, align 4, !dbg !37
  %1 = load i32, i32* %max, align 4, !dbg !38
  %2 = load i32, i32* %d1, align 4, !dbg !39
  %add = add nsw i32 %1, %2, !dbg !40
  store i32 %add, i32* %ret, align 4, !dbg !41
  ret void, !dbg !42
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !43 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @data_overflow_021_good(), !dbg !46
  call void @data_overflow_021_bad(), !dbg !47
  ret i32 0, !dbg !48
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4}
!llvm.ident = !{!5}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (tags/RELEASE_390/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2)
!1 = !DIFile(filename: "190_data_overflow_14.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/itc/190")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{!"clang version 3.9.0 (tags/RELEASE_390/final)"}
!6 = distinct !DISubprogram(name: "data_overflow_021_bad", scope: !7, file: !7, line: 7, type: !8, isLocal: false, isDefinition: true, scopeLine: 8, isOptimized: false, unit: !0, variables: !2)
!7 = !DIFile(filename: "./190_data_overflow_14.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/itc/190")
!8 = !DISubroutineType(types: !9)
!9 = !{null}
!10 = !DILocalVariable(name: "max", scope: !6, file: !7, line: 9, type: !11)
!11 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!12 = !DIExpression()
!13 = !DILocation(line: 9, column: 6, scope: !6)
!14 = !DILocalVariable(name: "d", scope: !6, file: !7, line: 10, type: !11)
!15 = !DILocation(line: 10, column: 6, scope: !6)
!16 = !DILocalVariable(name: "d1", scope: !6, file: !7, line: 11, type: !11)
!17 = !DILocation(line: 11, column: 6, scope: !6)
!18 = !DILocalVariable(name: "ret", scope: !6, file: !7, line: 12, type: !11)
!19 = !DILocation(line: 12, column: 6, scope: !6)
!20 = !DILocation(line: 13, column: 7, scope: !6)
!21 = !DILocation(line: 13, column: 5, scope: !6)
!22 = !DILocation(line: 14, column: 8, scope: !6)
!23 = !DILocation(line: 14, column: 14, scope: !6)
!24 = !DILocation(line: 14, column: 12, scope: !6)
!25 = !DILocation(line: 14, column: 6, scope: !6)
!26 = !DILocation(line: 16, column: 1, scope: !6)
!27 = distinct !DISubprogram(name: "data_overflow_021_good", scope: !7, file: !7, line: 22, type: !8, isLocal: false, isDefinition: true, scopeLine: 23, isOptimized: false, unit: !0, variables: !2)
!28 = !DILocalVariable(name: "max", scope: !27, file: !7, line: 24, type: !11)
!29 = !DILocation(line: 24, column: 6, scope: !27)
!30 = !DILocalVariable(name: "d", scope: !27, file: !7, line: 25, type: !11)
!31 = !DILocation(line: 25, column: 6, scope: !27)
!32 = !DILocalVariable(name: "d1", scope: !27, file: !7, line: 26, type: !11)
!33 = !DILocation(line: 26, column: 6, scope: !27)
!34 = !DILocalVariable(name: "ret", scope: !27, file: !7, line: 27, type: !11)
!35 = !DILocation(line: 27, column: 6, scope: !27)
!36 = !DILocation(line: 28, column: 7, scope: !27)
!37 = !DILocation(line: 28, column: 5, scope: !27)
!38 = !DILocation(line: 29, column: 8, scope: !27)
!39 = !DILocation(line: 29, column: 14, scope: !27)
!40 = !DILocation(line: 29, column: 12, scope: !27)
!41 = !DILocation(line: 29, column: 6, scope: !27)
!42 = !DILocation(line: 31, column: 1, scope: !27)
!43 = distinct !DISubprogram(name: "main", scope: !7, file: !7, line: 33, type: !44, isLocal: false, isDefinition: true, scopeLine: 33, isOptimized: false, unit: !0, variables: !2)
!44 = !DISubroutineType(types: !45)
!45 = !{!11}
!46 = !DILocation(line: 34, column: 2, scope: !43)
!47 = !DILocation(line: 35, column: 2, scope: !43)
!48 = !DILocation(line: 36, column: 2, scope: !43)
