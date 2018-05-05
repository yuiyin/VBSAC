; ModuleID = './401_memory_leak_4.c'
source_filename = "./401_memory_leak_4.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.memory_leak_004_s_001 = type { i32, i32, i8* }

@.str = private unnamed_addr constant [17 x i8] c"This is a string\00", align 1

; Function Attrs: nounwind uwtable
define void @memory_leak_004_bad() #0 !dbg !19 {
entry:
  %s = alloca %struct.memory_leak_004_s_001*, align 8
  %s1 = alloca i8*, align 8
  %i = alloca i32, align 4
  call void @llvm.dbg.declare(metadata %struct.memory_leak_004_s_001** %s, metadata !22, metadata !23), !dbg !24
  %call = call noalias i8* @calloc(i64 5, i64 16) #3, !dbg !25
  %0 = bitcast i8* %call to %struct.memory_leak_004_s_001*, !dbg !26
  store %struct.memory_leak_004_s_001* %0, %struct.memory_leak_004_s_001** %s, align 8, !dbg !24
  %1 = load %struct.memory_leak_004_s_001*, %struct.memory_leak_004_s_001** %s, align 8, !dbg !27
  %cmp = icmp eq %struct.memory_leak_004_s_001* %1, null, !dbg !29
  br i1 %cmp, label %if.then, label %if.end, !dbg !30

if.then:                                          ; preds = %entry
  br label %return, !dbg !31

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata i8** %s1, metadata !33, metadata !23), !dbg !34
  store i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str, i32 0, i32 0), i8** %s1, align 8, !dbg !34
  call void @llvm.dbg.declare(metadata i32* %i, metadata !35, metadata !23), !dbg !36
  %2 = load %struct.memory_leak_004_s_001*, %struct.memory_leak_004_s_001** %s, align 8, !dbg !37
  %cmp1 = icmp ne %struct.memory_leak_004_s_001* %2, null, !dbg !39
  br i1 %cmp1, label %if.then2, label %if.end11, !dbg !40

if.then2:                                         ; preds = %if.end
  store i32 0, i32* %i, align 4, !dbg !41
  br label %for.cond, !dbg !43

for.cond:                                         ; preds = %for.inc, %if.then2
  %3 = load i32, i32* %i, align 4, !dbg !44
  %cmp3 = icmp slt i32 %3, 5, !dbg !47
  br i1 %cmp3, label %for.body, label %for.end, !dbg !48

for.body:                                         ; preds = %for.cond
  %call4 = call noalias i8* @malloc(i64 25) #3, !dbg !49
  %4 = load %struct.memory_leak_004_s_001*, %struct.memory_leak_004_s_001** %s, align 8, !dbg !51
  %5 = load i32, i32* %i, align 4, !dbg !52
  %idx.ext = sext i32 %5 to i64, !dbg !53
  %add.ptr = getelementptr inbounds %struct.memory_leak_004_s_001, %struct.memory_leak_004_s_001* %4, i64 %idx.ext, !dbg !53
  %buf = getelementptr inbounds %struct.memory_leak_004_s_001, %struct.memory_leak_004_s_001* %add.ptr, i32 0, i32 2, !dbg !54
  store i8* %call4, i8** %buf, align 8, !dbg !55
  %6 = load %struct.memory_leak_004_s_001*, %struct.memory_leak_004_s_001** %s, align 8, !dbg !56
  %7 = load i32, i32* %i, align 4, !dbg !58
  %idx.ext5 = sext i32 %7 to i64, !dbg !59
  %add.ptr6 = getelementptr inbounds %struct.memory_leak_004_s_001, %struct.memory_leak_004_s_001* %6, i64 %idx.ext5, !dbg !59
  %buf7 = getelementptr inbounds %struct.memory_leak_004_s_001, %struct.memory_leak_004_s_001* %add.ptr6, i32 0, i32 2, !dbg !60
  %8 = load i8*, i8** %buf7, align 8, !dbg !60
  %cmp8 = icmp eq i8* %8, null, !dbg !61
  br i1 %cmp8, label %if.then9, label %if.end10, !dbg !62

