; ModuleID = './401_memory_leak_2.c'
source_filename = "./401_memory_leak_2.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: nounwind uwtable
define void @memory_leak_002_bad() #0 !dbg !11 {
entry:
  %ptr = alloca i32**, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %index = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32*** %ptr, metadata !15, metadata !16), !dbg !17
  %call = call noalias i8* @malloc(i64 16) #3, !dbg !18
  %0 = bitcast i8* %call to i32**, !dbg !19
  store i32** %0, i32*** %ptr, align 8, !dbg !17
  %1 = load i32**, i32*** %ptr, align 8, !dbg !20
  %cmp = icmp eq i32** %1, null, !dbg !22
  br i1 %cmp, label %if.then, label %if.end, !dbg !23

if.then:                                          ; preds = %entry
  br label %return, !dbg !24

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %i, metadata !26, metadata !16), !dbg !27
  call void @llvm.dbg.declare(metadata i32* %j, metadata !28, metadata !16), !dbg !29
  store i32 0, i32* %i, align 4, !dbg !30
  br label %for.cond, !dbg !32

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i32, i32* %i, align 4, !dbg !33
  %cmp1 = icmp slt i32 %2, 2, !dbg !36
  br i1 %cmp1, label %for.body, label %for.end, !dbg !37

for.body:                                         ; preds = %for.cond
  %call2 = call noalias i8* @malloc(i64 4) #3, !dbg !38
  %3 = bitcast i8* %call2 to i32*, !dbg !40
  %4 = load i32, i32* %i, align 4, !dbg !41
  %idxprom = sext i32 %4 to i64, !dbg !42
  %5 = load i32**, i32*** %ptr, align 8, !dbg !42
  %arrayidx = getelementptr inbounds i32*, i32** %5, i64 %idxprom, !dbg !42
  store i32* %3, i32** %arrayidx, align 8, !dbg !43
  %6 = load i32, i32* %i, align 4, !dbg !44
  %idxprom3 = sext i32 %6 to i64, !dbg !46
  %7 = load i32**, i32*** %ptr, align 8, !dbg !46
  %arrayidx4 = getelementptr inbounds i32*, i32** %7, i64 %idxprom3, !dbg !46
  %8 = load i32*, i32** %arrayidx4, align 8, !dbg !46
  %cmp5 = icmp eq i32* %8, null, !dbg !47
  br i1 %cmp5, label %if.then6, label %if.end7, !dbg !48

if.then6:                                         ; preds = %for.body
  br label %return, !dbg !49

if.end7:                                          ; preds = %for.body
  br label %for.inc, !dbg !51

for.inc:                                          ; preds = %if.end7
  %9 = load i32, i32* %i, align 4, !dbg !52
  %inc = add nsw i32 %9, 1, !dbg !52
  store i32 %inc, i32* %i, align 4, !dbg !52
  br label %for.cond, !dbg !54, !llvm.loop !55

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i32* %index, metadata !57, metadata !16), !dbg !58
  store i32 2, i32* %index, align 4, !dbg !58
  store i32 0, i32* %i, align 4, !dbg !59
  br label %for.cond8, !dbg !61

for.cond8:                                        ; preds = %for.inc24, %for.end
  %10 = load i32, i32* %i, align 4, !dbg !62
  %11 = load i32, i32* %index, align 4, !dbg !65
  %cmp9 = icmp slt i32 %10, %11, !dbg !66
  br i1 %cmp9, label %for.body10, label %for.end26, !dbg !67

for.body10:                                       ; preds = %for.cond8
  %12 = load i32, i32* %i, align 4, !dbg !68
  %idxprom11 = sext i32 %12 to i64, !dbg !71
  %13 = load i32**, i32*** %ptr, align 8, !dbg !71
  %arrayidx12 = getelementptr inbounds i32*, i32** %13, i64 %idxprom11, !dbg !71
  %14 = load i32*, i32** %arrayidx12, align 8, !dbg !71
  %cmp13 = icmp eq i32* %14, null, !dbg !72
  br i1 %cmp13, label %if.then14, label %if.end15, !dbg !73

