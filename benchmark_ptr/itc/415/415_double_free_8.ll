; ModuleID = './415_double_free_8.c'
source_filename = "./415_double_free_8.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@double_free_function_008_gbl_ptr_bad = common global i8* null, align 8
@double_free_function_008_gbl_ptr_good = common global i8* null, align 8

; Function Attrs: nounwind uwtable
define void @double_free_function_008_bad() #0 !dbg !14 {
entry:
  %0 = load i8*, i8** @double_free_function_008_gbl_ptr_bad, align 8, !dbg !17
  call void @free(i8* %0) #2, !dbg !18
  ret void, !dbg !19
}

; Function Attrs: nounwind
declare void @free(i8*) #1

; Function Attrs: nounwind uwtable
define void @double_free_008_bad() #0 !dbg !20 {
entry:
  %call = call noalias i8* @malloc(i64 1) #2, !dbg !21
  store i8* %call, i8** @double_free_function_008_gbl_ptr_bad, align 8, !dbg !22
  %0 = load i8*, i8** @double_free_function_008_gbl_ptr_bad, align 8, !dbg !23
  %cmp = icmp eq i8* %0, null, !dbg !25
  br i1 %cmp, label %if.then, label %if.end, !dbg !26

if.then:                                          ; preds = %entry
  br label %return, !dbg !27

if.end:                                           ; preds = %entry
  call void @double_free_function_008_bad(), !dbg !29
  %1 = load i8*, i8** @double_free_function_008_gbl_ptr_bad, align 8, !dbg !30
  call void @free(i8* %1) #2, !dbg !31
  br label %return, !dbg !32

return:                                           ; preds = %if.end, %if.then
  ret void, !dbg !33
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #1

; Function Attrs: nounwind uwtable
define void @double_free_function_008_good() #0 !dbg !35 {
entry:
  %0 = load i8*, i8** @double_free_function_008_gbl_ptr_good, align 8, !dbg !36
  call void @free(i8* %0) #2, !dbg !37
  ret void, !dbg !38
}

; Function Attrs: nounwind uwtable
define void @double_free_008_good() #0 !dbg !39 {
entry:
  %call = call noalias i8* @malloc(i64 1) #2, !dbg !40
  store i8* %call, i8** @double_free_function_008_gbl_ptr_good, align 8, !dbg !41
  %0 = load i8*, i8** @double_free_function_008_gbl_ptr_good, align 8, !dbg !42
  %cmp = icmp eq i8* %0, null, !dbg !44
  br i1 %cmp, label %if.then, label %if.end, !dbg !45

if.then:                                          ; preds = %entry
  br label %return, !dbg !46

if.end:                                           ; preds = %entry
  call void @double_free_function_008_good(), !dbg !48
  br label %return, !dbg !49