if.then9:                                         ; preds = %for.body
  br label %return, !dbg !63

if.end10:                                         ; preds = %for.body
  br label %for.inc, !dbg !65

for.inc:                                          ; preds = %if.end10
  %9 = load i32, i32* %i, align 4, !dbg !66
  %inc = add nsw i32 %9, 1, !dbg !66
  store i32 %inc, i32* %i, align 4, !dbg !66
  br label %for.cond, !dbg !68, !llvm.loop !69

for.end:                                          ; preds = %for.cond
  br label %if.end11, !dbg !71

if.end11:                                         ; preds = %for.end, %if.end
  %10 = load %struct.memory_leak_004_s_001*, %struct.memory_leak_004_s_001** %s, align 8, !dbg !73
  %add.ptr12 = getelementptr inbounds %struct.memory_leak_004_s_001, %struct.memory_leak_004_s_001* %10, i64 4, !dbg !74
  %buf13 = getelementptr inbounds %struct.memory_leak_004_s_001, %struct.memory_leak_004_s_001* %add.ptr12, i32 0, i32 2, !dbg !75
  %11 = load i8*, i8** %buf13, align 8, !dbg !75
  %12 = load i8*, i8** %s1, align 8, !dbg !76
  %call14 = call i8* @strcpy(i8* %11, i8* %12) #3, !dbg !77
  store i32 0, i32* %i, align 4, !dbg !78
  br label %for.cond15, !dbg !80

for.cond15:                                       ; preds = %for.inc18, %if.end11
  %13 = load i32, i32* %i, align 4, !dbg !81
  %cmp16 = icmp slt i32 %13, 5, !dbg !84
  br i1 %cmp16, label %for.body17, label %for.end20, !dbg !85

for.body17:                                       ; preds = %for.cond15
  br label %for.inc18, !dbg !86

for.inc18:                                        ; preds = %for.body17
  %14 = load i32, i32* %i, align 4, !dbg !88
  %inc19 = add nsw i32 %14, 1, !dbg !88
  store i32 %inc19, i32* %i, align 4, !dbg !88
  br label %for.cond15, !dbg !90, !llvm.loop !91

for.end20:                                        ; preds = %for.cond15
  %15 = load %struct.memory_leak_004_s_001*, %struct.memory_leak_004_s_001** %s, align 8, !dbg !93
  %16 = bitcast %struct.memory_leak_004_s_001* %15 to i8*, !dbg !93
  call void @free(i8* %16) #3, !dbg !94
  br label %return, !dbg !95

return:                                           ; preds = %for.end20, %if.then9, %if.then
  ret void, !dbg !96
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare noalias i8* @calloc(i64, i64) #2

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #2

; Function Attrs: nounwind
declare i8* @strcpy(i8*, i8*) #2

; Function Attrs: nounwind
declare void @free(i8*) #2

; Function Attrs: nounwind uwtable
define void @memory_leak_004_good() #0 !dbg !98 {
entry:
  %s = alloca %struct.memory_leak_004_s_001*, align 8
  %s1 = alloca i8*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  call void @llvm.dbg.declare(metadata %struct.memory_leak_004_s_001** %s, metadata !99, metadata !23), !dbg !100
  %call = call noalias i8* @calloc(i64 5, i64 16) #3, !dbg !101
  %0 = bitcast i8* %call to %struct.memory_leak_004_s_001*, !dbg !102
  store %struct.memory_leak_004_s_001* %0, %struct.memory_leak_004_s_001** %s, align 8, !dbg !100
  %1 = load %struct.memory_leak_004_s_001*, %struct.memory_leak_004_s_001** %s, align 8, !dbg !103
  %cmp = icmp eq %struct.memory_leak_004_s_001* %1, null, !dbg !105
  br i1 %cmp, label %if.then, label %if.end, !dbg !106

