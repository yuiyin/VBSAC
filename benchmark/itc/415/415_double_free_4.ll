; ModuleID = './415_double_free_4.c'
source_filename = "./415_double_free_4.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: nounwind uwtable
define void @double_free_004_bad() #0 !dbg !10 {
entry:
  %ptr = alloca i8*, align 8
  %i = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i8** %ptr, metadata !14, metadata !15), !dbg !16
  %call = call noalias i8* @malloc(i64 10) #3, !dbg !17
  store i8* %call, i8** %ptr, align 8, !dbg !16
  %0 = load i8*, i8** %ptr, align 8, !dbg !18
  %cmp = icmp eq i8* %0, null, !dbg !20
  br i1 %cmp, label %if.then, label %if.end, !dbg !21

if.then:                                          ; preds = %entry
  br label %if.end10, !dbg !22

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %i, metadata !24, metadata !15), !dbg !26
  store i32 0, i32* %i, align 4, !dbg !27
  br label %for.cond, !dbg !29

for.cond:                                         ; preds = %for.inc, %if.end
  %1 = load i32, i32* %i, align 4, !dbg !30
  %cmp1 = icmp slt i32 %1, 10, !dbg !33
  br i1 %cmp1, label %for.body, label %for.end, !dbg !34

for.body:                                         ; preds = %for.cond
  %2 = load i8*, i8** %ptr, align 8, !dbg !35
  %3 = load i32, i32* %i, align 4, !dbg !37
  %idx.ext = sext i32 %3 to i64, !dbg !38
  %add.ptr = getelementptr inbounds i8, i8* %2, i64 %idx.ext, !dbg !38
  store i8 97, i8* %add.ptr, align 1, !dbg !39
  br label %for.inc, !dbg !40

for.inc:                                          ; preds = %for.body
  %4 = load i32, i32* %i, align 4, !dbg !41
  %inc = add nsw i32 %4, 1, !dbg !41
  store i32 %inc, i32* %i, align 4, !dbg !41
  br label %for.cond, !dbg !43, !llvm.loop !44

for.end:                                          ; preds = %for.cond
  %call2 = call i32 @rand() #3, !dbg !46
  %rem = srem i32 %call2, 2, !dbg !48
  %cmp3 = icmp eq i32 %rem, 0, !dbg !49
  br i1 %cmp3, label %if.then4, label %if.end5, !dbg !50

if.then4:                                         ; preds = %for.end
  %5 = load i8*, i8** %ptr, align 8, !dbg !51
  call void @free(i8* %5) #3, !dbg !53
  br label %if.end5, !dbg !54

if.end5:                                          ; preds = %if.then4, %for.end
  %call6 = call i32 @rand() #3, !dbg !55
  %rem7 = srem i32 %call6, 3, !dbg !57
  %cmp8 = icmp eq i32 %rem7, 0, !dbg !58
  br i1 %cmp8, label %if.then9, label %if.end10, !dbg !59

if.then9:                                         ; preds = %if.end5
  %6 = load i8*, i8** %ptr, align 8, !dbg !60
  call void @free(i8* %6) #3, !dbg !61
  br label %if.end10, !dbg !61

if.end10:                                         ; preds = %if.then, %if.then9, %if.end5
  ret void, !dbg !62
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #2

; Function Attrs: nounwind
declare i32 @rand() #2

; Function Attrs: nounwind
declare void @free(i8*) #2

; Function Attrs: nounwind uwtable
define void @double_free_004_good() #0 !dbg !63 {
entry:
  %ptr = alloca i8*, align 8
  %i = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i8** %ptr, metadata !64, metadata !15), !dbg !65
  %call = call noalias i8* @malloc(i64 10) #3, !dbg !66
  store i8* %call, i8** %ptr, align 8, !dbg !65
  %0 = load i8*, i8** %ptr, align 8, !dbg !67
  %cmp = icmp eq i8* %0, null, !dbg !69
  br i1 %cmp, label %if.then, label %if.end, !dbg !70

if.then:                                          ; preds = %entry
  br label %return, !dbg !71

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %i, metadata !73, metadata !15), !dbg !74
  store i32 0, i32* %i, align 4, !dbg !75
  br label %for.cond, !dbg !77

for.cond:                                         ; preds = %for.inc, %if.end
  %1 = load i32, i32* %i, align 4, !dbg !78
  %cmp1 = icmp slt i32 %1, 10, !dbg !81
  br i1 %cmp1, label %for.body, label %for.end, !dbg !82

