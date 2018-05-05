; ModuleID = './476_null_pointer_5.c'
source_filename = "./476_null_pointer_5.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%union.null_pointer_005_uni_001 = type { %struct.null_pointer_005_s_001 }
%struct.null_pointer_005_s_001 = type { i32, i32 }

; Function Attrs: nounwind uwtable
define void @null_pointer_005_bad() #0 !dbg !6 {
entry:
  %p = alloca %union.null_pointer_005_uni_001*, align 8
  call void @llvm.dbg.declare(metadata %union.null_pointer_005_uni_001** %p, metadata !10, metadata !34), !dbg !35
  store %union.null_pointer_005_uni_001* null, %union.null_pointer_005_uni_001** %p, align 8, !dbg !35
  %0 = load %union.null_pointer_005_uni_001*, %union.null_pointer_005_uni_001** %p, align 8, !dbg !36
  %s1 = bitcast %union.null_pointer_005_uni_001* %0 to %struct.null_pointer_005_s_001*, !dbg !37
  %a = getelementptr inbounds %struct.null_pointer_005_s_001, %struct.null_pointer_005_s_001* %s1, i32 0, i32 0, !dbg !38
  store i32 1, i32* %a, align 4, !dbg !39
  ret void, !dbg !40
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind uwtable
define void @null_pointer_005_good() #0 !dbg !41 {
entry:
  %u = alloca %union.null_pointer_005_uni_001, align 4
  %p = alloca %union.null_pointer_005_uni_001*, align 8
  call void @llvm.dbg.declare(metadata %union.null_pointer_005_uni_001* %u, metadata !42, metadata !34), !dbg !43
  call void @llvm.dbg.declare(metadata %union.null_pointer_005_uni_001** %p, metadata !44, metadata !34), !dbg !45
  store %union.null_pointer_005_uni_001* %u, %union.null_pointer_005_uni_001** %p, align 8, !dbg !45
  %0 = load %union.null_pointer_005_uni_001*, %union.null_pointer_005_uni_001** %p, align 8, !dbg !46
  %s1 = bitcast %union.null_pointer_005_uni_001* %0 to %struct.null_pointer_005_s_001*, !dbg !47
  %a = getelementptr inbounds %struct.null_pointer_005_s_001, %struct.null_pointer_005_s_001* %s1, i32 0, i32 0, !dbg !48
  store i32 1, i32* %a, align 4, !dbg !49
  ret void, !dbg !50
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !51 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @null_pointer_005_good(), !dbg !54
  call void @null_pointer_005_bad(), !dbg !55
  ret i32 0, !dbg !56
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4}
!llvm.ident = !{!5}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (tags/RELEASE_390/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2)
!1 = !DIFile(filename: "476_null_pointer_5.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/itc/476")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{!"clang version 3.9.0 (tags/RELEASE_390/final)"}
!6 = distinct !DISubprogram(name: "null_pointer_005_bad", scope: !7, file: !7, line: 38, type: !8, isLocal: false, isDefinition: true, scopeLine: 39, isOptimized: false, unit: !0, variables: !2)
!7 = !DIFile(filename: "./476_null_pointer_5.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/itc/476")
!8 = !DISubroutineType(types: !9)
!9 = !{null}
!10 = !DILocalVariable(name: "p", scope: !6, file: !7, line: 40, type: !11)
!11 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !12, size: 64, align: 64)
!12 = !DIDerivedType(tag: DW_TAG_typedef, name: "null_pointer_005_uni_001", file: !7, line: 36, baseType: !13)
!13 = distinct !DICompositeType(tag: DW_TAG_union_type, file: !7, line: 32, size: 64, align: 32, elements: !14)
!14 = !{!15, !22, !28}
!15 = !DIDerivedType(tag: DW_TAG_member, name: "s1", scope: !13, file: !7, line: 33, baseType: !16, size: 64, align: 32)
!16 = !DIDerivedType(tag: DW_TAG_typedef, name: "null_pointer_005_s_001", file: !7, line: 20, baseType: !17)
!17 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !7, line: 17, size: 64, align: 32, elements: !18)
!18 = !{!19, !21}
!19 = !DIDerivedType(tag: DW_TAG_member, name: "a", scope: !17, file: !7, line: 18, baseType: !20, size: 32, align: 32)
!20 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!21 = !DIDerivedType(tag: DW_TAG_member, name: "b", scope: !17, file: !7, line: 19, baseType: !20, size: 32, align: 32, offset: 32)
!22 = !DIDerivedType(tag: DW_TAG_member, name: "s2", scope: !13, file: !7, line: 34, baseType: !23, size: 64, align: 32)
!23 = !DIDerivedType(tag: DW_TAG_typedef, name: "null_pointer_005_s_002", file: !7, line: 25, baseType: !24)
!24 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !7, line: 22, size: 64, align: 32, elements: !25)
!25 = !{!26, !27}
!26 = !DIDerivedType(tag: DW_TAG_member, name: "a", scope: !24, file: !7, line: 23, baseType: !20, size: 32, align: 32)
!27 = !DIDerivedType(tag: DW_TAG_member, name: "b", scope: !24, file: !7, line: 24, baseType: !20, size: 32, align: 32, offset: 32)
!28 = !DIDerivedType(tag: DW_TAG_member, name: "s3", scope: !13, file: !7, line: 35, baseType: !29, size: 64, align: 32)
!29 = !DIDerivedType(tag: DW_TAG_typedef, name: "null_pointer_005_s_003", file: !7, line: 30, baseType: !30)
!30 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !7, line: 27, size: 64, align: 32, elements: !31)
!31 = !{!32, !33}
!32 = !DIDerivedType(tag: DW_TAG_member, name: "a", scope: !30, file: !7, line: 28, baseType: !20, size: 32, align: 32)
!33 = !DIDerivedType(tag: DW_TAG_member, name: "b", scope: !30, file: !7, line: 29, baseType: !20, size: 32, align: 32, offset: 32)
!34 = !DIExpression()
!35 = !DILocation(line: 40, column: 28, scope: !6)
!36 = !DILocation(line: 41, column: 2, scope: !6)
!37 = !DILocation(line: 41, column: 5, scope: !6)
!38 = !DILocation(line: 41, column: 8, scope: !6)
!39 = !DILocation(line: 41, column: 10, scope: !6)
!40 = !DILocation(line: 42, column: 1, scope: !6)
!41 = distinct !DISubprogram(name: "null_pointer_005_good", scope: !7, file: !7, line: 49, type: !8, isLocal: false, isDefinition: true, scopeLine: 50, isOptimized: false, unit: !0, variables: !2)
!42 = !DILocalVariable(name: "u", scope: !41, file: !7, line: 51, type: !12)
!43 = !DILocation(line: 51, column: 27, scope: !41)
!44 = !DILocalVariable(name: "p", scope: !41, file: !7, line: 52, type: !11)
!45 = !DILocation(line: 52, column: 28, scope: !41)
!46 = !DILocation(line: 53, column: 2, scope: !41)
!47 = !DILocation(line: 53, column: 5, scope: !41)
!48 = !DILocation(line: 53, column: 8, scope: !41)
!49 = !DILocation(line: 53, column: 10, scope: !41)
!50 = !DILocation(line: 54, column: 1, scope: !41)
!51 = distinct !DISubprogram(name: "main", scope: !7, file: !7, line: 61, type: !52, isLocal: false, isDefinition: true, scopeLine: 62, isOptimized: false, unit: !0, variables: !2)
!52 = !DISubroutineType(types: !53)
!53 = !{!20}
!54 = !DILocation(line: 63, column: 2, scope: !51)
!55 = !DILocation(line: 64, column: 2, scope: !51)
!56 = !DILocation(line: 65, column: 2, scope: !51)