if.then:                                          ; preds = %entry
  br label %return, !dbg !107

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata i8** %s1, metadata !109, metadata !23), !dbg !110
  store i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str, i32 0, i32 0), i8** %s1, align 8, !dbg !110
  call void @llvm.dbg.declare(metadata i32* %i, metadata !111, metadata !23), !dbg !112
  %2 = load %struct.memory_leak_004_s_001*, %struct.memory_leak_004_s_001** %s, align 8, !dbg !113
  %cmp1 = icmp ne %struct.memory_leak_004_s_001* %2, null, !dbg !115
  br i1 %cmp1, label %if.then2, label %if.end20, !dbg !116

if.then2:                                         ; preds = %if.end
  store i32 0, i32* %i, align 4, !dbg !117
  br label %for.cond, !dbg !119

for.cond:                                         ; preds = %for.inc17, %if.then2
  %3 = load i32, i32* %i, align 4, !dbg !120
  %cmp3 = icmp slt i32 %3, 5, !dbg !123
  br i1 %cmp3, label %for.body, label %for.end19, !dbg !124

for.body:                                         ; preds = %for.cond
  %call4 = call noalias i8* @malloc(i64 25) #3, !dbg !125
  %4 = load %struct.memory_leak_004_s_001*, %struct.memory_leak_004_s_001** %s, align 8, !dbg !127
  %5 = load i32, i32* %i, align 4, !dbg !128
  %idx.ext = sext i32 %5 to i64, !dbg !129
  %add.ptr = getelementptr inbounds %struct.memory_leak_004_s_001, %struct.memory_leak_004_s_001* %4, i64 %idx.ext, !dbg !129
  %buf = getelementptr inbounds %struct.memory_leak_004_s_001, %struct.memory_leak_004_s_001* %add.ptr, i32 0, i32 2, !dbg !130
  store i8* %call4, i8** %buf, align 8, !dbg !131
  %6 = load %struct.memory_leak_004_s_001*, %struct.memory_leak_004_s_001** %s, align 8, !dbg !132
  %7 = load i32, i32* %i, align 4, !dbg !134
  %idx.ext5 = sext i32 %7 to i64, !dbg !135
  %add.ptr6 = getelementptr inbounds %struct.memory_leak_004_s_001, %struct.memory_leak_004_s_001* %6, i64 %idx.ext5, !dbg !135
  %buf7 = getelementptr inbounds %struct.memory_leak_004_s_001, %struct.memory_leak_004_s_001* %add.ptr6, i32 0, i32 2, !dbg !136
  %8 = load i8*, i8** %buf7, align 8, !dbg !136
  %cmp8 = icmp eq i8* %8, null, !dbg !137
  br i1 %cmp8, label %if.then9, label %if.end16, !dbg !138

if.then9:                                         ; preds = %for.body
  call void @llvm.dbg.declare(metadata i32* %j, metadata !139, metadata !23), !dbg !142
  store i32 0, i32* %j, align 4, !dbg !142
  br label %for.cond10, !dbg !143

for.cond10:                                       ; preds = %for.inc, %if.then9
  %9 = load i32, i32* %j, align 4, !dbg !144
  %10 = load i32, i32* %i, align 4, !dbg !147
  %cmp11 = icmp slt i32 %9, %10, !dbg !148
  br i1 %cmp11, label %for.body12, label %for.end, !dbg !149

for.body12:                                       ; preds = %for.cond10
  %11 = load %struct.memory_leak_004_s_001*, %struct.memory_leak_004_s_001** %s, align 8, !dbg !150
  %12 = load i32, i32* %i, align 4, !dbg !152
  %idx.ext13 = sext i32 %12 to i64, !dbg !153
  %add.ptr14 = getelementptr inbounds %struct.memory_leak_004_s_001, %struct.memory_leak_004_s_001* %11, i64 %idx.ext13, !dbg !153
  %buf15 = getelementptr inbounds %struct.memory_leak_004_s_001, %struct.memory_leak_004_s_001* %add.ptr14, i32 0, i32 2, !dbg !154
  %13 = load i8*, i8** %buf15, align 8, !dbg !154
  call void @free(i8* %13) #3, !dbg !155
  br label %for.inc, !dbg !156