for.body:                                         ; preds = %for.cond
  %2 = load i8*, i8** %ptr, align 8, !dbg !83
  %3 = load i32, i32* %i, align 4, !dbg !85
  %idx.ext = sext i32 %3 to i64, !dbg !86
  %add.ptr = getelementptr inbounds i8, i8* %2, i64 %idx.ext, !dbg !86
  store i8 97, i8* %add.ptr, align 1, !dbg !87
  br label %for.inc, !dbg !88

for.inc:                                          ; preds = %for.body
  %4 = load i32, i32* %i, align 4, !dbg !89
  %inc = add nsw i32 %4, 1, !dbg !89
  store i32 %inc, i32* %i, align 4, !dbg !89
  br label %for.cond, !dbg !91, !llvm.loop !92

for.end:                                          ; preds = %for.cond
  %5 = load i8*, i8** %ptr, align 8, !dbg !94
  call void @free(i8* %5) #3, !dbg !95
  br label %return, !dbg !96

return:                                           ; preds = %for.end, %if.then
  ret void, !dbg !97
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !99 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @double_free_004_good(), !dbg !102
  call void @double_free_004_bad(), !dbg !103
  ret i32 0, !dbg !104
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8}
!llvm.ident = !{!9}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (tags/RELEASE_390/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3)
!1 = !DIFile(filename: "415_double_free_4.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/itc/415")
!2 = !{}
!3 = !{!4, !6}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64, align: 64)
!5 = !DIBasicType(name: "char", size: 8, align: 8, encoding: DW_ATE_signed_char)
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64, align: 64)
!7 = !{i32 2, !"Dwarf Version", i32 4}
!8 = !{i32 2, !"Debug Info Version", i32 3}
!9 = !{!"clang version 3.9.0 (tags/RELEASE_390/final)"}
!10 = distinct !DISubprogram(name: "double_free_004_bad", scope: !11, file: !11, line: 21, type: !12, isLocal: false, isDefinition: true, scopeLine: 22, isOptimized: false, unit: !0, variables: !2)
!11 = !DIFile(filename: "./415_double_free_4.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/itc/415")
!12 = !DISubroutineType(types: !13)
!13 = !{null}
!14 = !DILocalVariable(name: "ptr", scope: !10, file: !11, line: 23, type: !4)
!15 = !DIExpression()
!16 = !DILocation(line: 23, column: 8, scope: !10)
!17 = !DILocation(line: 23, column: 21, scope: !10)
!18 = !DILocation(line: 24, column: 6, scope: !19)
!19 = distinct !DILexicalBlock(scope: !10, file: !11, line: 24, column: 6)
!20 = !DILocation(line: 24, column: 10, scope: !19)
!21 = !DILocation(line: 24, column: 6, scope: !10)
!22 = !DILocation(line: 24, column: 19, scope: !23)
!23 = !DILexicalBlockFile(scope: !19, file: !11, discriminator: 1)
!24 = !DILocalVariable(name: "i", scope: !10, file: !11, line: 25, type: !25)
!25 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!26 = !DILocation(line: 25, column: 6, scope: !10)
!27 = !DILocation(line: 26, column: 7, scope: !28)
!28 = distinct !DILexicalBlock(scope: !10, file: !11, line: 26, column: 2)
!29 = !DILocation(line: 26, column: 6, scope: !28)
!30 = !DILocation(line: 26, column: 10, scope: !31)
!31 = !DILexicalBlockFile(scope: !32, file: !11, discriminator: 1)
!32 = distinct !DILexicalBlock(scope: !28, file: !11, line: 26, column: 2)
!33 = !DILocation(line: 26, column: 11, scope: !31)
!34 = !DILocation(line: 26, column: 2, scope: !31)
!35 = !DILocation(line: 28, column: 5, scope: !36)
!36 = distinct !DILexicalBlock(scope: !32, file: !11, line: 27, column: 2)
!37 = !DILocation(line: 28, column: 9, scope: !36)
!38 = !DILocation(line: 28, column: 8, scope: !36)
!39 = !DILocation(line: 28, column: 11, scope: !36)
!40 = !DILocation(line: 29, column: 2, scope: !36)
!41 = !DILocation(line: 26, column: 16, scope: !42)
!42 = !DILexicalBlockFile(scope: !32, file: !11, discriminator: 2)
!43 = !DILocation(line: 26, column: 2, scope: !42)
!44 = distinct !{!44, !45}
!45 = !DILocation(line: 26, column: 2, scope: !10)
!46 = !DILocation(line: 31, column: 6, scope: !47)
!47 = distinct !DILexicalBlock(scope: !10, file: !11, line: 31, column: 6)
!48 = !DILocation(line: 31, column: 13, scope: !47)
!49 = !DILocation(line: 31, column: 16, scope: !47)
!50 = !DILocation(line: 31, column: 6, scope: !10)
!51 = !DILocation(line: 33, column: 8, scope: !52)
!52 = distinct !DILexicalBlock(scope: !47, file: !11, line: 32, column: 2)
!53 = !DILocation(line: 33, column: 3, scope: !52)
!54 = !DILocation(line: 34, column: 2, scope: !52)
!55 = !DILocation(line: 36, column: 5, scope: !56)
!56 = distinct !DILexicalBlock(scope: !10, file: !11, line: 36, column: 5)
!57 = !DILocation(line: 36, column: 12, scope: !56)
!58 = !DILocation(line: 36, column: 15, scope: !56)
!59 = !DILocation(line: 36, column: 5, scope: !10)
!60 = !DILocation(line: 37, column: 7, scope: !56)
!61 = !DILocation(line: 37, column: 2, scope: !56)
!62 = !DILocation(line: 38, column: 1, scope: !10)
!63 = distinct !DISubprogram(name: "double_free_004_good", scope: !11, file: !11, line: 45, type: !12, isLocal: false, isDefinition: true, scopeLine: 46, isOptimized: false, unit: !0, variables: !2)
!64 = !DILocalVariable(name: "ptr", scope: !63, file: !11, line: 47, type: !4)
!65 = !DILocation(line: 47, column: 8, scope: !63)
!66 = !DILocation(line: 47, column: 21, scope: !63)
!67 = !DILocation(line: 48, column: 6, scope: !68)
!68 = distinct !DILexicalBlock(scope: !63, file: !11, line: 48, column: 6)
!69 = !DILocation(line: 48, column: 10, scope: !68)
!70 = !DILocation(line: 48, column: 6, scope: !63)
!71 = !DILocation(line: 48, column: 19, scope: !72)
!72 = !DILexicalBlockFile(scope: !68, file: !11, discriminator: 1)
!73 = !DILocalVariable(name: "i", scope: !63, file: !11, line: 49, type: !25)
!74 = !DILocation(line: 49, column: 6, scope: !63)
!75 = !DILocation(line: 50, column: 7, scope: !76)
!76 = distinct !DILexicalBlock(scope: !63, file: !11, line: 50, column: 2)
!77 = !DILocation(line: 50, column: 6, scope: !76)
!78 = !DILocation(line: 50, column: 10, scope: !79)
!79 = !DILexicalBlockFile(scope: !80, file: !11, discriminator: 1)
!80 = distinct !DILexicalBlock(scope: !76, file: !11, line: 50, column: 2)
!81 = !DILocation(line: 50, column: 11, scope: !79)
!82 = !DILocation(line: 50, column: 2, scope: !79)
!83 = !DILocation(line: 52, column: 5, scope: !84)
!84 = distinct !DILexicalBlock(scope: !80, file: !11, line: 51, column: 2)
!85 = !DILocation(line: 52, column: 9, scope: !84)
!86 = !DILocation(line: 52, column: 8, scope: !84)
!87 = !DILocation(line: 52, column: 11, scope: !84)
!88 = !DILocation(line: 54, column: 2, scope: !84)
!89 = !DILocation(line: 50, column: 16, scope: !90)
!90 = !DILexicalBlockFile(scope: !80, file: !11, discriminator: 2)
!91 = !DILocation(line: 50, column: 2, scope: !90)
!92 = distinct !{!92, !93}
!93 = !DILocation(line: 50, column: 2, scope: !63)
!94 = !DILocation(line: 55, column: 7, scope: !63)
!95 = !DILocation(line: 55, column: 2, scope: !63)
!96 = !DILocation(line: 56, column: 1, scope: !63)
!97 = !DILocation(line: 56, column: 1, scope: !98)
!98 = !DILexicalBlockFile(scope: !63, file: !11, discriminator: 1)
!99 = distinct !DISubprogram(name: "main", scope: !11, file: !11, line: 63, type: !100, isLocal: false, isDefinition: true, scopeLine: 64, isOptimized: false, unit: !0, variables: !2)
!100 = !DISubroutineType(types: !101)
!101 = !{!25}
!102 = !DILocation(line: 65, column: 2, scope: !99)
!103 = !DILocation(line: 66, column: 2, scope: !99)
!104 = !DILocation(line: 67, column: 2, scope: !99)
