; ModuleID = './476_null_pointer_4.c'
source_filename = "./476_null_pointer_4.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.null_pointer_004_s_001 = type { i32, i32, i32 }

; Function Attrs: nounwind uwtable
define void @null_pointer_004_bad() #0 !dbg !6 {
entry:
  %p = alloca %struct.null_pointer_004_s_001*, align 8
  call void @llvm.dbg.declare(metadata %struct.null_pointer_004_s_001** %p, metadata !10, metadata !19), !dbg !20
  store %struct.null_pointer_004_s_001* null, %struct.null_pointer_004_s_001** %p, align 8, !dbg !20
  %0 = load %struct.null_pointer_004_s_001*, %struct.null_pointer_004_s_001** %p, align 8, !dbg !21
  %a = getelementptr inbounds %struct.null_pointer_004_s_001, %struct.null_pointer_004_s_001* %0, i32 0, i32 0, !dbg !22
  store i32 1, i32* %a, align 4, !dbg !23
  ret void, !dbg !24
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind uwtable
define void @null_pointer_004_good() #0 !dbg !25 {
entry:
  %s = alloca %struct.null_pointer_004_s_001, align 4
  %p = alloca %struct.null_pointer_004_s_001*, align 8
  call void @llvm.dbg.declare(metadata %struct.null_pointer_004_s_001* %s, metadata !26, metadata !19), !dbg !27
  call void @llvm.dbg.declare(metadata %struct.null_pointer_004_s_001** %p, metadata !28, metadata !19), !dbg !29
  store %struct.null_pointer_004_s_001* %s, %struct.null_pointer_004_s_001** %p, align 8, !dbg !29
  %0 = load %struct.null_pointer_004_s_001*, %struct.null_pointer_004_s_001** %p, align 8, !dbg !30
  %a = getelementptr inbounds %struct.null_pointer_004_s_001, %struct.null_pointer_004_s_001* %0, i32 0, i32 0, !dbg !31
  store i32 1, i32* %a, align 4, !dbg !32
  ret void, !dbg !33
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !34 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @null_pointer_004_good(), !dbg !37
  call void @null_pointer_004_bad(), !dbg !38
  ret i32 0, !dbg !39
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4}
!llvm.ident = !{!5}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (tags/RELEASE_390/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2)
!1 = !DIFile(filename: "476_null_pointer_4.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/itc/476")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{!"clang version 3.9.0 (tags/RELEASE_390/final)"}
!6 = distinct !DISubprogram(name: "null_pointer_004_bad", scope: !7, file: !7, line: 23, type: !8, isLocal: false, isDefinition: true, scopeLine: 24, isOptimized: false, unit: !0, variables: !2)
!7 = !DIFile(filename: "./476_null_pointer_4.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/itc/476")
!8 = !DISubroutineType(types: !9)
!9 = !{null}
!10 = !DILocalVariable(name: "p", scope: !6, file: !7, line: 25, type: !11)
!11 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !12, size: 64, align: 64)
!12 = !DIDerivedType(tag: DW_TAG_typedef, name: "null_pointer_004_s_001", file: !7, line: 21, baseType: !13)
!13 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !7, line: 17, size: 96, align: 32, elements: !14)
!14 = !{!15, !17, !18}
!15 = !DIDerivedType(tag: DW_TAG_member, name: "a", scope: !13, file: !7, line: 18, baseType: !16, size: 32, align: 32)
!16 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!17 = !DIDerivedType(tag: DW_TAG_member, name: "b", scope: !13, file: !7, line: 19, baseType: !16, size: 32, align: 32, offset: 32)
!18 = !DIDerivedType(tag: DW_TAG_member, name: "c", scope: !13, file: !7, line: 20, baseType: !16, size: 32, align: 32, offset: 64)
!19 = !DIExpression()
!20 = !DILocation(line: 25, column: 26, scope: !6)
!21 = !DILocation(line: 26, column: 2, scope: !6)
!22 = !DILocation(line: 26, column: 5, scope: !6)
!23 = !DILocation(line: 26, column: 7, scope: !6)
!24 = !DILocation(line: 27, column: 1, scope: !6)
!25 = distinct !DISubprogram(name: "null_pointer_004_good", scope: !7, file: !7, line: 34, type: !8, isLocal: false, isDefinition: true, scopeLine: 35, isOptimized: false, unit: !0, variables: !2)
!26 = !DILocalVariable(name: "s", scope: !25, file: !7, line: 36, type: !12)
!27 = !DILocation(line: 36, column: 25, scope: !25)
!28 = !DILocalVariable(name: "p", scope: !25, file: !7, line: 37, type: !11)
!29 = !DILocation(line: 37, column: 26, scope: !25)
!30 = !DILocation(line: 38, column: 2, scope: !25)
!31 = !DILocation(line: 38, column: 5, scope: !25)
!32 = !DILocation(line: 38, column: 7, scope: !25)
!33 = !DILocation(line: 39, column: 1, scope: !25)
!34 = distinct !DISubprogram(name: "main", scope: !7, file: !7, line: 46, type: !35, isLocal: false, isDefinition: true, scopeLine: 47, isOptimized: false, unit: !0, variables: !2)
!35 = !DISubroutineType(types: !36)
!36 = !{!16}
!37 = !DILocation(line: 48, column: 2, scope: !34)
!38 = !DILocation(line: 49, column: 2, scope: !34)
!39 = !DILocation(line: 50, column: 2, scope: !34)
