; ModuleID = './457_uninit_memory_access_6.c'
source_filename = "./457_uninit_memory_access_6.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.uninit_memory_access_007_s_001 = type { [10 x i32], i32, i32, i32 }

; Function Attrs: nounwind uwtable
define void @uninit_memory_access_007_func_001_bad(%struct.uninit_memory_access_007_s_001* %st) #0 !dbg !6 {
entry:
  %st.addr = alloca %struct.uninit_memory_access_007_s_001*, align 8
  store %struct.uninit_memory_access_007_s_001* %st, %struct.uninit_memory_access_007_s_001** %st.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.uninit_memory_access_007_s_001** %st.addr, metadata !22, metadata !23), !dbg !24
  %0 = load %struct.uninit_memory_access_007_s_001*, %struct.uninit_memory_access_007_s_001** %st.addr, align 8, !dbg !25
  %arr = getelementptr inbounds %struct.uninit_memory_access_007_s_001, %struct.uninit_memory_access_007_s_001* %0, i32 0, i32 0, !dbg !26
  %arraydecay = getelementptr inbounds [10 x i32], [10 x i32]* %arr, i32 0, i32 0, !dbg !27
  %1 = bitcast i32* %arraydecay to i8*, !dbg !27
  call void @llvm.memset.p0i8.i64(i8* %1, i8 0, i64 1, i32 4, i1 false), !dbg !27
  %2 = load %struct.uninit_memory_access_007_s_001*, %struct.uninit_memory_access_007_s_001** %st.addr, align 8, !dbg !28
  %a = getelementptr inbounds %struct.uninit_memory_access_007_s_001, %struct.uninit_memory_access_007_s_001* %2, i32 0, i32 1, !dbg !29
  store i32 1, i32* %a, align 4, !dbg !30
  ret void, !dbg !31
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #2

; Function Attrs: nounwind uwtable
define void @uninit_memory_access_007_func_002_bad(%struct.uninit_memory_access_007_s_001* %st) #0 !dbg !32 {
entry:
  %st.addr = alloca %struct.uninit_memory_access_007_s_001*, align 8
  %temp = alloca i32, align 4
  %i = alloca i32, align 4
  store %struct.uninit_memory_access_007_s_001* %st, %struct.uninit_memory_access_007_s_001** %st.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.uninit_memory_access_007_s_001** %st.addr, metadata !33, metadata !23), !dbg !34
  call void @llvm.dbg.declare(metadata i32* %temp, metadata !35, metadata !23), !dbg !36
  store i32 0, i32* %temp, align 4, !dbg !36
  call void @llvm.dbg.declare(metadata i32* %i, metadata !37, metadata !23), !dbg !38
  store i32 0, i32* %i, align 4, !dbg !39
  br label %for.cond, !dbg !41

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !42
  %cmp = icmp slt i32 %0, 10, !dbg !45
  br i1 %cmp, label %for.body, label %for.end, !dbg !46

for.body:                                         ; preds = %for.cond
  %1 = load i32, i32* %i, align 4, !dbg !47
  %idxprom = sext i32 %1 to i64, !dbg !49
  %2 = load %struct.uninit_memory_access_007_s_001*, %struct.uninit_memory_access_007_s_001** %st.addr, align 8, !dbg !49
  %arr = getelementptr inbounds %struct.uninit_memory_access_007_s_001, %struct.uninit_memory_access_007_s_001* %2, i32 0, i32 0, !dbg !50
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %arr, i64 0, i64 %idxprom, !dbg !49
  %3 = load i32, i32* %arrayidx, align 4, !dbg !49
  %4 = load i32, i32* %temp, align 4, !dbg !51
  %add = add nsw i32 %4, %3, !dbg !51
  store i32 %add, i32* %temp, align 4, !dbg !51
  br label %for.inc, !dbg !52

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !53
  %inc = add nsw i32 %5, 1, !dbg !53
  store i32 %inc, i32* %i, align 4, !dbg !53
  br label %for.cond, !dbg !55, !llvm.loop !56

for.end:                                          ; preds = %for.cond
  ret void, !dbg !58
}

