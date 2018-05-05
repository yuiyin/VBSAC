; ModuleID = './369_zero_division_5.c'
source_filename = "./369_zero_division_5.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@zero_division_006_gbl_divisor_bad = global i32 0, align 4
@zero_division_006_gbl_divisor_good = global i32 1, align 4

; Function Attrs: nounwind uwtable
define void @zero_division_006_bad() #0 !dbg !11 {
entry:
  %dividend = alloca i32, align 4
  %p = alloca i32*, align 8
  %ret = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %dividend, metadata !14, metadata !15), !dbg !16
  store i32 1000, i32* %dividend, align 4, !dbg !16
  call void @llvm.dbg.declare(metadata i32** %p, metadata !17, metadata !15), !dbg !19
  call void @llvm.dbg.declare(metadata i32* %ret, metadata !20, metadata !15), !dbg !21
  store i32* @zero_division_006_gbl_divisor_bad, i32** %p, align 8, !dbg !22
  %0 = load i32, i32* %dividend, align 4, !dbg !23
  %1 = load i32*, i32** %p, align 8, !dbg !24
  %2 = load i32, i32* %1, align 4, !dbg !25
  %div = sdiv i32 %0, %2, !dbg !26
  store i32 %div, i32* %ret, align 4, !dbg !27
  ret void, !dbg !28
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind uwtable
define void @zero_division_006_good() #0 !dbg !29 {
entry:
  %dividend = alloca i32, align 4
  %p = alloca i32*, align 8
  %ret = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %dividend, metadata !30, metadata !15), !dbg !31
  store i32 1000, i32* %dividend, align 4, !dbg !31
  call void @llvm.dbg.declare(metadata i32** %p, metadata !32, metadata !15), !dbg !33
  call void @llvm.dbg.declare(metadata i32* %ret, metadata !34, metadata !15), !dbg !35
  store i32* @zero_division_006_gbl_divisor_good, i32** %p, align 8, !dbg !36
  %0 = load i32, i32* %dividend, align 4, !dbg !37
  %1 = load i32*, i32** %p, align 8, !dbg !38
  %2 = load i32, i32* %1, align 4, !dbg !39
  %div = sdiv i32 %0, %2, !dbg !40
  store i32 %div, i32* %ret, align 4, !dbg !41
  ret void, !dbg !42
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !43 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @zero_division_006_good(), !dbg !46
  call void @zero_division_006_bad(), !dbg !47
  ret i32 0, !dbg !48
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (tags/RELEASE_390/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, globals: !3)
!1 = !DIFile(filename: "369_zero_division_5.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/itc/369")
!2 = !{}
!3 = !{!4, !7}
!4 = distinct !DIGlobalVariable(name: "zero_division_006_gbl_divisor_bad", scope: !0, file: !5, line: 7, type: !6, isLocal: false, isDefinition: true, variable: i32* @zero_division_006_gbl_divisor_bad)
!5 = !DIFile(filename: "./369_zero_division_5.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/itc/369")
!6 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!7 = distinct !DIGlobalVariable(name: "zero_division_006_gbl_divisor_good", scope: !0, file: !5, line: 22, type: !6, isLocal: false, isDefinition: true, variable: i32* @zero_division_006_gbl_divisor_good)
!8 = !{i32 2, !"Dwarf Version", i32 4}
!9 = !{i32 2, !"Debug Info Version", i32 3}
!10 = !{!"clang version 3.9.0 (tags/RELEASE_390/final)"}
!11 = distinct !DISubprogram(name: "zero_division_006_bad", scope: !5, file: !5, line: 8, type: !12, isLocal: false, isDefinition: true, scopeLine: 9, isOptimized: false, unit: !0, variables: !2)
!12 = !DISubroutineType(types: !13)
!13 = !{null}
!14 = !DILocalVariable(name: "dividend", scope: !11, file: !5, line: 10, type: !6)
!15 = !DIExpression()
!16 = !DILocation(line: 10, column: 6, scope: !11)
!17 = !DILocalVariable(name: "p", scope: !11, file: !5, line: 12, type: !18)
!18 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64, align: 64)
!19 = !DILocation(line: 12, column: 7, scope: !11)
!20 = !DILocalVariable(name: "ret", scope: !11, file: !5, line: 13, type: !6)
!21 = !DILocation(line: 13, column: 6, scope: !11)
!22 = !DILocation(line: 14, column: 4, scope: !11)
!23 = !DILocation(line: 15, column: 8, scope: !11)
!24 = !DILocation(line: 15, column: 20, scope: !11)
!25 = !DILocation(line: 15, column: 19, scope: !11)
!26 = !DILocation(line: 15, column: 17, scope: !11)
!27 = !DILocation(line: 15, column: 6, scope: !11)
!28 = !DILocation(line: 16, column: 1, scope: !11)
!29 = distinct !DISubprogram(name: "zero_division_006_good", scope: !5, file: !5, line: 24, type: !12, isLocal: false, isDefinition: true, scopeLine: 25, isOptimized: false, unit: !0, variables: !2)
!30 = !DILocalVariable(name: "dividend", scope: !29, file: !5, line: 26, type: !6)
!31 = !DILocation(line: 26, column: 6, scope: !29)
!32 = !DILocalVariable(name: "p", scope: !29, file: !5, line: 28, type: !18)
!33 = !DILocation(line: 28, column: 7, scope: !29)
!34 = !DILocalVariable(name: "ret", scope: !29, file: !5, line: 29, type: !6)
!35 = !DILocation(line: 29, column: 6, scope: !29)
!36 = !DILocation(line: 30, column: 4, scope: !29)
!37 = !DILocation(line: 31, column: 8, scope: !29)
!38 = !DILocation(line: 31, column: 20, scope: !29)
!39 = !DILocation(line: 31, column: 19, scope: !29)
!40 = !DILocation(line: 31, column: 17, scope: !29)
!41 = !DILocation(line: 31, column: 6, scope: !29)
!42 = !DILocation(line: 32, column: 1, scope: !29)
!43 = distinct !DISubprogram(name: "main", scope: !5, file: !5, line: 34, type: !44, isLocal: false, isDefinition: true, scopeLine: 34, isOptimized: false, unit: !0, variables: !2)
!44 = !DISubroutineType(types: !45)
!45 = !{!6}
!46 = !DILocation(line: 35, column: 2, scope: !43)
!47 = !DILocation(line: 36, column: 3, scope: !43)
!48 = !DILocation(line: 37, column: 3, scope: !43)
