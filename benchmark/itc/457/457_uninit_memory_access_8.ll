; ModuleID = './457_uninit_memory_access_8.c'
source_filename = "./457_uninit_memory_access_8.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@_bad = common global i64** null, align 8
@_good = common global i64** null, align 8

; Function Attrs: nounwind uwtable
define void @_002_bad() #0 !dbg !14 {
entry:
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %i, metadata !17, metadata !19), !dbg !20
  call void @llvm.dbg.declare(metadata i32* %j, metadata !21, metadata !19), !dbg !22
  %call = call noalias i8* @malloc(i64 80) #3, !dbg !23
  %0 = bitcast i8* %call to i64**, !dbg !24
  store i64** %0, i64*** @_bad, align 8, !dbg !25
  store i32 0, i32* %i, align 4, !dbg !26
  br label %for.cond, !dbg !28

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i32, i32* %i, align 4, !dbg !29
  %cmp = icmp slt i32 %1, 2, !dbg !32
  br i1 %cmp, label %for.body, label %for.end, !dbg !33

for.body:                                         ; preds = %for.cond
  %call1 = call noalias i8* @malloc(i64 80) #3, !dbg !34
  %2 = bitcast i8* %call1 to i64*, !dbg !36
  %3 = load i32, i32* %i, align 4, !dbg !37
  %idxprom = sext i32 %3 to i64, !dbg !38
  %4 = load i64**, i64*** @_bad, align 8, !dbg !38
  %arrayidx = getelementptr inbounds i64*, i64** %4, i64 %idxprom, !dbg !38
  store i64* %2, i64** %arrayidx, align 8, !dbg !39
  br label %for.inc, !dbg !40

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !41
  %inc = add nsw i32 %5, 1, !dbg !41
  store i32 %inc, i32* %i, align 4, !dbg !41
  br label %for.cond, !dbg !43, !llvm.loop !44

for.end:                                          ; preds = %for.cond
  store i32 0, i32* %i, align 4, !dbg !46
  br label %for.cond2, !dbg !48

for.cond2:                                        ; preds = %for.inc11, %for.end
  %6 = load i32, i32* %i, align 4, !dbg !49
  %cmp3 = icmp slt i32 %6, 2, !dbg !52
  br i1 %cmp3, label %for.body4, label %for.end13, !dbg !53

for.body4:                                        ; preds = %for.cond2
  store i32 0, i32* %j, align 4, !dbg !54
  br label %for.cond5, !dbg !57

for.cond5:                                        ; preds = %for.inc8, %for.body4
  %7 = load i32, i32* %j, align 4, !dbg !58
  %cmp6 = icmp slt i32 %7, 2, !dbg !61
  br i1 %cmp6, label %for.body7, label %for.end10, !dbg !62

for.body7:                                        ; preds = %for.cond5
  br label %for.inc8, !dbg !63

for.inc8:                                         ; preds = %for.body7
  %8 = load i32, i32* %j, align 4, !dbg !65
  %inc9 = add nsw i32 %8, 1, !dbg !65
  store i32 %inc9, i32* %j, align 4, !dbg !65
  br label %for.cond5, !dbg !67, !llvm.loop !68

for.end10:                                        ; preds = %for.cond5
  br label %for.inc11, !dbg !70

for.inc11:                                        ; preds = %for.end10
  %9 = load i32, i32* %i, align 4, !dbg !71
  %inc12 = add nsw i32 %9, 1, !dbg !71
  store i32 %inc12, i32* %i, align 4, !dbg !71
  br label %for.cond2, !dbg !73, !llvm.loop !74

for.end13:                                        ; preds = %for.cond2
  ret void, !dbg !76
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #2

; Function Attrs: nounwind uwtable
define void @bad() #0 !dbg !77 {
entry:
  %flag = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %flag, metadata !78, metadata !19), !dbg !79
  store i32 0, i32* %flag, align 4, !dbg !79
  call void @llvm.dbg.declare(metadata i32* %i, metadata !80, metadata !19), !dbg !81
  call void @llvm.dbg.declare(metadata i32* %j, metadata !82, metadata !19), !dbg !83
  %0 = load i32, i32* %flag, align 4, !dbg !84
  %cmp = icmp eq i32 %0, 0, !dbg !86
  br i1 %cmp, label %if.then, label %if.end, !dbg !87

if.then:                                          ; preds = %entry
  call void @_002_bad(), !dbg !88
  br label %if.end, !dbg !90

if.end:                                           ; preds = %if.then, %entry
  %1 = load i32, i32* %flag, align 4, !dbg !91
  %cmp1 = icmp eq i32 %1, 0, !dbg !93
  br i1 %cmp1, label %if.then2, label %if.end16, !dbg !94

if.then2:                                         ; preds = %if.end
  store i32 0, i32* %i, align 4, !dbg !95
  br label %for.cond, !dbg !98