if.then14:                                        ; preds = %for.body10
  br label %for.inc24, !dbg !74

if.end15:                                         ; preds = %for.body10
  store i32 0, i32* %j, align 4, !dbg !76
  br label %for.cond16, !dbg !78

for.cond16:                                       ; preds = %for.inc21, %if.end15
  %15 = load i32, i32* %j, align 4, !dbg !79
  %cmp17 = icmp slt i32 %15, 1, !dbg !82
  br i1 %cmp17, label %for.body18, label %for.end23, !dbg !83

for.body18:                                       ; preds = %for.cond16
  %16 = load i32, i32* %i, align 4, !dbg !84
  %17 = load i32**, i32*** %ptr, align 8, !dbg !86
  %18 = load i32, i32* %i, align 4, !dbg !87
  %idx.ext = sext i32 %18 to i64, !dbg !88
  %add.ptr = getelementptr inbounds i32*, i32** %17, i64 %idx.ext, !dbg !88
  %19 = load i32*, i32** %add.ptr, align 8, !dbg !89
  %20 = load i32, i32* %j, align 4, !dbg !90
  %idx.ext19 = sext i32 %20 to i64, !dbg !91
  %add.ptr20 = getelementptr inbounds i32, i32* %19, i64 %idx.ext19, !dbg !91
  store i32 %16, i32* %add.ptr20, align 4, !dbg !92
  br label %for.inc21, !dbg !93

for.inc21:                                        ; preds = %for.body18
  %21 = load i32, i32* %j, align 4, !dbg !94
  %inc22 = add nsw i32 %21, 1, !dbg !94
  store i32 %inc22, i32* %j, align 4, !dbg !94
  br label %for.cond16, !dbg !96, !llvm.loop !97

for.end23:                                        ; preds = %for.cond16
  br label %for.inc24, !dbg !99

for.inc24:                                        ; preds = %for.end23, %if.then14
  %22 = load i32, i32* %i, align 4, !dbg !100
  %inc25 = add nsw i32 %22, 1, !dbg !100
  store i32 %inc25, i32* %i, align 4, !dbg !100
  br label %for.cond8, !dbg !102, !llvm.loop !103

for.end26:                                        ; preds = %for.cond8
  %23 = load i32**, i32*** %ptr, align 8, !dbg !105
  %24 = bitcast i32** %23 to i8*, !dbg !105
  call void @free(i8* %24) #3, !dbg !106
  br label %return, !dbg !107

return:                                           ; preds = %for.end26, %if.then6, %if.then
  ret void, !dbg !108
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #2

; Function Attrs: nounwind
declare void @free(i8*) #2

; Function Attrs: nounwind uwtable
define void @memory_leak_002_good() #0 !dbg !110 {
entry:
  %ptr = alloca i32**, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %index = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32*** %ptr, metadata !111, metadata !16), !dbg !112
  %call = call noalias i8* @malloc(i64 16) #3, !dbg !113
  %0 = bitcast i8* %call to i32**, !dbg !114
  store i32** %0, i32*** %ptr, align 8, !dbg !112
  %1 = load i32**, i32*** %ptr, align 8, !dbg !115
  %cmp = icmp eq i32** %1, null, !dbg !117
  br i1 %cmp, label %if.then, label %if.end, !dbg !118

if.then:                                          ; preds = %entry
  br label %return, !dbg !119

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %i, metadata !121, metadata !16), !dbg !122
  call void @llvm.dbg.declare(metadata i32* %j, metadata !123, metadata !16), !dbg !124
  store i32 0, i32* %i, align 4, !dbg !125
  br label %for.cond, !dbg !127

for.cond:                                         ; preds = %for.inc13, %if.end
  %2 = load i32, i32* %i, align 4, !dbg !128
  %cmp1 = icmp slt i32 %2, 2, !dbg !131
  br i1 %cmp1, label %for.body, label %for.end15, !dbg !132

