; ModuleID = './415_double_free_9.c'
source_filename = "./415_double_free_9.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: nounwind uwtable
define void @double_free_009_bad() #0 !dbg !10 {
entry:
  %ptr = alloca i8*, align 8
  %flag = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i8** %ptr, metadata !14, metadata !15), !dbg !16
  %call = call noalias i8* @malloc(i64 1) #3, !dbg !17
  store i8* %call, i8** %ptr, align 8, !dbg !16
  %0 = load i8*, i8** %ptr, align 8, !dbg !18
  %cmp = icmp eq i8* %0, null, !dbg !20
  br i1 %cmp, label %if.then, label %if.end, !dbg !21

if.then:                                          ; preds = %entry
  br label %return, !dbg !22

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %flag, metadata !24, metadata !15), !dbg !26
  store i32 0, i32* %flag, align 4, !dbg !26
  br label %while.cond, !dbg !27

while.cond:                                       ; preds = %while.body, %if.end
  %1 = load i32, i32* %flag, align 4, !dbg !28
  %cmp1 = icmp eq i32 %1, 0, !dbg !30
  br i1 %cmp1, label %while.body, label %while.end, !dbg !31

while.body:                                       ; preds = %while.cond
  %2 = load i8*, i8** %ptr, align 8, !dbg !32
  call void @free(i8* %2) #3, !dbg !34
  %3 = load i32, i32* %flag, align 4, !dbg !35
  %inc = add nsw i32 %3, 1, !dbg !35
  store i32 %inc, i32* %flag, align 4, !dbg !35
  br label %while.cond, !dbg !36, !llvm.loop !38

while.end:                                        ; preds = %while.cond
  %4 = load i8*, i8** %ptr, align 8, !dbg !39
  call void @free(i8* %4) #3, !dbg !40
  br label %return, !dbg !41

return:                                           ; preds = %while.end, %if.then
  ret void, !dbg !42
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #2

; Function Attrs: nounwind
declare void @free(i8*) #2

; Function Attrs: nounwind uwtable
define void @double_free_009_good() #0 !dbg !43 {
entry:
  %ptr = alloca i8*, align 8
  %flag = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i8** %ptr, metadata !44, metadata !15), !dbg !45
  %call = call noalias i8* @malloc(i64 1) #3, !dbg !46
  store i8* %call, i8** %ptr, align 8, !dbg !45
  %0 = load i8*, i8** %ptr, align 8, !dbg !47
  %cmp = icmp eq i8* %0, null, !dbg !49
  br i1 %cmp, label %if.then, label %if.end, !dbg !50

if.then:                                          ; preds = %entry
  br label %return, !dbg !51

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %flag, metadata !53, metadata !15), !dbg !54
  store i32 0, i32* %flag, align 4, !dbg !54
  br label %while.cond, !dbg !55

while.cond:                                       ; preds = %while.body, %if.end
  %1 = load i32, i32* %flag, align 4, !dbg !56
  %cmp1 = icmp eq i32 %1, 1, !dbg !58
  br i1 %cmp1, label %while.body, label %while.end, !dbg !59

while.body:                                       ; preds = %while.cond
  %2 = load i8*, i8** %ptr, align 8, !dbg !60
  call void @free(i8* %2) #3, !dbg !62
  %3 = load i32, i32* %flag, align 4, !dbg !63
  %inc = add nsw i32 %3, 1, !dbg !63
  store i32 %inc, i32* %flag, align 4, !dbg !63
  br label %while.cond, !dbg !64, !llvm.loop !66

while.end:                                        ; preds = %while.cond
  %4 = load i8*, i8** %ptr, align 8, !dbg !67
  call void @free(i8* %4) #3, !dbg !68
  br label %return, !dbg !69

