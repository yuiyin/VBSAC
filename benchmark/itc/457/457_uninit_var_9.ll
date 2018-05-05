; ModuleID = './457_uninit_var_9.c'
source_filename = "./457_uninit_var_9.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@uninit_var_010_func_001_good.ret = private unnamed_addr constant [2 x [6 x i32]] [[6 x i32] [i32 1, i32 2, i32 3, i32 4, i32 5, i32 6], [6 x i32] [i32 11, i32 12, i32 13, i32 14, i32 15, i32 16]], align 16

; Function Attrs: nounwind uwtable
define void @uninit_var_010_func_001_bad([6 x i32]* %buf) #0 !dbg !6 {
entry:
  %buf.addr = alloca [6 x i32]*, align 8
  %ret = alloca [2 x [6 x i32]], align 16
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store [6 x i32]* %buf, [6 x i32]** %buf.addr, align 8
  call void @llvm.dbg.declare(metadata [6 x i32]** %buf.addr, metadata !15, metadata !16), !dbg !17
  call void @llvm.dbg.declare(metadata [2 x [6 x i32]]* %ret, metadata !18, metadata !16), !dbg !22
  call void @llvm.dbg.declare(metadata i32* %i, metadata !23, metadata !16), !dbg !24
  call void @llvm.dbg.declare(metadata i32* %j, metadata !25, metadata !16), !dbg !26
  store i32 0, i32* %i, align 4, !dbg !27
  br label %for.cond, !dbg !29

for.cond:                                         ; preds = %for.inc10, %entry
  %0 = load i32, i32* %i, align 4, !dbg !30
  %cmp = icmp slt i32 %0, 2, !dbg !33
  br i1 %cmp, label %for.body, label %for.end12, !dbg !34

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4, !dbg !35
  br label %for.cond1, !dbg !37

for.cond1:                                        ; preds = %for.inc, %for.body
  %1 = load i32, i32* %j, align 4, !dbg !38
  %cmp2 = icmp slt i32 %1, 6, !dbg !41
  br i1 %cmp2, label %for.body3, label %for.end, !dbg !42

for.body3:                                        ; preds = %for.cond1
  %2 = load i32, i32* %j, align 4, !dbg !43
  %idxprom = sext i32 %2 to i64, !dbg !44
  %3 = load i32, i32* %i, align 4, !dbg !45
  %idxprom4 = sext i32 %3 to i64, !dbg !44
  %arrayidx = getelementptr inbounds [2 x [6 x i32]], [2 x [6 x i32]]* %ret, i64 0, i64 %idxprom4, !dbg !44
  %arrayidx5 = getelementptr inbounds [6 x i32], [6 x i32]* %arrayidx, i64 0, i64 %idxprom, !dbg !44
  %4 = load i32, i32* %arrayidx5, align 4, !dbg !44
  %5 = load i32, i32* %j, align 4, !dbg !46
  %idxprom6 = sext i32 %5 to i64, !dbg !47
  %6 = load i32, i32* %i, align 4, !dbg !48
  %idxprom7 = sext i32 %6 to i64, !dbg !47
  %7 = load [6 x i32]*, [6 x i32]** %buf.addr, align 8, !dbg !47
  %arrayidx8 = getelementptr inbounds [6 x i32], [6 x i32]* %7, i64 %idxprom7, !dbg !47
  %arrayidx9 = getelementptr inbounds [6 x i32], [6 x i32]* %arrayidx8, i64 0, i64 %idxprom6, !dbg !47
  store i32 %4, i32* %arrayidx9, align 4, !dbg !49
  br label %for.inc, !dbg !47

for.inc:                                          ; preds = %for.body3
  %8 = load i32, i32* %j, align 4, !dbg !50
  %inc = add nsw i32 %8, 1, !dbg !50
  store i32 %inc, i32* %j, align 4, !dbg !50
  br label %for.cond1, !dbg !52, !llvm.loop !53