for.cond:                                         ; preds = %for.inc13, %if.then2
  %2 = load i32, i32* %i, align 4, !dbg !99
  %cmp3 = icmp slt i32 %2, 2, !dbg !102
  br i1 %cmp3, label %for.body, label %for.end15, !dbg !103

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4, !dbg !104
  br label %for.cond4, !dbg !107

for.cond4:                                        ; preds = %for.inc, %for.body
  %3 = load i32, i32* %j, align 4, !dbg !108
  %cmp5 = icmp slt i32 %3, 2, !dbg !111
  br i1 %cmp5, label %for.body6, label %for.end, !dbg !112

for.body6:                                        ; preds = %for.cond4
  %4 = load i32, i32* %j, align 4, !dbg !113
  %idxprom = sext i32 %4 to i64, !dbg !115
  %5 = load i32, i32* %i, align 4, !dbg !116
  %idxprom7 = sext i32 %5 to i64, !dbg !115
  %6 = load i64**, i64*** @_bad, align 8, !dbg !115
  %arrayidx = getelementptr inbounds i64*, i64** %6, i64 %idxprom7, !dbg !115
  %7 = load i64*, i64** %arrayidx, align 8, !dbg !115
  %arrayidx8 = getelementptr inbounds i64, i64* %7, i64 %idxprom, !dbg !115
  %8 = load i64, i64* %arrayidx8, align 8, !dbg !117
  %add = add nsw i64 %8, 1, !dbg !117
  store i64 %add, i64* %arrayidx8, align 8, !dbg !117
  br label %for.inc, !dbg !118

for.inc:                                          ; preds = %for.body6
  %9 = load i32, i32* %j, align 4, !dbg !119
  %inc = add nsw i32 %9, 1, !dbg !119
  store i32 %inc, i32* %j, align 4, !dbg !119
  br label %for.cond4, !dbg !121, !llvm.loop !122

for.end:                                          ; preds = %for.cond4
  %10 = load i32, i32* %i, align 4, !dbg !124
  %idxprom9 = sext i32 %10 to i64, !dbg !125
  %11 = load i64**, i64*** @_bad, align 8, !dbg !125
  %arrayidx10 = getelementptr inbounds i64*, i64** %11, i64 %idxprom9, !dbg !125
  %12 = load i64*, i64** %arrayidx10, align 8, !dbg !125
  %13 = bitcast i64* %12 to i8*, !dbg !125
  call void @free(i8* %13) #3, !dbg !126
  %14 = load i32, i32* %i, align 4, !dbg !127
  %idxprom11 = sext i32 %14 to i64, !dbg !128
  %15 = load i64**, i64*** @_bad, align 8, !dbg !128
  %arrayidx12 = getelementptr inbounds i64*, i64** %15, i64 %idxprom11, !dbg !128
  store i64* null, i64** %arrayidx12, align 8, !dbg !129
  br label %for.inc13, !dbg !130

for.inc13:                                        ; preds = %for.end
  %16 = load i32, i32* %i, align 4, !dbg !131
  %inc14 = add nsw i32 %16, 1, !dbg !131
  store i32 %inc14, i32* %i, align 4, !dbg !131
  br label %for.cond, !dbg !133, !llvm.loop !134

for.end15:                                        ; preds = %for.cond
  %17 = load i64**, i64*** @_bad, align 8, !dbg !136
  %18 = bitcast i64** %17 to i8*, !dbg !136
  call void @free(i8* %18) #3, !dbg !137
  store i64** null, i64*** @_bad, align 8, !dbg !138
  br label %if.end16, !dbg !139

if.end16:                                         ; preds = %for.end15, %if.end
  ret void, !dbg !140
}

; Function Attrs: nounwind
declare void @free(i8*) #2

; Function Attrs: nounwind uwtable
define void @_002_good() #0 !dbg !141 {
entry:
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %i, metadata !142, metadata !19), !dbg !143
  call void @llvm.dbg.declare(metadata i32* %j, metadata !144, metadata !19), !dbg !145
  %call = call noalias i8* @malloc(i64 80) #3, !dbg !146
  %0 = bitcast i8* %call to i64**, !dbg !147
  store i64** %0, i64*** @_good, align 8, !dbg !148
  store i32 0, i32* %i, align 4, !dbg !149
  br label %for.cond, !dbg !151

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i32, i32* %i, align 4, !dbg !152
  %cmp = icmp slt i32 %1, 2, !dbg !155
  br i1 %cmp, label %for.body, label %for.end, !dbg !156

