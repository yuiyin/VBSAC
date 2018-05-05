; ModuleID = './401_memory_leak_9.c'
source_filename = "./401_memory_leak_9.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: nounwind uwtable
define void @memory_leak_009_bad() #0 !dbg !10 {
entry:
  %ptr = alloca float*, align 8
  %p = alloca float*, align 8
  call void @llvm.dbg.declare(metadata float** %ptr, metadata !14, metadata !15), !dbg !16
  %call = call noalias i8* @malloc(i64 20) #3, !dbg !17
  %0 = bitcast i8* %call to float*, !dbg !18
  store float* %0, float** %ptr, align 8, !dbg !16
  call void @llvm.dbg.declare(metadata float** %p, metadata !19, metadata !15), !dbg !20
  %call1 = call noalias i8* @malloc(i64 20) #3, !dbg !21
  %1 = bitcast i8* %call1 to float*, !dbg !22
  store float* %1, float** %p, align 8, !dbg !20
  %2 = load float*, float** %ptr, align 8, !dbg !23
  %cmp = icmp ne float* %2, null, !dbg !25
  br i1 %cmp, label %if.then, label %if.end, !dbg !26

if.then:                                          ; preds = %entry
  %3 = load float*, float** %ptr, align 8, !dbg !27
  store float* %3, float** %p, align 8, !dbg !29
  %4 = load float*, float** %p, align 8, !dbg !30
  %add.ptr = getelementptr inbounds float, float* %4, i64 1, !dbg !31
  store float 1.000000e+00, float* %add.ptr, align 4, !dbg !32
  %5 = load float*, float** %ptr, align 8, !dbg !33
  %6 = bitcast float* %5 to i8*, !dbg !33
  call void @free(i8* %6) #3, !dbg !34
  store float* null, float** %ptr, align 8, !dbg !35
  br label %if.end, !dbg !36

if.end:                                           ; preds = %if.then, %entry
  ret void, !dbg !37
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #2

; Function Attrs: nounwind
declare void @free(i8*) #2

; Function Attrs: nounwind uwtable
define void @memory_leak_009_good() #0 !dbg !38 {
entry:
  %ptr = alloca float*, align 8
  %p = alloca float*, align 8
  call void @llvm.dbg.declare(metadata float** %ptr, metadata !39, metadata !15), !dbg !40
  %call = call noalias i8* @malloc(i64 20) #3, !dbg !41
  %0 = bitcast i8* %call to float*, !dbg !42
  store float* %0, float** %ptr, align 8, !dbg !40
  call void @llvm.dbg.declare(metadata float** %p, metadata !43, metadata !15), !dbg !44
  store float* null, float** %p, align 8, !dbg !44
  %1 = load float*, float** %ptr, align 8, !dbg !45
  %cmp = icmp ne float* %1, null, !dbg !47
  br i1 %cmp, label %if.then, label %if.end, !dbg !48

if.then:                                          ; preds = %entry
  %2 = load float*, float** %ptr, align 8, !dbg !49
  store float* %2, float** %p, align 8, !dbg !51
  %3 = load float*, float** %p, align 8, !dbg !52
  %add.ptr = getelementptr inbounds float, float* %3, i64 1, !dbg !53
  store float 1.500000e+00, float* %add.ptr, align 4, !dbg !54
  %4 = load float*, float** %ptr, align 8, !dbg !55
  %5 = bitcast float* %4 to i8*, !dbg !55
  call void @free(i8* %5) #3, !dbg !56
  store float* null, float** %ptr, align 8, !dbg !57
  br label %if.end, !dbg !58