for.end:                                          ; preds = %for.cond1
  br label %for.inc10, !dbg !55

for.inc10:                                        ; preds = %for.end
  %9 = load i32, i32* %i, align 4, !dbg !57
  %inc11 = add nsw i32 %9, 1, !dbg !57
  store i32 %inc11, i32* %i, align 4, !dbg !57
  br label %for.cond, !dbg !59, !llvm.loop !60

for.end12:                                        ; preds = %for.cond
  ret void, !dbg !62
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind uwtable
define void @uninit_var_010_bad() #0 !dbg !64 {
entry:
  %buf = alloca [2 x [6 x i32]], align 16
  call void @llvm.dbg.declare(metadata [2 x [6 x i32]]* %buf, metadata !67, metadata !16), !dbg !68
  %arraydecay = getelementptr inbounds [2 x [6 x i32]], [2 x [6 x i32]]* %buf, i32 0, i32 0, !dbg !69
  call void @uninit_var_010_func_001_bad([6 x i32]* %arraydecay), !dbg !70
  ret void, !dbg !71
}

; Function Attrs: nounwind uwtable
define void @uninit_var_010_func_001_good([6 x i32]* %buf) #0 !dbg !72 {
entry:
  %buf.addr = alloca [6 x i32]*, align 8
  %ret = alloca [2 x [6 x i32]], align 16
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store [6 x i32]* %buf, [6 x i32]** %buf.addr, align 8
  call void @llvm.dbg.declare(metadata [6 x i32]** %buf.addr, metadata !73, metadata !16), !dbg !74
  call void @llvm.dbg.declare(metadata [2 x [6 x i32]]* %ret, metadata !75, metadata !16), !dbg !76
  %0 = bitcast [2 x [6 x i32]]* %ret to i8*, !dbg !76
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %0, i8* bitcast ([2 x [6 x i32]]* @uninit_var_010_func_001_good.ret to i8*), i64 48, i32 16, i1 false), !dbg !76
  call void @llvm.dbg.declare(metadata i32* %i, metadata !77, metadata !16), !dbg !78
  call void @llvm.dbg.declare(metadata i32* %j, metadata !79, metadata !16), !dbg !80
  store i32 0, i32* %i, align 4, !dbg !81
  br label %for.cond, !dbg !83

for.cond:                                         ; preds = %for.inc10, %entry
  %1 = load i32, i32* %i, align 4, !dbg !84
  %cmp = icmp slt i32 %1, 2, !dbg !87
  br i1 %cmp, label %for.body, label %for.end12, !dbg !88

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4, !dbg !89
  br label %for.cond1, !dbg !91

for.cond1:                                        ; preds = %for.inc, %for.body
  %2 = load i32, i32* %j, align 4, !dbg !92
  %cmp2 = icmp slt i32 %2, 6, !dbg !95
  br i1 %cmp2, label %for.body3, label %for.end, !dbg !96

for.body3:                                        ; preds = %for.cond1
  %3 = load i32, i32* %j, align 4, !dbg !97
  %idxprom = sext i32 %3 to i64, !dbg !98
  %4 = load i32, i32* %i, align 4, !dbg !99
  %idxprom4 = sext i32 %4 to i64, !dbg !98
  %arrayidx = getelementptr inbounds [2 x [6 x i32]], [2 x [6 x i32]]* %ret, i64 0, i64 %idxprom4, !dbg !98
  %arrayidx5 = getelementptr inbounds [6 x i32], [6 x i32]* %arrayidx, i64 0, i64 %idxprom, !dbg !98
  %5 = load i32, i32* %arrayidx5, align 4, !dbg !98
  %6 = load i32, i32* %j, align 4, !dbg !100
  %idxprom6 = sext i32 %6 to i64, !dbg !101
  %7 = load i32, i32* %i, align 4, !dbg !102
  %idxprom7 = sext i32 %7 to i64, !dbg !101
  %8 = load [6 x i32]*, [6 x i32]** %buf.addr, align 8, !dbg !101
  %arrayidx8 = getelementptr inbounds [6 x i32], [6 x i32]* %8, i64 %idxprom7, !dbg !101
  %arrayidx9 = getelementptr inbounds [6 x i32], [6 x i32]* %arrayidx8, i64 0, i64 %idxprom6, !dbg !101
  store i32 %5, i32* %arrayidx9, align 4, !dbg !103
  br label %for.inc, !dbg !101