for.body:                                         ; preds = %for.cond
  %call1 = call noalias i8* @malloc(i64 80) #3, !dbg !157
  %2 = bitcast i8* %call1 to i64*, !dbg !159
  %3 = load i32, i32* %i, align 4, !dbg !160
  %idxprom = sext i32 %3 to i64, !dbg !161
  %4 = load i64**, i64*** @_good, align 8, !dbg !161
  %arrayidx = getelementptr inbounds i64*, i64** %4, i64 %idxprom, !dbg !161
  store i64* %2, i64** %arrayidx, align 8, !dbg !162
  br label %for.inc, !dbg !163

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !164
  %inc = add nsw i32 %5, 1, !dbg !164
  store i32 %inc, i32* %i, align 4, !dbg !164
  br label %for.cond, !dbg !166, !llvm.loop !167

for.end:                                          ; preds = %for.cond
  store i32 0, i32* %i, align 4, !dbg !169
  br label %for.cond2, !dbg !171

for.cond2:                                        ; preds = %for.inc15, %for.end
  %6 = load i32, i32* %i, align 4, !dbg !172
  %cmp3 = icmp slt i32 %6, 2, !dbg !175
  br i1 %cmp3, label %for.body4, label %for.end17, !dbg !176

for.body4:                                        ; preds = %for.cond2
  store i32 0, i32* %j, align 4, !dbg !177
  br label %for.cond5, !dbg !180

for.cond5:                                        ; preds = %for.inc12, %for.body4
  %7 = load i32, i32* %j, align 4, !dbg !181
  %cmp6 = icmp slt i32 %7, 2, !dbg !184
  br i1 %cmp6, label %for.body7, label %for.end14, !dbg !185

for.body7:                                        ; preds = %for.cond5
  %8 = load i32, i32* %i, align 4, !dbg !186
  %conv = sext i32 %8 to i64, !dbg !186
  %9 = load i32, i32* %j, align 4, !dbg !188
  %idxprom8 = sext i32 %9 to i64, !dbg !189
  %10 = load i32, i32* %i, align 4, !dbg !190
  %idxprom9 = sext i32 %10 to i64, !dbg !189
  %11 = load i64**, i64*** @_good, align 8, !dbg !189
  %arrayidx10 = getelementptr inbounds i64*, i64** %11, i64 %idxprom9, !dbg !189
  %12 = load i64*, i64** %arrayidx10, align 8, !dbg !189
  %arrayidx11 = getelementptr inbounds i64, i64* %12, i64 %idxprom8, !dbg !189
  store i64 %conv, i64* %arrayidx11, align 8, !dbg !191
  br label %for.inc12, !dbg !192

for.inc12:                                        ; preds = %for.body7
  %13 = load i32, i32* %j, align 4, !dbg !193
  %inc13 = add nsw i32 %13, 1, !dbg !193
  store i32 %inc13, i32* %j, align 4, !dbg !193
  br label %for.cond5, !dbg !195, !llvm.loop !196

for.end14:                                        ; preds = %for.cond5
  br label %for.inc15, !dbg !198

for.inc15:                                        ; preds = %for.end14
  %14 = load i32, i32* %i, align 4, !dbg !199
  %inc16 = add nsw i32 %14, 1, !dbg !199
  store i32 %inc16, i32* %i, align 4, !dbg !199
  br label %for.cond2, !dbg !201, !llvm.loop !202

for.end17:                                        ; preds = %for.cond2
  ret void, !dbg !204
}

; Function Attrs: nounwind uwtable
define void @good() #0 !dbg !205 {
entry:
  %flag = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %flag, metadata !206, metadata !19), !dbg !207
  store i32 0, i32* %flag, align 4, !dbg !207
  call void @llvm.dbg.declare(metadata i32* %i, metadata !208, metadata !19), !dbg !209
  call void @llvm.dbg.declare(metadata i32* %j, metadata !210, metadata !19), !dbg !211
  %0 = load i32, i32* %flag, align 4, !dbg !212
  %cmp = icmp eq i32 %0, 0, !dbg !214
  br i1 %cmp, label %if.then, label %if.end, !dbg !215

if.then:                                          ; preds = %entry
  call void @_002_good(), !dbg !216
  br label %if.end, !dbg !218

if.end:                                           ; preds = %if.then, %entry
  %1 = load i32, i32* %flag, align 4, !dbg !219
  %cmp1 = icmp eq i32 %1, 0, !dbg !221
  br i1 %cmp1, label %if.then2, label %if.end16, !dbg !222

if.then2:                                         ; preds = %if.end
  store i32 0, i32* %i, align 4, !dbg !223
  br label %for.cond, !dbg !226

for.cond:                                         ; preds = %for.inc13, %if.then2
  %2 = load i32, i32* %i, align 4, !dbg !227
  %cmp3 = icmp slt i32 %2, 10, !dbg !230
  br i1 %cmp3, label %for.body, label %for.end15, !dbg !231

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4, !dbg !232
  br label %for.cond4, !dbg !235

