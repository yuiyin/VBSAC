; ModuleID = './401_memory_leak_13.c'
source_filename = "./401_memory_leak_13.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%union.memory_leak_0013_uni_001 = type { %struct.memory_leak_0013_s_001* }
%struct.memory_leak_0013_s_001 = type { i32, i32 }

; Function Attrs: nounwind uwtable
define void @memory_leak_0013_bad() #0 !dbg !35 {
entry:
  %u = alloca %union.memory_leak_0013_uni_001*, align 8
  %p = alloca %union.memory_leak_0013_uni_001*, align 8
  call void @llvm.dbg.declare(metadata %union.memory_leak_0013_uni_001** %u, metadata !38, metadata !39), !dbg !40
  %call = call noalias i8* @malloc(i64 40) #3, !dbg !41
  %0 = bitcast i8* %call to %union.memory_leak_0013_uni_001*, !dbg !42
  store %union.memory_leak_0013_uni_001* %0, %union.memory_leak_0013_uni_001** %u, align 8, !dbg !40
  %1 = load %union.memory_leak_0013_uni_001*, %union.memory_leak_0013_uni_001** %u, align 8, !dbg !43
  %cmp = icmp ne %union.memory_leak_0013_uni_001* %1, null, !dbg !45
  br i1 %cmp, label %if.then, label %if.end, !dbg !46

if.then:                                          ; preds = %entry
  %call1 = call noalias i8* @malloc(i64 8) #3, !dbg !47
  %2 = bitcast i8* %call1 to %struct.memory_leak_0013_s_001*, !dbg !49
  %3 = load %union.memory_leak_0013_uni_001*, %union.memory_leak_0013_uni_001** %u, align 8, !dbg !50
  %s1 = bitcast %union.memory_leak_0013_uni_001* %3 to %struct.memory_leak_0013_s_001**, !dbg !51
  store %struct.memory_leak_0013_s_001* %2, %struct.memory_leak_0013_s_001** %s1, align 8, !dbg !52
  br label %if.end, !dbg !53

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata %union.memory_leak_0013_uni_001** %p, metadata !54, metadata !39), !dbg !55
  %call2 = call noalias i8* @malloc(i64 40) #3, !dbg !56
  %4 = bitcast i8* %call2 to %union.memory_leak_0013_uni_001*, !dbg !57
  store %union.memory_leak_0013_uni_001* %4, %union.memory_leak_0013_uni_001** %p, align 8, !dbg !55
  %5 = load %union.memory_leak_0013_uni_001*, %union.memory_leak_0013_uni_001** %u, align 8, !dbg !58
  %cmp3 = icmp ne %union.memory_leak_0013_uni_001* %5, null, !dbg !60
  br i1 %cmp3, label %if.then4, label %if.end7, !dbg !61

if.then4:                                         ; preds = %if.end
  %6 = load %union.memory_leak_0013_uni_001*, %union.memory_leak_0013_uni_001** %u, align 8, !dbg !62
  store %union.memory_leak_0013_uni_001* %6, %union.memory_leak_0013_uni_001** %p, align 8, !dbg !64
  %7 = load %union.memory_leak_0013_uni_001*, %union.memory_leak_0013_uni_001** %p, align 8, !dbg !65
  %s15 = bitcast %union.memory_leak_0013_uni_001* %7 to %struct.memory_leak_0013_s_001**, !dbg !66
  %8 = load %struct.memory_leak_0013_s_001*, %struct.memory_leak_0013_s_001** %s15, align 8, !dbg !66
  %a = getelementptr inbounds %struct.memory_leak_0013_s_001, %struct.memory_leak_0013_s_001* %8, i32 0, i32 0, !dbg !67
  store i32 1, i32* %a, align 4, !dbg !68
  %9 = load %union.memory_leak_0013_uni_001*, %union.memory_leak_0013_uni_001** %p, align 8, !dbg !69
  %s16 = bitcast %union.memory_leak_0013_uni_001* %9 to %struct.memory_leak_0013_s_001**, !dbg !70
  %10 = load %struct.memory_leak_0013_s_001*, %struct.memory_leak_0013_s_001** %s16, align 8, !dbg !70
  %11 = bitcast %struct.memory_leak_0013_s_001* %10 to i8*, !dbg !69
  call void @free(i8* %11) #3, !dbg !71
  %12 = load %union.memory_leak_0013_uni_001*, %union.memory_leak_0013_uni_001** %p, align 8, !dbg !72
  %13 = bitcast %union.memory_leak_0013_uni_001* %12 to i8*, !dbg !72
  call void @free(i8* %13) #3, !dbg !73
  br label %if.end7, !dbg !74

