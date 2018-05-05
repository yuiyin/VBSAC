; ModuleID = './457_uninit_memory_access_7.c'
source_filename = "./457_uninit_memory_access_7.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.uninit_memory_access_008_s_001 = type { i16, [2 x i8] }

; Function Attrs: nounwind uwtable
define %struct.uninit_memory_access_008_s_001* @uninit_memory_access_008_func_001_bad() #0 !dbg !16 {
entry:
  %ret = alloca %struct.uninit_memory_access_008_s_001*, align 8
  call void @llvm.dbg.declare(metadata %struct.uninit_memory_access_008_s_001** %ret, metadata !19, metadata !20), !dbg !21
  %call = call noalias i8* @malloc(i64 20) #3, !dbg !22
  %0 = bitcast i8* %call to %struct.uninit_memory_access_008_s_001*, !dbg !23
  store %struct.uninit_memory_access_008_s_001* %0, %struct.uninit_memory_access_008_s_001** %ret, align 8, !dbg !21
  %1 = load %struct.uninit_memory_access_008_s_001*, %struct.uninit_memory_access_008_s_001** %ret, align 8, !dbg !24
  ret %struct.uninit_memory_access_008_s_001* %1, !dbg !25
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #2

; Function Attrs: nounwind uwtable
define void @uninit_memory_access_008_bad() #0 !dbg !26 {
entry:
  %s = alloca %struct.uninit_memory_access_008_s_001*, align 8
  call void @llvm.dbg.declare(metadata %struct.uninit_memory_access_008_s_001** %s, metadata !29, metadata !20), !dbg !30
  store %struct.uninit_memory_access_008_s_001* null, %struct.uninit_memory_access_008_s_001** %s, align 8, !dbg !30
  %call = call %struct.uninit_memory_access_008_s_001* @uninit_memory_access_008_func_001_bad(), !dbg !31
  store %struct.uninit_memory_access_008_s_001* %call, %struct.uninit_memory_access_008_s_001** %s, align 8, !dbg !32
  %0 = load %struct.uninit_memory_access_008_s_001*, %struct.uninit_memory_access_008_s_001** %s, align 8, !dbg !33
  %1 = bitcast %struct.uninit_memory_access_008_s_001* %0 to i16*, !dbg !34
  %bf.load = load i16, i16* %1, align 4, !dbg !34
  %bf.shl = shl i16 %bf.load, 9, !dbg !34
  %bf.ashr = ashr i16 %bf.shl, 9, !dbg !34
  %bf.cast = sext i16 %bf.ashr to i32, !dbg !34
  %2 = load %struct.uninit_memory_access_008_s_001*, %struct.uninit_memory_access_008_s_001** %s, align 8, !dbg !35
  %3 = bitcast %struct.uninit_memory_access_008_s_001* %2 to i16*, !dbg !36
  %4 = trunc i32 %bf.cast to i16, !dbg !37
  %bf.load1 = load i16, i16* %3, align 4, !dbg !37
  %bf.value = and i16 %4, 127, !dbg !37
  %bf.shl2 = shl i16 %bf.value, 7, !dbg !37
  %bf.clear = and i16 %bf.load1, -16257, !dbg !37
  %bf.set = or i16 %bf.clear, %bf.shl2, !dbg !37
  store i16 %bf.set, i16* %3, align 4, !dbg !37
  %bf.result.shl = shl i16 %bf.value, 9, !dbg !37
  %bf.result.ashr = ashr i16 %bf.result.shl, 9, !dbg !37
  %bf.result.cast = sext i16 %bf.result.ashr to i32, !dbg !37
  ret void, !dbg !38
}

