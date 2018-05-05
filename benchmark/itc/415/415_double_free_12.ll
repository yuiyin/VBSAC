; ModuleID = './415_double_free_12.c'
source_filename = "./415_double_free_12.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: nounwind uwtable
define void @double_free_012_bad() #0 !dbg !10 {
entry:
  %ptr = alloca i8*, align 8
  %a = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i8** %ptr, metadata !14, metadata !15), !dbg !16
  %call = call noalias i8* @malloc(i64 1) #3, !dbg !17
  store i8* %call, i8** %ptr, align 8, !dbg !16
  %0 = load i8*, i8** %ptr, align 8, !dbg !18
  %cmp = icmp eq i8* %0, null, !dbg !20
  br i1 %cmp, label %if.then, label %if.end, !dbg !21

if.then:                                          ; preds = %entry
  br label %for.end, !dbg !22

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %a, metadata !24, metadata !15), !dbg !26
  store i32 0, i32* %a, align 4, !dbg !26
  store i32 0, i32* %a, align 4, !dbg !27
  br label %for.cond, !dbg !29

for.cond:                                         ; preds = %for.inc, %if.end
  %1 = load i32, i32* %a, align 4, !dbg !30
  %cmp1 = icmp slt i32 %1, 2, !dbg !33
  br i1 %cmp1, label %for.body, label %for.end, !dbg !34

for.body:                                         ; preds = %for.cond
  %2 = load i8*, i8** %ptr, align 8, !dbg !35
  call void @free(i8* %2) #3, !dbg !37
  br label %for.inc, !dbg !38

for.inc:                                          ; preds = %for.body
  %3 = load i32, i32* %a, align 4, !dbg !39
  %inc = add nsw i32 %3, 1, !dbg !39
  store i32 %inc, i32* %a, align 4, !dbg !39
  br label %for.cond, !dbg !41, !llvm.loop !42

for.end:                                          ; preds = %if.then, %for.cond
  ret void, !dbg !44
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #2

; Function Attrs: nounwind
declare void @free(i8*) #2

; Function Attrs: nounwind uwtable
define void @double_free_012_good() #0 !dbg !45 {
entry:
  %ptr = alloca i8*, align 8
  %a = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i8** %ptr, metadata !46, metadata !15), !dbg !47
  %call = call noalias i8* @malloc(i64 1) #3, !dbg !48
  store i8* %call, i8** %ptr, align 8, !dbg !47
  %0 = load i8*, i8** %ptr, align 8, !dbg !49
  %cmp = icmp eq i8* %0, null, !dbg !51
  br i1 %cmp, label %if.then, label %if.end, !dbg !52

if.then:                                          ; preds = %entry
  br label %for.end, !dbg !53

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %a, metadata !55, metadata !15), !dbg !56
  store i32 0, i32* %a, align 4, !dbg !56
  store i32 0, i32* %a, align 4, !dbg !57
  br label %for.cond, !dbg !59

for.cond:                                         ; preds = %for.inc, %if.end
  %1 = load i32, i32* %a, align 4, !dbg !60
  %cmp1 = icmp slt i32 %1, 1, !dbg !63
  br i1 %cmp1, label %for.body, label %for.end, !dbg !64

for.body:                                         ; preds = %for.cond
  %2 = load i8*, i8** %ptr, align 8, !dbg !65
  call void @free(i8* %2) #3, !dbg !67
  br label %for.inc, !dbg !68

for.inc:                                          ; preds = %for.body
  %3 = load i32, i32* %a, align 4, !dbg !69
  %inc = add nsw i32 %3, 1, !dbg !69
  store i32 %inc, i32* %a, align 4, !dbg !69
  br label %for.cond, !dbg !71, !llvm.loop !72

