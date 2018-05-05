; ModuleID = './476_null_pointer_3.c'
source_filename = "./476_null_pointer_3.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: nounwind uwtable
define void @null_pointer_003_bad() #0 !dbg !6 {
entry:
  %pp = alloca i32**, align 8
  %p = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32*** %pp, metadata !10, metadata !14), !dbg !15
  call void @llvm.dbg.declare(metadata i32** %p, metadata !16, metadata !14), !dbg !17
  store i32* null, i32** %p, align 8, !dbg !17
  store i32** %p, i32*** %pp, align 8, !dbg !18
  %0 = load i32**, i32*** %pp, align 8, !dbg !19
  %1 = load i32*, i32** %0, align 8, !dbg !20
  store i32 1, i32* %1, align 4, !dbg !21
  ret void, !dbg !22
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind uwtable
define void @null_pointer_003_good() #0 !dbg !23 {
entry:
  %buf = alloca [5 x i32], align 16
  %pp = alloca i32**, align 8
  %p = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata [5 x i32]* %buf, metadata !24, metadata !14), !dbg !28
  call void @llvm.dbg.declare(metadata i32*** %pp, metadata !29, metadata !14), !dbg !30
  call void @llvm.dbg.declare(metadata i32** %p, metadata !31, metadata !14), !dbg !32
  %arraydecay = getelementptr inbounds [5 x i32], [5 x i32]* %buf, i32 0, i32 0, !dbg !33
  store i32* %arraydecay, i32** %p, align 8, !dbg !32
  store i32** %p, i32*** %pp, align 8, !dbg !34
  %0 = load i32**, i32*** %pp, align 8, !dbg !35
  %1 = load i32*, i32** %0, align 8, !dbg !36
  store i32 1, i32* %1, align 4, !dbg !37
  ret void, !dbg !38
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !39 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @null_pointer_003_good(), !dbg !42
  call void @null_pointer_003_bad(), !dbg !43
  ret i32 0, !dbg !44
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4}
!llvm.ident = !{!5}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (tags/RELEASE_390/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2)
!1 = !DIFile(filename: "476_null_pointer_3.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/itc/476")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{!"clang version 3.9.0 (tags/RELEASE_390/final)"}
!6 = distinct !DISubprogram(name: "null_pointer_003_bad", scope: !7, file: !7, line: 17, type: !8, isLocal: false, isDefinition: true, scopeLine: 18, isOptimized: false, unit: !0, variables: !2)
!7 = !DIFile(filename: "./476_null_pointer_3.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/itc/476")
!8 = !DISubroutineType(types: !9)
!9 = !{null}
!10 = !DILocalVariable(name: "pp", scope: !6, file: !7, line: 19, type: !11)
!11 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !12, size: 64, align: 64)
!12 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !13, size: 64, align: 64)
!13 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!14 = !DIExpression()
!15 = !DILocation(line: 19, column: 8, scope: !6)
!16 = !DILocalVariable(name: "p", scope: !6, file: !7, line: 20, type: !12)
!17 = !DILocation(line: 20, column: 7, scope: !6)
!18 = !DILocation(line: 21, column: 5, scope: !6)
!19 = !DILocation(line: 22, column: 4, scope: !6)
!20 = !DILocation(line: 22, column: 3, scope: !6)
!21 = !DILocation(line: 22, column: 7, scope: !6)
!22 = !DILocation(line: 23, column: 1, scope: !6)
!23 = distinct !DISubprogram(name: "null_pointer_003_good", scope: !7, file: !7, line: 29, type: !8, isLocal: false, isDefinition: true, scopeLine: 30, isOptimized: false, unit: !0, variables: !2)
!24 = !DILocalVariable(name: "buf", scope: !23, file: !7, line: 31, type: !25)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 160, align: 32, elements: !26)
!26 = !{!27}
!27 = !DISubrange(count: 5)
!28 = !DILocation(line: 31, column: 6, scope: !23)
!29 = !DILocalVariable(name: "pp", scope: !23, file: !7, line: 32, type: !11)
!30 = !DILocation(line: 32, column: 8, scope: !23)
!31 = !DILocalVariable(name: "p", scope: !23, file: !7, line: 33, type: !12)
!32 = !DILocation(line: 33, column: 7, scope: !23)
!33 = !DILocation(line: 33, column: 11, scope: !23)
!34 = !DILocation(line: 34, column: 5, scope: !23)
!35 = !DILocation(line: 35, column: 4, scope: !23)
!36 = !DILocation(line: 35, column: 3, scope: !23)
!37 = !DILocation(line: 35, column: 7, scope: !23)
!38 = !DILocation(line: 36, column: 1, scope: !23)
!39 = distinct !DISubprogram(name: "main", scope: !7, file: !7, line: 43, type: !40, isLocal: false, isDefinition: true, scopeLine: 44, isOptimized: false, unit: !0, variables: !2)
!40 = !DISubroutineType(types: !41)
!41 = !{!13}
!42 = !DILocation(line: 45, column: 2, scope: !39)
!43 = !DILocation(line: 46, column: 2, scope: !39)
!44 = !DILocation(line: 47, column: 2, scope: !39)