for.cond4:                                        ; preds = %for.inc, %for.body
  %3 = load i32, i32* %j, align 4, !dbg !236
  %cmp5 = icmp slt i32 %3, 10, !dbg !239
  br i1 %cmp5, label %for.body6, label %for.end, !dbg !240

for.body6:                                        ; preds = %for.cond4
  %4 = load i32, i32* %j, align 4, !dbg !241
  %idxprom = sext i32 %4 to i64, !dbg !243
  %5 = load i32, i32* %i, align 4, !dbg !244
  %idxprom7 = sext i32 %5 to i64, !dbg !243
  %6 = load i64**, i64*** @_good, align 8, !dbg !243
  %arrayidx = getelementptr inbounds i64*, i64** %6, i64 %idxprom7, !dbg !243
  %7 = load i64*, i64** %arrayidx, align 8, !dbg !243
  %arrayidx8 = getelementptr inbounds i64, i64* %7, i64 %idxprom, !dbg !243
  %8 = load i64, i64* %arrayidx8, align 8, !dbg !245
  %add = add nsw i64 %8, 1, !dbg !245
  store i64 %add, i64* %arrayidx8, align 8, !dbg !245
  br label %for.inc, !dbg !246

for.inc:                                          ; preds = %for.body6
  %9 = load i32, i32* %j, align 4, !dbg !247
  %inc = add nsw i32 %9, 1, !dbg !247
  store i32 %inc, i32* %j, align 4, !dbg !247
  br label %for.cond4, !dbg !249, !llvm.loop !250

for.end:                                          ; preds = %for.cond4
  %10 = load i32, i32* %i, align 4, !dbg !252
  %idxprom9 = sext i32 %10 to i64, !dbg !253
  %11 = load i64**, i64*** @_good, align 8, !dbg !253
  %arrayidx10 = getelementptr inbounds i64*, i64** %11, i64 %idxprom9, !dbg !253
  %12 = load i64*, i64** %arrayidx10, align 8, !dbg !253
  %13 = bitcast i64* %12 to i8*, !dbg !253
  call void @free(i8* %13) #3, !dbg !254
  %14 = load i32, i32* %i, align 4, !dbg !255
  %idxprom11 = sext i32 %14 to i64, !dbg !256
  %15 = load i64**, i64*** @_good, align 8, !dbg !256
  %arrayidx12 = getelementptr inbounds i64*, i64** %15, i64 %idxprom11, !dbg !256
  store i64* null, i64** %arrayidx12, align 8, !dbg !257
  br label %for.inc13, !dbg !258

for.inc13:                                        ; preds = %for.end
  %16 = load i32, i32* %i, align 4, !dbg !259
  %inc14 = add nsw i32 %16, 1, !dbg !259
  store i32 %inc14, i32* %i, align 4, !dbg !259
  br label %for.cond, !dbg !261, !llvm.loop !262

for.end15:                                        ; preds = %for.cond
  %17 = load i64**, i64*** @_good, align 8, !dbg !264
  %18 = bitcast i64** %17 to i8*, !dbg !264
  call void @free(i8* %18) #3, !dbg !265
  store i64** null, i64*** @_good, align 8, !dbg !266
  br label %if.end16, !dbg !267