return:                                           ; preds = %while.end, %if.then
  ret void, !dbg !70
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !71 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @double_free_009_good(), !dbg !74
  call void @double_free_009_bad(), !dbg !75
  ret i32 0, !dbg !76
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8}
!llvm.ident = !{!9}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (tags/RELEASE_390/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3)
!1 = !DIFile(filename: "415_double_free_9.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/itc/415")
!2 = !{}
!3 = !{!4, !6}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64, align: 64)
!5 = !DIBasicType(name: "char", size: 8, align: 8, encoding: DW_ATE_signed_char)
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64, align: 64)
!7 = !{i32 2, !"Dwarf Version", i32 4}
!8 = !{i32 2, !"Debug Info Version", i32 3}
!9 = !{!"clang version 3.9.0 (tags/RELEASE_390/final)"}
!10 = distinct !DISubprogram(name: "double_free_009_bad", scope: !11, file: !11, line: 18, type: !12, isLocal: false, isDefinition: true, scopeLine: 19, isOptimized: false, unit: !0, variables: !2)
!11 = !DIFile(filename: "./415_double_free_9.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/itc/415")
!12 = !DISubroutineType(types: !13)
!13 = !{null}
!14 = !DILocalVariable(name: "ptr", scope: !10, file: !11, line: 20, type: !4)
!15 = !DIExpression()
!16 = !DILocation(line: 20, column: 8, scope: !10)
!17 = !DILocation(line: 20, column: 21, scope: !10)
!18 = !DILocation(line: 21, column: 5, scope: !19)
!19 = distinct !DILexicalBlock(scope: !10, file: !11, line: 21, column: 5)
!20 = !DILocation(line: 21, column: 9, scope: !19)
!21 = !DILocation(line: 21, column: 5, scope: !10)
!22 = !DILocation(line: 21, column: 18, scope: !23)
!23 = !DILexicalBlockFile(scope: !19, file: !11, discriminator: 1)
!24 = !DILocalVariable(name: "flag", scope: !10, file: !11, line: 22, type: !25)
!25 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!26 = !DILocation(line: 22, column: 6, scope: !10)
!27 = !DILocation(line: 24, column: 2, scope: !10)
!28 = !DILocation(line: 24, column: 8, scope: !29)
!29 = !DILexicalBlockFile(scope: !10, file: !11, discriminator: 1)
!30 = !DILocation(line: 24, column: 12, scope: !29)
!31 = !DILocation(line: 24, column: 2, scope: !29)
!32 = !DILocation(line: 26, column: 8, scope: !33)
!33 = distinct !DILexicalBlock(scope: !10, file: !11, line: 25, column: 2)
!34 = !DILocation(line: 26, column: 3, scope: !33)
!35 = !DILocation(line: 27, column: 7, scope: !33)
!36 = !DILocation(line: 24, column: 2, scope: !37)
!37 = !DILexicalBlockFile(scope: !10, file: !11, discriminator: 2)
!38 = distinct !{!38, !27}
!39 = !DILocation(line: 29, column: 7, scope: !10)
!40 = !DILocation(line: 29, column: 2, scope: !10)
!41 = !DILocation(line: 30, column: 1, scope: !10)
!42 = !DILocation(line: 30, column: 1, scope: !29)
!43 = distinct !DISubprogram(name: "double_free_009_good", scope: !11, file: !11, line: 37, type: !12, isLocal: false, isDefinition: true, scopeLine: 38, isOptimized: false, unit: !0, variables: !2)
!44 = !DILocalVariable(name: "ptr", scope: !43, file: !11, line: 39, type: !4)
!45 = !DILocation(line: 39, column: 8, scope: !43)
!46 = !DILocation(line: 39, column: 21, scope: !43)
!47 = !DILocation(line: 40, column: 5, scope: !48)
!48 = distinct !DILexicalBlock(scope: !43, file: !11, line: 40, column: 5)
!49 = !DILocation(line: 40, column: 9, scope: !48)
!50 = !DILocation(line: 40, column: 5, scope: !43)
!51 = !DILocation(line: 40, column: 18, scope: !52)
!52 = !DILexicalBlockFile(scope: !48, file: !11, discriminator: 1)
!53 = !DILocalVariable(name: "flag", scope: !43, file: !11, line: 41, type: !25)
!54 = !DILocation(line: 41, column: 6, scope: !43)
!55 = !DILocation(line: 43, column: 2, scope: !43)
!56 = !DILocation(line: 43, column: 8, scope: !57)
!57 = !DILexicalBlockFile(scope: !43, file: !11, discriminator: 1)
!58 = !DILocation(line: 43, column: 12, scope: !57)
!59 = !DILocation(line: 43, column: 2, scope: !57)
!60 = !DILocation(line: 45, column: 8, scope: !61)
!61 = distinct !DILexicalBlock(scope: !43, file: !11, line: 44, column: 2)
!62 = !DILocation(line: 45, column: 3, scope: !61)
!63 = !DILocation(line: 46, column: 7, scope: !61)
!64 = !DILocation(line: 43, column: 2, scope: !65)
!65 = !DILexicalBlockFile(scope: !43, file: !11, discriminator: 2)
!66 = distinct !{!66, !55}
!67 = !DILocation(line: 48, column: 7, scope: !43)
!68 = !DILocation(line: 48, column: 2, scope: !43)
!69 = !DILocation(line: 49, column: 1, scope: !43)
!70 = !DILocation(line: 49, column: 1, scope: !57)
!71 = distinct !DISubprogram(name: "main", scope: !11, file: !11, line: 56, type: !72, isLocal: false, isDefinition: true, scopeLine: 57, isOptimized: false, unit: !0, variables: !2)
!72 = !DISubroutineType(types: !73)
!73 = !{!25}
!74 = !DILocation(line: 58, column: 2, scope: !71)
!75 = !DILocation(line: 59, column: 2, scope: !71)
!76 = !DILocation(line: 60, column: 2, scope: !71)
