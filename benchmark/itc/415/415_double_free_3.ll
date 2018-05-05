; ModuleID = './415_double_free_3.c'
source_filename = "./415_double_free_3.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: nounwind uwtable
define void @double_free_003_bad() #0 !dbg !10 {
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
  %2 = load i8*, i8** %ptr, align 8, !dbg !35
  %3 = load i32, i32* %i, align 4, !dbg !37
  %idx.ext = sext i32 %3 to i64, !dbg !38
  %add.ptr = getelementptr inbounds i8, i8* %2, i64 %idx.ext, !dbg !38
  store i8 97, i8* %add.ptr, align 1, !dbg !39
  %4 = load i32, i32* %i, align 4, !dbg !40
  %cmp2 = icmp eq i32 %4, 9, !dbg !42
  br i1 %cmp2, label %if.then3, label %if.end4, !dbg !43

if.then3:                                         ; preds = %for.body
  %5 = load i8*, i8** %ptr, align 8, !dbg !44
  call void @free(i8* %5) #3, !dbg !46
  br label %if.end4, !dbg !47

if.end4:                                          ; preds = %if.then3, %for.body
  br label %for.inc, !dbg !48

for.inc:                                          ; preds = %if.end4
  %6 = load i32, i32* %i, align 4, !dbg !49
  %inc = add nsw i32 %6, 1, !dbg !49
  store i32 %inc, i32* %i, align 4, !dbg !49
  br label %for.cond, !dbg !51, !llvm.loop !52

for.end:                                          ; preds = %for.cond
  %7 = load i8*, i8** %ptr, align 8, !dbg !54
  call void @free(i8* %7) #3, !dbg !55
  br label %return, !dbg !56

return:                                           ; preds = %for.end, %if.then
  ret void, !dbg !57
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #2

; Function Attrs: nounwind
declare void @free(i8*) #2

; Function Attrs: nounwind uwtable
define void @double_free_003_good() #0 !dbg !59 {
entry:
  %ptr = alloca i8*, align 8
  %i = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i8** %ptr, metadata !60, metadata !15), !dbg !61
  %call = call noalias i8* @malloc(i64 10) #3, !dbg !62
  store i8* %call, i8** %ptr, align 8, !dbg !61
  %0 = load i8*, i8** %ptr, align 8, !dbg !63
  %cmp = icmp eq i8* %0, null, !dbg !65
  br i1 %cmp, label %if.then, label %if.end, !dbg !66

if.then:                                          ; preds = %entry
  br label %return, !dbg !67

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %i, metadata !69, metadata !15), !dbg !70
  store i32 0, i32* %i, align 4, !dbg !71
  br label %for.cond, !dbg !73

for.cond:                                         ; preds = %for.inc, %if.end
  %1 = load i32, i32* %i, align 4, !dbg !74
  %cmp1 = icmp slt i32 %1, 10, !dbg !77
  br i1 %cmp1, label %for.body, label %for.end, !dbg !78

for.body:                                         ; preds = %for.cond
  %2 = load i8*, i8** %ptr, align 8, !dbg !79
  %3 = load i32, i32* %i, align 4, !dbg !81
  %idx.ext = sext i32 %3 to i64, !dbg !82
  %add.ptr = getelementptr inbounds i8, i8* %2, i64 %idx.ext, !dbg !82
  store i8 97, i8* %add.ptr, align 1, !dbg !83
  br label %for.inc, !dbg !84

for.inc:                                          ; preds = %for.body
  %4 = load i32, i32* %i, align 4, !dbg !85
  %inc = add nsw i32 %4, 1, !dbg !85
  store i32 %inc, i32* %i, align 4, !dbg !85
  br label %for.cond, !dbg !87, !llvm.loop !88

for.end:                                          ; preds = %for.cond
  %5 = load i8*, i8** %ptr, align 8, !dbg !90
  call void @free(i8* %5) #3, !dbg !91
  br label %return, !dbg !92