for.body:                                         ; preds = %for.cond
  %call2 = call noalias i8* @malloc(i64 4) #3, !dbg !133
  %3 = bitcast i8* %call2 to i32*, !dbg !135
  %4 = load i32, i32* %i, align 4, !dbg !136
  %idxprom = sext i32 %4 to i64, !dbg !137
  %5 = load i32**, i32*** %ptr, align 8, !dbg !137
  %arrayidx = getelementptr inbounds i32*, i32** %5, i64 %idxprom, !dbg !137
  store i32* %3, i32** %arrayidx, align 8, !dbg !138
  %6 = load i32, i32* %i, align 4, !dbg !139
  %idxprom3 = sext i32 %6 to i64, !dbg !141
  %7 = load i32**, i32*** %ptr, align 8, !dbg !141
  %arrayidx4 = getelementptr inbounds i32*, i32** %7, i64 %idxprom3, !dbg !141
  %8 = load i32*, i32** %arrayidx4, align 8, !dbg !141
  %cmp5 = icmp eq i32* %8, null, !dbg !142
  br i1 %cmp5, label %if.then6, label %if.end12, !dbg !143

if.then6:                                         ; preds = %for.body
  store i32 0, i32* %j, align 4, !dbg !144
  br label %for.cond7, !dbg !147

for.cond7:                                        ; preds = %for.inc, %if.then6
  %9 = load i32, i32* %j, align 4, !dbg !148
  %10 = load i32, i32* %i, align 4, !dbg !151
  %cmp8 = icmp slt i32 %9, %10, !dbg !152
  br i1 %cmp8, label %for.body9, label %for.end, !dbg !153

for.body9:                                        ; preds = %for.cond7
  %11 = load i32, i32* %j, align 4, !dbg !154
  %idxprom10 = sext i32 %11 to i64, !dbg !156
  %12 = load i32**, i32*** %ptr, align 8, !dbg !156
  %arrayidx11 = getelementptr inbounds i32*, i32** %12, i64 %idxprom10, !dbg !156
  %13 = load i32*, i32** %arrayidx11, align 8, !dbg !156
  %14 = bitcast i32* %13 to i8*, !dbg !156
  call void @free(i8* %14) #3, !dbg !157
  br label %for.inc, !dbg !158

for.inc:                                          ; preds = %for.body9
  %15 = load i32, i32* %j, align 4, !dbg !159
  %inc = add nsw i32 %15, 1, !dbg !159
  store i32 %inc, i32* %j, align 4, !dbg !159
  br label %for.cond7, !dbg !161, !llvm.loop !162

for.end:                                          ; preds = %for.cond7
  %16 = load i32**, i32*** %ptr, align 8, !dbg !164
  %17 = bitcast i32** %16 to i8*, !dbg !164
  call void @free(i8* %17) #3, !dbg !165
  br label %return, !dbg !166

if.end12:                                         ; preds = %for.body
  br label %for.inc13, !dbg !167

for.inc13:                                        ; preds = %if.end12
  %18 = load i32, i32* %i, align 4, !dbg !168
  %inc14 = add nsw i32 %18, 1, !dbg !168
  store i32 %inc14, i32* %i, align 4, !dbg !168
  br label %for.cond, !dbg !170, !llvm.loop !171

for.end15:                                        ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i32* %index, metadata !173, metadata !16), !dbg !174
  store i32 2, i32* %index, align 4, !dbg !174
  store i32 0, i32* %i, align 4, !dbg !175
  br label %for.cond16, !dbg !177

for.cond16:                                       ; preds = %for.inc29, %for.end15
  %19 = load i32, i32* %i, align 4, !dbg !178
  %20 = load i32, i32* %index, align 4, !dbg !181
  %cmp17 = icmp slt i32 %19, %20, !dbg !182
  br i1 %cmp17, label %for.body18, label %for.end31, !dbg !183

