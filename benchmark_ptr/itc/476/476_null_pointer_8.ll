; ModuleID = './476_null_pointer_8.c'
source_filename = "./476_null_pointer_8.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@null_pointer_008_glb_001_good = common global [5 x i32] zeroinitializer, align 16

; Function Attrs: nounwind uwtable
define i32* @null_pointer_008_func_001_bad() #0 !dbg !13 {
entry:
  ret i32* null, !dbg !17
}

; Function Attrs: nounwind uwtable
define void @null_pointer_008_bad() #0 !dbg !18 {
entry:
  %p = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %p, metadata !21, metadata !22), !dbg !23
  %call = call i32* @null_pointer_008_func_001_bad(), !dbg !24
  store i32* %call, i32** %p, align 8, !dbg !25
  %0 = load i32*, i32** %p, align 8, !dbg !26
  store i32 1, i32* %0, align 4, !dbg !27
  ret void, !dbg !28
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind uwtable
define i32* @null_pointer_008_func_001_good() #0 !dbg !29 {
entry:
  ret i32* getelementptr inbounds ([5 x i32], [5 x i32]* @null_pointer_008_glb_001_good, i32 0, i32 0), !dbg !30
}

; Function Attrs: nounwind uwtable
define void @null_pointer_008_good() #0 !dbg !31 {
entry:
  %p = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %p, metadata !32, metadata !22), !dbg !33
  %call = call i32* @null_pointer_008_func_001_good(), !dbg !34
  store i32* %call, i32** %p, align 8, !dbg !35
  %0 = load i32*, i32** %p, align 8, !dbg !36
  store i32 1, i32* %0, align 4, !dbg !37
  ret void, !dbg !38
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !39 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @null_pointer_008_good(), !dbg !42
  call void @null_pointer_008_bad(), !dbg !43
  ret i32 0, !dbg !44
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (tags/RELEASE_390/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, globals: !3)
!1 = !DIFile(filename: "476_null_pointer_8.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/itc/476")
!2 = !{}
!3 = !{!4}
!4 = distinct !DIGlobalVariable(name: "null_pointer_008_glb_001_good", scope: !0, file: !5, line: 33, type: !6, isLocal: false, isDefinition: true, variable: [5 x i32]* @null_pointer_008_glb_001_good)
!5 = !DIFile(filename: "./476_null_pointer_8.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/itc/476")
!6 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 160, align: 32, elements: !8)
!7 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!8 = !{!9}
!9 = !DISubrange(count: 5)
!10 = !{i32 2, !"Dwarf Version", i32 4}
!11 = !{i32 2, !"Debug Info Version", i32 3}
!12 = !{!"clang version 3.9.0 (tags/RELEASE_390/final)"}
!13 = distinct !DISubprogram(name: "null_pointer_008_func_001_bad", scope: !5, file: !5, line: 17, type: !14, isLocal: false, isDefinition: true, scopeLine: 18, isOptimized: false, unit: !0, variables: !2)
!14 = !DISubroutineType(types: !15)
!15 = !{!16}
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64, align: 64)
!17 = !DILocation(line: 19, column: 2, scope: !13)
!18 = distinct !DISubprogram(name: "null_pointer_008_bad", scope: !5, file: !5, line: 22, type: !19, isLocal: false, isDefinition: true, scopeLine: 23, isOptimized: false, unit: !0, variables: !2)
!19 = !DISubroutineType(types: !20)
!20 = !{null}
!21 = !DILocalVariable(name: "p", scope: !18, file: !5, line: 24, type: !16)
!22 = !DIExpression()
!23 = !DILocation(line: 24, column: 7, scope: !18)
!24 = !DILocation(line: 25, column: 6, scope: !18)
!25 = !DILocation(line: 25, column: 4, scope: !18)
!26 = !DILocation(line: 26, column: 3, scope: !18)
!27 = !DILocation(line: 26, column: 5, scope: !18)
!28 = !DILocation(line: 27, column: 1, scope: !18)
!29 = distinct !DISubprogram(name: "null_pointer_008_func_001_good", scope: !5, file: !5, line: 35, type: !14, isLocal: false, isDefinition: true, scopeLine: 36, isOptimized: false, unit: !0, variables: !2)
!30 = !DILocation(line: 37, column: 2, scope: !29)
!31 = distinct !DISubprogram(name: "null_pointer_008_good", scope: !5, file: !5, line: 40, type: !19, isLocal: false, isDefinition: true, scopeLine: 41, isOptimized: false, unit: !0, variables: !2)
!32 = !DILocalVariable(name: "p", scope: !31, file: !5, line: 42, type: !16)
!33 = !DILocation(line: 42, column: 7, scope: !31)
!34 = !DILocation(line: 43, column: 6, scope: !31)
!35 = !DILocation(line: 43, column: 4, scope: !31)
!36 = !DILocation(line: 44, column: 3, scope: !31)
!37 = !DILocation(line: 44, column: 5, scope: !31)
!38 = !DILocation(line: 45, column: 1, scope: !31)
!39 = distinct !DISubprogram(name: "main", scope: !5, file: !5, line: 52, type: !40, isLocal: false, isDefinition: true, scopeLine: 53, isOptimized: false, unit: !0, variables: !2)
!40 = !DISubroutineType(types: !41)
!41 = !{!7}
!42 = !DILocation(line: 54, column: 2, scope: !39)
!43 = !DILocation(line: 55, column: 2, scope: !39)
!44 = !DILocation(line: 56, column: 2, scope: !39)