for.inc:                                          ; preds = %for.body12
  %14 = load i32, i32* %j, align 4, !dbg !157
  %inc = add nsw i32 %14, 1, !dbg !157
  store i32 %inc, i32* %j, align 4, !dbg !157
  br label %for.cond10, !dbg !159, !llvm.loop !160

for.end:                                          ; preds = %for.cond10
  %15 = load %struct.memory_leak_004_s_001*, %struct.memory_leak_004_s_001** %s, align 8, !dbg !162
  %16 = bitcast %struct.memory_leak_004_s_001* %15 to i8*, !dbg !162
  call void @free(i8* %16) #3, !dbg !163
  br label %return, !dbg !164

if.end16:                                         ; preds = %for.body
  br label %for.inc17, !dbg !165

for.inc17:                                        ; preds = %if.end16
  %17 = load i32, i32* %i, align 4, !dbg !166
  %inc18 = add nsw i32 %17, 1, !dbg !166
  store i32 %inc18, i32* %i, align 4, !dbg !166
  br label %for.cond, !dbg !168, !llvm.loop !169

for.end19:                                        ; preds = %for.cond
  br label %if.end20, !dbg !171

if.end20:                                         ; preds = %for.end19, %if.end
  %18 = load %struct.memory_leak_004_s_001*, %struct.memory_leak_004_s_001** %s, align 8, !dbg !173
  %add.ptr21 = getelementptr inbounds %struct.memory_leak_004_s_001, %struct.memory_leak_004_s_001* %18, i64 4, !dbg !174
  %buf22 = getelementptr inbounds %struct.memory_leak_004_s_001, %struct.memory_leak_004_s_001* %add.ptr21, i32 0, i32 2, !dbg !175
  %19 = load i8*, i8** %buf22, align 8, !dbg !175
  %20 = load i8*, i8** %s1, align 8, !dbg !176
  %call23 = call i8* @strcpy(i8* %19, i8* %20) #3, !dbg !177
  store i32 0, i32* %i, align 4, !dbg !178
  br label %for.cond24, !dbg !180

for.cond24:                                       ; preds = %for.inc30, %if.end20
  %21 = load i32, i32* %i, align 4, !dbg !181
  %cmp25 = icmp slt i32 %21, 5, !dbg !184
  br i1 %cmp25, label %for.body26, label %for.end32, !dbg !185

for.body26:                                       ; preds = %for.cond24
  %22 = load %struct.memory_leak_004_s_001*, %struct.memory_leak_004_s_001** %s, align 8, !dbg !186
  %23 = load i32, i32* %i, align 4, !dbg !187
  %idx.ext27 = sext i32 %23 to i64, !dbg !188
  %add.ptr28 = getelementptr inbounds %struct.memory_leak_004_s_001, %struct.memory_leak_004_s_001* %22, i64 %idx.ext27, !dbg !188
  %buf29 = getelementptr inbounds %struct.memory_leak_004_s_001, %struct.memory_leak_004_s_001* %add.ptr28, i32 0, i32 2, !dbg !189
  %24 = load i8*, i8** %buf29, align 8, !dbg !189
  call void @free(i8* %24) #3, !dbg !190
  br label %for.inc30, !dbg !190

for.inc30:                                        ; preds = %for.body26
  %25 = load i32, i32* %i, align 4, !dbg !191
  %inc31 = add nsw i32 %25, 1, !dbg !191
  store i32 %inc31, i32* %i, align 4, !dbg !191
  br label %for.cond24, !dbg !193, !llvm.loop !194

for.end32:                                        ; preds = %for.cond24
  %26 = load %struct.memory_leak_004_s_001*, %struct.memory_leak_004_s_001** %s, align 8, !dbg !196
  %27 = bitcast %struct.memory_leak_004_s_001* %26 to i8*, !dbg !196
  call void @free(i8* %27) #3, !dbg !197
  br label %return, !dbg !198