if.end:                                           ; preds = %if.then, %entry
  ret void, !dbg !59
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !60 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @memory_leak_009_good(), !dbg !64
  call void @memory_leak_009_bad(), !dbg !65
  ret i32 0, !dbg !66
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8}
!llvm.ident = !{!9}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (tags/RELEASE_390/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3)
!1 = !DIFile(filename: "401_memory_leak_9.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/itc/401")
!2 = !{}
!3 = !{!4, !6}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64, align: 64)
!5 = !DIBasicType(name: "float", size: 32, align: 32, encoding: DW_ATE_float)
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64, align: 64)
!7 = !{i32 2, !"Dwarf Version", i32 4}
!8 = !{i32 2, !"Debug Info Version", i32 3}
!9 = !{!"clang version 3.9.0 (tags/RELEASE_390/final)"}
!10 = distinct !DISubprogram(name: "memory_leak_009_bad", scope: !11, file: !11, line: 17, type: !12, isLocal: false, isDefinition: true, scopeLine: 18, isOptimized: false, unit: !0, variables: !2)
!11 = !DIFile(filename: "./401_memory_leak_9.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/itc/401")
!12 = !DISubroutineType(types: !13)
!13 = !{null}
!14 = !DILocalVariable(name: "ptr", scope: !10, file: !11, line: 19, type: !4)
!15 = !DIExpression()
!16 = !DILocation(line: 19, column: 9, scope: !10)
!17 = !DILocation(line: 19, column: 22, scope: !10)
!18 = !DILocation(line: 19, column: 13, scope: !10)
!19 = !DILocalVariable(name: "p", scope: !10, file: !11, line: 20, type: !4)
!20 = !DILocation(line: 20, column: 9, scope: !10)
!21 = !DILocation(line: 20, column: 22, scope: !10)
!22 = !DILocation(line: 20, column: 13, scope: !10)
!23 = !DILocation(line: 21, column: 5, scope: !24)
!24 = distinct !DILexicalBlock(scope: !10, file: !11, line: 21, column: 5)
!25 = !DILocation(line: 21, column: 9, scope: !24)
!26 = !DILocation(line: 21, column: 5, scope: !10)
!27 = !DILocation(line: 23, column: 24, scope: !28)
!28 = distinct !DILexicalBlock(scope: !24, file: !11, line: 22, column: 2)
!29 = !DILocation(line: 23, column: 13, scope: !28)
!30 = !DILocation(line: 24, column: 7, scope: !28)
!31 = !DILocation(line: 24, column: 8, scope: !28)
!32 = !DILocation(line: 24, column: 12, scope: !28)
!33 = !DILocation(line: 25, column: 11, scope: !28)
!34 = !DILocation(line: 25, column: 5, scope: !28)
!35 = !DILocation(line: 26, column: 9, scope: !28)
!36 = !DILocation(line: 27, column: 2, scope: !28)
!37 = !DILocation(line: 28, column: 1, scope: !10)
!38 = distinct !DISubprogram(name: "memory_leak_009_good", scope: !11, file: !11, line: 34, type: !12, isLocal: false, isDefinition: true, scopeLine: 35, isOptimized: false, unit: !0, variables: !2)
!39 = !DILocalVariable(name: "ptr", scope: !38, file: !11, line: 36, type: !4)
!40 = !DILocation(line: 36, column: 9, scope: !38)
!41 = !DILocation(line: 36, column: 22, scope: !38)
!42 = !DILocation(line: 36, column: 13, scope: !38)
!43 = !DILocalVariable(name: "p", scope: !38, file: !11, line: 37, type: !4)
!44 = !DILocation(line: 37, column: 9, scope: !38)
!45 = !DILocation(line: 38, column: 5, scope: !46)
!46 = distinct !DILexicalBlock(scope: !38, file: !11, line: 38, column: 5)
!47 = !DILocation(line: 38, column: 9, scope: !46)
!48 = !DILocation(line: 38, column: 5, scope: !38)
!49 = !DILocation(line: 40, column: 9, scope: !50)
!50 = distinct !DILexicalBlock(scope: !46, file: !11, line: 39, column: 2)
!51 = !DILocation(line: 40, column: 7, scope: !50)
!52 = !DILocation(line: 41, column: 7, scope: !50)
!53 = !DILocation(line: 41, column: 8, scope: !50)
!54 = !DILocation(line: 41, column: 12, scope: !50)
!55 = !DILocation(line: 42, column: 11, scope: !50)
!56 = !DILocation(line: 42, column: 5, scope: !50)
!57 = !DILocation(line: 43, column: 9, scope: !50)
!58 = !DILocation(line: 44, column: 2, scope: !50)
!59 = !DILocation(line: 45, column: 1, scope: !38)
!60 = distinct !DISubprogram(name: "main", scope: !11, file: !11, line: 52, type: !61, isLocal: false, isDefinition: true, scopeLine: 53, isOptimized: false, unit: !0, variables: !2)
!61 = !DISubroutineType(types: !62)
!62 = !{!63}
!63 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!64 = !DILocation(line: 54, column: 2, scope: !60)
!65 = !DILocation(line: 55, column: 2, scope: !60)
!66 = !DILocation(line: 56, column: 2, scope: !60)