return:                                           ; preds = %for.end, %if.then
  ret void, !dbg !93
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !95 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @double_free_003_good(), !dbg !98
  call void @double_free_003_bad(), !dbg !99
  ret i32 0, !dbg !100
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8}
!llvm.ident = !{!9}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (tags/RELEASE_390/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3)
!1 = !DIFile(filename: "415_double_free_3.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/itc/415")
!2 = !{}
!3 = !{!4, !6}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64, align: 64)
!5 = !DIBasicType(name: "char", size: 8, align: 8, encoding: DW_ATE_signed_char)
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64, align: 64)
!7 = !{i32 2, !"Dwarf Version", i32 4}
!8 = !{i32 2, !"Debug Info Version", i32 3}
!9 = !{!"clang version 3.9.0 (tags/RELEASE_390/final)"}
!10 = distinct !DISubprogram(name: "double_free_003_bad", scope: !11, file: !11, line: 18, type: !12, isLocal: false, isDefinition: true, scopeLine: 19, isOptimized: false, unit: !0, variables: !2)
!11 = !DIFile(filename: "./415_double_free_3.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/itc/415")
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
!35 = !DILocation(line: 26, column: 5, scope: !36)
!36 = distinct !DILexicalBlock(scope: !32, file: !11, line: 25, column: 2)
!37 = !DILocation(line: 26, column: 9, scope: !36)
!38 = !DILocation(line: 26, column: 8, scope: !36)
!39 = !DILocation(line: 26, column: 11, scope: !36)
!40 = !DILocation(line: 27, column: 6, scope: !41)
!41 = distinct !DILexicalBlock(scope: !36, file: !11, line: 27, column: 6)
!42 = !DILocation(line: 27, column: 7, scope: !41)
!43 = !DILocation(line: 27, column: 6, scope: !36)
!44 = !DILocation(line: 29, column: 9, scope: !45)
!45 = distinct !DILexicalBlock(scope: !41, file: !11, line: 28, column: 3)
!46 = !DILocation(line: 29, column: 4, scope: !45)
!47 = !DILocation(line: 30, column: 3, scope: !45)
!48 = !DILocation(line: 31, column: 2, scope: !36)
!49 = !DILocation(line: 24, column: 16, scope: !50)
!50 = !DILexicalBlockFile(scope: !32, file: !11, discriminator: 2)
!51 = !DILocation(line: 24, column: 2, scope: !50)
!52 = distinct !{!52, !53}
!53 = !DILocation(line: 24, column: 2, scope: !10)
!54 = !DILocation(line: 32, column: 7, scope: !10)
!55 = !DILocation(line: 32, column: 2, scope: !10)
!56 = !DILocation(line: 33, column: 1, scope: !10)
!57 = !DILocation(line: 33, column: 1, scope: !58)
!58 = !DILexicalBlockFile(scope: !10, file: !11, discriminator: 1)
!59 = distinct !DISubprogram(name: "double_free_003_good", scope: !11, file: !11, line: 40, type: !12, isLocal: false, isDefinition: true, scopeLine: 41, isOptimized: false, unit: !0, variables: !2)
!60 = !DILocalVariable(name: "ptr", scope: !59, file: !11, line: 42, type: !4)
!61 = !DILocation(line: 42, column: 8, scope: !59)
!62 = !DILocation(line: 42, column: 21, scope: !59)
!63 = !DILocation(line: 43, column: 6, scope: !64)
!64 = distinct !DILexicalBlock(scope: !59, file: !11, line: 43, column: 6)
!65 = !DILocation(line: 43, column: 10, scope: !64)
!66 = !DILocation(line: 43, column: 6, scope: !59)
!67 = !DILocation(line: 43, column: 19, scope: !68)
!68 = !DILexicalBlockFile(scope: !64, file: !11, discriminator: 1)
!69 = !DILocalVariable(name: "i", scope: !59, file: !11, line: 44, type: !25)
!70 = !DILocation(line: 44, column: 6, scope: !59)
!71 = !DILocation(line: 46, column: 7, scope: !72)
!72 = distinct !DILexicalBlock(scope: !59, file: !11, line: 46, column: 2)
!73 = !DILocation(line: 46, column: 6, scope: !72)
!74 = !DILocation(line: 46, column: 10, scope: !75)
!75 = !DILexicalBlockFile(scope: !76, file: !11, discriminator: 1)
!76 = distinct !DILexicalBlock(scope: !72, file: !11, line: 46, column: 2)
!77 = !DILocation(line: 46, column: 11, scope: !75)
!78 = !DILocation(line: 46, column: 2, scope: !75)
!79 = !DILocation(line: 48, column: 5, scope: !80)
!80 = distinct !DILexicalBlock(scope: !76, file: !11, line: 47, column: 2)
!81 = !DILocation(line: 48, column: 9, scope: !80)
!82 = !DILocation(line: 48, column: 8, scope: !80)
!83 = !DILocation(line: 48, column: 11, scope: !80)
!84 = !DILocation(line: 50, column: 2, scope: !80)
!85 = !DILocation(line: 46, column: 16, scope: !86)
!86 = !DILexicalBlockFile(scope: !76, file: !11, discriminator: 2)
!87 = !DILocation(line: 46, column: 2, scope: !86)
!88 = distinct !{!88, !89}
!89 = !DILocation(line: 46, column: 2, scope: !59)
!90 = !DILocation(line: 52, column: 7, scope: !59)
!91 = !DILocation(line: 52, column: 2, scope: !59)
!92 = !DILocation(line: 53, column: 1, scope: !59)
!93 = !DILocation(line: 53, column: 1, scope: !94)
!94 = !DILexicalBlockFile(scope: !59, file: !11, discriminator: 1)
!95 = distinct !DISubprogram(name: "main", scope: !11, file: !11, line: 60, type: !96, isLocal: false, isDefinition: true, scopeLine: 61, isOptimized: false, unit: !0, variables: !2)
!96 = !DISubroutineType(types: !97)
!97 = !{!25}
!98 = !DILocation(line: 62, column: 2, scope: !95)
!99 = !DILocation(line: 63, column: 2, scope: !95)
!100 = !DILocation(line: 64, column: 2, scope: !95)
