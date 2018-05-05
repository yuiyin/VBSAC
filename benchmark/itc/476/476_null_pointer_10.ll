; ModuleID = './476_null_pointer_10.c'
source_filename = "./476_null_pointer_10.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: nounwind uwtable
define void @null_pointer_010_bad() #0 !dbg !6 {
entry:
  %p = alloca i32*, align 8
  %p1 = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %p, metadata !10, metadata !13), !dbg !14
  store i32* null, i32** %p, align 8, !dbg !14
  call void @llvm.dbg.declare(metadata i32** %p1, metadata !15, metadata !13), !dbg !16
  %0 = load i32*, i32** %p, align 8, !dbg !17
  store i32* %0, i32** %p1, align 8, !dbg !18
  %1 = load i32*, i32** %p1, align 8, !dbg !19
  store i32 1, i32* %1, align 4, !dbg !20
  ret void, !dbg !21
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind uwtable
define void @null_pointer_010_good() #0 !dbg !22 {
entry:
  %buf = alloca [5 x i32], align 16
  %p = alloca i32*, align 8
  %p1 = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata [5 x i32]* %buf, metadata !23, metadata !13), !dbg !27
  call void @llvm.dbg.declare(metadata i32** %p, metadata !28, metadata !13), !dbg !29
  %arraydecay = getelementptr inbounds [5 x i32], [5 x i32]* %buf, i32 0, i32 0, !dbg !30
  store i32* %arraydecay, i32** %p, align 8, !dbg !29
  call void @llvm.dbg.declare(metadata i32** %p1, metadata !31, metadata !13), !dbg !32
  %0 = load i32*, i32** %p, align 8, !dbg !33
  store i32* %0, i32** %p1, align 8, !dbg !34
  %1 = load i32*, i32** %p1, align 8, !dbg !35
  store i32 1, i32* %1, align 4, !dbg !36
  ret void, !dbg !37
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !38 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @null_pointer_010_good(), !dbg !41
  call void @null_pointer_010_bad(), !dbg !42
  ret i32 0, !dbg !43
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4}
!llvm.ident = !{!5}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (tags/RELEASE_390/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2)
!1 = !DIFile(filename: "476_null_pointer_10.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/itc/476")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{!"clang version 3.9.0 (tags/RELEASE_390/final)"}
!6 = distinct !DISubprogram(name: "null_pointer_010_bad", scope: !7, file: !7, line: 19, type: !8, isLocal: false, isDefinition: true, scopeLine: 20, isOptimized: false, unit: !0, variables: !2)
!7 = !DIFile(filename: "./476_null_pointer_10.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/itc/476")
!8 = !DISubroutineType(types: !9)
!9 = !{null}
!10 = !DILocalVariable(name: "p", scope: !6, file: !7, line: 21, type: !11)
!11 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !12, size: 64, align: 64)
!12 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!13 = !DIExpression()
!14 = !DILocation(line: 21, column: 7, scope: !6)
!15 = !DILocalVariable(name: "p1", scope: !6, file: !7, line: 22, type: !11)
!16 = !DILocation(line: 22, column: 7, scope: !6)
!17 = !DILocation(line: 23, column: 7, scope: !6)
!18 = !DILocation(line: 23, column: 5, scope: !6)
!19 = !DILocation(line: 24, column: 3, scope: !6)
!20 = !DILocation(line: 24, column: 6, scope: !6)
!21 = !DILocation(line: 25, column: 1, scope: !6)
!22 = distinct !DISubprogram(name: "null_pointer_010_good", scope: !7, file: !7, line: 31, type: !8, isLocal: false, isDefinition: true, scopeLine: 32, isOptimized: false, unit: !0, variables: !2)
!23 = !DILocalVariable(name: "buf", scope: !22, file: !7, line: 33, type: !24)
!24 = !DICompositeType(tag: DW_TAG_array_type, baseType: !12, size: 160, align: 32, elements: !25)
!25 = !{!26}
!26 = !DISubrange(count: 5)
!27 = !DILocation(line: 33, column: 6, scope: !22)
!28 = !DILocalVariable(name: "p", scope: !22, file: !7, line: 34, type: !11)
!29 = !DILocation(line: 34, column: 7, scope: !22)
!30 = !DILocation(line: 34, column: 11, scope: !22)
!31 = !DILocalVariable(name: "p1", scope: !22, file: !7, line: 35, type: !11)
!32 = !DILocation(line: 35, column: 7, scope: !22)
!33 = !DILocation(line: 36, column: 7, scope: !22)
!34 = !DILocation(line: 36, column: 5, scope: !22)
!35 = !DILocation(line: 37, column: 3, scope: !22)
!36 = !DILocation(line: 37, column: 6, scope: !22)
!37 = !DILocation(line: 38, column: 1, scope: !22)
!38 = distinct !DISubprogram(name: "main", scope: !7, file: !7, line: 45, type: !39, isLocal: false, isDefinition: true, scopeLine: 46, isOptimized: false, unit: !0, variables: !2)
!39 = !DISubroutineType(types: !40)
!40 = !{!12}
!41 = !DILocation(line: 47, column: 2, scope: !38)
!42 = !DILocation(line: 48, column: 2, scope: !38)
!43 = !DILocation(line: 49, column: 2, scope: !38)