; Function Attrs: nounwind uwtable
define void @uninit_memory_access_007_func_003_bad(%struct.uninit_memory_access_007_s_001* %st) #0 !dbg !59 {
entry:
  %st.addr = alloca %struct.uninit_memory_access_007_s_001*, align 8
  store %struct.uninit_memory_access_007_s_001* %st, %struct.uninit_memory_access_007_s_001** %st.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.uninit_memory_access_007_s_001** %st.addr, metadata !60, metadata !23), !dbg !61
  %0 = load %struct.uninit_memory_access_007_s_001*, %struct.uninit_memory_access_007_s_001** %st.addr, align 8, !dbg !62
  %b = getelementptr inbounds %struct.uninit_memory_access_007_s_001, %struct.uninit_memory_access_007_s_001* %0, i32 0, i32 2, !dbg !63
  store i32 10, i32* %b, align 4, !dbg !64
  %1 = load %struct.uninit_memory_access_007_s_001*, %struct.uninit_memory_access_007_s_001** %st.addr, align 8, !dbg !65
  %c = getelementptr inbounds %struct.uninit_memory_access_007_s_001, %struct.uninit_memory_access_007_s_001* %1, i32 0, i32 3, !dbg !66
  store i32 20, i32* %c, align 4, !dbg !67
  ret void, !dbg !68
}

; Function Attrs: nounwind uwtable
define void @uninit_memory_access_007_func_004_bad(i32 %num) #0 !dbg !69 {
entry:
  %num.addr = alloca i32, align 4
  %temp = alloca i32, align 4
  store i32 %num, i32* %num.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %num.addr, metadata !72, metadata !23), !dbg !73
  call void @llvm.dbg.declare(metadata i32* %temp, metadata !74, metadata !23), !dbg !75
  %0 = load i32, i32* %num.addr, align 4, !dbg !76
  %cmp = icmp ne i32 %0, 0, !dbg !78
  br i1 %cmp, label %if.then, label %if.end, !dbg !79

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %num.addr, align 4, !dbg !80
  store i32 %1, i32* %temp, align 4, !dbg !82
  br label %if.end, !dbg !83

if.end:                                           ; preds = %if.then, %entry
  ret void, !dbg !84
}

; Function Attrs: nounwind uwtable
define void @uninit_memory_access_007_bad() #0 !dbg !85 {
entry:
  %st = alloca %struct.uninit_memory_access_007_s_001, align 4
  call void @llvm.dbg.declare(metadata %struct.uninit_memory_access_007_s_001* %st, metadata !88, metadata !23), !dbg !89
  call void @uninit_memory_access_007_func_001_bad(%struct.uninit_memory_access_007_s_001* %st), !dbg !90
  call void @uninit_memory_access_007_func_002_bad(%struct.uninit_memory_access_007_s_001* %st), !dbg !91
  call void @uninit_memory_access_007_func_003_bad(%struct.uninit_memory_access_007_s_001* %st), !dbg !92
  %a = getelementptr inbounds %struct.uninit_memory_access_007_s_001, %struct.uninit_memory_access_007_s_001* %st, i32 0, i32 1, !dbg !93
  %0 = load i32, i32* %a, align 4, !dbg !93
  call void @uninit_memory_access_007_func_004_bad(i32 %0), !dbg !94
  ret void, !dbg !95
}

; Function Attrs: nounwind uwtable
define void @uninit_memory_access_007_func_001_good(%struct.uninit_memory_access_007_s_001* %st) #0 !dbg !96 {
entry:
  %st.addr = alloca %struct.uninit_memory_access_007_s_001*, align 8
  store %struct.uninit_memory_access_007_s_001* %st, %struct.uninit_memory_access_007_s_001** %st.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.uninit_memory_access_007_s_001** %st.addr, metadata !97, metadata !23), !dbg !98
  %0 = load %struct.uninit_memory_access_007_s_001*, %struct.uninit_memory_access_007_s_001** %st.addr, align 8, !dbg !99
  %1 = bitcast %struct.uninit_memory_access_007_s_001* %0 to i8*, !dbg !100
  call void @llvm.memset.p0i8.i64(i8* %1, i8 0, i64 52, i32 4, i1 false), !dbg !100
  %2 = load %struct.uninit_memory_access_007_s_001*, %struct.uninit_memory_access_007_s_001** %st.addr, align 8, !dbg !101
  %a = getelementptr inbounds %struct.uninit_memory_access_007_s_001, %struct.uninit_memory_access_007_s_001* %2, i32 0, i32 1, !dbg !102
  store i32 1, i32* %a, align 4, !dbg !103
  ret void, !dbg !104
}

