; ModuleID = './415_double_free_1.c'
source_filename = "./415_double_free_1.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: nounwind uwtable
define void @double_free_001_bad() #0 !dbg !10 {
entry:
  %ptr = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %ptr, metadata !14, metadata !15), !dbg !16
  %call = call noalias i8* @malloc(i64 1) #3, !dbg !17
  store i8* %call, i8** %ptr, align 8, !dbg !16
  %0 = load i8*, i8** %ptr, align 8, !dbg !18
  %cmp = icmp eq i8* %0, null, !dbg !20
  br i1 %cmp, label %if.then, label %if.end, !dbg !21

if.then:                                          ; preds = %entry
  br label %return, !dbg !22

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %ptr, align 8, !dbg !24
  call void @free(i8* %1) #3, !dbg !25
  %2 = load i8*, i8** %ptr, align 8, !dbg !26
  call void @free(i8* %2) #3, !dbg !27
  br label %return, !dbg !28

return:                                           ; preds = %if.end, %if.then
  ret void, !dbg !29
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #2

; Function Attrs: nounwind
declare void @free(i8*) #2

; Function Attrs: nounwind uwtable
define void @double_free_001_good() #0 !dbg !31 {
entry:
  %ptr = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %ptr, metadata !32, metadata !15), !dbg !33
  %call = call noalias i8* @malloc(i64 1) #3, !dbg !34
  store i8* %call, i8** %ptr, align 8, !dbg !33
  %0 = load i8*, i8** %ptr, align 8, !dbg !35
  %cmp = icmp eq i8* %0, null, !dbg !37
  br i1 %cmp, label %if.then, label %if.end, !dbg !38

if.then:                                          ; preds = %entry
  br label %return, !dbg !39

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %ptr, align 8, !dbg !41
  call void @free(i8* %1) #3, !dbg !42
  br label %return, !dbg !43

return:                                           ; preds = %if.end, %if.then
  ret void, !dbg !44
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !46 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @double_free_001_good(), !dbg !50
  call void @double_free_001_bad(), !dbg !51
  ret i32 0, !dbg !52
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8}
!llvm.ident = !{!9}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (tags/RELEASE_390/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3)
!1 = !DIFile(filename: "415_double_free_1.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/itc/415")
!2 = !{}
!3 = !{!4, !6}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64, align: 64)
!5 = !DIBasicType(name: "char", size: 8, align: 8, encoding: DW_ATE_signed_char)
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64, align: 64)
!7 = !{i32 2, !"Dwarf Version", i32 4}
!8 = !{i32 2, !"Debug Info Version", i32 3}
!9 = !{!"clang version 3.9.0 (tags/RELEASE_390/final)"}
!10 = distinct !DISubprogram(name: "double_free_001_bad", scope: !11, file: !11, line: 19, type: !12, isLocal: false, isDefinition: true, scopeLine: 20, isOptimized: false, unit: !0, variables: !2)
!11 = !DIFile(filename: "./415_double_free_1.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/itc/415")
!12 = !DISubroutineType(types: !13)
!13 = !{null}
!14 = !DILocalVariable(name: "ptr", scope: !10, file: !11, line: 21, type: !4)
!15 = !DIExpression()
!16 = !DILocation(line: 21, column: 8, scope: !10)
!17 = !DILocation(line: 21, column: 21, scope: !10)
!18 = !DILocation(line: 22, column: 6, scope: !19)
!19 = distinct !DILexicalBlock(scope: !10, file: !11, line: 22, column: 6)
!20 = !DILocation(line: 22, column: 10, scope: !19)
!21 = !DILocation(line: 22, column: 6, scope: !10)
!22 = !DILocation(line: 22, column: 19, scope: !23)
!23 = !DILexicalBlockFile(scope: !19, file: !11, discriminator: 1)
!24 = !DILocation(line: 23, column: 7, scope: !10)
!25 = !DILocation(line: 23, column: 2, scope: !10)
!26 = !DILocation(line: 25, column: 7, scope: !10)
!27 = !DILocation(line: 25, column: 2, scope: !10)
!28 = !DILocation(line: 26, column: 1, scope: !10)
!29 = !DILocation(line: 26, column: 1, scope: !30)
!30 = !DILexicalBlockFile(scope: !10, file: !11, discriminator: 1)
!31 = distinct !DISubprogram(name: "double_free_001_good", scope: !11, file: !11, line: 33, type: !12, isLocal: false, isDefinition: true, scopeLine: 34, isOptimized: false, unit: !0, variables: !2)
!32 = !DILocalVariable(name: "ptr", scope: !31, file: !11, line: 35, type: !4)
!33 = !DILocation(line: 35, column: 8, scope: !31)
!34 = !DILocation(line: 35, column: 21, scope: !31)
!35 = !DILocation(line: 36, column: 6, scope: !36)
!36 = distinct !DILexicalBlock(scope: !31, file: !11, line: 36, column: 6)
!37 = !DILocation(line: 36, column: 10, scope: !36)
!38 = !DILocation(line: 36, column: 6, scope: !31)
!39 = !DILocation(line: 36, column: 19, scope: !40)
!40 = !DILexicalBlockFile(scope: !36, file: !11, discriminator: 1)
!41 = !DILocation(line: 37, column: 7, scope: !31)
!42 = !DILocation(line: 37, column: 2, scope: !31)
!43 = !DILocation(line: 38, column: 1, scope: !31)
!44 = !DILocation(line: 38, column: 1, scope: !45)
!45 = !DILexicalBlockFile(scope: !31, file: !11, discriminator: 1)
!46 = distinct !DISubprogram(name: "main", scope: !11, file: !11, line: 45, type: !47, isLocal: false, isDefinition: true, scopeLine: 46, isOptimized: false, unit: !0, variables: !2)
!47 = !DISubroutineType(types: !48)
!48 = !{!49}
!49 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!50 = !DILocation(line: 47, column: 2, scope: !46)
!51 = !DILocation(line: 48, column: 2, scope: !46)
!52 = !DILocation(line: 49, column: 2, scope: !46)