return:                                           ; preds = %for.end32, %for.end, %if.then
  ret void, !dbg !199
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !201 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @memory_leak_004_good(), !dbg !204
  call void @memory_leak_004_bad(), !dbg !205
  ret i32 0, !dbg !206
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!16, !17}
!llvm.ident = !{!18}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (tags/RELEASE_390/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3)
!1 = !DIFile(filename: "401_memory_leak_4.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/itc/401")
!2 = !{}
!3 = !{!4, !15, !13}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64, align: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "memory_leak_004_s_001", file: !6, line: 24, baseType: !7)
!6 = !DIFile(filename: "./401_memory_leak_4.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/itc/401")
!7 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !6, line: 20, size: 128, align: 64, elements: !8)
!8 = !{!9, !11, !12}
!9 = !DIDerivedType(tag: DW_TAG_member, name: "a", scope: !7, file: !6, line: 21, baseType: !10, size: 32, align: 32)
!10 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!11 = !DIDerivedType(tag: DW_TAG_member, name: "b", scope: !7, file: !6, line: 22, baseType: !10, size: 32, align: 32, offset: 32)
!12 = !DIDerivedType(tag: DW_TAG_member, name: "buf", scope: !7, file: !6, line: 23, baseType: !13, size: 64, align: 64, offset: 64)
!13 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 64, align: 64)
!14 = !DIBasicType(name: "char", size: 8, align: 8, encoding: DW_ATE_signed_char)
!15 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64, align: 64)
!16 = !{i32 2, !"Dwarf Version", i32 4}
!17 = !{i32 2, !"Debug Info Version", i32 3}
!18 = !{!"clang version 3.9.0 (tags/RELEASE_390/final)"}
!19 = distinct !DISubprogram(name: "memory_leak_004_bad", scope: !6, file: !6, line: 26, type: !20, isLocal: false, isDefinition: true, scopeLine: 27, isOptimized: false, unit: !0, variables: !2)
!20 = !DISubroutineType(types: !21)
!21 = !{null}
!22 = !DILocalVariable(name: "s", scope: !19, file: !6, line: 28, type: !4)
!23 = !DIExpression()
!24 = !DILocation(line: 28, column: 25, scope: !19)
!25 = !DILocation(line: 28, column: 52, scope: !19)
!26 = !DILocation(line: 28, column: 27, scope: !19)
!27 = !DILocation(line: 29, column: 6, scope: !28)
!28 = distinct !DILexicalBlock(scope: !19, file: !6, line: 29, column: 6)
!29 = !DILocation(line: 29, column: 8, scope: !28)
!30 = !DILocation(line: 29, column: 6, scope: !19)
!31 = !DILocation(line: 31, column: 3, scope: !32)
!32 = distinct !DILexicalBlock(scope: !28, file: !6, line: 30, column: 2)
!33 = !DILocalVariable(name: "s1", scope: !19, file: !6, line: 33, type: !13)
!34 = !DILocation(line: 33, column: 8, scope: !19)
!35 = !DILocalVariable(name: "i", scope: !19, file: !6, line: 34, type: !10)
!36 = !DILocation(line: 34, column: 6, scope: !19)
!37 = !DILocation(line: 35, column: 5, scope: !38)
!38 = distinct !DILexicalBlock(scope: !19, file: !6, line: 35, column: 5)
!39 = !DILocation(line: 35, column: 6, scope: !38)
!40 = !DILocation(line: 35, column: 5, scope: !19)
!41 = !DILocation(line: 36, column: 7, scope: !42)
!42 = distinct !DILexicalBlock(scope: !38, file: !6, line: 36, column: 2)
!43 = !DILocation(line: 36, column: 6, scope: !42)
!44 = !DILocation(line: 36, column: 12, scope: !45)
!45 = !DILexicalBlockFile(scope: !46, file: !6, discriminator: 1)
!46 = distinct !DILexicalBlock(scope: !42, file: !6, line: 36, column: 2)
!47 = !DILocation(line: 36, column: 13, scope: !45)
!48 = !DILocation(line: 36, column: 2, scope: !45)
!49 = !DILocation(line: 38, column: 23, scope: !50)
!50 = distinct !DILexicalBlock(scope: !46, file: !6, line: 37, column: 2)
!51 = !DILocation(line: 38, column: 4, scope: !50)
!52 = !DILocation(line: 38, column: 6, scope: !50)
!53 = !DILocation(line: 38, column: 5, scope: !50)
!54 = !DILocation(line: 38, column: 10, scope: !50)
!55 = !DILocation(line: 38, column: 14, scope: !50)
!56 = !DILocation(line: 39, column: 8, scope: !57)
!57 = distinct !DILexicalBlock(scope: !50, file: !6, line: 39, column: 7)
!58 = !DILocation(line: 39, column: 10, scope: !57)
!59 = !DILocation(line: 39, column: 9, scope: !57)
!60 = !DILocation(line: 39, column: 14, scope: !57)
!61 = !DILocation(line: 39, column: 18, scope: !57)
!62 = !DILocation(line: 39, column: 7, scope: !50)
!63 = !DILocation(line: 41, column: 4, scope: !64)
!64 = distinct !DILexicalBlock(scope: !57, file: !6, line: 40, column: 3)
!65 = !DILocation(line: 43, column: 2, scope: !50)
!66 = !DILocation(line: 36, column: 18, scope: !67)
!67 = !DILexicalBlockFile(scope: !46, file: !6, discriminator: 2)
!68 = !DILocation(line: 36, column: 2, scope: !67)
!69 = distinct !{!69, !70}
!70 = !DILocation(line: 36, column: 2, scope: !38)
!71 = !DILocation(line: 43, column: 2, scope: !72)
!72 = !DILexicalBlockFile(scope: !42, file: !6, discriminator: 1)
!73 = !DILocation(line: 44, column: 10, scope: !19)
!74 = !DILocation(line: 44, column: 11, scope: !19)
!75 = !DILocation(line: 44, column: 16, scope: !19)
!76 = !DILocation(line: 44, column: 20, scope: !19)
!77 = !DILocation(line: 44, column: 2, scope: !19)
!78 = !DILocation(line: 45, column: 7, scope: !79)
!79 = distinct !DILexicalBlock(scope: !19, file: !6, line: 45, column: 2)
!80 = !DILocation(line: 45, column: 6, scope: !79)
!81 = !DILocation(line: 45, column: 12, scope: !82)
!82 = !DILexicalBlockFile(scope: !83, file: !6, discriminator: 1)
!83 = distinct !DILexicalBlock(scope: !79, file: !6, line: 45, column: 2)
!84 = !DILocation(line: 45, column: 13, scope: !82)
!85 = !DILocation(line: 45, column: 2, scope: !82)
!86 = !DILocation(line: 45, column: 2, scope: !87)
!87 = !DILexicalBlockFile(scope: !79, file: !6, discriminator: 2)
!88 = !DILocation(line: 45, column: 18, scope: !89)
!89 = !DILexicalBlockFile(scope: !83, file: !6, discriminator: 3)
!90 = !DILocation(line: 45, column: 2, scope: !89)
!91 = distinct !{!91, !92}
!92 = !DILocation(line: 45, column: 2, scope: !19)
!93 = !DILocation(line: 46, column: 7, scope: !19)
!94 = !DILocation(line: 46, column: 2, scope: !19)
!95 = !DILocation(line: 47, column: 1, scope: !19)
!96 = !DILocation(line: 47, column: 1, scope: !97)
!97 = !DILexicalBlockFile(scope: !19, file: !6, discriminator: 1)
!98 = distinct !DISubprogram(name: "memory_leak_004_good", scope: !6, file: !6, line: 53, type: !20, isLocal: false, isDefinition: true, scopeLine: 54, isOptimized: false, unit: !0, variables: !2)
!99 = !DILocalVariable(name: "s", scope: !98, file: !6, line: 55, type: !4)
!100 = !DILocation(line: 55, column: 25, scope: !98)
!101 = !DILocation(line: 55, column: 52, scope: !98)
!102 = !DILocation(line: 55, column: 27, scope: !98)
!103 = !DILocation(line: 56, column: 6, scope: !104)
!104 = distinct !DILexicalBlock(scope: !98, file: !6, line: 56, column: 6)
!105 = !DILocation(line: 56, column: 8, scope: !104)
!106 = !DILocation(line: 56, column: 6, scope: !98)
!107 = !DILocation(line: 58, column: 3, scope: !108)
!108 = distinct !DILexicalBlock(scope: !104, file: !6, line: 57, column: 2)
!109 = !DILocalVariable(name: "s1", scope: !98, file: !6, line: 60, type: !13)
!110 = !DILocation(line: 60, column: 8, scope: !98)
!111 = !DILocalVariable(name: "i", scope: !98, file: !6, line: 61, type: !10)
!112 = !DILocation(line: 61, column: 6, scope: !98)
!113 = !DILocation(line: 62, column: 5, scope: !114)
!114 = distinct !DILexicalBlock(scope: !98, file: !6, line: 62, column: 5)
!115 = !DILocation(line: 62, column: 6, scope: !114)
!116 = !DILocation(line: 62, column: 5, scope: !98)
!117 = !DILocation(line: 63, column: 7, scope: !118)
!118 = distinct !DILexicalBlock(scope: !114, file: !6, line: 63, column: 2)
!119 = !DILocation(line: 63, column: 6, scope: !118)
!120 = !DILocation(line: 63, column: 12, scope: !121)
!121 = !DILexicalBlockFile(scope: !122, file: !6, discriminator: 1)
!122 = distinct !DILexicalBlock(scope: !118, file: !6, line: 63, column: 2)
!123 = !DILocation(line: 63, column: 13, scope: !121)
!124 = !DILocation(line: 63, column: 2, scope: !121)
!125 = !DILocation(line: 65, column: 23, scope: !126)
!126 = distinct !DILexicalBlock(scope: !122, file: !6, line: 64, column: 2)
!127 = !DILocation(line: 65, column: 4, scope: !126)
!128 = !DILocation(line: 65, column: 6, scope: !126)
!129 = !DILocation(line: 65, column: 5, scope: !126)
!130 = !DILocation(line: 65, column: 10, scope: !126)
!131 = !DILocation(line: 65, column: 14, scope: !126)
!132 = !DILocation(line: 66, column: 8, scope: !133)
!133 = distinct !DILexicalBlock(scope: !126, file: !6, line: 66, column: 7)
!134 = !DILocation(line: 66, column: 10, scope: !133)
!135 = !DILocation(line: 66, column: 9, scope: !133)
!136 = !DILocation(line: 66, column: 14, scope: !133)
!137 = !DILocation(line: 66, column: 18, scope: !133)
!138 = !DILocation(line: 66, column: 7, scope: !126)
!139 = !DILocalVariable(name: "j", scope: !140, file: !6, line: 68, type: !10)
!140 = distinct !DILexicalBlock(scope: !141, file: !6, line: 68, column: 4)
!141 = distinct !DILexicalBlock(scope: !133, file: !6, line: 67, column: 3)
!142 = !DILocation(line: 68, column: 13, scope: !140)
!143 = !DILocation(line: 68, column: 9, scope: !140)
!144 = !DILocation(line: 68, column: 20, scope: !145)
!145 = !DILexicalBlockFile(scope: !146, file: !6, discriminator: 1)
!146 = distinct !DILexicalBlock(scope: !140, file: !6, line: 68, column: 4)
!147 = !DILocation(line: 68, column: 24, scope: !145)
!148 = !DILocation(line: 68, column: 22, scope: !145)
!149 = !DILocation(line: 68, column: 4, scope: !145)
!150 = !DILocation(line: 70, column: 11, scope: !151)
!151 = distinct !DILexicalBlock(scope: !146, file: !6, line: 69, column: 4)
!152 = !DILocation(line: 70, column: 13, scope: !151)
!153 = !DILocation(line: 70, column: 12, scope: !151)
!154 = !DILocation(line: 70, column: 17, scope: !151)
!155 = !DILocation(line: 70, column: 5, scope: !151)
!156 = !DILocation(line: 71, column: 4, scope: !151)
!157 = !DILocation(line: 68, column: 27, scope: !158)
!158 = !DILexicalBlockFile(scope: !146, file: !6, discriminator: 2)
!159 = !DILocation(line: 68, column: 4, scope: !158)
!160 = distinct !{!160, !161}
!161 = !DILocation(line: 68, column: 4, scope: !141)
!162 = !DILocation(line: 72, column: 9, scope: !141)
!163 = !DILocation(line: 72, column: 4, scope: !141)
!164 = !DILocation(line: 73, column: 4, scope: !141)
!165 = !DILocation(line: 75, column: 2, scope: !126)
!166 = !DILocation(line: 63, column: 18, scope: !167)
!167 = !DILexicalBlockFile(scope: !122, file: !6, discriminator: 2)
!168 = !DILocation(line: 63, column: 2, scope: !167)
!169 = distinct !{!169, !170}
!170 = !DILocation(line: 63, column: 2, scope: !114)
!171 = !DILocation(line: 75, column: 2, scope: !172)
!172 = !DILexicalBlockFile(scope: !118, file: !6, discriminator: 1)
!173 = !DILocation(line: 76, column: 10, scope: !98)
!174 = !DILocation(line: 76, column: 11, scope: !98)
!175 = !DILocation(line: 76, column: 16, scope: !98)
!176 = !DILocation(line: 76, column: 20, scope: !98)
!177 = !DILocation(line: 76, column: 2, scope: !98)
!178 = !DILocation(line: 77, column: 7, scope: !179)
!179 = distinct !DILexicalBlock(scope: !98, file: !6, line: 77, column: 2)
!180 = !DILocation(line: 77, column: 6, scope: !179)
!181 = !DILocation(line: 77, column: 12, scope: !182)
!182 = !DILexicalBlockFile(scope: !183, file: !6, discriminator: 1)
!183 = distinct !DILexicalBlock(scope: !179, file: !6, line: 77, column: 2)
!184 = !DILocation(line: 77, column: 13, scope: !182)
!185 = !DILocation(line: 77, column: 2, scope: !182)
!186 = !DILocation(line: 78, column: 9, scope: !183)
!187 = !DILocation(line: 78, column: 11, scope: !183)
!188 = !DILocation(line: 78, column: 10, scope: !183)
!189 = !DILocation(line: 78, column: 15, scope: !183)
!190 = !DILocation(line: 78, column: 3, scope: !183)
!191 = !DILocation(line: 77, column: 18, scope: !192)
!192 = !DILexicalBlockFile(scope: !183, file: !6, discriminator: 2)
!193 = !DILocation(line: 77, column: 2, scope: !192)
!194 = distinct !{!194, !195}
!195 = !DILocation(line: 77, column: 2, scope: !98)
!196 = !DILocation(line: 79, column: 7, scope: !98)
!197 = !DILocation(line: 79, column: 2, scope: !98)
!198 = !DILocation(line: 80, column: 1, scope: !98)
!199 = !DILocation(line: 80, column: 1, scope: !200)
!200 = !DILexicalBlockFile(scope: !98, file: !6, discriminator: 1)
!201 = distinct !DISubprogram(name: "main", scope: !6, file: !6, line: 87, type: !202, isLocal: false, isDefinition: true, scopeLine: 88, isOptimized: false, unit: !0, variables: !2)
!202 = !DISubroutineType(types: !203)
!203 = !{!10}
!204 = !DILocation(line: 89, column: 2, scope: !201)
!205 = !DILocation(line: 90, column: 2, scope: !201)
!206 = !DILocation(line: 91, column: 2, scope: !201)
