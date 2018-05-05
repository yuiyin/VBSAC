; ModuleID = './476_null_pointer_9.c'
source_filename = "./476_null_pointer_9.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: nounwind uwtable
define void @null_pointer_009_func_001_bad(i32* %p) #0 !dbg !6 {
entry:
  %p.addr = alloca i32*, align 8
  store i32* %p, i32** %p.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %p.addr, metadata !12, metadata !13), !dbg !14
  %0 = load i32*, i32** %p.addr, align 8, !dbg !15
  store i32 1, i32* %0, align 4, !dbg !16
  ret void, !dbg !17
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind uwtable
define void @null_pointer_009_bad() #0 !dbg !18 {
entry:
  call void @null_pointer_009_func_001_bad(i32* null), !dbg !21
  ret void, !dbg !22
}

; Function Attrs: nounwind uwtable
define void @null_pointer_009_func_001_good(i32* %p) #0 !dbg !23 {
entry:
  %p.addr = alloca i32*, align 8
  store i32* %p, i32** %p.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %p.addr, metadata !24, metadata !13), !dbg !25
  %0 = load i32*, i32** %p.addr, align 8, !dbg !26
  store i32 1, i32* %0, align 4, !dbg !27
  ret void, !dbg !28
}

; Function Attrs: nounwind uwtable
define void @null_pointer_009_good() #0 !dbg !29 {
entry:
  %buf = alloca [5 x i32], align 16
  call void @llvm.dbg.declare(metadata [5 x i32]* %buf, metadata !30, metadata !13), !dbg !34
  %arraydecay = getelementptr inbounds [5 x i32], [5 x i32]* %buf, i32 0, i32 0, !dbg !35
  call void @null_pointer_009_func_001_good(i32* %arraydecay), !dbg !36
  ret void, !dbg !37
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !38 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @null_pointer_009_good(), !dbg !41
  call void @null_pointer_009_bad(), !dbg !42
  ret i32 0, !dbg !43
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4}
!llvm.ident = !{!5}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (tags/RELEASE_390/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2)
!1 = !DIFile(filename: "476_null_pointer_9.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/itc/476")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{!"clang version 3.9.0 (tags/RELEASE_390/final)"}
!6 = distinct !DISubprogram(name: "null_pointer_009_func_001_bad", scope: !7, file: !7, line: 17, type: !8, isLocal: false, isDefinition: true, scopeLine: 18, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!7 = !DIFile(filename: "./476_null_pointer_9.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/itc/476")
!8 = !DISubroutineType(types: !9)
!9 = !{null, !10}
!10 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !11, size: 64, align: 64)
!11 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!12 = !DILocalVariable(name: "p", arg: 1, scope: !6, file: !7, line: 17, type: !10)
!13 = !DIExpression()
!14 = !DILocation(line: 17, column: 41, scope: !6)
!15 = !DILocation(line: 19, column: 3, scope: !6)
!16 = !DILocation(line: 19, column: 5, scope: !6)
!17 = !DILocation(line: 20, column: 1, scope: !6)
!18 = distinct !DISubprogram(name: "null_pointer_009_bad", scope: !7, file: !7, line: 22, type: !19, isLocal: false, isDefinition: true, scopeLine: 23, isOptimized: false, unit: !0, variables: !2)
!19 = !DISubroutineType(types: !20)
!20 = !{null}
!21 = !DILocation(line: 24, column: 2, scope: !18)
!22 = !DILocation(line: 25, column: 1, scope: !18)
!23 = distinct !DISubprogram(name: "null_pointer_009_func_001_good", scope: !7, file: !7, line: 31, type: !8, isLocal: false, isDefinition: true, scopeLine: 32, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!24 = !DILocalVariable(name: "p", arg: 1, scope: !23, file: !7, line: 31, type: !10)
!25 = !DILocation(line: 31, column: 42, scope: !23)
!26 = !DILocation(line: 33, column: 3, scope: !23)
!27 = !DILocation(line: 33, column: 5, scope: !23)
!28 = !DILocation(line: 34, column: 1, scope: !23)
!29 = distinct !DISubprogram(name: "null_pointer_009_good", scope: !7, file: !7, line: 36, type: !19, isLocal: false, isDefinition: true, scopeLine: 37, isOptimized: false, unit: !0, variables: !2)
!30 = !DILocalVariable(name: "buf", scope: !29, file: !7, line: 38, type: !31)
!31 = !DICompositeType(tag: DW_TAG_array_type, baseType: !11, size: 160, align: 32, elements: !32)
!32 = !{!33}
!33 = !DISubrange(count: 5)
!34 = !DILocation(line: 38, column: 6, scope: !29)
!35 = !DILocation(line: 39, column: 33, scope: !29)
!36 = !DILocation(line: 39, column: 2, scope: !29)
!37 = !DILocation(line: 40, column: 1, scope: !29)
!38 = distinct !DISubprogram(name: "main", scope: !7, file: !7, line: 47, type: !39, isLocal: false, isDefinition: true, scopeLine: 48, isOptimized: false, unit: !0, variables: !2)
!39 = !DISubroutineType(types: !40)
!40 = !{!11}
!41 = !DILocation(line: 49, column: 2, scope: !38)
!42 = !DILocation(line: 50, column: 2, scope: !38)
!43 = !DILocation(line: 51, column: 2, scope: !38)
