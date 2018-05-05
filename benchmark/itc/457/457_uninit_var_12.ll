; ModuleID = './457_uninit_var_12.c'
source_filename = "./457_uninit_var_12.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: nounwind uwtable
define i32 @uninit_var_013_func_001_bad() #0 !dbg !12 {
entry:
  %val = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %val, metadata !17, metadata !19), !dbg !20
  %0 = load i32, i32* %val, align 4, !dbg !21
  ret i32 %0, !dbg !22
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind uwtable
define void @uninit_var_013_bad() #0 !dbg !23 {
entry:
  %a = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %a, metadata !26, metadata !19), !dbg !27
  %call = call i32 @uninit_var_013_func_001_bad(), !dbg !28
  store i32 %call, i32* %a, align 4, !dbg !29
  ret void, !dbg !30
}

; Function Attrs: nounwind uwtable
define i32 @uninit_var_013_func_001_good() #0 !dbg !31 {
entry:
  %val = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %val, metadata !32, metadata !19), !dbg !33
  store i32 1, i32* %val, align 4, !dbg !33
  %0 = load i32, i32* %val, align 4, !dbg !34
  ret i32 %0, !dbg !35
}

; Function Attrs: nounwind uwtable
define void @uninit_var_013_good() #0 !dbg !36 {
entry:
  %a = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %a, metadata !37, metadata !19), !dbg !38
  %call = call i32 @uninit_var_013_func_001_good(), !dbg !39
  store i32 %call, i32* %a, align 4, !dbg !40
  ret void, !dbg !41
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !42 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @uninit_var_013_good(), !dbg !43
  call void @uninit_var_013_bad(), !dbg !44
  ret i32 0, !dbg !45
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!9, !10}
!llvm.ident = !{!11}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (tags/RELEASE_390/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2)
!1 = !DIFile(filename: "457_uninit_var_12.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/itc/457")
!2 = !{!3}
!3 = !DICompositeType(tag: DW_TAG_enumeration_type, file: !4, line: 7, size: 32, align: 32, elements: !5)
!4 = !DIFile(filename: "./457_uninit_var_12.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/itc/457")
!5 = !{!6, !7, !8}
!6 = !DIEnumerator(name: "ZERO", value: 0)
!7 = !DIEnumerator(name: "ONE", value: 1)
!8 = !DIEnumerator(name: "TWO", value: 2)
!9 = !{i32 2, !"Dwarf Version", i32 4}
!10 = !{i32 2, !"Debug Info Version", i32 3}
!11 = !{!"clang version 3.9.0 (tags/RELEASE_390/final)"}
!12 = distinct !DISubprogram(name: "uninit_var_013_func_001_bad", scope: !4, file: !4, line: 9, type: !13, isLocal: false, isDefinition: true, scopeLine: 9, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !16)
!13 = !DISubroutineType(types: !14)
!14 = !{!15}
!15 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!16 = !{}
!17 = !DILocalVariable(name: "val", scope: !12, file: !4, line: 10, type: !18)
!18 = !DIDerivedType(tag: DW_TAG_typedef, name: "values", file: !4, line: 7, baseType: !3)
!19 = !DIExpression()
!20 = !DILocation(line: 10, column: 9, scope: !12)
!21 = !DILocation(line: 11, column: 9, scope: !12)
!22 = !DILocation(line: 11, column: 2, scope: !12)
!23 = distinct !DISubprogram(name: "uninit_var_013_bad", scope: !4, file: !4, line: 14, type: !24, isLocal: false, isDefinition: true, scopeLine: 14, isOptimized: false, unit: !0, variables: !16)
!24 = !DISubroutineType(types: !25)
!25 = !{null}
!26 = !DILocalVariable(name: "a", scope: !23, file: !4, line: 15, type: !15)
!27 = !DILocation(line: 15, column: 9, scope: !23)
!28 = !DILocation(line: 16, column: 9, scope: !23)
!29 = !DILocation(line: 16, column: 7, scope: !23)
!30 = !DILocation(line: 17, column: 1, scope: !23)
!31 = distinct !DISubprogram(name: "uninit_var_013_func_001_good", scope: !4, file: !4, line: 23, type: !13, isLocal: false, isDefinition: true, scopeLine: 24, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !16)
!32 = !DILocalVariable(name: "val", scope: !31, file: !4, line: 25, type: !18)
!33 = !DILocation(line: 25, column: 9, scope: !31)
!34 = !DILocation(line: 26, column: 9, scope: !31)
!35 = !DILocation(line: 26, column: 2, scope: !31)
!36 = distinct !DISubprogram(name: "uninit_var_013_good", scope: !4, file: !4, line: 29, type: !24, isLocal: false, isDefinition: true, scopeLine: 30, isOptimized: false, unit: !0, variables: !16)
!37 = !DILocalVariable(name: "a", scope: !36, file: !4, line: 31, type: !15)
!38 = !DILocation(line: 31, column: 9, scope: !36)
!39 = !DILocation(line: 32, column: 9, scope: !36)
!40 = !DILocation(line: 32, column: 7, scope: !36)
!41 = !DILocation(line: 34, column: 1, scope: !36)
!42 = distinct !DISubprogram(name: "main", scope: !4, file: !4, line: 36, type: !13, isLocal: false, isDefinition: true, scopeLine: 36, isOptimized: false, unit: !0, variables: !16)
!43 = !DILocation(line: 37, column: 2, scope: !42)
!44 = !DILocation(line: 38, column: 2, scope: !42)
!45 = !DILocation(line: 39, column: 2, scope: !42)
