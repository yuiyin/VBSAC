; ModuleID = './457_uninit_var_14.c'
source_filename = "./457_uninit_var_14.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.uninit_var_014_s_001 = type { i32, i32, i32 }

; Function Attrs: nounwind uwtable
define { i64, i32 } @uninit_var_014_func_001_bad(i64 %s1.coerce0, i32 %s1.coerce1) #0 !dbg !6 {
entry:
  %retval = alloca %struct.uninit_var_014_s_001, align 4
  %s1 = alloca %struct.uninit_var_014_s_001, align 4
  %coerce = alloca { i64, i32 }, align 4
  %ret = alloca %struct.uninit_var_014_s_001, align 4
  %tmp = alloca { i64, i32 }, align 8
  %0 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %coerce, i32 0, i32 0
  store i64 %s1.coerce0, i64* %0, align 4
  %1 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %coerce, i32 0, i32 1
  store i32 %s1.coerce1, i32* %1, align 4
  %2 = bitcast %struct.uninit_var_014_s_001* %s1 to i8*
  %3 = bitcast { i64, i32 }* %coerce to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %2, i8* %3, i64 12, i32 4, i1 false)
  call void @llvm.dbg.declare(metadata %struct.uninit_var_014_s_001* %s1, metadata !17, metadata !18), !dbg !19
  call void @llvm.dbg.declare(metadata %struct.uninit_var_014_s_001* %ret, metadata !20, metadata !18), !dbg !21
  %a = getelementptr inbounds %struct.uninit_var_014_s_001, %struct.uninit_var_014_s_001* %s1, i32 0, i32 0, !dbg !22
  %4 = load i32, i32* %a, align 4, !dbg !23
  %inc = add nsw i32 %4, 1, !dbg !23
  store i32 %inc, i32* %a, align 4, !dbg !23
  %a1 = getelementptr inbounds %struct.uninit_var_014_s_001, %struct.uninit_var_014_s_001* %ret, i32 0, i32 0, !dbg !24
  store i32 %inc, i32* %a1, align 4, !dbg !25
  %b = getelementptr inbounds %struct.uninit_var_014_s_001, %struct.uninit_var_014_s_001* %s1, i32 0, i32 1, !dbg !26
  %5 = load i32, i32* %b, align 4, !dbg !27
  %inc2 = add nsw i32 %5, 1, !dbg !27
  store i32 %inc2, i32* %b, align 4, !dbg !27
  %b3 = getelementptr inbounds %struct.uninit_var_014_s_001, %struct.uninit_var_014_s_001* %ret, i32 0, i32 1, !dbg !28
  store i32 %inc2, i32* %b3, align 4, !dbg !29
  %uninit = getelementptr inbounds %struct.uninit_var_014_s_001, %struct.uninit_var_014_s_001* %s1, i32 0, i32 2, !dbg !30
  %6 = load i32, i32* %uninit, align 4, !dbg !31
  %inc4 = add nsw i32 %6, 1, !dbg !31
  store i32 %inc4, i32* %uninit, align 4, !dbg !31
  %uninit5 = getelementptr inbounds %struct.uninit_var_014_s_001, %struct.uninit_var_014_s_001* %ret, i32 0, i32 2, !dbg !32
  store i32 %inc4, i32* %uninit5, align 4, !dbg !33
  %7 = bitcast %struct.uninit_var_014_s_001* %retval to i8*, !dbg !34
  %8 = bitcast %struct.uninit_var_014_s_001* %ret to i8*, !dbg !34
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %7, i8* %8, i64 12, i32 4, i1 false), !dbg !34
  %9 = bitcast { i64, i32 }* %tmp to i8*, !dbg !35
  %10 = bitcast %struct.uninit_var_014_s_001* %retval to i8*, !dbg !35
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %9, i8* %10, i64 12, i32 4, i1 false), !dbg !36
  %11 = load { i64, i32 }, { i64, i32 }* %tmp, align 8, !dbg !35
  ret { i64, i32 } %11, !dbg !35
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i32, i1) #1

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #2

