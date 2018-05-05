; ModuleID = './457_uninit_memory_access_4.c'
source_filename = "./457_uninit_memory_access_4.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@uninit_memory_access_005_bad.arr = private unnamed_addr constant [2 x [2 x i32]] [[2 x i32] [i32 11, i32 12], [2 x i32] [i32 21, i32 22]], align 16
@uninit_memory_access_005_good.arr = private unnamed_addr constant [2 x [2 x i32]] [[2 x i32] [i32 11, i32 12], [2 x i32] [i32 21, i32 22]], align 16

; Function Attrs: nounwind uwtable
define void @uninit_memory_access_005_bad() #0 !dbg !6 {
entry:
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  %arr = alloca [2 x [2 x i32]], align 16
  %arr1 = alloca [2 x [2 x i32]], align 16
  call void @llvm.dbg.declare(metadata i32* %i, metadata !10, metadata !12), !dbg !13
  call void @llvm.dbg.declare(metadata i32* %j, metadata !14, metadata !12), !dbg !15
  call void @llvm.dbg.declare(metadata i32* %k, metadata !16, metadata !12), !dbg !17
  call void @llvm.dbg.declare(metadata [2 x [2 x i32]]* %arr, metadata !18, metadata !12), !dbg !22
  %0 = bitcast [2 x [2 x i32]]* %arr to i8*, !dbg !22
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %0, i8* bitcast ([2 x [2 x i32]]* @uninit_memory_access_005_bad.arr to i8*), i64 16, i32 16, i1 false), !dbg !22
  call void @llvm.dbg.declare(metadata [2 x [2 x i32]]* %arr1, metadata !23, metadata !12), !dbg !24
  store i32 0, i32* %i, align 4, !dbg !25
  br label %for.cond, !dbg !27

for.cond:                                         ; preds = %for.inc10, %entry
  %1 = load i32, i32* %i, align 4, !dbg !28
  %cmp = icmp slt i32 %1, 1, !dbg !31
  br i1 %cmp, label %for.body, label %for.end12, !dbg !32

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4, !dbg !33
  br label %for.cond1, !dbg !36

for.cond1:                                        ; preds = %for.inc, %for.body
  %2 = load i32, i32* %j, align 4, !dbg !37
  %cmp2 = icmp slt i32 %2, 1, !dbg !40
  br i1 %cmp2, label %for.body3, label %for.end, !dbg !41

for.body3:                                        ; preds = %for.cond1
  %3 = load i32, i32* %j, align 4, !dbg !42
  %idxprom = sext i32 %3 to i64, !dbg !44
  %4 = load i32, i32* %i, align 4, !dbg !45
  %idxprom4 = sext i32 %4 to i64, !dbg !44
  %arrayidx = getelementptr inbounds [2 x [2 x i32]], [2 x [2 x i32]]* %arr, i64 0, i64 %idxprom4, !dbg !44
  %arrayidx5 = getelementptr inbounds [2 x i32], [2 x i32]* %arrayidx, i64 0, i64 %idxprom, !dbg !44
  %5 = load i32, i32* %arrayidx5, align 4, !dbg !44
  %6 = load i32, i32* %j, align 4, !dbg !46
  %idxprom6 = sext i32 %6 to i64, !dbg !47
  %7 = load i32, i32* %i, align 4, !dbg !48
  %idxprom7 = sext i32 %7 to i64, !dbg !47
  %arrayidx8 = getelementptr inbounds [2 x [2 x i32]], [2 x [2 x i32]]* %arr1, i64 0, i64 %idxprom7, !dbg !47
  %arrayidx9 = getelementptr inbounds [2 x i32], [2 x i32]* %arrayidx8, i64 0, i64 %idxprom6, !dbg !47
  store i32 %5, i32* %arrayidx9, align 4, !dbg !49
  br label %for.inc, !dbg !50

for.inc:                                          ; preds = %for.body3
  %8 = load i32, i32* %j, align 4, !dbg !51
  %inc = add nsw i32 %8, 1, !dbg !51
  store i32 %inc, i32* %j, align 4, !dbg !51
  br label %for.cond1, !dbg !53, !llvm.loop !54

for.end:                                          ; preds = %for.cond1
  br label %for.inc10, !dbg !56

for.inc10:                                        ; preds = %for.end
  %9 = load i32, i32* %i, align 4, !dbg !57
  %inc11 = add nsw i32 %9, 1, !dbg !57
  store i32 %inc11, i32* %i, align 4, !dbg !57
  br label %for.cond, !dbg !59, !llvm.loop !60

