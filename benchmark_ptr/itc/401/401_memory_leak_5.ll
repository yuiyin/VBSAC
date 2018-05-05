; ModuleID = './401_memory_leak_5.c'
source_filename = "./401_memory_leak_5.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: nounwind uwtable
define void @memory_leak_005_bad() #0 !dbg !10 {
entry:
  %ptr = alloca float*, align 8
  %flag = alloca i32, align 4
  call void @llvm.dbg.declare(metadata float** %ptr, metadata !14, metadata !15), !dbg !16
  call void @llvm.dbg.declare(metadata i32* %flag, metadata !17, metadata !15), !dbg !19
  store i32 10, i32* %flag, align 4, !dbg !19
  %0 = load i32, i32* %flag, align 4, !dbg !20
  %cmp = icmp sgt i32 %0, 0, !dbg !22
  br i1 %cmp, label %if.then, label %if.end3, !dbg !23

if.then:                                          ; preds = %entry
  %call = call noalias i8* @malloc(i64 20) #3, !dbg !24
  %1 = bitcast i8* %call to float*, !dbg !26
  store float* %1, float** %ptr, align 8, !dbg !27
  %2 = load float*, float** %ptr, align 8, !dbg !28
  %cmp1 = icmp ne float* %2, null, !dbg !30
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !31

if.then2:                                         ; preds = %if.then
  %3 = load float*, float** %ptr, align 8, !dbg !32
  %add.ptr = getelementptr inbounds float, float* %3, i64 1, !dbg !34
  store float 1.050000e+01, float* %add.ptr, align 4, !dbg !35
  br label %if.end, !dbg !36

if.end:                                           ; preds = %if.then2, %if.then
  br label %if.end3, !dbg !37

if.end3:                                          ; preds = %if.end, %entry
  %4 = load i32, i32* %flag, align 4, !dbg !38
  %cmp4 = icmp slt i32 %4, 0, !dbg !40
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !41

if.then5:                                         ; preds = %if.end3
  %5 = load float*, float** %ptr, align 8, !dbg !42
  %6 = bitcast float* %5 to i8*, !dbg !42
  call void @free(i8* %6) #3, !dbg !43
  br label %if.end6, !dbg !43

if.end6:                                          ; preds = %if.then5, %if.end3
  ret void, !dbg !44
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #2

; Function Attrs: nounwind
declare void @free(i8*) #2

; Function Attrs: nounwind uwtable
define void @memory_leak_005_good() #0 !dbg !45 {
entry:
  %ptr = alloca float*, align 8
  %flag = alloca i32, align 4
  call void @llvm.dbg.declare(metadata float** %ptr, metadata !46, metadata !15), !dbg !47
  call void @llvm.dbg.declare(metadata i32* %flag, metadata !48, metadata !15), !dbg !49
  store i32 10, i32* %flag, align 4, !dbg !49
  %0 = load i32, i32* %flag, align 4, !dbg !50
  %cmp = icmp sgt i32 %0, 0, !dbg !52
  br i1 %cmp, label %if.then, label %if.end3, !dbg !53

if.then:                                          ; preds = %entry
  %call = call noalias i8* @malloc(i64 20) #3, !dbg !54
  %1 = bitcast i8* %call to float*, !dbg !56
  store float* %1, float** %ptr, align 8, !dbg !57
  %2 = load float*, float** %ptr, align 8, !dbg !58
  %cmp1 = icmp ne float* %2, null, !dbg !60
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !61

if.then2:                                         ; preds = %if.then
  %3 = load float*, float** %ptr, align 8, !dbg !62
  %add.ptr = getelementptr inbounds float, float* %3, i64 1, !dbg !64
  store float 1.050000e+01, float* %add.ptr, align 4, !dbg !65
  %4 = load float*, float** %ptr, align 8, !dbg !66
  %5 = bitcast float* %4 to i8*, !dbg !66
  call void @free(i8* %5) #3, !dbg !67
  br label %if.end, !dbg !68

if.end:                                           ; preds = %if.then2, %if.then
  br label %if.end3, !dbg !69