; Function Attrs: nounwind uwtable
define void @uninit_var_014_bad() #0 !dbg !38 {
entry:
  %s = alloca %struct.uninit_var_014_s_001, align 4
  %r = alloca %struct.uninit_var_014_s_001, align 4
  %s.coerce = alloca { i64, i32 }, align 4
  %coerce = alloca %struct.uninit_var_014_s_001, align 4
  %tmp = alloca { i64, i32 }, align 8
  call void @llvm.dbg.declare(metadata %struct.uninit_var_014_s_001* %s, metadata !41, metadata !18), !dbg !42
  call void @llvm.dbg.declare(metadata %struct.uninit_var_014_s_001* %r, metadata !43, metadata !18), !dbg !44
  %a = getelementptr inbounds %struct.uninit_var_014_s_001, %struct.uninit_var_014_s_001* %s, i32 0, i32 0, !dbg !45
  store i32 1, i32* %a, align 4, !dbg !46
  %b = getelementptr inbounds %struct.uninit_var_014_s_001, %struct.uninit_var_014_s_001* %s, i32 0, i32 1, !dbg !47
  store i32 1, i32* %b, align 4, !dbg !48
  %0 = bitcast { i64, i32 }* %s.coerce to i8*, !dbg !49
  %1 = bitcast %struct.uninit_var_014_s_001* %s to i8*, !dbg !49
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %0, i8* %1, i64 12, i32 4, i1 false), !dbg !49
  %2 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %s.coerce, i32 0, i32 0, !dbg !49
  %3 = load i64, i64* %2, align 4, !dbg !49
  %4 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %s.coerce, i32 0, i32 1, !dbg !49
  %5 = load i32, i32* %4, align 4, !dbg !49
  %call = call { i64, i32 } @uninit_var_014_func_001_bad(i64 %3, i32 %5), !dbg !50
  store { i64, i32 } %call, { i64, i32 }* %tmp, align 8, !dbg !49
  %6 = bitcast { i64, i32 }* %tmp to i8*, !dbg !49
  %7 = bitcast %struct.uninit_var_014_s_001* %coerce to i8*, !dbg !49
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %7, i8* %6, i64 12, i32 4, i1 false), !dbg !52
  %8 = bitcast %struct.uninit_var_014_s_001* %r to i8*, !dbg !49
  %9 = bitcast %struct.uninit_var_014_s_001* %coerce to i8*, !dbg !49
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %8, i8* %9, i64 12, i32 4, i1 false), !dbg !54
  ret void, !dbg !56
}

; Function Attrs: nounwind uwtable
define { i64, i32 } @uninit_var_014_func_001_good(i64 %s1.coerce0, i32 %s1.coerce1) #0 !dbg !57 {
entry:
  %retval = alloca %struct.uninit_var_014_s_001, align 4
  %s1 = alloca %struct.uninit_var_014_s_001, align 4
  %coerce = alloca { i64, i32 }, align 4
  %ret = alloca %struct.uninit_var_014_s_001, align 4
  %tmp = alloca { i64, i32 }, align 8
  %0 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %coerce, i32 0, i32 0
  store i64 %s1.coerce0, i64* %0, align 4
  %1 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %coerce, i32 0, i32 1
  store i32 %s1.coerce1, i32* %1, align 4
  %2 = bitcast %struct.uninit_var_014_s_001* %s1 to i8*
  %3 = bitcast { i64, i32 }* %coerce to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %2, i8* %3, i64 12, i32 4, i1 false)
  call void @llvm.dbg.declare(metadata %struct.uninit_var_014_s_001* %s1, metadata !58, metadata !18), !dbg !59
  call void @llvm.dbg.declare(metadata %struct.uninit_var_014_s_001* %ret, metadata !60, metadata !18), !dbg !61
  %a = getelementptr inbounds %struct.uninit_var_014_s_001, %struct.uninit_var_014_s_001* %s1, i32 0, i32 0, !dbg !62
  %4 = load i32, i32* %a, align 4, !dbg !63
  %inc = add nsw i32 %4, 1, !dbg !63
  store i32 %inc, i32* %a, align 4, !dbg !63
  %a1 = getelementptr inbounds %struct.uninit_var_014_s_001, %struct.uninit_var_014_s_001* %ret, i32 0, i32 0, !dbg !64
  store i32 %inc, i32* %a1, align 4, !dbg !65
  %b = getelementptr inbounds %struct.uninit_var_014_s_001, %struct.uninit_var_014_s_001* %s1, i32 0, i32 1, !dbg !66
  %5 = load i32, i32* %b, align 4, !dbg !67
  %inc2 = add nsw i32 %5, 1, !dbg !67
  store i32 %inc2, i32* %b, align 4, !dbg !67
  %b3 = getelementptr inbounds %struct.uninit_var_014_s_001, %struct.uninit_var_014_s_001* %ret, i32 0, i32 1, !dbg !68
  store i32 %inc2, i32* %b3, align 4, !dbg !69
  %uninit = getelementptr inbounds %struct.uninit_var_014_s_001, %struct.uninit_var_014_s_001* %s1, i32 0, i32 2, !dbg !70
  %6 = load i32, i32* %uninit, align 4, !dbg !71
  %inc4 = add nsw i32 %6, 1, !dbg !71
  store i32 %inc4, i32* %uninit, align 4, !dbg !71
  %uninit5 = getelementptr inbounds %struct.uninit_var_014_s_001, %struct.uninit_var_014_s_001* %ret, i32 0, i32 2, !dbg !72
  store i32 %inc4, i32* %uninit5, align 4, !dbg !73
  %7 = bitcast %struct.uninit_var_014_s_001* %retval to i8*, !dbg !74
  %8 = bitcast %struct.uninit_var_014_s_001* %ret to i8*, !dbg !74
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %7, i8* %8, i64 12, i32 4, i1 false), !dbg !74
  %9 = bitcast { i64, i32 }* %tmp to i8*, !dbg !75
  %10 = bitcast %struct.uninit_var_014_s_001* %retval to i8*, !dbg !75
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %9, i8* %10, i64 12, i32 4, i1 false), !dbg !76
  %11 = load { i64, i32 }, { i64, i32 }* %tmp, align 8, !dbg !75
  ret { i64, i32 } %11, !dbg !75
}

