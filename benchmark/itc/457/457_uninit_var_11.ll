; ModuleID = './457_uninit_var_11.c'
source_filename = "./457_uninit_var_11.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.uninit_var = type { i32, i32 }

; Function Attrs: nounwind uwtable
define void @uninit_var_012_bad() #0 !dbg !6 {
entry:
  %s = alloca %struct.uninit_var, align 4
  %ret = alloca i32, align 4
  call void @llvm.dbg.declare(metadata %struct.uninit_var* %s, metadata !10, metadata !16), !dbg !17
  %a = getelementptr inbounds %struct.uninit_var, %struct.uninit_var* %s, i32 0, i32 0, !dbg !18
  store i32 2, i32* %a, align 4, !dbg !19
  call void @llvm.dbg.declare(metadata i32* %ret, metadata !20, metadata !16), !dbg !21
  %a1 = getelementptr inbounds %struct.uninit_var, %struct.uninit_var* %s, i32 0, i32 0, !dbg !22
  %0 = load i32, i32* %a1, align 4, !dbg !22
  %uninit = getelementptr inbounds %struct.uninit_var, %struct.uninit_var* %s, i32 0, i32 1, !dbg !23
  %1 = load i32, i32* %uninit, align 4, !dbg !23
  %add = add nsw i32 %0, %1, !dbg !24
  store i32 %add, i32* %ret, align 4, !dbg !25
  ret void, !dbg !26
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind uwtable
define void @uninit_var_012_good() #0 !dbg !27 {
entry:
  %s = alloca %struct.uninit_var, align 4
  %r = alloca %struct.uninit_var, align 4
  %ret = alloca i32, align 4
  call void @llvm.dbg.declare(metadata %struct.uninit_var* %s, metadata !28, metadata !16), !dbg !29
  call void @llvm.dbg.declare(metadata %struct.uninit_var* %r, metadata !30, metadata !16), !dbg !31
  %a = getelementptr inbounds %struct.uninit_var, %struct.uninit_var* %s, i32 0, i32 0, !dbg !32
  store i32 2, i32* %a, align 4, !dbg !33
  %uninit = getelementptr inbounds %struct.uninit_var, %struct.uninit_var* %s, i32 0, i32 1, !dbg !34
  store i32 2, i32* %uninit, align 4, !dbg !35
  call void @llvm.dbg.declare(metadata i32* %ret, metadata !36, metadata !16), !dbg !37
  %a1 = getelementptr inbounds %struct.uninit_var, %struct.uninit_var* %s, i32 0, i32 0, !dbg !38
  %0 = load i32, i32* %a1, align 4, !dbg !38
  %uninit2 = getelementptr inbounds %struct.uninit_var, %struct.uninit_var* %s, i32 0, i32 1, !dbg !39
  %1 = load i32, i32* %uninit2, align 4, !dbg !39
  %add = add nsw i32 %0, %1, !dbg !40
  store i32 %add, i32* %ret, align 4, !dbg !41
  ret void, !dbg !42
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !43 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @uninit_var_012_good(), !dbg !46
  call void @uninit_var_012_bad(), !dbg !47
  ret i32 0, !dbg !48
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4}
!llvm.ident = !{!5}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (tags/RELEASE_390/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2)
!1 = !DIFile(filename: "457_uninit_var_11.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/itc/457")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{!"clang version 3.9.0 (tags/RELEASE_390/final)"}
!6 = distinct !DISubprogram(name: "uninit_var_012_bad", scope: !7, file: !7, line: 13, type: !8, isLocal: false, isDefinition: true, scopeLine: 13, isOptimized: false, unit: !0, variables: !2)
!7 = !DIFile(filename: "./457_uninit_var_11.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/itc/457")
!8 = !DISubroutineType(types: !9)
!9 = !{null}
!10 = !DILocalVariable(name: "s", scope: !6, file: !7, line: 14, type: !11)
!11 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "uninit_var", file: !7, line: 6, size: 64, align: 32, elements: !12)
!12 = !{!13, !15}
!13 = !DIDerivedType(tag: DW_TAG_member, name: "a", scope: !11, file: !7, line: 7, baseType: !14, size: 32, align: 32)
!14 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!15 = !DIDerivedType(tag: DW_TAG_member, name: "uninit", scope: !11, file: !7, line: 8, baseType: !14, size: 32, align: 32, offset: 32)
!16 = !DIExpression()
!17 = !DILocation(line: 14, column: 20, scope: !6)
!18 = !DILocation(line: 15, column: 4, scope: !6)
!19 = !DILocation(line: 15, column: 6, scope: !6)
!20 = !DILocalVariable(name: "ret", scope: !6, file: !7, line: 16, type: !14)
!21 = !DILocation(line: 16, column: 6, scope: !6)
!22 = !DILocation(line: 17, column: 10, scope: !6)
!23 = !DILocation(line: 17, column: 15, scope: !6)
!24 = !DILocation(line: 17, column: 12, scope: !6)
!25 = !DILocation(line: 17, column: 6, scope: !6)
!26 = !DILocation(line: 18, column: 1, scope: !6)
!27 = distinct !DISubprogram(name: "uninit_var_012_good", scope: !7, file: !7, line: 22, type: !8, isLocal: false, isDefinition: true, scopeLine: 23, isOptimized: false, unit: !0, variables: !2)
!28 = !DILocalVariable(name: "s", scope: !27, file: !7, line: 24, type: !11)
!29 = !DILocation(line: 24, column: 20, scope: !27)
!30 = !DILocalVariable(name: "r", scope: !27, file: !7, line: 24, type: !11)
!31 = !DILocation(line: 24, column: 22, scope: !27)
!32 = !DILocation(line: 25, column: 4, scope: !27)
!33 = !DILocation(line: 25, column: 6, scope: !27)
!34 = !DILocation(line: 26, column: 4, scope: !27)
!35 = !DILocation(line: 26, column: 11, scope: !27)
!36 = !DILocalVariable(name: "ret", scope: !27, file: !7, line: 27, type: !14)
!37 = !DILocation(line: 27, column: 6, scope: !27)
!38 = !DILocation(line: 28, column: 10, scope: !27)
!39 = !DILocation(line: 28, column: 15, scope: !27)
!40 = !DILocation(line: 28, column: 12, scope: !27)
!41 = !DILocation(line: 28, column: 6, scope: !27)
!42 = !DILocation(line: 31, column: 1, scope: !27)
!43 = distinct !DISubprogram(name: "main", scope: !7, file: !7, line: 33, type: !44, isLocal: false, isDefinition: true, scopeLine: 33, isOptimized: false, unit: !0, variables: !2)
!44 = !DISubroutineType(types: !45)
!45 = !{!14}
!46 = !DILocation(line: 34, column: 2, scope: !43)
!47 = !DILocation(line: 35, column: 2, scope: !43)
!48 = !DILocation(line: 36, column: 2, scope: !43)