for.body18:                                       ; preds = %for.cond16
  store i32 0, i32* %j, align 4, !dbg !184
  br label %for.cond19, !dbg !187

for.cond19:                                       ; preds = %for.inc24, %for.body18
  %21 = load i32, i32* %j, align 4, !dbg !188
  %cmp20 = icmp slt i32 %21, 1, !dbg !191
  br i1 %cmp20, label %for.body21, label %for.end26, !dbg !192

for.body21:                                       ; preds = %for.cond19
  %22 = load i32, i32* %i, align 4, !dbg !193
  %23 = load i32**, i32*** %ptr, align 8, !dbg !195
  %24 = load i32, i32* %i, align 4, !dbg !196
  %idx.ext = sext i32 %24 to i64, !dbg !197
  %add.ptr = getelementptr inbounds i32*, i32** %23, i64 %idx.ext, !dbg !197
  %25 = load i32*, i32** %add.ptr, align 8, !dbg !198
  %26 = load i32, i32* %j, align 4, !dbg !199
  %idx.ext22 = sext i32 %26 to i64, !dbg !200
  %add.ptr23 = getelementptr inbounds i32, i32* %25, i64 %idx.ext22, !dbg !200
  store i32 %22, i32* %add.ptr23, align 4, !dbg !201
  br label %for.inc24, !dbg !202

for.inc24:                                        ; preds = %for.body21
  %27 = load i32, i32* %j, align 4, !dbg !203
  %inc25 = add nsw i32 %27, 1, !dbg !203
  store i32 %inc25, i32* %j, align 4, !dbg !203
  br label %for.cond19, !dbg !205, !llvm.loop !206

for.end26:                                        ; preds = %for.cond19
  %28 = load i32, i32* %i, align 4, !dbg !208
  %idxprom27 = sext i32 %28 to i64, !dbg !209
  %29 = load i32**, i32*** %ptr, align 8, !dbg !209
  %arrayidx28 = getelementptr inbounds i32*, i32** %29, i64 %idxprom27, !dbg !209
  %30 = load i32*, i32** %arrayidx28, align 8, !dbg !209
  %31 = bitcast i32* %30 to i8*, !dbg !209
  call void @free(i8* %31) #3, !dbg !210
  br label %for.inc29, !dbg !211

for.inc29:                                        ; preds = %for.end26
  %32 = load i32, i32* %i, align 4, !dbg !212
  %inc30 = add nsw i32 %32, 1, !dbg !212
  store i32 %inc30, i32* %i, align 4, !dbg !212
  br label %for.cond16, !dbg !214, !llvm.loop !215

for.end31:                                        ; preds = %for.cond16
  %33 = load i32**, i32*** %ptr, align 8, !dbg !217
  %34 = bitcast i32** %33 to i8*, !dbg !217
  call void @free(i8* %34) #3, !dbg !218
  br label %return, !dbg !219