; Function Attrs: nounwind uwtable
define %struct.uninit_memory_access_008_s_001* @uninit_memory_access_008_func_001_good() #0 !dbg !39 {
entry:
  %ret = alloca %struct.uninit_memory_access_008_s_001*, align 8
  call void @llvm.dbg.declare(metadata %struct.uninit_memory_access_008_s_001** %ret, metadata !40, metadata !20), !dbg !41
  %call = call noalias i8* @malloc(i64 20) #3, !dbg !42
  %0 = bitcast i8* %call to %struct.uninit_memory_access_008_s_001*, !dbg !43
  store %struct.uninit_memory_access_008_s_001* %0, %struct.uninit_memory_access_008_s_001** %ret, align 8, !dbg !41
  %1 = load %struct.uninit_memory_access_008_s_001*, %struct.uninit_memory_access_008_s_001** %ret, align 8, !dbg !44
  %cmp = icmp ne %struct.uninit_memory_access_008_s_001* %1, null, !dbg !46
  br i1 %cmp, label %if.then, label %if.end, !dbg !47

if.then:                                          ; preds = %entry
  %2 = load %struct.uninit_memory_access_008_s_001*, %struct.uninit_memory_access_008_s_001** %ret, align 8, !dbg !48
  %3 = bitcast %struct.uninit_memory_access_008_s_001* %2 to i16*, !dbg !50
  %bf.load = load i16, i16* %3, align 4, !dbg !51
  %bf.clear = and i16 %bf.load, -128, !dbg !51
  %bf.set = or i16 %bf.clear, 15, !dbg !51
  store i16 %bf.set, i16* %3, align 4, !dbg !51
  %4 = load %struct.uninit_memory_access_008_s_001*, %struct.uninit_memory_access_008_s_001** %ret, align 8, !dbg !52
  %5 = bitcast %struct.uninit_memory_access_008_s_001* %4 to i16*, !dbg !53
  %bf.load1 = load i16, i16* %5, align 4, !dbg !54
  %bf.clear2 = and i16 %bf.load1, -16257, !dbg !54
  %bf.set3 = or i16 %bf.clear2, 1920, !dbg !54
  store i16 %bf.set3, i16* %5, align 4, !dbg !54
  br label %if.end, !dbg !55

if.end:                                           ; preds = %if.then, %entry
  %6 = load %struct.uninit_memory_access_008_s_001*, %struct.uninit_memory_access_008_s_001** %ret, align 8, !dbg !56
  ret %struct.uninit_memory_access_008_s_001* %6, !dbg !57
}

; Function Attrs: nounwind uwtable
define void @uninit_memory_access_008_good() #0 !dbg !58 {
entry:
  %s = alloca %struct.uninit_memory_access_008_s_001*, align 8
  call void @llvm.dbg.declare(metadata %struct.uninit_memory_access_008_s_001** %s, metadata !59, metadata !20), !dbg !60
  store %struct.uninit_memory_access_008_s_001* null, %struct.uninit_memory_access_008_s_001** %s, align 8, !dbg !60
  %call = call %struct.uninit_memory_access_008_s_001* @uninit_memory_access_008_func_001_good(), !dbg !61
  store %struct.uninit_memory_access_008_s_001* %call, %struct.uninit_memory_access_008_s_001** %s, align 8, !dbg !62
  %0 = load %struct.uninit_memory_access_008_s_001*, %struct.uninit_memory_access_008_s_001** %s, align 8, !dbg !63
  %cmp = icmp ne %struct.uninit_memory_access_008_s_001* %0, null, !dbg !65
  br i1 %cmp, label %if.then, label %if.end, !dbg !66

