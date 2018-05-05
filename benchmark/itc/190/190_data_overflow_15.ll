; ModuleID = './190_data_overflow_15.c'
source_filename = "./190_data_overflow_15.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: nounwind uwtable
define void @data_overflow_022_bad() #0 !dbg !6 {
entry:
  %max = alloca i32, align 4
  %d = alloca i32, align 4
  %d1 = alloca i32, align 4
  %d2 = alloca i32, align 4
  %ret = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %max, metadata !10, metadata !12), !dbg !13
  store i32 2147483647, i32* %max, align 4, !dbg !13
  call void @llvm.dbg.declare(metadata i32* %d, metadata !14, metadata !12), !dbg !15
  store i32 1, i32* %d, align 4, !dbg !15
  call void @llvm.dbg.declare(metadata i32* %d1, metadata !16, metadata !12), !dbg !17
  call void @llvm.dbg.declare(metadata i32* %d2, metadata !18, metadata !12), !dbg !19
  call void @llvm.dbg.declare(metadata i32* %ret, metadata !20, metadata !12), !dbg !21
  %0 = load i32, i32* %d, align 4, !dbg !22
  store i32 %0, i32* %d1, align 4, !dbg !23
  %1 = load i32, i32* %d1, align 4, !dbg !24
  store i32 %1, i32* %d2, align 4, !dbg !25
  %2 = load i32, i32* %max, align 4, !dbg !26
  %3 = load i32, i32* %d2, align 4, !dbg !27
  %add = add nsw i32 %2, %3, !dbg !28
  store i32 %add, i32* %ret, align 4, !dbg !29
  ret void, !dbg !30
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind uwtable
define void @data_overflow_022_good() #0 !dbg !31 {
entry:
  %max = alloca i32, align 4
  %d = alloca i32, align 4
  %d1 = alloca i32, align 4
  %d2 = alloca i32, align 4
  %ret = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %max, metadata !32, metadata !12), !dbg !33
  store i32 2147483646, i32* %max, align 4, !dbg !33
  call void @llvm.dbg.declare(metadata i32* %d, metadata !34, metadata !12), !dbg !35
  store i32 1, i32* %d, align 4, !dbg !35
  call void @llvm.dbg.declare(metadata i32* %d1, metadata !36, metadata !12), !dbg !37
  call void @llvm.dbg.declare(metadata i32* %d2, metadata !38, metadata !12), !dbg !39
  call void @llvm.dbg.declare(metadata i32* %ret, metadata !40, metadata !12), !dbg !41
  %0 = load i32, i32* %d, align 4, !dbg !42
  store i32 %0, i32* %d1, align 4, !dbg !43
  %1 = load i32, i32* %d1, align 4, !dbg !44
  store i32 %1, i32* %d2, align 4, !dbg !45
  %2 = load i32, i32* %max, align 4, !dbg !46
  %3 = load i32, i32* %d2, align 4, !dbg !47
  %add = add nsw i32 %2, %3, !dbg !48
  store i32 %add, i32* %ret, align 4, !dbg !49
  ret void, !dbg !50
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !51 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @data_overflow_022_good(), !dbg !54
  call void @data_overflow_022_bad(), !dbg !55
  ret i32 0, !dbg !56
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4}
!llvm.ident = !{!5}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (tags/RELEASE_390/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2)
!1 = !DIFile(filename: "190_data_overflow_15.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/itc/190")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{!"clang version 3.9.0 (tags/RELEASE_390/final)"}
!6 = distinct !DISubprogram(name: "data_overflow_022_bad", scope: !7, file: !7, line: 7, type: !8, isLocal: false, isDefinition: true, scopeLine: 8, isOptimized: false, unit: !0, variables: !2)
!7 = !DIFile(filename: "./190_data_overflow_15.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/itc/190")
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
!18 = !DILocalVariable(name: "d2", scope: !6, file: !7, line: 12, type: !11)
!19 = !DILocation(line: 12, column: 6, scope: !6)
!20 = !DILocalVariable(name: "ret", scope: !6, file: !7, line: 13, type: !11)
!21 = !DILocation(line: 13, column: 6, scope: !6)
!22 = !DILocation(line: 14, column: 7, scope: !6)
!23 = !DILocation(line: 14, column: 5, scope: !6)
!24 = !DILocation(line: 15, column: 7, scope: !6)
!25 = !DILocation(line: 15, column: 5, scope: !6)
!26 = !DILocation(line: 16, column: 8, scope: !6)
!27 = !DILocation(line: 16, column: 14, scope: !6)
!28 = !DILocation(line: 16, column: 12, scope: !6)
!29 = !DILocation(line: 16, column: 6, scope: !6)
!30 = !DILocation(line: 18, column: 1, scope: !6)
!31 = distinct !DISubprogram(name: "data_overflow_022_good", scope: !7, file: !7, line: 24, type: !8, isLocal: false, isDefinition: true, scopeLine: 25, isOptimized: false, unit: !0, variables: !2)
!32 = !DILocalVariable(name: "max", scope: !31, file: !7, line: 26, type: !11)
!33 = !DILocation(line: 26, column: 6, scope: !31)
!34 = !DILocalVariable(name: "d", scope: !31, file: !7, line: 27, type: !11)
!35 = !DILocation(line: 27, column: 6, scope: !31)
!36 = !DILocalVariable(name: "d1", scope: !31, file: !7, line: 28, type: !11)
!37 = !DILocation(line: 28, column: 6, scope: !31)
!38 = !DILocalVariable(name: "d2", scope: !31, file: !7, line: 29, type: !11)
!39 = !DILocation(line: 29, column: 6, scope: !31)
!40 = !DILocalVariable(name: "ret", scope: !31, file: !7, line: 30, type: !11)
!41 = !DILocation(line: 30, column: 6, scope: !31)
!42 = !DILocation(line: 31, column: 7, scope: !31)
!43 = !DILocation(line: 31, column: 5, scope: !31)
!44 = !DILocation(line: 32, column: 7, scope: !31)
!45 = !DILocation(line: 32, column: 5, scope: !31)
!46 = !DILocation(line: 33, column: 8, scope: !31)
!47 = !DILocation(line: 33, column: 14, scope: !31)
!48 = !DILocation(line: 33, column: 12, scope: !31)
!49 = !DILocation(line: 33, column: 6, scope: !31)
!50 = !DILocation(line: 35, column: 1, scope: !31)
!51 = distinct !DISubprogram(name: "main", scope: !7, file: !7, line: 37, type: !52, isLocal: false, isDefinition: true, scopeLine: 37, isOptimized: false, unit: !0, variables: !2)
!52 = !DISubroutineType(types: !53)
!53 = !{!11}
!54 = !DILocation(line: 38, column: 2, scope: !51)
!55 = !DILocation(line: 39, column: 2, scope: !51)
!56 = !DILocation(line: 40, column: 2, scope: !51)