; Function Attrs: nounwind uwtable
define void @uninit_var_014_good() #0 !dbg !78 {
entry:
  %s = alloca %struct.uninit_var_014_s_001, align 4
  %r = alloca %struct.uninit_var_014_s_001, align 4
  %s.coerce = alloca { i64, i32 }, align 4
  %coerce = alloca %struct.uninit_var_014_s_001, align 4
  %tmp = alloca { i64, i32 }, align 8
  call void @llvm.dbg.declare(metadata %struct.uninit_var_014_s_001* %s, metadata !79, metadata !18), !dbg !80
  call void @llvm.dbg.declare(metadata %struct.uninit_var_014_s_001* %r, metadata !81, metadata !18), !dbg !82
  %a = getelementptr inbounds %struct.uninit_var_014_s_001, %struct.uninit_var_014_s_001* %s, i32 0, i32 0, !dbg !83
  store i32 1, i32* %a, align 4, !dbg !84
  %b = getelementptr inbounds %struct.uninit_var_014_s_001, %struct.uninit_var_014_s_001* %s, i32 0, i32 1, !dbg !85
  store i32 1, i32* %b, align 4, !dbg !86
  %uninit = getelementptr inbounds %struct.uninit_var_014_s_001, %struct.uninit_var_014_s_001* %s, i32 0, i32 2, !dbg !87
  store i32 1, i32* %uninit, align 4, !dbg !88
  %0 = bitcast { i64, i32 }* %s.coerce to i8*, !dbg !89
  %1 = bitcast %struct.uninit_var_014_s_001* %s to i8*, !dbg !89
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %0, i8* %1, i64 12, i32 4, i1 false), !dbg !89
  %2 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %s.coerce, i32 0, i32 0, !dbg !89
  %3 = load i64, i64* %2, align 4, !dbg !89
  %4 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %s.coerce, i32 0, i32 1, !dbg !89
  %5 = load i32, i32* %4, align 4, !dbg !89
  %call = call { i64, i32 } @uninit_var_014_func_001_good(i64 %3, i32 %5), !dbg !90
  store { i64, i32 } %call, { i64, i32 }* %tmp, align 8, !dbg !89
  %6 = bitcast { i64, i32 }* %tmp to i8*, !dbg !89
  %7 = bitcast %struct.uninit_var_014_s_001* %coerce to i8*, !dbg !89
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %7, i8* %6, i64 12, i32 4, i1 false), !dbg !92
  %8 = bitcast %struct.uninit_var_014_s_001* %r to i8*, !dbg !89
  %9 = bitcast %struct.uninit_var_014_s_001* %coerce to i8*, !dbg !89
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %8, i8* %9, i64 12, i32 4, i1 false), !dbg !94
  %a1 = getelementptr inbounds %struct.uninit_var_014_s_001, %struct.uninit_var_014_s_001* %r, i32 0, i32 0, !dbg !96
  store i32 0, i32* %a1, align 4, !dbg !97
  ret void, !dbg !98
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !99 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @uninit_var_014_good(), !dbg !102
  call void @uninit_var_014_bad(), !dbg !103
  ret i32 0, !dbg !104
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind }
attributes #2 = { nounwind readnone }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4}
!llvm.ident = !{!5}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (tags/RELEASE_390/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2)
!1 = !DIFile(filename: "457_uninit_var_14.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/itc/457")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{!"clang version 3.9.0 (tags/RELEASE_390/final)"}
!6 = distinct !DISubprogram(name: "uninit_var_014_func_001_bad", scope: !7, file: !7, line: 13, type: !8, isLocal: false, isDefinition: true, scopeLine: 13, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!7 = !DIFile(filename: "./457_uninit_var_14.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/itc/457")
!8 = !DISubroutineType(types: !9)
!9 = !{!10, !10}
!10 = !DIDerivedType(tag: DW_TAG_typedef, name: "uninit_var_014_s_001", file: !7, line: 11, baseType: !11)
!11 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !7, line: 7, size: 96, align: 32, elements: !12)
!12 = !{!13, !15, !16}
!13 = !DIDerivedType(tag: DW_TAG_member, name: "a", scope: !11, file: !7, line: 8, baseType: !14, size: 32, align: 32)
!14 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!15 = !DIDerivedType(tag: DW_TAG_member, name: "b", scope: !11, file: !7, line: 9, baseType: !14, size: 32, align: 32, offset: 32)
!16 = !DIDerivedType(tag: DW_TAG_member, name: "uninit", scope: !11, file: !7, line: 10, baseType: !14, size: 32, align: 32, offset: 64)
!17 = !DILocalVariable(name: "s1", arg: 1, scope: !6, file: !7, line: 13, type: !10)
!18 = !DIExpression()
!19 = !DILocation(line: 13, column: 71, scope: !6)
!20 = !DILocalVariable(name: "ret", scope: !6, file: !7, line: 14, type: !10)
!21 = !DILocation(line: 14, column: 23, scope: !6)
!22 = !DILocation(line: 15, column: 16, scope: !6)
!23 = !DILocation(line: 15, column: 11, scope: !6)
!24 = !DILocation(line: 15, column: 6, scope: !6)
!25 = !DILocation(line: 15, column: 8, scope: !6)
!26 = !DILocation(line: 16, column: 16, scope: !6)
!27 = !DILocation(line: 16, column: 11, scope: !6)
!28 = !DILocation(line: 16, column: 6, scope: !6)
!29 = !DILocation(line: 16, column: 8, scope: !6)
!30 = !DILocation(line: 17, column: 21, scope: !6)
!31 = !DILocation(line: 17, column: 16, scope: !6)
!32 = !DILocation(line: 17, column: 6, scope: !6)
!33 = !DILocation(line: 17, column: 13, scope: !6)
!34 = !DILocation(line: 18, column: 9, scope: !6)
!35 = !DILocation(line: 18, column: 2, scope: !6)
!36 = !DILocation(line: 18, column: 2, scope: !37)
!37 = !DILexicalBlockFile(scope: !6, file: !7, discriminator: 1)
!38 = distinct !DISubprogram(name: "uninit_var_014_bad", scope: !7, file: !7, line: 21, type: !39, isLocal: false, isDefinition: true, scopeLine: 21, isOptimized: false, unit: !0, variables: !2)
!39 = !DISubroutineType(types: !40)
!40 = !{null}
!41 = !DILocalVariable(name: "s", scope: !38, file: !7, line: 22, type: !10)
!42 = !DILocation(line: 22, column: 23, scope: !38)
!43 = !DILocalVariable(name: "r", scope: !38, file: !7, line: 22, type: !10)
!44 = !DILocation(line: 22, column: 25, scope: !38)
!45 = !DILocation(line: 23, column: 4, scope: !38)
!46 = !DILocation(line: 23, column: 6, scope: !38)
!47 = !DILocation(line: 24, column: 4, scope: !38)
!48 = !DILocation(line: 24, column: 6, scope: !38)
!49 = !DILocation(line: 25, column: 6, scope: !38)
!50 = !DILocation(line: 25, column: 6, scope: !51)
!51 = !DILexicalBlockFile(scope: !38, file: !7, discriminator: 1)
!52 = !DILocation(line: 25, column: 6, scope: !53)
!53 = !DILexicalBlockFile(scope: !38, file: !7, discriminator: 2)
!54 = !DILocation(line: 25, column: 6, scope: !55)
!55 = !DILexicalBlockFile(scope: !38, file: !7, discriminator: 3)
!56 = !DILocation(line: 26, column: 1, scope: !38)
!57 = distinct !DISubprogram(name: "uninit_var_014_func_001_good", scope: !7, file: !7, line: 32, type: !8, isLocal: false, isDefinition: true, scopeLine: 32, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!58 = !DILocalVariable(name: "s1", arg: 1, scope: !57, file: !7, line: 32, type: !10)
!59 = !DILocation(line: 32, column: 72, scope: !57)
!60 = !DILocalVariable(name: "ret", scope: !57, file: !7, line: 33, type: !10)
!61 = !DILocation(line: 33, column: 23, scope: !57)
!62 = !DILocation(line: 34, column: 16, scope: !57)
!63 = !DILocation(line: 34, column: 11, scope: !57)
!64 = !DILocation(line: 34, column: 6, scope: !57)
!65 = !DILocation(line: 34, column: 8, scope: !57)
!66 = !DILocation(line: 35, column: 16, scope: !57)
!67 = !DILocation(line: 35, column: 11, scope: !57)
!68 = !DILocation(line: 35, column: 6, scope: !57)
!69 = !DILocation(line: 35, column: 8, scope: !57)
!70 = !DILocation(line: 36, column: 21, scope: !57)
!71 = !DILocation(line: 36, column: 16, scope: !57)
!72 = !DILocation(line: 36, column: 6, scope: !57)
!73 = !DILocation(line: 36, column: 13, scope: !57)
!74 = !DILocation(line: 37, column: 9, scope: !57)
!75 = !DILocation(line: 37, column: 2, scope: !57)
!76 = !DILocation(line: 37, column: 2, scope: !77)
!77 = !DILexicalBlockFile(scope: !57, file: !7, discriminator: 1)
!78 = distinct !DISubprogram(name: "uninit_var_014_good", scope: !7, file: !7, line: 40, type: !39, isLocal: false, isDefinition: true, scopeLine: 41, isOptimized: false, unit: !0, variables: !2)
!79 = !DILocalVariable(name: "s", scope: !78, file: !7, line: 42, type: !10)
!80 = !DILocation(line: 42, column: 23, scope: !78)
!81 = !DILocalVariable(name: "r", scope: !78, file: !7, line: 42, type: !10)
!82 = !DILocation(line: 42, column: 25, scope: !78)
!83 = !DILocation(line: 43, column: 4, scope: !78)
!84 = !DILocation(line: 43, column: 6, scope: !78)
!85 = !DILocation(line: 44, column: 4, scope: !78)
!86 = !DILocation(line: 44, column: 6, scope: !78)
!87 = !DILocation(line: 45, column: 4, scope: !78)
!88 = !DILocation(line: 45, column: 11, scope: !78)
!89 = !DILocation(line: 46, column: 6, scope: !78)
!90 = !DILocation(line: 46, column: 6, scope: !91)
!91 = !DILexicalBlockFile(scope: !78, file: !7, discriminator: 1)
!92 = !DILocation(line: 46, column: 6, scope: !93)
!93 = !DILexicalBlockFile(scope: !78, file: !7, discriminator: 2)
!94 = !DILocation(line: 46, column: 6, scope: !95)
!95 = !DILexicalBlockFile(scope: !78, file: !7, discriminator: 3)
!96 = !DILocation(line: 47, column: 11, scope: !78)
!97 = !DILocation(line: 47, column: 13, scope: !78)
!98 = !DILocation(line: 49, column: 1, scope: !78)
!99 = distinct !DISubprogram(name: "main", scope: !7, file: !7, line: 51, type: !100, isLocal: false, isDefinition: true, scopeLine: 51, isOptimized: false, unit: !0, variables: !2)
!100 = !DISubroutineType(types: !101)
!101 = !{!14}
!102 = !DILocation(line: 52, column: 2, scope: !99)
!103 = !DILocation(line: 53, column: 2, scope: !99)
!104 = !DILocation(line: 54, column: 2, scope: !99)