if.then:                                          ; preds = %entry
  %1 = load %struct.uninit_memory_access_008_s_001*, %struct.uninit_memory_access_008_s_001** %s, align 8, !dbg !67
  %2 = bitcast %struct.uninit_memory_access_008_s_001* %1 to i16*, !dbg !69
  %bf.load = load i16, i16* %2, align 4, !dbg !69
  %bf.shl = shl i16 %bf.load, 9, !dbg !69
  %bf.ashr = ashr i16 %bf.shl, 9, !dbg !69
  %bf.cast = sext i16 %bf.ashr to i32, !dbg !69
  %add = add nsw i32 %bf.cast, 10, !dbg !70
  %3 = load %struct.uninit_memory_access_008_s_001*, %struct.uninit_memory_access_008_s_001** %s, align 8, !dbg !71
  %4 = bitcast %struct.uninit_memory_access_008_s_001* %3 to i16*, !dbg !72
  %5 = trunc i32 %add to i16, !dbg !73
  %bf.load1 = load i16, i16* %4, align 4, !dbg !73
  %bf.value = and i16 %5, 127, !dbg !73
  %bf.shl2 = shl i16 %bf.value, 7, !dbg !73
  %bf.clear = and i16 %bf.load1, -16257, !dbg !73
  %bf.set = or i16 %bf.clear, %bf.shl2, !dbg !73
  store i16 %bf.set, i16* %4, align 4, !dbg !73
  %bf.result.shl = shl i16 %bf.value, 9, !dbg !73
  %bf.result.ashr = ashr i16 %bf.result.shl, 9, !dbg !73
  %bf.result.cast = sext i16 %bf.result.ashr to i32, !dbg !73
  %6 = load %struct.uninit_memory_access_008_s_001*, %struct.uninit_memory_access_008_s_001** %s, align 8, !dbg !74
  %7 = bitcast %struct.uninit_memory_access_008_s_001* %6 to i8*, !dbg !74
  call void @free(i8* %7) #3, !dbg !75
  br label %if.end, !dbg !76

if.end:                                           ; preds = %if.then, %entry
  ret void, !dbg !77
}