for.end12:                                        ; preds = %for.cond
  %arrayidx13 = getelementptr inbounds [2 x [2 x i32]], [2 x [2 x i32]]* %arr1, i64 0, i64 1, !dbg !62
  %arrayidx14 = getelementptr inbounds [2 x i32], [2 x i32]* %arrayidx13, i64 0, i64 1, !dbg !62
  %10 = load i32, i32* %arrayidx14, align 4, !dbg !62
  store i32 %10, i32* %k, align 4, !dbg !63
  ret void, !dbg !64
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i32, i1) #2

; Function Attrs: nounwind uwtable
define void @uninit_memory_access_005_good() #0 !dbg !65 {
entry:
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  %arr = alloca [2 x [2 x i32]], align 16
  %arr1 = alloca [2 x [2 x i32]], align 16
  call void @llvm.dbg.declare(metadata i32* %i, metadata !66, metadata !12), !dbg !67
  call void @llvm.dbg.declare(metadata i32* %j, metadata !68, metadata !12), !dbg !69
  call void @llvm.dbg.declare(metadata i32* %k, metadata !70, metadata !12), !dbg !71
  call void @llvm.dbg.declare(metadata [2 x [2 x i32]]* %arr, metadata !72, metadata !12), !dbg !73
  %0 = bitcast [2 x [2 x i32]]* %arr to i8*, !dbg !73
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %0, i8* bitcast ([2 x [2 x i32]]* @uninit_memory_access_005_good.arr to i8*), i64 16, i32 16, i1 false), !dbg !73
  call void @llvm.dbg.declare(metadata [2 x [2 x i32]]* %arr1, metadata !74, metadata !12), !dbg !75
  store i32 0, i32* %i, align 4, !dbg !76
  br label %for.cond, !dbg !78

for.cond:                                         ; preds = %for.inc10, %entry
  %1 = load i32, i32* %i, align 4, !dbg !79
  %cmp = icmp slt i32 %1, 2, !dbg !82
  br i1 %cmp, label %for.body, label %for.end12, !dbg !83

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4, !dbg !84
  br label %for.cond1, !dbg !87

for.cond1:                                        ; preds = %for.inc, %for.body
  %2 = load i32, i32* %j, align 4, !dbg !88
  %cmp2 = icmp slt i32 %2, 2, !dbg !91
  br i1 %cmp2, label %for.body3, label %for.end, !dbg !92

for.body3:                                        ; preds = %for.cond1
  %3 = load i32, i32* %j, align 4, !dbg !93
  %idxprom = sext i32 %3 to i64, !dbg !95
  %4 = load i32, i32* %i, align 4, !dbg !96
  %idxprom4 = sext i32 %4 to i64, !dbg !95
  %arrayidx = getelementptr inbounds [2 x [2 x i32]], [2 x [2 x i32]]* %arr, i64 0, i64 %idxprom4, !dbg !95
  %arrayidx5 = getelementptr inbounds [2 x i32], [2 x i32]* %arrayidx, i64 0, i64 %idxprom, !dbg !95
  %5 = load i32, i32* %arrayidx5, align 4, !dbg !95
  %6 = load i32, i32* %j, align 4, !dbg !97
  %idxprom6 = sext i32 %6 to i64, !dbg !98
  %7 = load i32, i32* %i, align 4, !dbg !99
  %idxprom7 = sext i32 %7 to i64, !dbg !98
  %arrayidx8 = getelementptr inbounds [2 x [2 x i32]], [2 x [2 x i32]]* %arr1, i64 0, i64 %idxprom7, !dbg !98
  %arrayidx9 = getelementptr inbounds [2 x i32], [2 x i32]* %arrayidx8, i64 0, i64 %idxprom6, !dbg !98
  store i32 %5, i32* %arrayidx9, align 4, !dbg !100
  br label %for.inc, !dbg !101

for.inc:                                          ; preds = %for.body3
  %8 = load i32, i32* %j, align 4, !dbg !102
  %inc = add nsw i32 %8, 1, !dbg !102
  store i32 %inc, i32* %j, align 4, !dbg !102
  br label %for.cond1, !dbg !104, !llvm.loop !105

for.end:                                          ; preds = %for.cond1
  br label %for.inc10, !dbg !107

for.inc10:                                        ; preds = %for.end
  %9 = load i32, i32* %i, align 4, !dbg !108
  %inc11 = add nsw i32 %9, 1, !dbg !108
  store i32 %inc11, i32* %i, align 4, !dbg !108
  br label %for.cond, !dbg !110, !llvm.loop !111

