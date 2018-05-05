; ModuleID = './457_uninit_var_6.c'
source_filename = "./457_uninit_var_6.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.uninit_var_007_s_001 = type { i32, i32, i32 }

; Function Attrs: nounwind uwtable
define void @uninit_var_007_bad() #0 !dbg !6 {
entry:
  %s = alloca %struct.uninit_var_007_s_001, align 4
  %ret = alloca i32, align 4
  call void @llvm.dbg.declare(metadata %struct.uninit_var_007_s_001* %s, metadata !10, metadata !18), !dbg !19
  call void @llvm.dbg.declare(metadata i32* %ret, metadata !20, metadata !18), !dbg !21
  %a = getelementptr inbounds %struct.uninit_var_007_s_001, %struct.uninit_var_007_s_001* %s, i32 0, i32 0, !dbg !22
  store i32 1, i32* %a, align 4, !dbg !23
  %b = getelementptr inbounds %struct.uninit_var_007_s_001, %struct.uninit_var_007_s_001* %s, i32 0, i32 1, !dbg !24
  store i32 1, i32* %b, align 4, !dbg !25
  %uninit = getelementptr inbounds %struct.uninit_var_007_s_001, %struct.uninit_var_007_s_001* %s, i32 0, i32 2, !dbg !26
  %0 = load i32, i32* %uninit, align 4, !dbg !26
  store i32 %0, i32* %ret, align 4, !dbg !27
  ret void, !dbg !28
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind uwtable
define void @uninit_var_007_good() #0 !dbg !29 {
entry:
  %s = alloca %struct.uninit_var_007_s_001, align 4
  %ret = alloca i32, align 4
  call void @llvm.dbg.declare(metadata %struct.uninit_var_007_s_001* %s, metadata !30, metadata !18), !dbg !31
  call void @llvm.dbg.declare(metadata i32* %ret, metadata !32, metadata !18), !dbg !33
  %a = getelementptr inbounds %struct.uninit_var_007_s_001, %struct.uninit_var_007_s_001* %s, i32 0, i32 0, !dbg !34
  store i32 1, i32* %a, align 4, !dbg !35
  %b = getelementptr inbounds %struct.uninit_var_007_s_001, %struct.uninit_var_007_s_001* %s, i32 0, i32 1, !dbg !36
  store i32 1, i32* %b, align 4, !dbg !37
  %uninit = getelementptr inbounds %struct.uninit_var_007_s_001, %struct.uninit_var_007_s_001* %s, i32 0, i32 2, !dbg !38
  store i32 1, i32* %uninit, align 4, !dbg !39
  %uninit1 = getelementptr inbounds %struct.uninit_var_007_s_001, %struct.uninit_var_007_s_001* %s, i32 0, i32 2, !dbg !40
  %0 = load i32, i32* %uninit1, align 4, !dbg !40
  store i32 %0, i32* %ret, align 4, !dbg !41
  ret void, !dbg !42
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !43 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @uninit_var_007_good(), !dbg !46
  call void @uninit_var_007_bad(), !dbg !47
  ret i32 0, !dbg !48
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4}
!llvm.ident = !{!5}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (tags/RELEASE_390/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2)
!1 = !DIFile(filename: "457_uninit_var_6.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/itc/457")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{!"clang version 3.9.0 (tags/RELEASE_390/final)"}
!6 = distinct !DISubprogram(name: "uninit_var_007_bad", scope: !7, file: !7, line: 13, type: !8, isLocal: false, isDefinition: true, scopeLine: 13, isOptimized: false, unit: !0, variables: !2)
!7 = !DIFile(filename: "./457_uninit_var_6.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/itc/457")
!8 = !DISubroutineType(types: !9)
!9 = !{null}
!10 = !DILocalVariable(name: "s", scope: !6, file: !7, line: 14, type: !11)
!11 = !DIDerivedType(tag: DW_TAG_typedef, name: "uninit_var_007_s_001", file: !7, line: 11, baseType: !12)
!12 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !7, line: 7, size: 96, align: 32, elements: !13)
!13 = !{!14, !16, !17}
!14 = !DIDerivedType(tag: DW_TAG_member, name: "a", scope: !12, file: !7, line: 8, baseType: !15, size: 32, align: 32)
!15 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!16 = !DIDerivedType(tag: DW_TAG_member, name: "b", scope: !12, file: !7, line: 9, baseType: !15, size: 32, align: 32, offset: 32)
!17 = !DIDerivedType(tag: DW_TAG_member, name: "uninit", scope: !12, file: !7, line: 10, baseType: !15, size: 32, align: 32, offset: 64)
!18 = !DIExpression()
!19 = !DILocation(line: 14, column: 23, scope: !6)
!20 = !DILocalVariable(name: "ret", scope: !6, file: !7, line: 15, type: !15)
!21 = !DILocation(line: 15, column: 6, scope: !6)
!22 = !DILocation(line: 16, column: 4, scope: !6)
!23 = !DILocation(line: 16, column: 6, scope: !6)
!24 = !DILocation(line: 17, column: 4, scope: !6)
!25 = !DILocation(line: 17, column: 6, scope: !6)
!26 = !DILocation(line: 18, column: 10, scope: !6)
!27 = !DILocation(line: 18, column: 6, scope: !6)
!28 = !DILocation(line: 19, column: 1, scope: !6)
!29 = distinct !DISubprogram(name: "uninit_var_007_good", scope: !7, file: !7, line: 25, type: !8, isLocal: false, isDefinition: true, scopeLine: 26, isOptimized: false, unit: !0, variables: !2)
!30 = !DILocalVariable(name: "s", scope: !29, file: !7, line: 27, type: !11)
!31 = !DILocation(line: 27, column: 23, scope: !29)
!32 = !DILocalVariable(name: "ret", scope: !29, file: !7, line: 28, type: !15)
!33 = !DILocation(line: 28, column: 6, scope: !29)
!34 = !DILocation(line: 29, column: 4, scope: !29)
!35 = !DILocation(line: 29, column: 6, scope: !29)
!36 = !DILocation(line: 30, column: 4, scope: !29)
!37 = !DILocation(line: 30, column: 6, scope: !29)
!38 = !DILocation(line: 31, column: 4, scope: !29)
!39 = !DILocation(line: 31, column: 11, scope: !29)
!40 = !DILocation(line: 32, column: 10, scope: !29)
!41 = !DILocation(line: 32, column: 6, scope: !29)
!42 = !DILocation(line: 34, column: 1, scope: !29)
!43 = distinct !DISubprogram(name: "main", scope: !7, file: !7, line: 36, type: !44, isLocal: false, isDefinition: true, scopeLine: 36, isOptimized: false, unit: !0, variables: !2)
!44 = !DISubroutineType(types: !45)
!45 = !{!15}
!46 = !DILocation(line: 37, column: 3, scope: !43)
!47 = !DILocation(line: 38, column: 2, scope: !43)
!48 = !DILocation(line: 39, column: 2, scope: !43)