if.end7:                                          ; preds = %if.then4, %if.end
  ret void, !dbg !75
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #2

; Function Attrs: nounwind
declare void @free(i8*) #2

; Function Attrs: nounwind uwtable
define void @memory_leak_0013_good() #0 !dbg !76 {
entry:
  %u = alloca %union.memory_leak_0013_uni_001*, align 8
  %p = alloca %union.memory_leak_0013_uni_001*, align 8
  call void @llvm.dbg.declare(metadata %union.memory_leak_0013_uni_001** %u, metadata !77, metadata !39), !dbg !78
  %call = call noalias i8* @malloc(i64 40) #3, !dbg !79
  %0 = bitcast i8* %call to %union.memory_leak_0013_uni_001*, !dbg !80
  store %union.memory_leak_0013_uni_001* %0, %union.memory_leak_0013_uni_001** %u, align 8, !dbg !78
  %1 = load %union.memory_leak_0013_uni_001*, %union.memory_leak_0013_uni_001** %u, align 8, !dbg !81
  %cmp = icmp ne %union.memory_leak_0013_uni_001* %1, null, !dbg !83
  br i1 %cmp, label %if.then, label %if.end, !dbg !84

if.then:                                          ; preds = %entry
  %call1 = call noalias i8* @malloc(i64 8) #3, !dbg !85
  %2 = bitcast i8* %call1 to %struct.memory_leak_0013_s_001*, !dbg !87
  %3 = load %union.memory_leak_0013_uni_001*, %union.memory_leak_0013_uni_001** %u, align 8, !dbg !88
  %s1 = bitcast %union.memory_leak_0013_uni_001* %3 to %struct.memory_leak_0013_s_001**, !dbg !89
  store %struct.memory_leak_0013_s_001* %2, %struct.memory_leak_0013_s_001** %s1, align 8, !dbg !90
  br label %if.end, !dbg !91

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata %union.memory_leak_0013_uni_001** %p, metadata !92, metadata !39), !dbg !93
  store %union.memory_leak_0013_uni_001* null, %union.memory_leak_0013_uni_001** %p, align 8, !dbg !93
  %4 = load %union.memory_leak_0013_uni_001*, %union.memory_leak_0013_uni_001** %u, align 8, !dbg !94
  %cmp2 = icmp ne %union.memory_leak_0013_uni_001* %4, null, !dbg !96
  br i1 %cmp2, label %if.then3, label %if.end7, !dbg !97

