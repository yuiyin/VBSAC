; ModuleID = './401_memory_leak_1.c'
source_filename = "./401_memory_leak_1.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: nounwind uwtable
define void @memory_leak_001_bad() #0 !dbg !10 {
entry:
  %i = alloca i32, align 4
  %buf = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i32* %i, metadata !14, metadata !16), !dbg !17
  call void @llvm.dbg.declare(metadata i8** %buf, metadata !18, metadata !16), !dbg !19
  store i32 0, i32* %i, align 4, !dbg !20
  br label %for.cond, !dbg !22

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !23
  %cmp = icmp slt i32 %0, 1, !dbg !26
  br i1 %cmp, label %for.body, label %for.end, !dbg !27

for.body:                                         ; preds = %for.cond
  %call = call noalias i8* @calloc(i64 5, i64 1) #3, !dbg !28
  store i8* %call, i8** %buf, align 8, !dbg !30
  %1 = load i8*, i8** %buf, align 8, !dbg !31
  %cmp1 = icmp ne i8* %1, null, !dbg !33
  br i1 %cmp1, label %if.then, label %if.end, !dbg !34

if.then:                                          ; preds = %for.body
  %2 = load i8*, i8** %buf, align 8, !dbg !35
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 0, !dbg !35
  store i8 1, i8* %arrayidx, align 1, !dbg !37
  br label %if.end, !dbg !38

if.end:                                           ; preds = %if.then, %for.body
  br label %for.inc, !dbg !39

for.inc:                                          ; preds = %if.end
  %3 = load i32, i32* %i, align 4, !dbg !40
  %inc = add nsw i32 %3, 1, !dbg !40
  store i32 %inc, i32* %i, align 4, !dbg !40
  br label %for.cond, !dbg !42, !llvm.loop !43

for.end:                                          ; preds = %for.cond
  ret void, !dbg !45
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare noalias i8* @calloc(i64, i64) #2

; Function Attrs: nounwind uwtable
define void @memory_leak_001_good() #0 !dbg !46 {
entry:
  %i = alloca i32, align 4
  %buf = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i32* %i, metadata !47, metadata !16), !dbg !48
  call void @llvm.dbg.declare(metadata i8** %buf, metadata !49, metadata !16), !dbg !50
  store i32 0, i32* %i, align 4, !dbg !51
  br label %for.cond, !dbg !53

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !54
  %cmp = icmp slt i32 %0, 1, !dbg !57
  br i1 %cmp, label %for.body, label %for.end, !dbg !58

for.body:                                         ; preds = %for.cond
  %call = call noalias i8* @calloc(i64 5, i64 1) #3, !dbg !59
  store i8* %call, i8** %buf, align 8, !dbg !61
  %1 = load i8*, i8** %buf, align 8, !dbg !62
  %cmp1 = icmp ne i8* %1, null, !dbg !64
  br i1 %cmp1, label %if.then, label %if.end, !dbg !65

if.then:                                          ; preds = %for.body
  %2 = load i8*, i8** %buf, align 8, !dbg !66
  %add.ptr = getelementptr inbounds i8, i8* %2, i64 1, !dbg !68
  store i8 1, i8* %add.ptr, align 1, !dbg !69
  %3 = load i8*, i8** %buf, align 8, !dbg !70
  call void @free(i8* %3) #3, !dbg !71
  br label %if.end, !dbg !72

if.end:                                           ; preds = %if.then, %for.body
  br label %for.inc, !dbg !73

for.inc:                                          ; preds = %if.end
  %4 = load i32, i32* %i, align 4, !dbg !74
  %inc = add nsw i32 %4, 1, !dbg !74
  store i32 %inc, i32* %i, align 4, !dbg !74
  br label %for.cond, !dbg !76, !llvm.loop !77

for.end:                                          ; preds = %for.cond
  ret void, !dbg !79
}

