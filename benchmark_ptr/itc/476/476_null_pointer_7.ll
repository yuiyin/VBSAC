; ModuleID = './476_null_pointer_7.c'
source_filename = "./476_null_pointer_7.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: nounwind uwtable
define void @null_pointer_007_bad() #0 !dbg !12 {
entry:
  %p = alloca i32*, align 8
  %a = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32** %p, metadata !16, metadata !17), !dbg !18
  call void @llvm.dbg.declare(metadata i32* %a, metadata !19, metadata !17), !dbg !20
  store i32 3, i32* %a, align 4, !dbg !20
  %0 = load i32, i32* %a, align 4, !dbg !21
  %mul = mul nsw i32 2, %0, !dbg !22
  %sub = sub nsw i32 %mul, 6, !dbg !23
  %conv = sext i32 %sub to i64, !dbg !24
  %1 = inttoptr i64 %conv to i32*, !dbg !25
  store i32* %1, i32** %p, align 8, !dbg !26
  %2 = load i32*, i32** %p, align 8, !dbg !27
  store i32 1, i32* %2, align 4, !dbg !28
  ret void, !dbg !29
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind uwtable
define void @null_pointer_007_good() #0 !dbg !30 {
entry:
  %p = alloca i32*, align 8
  %a = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32** %p, metadata !31, metadata !17), !dbg !32
  call void @llvm.dbg.declare(metadata i32* %a, metadata !33, metadata !17), !dbg !34
  store i32 3, i32* %a, align 4, !dbg !34
  store i32* %a, i32** %p, align 8, !dbg !35
  %0 = load i32*, i32** %p, align 8, !dbg !36
  store i32 1, i32* %0, align 4, !dbg !37
  ret void, !dbg !38
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !39 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @null_pointer_007_good(), !dbg !42
  call void @null_pointer_007_bad(), !dbg !43
  ret i32 0, !dbg !44
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!9, !10}
!llvm.ident = !{!11}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (tags/RELEASE_390/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3)
!1 = !DIFile(filename: "476_null_pointer_7.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/itc/476")
!2 = !{}
!3 = !{!4, !6}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64, align: 64)
!5 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!6 = !DIDerivedType(tag: DW_TAG_typedef, name: "intptr_t", file: !7, line: 119, baseType: !8)
!7 = !DIFile(filename: "/usr/include/stdint.h", directory: "/home/guzuxing/Documents/VBSAC/benchmark/itc/476")
!8 = !DIBasicType(name: "long int", size: 64, align: 64, encoding: DW_ATE_signed)
!9 = !{i32 2, !"Dwarf Version", i32 4}
!10 = !{i32 2, !"Debug Info Version", i32 3}
!11 = !{!"clang version 3.9.0 (tags/RELEASE_390/final)"}
!12 = distinct !DISubprogram(name: "null_pointer_007_bad", scope: !13, file: !13, line: 17, type: !14, isLocal: false, isDefinition: true, scopeLine: 18, isOptimized: false, unit: !0, variables: !2)
!13 = !DIFile(filename: "./476_null_pointer_7.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/itc/476")
!14 = !DISubroutineType(types: !15)
!15 = !{null}
!16 = !DILocalVariable(name: "p", scope: !12, file: !13, line: 19, type: !4)
!17 = !DIExpression()
!18 = !DILocation(line: 19, column: 7, scope: !12)
!19 = !DILocalVariable(name: "a", scope: !12, file: !13, line: 20, type: !5)
!20 = !DILocation(line: 20, column: 6, scope: !12)
!21 = !DILocation(line: 21, column: 29, scope: !12)
!22 = !DILocation(line: 21, column: 27, scope: !12)
!23 = !DILocation(line: 21, column: 32, scope: !12)
!24 = !DILocation(line: 21, column: 13, scope: !12)
!25 = !DILocation(line: 21, column: 6, scope: !12)
!26 = !DILocation(line: 21, column: 4, scope: !12)
!27 = !DILocation(line: 22, column: 3, scope: !12)
!28 = !DILocation(line: 22, column: 5, scope: !12)
!29 = !DILocation(line: 23, column: 1, scope: !12)
!30 = distinct !DISubprogram(name: "null_pointer_007_good", scope: !13, file: !13, line: 29, type: !14, isLocal: false, isDefinition: true, scopeLine: 30, isOptimized: false, unit: !0, variables: !2)
!31 = !DILocalVariable(name: "p", scope: !30, file: !13, line: 31, type: !4)
!32 = !DILocation(line: 31, column: 7, scope: !30)
!33 = !DILocalVariable(name: "a", scope: !30, file: !13, line: 32, type: !5)
!34 = !DILocation(line: 32, column: 6, scope: !30)
!35 = !DILocation(line: 33, column: 4, scope: !30)
!36 = !DILocation(line: 34, column: 3, scope: !30)
!37 = !DILocation(line: 34, column: 5, scope: !30)
!38 = !DILocation(line: 35, column: 1, scope: !30)
!39 = distinct !DISubprogram(name: "main", scope: !13, file: !13, line: 42, type: !40, isLocal: false, isDefinition: true, scopeLine: 43, isOptimized: false, unit: !0, variables: !2)
!40 = !DISubroutineType(types: !41)
!41 = !{!5}
!42 = !DILocation(line: 44, column: 2, scope: !39)
!43 = !DILocation(line: 45, column: 2, scope: !39)
!44 = !DILocation(line: 46, column: 2, scope: !39)