if.then3:                                         ; preds = %if.end
  %5 = load %union.memory_leak_0013_uni_001*, %union.memory_leak_0013_uni_001** %u, align 8, !dbg !98
  store %union.memory_leak_0013_uni_001* %5, %union.memory_leak_0013_uni_001** %p, align 8, !dbg !100
  %6 = load %union.memory_leak_0013_uni_001*, %union.memory_leak_0013_uni_001** %p, align 8, !dbg !101
  %s14 = bitcast %union.memory_leak_0013_uni_001* %6 to %struct.memory_leak_0013_s_001**, !dbg !102
  %7 = load %struct.memory_leak_0013_s_001*, %struct.memory_leak_0013_s_001** %s14, align 8, !dbg !102
  %a = getelementptr inbounds %struct.memory_leak_0013_s_001, %struct.memory_leak_0013_s_001* %7, i32 0, i32 0, !dbg !103
  store i32 1, i32* %a, align 4, !dbg !104
  %8 = load %union.memory_leak_0013_uni_001*, %union.memory_leak_0013_uni_001** %u, align 8, !dbg !105
  %s15 = bitcast %union.memory_leak_0013_uni_001* %8 to %struct.memory_leak_0013_s_001**, !dbg !106
  %9 = load %struct.memory_leak_0013_s_001*, %struct.memory_leak_0013_s_001** %s15, align 8, !dbg !106
  %10 = bitcast %struct.memory_leak_0013_s_001* %9 to i8*, !dbg !105
  call void @free(i8* %10) #3, !dbg !107
  %11 = load %union.memory_leak_0013_uni_001*, %union.memory_leak_0013_uni_001** %u, align 8, !dbg !108
  %s16 = bitcast %union.memory_leak_0013_uni_001* %11 to %struct.memory_leak_0013_s_001**, !dbg !109
  store %struct.memory_leak_0013_s_001* null, %struct.memory_leak_0013_s_001** %s16, align 8, !dbg !110
  %12 = load %union.memory_leak_0013_uni_001*, %union.memory_leak_0013_uni_001** %u, align 8, !dbg !111
  %13 = bitcast %union.memory_leak_0013_uni_001* %12 to i8*, !dbg !111
  call void @free(i8* %13) #3, !dbg !112
  br label %if.end7, !dbg !113