; Function Attrs: nounwind
declare void @free(i8*) #2

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !80 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @memory_leak_001_good(), !dbg !83
  call void @memory_leak_001_bad(), !dbg !84
  ret i32 0, !dbg !85
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8}
!llvm.ident = !{!9}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (tags/RELEASE_390/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3)
!1 = !DIFile(filename: "401_memory_leak_1.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/itc/401")
!2 = !{}
!3 = !{!4, !6}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64, align: 64)
!5 = !DIBasicType(name: "char", size: 8, align: 8, encoding: DW_ATE_signed_char)
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64, align: 64)
!7 = !{i32 2, !"Dwarf Version", i32 4}
!8 = !{i32 2, !"Debug Info Version", i32 3}
!9 = !{!"clang version 3.9.0 (tags/RELEASE_390/final)"}
!10 = distinct !DISubprogram(name: "memory_leak_001_bad", scope: !11, file: !11, line: 17, type: !12, isLocal: false, isDefinition: true, scopeLine: 18, isOptimized: false, unit: !0, variables: !2)
!11 = !DIFile(filename: "./401_memory_leak_1.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/itc/401")
!12 = !DISubroutineType(types: !13)
!13 = !{null}
!14 = !DILocalVariable(name: "i", scope: !10, file: !11, line: 19, type: !15)
!15 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!16 = !DIExpression()
!17 = !DILocation(line: 19, column: 6, scope: !10)
!18 = !DILocalVariable(name: "buf", scope: !10, file: !11, line: 20, type: !4)
!19 = !DILocation(line: 20, column: 8, scope: !10)
!20 = !DILocation(line: 21, column: 8, scope: !21)
!21 = distinct !DILexicalBlock(scope: !10, file: !11, line: 21, column: 2)
!22 = !DILocation(line: 21, column: 7, scope: !21)
!23 = !DILocation(line: 21, column: 11, scope: !24)
!24 = !DILexicalBlockFile(scope: !25, file: !11, discriminator: 1)
!25 = distinct !DILexicalBlock(scope: !21, file: !11, line: 21, column: 2)
!26 = !DILocation(line: 21, column: 13, scope: !24)
!27 = !DILocation(line: 21, column: 2, scope: !24)
!28 = !DILocation(line: 23, column: 15, scope: !29)
!29 = distinct !DILexicalBlock(scope: !25, file: !11, line: 22, column: 2)
!30 = !DILocation(line: 23, column: 6, scope: !29)
!31 = !DILocation(line: 24, column: 6, scope: !32)
!32 = distinct !DILexicalBlock(scope: !29, file: !11, line: 24, column: 6)
!33 = !DILocation(line: 24, column: 9, scope: !32)
!34 = !DILocation(line: 24, column: 6, scope: !29)
!35 = !DILocation(line: 26, column: 4, scope: !36)
!36 = distinct !DILexicalBlock(scope: !32, file: !11, line: 25, column: 3)
!37 = !DILocation(line: 26, column: 10, scope: !36)
!38 = !DILocation(line: 27, column: 3, scope: !36)
!39 = !DILocation(line: 28, column: 2, scope: !29)
!40 = !DILocation(line: 21, column: 18, scope: !41)
!41 = !DILexicalBlockFile(scope: !25, file: !11, discriminator: 2)
!42 = !DILocation(line: 21, column: 2, scope: !41)
!43 = distinct !{!43, !44}
!44 = !DILocation(line: 21, column: 2, scope: !10)
!45 = !DILocation(line: 29, column: 1, scope: !10)
!46 = distinct !DISubprogram(name: "memory_leak_001_good", scope: !11, file: !11, line: 35, type: !12, isLocal: false, isDefinition: true, scopeLine: 36, isOptimized: false, unit: !0, variables: !2)
!47 = !DILocalVariable(name: "i", scope: !46, file: !11, line: 37, type: !15)
!48 = !DILocation(line: 37, column: 6, scope: !46)
!49 = !DILocalVariable(name: "buf", scope: !46, file: !11, line: 38, type: !4)
!50 = !DILocation(line: 38, column: 8, scope: !46)
!51 = !DILocation(line: 39, column: 8, scope: !52)
!52 = distinct !DILexicalBlock(scope: !46, file: !11, line: 39, column: 2)
!53 = !DILocation(line: 39, column: 7, scope: !52)
!54 = !DILocation(line: 39, column: 12, scope: !55)
!55 = !DILexicalBlockFile(scope: !56, file: !11, discriminator: 1)
!56 = distinct !DILexicalBlock(scope: !52, file: !11, line: 39, column: 2)
!57 = !DILocation(line: 39, column: 13, scope: !55)
!58 = !DILocation(line: 39, column: 2, scope: !55)
!59 = !DILocation(line: 41, column: 15, scope: !60)
!60 = distinct !DILexicalBlock(scope: !56, file: !11, line: 40, column: 2)
!61 = !DILocation(line: 41, column: 6, scope: !60)
!62 = !DILocation(line: 42, column: 6, scope: !63)
!63 = distinct !DILexicalBlock(scope: !60, file: !11, line: 42, column: 6)
!64 = !DILocation(line: 42, column: 9, scope: !63)
!65 = !DILocation(line: 42, column: 6, scope: !60)
!66 = !DILocation(line: 44, column: 6, scope: !67)
!67 = distinct !DILexicalBlock(scope: !63, file: !11, line: 43, column: 3)
!68 = !DILocation(line: 44, column: 9, scope: !67)
!69 = !DILocation(line: 44, column: 12, scope: !67)
!70 = !DILocation(line: 45, column: 13, scope: !67)
!71 = !DILocation(line: 45, column: 7, scope: !67)
!72 = !DILocation(line: 46, column: 3, scope: !67)
!73 = !DILocation(line: 47, column: 2, scope: !60)
!74 = !DILocation(line: 39, column: 18, scope: !75)
!75 = !DILexicalBlockFile(scope: !56, file: !11, discriminator: 2)
!76 = !DILocation(line: 39, column: 2, scope: !75)
!77 = distinct !{!77, !78}
!78 = !DILocation(line: 39, column: 2, scope: !46)
!79 = !DILocation(line: 48, column: 1, scope: !46)
!80 = distinct !DISubprogram(name: "main", scope: !11, file: !11, line: 55, type: !81, isLocal: false, isDefinition: true, scopeLine: 56, isOptimized: false, unit: !0, variables: !2)
!81 = !DISubroutineType(types: !82)
!82 = !{!15}
!83 = !DILocation(line: 57, column: 2, scope: !80)
!84 = !DILocation(line: 58, column: 2, scope: !80)
!85 = !DILocation(line: 59, column: 2, scope: !80)