if.end3:                                          ; preds = %if.end, %entry
  ret void, !dbg !70
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !71 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @memory_leak_005_good(), !dbg !74
  call void @memory_leak_005_bad(), !dbg !75
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
!1 = !DIFile(filename: "401_memory_leak_5.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/itc/401")
!2 = !{}
!3 = !{!4, !6}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64, align: 64)
!5 = !DIBasicType(name: "float", size: 32, align: 32, encoding: DW_ATE_float)
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64, align: 64)
!7 = !{i32 2, !"Dwarf Version", i32 4}
!8 = !{i32 2, !"Debug Info Version", i32 3}
!9 = !{!"clang version 3.9.0 (tags/RELEASE_390/final)"}
!10 = distinct !DISubprogram(name: "memory_leak_005_bad", scope: !11, file: !11, line: 17, type: !12, isLocal: false, isDefinition: true, scopeLine: 18, isOptimized: false, unit: !0, variables: !2)
!11 = !DIFile(filename: "./401_memory_leak_5.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/itc/401")
!12 = !DISubroutineType(types: !13)
!13 = !{null}
!14 = !DILocalVariable(name: "ptr", scope: !10, file: !11, line: 19, type: !4)
!15 = !DIExpression()
!16 = !DILocation(line: 19, column: 9, scope: !10)
!17 = !DILocalVariable(name: "flag", scope: !10, file: !11, line: 20, type: !18)
!18 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!19 = !DILocation(line: 20, column: 6, scope: !10)
!20 = !DILocation(line: 22, column: 5, scope: !21)
!21 = distinct !DILexicalBlock(scope: !10, file: !11, line: 22, column: 5)
!22 = !DILocation(line: 22, column: 10, scope: !21)
!23 = !DILocation(line: 22, column: 5, scope: !10)
!24 = !DILocation(line: 24, column: 17, scope: !25)
!25 = distinct !DILexicalBlock(scope: !21, file: !11, line: 23, column: 2)
!26 = !DILocation(line: 24, column: 8, scope: !25)
!27 = !DILocation(line: 24, column: 6, scope: !25)
!28 = !DILocation(line: 25, column: 6, scope: !29)
!29 = distinct !DILexicalBlock(scope: !25, file: !11, line: 25, column: 6)
!30 = !DILocation(line: 25, column: 9, scope: !29)
!31 = !DILocation(line: 25, column: 6, scope: !25)
!32 = !DILocation(line: 27, column: 11, scope: !33)
!33 = distinct !DILexicalBlock(scope: !29, file: !11, line: 26, column: 3)
!34 = !DILocation(line: 27, column: 14, scope: !33)
!35 = !DILocation(line: 27, column: 18, scope: !33)
!36 = !DILocation(line: 28, column: 3, scope: !33)
!37 = !DILocation(line: 29, column: 2, scope: !25)
!38 = !DILocation(line: 30, column: 8, scope: !39)
!39 = distinct !DILexicalBlock(scope: !10, file: !11, line: 30, column: 8)
!40 = !DILocation(line: 30, column: 13, scope: !39)
!41 = !DILocation(line: 30, column: 8, scope: !10)
!42 = !DILocation(line: 31, column: 7, scope: !39)
!43 = !DILocation(line: 31, column: 2, scope: !39)
!44 = !DILocation(line: 32, column: 1, scope: !10)
!45 = distinct !DISubprogram(name: "memory_leak_005_good", scope: !11, file: !11, line: 38, type: !12, isLocal: false, isDefinition: true, scopeLine: 39, isOptimized: false, unit: !0, variables: !2)
!46 = !DILocalVariable(name: "ptr", scope: !45, file: !11, line: 40, type: !4)
!47 = !DILocation(line: 40, column: 9, scope: !45)
!48 = !DILocalVariable(name: "flag", scope: !45, file: !11, line: 41, type: !18)
!49 = !DILocation(line: 41, column: 6, scope: !45)
!50 = !DILocation(line: 43, column: 5, scope: !51)
!51 = distinct !DILexicalBlock(scope: !45, file: !11, line: 43, column: 5)
!52 = !DILocation(line: 43, column: 10, scope: !51)
!53 = !DILocation(line: 43, column: 5, scope: !45)
!54 = !DILocation(line: 45, column: 17, scope: !55)
!55 = distinct !DILexicalBlock(scope: !51, file: !11, line: 44, column: 2)
!56 = !DILocation(line: 45, column: 8, scope: !55)
!57 = !DILocation(line: 45, column: 6, scope: !55)
!58 = !DILocation(line: 46, column: 6, scope: !59)
!59 = distinct !DILexicalBlock(scope: !55, file: !11, line: 46, column: 6)
!60 = !DILocation(line: 46, column: 9, scope: !59)
!61 = !DILocation(line: 46, column: 6, scope: !55)
!62 = !DILocation(line: 48, column: 6, scope: !63)
!63 = distinct !DILexicalBlock(scope: !59, file: !11, line: 47, column: 3)
!64 = !DILocation(line: 48, column: 9, scope: !63)
!65 = !DILocation(line: 48, column: 13, scope: !63)
!66 = !DILocation(line: 49, column: 9, scope: !63)
!67 = !DILocation(line: 49, column: 4, scope: !63)
!68 = !DILocation(line: 50, column: 3, scope: !63)
!69 = !DILocation(line: 51, column: 2, scope: !55)
!70 = !DILocation(line: 52, column: 1, scope: !45)
!71 = distinct !DISubprogram(name: "main", scope: !11, file: !11, line: 59, type: !72, isLocal: false, isDefinition: true, scopeLine: 60, isOptimized: false, unit: !0, variables: !2)
!72 = !DISubroutineType(types: !73)
!73 = !{!18}
!74 = !DILocation(line: 61, column: 2, scope: !71)
!75 = !DILocation(line: 62, column: 2, scope: !71)
!76 = !DILocation(line: 63, column: 2, scope: !71)