if.end7:                                          ; preds = %if.then3, %if.end
  ret void, !dbg !114
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !115 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @memory_leak_0013_good(), !dbg !118
  call void @memory_leak_0013_bad(), !dbg !119
  ret i32 0, !dbg !120
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!32, !33}
!llvm.ident = !{!34}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (tags/RELEASE_390/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3)
!1 = !DIFile(filename: "401_memory_leak_13.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/itc/401")
!2 = !{}
!3 = !{!4, !31, !10}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64, align: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "memory_leak_0013_uni_001", file: !6, line: 36, baseType: !7)
!6 = !DIFile(filename: "./401_memory_leak_13.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/itc/401")
!7 = distinct !DICompositeType(tag: DW_TAG_union_type, file: !6, line: 32, size: 64, align: 64, elements: !8)
!8 = !{!9, !17, !24}
!9 = !DIDerivedType(tag: DW_TAG_member, name: "s1", scope: !7, file: !6, line: 33, baseType: !10, size: 64, align: 64)
!10 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !11, size: 64, align: 64)
!11 = !DIDerivedType(tag: DW_TAG_typedef, name: "memory_leak_0013_s_001", file: !6, line: 20, baseType: !12)
!12 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !6, line: 17, size: 64, align: 32, elements: !13)
!13 = !{!14, !16}
!14 = !DIDerivedType(tag: DW_TAG_member, name: "a", scope: !12, file: !6, line: 18, baseType: !15, size: 32, align: 32)
!15 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!16 = !DIDerivedType(tag: DW_TAG_member, name: "b", scope: !12, file: !6, line: 19, baseType: !15, size: 32, align: 32, offset: 32)
!17 = !DIDerivedType(tag: DW_TAG_member, name: "s2", scope: !7, file: !6, line: 34, baseType: !18, size: 64, align: 64)
!18 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !19, size: 64, align: 64)
!19 = !DIDerivedType(tag: DW_TAG_typedef, name: "memory_leak_0013_s_002", file: !6, line: 25, baseType: !20)
!20 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !6, line: 22, size: 64, align: 32, elements: !21)
!21 = !{!22, !23}
!22 = !DIDerivedType(tag: DW_TAG_member, name: "a", scope: !20, file: !6, line: 23, baseType: !15, size: 32, align: 32)
!23 = !DIDerivedType(tag: DW_TAG_member, name: "b", scope: !20, file: !6, line: 24, baseType: !15, size: 32, align: 32, offset: 32)
!24 = !DIDerivedType(tag: DW_TAG_member, name: "s3", scope: !7, file: !6, line: 35, baseType: !25, size: 64, align: 64)
!25 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !26, size: 64, align: 64)
!26 = !DIDerivedType(tag: DW_TAG_typedef, name: "memory_leak_0013_s_003", file: !6, line: 30, baseType: !27)
!27 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !6, line: 27, size: 64, align: 32, elements: !28)
!28 = !{!29, !30}
!29 = !DIDerivedType(tag: DW_TAG_member, name: "a", scope: !27, file: !6, line: 28, baseType: !15, size: 32, align: 32)
!30 = !DIDerivedType(tag: DW_TAG_member, name: "b", scope: !27, file: !6, line: 29, baseType: !15, size: 32, align: 32, offset: 32)
!31 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64, align: 64)
!32 = !{i32 2, !"Dwarf Version", i32 4}
!33 = !{i32 2, !"Debug Info Version", i32 3}
!34 = !{!"clang version 3.9.0 (tags/RELEASE_390/final)"}
!35 = distinct !DISubprogram(name: "memory_leak_0013_bad", scope: !6, file: !6, line: 38, type: !36, isLocal: false, isDefinition: true, scopeLine: 39, isOptimized: false, unit: !0, variables: !2)
!36 = !DISubroutineType(types: !37)
!37 = !{null}
!38 = !DILocalVariable(name: "u", scope: !35, file: !6, line: 40, type: !4)
!39 = !DIExpression()
!40 = !DILocation(line: 40, column: 28, scope: !35)
!41 = !DILocation(line: 40, column: 61, scope: !35)
!42 = !DILocation(line: 40, column: 32, scope: !35)
!43 = !DILocation(line: 41, column: 5, scope: !44)
!44 = distinct !DILexicalBlock(scope: !35, file: !6, line: 41, column: 5)
!45 = !DILocation(line: 41, column: 6, scope: !44)
!46 = !DILocation(line: 41, column: 5, scope: !35)
!47 = !DILocation(line: 43, column: 38, scope: !48)
!48 = distinct !DILexicalBlock(scope: !44, file: !6, line: 42, column: 2)
!49 = !DILocation(line: 43, column: 11, scope: !48)
!50 = !DILocation(line: 43, column: 3, scope: !48)
!51 = !DILocation(line: 43, column: 6, scope: !48)
!52 = !DILocation(line: 43, column: 9, scope: !48)
!53 = !DILocation(line: 44, column: 2, scope: !48)
!54 = !DILocalVariable(name: "p", scope: !35, file: !6, line: 45, type: !4)
!55 = !DILocation(line: 45, column: 28, scope: !35)
!56 = !DILocation(line: 45, column: 62, scope: !35)
!57 = !DILocation(line: 45, column: 33, scope: !35)
!58 = !DILocation(line: 48, column: 5, scope: !59)
!59 = distinct !DILexicalBlock(scope: !35, file: !6, line: 48, column: 5)
!60 = !DILocation(line: 48, column: 6, scope: !59)
!61 = !DILocation(line: 48, column: 5, scope: !35)
!62 = !DILocation(line: 50, column: 6, scope: !63)
!63 = distinct !DILexicalBlock(scope: !59, file: !6, line: 49, column: 2)
!64 = !DILocation(line: 50, column: 4, scope: !63)
!65 = !DILocation(line: 51, column: 2, scope: !63)
!66 = !DILocation(line: 51, column: 5, scope: !63)
!67 = !DILocation(line: 51, column: 9, scope: !63)
!68 = !DILocation(line: 51, column: 11, scope: !63)
!69 = !DILocation(line: 52, column: 10, scope: !63)
!70 = !DILocation(line: 52, column: 13, scope: !63)
!71 = !DILocation(line: 52, column: 5, scope: !63)
!72 = !DILocation(line: 53, column: 7, scope: !63)
!73 = !DILocation(line: 53, column: 2, scope: !63)
!74 = !DILocation(line: 55, column: 2, scope: !63)
!75 = !DILocation(line: 56, column: 1, scope: !35)
!76 = distinct !DISubprogram(name: "memory_leak_0013_good", scope: !6, file: !6, line: 62, type: !36, isLocal: false, isDefinition: true, scopeLine: 63, isOptimized: false, unit: !0, variables: !2)
!77 = !DILocalVariable(name: "u", scope: !76, file: !6, line: 64, type: !4)
!78 = !DILocation(line: 64, column: 28, scope: !76)
!79 = !DILocation(line: 64, column: 61, scope: !76)
!80 = !DILocation(line: 64, column: 32, scope: !76)
!81 = !DILocation(line: 65, column: 5, scope: !82)
!82 = distinct !DILexicalBlock(scope: !76, file: !6, line: 65, column: 5)
!83 = !DILocation(line: 65, column: 6, scope: !82)
!84 = !DILocation(line: 65, column: 5, scope: !76)
!85 = !DILocation(line: 67, column: 38, scope: !86)
!86 = distinct !DILexicalBlock(scope: !82, file: !6, line: 66, column: 2)
!87 = !DILocation(line: 67, column: 11, scope: !86)
!88 = !DILocation(line: 67, column: 3, scope: !86)
!89 = !DILocation(line: 67, column: 6, scope: !86)
!90 = !DILocation(line: 67, column: 9, scope: !86)
!91 = !DILocation(line: 68, column: 2, scope: !86)
!92 = !DILocalVariable(name: "p", scope: !76, file: !6, line: 69, type: !4)
!93 = !DILocation(line: 69, column: 28, scope: !76)
!94 = !DILocation(line: 71, column: 5, scope: !95)
!95 = distinct !DILexicalBlock(scope: !76, file: !6, line: 71, column: 5)
!96 = !DILocation(line: 71, column: 6, scope: !95)
!97 = !DILocation(line: 71, column: 5, scope: !76)
!98 = !DILocation(line: 73, column: 7, scope: !99)
!99 = distinct !DILexicalBlock(scope: !95, file: !6, line: 72, column: 2)
!100 = !DILocation(line: 73, column: 5, scope: !99)
!101 = !DILocation(line: 74, column: 6, scope: !99)
!102 = !DILocation(line: 74, column: 9, scope: !99)
!103 = !DILocation(line: 74, column: 13, scope: !99)
!104 = !DILocation(line: 74, column: 15, scope: !99)
!105 = !DILocation(line: 75, column: 11, scope: !99)
!106 = !DILocation(line: 75, column: 14, scope: !99)
!107 = !DILocation(line: 75, column: 6, scope: !99)
!108 = !DILocation(line: 76, column: 6, scope: !99)
!109 = !DILocation(line: 76, column: 9, scope: !99)
!110 = !DILocation(line: 76, column: 12, scope: !99)
!111 = !DILocation(line: 77, column: 11, scope: !99)
!112 = !DILocation(line: 77, column: 6, scope: !99)
!113 = !DILocation(line: 78, column: 2, scope: !99)
!114 = !DILocation(line: 79, column: 1, scope: !76)
!115 = distinct !DISubprogram(name: "main", scope: !6, file: !6, line: 86, type: !116, isLocal: false, isDefinition: true, scopeLine: 87, isOptimized: false, unit: !0, variables: !2)
!116 = !DISubroutineType(types: !117)
!117 = !{!15}
!118 = !DILocation(line: 88, column: 2, scope: !115)
!119 = !DILocation(line: 89, column: 2, scope: !115)
!120 = !DILocation(line: 90, column: 2, scope: !115)