; Function Attrs: nounwind
declare void @free(i8*) #2

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !78 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @uninit_memory_access_008_good(), !dbg !81
  call void @uninit_memory_access_008_bad(), !dbg !82
  ret i32 0, !dbg !83
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!13, !14}
!llvm.ident = !{!15}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (tags/RELEASE_390/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3)
!1 = !DIFile(filename: "457_uninit_memory_access_7.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/itc/457")
!2 = !{}
!3 = !{!4, !12}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64, align: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "uninit_memory_access_008_s_001", file: !6, line: 12, baseType: !7)
!6 = !DIFile(filename: "./457_uninit_memory_access_7.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/itc/457")
!7 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !6, line: 9, size: 32, align: 32, elements: !8)
!8 = !{!9, !11}
!9 = !DIDerivedType(tag: DW_TAG_member, name: "a", scope: !7, file: !6, line: 10, baseType: !10, size: 7, align: 32, flags: DIFlagBitField, extraData: i64 0)
!10 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!11 = !DIDerivedType(tag: DW_TAG_member, name: "b", scope: !7, file: !6, line: 11, baseType: !10, size: 7, align: 32, offset: 7, flags: DIFlagBitField, extraData: i64 0)
!12 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64, align: 64)
!13 = !{i32 2, !"Dwarf Version", i32 4}
!14 = !{i32 2, !"Debug Info Version", i32 3}
!15 = !{!"clang version 3.9.0 (tags/RELEASE_390/final)"}
!16 = distinct !DISubprogram(name: "uninit_memory_access_008_func_001_bad", scope: !6, file: !6, line: 14, type: !17, isLocal: false, isDefinition: true, scopeLine: 15, isOptimized: false, unit: !0, variables: !2)
!17 = !DISubroutineType(types: !18)
!18 = !{!4}
!19 = !DILocalVariable(name: "ret", scope: !16, file: !6, line: 16, type: !4)
!20 = !DIExpression()
!21 = !DILocation(line: 16, column: 34, scope: !16)
!22 = !DILocation(line: 16, column: 75, scope: !16)
!23 = !DILocation(line: 16, column: 40, scope: !16)
!24 = !DILocation(line: 17, column: 9, scope: !16)
!25 = !DILocation(line: 17, column: 2, scope: !16)
!26 = distinct !DISubprogram(name: "uninit_memory_access_008_bad", scope: !6, file: !6, line: 20, type: !27, isLocal: false, isDefinition: true, scopeLine: 21, isOptimized: false, unit: !0, variables: !2)
!27 = !DISubroutineType(types: !28)
!28 = !{null}
!29 = !DILocalVariable(name: "s", scope: !26, file: !6, line: 22, type: !4)
!30 = !DILocation(line: 22, column: 34, scope: !26)
!31 = !DILocation(line: 23, column: 6, scope: !26)
!32 = !DILocation(line: 23, column: 4, scope: !26)
!33 = !DILocation(line: 24, column: 9, scope: !26)
!34 = !DILocation(line: 24, column: 12, scope: !26)
!35 = !DILocation(line: 24, column: 2, scope: !26)
!36 = !DILocation(line: 24, column: 5, scope: !26)
!37 = !DILocation(line: 24, column: 7, scope: !26)
!38 = !DILocation(line: 25, column: 1, scope: !26)
!39 = distinct !DISubprogram(name: "uninit_memory_access_008_func_001_good", scope: !6, file: !6, line: 32, type: !17, isLocal: false, isDefinition: true, scopeLine: 33, isOptimized: false, unit: !0, variables: !2)
!40 = !DILocalVariable(name: "ret", scope: !39, file: !6, line: 34, type: !4)
!41 = !DILocation(line: 34, column: 34, scope: !39)
!42 = !DILocation(line: 34, column: 75, scope: !39)
!43 = !DILocation(line: 34, column: 40, scope: !39)
!44 = !DILocation(line: 35, column: 6, scope: !45)
!45 = distinct !DILexicalBlock(scope: !39, file: !6, line: 35, column: 6)
!46 = !DILocation(line: 35, column: 9, scope: !45)
!47 = !DILocation(line: 35, column: 6, scope: !39)
!48 = !DILocation(line: 37, column: 3, scope: !49)
!49 = distinct !DILexicalBlock(scope: !45, file: !6, line: 36, column: 2)
!50 = !DILocation(line: 37, column: 8, scope: !49)
!51 = !DILocation(line: 37, column: 10, scope: !49)
!52 = !DILocation(line: 38, column: 3, scope: !49)
!53 = !DILocation(line: 38, column: 8, scope: !49)
!54 = !DILocation(line: 38, column: 10, scope: !49)
!55 = !DILocation(line: 39, column: 2, scope: !49)
!56 = !DILocation(line: 40, column: 9, scope: !39)
!57 = !DILocation(line: 40, column: 2, scope: !39)
!58 = distinct !DISubprogram(name: "uninit_memory_access_008_good", scope: !6, file: !6, line: 43, type: !27, isLocal: false, isDefinition: true, scopeLine: 44, isOptimized: false, unit: !0, variables: !2)
!59 = !DILocalVariable(name: "s", scope: !58, file: !6, line: 45, type: !4)
!60 = !DILocation(line: 45, column: 34, scope: !58)
!61 = !DILocation(line: 46, column: 6, scope: !58)
!62 = !DILocation(line: 46, column: 4, scope: !58)
!63 = !DILocation(line: 47, column: 5, scope: !64)
!64 = distinct !DILexicalBlock(scope: !58, file: !6, line: 47, column: 5)
!65 = !DILocation(line: 47, column: 6, scope: !64)
!66 = !DILocation(line: 47, column: 5, scope: !58)
!67 = !DILocation(line: 49, column: 11, scope: !68)
!68 = distinct !DILexicalBlock(scope: !64, file: !6, line: 48, column: 2)
!69 = !DILocation(line: 49, column: 14, scope: !68)
!70 = !DILocation(line: 49, column: 16, scope: !68)
!71 = !DILocation(line: 49, column: 3, scope: !68)
!72 = !DILocation(line: 49, column: 6, scope: !68)
!73 = !DILocation(line: 49, column: 8, scope: !68)
!74 = !DILocation(line: 50, column: 9, scope: !68)
!75 = !DILocation(line: 50, column: 3, scope: !68)
!76 = !DILocation(line: 51, column: 2, scope: !68)
!77 = !DILocation(line: 52, column: 1, scope: !58)
!78 = distinct !DISubprogram(name: "main", scope: !6, file: !6, line: 54, type: !79, isLocal: false, isDefinition: true, scopeLine: 54, isOptimized: false, unit: !0, variables: !2)
!79 = !DISubroutineType(types: !80)
!80 = !{!10}
!81 = !DILocation(line: 55, column: 2, scope: !78)
!82 = !DILocation(line: 56, column: 2, scope: !78)
!83 = !DILocation(line: 57, column: 2, scope: !78)
