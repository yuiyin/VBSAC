; ModuleID = './369_zero_division_6.c'
source_filename = "./369_zero_division_6.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.zero_division_007_s_001 = type { i32, i32, i32 }

@zero_division_007_s_gbl_bad = common global %struct.zero_division_007_s_001 zeroinitializer, align 4
@zero_division_007_s_gbl_good = common global %struct.zero_division_007_s_001 zeroinitializer, align 4

; Function Attrs: nounwind uwtable
define void @zero_division_007_func_001_bad() #0 !dbg !17 {
entry:
  store i32 0, i32* getelementptr inbounds (%struct.zero_division_007_s_001, %struct.zero_division_007_s_001* @zero_division_007_s_gbl_bad, i32 0, i32 2), align 4, !dbg !20
  ret void, !dbg !21
}

; Function Attrs: nounwind uwtable
define void @zero_division_007_bad() #0 !dbg !22 {
entry:
  %dividend = alloca i32, align 4
  %ret = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %dividend, metadata !23, metadata !24), !dbg !25
  store i32 1000, i32* %dividend, align 4, !dbg !25
  call void @llvm.dbg.declare(metadata i32* %ret, metadata !26, metadata !24), !dbg !27
  call void @zero_division_007_func_001_bad(), !dbg !28
  %0 = load i32, i32* %dividend, align 4, !dbg !29
  %1 = load i32, i32* getelementptr inbounds (%struct.zero_division_007_s_001, %struct.zero_division_007_s_001* @zero_division_007_s_gbl_bad, i32 0, i32 2), align 4, !dbg !30
  %div = sdiv i32 %0, %1, !dbg !31
  store i32 %div, i32* %ret, align 4, !dbg !32
  ret void, !dbg !33
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind uwtable
define void @zero_division_007_func_001_good() #0 !dbg !34 {
entry:
  store i32 1, i32* getelementptr inbounds (%struct.zero_division_007_s_001, %struct.zero_division_007_s_001* @zero_division_007_s_gbl_good, i32 0, i32 2), align 4, !dbg !35
  ret void, !dbg !36
}

