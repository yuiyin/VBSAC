; ModuleID = './457_uninit_var_4.c'
source_filename = "./457_uninit_var_4.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: nounwind uwtable
define i32 @uninit_var_005_func_001_bad() #0 !dbg !6 {
entry:
  %ret = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %ret, metadata !11, metadata !12), !dbg !13
  %0 = load i32, i32* %ret, align 4, !dbg !14
  ret i32 %0, !dbg !15
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind uwtable
define void @uninit_var_005_bad() #0 !dbg !16 {
entry:
  %a = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %a, metadata !19, metadata !12), !dbg !20
  %call = call i32 @uninit_var_005_func_001_bad(), !dbg !21
  store i32 %call, i32* %a, align 4, !dbg !22
  ret void, !dbg !23
}

; Function Attrs: nounwind uwtable
define i32 @uninit_var_005_func_001_good() #0 !dbg !24 {
entry:
  %ret = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %ret, metadata !25, metadata !12), !dbg !26
  store i32 1, i32* %ret, align 4, !dbg !27
  %0 = load i32, i32* %ret, align 4, !dbg !29
  ret i32 %0, !dbg !30
}

; Function Attrs: nounwind uwtable
define void @uninit_var_005_good() #0 !dbg !31 {
entry:
  %a = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %a, metadata !32, metadata !12), !dbg !33
  %call = call i32 @uninit_var_005_func_001_good(), !dbg !34
  store i32 %call, i32* %a, align 4, !dbg !35
  ret void, !dbg !36
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !37 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @uninit_var_005_good(), !dbg !38
  call void @uninit_var_005_bad(), !dbg !39
  ret i32 0, !dbg !40
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4}
!llvm.ident = !{!5}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (tags/RELEASE_390/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2)
!1 = !DIFile(filename: "457_uninit_var_4.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/itc/457")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{!"clang version 3.9.0 (tags/RELEASE_390/final)"}
!6 = distinct !DISubprogram(name: "uninit_var_005_func_001_bad", scope: !7, file: !7, line: 7, type: !8, isLocal: false, isDefinition: true, scopeLine: 7, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!7 = !DIFile(filename: "./457_uninit_var_4.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/itc/457")
!8 = !DISubroutineType(types: !9)
!9 = !{!10}
!10 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!11 = !DILocalVariable(name: "ret", scope: !6, file: !7, line: 8, type: !10)
!12 = !DIExpression()
!13 = !DILocation(line: 8, column: 6, scope: !6)
!14 = !DILocation(line: 11, column: 9, scope: !6)
!15 = !DILocation(line: 11, column: 2, scope: !6)
!16 = distinct !DISubprogram(name: "uninit_var_005_bad", scope: !7, file: !7, line: 14, type: !17, isLocal: false, isDefinition: true, scopeLine: 14, isOptimized: false, unit: !0, variables: !2)
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocalVariable(name: "a", scope: !16, file: !7, line: 15, type: !10)
!20 = !DILocation(line: 15, column: 6, scope: !16)
!21 = !DILocation(line: 16, column: 6, scope: !16)
!22 = !DILocation(line: 16, column: 4, scope: !16)
!23 = !DILocation(line: 17, column: 1, scope: !16)
!24 = distinct !DISubprogram(name: "uninit_var_005_func_001_good", scope: !7, file: !7, line: 23, type: !8, isLocal: false, isDefinition: true, scopeLine: 24, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!25 = !DILocalVariable(name: "ret", scope: !24, file: !7, line: 25, type: !10)
!26 = !DILocation(line: 25, column: 6, scope: !24)
!27 = !DILocation(line: 27, column: 7, scope: !28)
!28 = distinct !DILexicalBlock(scope: !24, file: !7, line: 26, column: 6)
!29 = !DILocation(line: 28, column: 9, scope: !24)
!30 = !DILocation(line: 28, column: 2, scope: !24)
!31 = distinct !DISubprogram(name: "uninit_var_005_good", scope: !7, file: !7, line: 31, type: !17, isLocal: false, isDefinition: true, scopeLine: 32, isOptimized: false, unit: !0, variables: !2)
!32 = !DILocalVariable(name: "a", scope: !31, file: !7, line: 33, type: !10)
!33 = !DILocation(line: 33, column: 6, scope: !31)
!34 = !DILocation(line: 34, column: 6, scope: !31)
!35 = !DILocation(line: 34, column: 4, scope: !31)
!36 = !DILocation(line: 36, column: 1, scope: !31)
!37 = distinct !DISubprogram(name: "main", scope: !7, file: !7, line: 38, type: !8, isLocal: false, isDefinition: true, scopeLine: 38, isOptimized: false, unit: !0, variables: !2)
!38 = !DILocation(line: 39, column: 2, scope: !37)
!39 = !DILocation(line: 40, column: 2, scope: !37)
!40 = !DILocation(line: 41, column: 2, scope: !37)
