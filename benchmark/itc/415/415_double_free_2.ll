; ModuleID = './415_double_free_2.c'
source_filename = "./415_double_free_2.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: nounwind uwtable
define void @double_free_002_bad() #0 !dbg !10 {
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
  br label %return, !dbg !22

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %i, metadata !24, metadata !15), !dbg !26
  store i32 0, i32* %i, align 4, !dbg !27
  br label %for.cond, !dbg !29

for.cond:                                         ; preds = %for.inc, %if.end
  %1 = load i32, i32* %i, align 4, !dbg !30
  %cmp1 = icmp slt i32 %1, 10, !dbg !33
  br i1 %cmp1, label %for.body, label %for.end, !dbg !34

for.body:                                         ; preds = %for.cond
  %2 = load i32, i32* %i, align 4, !dbg !35
  %idxprom = sext i32 %2 to i64, !dbg !37
  %3 = load i8*, i8** %ptr, align 8, !dbg !37
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 %idxprom, !dbg !37
  store i8 97, i8* %arrayidx, align 1, !dbg !38
  %4 = load i32, i32* %i, align 4, !dbg !39
  %cmp2 = icmp eq i32 %4, 9, !dbg !41
  br i1 %cmp2, label %if.then3, label %if.end4, !dbg !42

if.then3:                                         ; preds = %for.body
  %5 = load i8*, i8** %ptr, align 8, !dbg !43
  call void @free(i8* %5) #3, !dbg !45
  br label %if.end4, !dbg !46

if.end4:                                          ; preds = %if.then3, %for.body
  br label %for.inc, !dbg !47

for.inc:                                          ; preds = %if.end4
  %6 = load i32, i32* %i, align 4, !dbg !48
  %inc = add nsw i32 %6, 1, !dbg !48
  store i32 %inc, i32* %i, align 4, !dbg !48
  br label %for.cond, !dbg !50, !llvm.loop !51

for.end:                                          ; preds = %for.cond
  %7 = load i8*, i8** %ptr, align 8, !dbg !53
  call void @free(i8* %7) #3, !dbg !54
  br label %return, !dbg !55

return:                                           ; preds = %for.end, %if.then
  ret void, !dbg !56
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #2

; Function Attrs: nounwind
declare void @free(i8*) #2

; Function Attrs: nounwind uwtable
define void @double_free_002_good() #0 !dbg !58 {
entry:
  %ptr = alloca i8*, align 8
  %i = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i8** %ptr, metadata !59, metadata !15), !dbg !60
  %call = call noalias i8* @malloc(i64 10) #3, !dbg !61
  store i8* %call, i8** %ptr, align 8, !dbg !60
  %0 = load i8*, i8** %ptr, align 8, !dbg !62
  %cmp = icmp eq i8* %0, null, !dbg !64
  br i1 %cmp, label %if.then, label %if.end, !dbg !65

if.then:                                          ; preds = %entry
  br label %return, !dbg !66

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %i, metadata !68, metadata !15), !dbg !69
  store i32 0, i32* %i, align 4, !dbg !70
  br label %for.cond, !dbg !72

for.cond:                                         ; preds = %for.inc, %if.end
  %1 = load i32, i32* %i, align 4, !dbg !73
  %cmp1 = icmp slt i32 %1, 10, !dbg !76
  br i1 %cmp1, label %for.body, label %for.end, !dbg !77

for.body:                                         ; preds = %for.cond
  %2 = load i32, i32* %i, align 4, !dbg !78
  %idxprom = sext i32 %2 to i64, !dbg !80
  %3 = load i8*, i8** %ptr, align 8, !dbg !80
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 %idxprom, !dbg !80
  store i8 97, i8* %arrayidx, align 1, !dbg !81
  %4 = load i32, i32* %i, align 4, !dbg !82
  %cmp2 = icmp eq i32 %4, 10, !dbg !84
  br i1 %cmp2, label %if.then3, label %if.end4, !dbg !85

if.then3:                                         ; preds = %for.body
  %5 = load i8*, i8** %ptr, align 8, !dbg !86
  call void @free(i8* %5) #3, !dbg !87
  br label %if.end4, !dbg !87

if.end4:                                          ; preds = %if.then3, %for.body
  br label %for.inc, !dbg !88