; Function Attrs: nounwind uwtable
define void @zero_division_007_good() #0 !dbg !37 {
entry:
  %dividend = alloca i32, align 4
  %ret = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %dividend, metadata !38, metadata !24), !dbg !39
  store i32 1000, i32* %dividend, align 4, !dbg !39
  call void @llvm.dbg.declare(metadata i32* %ret, metadata !40, metadata !24), !dbg !41
  call void @zero_division_007_func_001_good(), !dbg !42
  %0 = load i32, i32* %dividend, align 4, !dbg !43
  %1 = load i32, i32* getelementptr inbounds (%struct.zero_division_007_s_001, %struct.zero_division_007_s_001* @zero_division_007_s_gbl_good, i32 0, i32 2), align 4, !dbg !44
  %div = sdiv i32 %0, %1, !dbg !45
  store i32 %div, i32* %ret, align 4, !dbg !46
  ret void, !dbg !47
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !48 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @zero_division_007_good(), !dbg !51
  call void @zero_division_007_bad(), !dbg !52
  ret i32 0, !dbg !53
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!14, !15}
!llvm.ident = !{!16}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (tags/RELEASE_390/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, globals: !3)
!1 = !DIFile(filename: "369_zero_division_6.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/itc/369")
!2 = !{}
!3 = !{!4, !13}
!4 = distinct !DIGlobalVariable(name: "zero_division_007_s_gbl_bad", scope: !0, file: !5, line: 13, type: !6, isLocal: false, isDefinition: true, variable: %struct.zero_division_007_s_001* @zero_division_007_s_gbl_bad)
!5 = !DIFile(filename: "./369_zero_division_6.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/itc/369")
!6 = !DIDerivedType(tag: DW_TAG_typedef, name: "zero_division_007_s_001", file: !5, line: 11, baseType: !7)
!7 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !5, line: 7, size: 96, align: 32, elements: !8)
!8 = !{!9, !11, !12}
!9 = !DIDerivedType(tag: DW_TAG_member, name: "a", scope: !7, file: !5, line: 8, baseType: !10, size: 32, align: 32)
!10 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!11 = !DIDerivedType(tag: DW_TAG_member, name: "b", scope: !7, file: !5, line: 9, baseType: !10, size: 32, align: 32, offset: 32)
!12 = !DIDerivedType(tag: DW_TAG_member, name: "divisor", scope: !7, file: !5, line: 10, baseType: !10, size: 32, align: 32, offset: 64)
!13 = distinct !DIGlobalVariable(name: "zero_division_007_s_gbl_good", scope: !0, file: !5, line: 28, type: !6, isLocal: false, isDefinition: true, variable: %struct.zero_division_007_s_001* @zero_division_007_s_gbl_good)
!14 = !{i32 2, !"Dwarf Version", i32 4}
!15 = !{i32 2, !"Debug Info Version", i32 3}
!16 = !{!"clang version 3.9.0 (tags/RELEASE_390/final)"}
!17 = distinct !DISubprogram(name: "zero_division_007_func_001_bad", scope: !5, file: !5, line: 15, type: !18, isLocal: false, isDefinition: true, scopeLine: 16, isOptimized: false, unit: !0, variables: !2)
!18 = !DISubroutineType(types: !19)
!19 = !{null}
!20 = !DILocation(line: 17, column: 38, scope: !17)
!21 = !DILocation(line: 18, column: 1, scope: !17)
!22 = distinct !DISubprogram(name: "zero_division_007_bad", scope: !5, file: !5, line: 20, type: !18, isLocal: false, isDefinition: true, scopeLine: 21, isOptimized: false, unit: !0, variables: !2)
!23 = !DILocalVariable(name: "dividend", scope: !22, file: !5, line: 22, type: !10)
!24 = !DIExpression()
!25 = !DILocation(line: 22, column: 6, scope: !22)
!26 = !DILocalVariable(name: "ret", scope: !22, file: !5, line: 23, type: !10)
!27 = !DILocation(line: 23, column: 6, scope: !22)
!28 = !DILocation(line: 24, column: 2, scope: !22)
!29 = !DILocation(line: 25, column: 8, scope: !22)
!30 = !DILocation(line: 25, column: 47, scope: !22)
!31 = !DILocation(line: 25, column: 17, scope: !22)
!32 = !DILocation(line: 25, column: 6, scope: !22)
!33 = !DILocation(line: 26, column: 1, scope: !22)
!34 = distinct !DISubprogram(name: "zero_division_007_func_001_good", scope: !5, file: !5, line: 30, type: !18, isLocal: false, isDefinition: true, scopeLine: 31, isOptimized: false, unit: !0, variables: !2)
!35 = !DILocation(line: 32, column: 39, scope: !34)
!36 = !DILocation(line: 33, column: 1, scope: !34)
!37 = distinct !DISubprogram(name: "zero_division_007_good", scope: !5, file: !5, line: 35, type: !18, isLocal: false, isDefinition: true, scopeLine: 36, isOptimized: false, unit: !0, variables: !2)
!38 = !DILocalVariable(name: "dividend", scope: !37, file: !5, line: 37, type: !10)
!39 = !DILocation(line: 37, column: 6, scope: !37)
!40 = !DILocalVariable(name: "ret", scope: !37, file: !5, line: 38, type: !10)
!41 = !DILocation(line: 38, column: 6, scope: !37)
!42 = !DILocation(line: 39, column: 2, scope: !37)
!43 = !DILocation(line: 40, column: 8, scope: !37)
!44 = !DILocation(line: 40, column: 48, scope: !37)
!45 = !DILocation(line: 40, column: 17, scope: !37)
!46 = !DILocation(line: 40, column: 6, scope: !37)
!47 = !DILocation(line: 41, column: 1, scope: !37)
!48 = distinct !DISubprogram(name: "main", scope: !5, file: !5, line: 43, type: !49, isLocal: false, isDefinition: true, scopeLine: 43, isOptimized: false, unit: !0, variables: !2)
!49 = !DISubroutineType(types: !50)
!50 = !{!10}
!51 = !DILocation(line: 44, column: 2, scope: !48)
!52 = !DILocation(line: 45, column: 3, scope: !48)
!53 = !DILocation(line: 46, column: 3, scope: !48)