; Function Attrs: nounwind uwtable
define void @uninit_memory_access_007_func_002_good(%struct.uninit_memory_access_007_s_001* %st) #0 !dbg !105 {
entry:
  %st.addr = alloca %struct.uninit_memory_access_007_s_001*, align 8
  %temp = alloca i32, align 4
  %i = alloca i32, align 4
  store %struct.uninit_memory_access_007_s_001* %st, %struct.uninit_memory_access_007_s_001** %st.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.uninit_memory_access_007_s_001** %st.addr, metadata !106, metadata !23), !dbg !107
  call void @llvm.dbg.declare(metadata i32* %temp, metadata !108, metadata !23), !dbg !109
  store i32 0, i32* %temp, align 4, !dbg !109
  call void @llvm.dbg.declare(metadata i32* %i, metadata !110, metadata !23), !dbg !111
  store i32 0, i32* %i, align 4, !dbg !112
  br label %for.cond, !dbg !114

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !115
  %cmp = icmp slt i32 %0, 10, !dbg !118
  br i1 %cmp, label %for.body, label %for.end, !dbg !119

for.body:                                         ; preds = %for.cond
  %1 = load i32, i32* %i, align 4, !dbg !120
  %idxprom = sext i32 %1 to i64, !dbg !122
  %2 = load %struct.uninit_memory_access_007_s_001*, %struct.uninit_memory_access_007_s_001** %st.addr, align 8, !dbg !122
  %arr = getelementptr inbounds %struct.uninit_memory_access_007_s_001, %struct.uninit_memory_access_007_s_001* %2, i32 0, i32 0, !dbg !123
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %arr, i64 0, i64 %idxprom, !dbg !122
  %3 = load i32, i32* %arrayidx, align 4, !dbg !122
  %4 = load i32, i32* %temp, align 4, !dbg !124
  %add = add nsw i32 %4, %3, !dbg !124
  store i32 %add, i32* %temp, align 4, !dbg !124
  br label %for.inc, !dbg !125

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !126
  %inc = add nsw i32 %5, 1, !dbg !126
  store i32 %inc, i32* %i, align 4, !dbg !126
  br label %for.cond, !dbg !128, !llvm.loop !129

for.end:                                          ; preds = %for.cond
  ret void, !dbg !131
}

; Function Attrs: nounwind uwtable
define void @uninit_memory_access_007_func_003_good(%struct.uninit_memory_access_007_s_001* %st) #0 !dbg !132 {
entry:
  %st.addr = alloca %struct.uninit_memory_access_007_s_001*, align 8
  store %struct.uninit_memory_access_007_s_001* %st, %struct.uninit_memory_access_007_s_001** %st.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.uninit_memory_access_007_s_001** %st.addr, metadata !133, metadata !23), !dbg !134
  %0 = load %struct.uninit_memory_access_007_s_001*, %struct.uninit_memory_access_007_s_001** %st.addr, align 8, !dbg !135
  %b = getelementptr inbounds %struct.uninit_memory_access_007_s_001, %struct.uninit_memory_access_007_s_001* %0, i32 0, i32 2, !dbg !136
  store i32 10, i32* %b, align 4, !dbg !137
  %1 = load %struct.uninit_memory_access_007_s_001*, %struct.uninit_memory_access_007_s_001** %st.addr, align 8, !dbg !138
  %c = getelementptr inbounds %struct.uninit_memory_access_007_s_001, %struct.uninit_memory_access_007_s_001* %1, i32 0, i32 3, !dbg !139
  store i32 20, i32* %c, align 4, !dbg !140
  ret void, !dbg !141
}