return:                                           ; preds = %if.end, %if.then
  ret void, !dbg !50
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !52 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @double_free_008_good(), !dbg !56
  call void @double_free_008_bad(), !dbg !57
  ret i32 0, !dbg !58
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (tags/RELEASE_390/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, globals: !7)
!1 = !DIFile(filename: "415_double_free_8.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/itc/415")
!2 = !{}
!3 = !{!4, !6}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64, align: 64)
!5 = !DIBasicType(name: "char", size: 8, align: 8, encoding: DW_ATE_signed_char)
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64, align: 64)
!7 = !{!8, !10}
!8 = distinct !DIGlobalVariable(name: "double_free_function_008_gbl_ptr_bad", scope: !0, file: !9, line: 17, type: !4, isLocal: false, isDefinition: true, variable: i8** @double_free_function_008_gbl_ptr_bad)
!9 = !DIFile(filename: "./415_double_free_8.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/itc/415")
!10 = distinct !DIGlobalVariable(name: "double_free_function_008_gbl_ptr_good", scope: !0, file: !9, line: 35, type: !4, isLocal: false, isDefinition: true, variable: i8** @double_free_function_008_gbl_ptr_good)
!11 = !{i32 2, !"Dwarf Version", i32 4}
!12 = !{i32 2, !"Debug Info Version", i32 3}
!13 = !{!"clang version 3.9.0 (tags/RELEASE_390/final)"}
!14 = distinct !DISubprogram(name: "double_free_function_008_bad", scope: !9, file: !9, line: 18, type: !15, isLocal: false, isDefinition: true, scopeLine: 19, isOptimized: false, unit: !0, variables: !2)
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !DILocation(line: 20, column: 8, scope: !14)
!18 = !DILocation(line: 20, column: 2, scope: !14)
!19 = !DILocation(line: 21, column: 1, scope: !14)
!20 = distinct !DISubprogram(name: "double_free_008_bad", scope: !9, file: !9, line: 23, type: !15, isLocal: false, isDefinition: true, scopeLine: 24, isOptimized: false, unit: !0, variables: !2)
!21 = !DILocation(line: 25, column: 48, scope: !20)
!22 = !DILocation(line: 25, column: 38, scope: !20)
!23 = !DILocation(line: 26, column: 5, scope: !24)
!24 = distinct !DILexicalBlock(scope: !20, file: !9, line: 26, column: 5)
!25 = !DILocation(line: 26, column: 42, scope: !24)
!26 = !DILocation(line: 26, column: 5, scope: !20)
!27 = !DILocation(line: 26, column: 51, scope: !28)
!28 = !DILexicalBlockFile(scope: !24, file: !9, discriminator: 1)
!29 = !DILocation(line: 27, column: 2, scope: !20)
!30 = !DILocation(line: 28, column: 7, scope: !20)
!31 = !DILocation(line: 28, column: 2, scope: !20)
!32 = !DILocation(line: 29, column: 1, scope: !20)
!33 = !DILocation(line: 29, column: 1, scope: !34)
!34 = !DILexicalBlockFile(scope: !20, file: !9, discriminator: 1)
!35 = distinct !DISubprogram(name: "double_free_function_008_good", scope: !9, file: !9, line: 36, type: !15, isLocal: false, isDefinition: true, scopeLine: 37, isOptimized: false, unit: !0, variables: !2)
!36 = !DILocation(line: 38, column: 8, scope: !35)
!37 = !DILocation(line: 38, column: 2, scope: !35)
!38 = !DILocation(line: 39, column: 1, scope: !35)
!39 = distinct !DISubprogram(name: "double_free_008_good", scope: !9, file: !9, line: 41, type: !15, isLocal: false, isDefinition: true, scopeLine: 42, isOptimized: false, unit: !0, variables: !2)
!40 = !DILocation(line: 43, column: 49, scope: !39)
!41 = !DILocation(line: 43, column: 39, scope: !39)
!42 = !DILocation(line: 44, column: 6, scope: !43)
!43 = distinct !DILexicalBlock(scope: !39, file: !9, line: 44, column: 6)
!44 = !DILocation(line: 44, column: 44, scope: !43)
!45 = !DILocation(line: 44, column: 6, scope: !39)
!46 = !DILocation(line: 44, column: 53, scope: !47)
!47 = !DILexicalBlockFile(scope: !43, file: !9, discriminator: 1)
!48 = !DILocation(line: 45, column: 2, scope: !39)
!49 = !DILocation(line: 46, column: 1, scope: !39)
!50 = !DILocation(line: 46, column: 1, scope: !51)
!51 = !DILexicalBlockFile(scope: !39, file: !9, discriminator: 1)
!52 = distinct !DISubprogram(name: "main", scope: !9, file: !9, line: 53, type: !53, isLocal: false, isDefinition: true, scopeLine: 54, isOptimized: false, unit: !0, variables: !2)
!53 = !DISubroutineType(types: !54)
!54 = !{!55}
!55 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!56 = !DILocation(line: 55, column: 2, scope: !52)
!57 = !DILocation(line: 56, column: 2, scope: !52)
!58 = !DILocation(line: 57, column: 2, scope: !52)
