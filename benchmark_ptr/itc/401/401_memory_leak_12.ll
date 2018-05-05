; ModuleID = './401_memory_leak_12.c'
source_filename = "./401_memory_leak_12.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%union.memory_leak_0012_uni_001 = type { %struct.memory_leak_0012_s_001 }
%struct.memory_leak_0012_s_001 = type { i32, i32 }

; Function Attrs: nounwind uwtable
define void @memory_leak_0012_bad() #0 !dbg !32 {
entry:
  %u = alloca %union.memory_leak_0012_uni_001*, align 8
  %p = alloca %union.memory_leak_0012_uni_001*, align 8
  call void @llvm.dbg.declare(metadata %union.memory_leak_0012_uni_001** %u, metadata !35, metadata !36), !dbg !37
  %call = call noalias i8* @malloc(i64 40) #3, !dbg !38
  %0 = bitcast i8* %call to %union.memory_leak_0012_uni_001*, !dbg !39
  store %union.memory_leak_0012_uni_001* %0, %union.memory_leak_0012_uni_001** %u, align 8, !dbg !37
  %1 = load %union.memory_leak_0012_uni_001*, %union.memory_leak_0012_uni_001** %u, align 8, !dbg !40
  %cmp = icmp eq %union.memory_leak_0012_uni_001* %1, null, !dbg !42
  br i1 %cmp, label %if.then, label %if.end, !dbg !43

if.then:                                          ; preds = %entry
  br label %return, !dbg !44

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata %union.memory_leak_0012_uni_001** %p, metadata !46, metadata !36), !dbg !47
  %call1 = call noalias i8* @malloc(i64 40) #3, !dbg !48
  %2 = bitcast i8* %call1 to %union.memory_leak_0012_uni_001*, !dbg !49
  store %union.memory_leak_0012_uni_001* %2, %union.memory_leak_0012_uni_001** %p, align 8, !dbg !47
  %3 = load %union.memory_leak_0012_uni_001*, %union.memory_leak_0012_uni_001** %u, align 8, !dbg !50
  store %union.memory_leak_0012_uni_001* %3, %union.memory_leak_0012_uni_001** %p, align 8, !dbg !51
  %4 = load %union.memory_leak_0012_uni_001*, %union.memory_leak_0012_uni_001** %p, align 8, !dbg !52
  %s1 = bitcast %union.memory_leak_0012_uni_001* %4 to %struct.memory_leak_0012_s_001*, !dbg !53
  %a = getelementptr inbounds %struct.memory_leak_0012_s_001, %struct.memory_leak_0012_s_001* %s1, i32 0, i32 0, !dbg !54
  store i32 1, i32* %a, align 4, !dbg !55
  %5 = load %union.memory_leak_0012_uni_001*, %union.memory_leak_0012_uni_001** %u, align 8, !dbg !56
  %6 = bitcast %union.memory_leak_0012_uni_001* %5 to i8*, !dbg !56
  call void @free(i8* %6) #3, !dbg !57
  br label %return, !dbg !58

return:                                           ; preds = %if.end, %if.then
  ret void, !dbg !59
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #2

; Function Attrs: nounwind
declare void @free(i8*) #2

; Function Attrs: nounwind uwtable
define void @memory_leak_0012_good() #0 !dbg !61 {
entry:
  %u = alloca %union.memory_leak_0012_uni_001*, align 8
  %p = alloca %union.memory_leak_0012_uni_001*, align 8
  call void @llvm.dbg.declare(metadata %union.memory_leak_0012_uni_001** %u, metadata !62, metadata !36), !dbg !63
  %call = call noalias i8* @malloc(i64 40) #3, !dbg !64
  %0 = bitcast i8* %call to %union.memory_leak_0012_uni_001*, !dbg !65
  store %union.memory_leak_0012_uni_001* %0, %union.memory_leak_0012_uni_001** %u, align 8, !dbg !63
  call void @llvm.dbg.declare(metadata %union.memory_leak_0012_uni_001** %p, metadata !66, metadata !36), !dbg !67
  store %union.memory_leak_0012_uni_001* null, %union.memory_leak_0012_uni_001** %p, align 8, !dbg !67
  %1 = load %union.memory_leak_0012_uni_001*, %union.memory_leak_0012_uni_001** %u, align 8, !dbg !68
  store %union.memory_leak_0012_uni_001* %1, %union.memory_leak_0012_uni_001** %p, align 8, !dbg !69
  %2 = load %union.memory_leak_0012_uni_001*, %union.memory_leak_0012_uni_001** %u, align 8, !dbg !70
  %cmp = icmp ne %union.memory_leak_0012_uni_001* %2, null, !dbg !72
  br i1 %cmp, label %if.then, label %if.end, !dbg !73

