; ModuleID = './476_null_pointer_12.c'
source_filename = "./476_null_pointer_12.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: nounwind uwtable
define void @null_pointer_012_bad() #0 !dbg !6 {
entry:
  %p = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %p, metadata !10, metadata !13), !dbg !14
  store i32* null, i32** %p, align 8, !dbg !14
  %0 = load i32*, i32** %p, align 8, !dbg !15
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 3, !dbg !15
  store i32 1, i32* %arrayidx, align 4, !dbg !16
  ret void, !dbg !17
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind uwtable
define void @null_pointer_012_good() #0 !dbg !18 {
entry:
  %buf = alloca [5 x i32], align 16
  %p = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata [5 x i32]* %buf, metadata !19, metadata !13), !dbg !23
  call void @llvm.dbg.declare(metadata i32** %p, metadata !24, metadata !13), !dbg !25
  %arraydecay = getelementptr inbounds [5 x i32], [5 x i32]* %buf, i32 0, i32 0, !dbg !26
  store i32* %arraydecay, i32** %p, align 8, !dbg !25
  %0 = load i32*, i32** %p, align 8, !dbg !27
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 3, !dbg !27
  store i32 1, i32* %arrayidx, align 4, !dbg !28
  ret void, !dbg !29
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !30 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @null_pointer_012_good(), !dbg !33
  call void @null_pointer_012_bad(), !dbg !34
  ret i32 0, !dbg !35
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4}
!llvm.ident = !{!5}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (tags/RELEASE_390/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2)
!1 = !DIFile(filename: "476_null_pointer_12.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/itc/476")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{!"clang version 3.9.0 (tags/RELEASE_390/final)"}
!6 = distinct !DISubprogram(name: "null_pointer_012_bad", scope: !7, file: !7, line: 17, type: !8, isLocal: false, isDefinition: true, scopeLine: 18, isOptimized: false, unit: !0, variables: !2)
!7 = !DIFile(filename: "./476_null_pointer_12.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/itc/476")
!8 = !DISubroutineType(types: !9)
!9 = !{null}
!10 = !DILocalVariable(name: "p", scope: !6, file: !7, line: 19, type: !11)
!11 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !12, size: 64, align: 64)
!12 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!13 = !DIExpression()
!14 = !DILocation(line: 19, column: 7, scope: !6)
!15 = !DILocation(line: 20, column: 2, scope: !6)
!16 = !DILocation(line: 20, column: 7, scope: !6)
!17 = !DILocation(line: 21, column: 1, scope: !6)
!18 = distinct !DISubprogram(name: "null_pointer_012_good", scope: !7, file: !7, line: 27, type: !8, isLocal: false, isDefinition: true, scopeLine: 28, isOptimized: false, unit: !0, variables: !2)
!19 = !DILocalVariable(name: "buf", scope: !18, file: !7, line: 29, type: !20)
!20 = !DICompositeType(tag: DW_TAG_array_type, baseType: !12, size: 160, align: 32, elements: !21)
!21 = !{!22}
!22 = !DISubrange(count: 5)
!23 = !DILocation(line: 29, column: 6, scope: !18)
!24 = !DILocalVariable(name: "p", scope: !18, file: !7, line: 30, type: !11)
!25 = !DILocation(line: 30, column: 7, scope: !18)
!26 = !DILocation(line: 30, column: 11, scope: !18)
!27 = !DILocation(line: 31, column: 2, scope: !18)
!28 = !DILocation(line: 31, column: 7, scope: !18)
!29 = !DILocation(line: 32, column: 1, scope: !18)
!30 = distinct !DISubprogram(name: "main", scope: !7, file: !7, line: 39, type: !31, isLocal: false, isDefinition: true, scopeLine: 40, isOptimized: false, unit: !0, variables: !2)
!31 = !DISubroutineType(types: !32)
!32 = !{!12}
!33 = !DILocation(line: 41, column: 2, scope: !30)
!34 = !DILocation(line: 42, column: 2, scope: !30)
!35 = !DILocation(line: 43, column: 2, scope: !30)