for.inc:                                          ; preds = %if.end4
  %6 = load i32, i32* %i, align 4, !dbg !89
  %inc = add nsw i32 %6, 1, !dbg !89
  store i32 %inc, i32* %i, align 4, !dbg !89
  br label %for.cond, !dbg !91, !llvm.loop !92

for.end:                                          ; preds = %for.cond
  %7 = load i8*, i8** %ptr, align 8, !dbg !94
  call void @free(i8* %7) #3, !dbg !95
  br label %return, !dbg !96

return:                                           ; preds = %for.end, %if.then
  ret void, !dbg !97
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !99 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @double_free_002_good(), !dbg !102
  call void @double_free_002_bad(), !dbg !103
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
!1 = !DIFile(filename: "415_double_free_2.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/itc/415")
!2 = !{}
!3 = !{!4, !6}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64, align: 64)
!5 = !DIBasicType(name: "char", size: 8, align: 8, encoding: DW_ATE_signed_char)
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64, align: 64)
!7 = !{i32 2, !"Dwarf Version", i32 4}
!8 = !{i32 2, !"Debug Info Version", i32 3}
!9 = !{!"clang version 3.9.0 (tags/RELEASE_390/final)"}
!10 = distinct !DISubprogram(name: "double_free_002_bad", scope: !11, file: !11, line: 18, type: !12, isLocal: false, isDefinition: true, scopeLine: 19, isOptimized: false, unit: !0, variables: !2)
!11 = !DIFile(filename: "./415_double_free_2.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/itc/415")
!12 = !DISubroutineType(types: !13)
!13 = !{null}
!14 = !DILocalVariable(name: "ptr", scope: !10, file: !11, line: 20, type: !4)
!15 = !DIExpression()
!16 = !DILocation(line: 20, column: 8, scope: !10)
!17 = !DILocation(line: 20, column: 21, scope: !10)
!18 = !DILocation(line: 21, column: 6, scope: !19)
!19 = distinct !DILexicalBlock(scope: !10, file: !11, line: 21, column: 6)
!20 = !DILocation(line: 21, column: 10, scope: !19)
!21 = !DILocation(line: 21, column: 6, scope: !10)
!22 = !DILocation(line: 21, column: 19, scope: !23)
!23 = !DILexicalBlockFile(scope: !19, file: !11, discriminator: 1)
!24 = !DILocalVariable(name: "i", scope: !10, file: !11, line: 22, type: !25)
!25 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!26 = !DILocation(line: 22, column: 6, scope: !10)
!27 = !DILocation(line: 24, column: 7, scope: !28)
!28 = distinct !DILexicalBlock(scope: !10, file: !11, line: 24, column: 2)
!29 = !DILocation(line: 24, column: 6, scope: !28)
!30 = !DILocation(line: 24, column: 10, scope: !31)
!31 = !DILexicalBlockFile(scope: !32, file: !11, discriminator: 1)
!32 = distinct !DILexicalBlock(scope: !28, file: !11, line: 24, column: 2)
!33 = !DILocation(line: 24, column: 11, scope: !31)
!34 = !DILocation(line: 24, column: 2, scope: !31)
!35 = !DILocation(line: 26, column: 7, scope: !36)
!36 = distinct !DILexicalBlock(scope: !32, file: !11, line: 25, column: 2)
!37 = !DILocation(line: 26, column: 3, scope: !36)
!38 = !DILocation(line: 26, column: 9, scope: !36)
!39 = !DILocation(line: 27, column: 6, scope: !40)
!40 = distinct !DILexicalBlock(scope: !36, file: !11, line: 27, column: 6)
!41 = !DILocation(line: 27, column: 7, scope: !40)
!42 = !DILocation(line: 27, column: 6, scope: !36)
!43 = !DILocation(line: 29, column: 9, scope: !44)
!44 = distinct !DILexicalBlock(scope: !40, file: !11, line: 28, column: 3)
!45 = !DILocation(line: 29, column: 4, scope: !44)
!46 = !DILocation(line: 30, column: 3, scope: !44)
!47 = !DILocation(line: 31, column: 2, scope: !36)
!48 = !DILocation(line: 24, column: 16, scope: !49)
!49 = !DILexicalBlockFile(scope: !32, file: !11, discriminator: 2)
!50 = !DILocation(line: 24, column: 2, scope: !49)
!51 = distinct !{!51, !52}
!52 = !DILocation(line: 24, column: 2, scope: !10)
!53 = !DILocation(line: 32, column: 7, scope: !10)
!54 = !DILocation(line: 32, column: 2, scope: !10)
!55 = !DILocation(line: 33, column: 1, scope: !10)
!56 = !DILocation(line: 33, column: 1, scope: !57)
!57 = !DILexicalBlockFile(scope: !10, file: !11, discriminator: 1)
!58 = distinct !DISubprogram(name: "double_free_002_good", scope: !11, file: !11, line: 40, type: !12, isLocal: false, isDefinition: true, scopeLine: 41, isOptimized: false, unit: !0, variables: !2)
!59 = !DILocalVariable(name: "ptr", scope: !58, file: !11, line: 42, type: !4)
!60 = !DILocation(line: 42, column: 8, scope: !58)
!61 = !DILocation(line: 42, column: 21, scope: !58)
!62 = !DILocation(line: 43, column: 6, scope: !63)
!63 = distinct !DILexicalBlock(scope: !58, file: !11, line: 43, column: 6)
!64 = !DILocation(line: 43, column: 10, scope: !63)
!65 = !DILocation(line: 43, column: 6, scope: !58)
!66 = !DILocation(line: 43, column: 19, scope: !67)
!67 = !DILexicalBlockFile(scope: !63, file: !11, discriminator: 1)
!68 = !DILocalVariable(name: "i", scope: !58, file: !11, line: 44, type: !25)
!69 = !DILocation(line: 44, column: 6, scope: !58)
!70 = !DILocation(line: 46, column: 7, scope: !71)
!71 = distinct !DILexicalBlock(scope: !58, file: !11, line: 46, column: 2)
!72 = !DILocation(line: 46, column: 6, scope: !71)
!73 = !DILocation(line: 46, column: 10, scope: !74)
!74 = !DILexicalBlockFile(scope: !75, file: !11, discriminator: 1)
!75 = distinct !DILexicalBlock(scope: !71, file: !11, line: 46, column: 2)
!76 = !DILocation(line: 46, column: 11, scope: !74)
!77 = !DILocation(line: 46, column: 2, scope: !74)
!78 = !DILocation(line: 48, column: 7, scope: !79)
!79 = distinct !DILexicalBlock(scope: !75, file: !11, line: 47, column: 2)
!80 = !DILocation(line: 48, column: 3, scope: !79)
!81 = !DILocation(line: 48, column: 9, scope: !79)
!82 = !DILocation(line: 49, column: 6, scope: !83)
!83 = distinct !DILexicalBlock(scope: !79, file: !11, line: 49, column: 6)
!84 = !DILocation(line: 49, column: 7, scope: !83)
!85 = !DILocation(line: 49, column: 6, scope: !79)
!86 = !DILocation(line: 50, column: 8, scope: !83)
!87 = !DILocation(line: 50, column: 3, scope: !83)
!88 = !DILocation(line: 51, column: 2, scope: !79)
!89 = !DILocation(line: 46, column: 16, scope: !90)
!90 = !DILexicalBlockFile(scope: !75, file: !11, discriminator: 2)
!91 = !DILocation(line: 46, column: 2, scope: !90)
!92 = distinct !{!92, !93}
!93 = !DILocation(line: 46, column: 2, scope: !58)
!94 = !DILocation(line: 52, column: 7, scope: !58)
!95 = !DILocation(line: 52, column: 2, scope: !58)
!96 = !DILocation(line: 53, column: 1, scope: !58)
!97 = !DILocation(line: 53, column: 1, scope: !98)
!98 = !DILexicalBlockFile(scope: !58, file: !11, discriminator: 1)
!99 = distinct !DISubprogram(name: "main", scope: !11, file: !11, line: 60, type: !100, isLocal: false, isDefinition: true, scopeLine: 61, isOptimized: false, unit: !0, variables: !2)
!100 = !DISubroutineType(types: !101)
!101 = !{!25}
!102 = !DILocation(line: 62, column: 2, scope: !99)
!103 = !DILocation(line: 63, column: 2, scope: !99)
!104 = !DILocation(line: 64, column: 2, scope: !99)