for.end12:                                        ; preds = %for.cond
  %arrayidx13 = getelementptr inbounds [2 x [2 x i32]], [2 x [2 x i32]]* %arr1, i64 0, i64 1, !dbg !113
  %arrayidx14 = getelementptr inbounds [2 x i32], [2 x i32]* %arrayidx13, i64 0, i64 1, !dbg !113
  %10 = load i32, i32* %arrayidx14, align 4, !dbg !113
  store i32 %10, i32* %k, align 4, !dbg !114
  ret void, !dbg !115
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !116 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @uninit_memory_access_005_good(), !dbg !119
  call void @uninit_memory_access_005_bad(), !dbg !120
  ret i32 0, !dbg !121
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { argmemonly nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4}
!llvm.ident = !{!5}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (tags/RELEASE_390/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2)
!1 = !DIFile(filename: "457_uninit_memory_access_4.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/itc/457")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{!"clang version 3.9.0 (tags/RELEASE_390/final)"}
!6 = distinct !DISubprogram(name: "uninit_memory_access_005_bad", scope: !7, file: !7, line: 7, type: !8, isLocal: false, isDefinition: true, scopeLine: 8, isOptimized: false, unit: !0, variables: !2)
!7 = !DIFile(filename: "./457_uninit_memory_access_4.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/itc/457")
!8 = !DISubroutineType(types: !9)
!9 = !{null}
!10 = !DILocalVariable(name: "i", scope: !6, file: !7, line: 9, type: !11)
!11 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!12 = !DIExpression()
!13 = !DILocation(line: 9, column: 9, scope: !6)
!14 = !DILocalVariable(name: "j", scope: !6, file: !7, line: 9, type: !11)
!15 = !DILocation(line: 9, column: 11, scope: !6)
!16 = !DILocalVariable(name: "k", scope: !6, file: !7, line: 9, type: !11)
!17 = !DILocation(line: 9, column: 13, scope: !6)
!18 = !DILocalVariable(name: "arr", scope: !6, file: !7, line: 10, type: !19)
!19 = !DICompositeType(tag: DW_TAG_array_type, baseType: !11, size: 128, align: 32, elements: !20)
!20 = !{!21, !21}
!21 = !DISubrange(count: 2)
!22 = !DILocation(line: 10, column: 6, scope: !6)
!23 = !DILocalVariable(name: "arr1", scope: !6, file: !7, line: 13, type: !19)
!24 = !DILocation(line: 13, column: 9, scope: !6)
!25 = !DILocation(line: 14, column: 7, scope: !26)
!26 = distinct !DILexicalBlock(scope: !6, file: !7, line: 14, column: 2)
!27 = !DILocation(line: 14, column: 6, scope: !26)
!28 = !DILocation(line: 14, column: 10, scope: !29)
!29 = !DILexicalBlockFile(scope: !30, file: !7, discriminator: 1)
!30 = distinct !DILexicalBlock(scope: !26, file: !7, line: 14, column: 2)
!31 = !DILocation(line: 14, column: 11, scope: !29)
!32 = !DILocation(line: 14, column: 2, scope: !29)
!33 = !DILocation(line: 16, column: 9, scope: !34)
!34 = distinct !DILexicalBlock(scope: !35, file: !7, line: 16, column: 4)
!35 = distinct !DILexicalBlock(scope: !30, file: !7, line: 15, column: 3)
!36 = !DILocation(line: 16, column: 8, scope: !34)
!37 = !DILocation(line: 16, column: 12, scope: !38)
!38 = !DILexicalBlockFile(scope: !39, file: !7, discriminator: 1)
!39 = distinct !DILexicalBlock(scope: !34, file: !7, line: 16, column: 4)
!40 = !DILocation(line: 16, column: 13, scope: !38)
!41 = !DILocation(line: 16, column: 4, scope: !38)
!42 = !DILocation(line: 19, column: 41, scope: !43)
!43 = distinct !DILexicalBlock(scope: !39, file: !7, line: 17, column: 4)
!44 = !DILocation(line: 19, column: 34, scope: !43)
!45 = !DILocation(line: 19, column: 38, scope: !43)
!46 = !DILocation(line: 19, column: 29, scope: !43)
!47 = !DILocation(line: 19, column: 21, scope: !43)
!48 = !DILocation(line: 19, column: 26, scope: !43)
!49 = !DILocation(line: 19, column: 32, scope: !43)
!50 = !DILocation(line: 21, column: 4, scope: !43)
!51 = !DILocation(line: 16, column: 17, scope: !52)
!52 = !DILexicalBlockFile(scope: !39, file: !7, discriminator: 2)
!53 = !DILocation(line: 16, column: 4, scope: !52)
!54 = distinct !{!54, !55}
!55 = !DILocation(line: 16, column: 4, scope: !35)
!56 = !DILocation(line: 22, column: 3, scope: !35)
!57 = !DILocation(line: 14, column: 15, scope: !58)
!58 = !DILexicalBlockFile(scope: !30, file: !7, discriminator: 2)
!59 = !DILocation(line: 14, column: 2, scope: !58)
!60 = distinct !{!60, !61}
!61 = !DILocation(line: 14, column: 2, scope: !6)
!62 = !DILocation(line: 23, column: 6, scope: !6)
!63 = !DILocation(line: 23, column: 4, scope: !6)
!64 = !DILocation(line: 24, column: 1, scope: !6)
!65 = distinct !DISubprogram(name: "uninit_memory_access_005_good", scope: !7, file: !7, line: 30, type: !8, isLocal: false, isDefinition: true, scopeLine: 31, isOptimized: false, unit: !0, variables: !2)
!66 = !DILocalVariable(name: "i", scope: !65, file: !7, line: 32, type: !11)
!67 = !DILocation(line: 32, column: 9, scope: !65)
!68 = !DILocalVariable(name: "j", scope: !65, file: !7, line: 32, type: !11)
!69 = !DILocation(line: 32, column: 11, scope: !65)
!70 = !DILocalVariable(name: "k", scope: !65, file: !7, line: 32, type: !11)
!71 = !DILocation(line: 32, column: 13, scope: !65)
!72 = !DILocalVariable(name: "arr", scope: !65, file: !7, line: 33, type: !19)
!73 = !DILocation(line: 33, column: 6, scope: !65)
!74 = !DILocalVariable(name: "arr1", scope: !65, file: !7, line: 36, type: !19)
!75 = !DILocation(line: 36, column: 6, scope: !65)
!76 = !DILocation(line: 37, column: 7, scope: !77)
!77 = distinct !DILexicalBlock(scope: !65, file: !7, line: 37, column: 2)
!78 = !DILocation(line: 37, column: 6, scope: !77)
!79 = !DILocation(line: 37, column: 10, scope: !80)
!80 = !DILexicalBlockFile(scope: !81, file: !7, discriminator: 1)
!81 = distinct !DILexicalBlock(scope: !77, file: !7, line: 37, column: 2)
!82 = !DILocation(line: 37, column: 11, scope: !80)
!83 = !DILocation(line: 37, column: 2, scope: !80)
!84 = !DILocation(line: 39, column: 9, scope: !85)
!85 = distinct !DILexicalBlock(scope: !86, file: !7, line: 39, column: 4)
!86 = distinct !DILexicalBlock(scope: !81, file: !7, line: 38, column: 3)
!87 = !DILocation(line: 39, column: 8, scope: !85)
!88 = !DILocation(line: 39, column: 12, scope: !89)
!89 = !DILexicalBlockFile(scope: !90, file: !7, discriminator: 1)
!90 = distinct !DILexicalBlock(scope: !85, file: !7, line: 39, column: 4)
!91 = !DILocation(line: 39, column: 13, scope: !89)
!92 = !DILocation(line: 39, column: 4, scope: !89)
!93 = !DILocation(line: 41, column: 29, scope: !94)
!94 = distinct !DILexicalBlock(scope: !90, file: !7, line: 40, column: 4)
!95 = !DILocation(line: 41, column: 22, scope: !94)
!96 = !DILocation(line: 41, column: 26, scope: !94)
!97 = !DILocation(line: 41, column: 17, scope: !94)
!98 = !DILocation(line: 41, column: 9, scope: !94)
!99 = !DILocation(line: 41, column: 14, scope: !94)
!100 = !DILocation(line: 41, column: 20, scope: !94)
!101 = !DILocation(line: 43, column: 4, scope: !94)
!102 = !DILocation(line: 39, column: 17, scope: !103)
!103 = !DILexicalBlockFile(scope: !90, file: !7, discriminator: 2)
!104 = !DILocation(line: 39, column: 4, scope: !103)
!105 = distinct !{!105, !106}
!106 = !DILocation(line: 39, column: 4, scope: !86)
!107 = !DILocation(line: 44, column: 3, scope: !86)
!108 = !DILocation(line: 37, column: 15, scope: !109)
!109 = !DILexicalBlockFile(scope: !81, file: !7, discriminator: 2)
!110 = !DILocation(line: 37, column: 2, scope: !109)
!111 = distinct !{!111, !112}
!112 = !DILocation(line: 37, column: 2, scope: !65)
!113 = !DILocation(line: 45, column: 6, scope: !65)
!114 = !DILocation(line: 45, column: 4, scope: !65)
!115 = !DILocation(line: 46, column: 1, scope: !65)
!116 = distinct !DISubprogram(name: "main", scope: !7, file: !7, line: 48, type: !117, isLocal: false, isDefinition: true, scopeLine: 48, isOptimized: false, unit: !0, variables: !2)
!117 = !DISubroutineType(types: !118)
!118 = !{!11}
!119 = !DILocation(line: 49, column: 3, scope: !116)
!120 = !DILocation(line: 50, column: 2, scope: !116)
!121 = !DILocation(line: 51, column: 2, scope: !116)