if.end16:                                         ; preds = %for.end15, %if.end
  ret void, !dbg !268
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !269 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @good(), !dbg !272
  call void @bad(), !dbg !273
  ret i32 0, !dbg !274
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (tags/RELEASE_390/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, globals: !7)
!1 = !DIFile(filename: "457_uninit_memory_access_8.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/itc/457")
!2 = !{}
!3 = !{!4, !5}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64, align: 64)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64, align: 64)
!6 = !DIBasicType(name: "long int", size: 64, align: 64, encoding: DW_ATE_signed)
!7 = !{!8, !10}
!8 = distinct !DIGlobalVariable(name: "_bad", scope: !0, file: !9, line: 5, type: !4, isLocal: false, isDefinition: true, variable: i64*** @_bad)
!9 = !DIFile(filename: "./457_uninit_memory_access_8.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/itc/457")
!10 = distinct !DIGlobalVariable(name: "_good", scope: !0, file: !9, line: 54, type: !4, isLocal: false, isDefinition: true, variable: i64*** @_good)
!11 = !{i32 2, !"Dwarf Version", i32 4}
!12 = !{i32 2, !"Debug Info Version", i32 3}
!13 = !{!"clang version 3.9.0 (tags/RELEASE_390/final)"}
!14 = distinct !DISubprogram(name: "_002_bad", scope: !9, file: !9, line: 12, type: !15, isLocal: false, isDefinition: true, scopeLine: 13, isOptimized: false, unit: !0, variables: !2)
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !DILocalVariable(name: "i", scope: !14, file: !9, line: 14, type: !18)
!18 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!19 = !DIExpression()
!20 = !DILocation(line: 14, column: 6, scope: !14)
!21 = !DILocalVariable(name: "j", scope: !14, file: !9, line: 14, type: !18)
!22 = !DILocation(line: 14, column: 8, scope: !14)
!23 = !DILocation(line: 15, column: 16, scope: !14)
!24 = !DILocation(line: 15, column: 7, scope: !14)
!25 = !DILocation(line: 15, column: 6, scope: !14)
!26 = !DILocation(line: 17, column: 7, scope: !27)
!27 = distinct !DILexicalBlock(scope: !14, file: !9, line: 17, column: 2)
!28 = !DILocation(line: 17, column: 6, scope: !27)
!29 = !DILocation(line: 17, column: 10, scope: !30)
!30 = !DILexicalBlockFile(scope: !31, file: !9, discriminator: 1)
!31 = distinct !DILexicalBlock(scope: !27, file: !9, line: 17, column: 2)
!32 = !DILocation(line: 17, column: 11, scope: !30)
!33 = !DILocation(line: 17, column: 2, scope: !30)
!34 = !DILocation(line: 19, column: 19, scope: !35)
!35 = distinct !DILexicalBlock(scope: !31, file: !9, line: 18, column: 2)
!36 = !DILocation(line: 19, column: 11, scope: !35)
!37 = !DILocation(line: 19, column: 8, scope: !35)
!38 = !DILocation(line: 19, column: 3, scope: !35)
!39 = !DILocation(line: 19, column: 10, scope: !35)
!40 = !DILocation(line: 20, column: 2, scope: !35)
!41 = !DILocation(line: 17, column: 15, scope: !42)
!42 = !DILexicalBlockFile(scope: !31, file: !9, discriminator: 2)
!43 = !DILocation(line: 17, column: 2, scope: !42)
!44 = distinct !{!44, !45}
!45 = !DILocation(line: 17, column: 2, scope: !14)
!46 = !DILocation(line: 21, column: 7, scope: !47)
!47 = distinct !DILexicalBlock(scope: !14, file: !9, line: 21, column: 2)
!48 = !DILocation(line: 21, column: 6, scope: !47)
!49 = !DILocation(line: 21, column: 10, scope: !50)
!50 = !DILexicalBlockFile(scope: !51, file: !9, discriminator: 1)
!51 = distinct !DILexicalBlock(scope: !47, file: !9, line: 21, column: 2)
!52 = !DILocation(line: 21, column: 11, scope: !50)
!53 = !DILocation(line: 21, column: 2, scope: !50)
!54 = !DILocation(line: 23, column: 8, scope: !55)
!55 = distinct !DILexicalBlock(scope: !56, file: !9, line: 23, column: 3)
!56 = distinct !DILexicalBlock(scope: !51, file: !9, line: 22, column: 2)
!57 = !DILocation(line: 23, column: 7, scope: !55)
!58 = !DILocation(line: 23, column: 11, scope: !59)
!59 = !DILexicalBlockFile(scope: !60, file: !9, discriminator: 1)
!60 = distinct !DILexicalBlock(scope: !55, file: !9, line: 23, column: 3)
!61 = !DILocation(line: 23, column: 12, scope: !59)
!62 = !DILocation(line: 23, column: 3, scope: !59)
!63 = !DILocation(line: 26, column: 3, scope: !64)
!64 = distinct !DILexicalBlock(scope: !60, file: !9, line: 24, column: 3)
!65 = !DILocation(line: 23, column: 16, scope: !66)
!66 = !DILexicalBlockFile(scope: !60, file: !9, discriminator: 2)
!67 = !DILocation(line: 23, column: 3, scope: !66)
!68 = distinct !{!68, !69}
!69 = !DILocation(line: 23, column: 3, scope: !56)
!70 = !DILocation(line: 27, column: 2, scope: !56)
!71 = !DILocation(line: 21, column: 15, scope: !72)
!72 = !DILexicalBlockFile(scope: !51, file: !9, discriminator: 2)
!73 = !DILocation(line: 21, column: 2, scope: !72)
!74 = distinct !{!74, !75}
!75 = !DILocation(line: 21, column: 2, scope: !14)
!76 = !DILocation(line: 28, column: 1, scope: !14)
!77 = distinct !DISubprogram(name: "bad", scope: !9, file: !9, line: 30, type: !15, isLocal: false, isDefinition: true, scopeLine: 31, isOptimized: false, unit: !0, variables: !2)
!78 = !DILocalVariable(name: "flag", scope: !77, file: !9, line: 32, type: !18)
!79 = !DILocation(line: 32, column: 6, scope: !77)
!80 = !DILocalVariable(name: "i", scope: !77, file: !9, line: 32, type: !18)
!81 = !DILocation(line: 32, column: 13, scope: !77)
!82 = !DILocalVariable(name: "j", scope: !77, file: !9, line: 32, type: !18)
!83 = !DILocation(line: 32, column: 15, scope: !77)
!84 = !DILocation(line: 34, column: 5, scope: !85)
!85 = distinct !DILexicalBlock(scope: !77, file: !9, line: 34, column: 5)
!86 = !DILocation(line: 34, column: 9, scope: !85)
!87 = !DILocation(line: 34, column: 5, scope: !77)
!88 = !DILocation(line: 36, column: 3, scope: !89)
!89 = distinct !DILexicalBlock(scope: !85, file: !9, line: 35, column: 2)
!90 = !DILocation(line: 37, column: 2, scope: !89)
!91 = !DILocation(line: 38, column: 9, scope: !92)
!92 = distinct !DILexicalBlock(scope: !77, file: !9, line: 38, column: 8)
!93 = !DILocation(line: 38, column: 14, scope: !92)
!94 = !DILocation(line: 38, column: 8, scope: !77)
!95 = !DILocation(line: 40, column: 8, scope: !96)
!96 = distinct !DILexicalBlock(scope: !97, file: !9, line: 40, column: 3)
!97 = distinct !DILexicalBlock(scope: !92, file: !9, line: 39, column: 2)
!98 = !DILocation(line: 40, column: 7, scope: !96)
!99 = !DILocation(line: 40, column: 11, scope: !100)
!100 = !DILexicalBlockFile(scope: !101, file: !9, discriminator: 1)
!101 = distinct !DILexicalBlock(scope: !96, file: !9, line: 40, column: 3)
!102 = !DILocation(line: 40, column: 12, scope: !100)
!103 = !DILocation(line: 40, column: 3, scope: !100)
!104 = !DILocation(line: 42, column: 9, scope: !105)
!105 = distinct !DILexicalBlock(scope: !106, file: !9, line: 42, column: 4)
!106 = distinct !DILexicalBlock(scope: !101, file: !9, line: 41, column: 3)
!107 = !DILocation(line: 42, column: 8, scope: !105)
!108 = !DILocation(line: 42, column: 12, scope: !109)
!109 = !DILexicalBlockFile(scope: !110, file: !9, discriminator: 1)
!110 = distinct !DILexicalBlock(scope: !105, file: !9, line: 42, column: 4)
!111 = !DILocation(line: 42, column: 13, scope: !109)
!112 = !DILocation(line: 42, column: 4, scope: !109)
!113 = !DILocation(line: 44, column: 13, scope: !114)
!114 = distinct !DILexicalBlock(scope: !110, file: !9, line: 43, column: 4)
!115 = !DILocation(line: 44, column: 5, scope: !114)
!116 = !DILocation(line: 44, column: 10, scope: !114)
!117 = !DILocation(line: 44, column: 16, scope: !114)
!118 = !DILocation(line: 45, column: 4, scope: !114)
!119 = !DILocation(line: 42, column: 17, scope: !120)
!120 = !DILexicalBlockFile(scope: !110, file: !9, discriminator: 2)
!121 = !DILocation(line: 42, column: 4, scope: !120)
!122 = distinct !{!122, !123}
!123 = !DILocation(line: 42, column: 4, scope: !106)
!124 = !DILocation(line: 46, column: 15, scope: !106)
!125 = !DILocation(line: 46, column: 10, scope: !106)
!126 = !DILocation(line: 46, column: 4, scope: !106)
!127 = !DILocation(line: 47, column: 9, scope: !106)
!128 = !DILocation(line: 47, column: 4, scope: !106)
!129 = !DILocation(line: 47, column: 12, scope: !106)
!130 = !DILocation(line: 48, column: 5, scope: !106)
!131 = !DILocation(line: 40, column: 16, scope: !132)
!132 = !DILexicalBlockFile(scope: !101, file: !9, discriminator: 2)
!133 = !DILocation(line: 40, column: 3, scope: !132)
!134 = distinct !{!134, !135}
!135 = !DILocation(line: 40, column: 3, scope: !97)
!136 = !DILocation(line: 49, column: 11, scope: !97)
!137 = !DILocation(line: 49, column: 6, scope: !97)
!138 = !DILocation(line: 50, column: 11, scope: !97)
!139 = !DILocation(line: 51, column: 2, scope: !97)
!140 = !DILocation(line: 52, column: 1, scope: !77)
!141 = distinct !DISubprogram(name: "_002_good", scope: !9, file: !9, line: 60, type: !15, isLocal: false, isDefinition: true, scopeLine: 61, isOptimized: false, unit: !0, variables: !2)
!142 = !DILocalVariable(name: "i", scope: !141, file: !9, line: 62, type: !18)
!143 = !DILocation(line: 62, column: 6, scope: !141)
!144 = !DILocalVariable(name: "j", scope: !141, file: !9, line: 62, type: !18)
!145 = !DILocation(line: 62, column: 8, scope: !141)
!146 = !DILocation(line: 63, column: 17, scope: !141)
!147 = !DILocation(line: 63, column: 8, scope: !141)
!148 = !DILocation(line: 63, column: 7, scope: !141)
!149 = !DILocation(line: 65, column: 7, scope: !150)
!150 = distinct !DILexicalBlock(scope: !141, file: !9, line: 65, column: 2)
!151 = !DILocation(line: 65, column: 6, scope: !150)
!152 = !DILocation(line: 65, column: 10, scope: !153)
!153 = !DILexicalBlockFile(scope: !154, file: !9, discriminator: 1)
!154 = distinct !DILexicalBlock(scope: !150, file: !9, line: 65, column: 2)
!155 = !DILocation(line: 65, column: 11, scope: !153)
!156 = !DILocation(line: 65, column: 2, scope: !153)
!157 = !DILocation(line: 67, column: 20, scope: !158)
!158 = distinct !DILexicalBlock(scope: !154, file: !9, line: 66, column: 2)
!159 = !DILocation(line: 67, column: 12, scope: !158)
!160 = !DILocation(line: 67, column: 9, scope: !158)
!161 = !DILocation(line: 67, column: 3, scope: !158)
!162 = !DILocation(line: 67, column: 11, scope: !158)
!163 = !DILocation(line: 68, column: 2, scope: !158)
!164 = !DILocation(line: 65, column: 15, scope: !165)
!165 = !DILexicalBlockFile(scope: !154, file: !9, discriminator: 2)
!166 = !DILocation(line: 65, column: 2, scope: !165)
!167 = distinct !{!167, !168}
!168 = !DILocation(line: 65, column: 2, scope: !141)
!169 = !DILocation(line: 69, column: 7, scope: !170)
!170 = distinct !DILexicalBlock(scope: !141, file: !9, line: 69, column: 2)
!171 = !DILocation(line: 69, column: 6, scope: !170)
!172 = !DILocation(line: 69, column: 10, scope: !173)
!173 = !DILexicalBlockFile(scope: !174, file: !9, discriminator: 1)
!174 = distinct !DILexicalBlock(scope: !170, file: !9, line: 69, column: 2)
!175 = !DILocation(line: 69, column: 11, scope: !173)
!176 = !DILocation(line: 69, column: 2, scope: !173)
!177 = !DILocation(line: 71, column: 8, scope: !178)
!178 = distinct !DILexicalBlock(scope: !179, file: !9, line: 71, column: 3)
!179 = distinct !DILexicalBlock(scope: !174, file: !9, line: 70, column: 2)
!180 = !DILocation(line: 71, column: 7, scope: !178)
!181 = !DILocation(line: 71, column: 11, scope: !182)
!182 = !DILexicalBlockFile(scope: !183, file: !9, discriminator: 1)
!183 = distinct !DILexicalBlock(scope: !178, file: !9, line: 71, column: 3)
!184 = !DILocation(line: 71, column: 12, scope: !182)
!185 = !DILocation(line: 71, column: 3, scope: !182)
!186 = !DILocation(line: 73, column: 16, scope: !187)
!187 = distinct !DILexicalBlock(scope: !183, file: !9, line: 72, column: 3)
!188 = !DILocation(line: 73, column: 13, scope: !187)
!189 = !DILocation(line: 73, column: 4, scope: !187)
!190 = !DILocation(line: 73, column: 10, scope: !187)
!191 = !DILocation(line: 73, column: 15, scope: !187)
!192 = !DILocation(line: 74, column: 3, scope: !187)
!193 = !DILocation(line: 71, column: 16, scope: !194)
!194 = !DILexicalBlockFile(scope: !183, file: !9, discriminator: 2)
!195 = !DILocation(line: 71, column: 3, scope: !194)
!196 = distinct !{!196, !197}
!197 = !DILocation(line: 71, column: 3, scope: !179)
!198 = !DILocation(line: 75, column: 2, scope: !179)
!199 = !DILocation(line: 69, column: 15, scope: !200)
!200 = !DILexicalBlockFile(scope: !174, file: !9, discriminator: 2)
!201 = !DILocation(line: 69, column: 2, scope: !200)
!202 = distinct !{!202, !203}
!203 = !DILocation(line: 69, column: 2, scope: !141)
!204 = !DILocation(line: 76, column: 1, scope: !141)
!205 = distinct !DISubprogram(name: "good", scope: !9, file: !9, line: 78, type: !15, isLocal: false, isDefinition: true, scopeLine: 79, isOptimized: false, unit: !0, variables: !2)
!206 = !DILocalVariable(name: "flag", scope: !205, file: !9, line: 80, type: !18)
!207 = !DILocation(line: 80, column: 6, scope: !205)
!208 = !DILocalVariable(name: "i", scope: !205, file: !9, line: 80, type: !18)
!209 = !DILocation(line: 80, column: 13, scope: !205)
!210 = !DILocalVariable(name: "j", scope: !205, file: !9, line: 80, type: !18)
!211 = !DILocation(line: 80, column: 15, scope: !205)
!212 = !DILocation(line: 82, column: 6, scope: !213)
!213 = distinct !DILexicalBlock(scope: !205, file: !9, line: 82, column: 5)
!214 = !DILocation(line: 82, column: 11, scope: !213)
!215 = !DILocation(line: 82, column: 5, scope: !205)
!216 = !DILocation(line: 84, column: 3, scope: !217)
!217 = distinct !DILexicalBlock(scope: !213, file: !9, line: 83, column: 2)
!218 = !DILocation(line: 85, column: 2, scope: !217)
!219 = !DILocation(line: 86, column: 9, scope: !220)
!220 = distinct !DILexicalBlock(scope: !205, file: !9, line: 86, column: 8)
!221 = !DILocation(line: 86, column: 14, scope: !220)
!222 = !DILocation(line: 86, column: 8, scope: !205)
!223 = !DILocation(line: 88, column: 8, scope: !224)
!224 = distinct !DILexicalBlock(scope: !225, file: !9, line: 88, column: 3)
!225 = distinct !DILexicalBlock(scope: !220, file: !9, line: 87, column: 2)
!226 = !DILocation(line: 88, column: 7, scope: !224)
!227 = !DILocation(line: 88, column: 11, scope: !228)
!228 = !DILexicalBlockFile(scope: !229, file: !9, discriminator: 1)
!229 = distinct !DILexicalBlock(scope: !224, file: !9, line: 88, column: 3)
!230 = !DILocation(line: 88, column: 12, scope: !228)
!231 = !DILocation(line: 88, column: 3, scope: !228)
!232 = !DILocation(line: 90, column: 9, scope: !233)
!233 = distinct !DILexicalBlock(scope: !234, file: !9, line: 90, column: 4)
!234 = distinct !DILexicalBlock(scope: !229, file: !9, line: 89, column: 3)
!235 = !DILocation(line: 90, column: 8, scope: !233)
!236 = !DILocation(line: 90, column: 12, scope: !237)
!237 = !DILexicalBlockFile(scope: !238, file: !9, discriminator: 1)
!238 = distinct !DILexicalBlock(scope: !233, file: !9, line: 90, column: 4)
!239 = !DILocation(line: 90, column: 13, scope: !237)
!240 = !DILocation(line: 90, column: 4, scope: !237)
!241 = !DILocation(line: 92, column: 14, scope: !242)
!242 = distinct !DILexicalBlock(scope: !238, file: !9, line: 91, column: 4)
!243 = !DILocation(line: 92, column: 5, scope: !242)
!244 = !DILocation(line: 92, column: 11, scope: !242)
!245 = !DILocation(line: 92, column: 17, scope: !242)
!246 = !DILocation(line: 93, column: 4, scope: !242)
!247 = !DILocation(line: 90, column: 18, scope: !248)
!248 = !DILexicalBlockFile(scope: !238, file: !9, discriminator: 2)
!249 = !DILocation(line: 90, column: 4, scope: !248)
!250 = distinct !{!250, !251}
!251 = !DILocation(line: 90, column: 4, scope: !234)
!252 = !DILocation(line: 94, column: 16, scope: !234)
!253 = !DILocation(line: 94, column: 10, scope: !234)
!254 = !DILocation(line: 94, column: 4, scope: !234)
!255 = !DILocation(line: 95, column: 10, scope: !234)
!256 = !DILocation(line: 95, column: 4, scope: !234)
!257 = !DILocation(line: 95, column: 13, scope: !234)
!258 = !DILocation(line: 96, column: 5, scope: !234)
!259 = !DILocation(line: 88, column: 17, scope: !260)
!260 = !DILexicalBlockFile(scope: !229, file: !9, discriminator: 2)
!261 = !DILocation(line: 88, column: 3, scope: !260)
!262 = distinct !{!262, !263}
!263 = !DILocation(line: 88, column: 3, scope: !225)
!264 = !DILocation(line: 97, column: 11, scope: !225)
!265 = !DILocation(line: 97, column: 6, scope: !225)
!266 = !DILocation(line: 98, column: 12, scope: !225)
!267 = !DILocation(line: 99, column: 2, scope: !225)
!268 = !DILocation(line: 100, column: 1, scope: !205)
!269 = distinct !DISubprogram(name: "main", scope: !9, file: !9, line: 102, type: !270, isLocal: false, isDefinition: true, scopeLine: 102, isOptimized: false, unit: !0, variables: !2)
!270 = !DISubroutineType(types: !271)
!271 = !{!18}
!272 = !DILocation(line: 103, column: 2, scope: !269)
!273 = !DILocation(line: 104, column: 2, scope: !269)
!274 = !DILocation(line: 105, column: 2, scope: !269)