for.end:                                          ; preds = %if.then, %for.cond
  ret void, !dbg !74
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !75 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @double_free_012_good(), !dbg !78
  call void @double_free_012_bad(), !dbg !79
  ret i32 0, !dbg !80
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8}
!llvm.ident = !{!9}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (tags/RELEASE_390/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3)
!1 = !DIFile(filename: "415_double_free_12.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/itc/415")
!2 = !{}
!3 = !{!4, !6}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64, align: 64)
!5 = !DIBasicType(name: "char", size: 8, align: 8, encoding: DW_ATE_signed_char)
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64, align: 64)
!7 = !{i32 2, !"Dwarf Version", i32 4}
!8 = !{i32 2, !"Debug Info Version", i32 3}
!9 = !{!"clang version 3.9.0 (tags/RELEASE_390/final)"}
!10 = distinct !DISubprogram(name: "double_free_012_bad", scope: !11, file: !11, line: 18, type: !12, isLocal: false, isDefinition: true, scopeLine: 19, isOptimized: false, unit: !0, variables: !2)
!11 = !DIFile(filename: "./415_double_free_12.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/itc/415")
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
!24 = !DILocalVariable(name: "a", scope: !10, file: !11, line: 22, type: !25)
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
!35 = !DILocation(line: 26, column: 8, scope: !36)
!36 = distinct !DILexicalBlock(scope: !32, file: !11, line: 25, column: 2)
!37 = !DILocation(line: 26, column: 3, scope: !36)
!38 = !DILocation(line: 27, column: 2, scope: !36)
!39 = !DILocation(line: 24, column: 15, scope: !40)
!40 = !DILexicalBlockFile(scope: !32, file: !11, discriminator: 2)
!41 = !DILocation(line: 24, column: 2, scope: !40)
!42 = distinct !{!42, !43}
!43 = !DILocation(line: 24, column: 2, scope: !10)
!44 = !DILocation(line: 28, column: 1, scope: !10)
!45 = distinct !DISubprogram(name: "double_free_012_good", scope: !11, file: !11, line: 35, type: !12, isLocal: false, isDefinition: true, scopeLine: 36, isOptimized: false, unit: !0, variables: !2)
!46 = !DILocalVariable(name: "ptr", scope: !45, file: !11, line: 37, type: !4)
!47 = !DILocation(line: 37, column: 8, scope: !45)
!48 = !DILocation(line: 37, column: 21, scope: !45)
!49 = !DILocation(line: 38, column: 6, scope: !50)
!50 = distinct !DILexicalBlock(scope: !45, file: !11, line: 38, column: 6)
!51 = !DILocation(line: 38, column: 10, scope: !50)
!52 = !DILocation(line: 38, column: 6, scope: !45)
!53 = !DILocation(line: 38, column: 19, scope: !54)
!54 = !DILexicalBlockFile(scope: !50, file: !11, discriminator: 1)
!55 = !DILocalVariable(name: "a", scope: !45, file: !11, line: 39, type: !25)
!56 = !DILocation(line: 39, column: 6, scope: !45)
!57 = !DILocation(line: 41, column: 7, scope: !58)
!58 = distinct !DILexicalBlock(scope: !45, file: !11, line: 41, column: 2)
!59 = !DILocation(line: 41, column: 6, scope: !58)
!60 = !DILocation(line: 41, column: 10, scope: !61)
!61 = !DILexicalBlockFile(scope: !62, file: !11, discriminator: 1)
!62 = distinct !DILexicalBlock(scope: !58, file: !11, line: 41, column: 2)
!63 = !DILocation(line: 41, column: 11, scope: !61)
!64 = !DILocation(line: 41, column: 2, scope: !61)
!65 = !DILocation(line: 43, column: 8, scope: !66)
!66 = distinct !DILexicalBlock(scope: !62, file: !11, line: 42, column: 2)
!67 = !DILocation(line: 43, column: 3, scope: !66)
!68 = !DILocation(line: 44, column: 2, scope: !66)
!69 = !DILocation(line: 41, column: 15, scope: !70)
!70 = !DILexicalBlockFile(scope: !62, file: !11, discriminator: 2)
!71 = !DILocation(line: 41, column: 2, scope: !70)
!72 = distinct !{!72, !73}
!73 = !DILocation(line: 41, column: 2, scope: !45)
!74 = !DILocation(line: 45, column: 1, scope: !45)
!75 = distinct !DISubprogram(name: "main", scope: !11, file: !11, line: 52, type: !76, isLocal: false, isDefinition: true, scopeLine: 53, isOptimized: false, unit: !0, variables: !2)
!76 = !DISubroutineType(types: !77)
!77 = !{!25}
!78 = !DILocation(line: 54, column: 2, scope: !75)
!79 = !DILocation(line: 55, column: 2, scope: !75)
!80 = !DILocation(line: 56, column: 2, scope: !75)