; Function Attrs: nounwind uwtable
define void @uninit_memory_access_007_func_004_good(i32 %num) #0 !dbg !142 {
entry:
  %num.addr = alloca i32, align 4
  %temp = alloca i32, align 4
  store i32 %num, i32* %num.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %num.addr, metadata !143, metadata !23), !dbg !144
  call void @llvm.dbg.declare(metadata i32* %temp, metadata !145, metadata !23), !dbg !146
  store i32 0, i32* %temp, align 4, !dbg !146
  %0 = load i32, i32* %num.addr, align 4, !dbg !147
  %cmp = icmp ne i32 %0, 0, !dbg !149
  br i1 %cmp, label %if.then, label %if.end, !dbg !150

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %num.addr, align 4, !dbg !151
  store i32 %1, i32* %temp, align 4, !dbg !153
  br label %if.end, !dbg !154

if.end:                                           ; preds = %if.then, %entry
  ret void, !dbg !155
}

; Function Attrs: nounwind uwtable
define void @uninit_memory_access_007_good() #0 !dbg !156 {
entry:
  %st = alloca %struct.uninit_memory_access_007_s_001, align 4
  call void @llvm.dbg.declare(metadata %struct.uninit_memory_access_007_s_001* %st, metadata !157, metadata !23), !dbg !158
  call void @uninit_memory_access_007_func_001_good(%struct.uninit_memory_access_007_s_001* %st), !dbg !159
  call void @uninit_memory_access_007_func_002_good(%struct.uninit_memory_access_007_s_001* %st), !dbg !160
  call void @uninit_memory_access_007_func_003_good(%struct.uninit_memory_access_007_s_001* %st), !dbg !161
  %a = getelementptr inbounds %struct.uninit_memory_access_007_s_001, %struct.uninit_memory_access_007_s_001* %st, i32 0, i32 1, !dbg !162
  %0 = load i32, i32* %a, align 4, !dbg !162
  call void @uninit_memory_access_007_func_004_good(i32 %0), !dbg !163
  ret void, !dbg !164
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !165 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @uninit_memory_access_007_good(), !dbg !168
  call void @uninit_memory_access_007_bad(), !dbg !169
  ret i32 0, !dbg !170
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { argmemonly nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4}
!llvm.ident = !{!5}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (tags/RELEASE_390/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2)
!1 = !DIFile(filename: "457_uninit_memory_access_6.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/itc/457")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{!"clang version 3.9.0 (tags/RELEASE_390/final)"}
!6 = distinct !DISubprogram(name: "uninit_memory_access_007_func_001_bad", scope: !7, file: !7, line: 17, type: !8, isLocal: false, isDefinition: true, scopeLine: 18, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!7 = !DIFile(filename: "./457_uninit_memory_access_6.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/itc/457")
!8 = !DISubroutineType(types: !9)
!9 = !{null, !10}
!10 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !11, size: 64, align: 64)
!11 = !DIDerivedType(tag: DW_TAG_typedef, name: "uninit_memory_access_007_s_001", file: !7, line: 15, baseType: !12)
!12 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !7, line: 10, size: 416, align: 32, elements: !13)
!13 = !{!14, !19, !20, !21}
!14 = !DIDerivedType(tag: DW_TAG_member, name: "arr", scope: !12, file: !7, line: 11, baseType: !15, size: 320, align: 32)
!15 = !DICompositeType(tag: DW_TAG_array_type, baseType: !16, size: 320, align: 32, elements: !17)
!16 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!17 = !{!18}
!18 = !DISubrange(count: 10)
!19 = !DIDerivedType(tag: DW_TAG_member, name: "a", scope: !12, file: !7, line: 12, baseType: !16, size: 32, align: 32, offset: 320)
!20 = !DIDerivedType(tag: DW_TAG_member, name: "b", scope: !12, file: !7, line: 13, baseType: !16, size: 32, align: 32, offset: 352)
!21 = !DIDerivedType(tag: DW_TAG_member, name: "c", scope: !12, file: !7, line: 14, baseType: !16, size: 32, align: 32, offset: 384)
!22 = !DILocalVariable(name: "st", arg: 1, scope: !6, file: !7, line: 17, type: !10)
!23 = !DIExpression()
!24 = !DILocation(line: 17, column: 76, scope: !6)
!25 = !DILocation(line: 20, column: 13, scope: !6)
!26 = !DILocation(line: 20, column: 17, scope: !6)
!27 = !DILocation(line: 20, column: 6, scope: !6)
!28 = !DILocation(line: 21, column: 5, scope: !6)
!29 = !DILocation(line: 21, column: 9, scope: !6)
!30 = !DILocation(line: 21, column: 11, scope: !6)
!31 = !DILocation(line: 22, column: 1, scope: !6)
!32 = distinct !DISubprogram(name: "uninit_memory_access_007_func_002_bad", scope: !7, file: !7, line: 23, type: !8, isLocal: false, isDefinition: true, scopeLine: 24, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!33 = !DILocalVariable(name: "st", arg: 1, scope: !32, file: !7, line: 23, type: !10)
!34 = !DILocation(line: 23, column: 76, scope: !32)
!35 = !DILocalVariable(name: "temp", scope: !32, file: !7, line: 25, type: !16)
!36 = !DILocation(line: 25, column: 9, scope: !32)
!37 = !DILocalVariable(name: "i", scope: !32, file: !7, line: 26, type: !16)
!38 = !DILocation(line: 26, column: 9, scope: !32)
!39 = !DILocation(line: 27, column: 12, scope: !40)
!40 = distinct !DILexicalBlock(scope: !32, file: !7, line: 27, column: 5)
!41 = !DILocation(line: 27, column: 10, scope: !40)
!42 = !DILocation(line: 27, column: 17, scope: !43)
!43 = !DILexicalBlockFile(scope: !44, file: !7, discriminator: 1)
!44 = distinct !DILexicalBlock(scope: !40, file: !7, line: 27, column: 5)
!45 = !DILocation(line: 27, column: 19, scope: !43)
!46 = !DILocation(line: 27, column: 5, scope: !43)
!47 = !DILocation(line: 29, column: 25, scope: !48)
!48 = distinct !DILexicalBlock(scope: !44, file: !7, line: 28, column: 5)
!49 = !DILocation(line: 29, column: 17, scope: !48)
!50 = !DILocation(line: 29, column: 21, scope: !48)
!51 = !DILocation(line: 29, column: 14, scope: !48)
!52 = !DILocation(line: 30, column: 5, scope: !48)
!53 = !DILocation(line: 27, column: 27, scope: !54)
!54 = !DILexicalBlockFile(scope: !44, file: !7, discriminator: 2)
!55 = !DILocation(line: 27, column: 5, scope: !54)
!56 = distinct !{!56, !57}
!57 = !DILocation(line: 27, column: 5, scope: !32)
!58 = !DILocation(line: 31, column: 1, scope: !32)
!59 = distinct !DISubprogram(name: "uninit_memory_access_007_func_003_bad", scope: !7, file: !7, line: 33, type: !8, isLocal: false, isDefinition: true, scopeLine: 34, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!60 = !DILocalVariable(name: "st", arg: 1, scope: !59, file: !7, line: 33, type: !10)
!61 = !DILocation(line: 33, column: 76, scope: !59)
!62 = !DILocation(line: 35, column: 5, scope: !59)
!63 = !DILocation(line: 35, column: 9, scope: !59)
!64 = !DILocation(line: 35, column: 11, scope: !59)
!65 = !DILocation(line: 36, column: 2, scope: !59)
!66 = !DILocation(line: 36, column: 6, scope: !59)
!67 = !DILocation(line: 36, column: 8, scope: !59)
!68 = !DILocation(line: 37, column: 1, scope: !59)
!69 = distinct !DISubprogram(name: "uninit_memory_access_007_func_004_bad", scope: !7, file: !7, line: 39, type: !70, isLocal: false, isDefinition: true, scopeLine: 40, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!70 = !DISubroutineType(types: !71)
!71 = !{null, !16}
!72 = !DILocalVariable(name: "num", arg: 1, scope: !69, file: !7, line: 39, type: !16)
!73 = !DILocation(line: 39, column: 48, scope: !69)
!74 = !DILocalVariable(name: "temp", scope: !69, file: !7, line: 41, type: !16)
!75 = !DILocation(line: 41, column: 9, scope: !69)
!76 = !DILocation(line: 42, column: 8, scope: !77)
!77 = distinct !DILexicalBlock(scope: !69, file: !7, line: 42, column: 8)
!78 = !DILocation(line: 42, column: 12, scope: !77)
!79 = !DILocation(line: 42, column: 8, scope: !69)
!80 = !DILocation(line: 43, column: 16, scope: !81)
!81 = distinct !DILexicalBlock(scope: !77, file: !7, line: 42, column: 18)
!82 = !DILocation(line: 43, column: 14, scope: !81)
!83 = !DILocation(line: 44, column: 5, scope: !81)
!84 = !DILocation(line: 45, column: 1, scope: !69)
!85 = distinct !DISubprogram(name: "uninit_memory_access_007_bad", scope: !7, file: !7, line: 46, type: !86, isLocal: false, isDefinition: true, scopeLine: 47, isOptimized: false, unit: !0, variables: !2)
!86 = !DISubroutineType(types: !87)
!87 = !{null}
!88 = !DILocalVariable(name: "st", scope: !85, file: !7, line: 48, type: !11)
!89 = !DILocation(line: 48, column: 33, scope: !85)
!90 = !DILocation(line: 49, column: 2, scope: !85)
!91 = !DILocation(line: 50, column: 2, scope: !85)
!92 = !DILocation(line: 51, column: 2, scope: !85)
!93 = !DILocation(line: 52, column: 43, scope: !85)
!94 = !DILocation(line: 52, column: 2, scope: !85)
!95 = !DILocation(line: 53, column: 1, scope: !85)
!96 = distinct !DISubprogram(name: "uninit_memory_access_007_func_001_good", scope: !7, file: !7, line: 60, type: !8, isLocal: false, isDefinition: true, scopeLine: 61, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!97 = !DILocalVariable(name: "st", arg: 1, scope: !96, file: !7, line: 60, type: !10)
!98 = !DILocation(line: 60, column: 77, scope: !96)
!99 = !DILocation(line: 62, column: 12, scope: !96)
!100 = !DILocation(line: 62, column: 5, scope: !96)
!101 = !DILocation(line: 64, column: 5, scope: !96)
!102 = !DILocation(line: 64, column: 9, scope: !96)
!103 = !DILocation(line: 64, column: 11, scope: !96)
!104 = !DILocation(line: 65, column: 1, scope: !96)
!105 = distinct !DISubprogram(name: "uninit_memory_access_007_func_002_good", scope: !7, file: !7, line: 66, type: !8, isLocal: false, isDefinition: true, scopeLine: 67, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!106 = !DILocalVariable(name: "st", arg: 1, scope: !105, file: !7, line: 66, type: !10)
!107 = !DILocation(line: 66, column: 77, scope: !105)
!108 = !DILocalVariable(name: "temp", scope: !105, file: !7, line: 68, type: !16)
!109 = !DILocation(line: 68, column: 9, scope: !105)
!110 = !DILocalVariable(name: "i", scope: !105, file: !7, line: 69, type: !16)
!111 = !DILocation(line: 69, column: 9, scope: !105)
!112 = !DILocation(line: 70, column: 12, scope: !113)
!113 = distinct !DILexicalBlock(scope: !105, file: !7, line: 70, column: 5)
!114 = !DILocation(line: 70, column: 10, scope: !113)
!115 = !DILocation(line: 70, column: 17, scope: !116)
!116 = !DILexicalBlockFile(scope: !117, file: !7, discriminator: 1)
!117 = distinct !DILexicalBlock(scope: !113, file: !7, line: 70, column: 5)
!118 = !DILocation(line: 70, column: 19, scope: !116)
!119 = !DILocation(line: 70, column: 5, scope: !116)
!120 = !DILocation(line: 72, column: 25, scope: !121)
!121 = distinct !DILexicalBlock(scope: !117, file: !7, line: 71, column: 5)
!122 = !DILocation(line: 72, column: 17, scope: !121)
!123 = !DILocation(line: 72, column: 21, scope: !121)
!124 = !DILocation(line: 72, column: 14, scope: !121)
!125 = !DILocation(line: 73, column: 5, scope: !121)
!126 = !DILocation(line: 70, column: 27, scope: !127)
!127 = !DILexicalBlockFile(scope: !117, file: !7, discriminator: 2)
!128 = !DILocation(line: 70, column: 5, scope: !127)
!129 = distinct !{!129, !130}
!130 = !DILocation(line: 70, column: 5, scope: !105)
!131 = !DILocation(line: 74, column: 1, scope: !105)
!132 = distinct !DISubprogram(name: "uninit_memory_access_007_func_003_good", scope: !7, file: !7, line: 76, type: !8, isLocal: false, isDefinition: true, scopeLine: 77, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!133 = !DILocalVariable(name: "st", arg: 1, scope: !132, file: !7, line: 76, type: !10)
!134 = !DILocation(line: 76, column: 77, scope: !132)
!135 = !DILocation(line: 78, column: 5, scope: !132)
!136 = !DILocation(line: 78, column: 9, scope: !132)
!137 = !DILocation(line: 78, column: 11, scope: !132)
!138 = !DILocation(line: 79, column: 2, scope: !132)
!139 = !DILocation(line: 79, column: 6, scope: !132)
!140 = !DILocation(line: 79, column: 8, scope: !132)
!141 = !DILocation(line: 80, column: 1, scope: !132)
!142 = distinct !DISubprogram(name: "uninit_memory_access_007_func_004_good", scope: !7, file: !7, line: 82, type: !70, isLocal: false, isDefinition: true, scopeLine: 83, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!143 = !DILocalVariable(name: "num", arg: 1, scope: !142, file: !7, line: 82, type: !16)
!144 = !DILocation(line: 82, column: 49, scope: !142)
!145 = !DILocalVariable(name: "temp", scope: !142, file: !7, line: 84, type: !16)
!146 = !DILocation(line: 84, column: 7, scope: !142)
!147 = !DILocation(line: 85, column: 8, scope: !148)
!148 = distinct !DILexicalBlock(scope: !142, file: !7, line: 85, column: 8)
!149 = !DILocation(line: 85, column: 12, scope: !148)
!150 = !DILocation(line: 85, column: 8, scope: !142)
!151 = !DILocation(line: 86, column: 16, scope: !152)
!152 = distinct !DILexicalBlock(scope: !148, file: !7, line: 85, column: 18)
!153 = !DILocation(line: 86, column: 14, scope: !152)
!154 = !DILocation(line: 87, column: 5, scope: !152)
!155 = !DILocation(line: 89, column: 1, scope: !142)
!156 = distinct !DISubprogram(name: "uninit_memory_access_007_good", scope: !7, file: !7, line: 90, type: !86, isLocal: false, isDefinition: true, scopeLine: 91, isOptimized: false, unit: !0, variables: !2)
!157 = !DILocalVariable(name: "st", scope: !156, file: !7, line: 92, type: !11)
!158 = !DILocation(line: 92, column: 33, scope: !156)
!159 = !DILocation(line: 93, column: 2, scope: !156)
!160 = !DILocation(line: 94, column: 2, scope: !156)
!161 = !DILocation(line: 95, column: 2, scope: !156)
!162 = !DILocation(line: 96, column: 44, scope: !156)
!163 = !DILocation(line: 96, column: 2, scope: !156)
!164 = !DILocation(line: 97, column: 1, scope: !156)
!165 = distinct !DISubprogram(name: "main", scope: !7, file: !7, line: 99, type: !166, isLocal: false, isDefinition: true, scopeLine: 99, isOptimized: false, unit: !0, variables: !2)
!166 = !DISubroutineType(types: !167)
!167 = !{!16}
!168 = !DILocation(line: 100, column: 3, scope: !165)
!169 = !DILocation(line: 101, column: 2, scope: !165)
!170 = !DILocation(line: 102, column: 2, scope: !165)