if.then:                                          ; preds = %entry
  %3 = load %union.memory_leak_0012_uni_001*, %union.memory_leak_0012_uni_001** %p, align 8, !dbg !74
  %s1 = bitcast %union.memory_leak_0012_uni_001* %3 to %struct.memory_leak_0012_s_001*, !dbg !76
  %a = getelementptr inbounds %struct.memory_leak_0012_s_001, %struct.memory_leak_0012_s_001* %s1, i32 0, i32 0, !dbg !77
  store i32 1, i32* %a, align 4, !dbg !78
  %4 = load %union.memory_leak_0012_uni_001*, %union.memory_leak_0012_uni_001** %u, align 8, !dbg !79
  %5 = bitcast %union.memory_leak_0012_uni_001* %4 to i8*, !dbg !79
  call void @free(i8* %5) #3, !dbg !80
  br label %if.end, !dbg !81

if.end:                                           ; preds = %if.then, %entry
  ret void, !dbg !82
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !83 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @memory_leak_0012_good(), !dbg !86
  call void @memory_leak_0012_bad(), !dbg !87
  ret i32 0, !dbg !88
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!29, !30}
!llvm.ident = !{!31}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (tags/RELEASE_390/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3)
!1 = !DIFile(filename: "401_memory_leak_12.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/itc/401")
!2 = !{}
!3 = !{!4, !28}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64, align: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "memory_leak_0012_uni_001", file: !6, line: 36, baseType: !7)
!6 = !DIFile(filename: "./401_memory_leak_12.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/itc/401")
!7 = distinct !DICompositeType(tag: DW_TAG_union_type, file: !6, line: 32, size: 64, align: 32, elements: !8)
!8 = !{!9, !16, !22}
!9 = !DIDerivedType(tag: DW_TAG_member, name: "s1", scope: !7, file: !6, line: 33, baseType: !10, size: 64, align: 32)
!10 = !DIDerivedType(tag: DW_TAG_typedef, name: "memory_leak_0012_s_001", file: !6, line: 20, baseType: !11)
!11 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !6, line: 17, size: 64, align: 32, elements: !12)
!12 = !{!13, !15}
!13 = !DIDerivedType(tag: DW_TAG_member, name: "a", scope: !11, file: !6, line: 18, baseType: !14, size: 32, align: 32)
!14 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!15 = !DIDerivedType(tag: DW_TAG_member, name: "b", scope: !11, file: !6, line: 19, baseType: !14, size: 32, align: 32, offset: 32)
!16 = !DIDerivedType(tag: DW_TAG_member, name: "s2", scope: !7, file: !6, line: 34, baseType: !17, size: 64, align: 32)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "memory_leak_0012_s_002", file: !6, line: 25, baseType: !18)
!18 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !6, line: 22, size: 64, align: 32, elements: !19)
!19 = !{!20, !21}
!20 = !DIDerivedType(tag: DW_TAG_member, name: "a", scope: !18, file: !6, line: 23, baseType: !14, size: 32, align: 32)
!21 = !DIDerivedType(tag: DW_TAG_member, name: "b", scope: !18, file: !6, line: 24, baseType: !14, size: 32, align: 32, offset: 32)
!22 = !DIDerivedType(tag: DW_TAG_member, name: "s3", scope: !7, file: !6, line: 35, baseType: !23, size: 64, align: 32)
!23 = !DIDerivedType(tag: DW_TAG_typedef, name: "memory_leak_0012_s_003", file: !6, line: 30, baseType: !24)
!24 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !6, line: 27, size: 64, align: 32, elements: !25)
!25 = !{!26, !27}
!26 = !DIDerivedType(tag: DW_TAG_member, name: "a", scope: !24, file: !6, line: 28, baseType: !14, size: 32, align: 32)
!27 = !DIDerivedType(tag: DW_TAG_member, name: "b", scope: !24, file: !6, line: 29, baseType: !14, size: 32, align: 32, offset: 32)
!28 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64, align: 64)
!29 = !{i32 2, !"Dwarf Version", i32 4}
!30 = !{i32 2, !"Debug Info Version", i32 3}
!31 = !{!"clang version 3.9.0 (tags/RELEASE_390/final)"}
!32 = distinct !DISubprogram(name: "memory_leak_0012_bad", scope: !6, file: !6, line: 38, type: !33, isLocal: false, isDefinition: true, scopeLine: 39, isOptimized: false, unit: !0, variables: !2)
!33 = !DISubroutineType(types: !34)
!34 = !{null}
!35 = !DILocalVariable(name: "u", scope: !32, file: !6, line: 40, type: !4)
!36 = !DIExpression()
!37 = !DILocation(line: 40, column: 28, scope: !32)
!38 = !DILocation(line: 40, column: 61, scope: !32)
!39 = !DILocation(line: 40, column: 32, scope: !32)
!40 = !DILocation(line: 41, column: 6, scope: !41)
!41 = distinct !DILexicalBlock(scope: !32, file: !6, line: 41, column: 6)
!42 = !DILocation(line: 41, column: 8, scope: !41)
!43 = !DILocation(line: 41, column: 6, scope: !32)
!44 = !DILocation(line: 43, column: 3, scope: !45)
!45 = distinct !DILexicalBlock(scope: !41, file: !6, line: 42, column: 2)
!46 = !DILocalVariable(name: "p", scope: !32, file: !6, line: 45, type: !4)
!47 = !DILocation(line: 45, column: 28, scope: !32)
!48 = !DILocation(line: 45, column: 62, scope: !32)
!49 = !DILocation(line: 45, column: 33, scope: !32)
!50 = !DILocation(line: 46, column: 6, scope: !32)
!51 = !DILocation(line: 46, column: 4, scope: !32)
!52 = !DILocation(line: 48, column: 2, scope: !32)
!53 = !DILocation(line: 48, column: 5, scope: !32)
!54 = !DILocation(line: 48, column: 8, scope: !32)
!55 = !DILocation(line: 48, column: 10, scope: !32)
!56 = !DILocation(line: 50, column: 7, scope: !32)
!57 = !DILocation(line: 50, column: 2, scope: !32)
!58 = !DILocation(line: 51, column: 1, scope: !32)
!59 = !DILocation(line: 51, column: 1, scope: !60)
!60 = !DILexicalBlockFile(scope: !32, file: !6, discriminator: 1)
!61 = distinct !DISubprogram(name: "memory_leak_0012_good", scope: !6, file: !6, line: 57, type: !33, isLocal: false, isDefinition: true, scopeLine: 58, isOptimized: false, unit: !0, variables: !2)
!62 = !DILocalVariable(name: "u", scope: !61, file: !6, line: 59, type: !4)
!63 = !DILocation(line: 59, column: 28, scope: !61)
!64 = !DILocation(line: 59, column: 61, scope: !61)
!65 = !DILocation(line: 59, column: 32, scope: !61)
!66 = !DILocalVariable(name: "p", scope: !61, file: !6, line: 60, type: !4)
!67 = !DILocation(line: 60, column: 28, scope: !61)
!68 = !DILocation(line: 61, column: 6, scope: !61)
!69 = !DILocation(line: 61, column: 4, scope: !61)
!70 = !DILocation(line: 62, column: 8, scope: !71)
!71 = distinct !DILexicalBlock(scope: !61, file: !6, line: 62, column: 8)
!72 = !DILocation(line: 62, column: 9, scope: !71)
!73 = !DILocation(line: 62, column: 8, scope: !61)
!74 = !DILocation(line: 64, column: 6, scope: !75)
!75 = distinct !DILexicalBlock(scope: !71, file: !6, line: 63, column: 5)
!76 = !DILocation(line: 64, column: 9, scope: !75)
!77 = !DILocation(line: 64, column: 12, scope: !75)
!78 = !DILocation(line: 64, column: 14, scope: !75)
!79 = !DILocation(line: 65, column: 11, scope: !75)
!80 = !DILocation(line: 65, column: 6, scope: !75)
!81 = !DILocation(line: 66, column: 5, scope: !75)
!82 = !DILocation(line: 67, column: 1, scope: !61)
!83 = distinct !DISubprogram(name: "main", scope: !6, file: !6, line: 74, type: !84, isLocal: false, isDefinition: true, scopeLine: 75, isOptimized: false, unit: !0, variables: !2)
!84 = !DISubroutineType(types: !85)
!85 = !{!14}
!86 = !DILocation(line: 76, column: 2, scope: !83)
!87 = !DILocation(line: 77, column: 2, scope: !83)
!88 = !DILocation(line: 78, column: 2, scope: !83)
