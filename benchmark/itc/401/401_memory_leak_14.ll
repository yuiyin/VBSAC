; ModuleID = './401_memory_leak_14.c'
source_filename = "./401_memory_leak_14.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: nounwind uwtable
define void @memory_leak_0014_bad() #0 !dbg !10 {
entry:
  %fptr = alloca float*, align 8
  %fp1 = alloca float**, align 8
  %fp2 = alloca float**, align 8
  %fptr1 = alloca float*, align 8
  %fptr12 = alloca float*, align 8
  call void @llvm.dbg.declare(metadata float** %fptr, metadata !14, metadata !15), !dbg !16
  call void @llvm.dbg.declare(metadata float*** %fp1, metadata !17, metadata !15), !dbg !19
  store float** %fptr, float*** %fp1, align 8, !dbg !19
  call void @llvm.dbg.declare(metadata float*** %fp2, metadata !20, metadata !15), !dbg !21
  store float** %fptr, float*** %fp2, align 8, !dbg !21
  store float* null, float** %fptr, align 8, !dbg !22
  call void @llvm.dbg.declare(metadata float** %fptr1, metadata !23, metadata !15), !dbg !25
  %0 = load float**, float*** %fp1, align 8, !dbg !26
  %1 = load float*, float** %0, align 8, !dbg !27
  store float* %1, float** %fptr1, align 8, !dbg !25
  %call = call noalias i8* @calloc(i64 10, i64 4) #3, !dbg !28
  %2 = bitcast i8* %call to float*, !dbg !29
  store float* %2, float** %fptr1, align 8, !dbg !30
  %3 = load float*, float** %fptr1, align 8, !dbg !31
  %cmp = icmp ne float* %3, null, !dbg !33
  br i1 %cmp, label %if.then, label %if.end, !dbg !34

if.then:                                          ; preds = %entry
  %4 = load float*, float** %fptr1, align 8, !dbg !35
  %add.ptr = getelementptr inbounds float, float* %4, i64 3, !dbg !37
  store float 5.050000e+01, float* %add.ptr, align 4, !dbg !38
  %5 = load float*, float** %fptr1, align 8, !dbg !39
  %6 = load float**, float*** %fp1, align 8, !dbg !40
  store float* %5, float** %6, align 8, !dbg !41
  br label %if.end, !dbg !42

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata float** %fptr12, metadata !43, metadata !15), !dbg !45
  %7 = load float**, float*** %fp2, align 8, !dbg !46
  %8 = load float*, float** %7, align 8, !dbg !47
  store float* %8, float** %fptr12, align 8, !dbg !48
  ret void, !dbg !49
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare noalias i8* @calloc(i64, i64) #2

; Function Attrs: nounwind uwtable
define void @memory_leak_0014_good() #0 !dbg !50 {
entry:
  %fptr = alloca float*, align 8
  %fp1 = alloca float**, align 8
  %fp2 = alloca float**, align 8
  %fptr1 = alloca float*, align 8
  %fptr2 = alloca float*, align 8
  call void @llvm.dbg.declare(metadata float** %fptr, metadata !51, metadata !15), !dbg !52
  call void @llvm.dbg.declare(metadata float*** %fp1, metadata !53, metadata !15), !dbg !54
  store float** %fptr, float*** %fp1, align 8, !dbg !54
  call void @llvm.dbg.declare(metadata float*** %fp2, metadata !55, metadata !15), !dbg !56
  store float** %fptr, float*** %fp2, align 8, !dbg !56
  store float* null, float** %fptr, align 8, !dbg !57
  call void @llvm.dbg.declare(metadata float** %fptr1, metadata !58, metadata !15), !dbg !60
  %0 = load float**, float*** %fp1, align 8, !dbg !61
  %1 = load float*, float** %0, align 8, !dbg !62
  store float* %1, float** %fptr1, align 8, !dbg !60
  %call = call noalias i8* @calloc(i64 10, i64 4) #3, !dbg !63
  %2 = bitcast i8* %call to float*, !dbg !64
  store float* %2, float** %fptr1, align 8, !dbg !65
  %3 = load float*, float** %fptr1, align 8, !dbg !66
  %cmp = icmp ne float* %3, null, !dbg !68
  br i1 %cmp, label %if.then, label %if.end, !dbg !69