return:                                           ; preds = %for.end31, %for.end, %if.then
  ret void, !dbg !220
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !222 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @memory_leak_002_good(), !dbg !225
  call void @memory_leak_002_bad(), !dbg !226
  ret i32 0, !dbg !227
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (tags/RELEASE_390/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3)
!1 = !DIFile(filename: "401_memory_leak_2.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/itc/401")
!2 = !{}
!3 = !{!4, !7, !5}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64, align: 64)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64, align: 64)
!6 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!7 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64, align: 64)
!8 = !{i32 2, !"Dwarf Version", i32 4}
!9 = !{i32 2, !"Debug Info Version", i32 3}
!10 = !{!"clang version 3.9.0 (tags/RELEASE_390/final)"}
!11 = distinct !DISubprogram(name: "memory_leak_002_bad", scope: !12, file: !12, line: 17, type: !13, isLocal: false, isDefinition: true, scopeLine: 18, isOptimized: false, unit: !0, variables: !2)
!12 = !DIFile(filename: "./401_memory_leak_2.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/itc/401")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "ptr", scope: !11, file: !12, line: 19, type: !4)
!16 = !DIExpression()
!17 = !DILocation(line: 19, column: 8, scope: !11)
!18 = !DILocation(line: 19, column: 22, scope: !11)
!19 = !DILocation(line: 19, column: 14, scope: !11)
!20 = !DILocation(line: 20, column: 6, scope: !21)
!21 = distinct !DILexicalBlock(scope: !11, file: !12, line: 20, column: 6)
!22 = !DILocation(line: 20, column: 10, scope: !21)
!23 = !DILocation(line: 20, column: 6, scope: !11)
!24 = !DILocation(line: 20, column: 19, scope: !25)
!25 = !DILexicalBlockFile(scope: !21, file: !12, discriminator: 1)
!26 = !DILocalVariable(name: "i", scope: !11, file: !12, line: 21, type: !6)
!27 = !DILocation(line: 21, column: 6, scope: !11)
!28 = !DILocalVariable(name: "j", scope: !11, file: !12, line: 21, type: !6)
!29 = !DILocation(line: 21, column: 8, scope: !11)
!30 = !DILocation(line: 23, column: 7, scope: !31)
!31 = distinct !DILexicalBlock(scope: !11, file: !12, line: 23, column: 2)
!32 = !DILocation(line: 23, column: 6, scope: !31)
!33 = !DILocation(line: 23, column: 10, scope: !34)
!34 = !DILexicalBlockFile(scope: !35, file: !12, discriminator: 1)
!35 = distinct !DILexicalBlock(scope: !31, file: !12, line: 23, column: 2)
!36 = !DILocation(line: 23, column: 11, scope: !34)
!37 = !DILocation(line: 23, column: 2, scope: !34)
!38 = !DILocation(line: 24, column: 17, scope: !39)
!39 = distinct !DILexicalBlock(scope: !35, file: !12, line: 23, column: 18)
!40 = !DILocation(line: 24, column: 10, scope: !39)
!41 = !DILocation(line: 24, column: 7, scope: !39)
!42 = !DILocation(line: 24, column: 3, scope: !39)
!43 = !DILocation(line: 24, column: 9, scope: !39)
!44 = !DILocation(line: 25, column: 11, scope: !45)
!45 = distinct !DILexicalBlock(scope: !39, file: !12, line: 25, column: 7)
!46 = !DILocation(line: 25, column: 7, scope: !45)
!47 = !DILocation(line: 25, column: 14, scope: !45)
!48 = !DILocation(line: 25, column: 7, scope: !39)
!49 = !DILocation(line: 25, column: 23, scope: !50)
!50 = !DILexicalBlockFile(scope: !45, file: !12, discriminator: 1)
!51 = !DILocation(line: 26, column: 2, scope: !39)
!52 = !DILocation(line: 23, column: 15, scope: !53)
!53 = !DILexicalBlockFile(scope: !35, file: !12, discriminator: 2)
!54 = !DILocation(line: 23, column: 2, scope: !53)
!55 = distinct !{!55, !56}
!56 = !DILocation(line: 23, column: 2, scope: !11)
!57 = !DILocalVariable(name: "index", scope: !11, file: !12, line: 27, type: !6)
!58 = !DILocation(line: 27, column: 6, scope: !11)
!59 = !DILocation(line: 28, column: 7, scope: !60)
!60 = distinct !DILexicalBlock(scope: !11, file: !12, line: 28, column: 2)
!61 = !DILocation(line: 28, column: 6, scope: !60)
!62 = !DILocation(line: 28, column: 10, scope: !63)
!63 = !DILexicalBlockFile(scope: !64, file: !12, discriminator: 1)
!64 = distinct !DILexicalBlock(scope: !60, file: !12, line: 28, column: 2)
!65 = !DILocation(line: 28, column: 12, scope: !63)
!66 = !DILocation(line: 28, column: 11, scope: !63)
!67 = !DILocation(line: 28, column: 2, scope: !63)
!68 = !DILocation(line: 30, column: 11, scope: !69)
!69 = distinct !DILexicalBlock(scope: !70, file: !12, line: 30, column: 7)
!70 = distinct !DILexicalBlock(scope: !64, file: !12, line: 29, column: 2)
!71 = !DILocation(line: 30, column: 7, scope: !69)
!72 = !DILocation(line: 30, column: 14, scope: !69)
!73 = !DILocation(line: 30, column: 7, scope: !70)
!74 = !DILocation(line: 32, column: 4, scope: !75)
!75 = distinct !DILexicalBlock(scope: !69, file: !12, line: 31, column: 3)
!76 = !DILocation(line: 34, column: 8, scope: !77)
!77 = distinct !DILexicalBlock(scope: !70, file: !12, line: 34, column: 3)
!78 = !DILocation(line: 34, column: 7, scope: !77)
!79 = !DILocation(line: 34, column: 11, scope: !80)
!80 = !DILexicalBlockFile(scope: !81, file: !12, discriminator: 1)
!81 = distinct !DILexicalBlock(scope: !77, file: !12, line: 34, column: 3)
!82 = !DILocation(line: 34, column: 12, scope: !80)
!83 = !DILocation(line: 34, column: 3, scope: !80)
!84 = !DILocation(line: 36, column: 18, scope: !85)
!85 = distinct !DILexicalBlock(scope: !81, file: !12, line: 35, column: 3)
!86 = !DILocation(line: 36, column: 8, scope: !85)
!87 = !DILocation(line: 36, column: 12, scope: !85)
!88 = !DILocation(line: 36, column: 11, scope: !85)
!89 = !DILocation(line: 36, column: 6, scope: !85)
!90 = !DILocation(line: 36, column: 15, scope: !85)
!91 = !DILocation(line: 36, column: 14, scope: !85)
!92 = !DILocation(line: 36, column: 17, scope: !85)
!93 = !DILocation(line: 37, column: 3, scope: !85)
!94 = !DILocation(line: 34, column: 16, scope: !95)
!95 = !DILexicalBlockFile(scope: !81, file: !12, discriminator: 2)
!96 = !DILocation(line: 34, column: 3, scope: !95)
!97 = distinct !{!97, !98}
!98 = !DILocation(line: 34, column: 3, scope: !70)
!99 = !DILocation(line: 38, column: 2, scope: !70)
!100 = !DILocation(line: 28, column: 19, scope: !101)
!101 = !DILexicalBlockFile(scope: !64, file: !12, discriminator: 2)
!102 = !DILocation(line: 28, column: 2, scope: !101)
!103 = distinct !{!103, !104}
!104 = !DILocation(line: 28, column: 2, scope: !11)
!105 = !DILocation(line: 39, column: 7, scope: !11)
!106 = !DILocation(line: 39, column: 2, scope: !11)
!107 = !DILocation(line: 40, column: 1, scope: !11)
!108 = !DILocation(line: 40, column: 1, scope: !109)
!109 = !DILexicalBlockFile(scope: !11, file: !12, discriminator: 1)
!110 = distinct !DISubprogram(name: "memory_leak_002_good", scope: !12, file: !12, line: 46, type: !13, isLocal: false, isDefinition: true, scopeLine: 47, isOptimized: false, unit: !0, variables: !2)
!111 = !DILocalVariable(name: "ptr", scope: !110, file: !12, line: 48, type: !4)
!112 = !DILocation(line: 48, column: 8, scope: !110)
!113 = !DILocation(line: 48, column: 22, scope: !110)
!114 = !DILocation(line: 48, column: 14, scope: !110)
!115 = !DILocation(line: 49, column: 6, scope: !116)
!116 = distinct !DILexicalBlock(scope: !110, file: !12, line: 49, column: 6)
!117 = !DILocation(line: 49, column: 10, scope: !116)
!118 = !DILocation(line: 49, column: 6, scope: !110)
!119 = !DILocation(line: 49, column: 19, scope: !120)
!120 = !DILexicalBlockFile(scope: !116, file: !12, discriminator: 1)
!121 = !DILocalVariable(name: "i", scope: !110, file: !12, line: 50, type: !6)
!122 = !DILocation(line: 50, column: 6, scope: !110)
!123 = !DILocalVariable(name: "j", scope: !110, file: !12, line: 50, type: !6)
!124 = !DILocation(line: 50, column: 8, scope: !110)
!125 = !DILocation(line: 52, column: 7, scope: !126)
!126 = distinct !DILexicalBlock(scope: !110, file: !12, line: 52, column: 2)
!127 = !DILocation(line: 52, column: 6, scope: !126)
!128 = !DILocation(line: 52, column: 10, scope: !129)
!129 = !DILexicalBlockFile(scope: !130, file: !12, discriminator: 1)
!130 = distinct !DILexicalBlock(scope: !126, file: !12, line: 52, column: 2)
!131 = !DILocation(line: 52, column: 11, scope: !129)
!132 = !DILocation(line: 52, column: 2, scope: !129)
!133 = !DILocation(line: 53, column: 17, scope: !134)
!134 = distinct !DILexicalBlock(scope: !130, file: !12, line: 52, column: 18)
!135 = !DILocation(line: 53, column: 10, scope: !134)
!136 = !DILocation(line: 53, column: 7, scope: !134)
!137 = !DILocation(line: 53, column: 3, scope: !134)
!138 = !DILocation(line: 53, column: 9, scope: !134)
!139 = !DILocation(line: 54, column: 11, scope: !140)
!140 = distinct !DILexicalBlock(scope: !134, file: !12, line: 54, column: 7)
!141 = !DILocation(line: 54, column: 7, scope: !140)
!142 = !DILocation(line: 54, column: 14, scope: !140)
!143 = !DILocation(line: 54, column: 7, scope: !134)
!144 = !DILocation(line: 55, column: 11, scope: !145)
!145 = distinct !DILexicalBlock(scope: !146, file: !12, line: 55, column: 4)
!146 = distinct !DILexicalBlock(scope: !140, file: !12, line: 54, column: 23)
!147 = !DILocation(line: 55, column: 9, scope: !145)
!148 = !DILocation(line: 55, column: 16, scope: !149)
!149 = !DILexicalBlockFile(scope: !150, file: !12, discriminator: 1)
!150 = distinct !DILexicalBlock(scope: !145, file: !12, line: 55, column: 4)
!151 = !DILocation(line: 55, column: 20, scope: !149)
!152 = !DILocation(line: 55, column: 18, scope: !149)
!153 = !DILocation(line: 55, column: 4, scope: !149)
!154 = !DILocation(line: 57, column: 14, scope: !155)
!155 = distinct !DILexicalBlock(scope: !150, file: !12, line: 56, column: 4)
!156 = !DILocation(line: 57, column: 10, scope: !155)
!157 = !DILocation(line: 57, column: 5, scope: !155)
!158 = !DILocation(line: 58, column: 4, scope: !155)
!159 = !DILocation(line: 55, column: 23, scope: !160)
!160 = !DILexicalBlockFile(scope: !150, file: !12, discriminator: 2)
!161 = !DILocation(line: 55, column: 4, scope: !160)
!162 = distinct !{!162, !163}
!163 = !DILocation(line: 55, column: 4, scope: !146)
!164 = !DILocation(line: 59, column: 9, scope: !146)
!165 = !DILocation(line: 59, column: 4, scope: !146)
!166 = !DILocation(line: 60, column: 4, scope: !146)
!167 = !DILocation(line: 62, column: 2, scope: !134)
!168 = !DILocation(line: 52, column: 15, scope: !169)
!169 = !DILexicalBlockFile(scope: !130, file: !12, discriminator: 2)
!170 = !DILocation(line: 52, column: 2, scope: !169)
!171 = distinct !{!171, !172}
!172 = !DILocation(line: 52, column: 2, scope: !110)
!173 = !DILocalVariable(name: "index", scope: !110, file: !12, line: 63, type: !6)
!174 = !DILocation(line: 63, column: 6, scope: !110)
!175 = !DILocation(line: 64, column: 7, scope: !176)
!176 = distinct !DILexicalBlock(scope: !110, file: !12, line: 64, column: 2)
!177 = !DILocation(line: 64, column: 6, scope: !176)
!178 = !DILocation(line: 64, column: 10, scope: !179)
!179 = !DILexicalBlockFile(scope: !180, file: !12, discriminator: 1)
!180 = distinct !DILexicalBlock(scope: !176, file: !12, line: 64, column: 2)
!181 = !DILocation(line: 64, column: 12, scope: !179)
!182 = !DILocation(line: 64, column: 11, scope: !179)
!183 = !DILocation(line: 64, column: 2, scope: !179)
!184 = !DILocation(line: 66, column: 8, scope: !185)
!185 = distinct !DILexicalBlock(scope: !186, file: !12, line: 66, column: 3)
!186 = distinct !DILexicalBlock(scope: !180, file: !12, line: 65, column: 2)
!187 = !DILocation(line: 66, column: 7, scope: !185)
!188 = !DILocation(line: 66, column: 11, scope: !189)
!189 = !DILexicalBlockFile(scope: !190, file: !12, discriminator: 1)
!190 = distinct !DILexicalBlock(scope: !185, file: !12, line: 66, column: 3)
!191 = !DILocation(line: 66, column: 12, scope: !189)
!192 = !DILocation(line: 66, column: 3, scope: !189)
!193 = !DILocation(line: 68, column: 18, scope: !194)
!194 = distinct !DILexicalBlock(scope: !190, file: !12, line: 67, column: 3)
!195 = !DILocation(line: 68, column: 8, scope: !194)
!196 = !DILocation(line: 68, column: 12, scope: !194)
!197 = !DILocation(line: 68, column: 11, scope: !194)
!198 = !DILocation(line: 68, column: 6, scope: !194)
!199 = !DILocation(line: 68, column: 15, scope: !194)
!200 = !DILocation(line: 68, column: 14, scope: !194)
!201 = !DILocation(line: 68, column: 17, scope: !194)
!202 = !DILocation(line: 69, column: 3, scope: !194)
!203 = !DILocation(line: 66, column: 16, scope: !204)
!204 = !DILexicalBlockFile(scope: !190, file: !12, discriminator: 2)
!205 = !DILocation(line: 66, column: 3, scope: !204)
!206 = distinct !{!206, !207}
!207 = !DILocation(line: 66, column: 3, scope: !186)
!208 = !DILocation(line: 70, column: 15, scope: !186)
!209 = !DILocation(line: 70, column: 11, scope: !186)
!210 = !DILocation(line: 70, column: 6, scope: !186)
!211 = !DILocation(line: 71, column: 2, scope: !186)
!212 = !DILocation(line: 64, column: 19, scope: !213)
!213 = !DILexicalBlockFile(scope: !180, file: !12, discriminator: 2)
!214 = !DILocation(line: 64, column: 2, scope: !213)
!215 = distinct !{!215, !216}
!216 = !DILocation(line: 64, column: 2, scope: !110)
!217 = !DILocation(line: 72, column: 7, scope: !110)
!218 = !DILocation(line: 72, column: 2, scope: !110)
!219 = !DILocation(line: 73, column: 1, scope: !110)
!220 = !DILocation(line: 73, column: 1, scope: !221)
!221 = !DILexicalBlockFile(scope: !110, file: !12, discriminator: 1)
!222 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 80, type: !223, isLocal: false, isDefinition: true, scopeLine: 81, isOptimized: false, unit: !0, variables: !2)
!223 = !DISubroutineType(types: !224)
!224 = !{!6}
!225 = !DILocation(line: 82, column: 2, scope: !222)
!226 = !DILocation(line: 83, column: 2, scope: !222)
!227 = !DILocation(line: 84, column: 2, scope: !222)