for.inc:                                          ; preds = %for.body3
  %9 = load i32, i32* %j, align 4, !dbg !104
  %inc = add nsw i32 %9, 1, !dbg !104
  store i32 %inc, i32* %j, align 4, !dbg !104
  br label %for.cond1, !dbg !106, !llvm.loop !107

for.end:                                          ; preds = %for.cond1
  br label %for.inc10, !dbg !109

for.inc10:                                        ; preds = %for.end
  %10 = load i32, i32* %i, align 4, !dbg !111
  %inc11 = add nsw i32 %10, 1, !dbg !111
  store i32 %inc11, i32* %i, align 4, !dbg !111
  br label %for.cond, !dbg !113, !llvm.loop !114

for.end12:                                        ; preds = %for.cond
  ret void, !dbg !116
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i32, i1) #2

; Function Attrs: nounwind uwtable
define void @uninit_var_010_good() #0 !dbg !117 {
entry:
  %buf = alloca [2 x [6 x i32]], align 16
  call void @llvm.dbg.declare(metadata [2 x [6 x i32]]* %buf, metadata !118, metadata !16), !dbg !119
  %arraydecay = getelementptr inbounds [2 x [6 x i32]], [2 x [6 x i32]]* %buf, i32 0, i32 0, !dbg !120
  call void @uninit_var_010_func_001_good([6 x i32]* %arraydecay), !dbg !121
  ret void, !dbg !122
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !123 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @uninit_var_010_good(), !dbg !126
  call void @uninit_var_010_bad(), !dbg !127
  ret i32 0, !dbg !128
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { argmemonly nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4}
!llvm.ident = !{!5}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (tags/RELEASE_390/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2)
!1 = !DIFile(filename: "457_uninit_var_9.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/itc/457")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{!"clang version 3.9.0 (tags/RELEASE_390/final)"}
!6 = distinct !DISubprogram(name: "uninit_var_010_func_001_bad", scope: !7, file: !7, line: 7, type: !8, isLocal: false, isDefinition: true, scopeLine: 7, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!7 = !DIFile(filename: "./457_uninit_var_9.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/itc/457")
!8 = !DISubroutineType(types: !9)
!9 = !{null, !10}
!10 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !11, size: 64, align: 64)
!11 = !DICompositeType(tag: DW_TAG_array_type, baseType: !12, size: 192, align: 32, elements: !13)
!12 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!13 = !{!14}
!14 = !DISubrange(count: 6)
!15 = !DILocalVariable(name: "buf", arg: 1, scope: !6, file: !7, line: 7, type: !10)
!16 = !DIExpression()
!17 = !DILocation(line: 7, column: 38, scope: !6)
!18 = !DILocalVariable(name: "ret", scope: !6, file: !7, line: 8, type: !19)
!19 = !DICompositeType(tag: DW_TAG_array_type, baseType: !12, size: 384, align: 32, elements: !20)
!20 = !{!21, !14}
!21 = !DISubrange(count: 2)
!22 = !DILocation(line: 8, column: 6, scope: !6)
!23 = !DILocalVariable(name: "i", scope: !6, file: !7, line: 9, type: !12)
!24 = !DILocation(line: 9, column: 6, scope: !6)
!25 = !DILocalVariable(name: "j", scope: !6, file: !7, line: 9, type: !12)
!26 = !DILocation(line: 9, column: 8, scope: !6)
!27 = !DILocation(line: 10, column: 8, scope: !28)
!28 = distinct !DILexicalBlock(scope: !6, file: !7, line: 10, column: 2)
!29 = !DILocation(line: 10, column: 7, scope: !28)
!30 = !DILocation(line: 10, column: 11, scope: !31)
!31 = !DILexicalBlockFile(scope: !32, file: !7, discriminator: 1)
!32 = distinct !DILexicalBlock(scope: !28, file: !7, line: 10, column: 2)
!33 = !DILocation(line: 10, column: 12, scope: !31)
!34 = !DILocation(line: 10, column: 2, scope: !31)
!35 = !DILocation(line: 11, column: 9, scope: !36)
!36 = distinct !DILexicalBlock(scope: !32, file: !7, line: 11, column: 3)
!37 = !DILocation(line: 11, column: 8, scope: !36)
!38 = !DILocation(line: 11, column: 12, scope: !39)
!39 = !DILexicalBlockFile(scope: !40, file: !7, discriminator: 1)
!40 = distinct !DILexicalBlock(scope: !36, file: !7, line: 11, column: 3)
!41 = !DILocation(line: 11, column: 13, scope: !39)
!42 = !DILocation(line: 11, column: 3, scope: !39)
!43 = !DILocation(line: 12, column: 23, scope: !40)
!44 = !DILocation(line: 12, column: 16, scope: !40)
!45 = !DILocation(line: 12, column: 20, scope: !40)
!46 = !DILocation(line: 12, column: 11, scope: !40)
!47 = !DILocation(line: 12, column: 4, scope: !40)
!48 = !DILocation(line: 12, column: 8, scope: !40)
!49 = !DILocation(line: 12, column: 14, scope: !40)
!50 = !DILocation(line: 11, column: 17, scope: !51)
!51 = !DILexicalBlockFile(scope: !40, file: !7, discriminator: 2)
!52 = !DILocation(line: 11, column: 3, scope: !51)
!53 = distinct !{!53, !54}
!54 = !DILocation(line: 11, column: 3, scope: !32)
!55 = !DILocation(line: 12, column: 24, scope: !56)
!56 = !DILexicalBlockFile(scope: !36, file: !7, discriminator: 1)
!57 = !DILocation(line: 10, column: 16, scope: !58)
!58 = !DILexicalBlockFile(scope: !32, file: !7, discriminator: 2)
!59 = !DILocation(line: 10, column: 2, scope: !58)
!60 = distinct !{!60, !61}
!61 = !DILocation(line: 10, column: 2, scope: !6)
!62 = !DILocation(line: 12, column: 26, scope: !63)
!63 = !DILexicalBlockFile(scope: !6, file: !7, discriminator: 2)
!64 = distinct !DISubprogram(name: "uninit_var_010_bad", scope: !7, file: !7, line: 14, type: !65, isLocal: false, isDefinition: true, scopeLine: 14, isOptimized: false, unit: !0, variables: !2)
!65 = !DISubroutineType(types: !66)
!66 = !{null}
!67 = !DILocalVariable(name: "buf", scope: !64, file: !7, line: 15, type: !19)
!68 = !DILocation(line: 15, column: 6, scope: !64)
!69 = !DILocation(line: 16, column: 30, scope: !64)
!70 = !DILocation(line: 16, column: 2, scope: !64)
!71 = !DILocation(line: 17, column: 1, scope: !64)
!72 = distinct !DISubprogram(name: "uninit_var_010_func_001_good", scope: !7, file: !7, line: 23, type: !8, isLocal: false, isDefinition: true, scopeLine: 24, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!73 = !DILocalVariable(name: "buf", arg: 1, scope: !72, file: !7, line: 23, type: !10)
!74 = !DILocation(line: 23, column: 39, scope: !72)
!75 = !DILocalVariable(name: "ret", scope: !72, file: !7, line: 25, type: !19)
!76 = !DILocation(line: 25, column: 6, scope: !72)
!77 = !DILocalVariable(name: "i", scope: !72, file: !7, line: 27, type: !12)
!78 = !DILocation(line: 27, column: 6, scope: !72)
!79 = !DILocalVariable(name: "j", scope: !72, file: !7, line: 27, type: !12)
!80 = !DILocation(line: 27, column: 8, scope: !72)
!81 = !DILocation(line: 28, column: 8, scope: !82)
!82 = distinct !DILexicalBlock(scope: !72, file: !7, line: 28, column: 2)
!83 = !DILocation(line: 28, column: 7, scope: !82)
!84 = !DILocation(line: 28, column: 11, scope: !85)
!85 = !DILexicalBlockFile(scope: !86, file: !7, discriminator: 1)
!86 = distinct !DILexicalBlock(scope: !82, file: !7, line: 28, column: 2)
!87 = !DILocation(line: 28, column: 12, scope: !85)
!88 = !DILocation(line: 28, column: 2, scope: !85)
!89 = !DILocation(line: 29, column: 9, scope: !90)
!90 = distinct !DILexicalBlock(scope: !86, file: !7, line: 29, column: 3)
!91 = !DILocation(line: 29, column: 8, scope: !90)
!92 = !DILocation(line: 29, column: 12, scope: !93)
!93 = !DILexicalBlockFile(scope: !94, file: !7, discriminator: 1)
!94 = distinct !DILexicalBlock(scope: !90, file: !7, line: 29, column: 3)
!95 = !DILocation(line: 29, column: 13, scope: !93)
!96 = !DILocation(line: 29, column: 3, scope: !93)
!97 = !DILocation(line: 30, column: 23, scope: !94)
!98 = !DILocation(line: 30, column: 16, scope: !94)
!99 = !DILocation(line: 30, column: 20, scope: !94)
!100 = !DILocation(line: 30, column: 11, scope: !94)
!101 = !DILocation(line: 30, column: 4, scope: !94)
!102 = !DILocation(line: 30, column: 8, scope: !94)
!103 = !DILocation(line: 30, column: 14, scope: !94)
!104 = !DILocation(line: 29, column: 17, scope: !105)
!105 = !DILexicalBlockFile(scope: !94, file: !7, discriminator: 2)
!106 = !DILocation(line: 29, column: 3, scope: !105)
!107 = distinct !{!107, !108}
!108 = !DILocation(line: 29, column: 3, scope: !86)
!109 = !DILocation(line: 30, column: 24, scope: !110)
!110 = !DILexicalBlockFile(scope: !90, file: !7, discriminator: 1)
!111 = !DILocation(line: 28, column: 16, scope: !112)
!112 = !DILexicalBlockFile(scope: !86, file: !7, discriminator: 2)
!113 = !DILocation(line: 28, column: 2, scope: !112)
!114 = distinct !{!114, !115}
!115 = !DILocation(line: 28, column: 2, scope: !72)
!116 = !DILocation(line: 31, column: 1, scope: !72)
!117 = distinct !DISubprogram(name: "uninit_var_010_good", scope: !7, file: !7, line: 33, type: !65, isLocal: false, isDefinition: true, scopeLine: 34, isOptimized: false, unit: !0, variables: !2)
!118 = !DILocalVariable(name: "buf", scope: !117, file: !7, line: 35, type: !19)
!119 = !DILocation(line: 35, column: 6, scope: !117)
!120 = !DILocation(line: 36, column: 31, scope: !117)
!121 = !DILocation(line: 36, column: 2, scope: !117)
!122 = !DILocation(line: 37, column: 1, scope: !117)
!123 = distinct !DISubprogram(name: "main", scope: !7, file: !7, line: 39, type: !124, isLocal: false, isDefinition: true, scopeLine: 39, isOptimized: false, unit: !0, variables: !2)
!124 = !DISubroutineType(types: !125)
!125 = !{!12}
!126 = !DILocation(line: 40, column: 2, scope: !123)
!127 = !DILocation(line: 41, column: 2, scope: !123)
!128 = !DILocation(line: 42, column: 2, scope: !123)