if.then:                                          ; preds = %entry
  %4 = load float*, float** %fptr1, align 8, !dbg !70
  %add.ptr = getelementptr inbounds float, float* %4, i64 3, !dbg !72
  store float 5.050000e+01, float* %add.ptr, align 4, !dbg !73
  %5 = load float*, float** %fptr1, align 8, !dbg !74
  %6 = load float**, float*** %fp1, align 8, !dbg !75
  store float* %5, float** %6, align 8, !dbg !76
  br label %if.end, !dbg !77

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata float** %fptr2, metadata !78, metadata !15), !dbg !80
  %7 = load float**, float*** %fp2, align 8, !dbg !81
  %8 = load float*, float** %7, align 8, !dbg !82
  store float* %8, float** %fptr2, align 8, !dbg !80
  %9 = load float*, float** %fptr2, align 8, !dbg !83
  %10 = bitcast float* %9 to i8*, !dbg !83
  call void @free(i8* %10) #3, !dbg !84
  ret void, !dbg !85
}

; Function Attrs: nounwind
declare void @free(i8*) #2

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !86 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @memory_leak_0014_good(), !dbg !90
  call void @memory_leak_0014_bad(), !dbg !91
  ret i32 0, !dbg !92
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8}
!llvm.ident = !{!9}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (tags/RELEASE_390/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3)
!1 = !DIFile(filename: "401_memory_leak_14.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/itc/401")
!2 = !{}
!3 = !{!4, !6}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64, align: 64)
!5 = !DIBasicType(name: "float", size: 32, align: 32, encoding: DW_ATE_float)
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64, align: 64)
!7 = !{i32 2, !"Dwarf Version", i32 4}
!8 = !{i32 2, !"Debug Info Version", i32 3}
!9 = !{!"clang version 3.9.0 (tags/RELEASE_390/final)"}
!10 = distinct !DISubprogram(name: "memory_leak_0014_bad", scope: !11, file: !11, line: 17, type: !12, isLocal: false, isDefinition: true, scopeLine: 18, isOptimized: false, unit: !0, variables: !2)
!11 = !DIFile(filename: "./401_memory_leak_14.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/itc/401")
!12 = !DISubroutineType(types: !13)
!13 = !{null}
!14 = !DILocalVariable(name: "fptr", scope: !10, file: !11, line: 19, type: !4)
!15 = !DIExpression()
!16 = !DILocation(line: 19, column: 13, scope: !10)
!17 = !DILocalVariable(name: "fp1", scope: !10, file: !11, line: 20, type: !18)
!18 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64, align: 64)
!19 = !DILocation(line: 20, column: 13, scope: !10)
!20 = !DILocalVariable(name: "fp2", scope: !10, file: !11, line: 21, type: !18)
!21 = !DILocation(line: 21, column: 13, scope: !10)
!22 = !DILocation(line: 22, column: 10, scope: !10)
!23 = !DILocalVariable(name: "fptr", scope: !24, file: !11, line: 24, type: !4)
!24 = distinct !DILexicalBlock(scope: !10, file: !11, line: 23, column: 5)
!25 = !DILocation(line: 24, column: 17, scope: !24)
!26 = !DILocation(line: 24, column: 25, scope: !24)
!27 = !DILocation(line: 24, column: 24, scope: !24)
!28 = !DILocation(line: 25, column: 25, scope: !24)
!29 = !DILocation(line: 25, column: 16, scope: !24)
!30 = !DILocation(line: 25, column: 14, scope: !24)
!31 = !DILocation(line: 26, column: 12, scope: !32)
!32 = distinct !DILexicalBlock(scope: !24, file: !11, line: 26, column: 12)
!33 = !DILocation(line: 26, column: 16, scope: !32)
!34 = !DILocation(line: 26, column: 12, scope: !24)
!35 = !DILocation(line: 28, column: 11, scope: !36)
!36 = distinct !DILexicalBlock(scope: !32, file: !11, line: 27, column: 9)
!37 = !DILocation(line: 28, column: 15, scope: !36)
!38 = !DILocation(line: 28, column: 19, scope: !36)
!39 = !DILocation(line: 29, column: 16, scope: !36)
!40 = !DILocation(line: 29, column: 10, scope: !36)
!41 = !DILocation(line: 29, column: 14, scope: !36)
!42 = !DILocation(line: 30, column: 9, scope: !36)
!43 = !DILocalVariable(name: "fptr1", scope: !44, file: !11, line: 33, type: !4)
!44 = distinct !DILexicalBlock(scope: !10, file: !11, line: 32, column: 5)
!45 = !DILocation(line: 33, column: 17, scope: !44)
!46 = !DILocation(line: 34, column: 18, scope: !44)
!47 = !DILocation(line: 34, column: 17, scope: !44)
!48 = !DILocation(line: 34, column: 15, scope: !44)
!49 = !DILocation(line: 36, column: 1, scope: !10)
!50 = distinct !DISubprogram(name: "memory_leak_0014_good", scope: !11, file: !11, line: 42, type: !12, isLocal: false, isDefinition: true, scopeLine: 43, isOptimized: false, unit: !0, variables: !2)
!51 = !DILocalVariable(name: "fptr", scope: !50, file: !11, line: 44, type: !4)
!52 = !DILocation(line: 44, column: 13, scope: !50)
!53 = !DILocalVariable(name: "fp1", scope: !50, file: !11, line: 45, type: !18)
!54 = !DILocation(line: 45, column: 13, scope: !50)
!55 = !DILocalVariable(name: "fp2", scope: !50, file: !11, line: 46, type: !18)
!56 = !DILocation(line: 46, column: 13, scope: !50)
!57 = !DILocation(line: 47, column: 10, scope: !50)
!58 = !DILocalVariable(name: "fptr", scope: !59, file: !11, line: 49, type: !4)
!59 = distinct !DILexicalBlock(scope: !50, file: !11, line: 48, column: 5)
!60 = !DILocation(line: 49, column: 17, scope: !59)
!61 = !DILocation(line: 49, column: 25, scope: !59)
!62 = !DILocation(line: 49, column: 24, scope: !59)
!63 = !DILocation(line: 50, column: 25, scope: !59)
!64 = !DILocation(line: 50, column: 16, scope: !59)
!65 = !DILocation(line: 50, column: 14, scope: !59)
!66 = !DILocation(line: 51, column: 12, scope: !67)
!67 = distinct !DILexicalBlock(scope: !59, file: !11, line: 51, column: 12)
!68 = !DILocation(line: 51, column: 16, scope: !67)
!69 = !DILocation(line: 51, column: 12, scope: !59)
!70 = !DILocation(line: 53, column: 14, scope: !71)
!71 = distinct !DILexicalBlock(scope: !67, file: !11, line: 52, column: 9)
!72 = !DILocation(line: 53, column: 18, scope: !71)
!73 = !DILocation(line: 53, column: 22, scope: !71)
!74 = !DILocation(line: 54, column: 19, scope: !71)
!75 = !DILocation(line: 54, column: 13, scope: !71)
!76 = !DILocation(line: 54, column: 17, scope: !71)
!77 = !DILocation(line: 55, column: 9, scope: !71)
!78 = !DILocalVariable(name: "fptr", scope: !79, file: !11, line: 58, type: !4)
!79 = distinct !DILexicalBlock(scope: !50, file: !11, line: 57, column: 5)
!80 = !DILocation(line: 58, column: 17, scope: !79)
!81 = !DILocation(line: 58, column: 25, scope: !79)
!82 = !DILocation(line: 58, column: 24, scope: !79)
!83 = !DILocation(line: 59, column: 14, scope: !79)
!84 = !DILocation(line: 59, column: 9, scope: !79)
!85 = !DILocation(line: 61, column: 1, scope: !50)
!86 = distinct !DISubprogram(name: "main", scope: !11, file: !11, line: 68, type: !87, isLocal: false, isDefinition: true, scopeLine: 69, isOptimized: false, unit: !0, variables: !2)
!87 = !DISubroutineType(types: !88)
!88 = !{!89}
!89 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!90 = !DILocation(line: 70, column: 3, scope: !86)
!91 = !DILocation(line: 71, column: 2, scope: !86)
!92 = !DILocation(line: 72, column: 2, scope: !86)
