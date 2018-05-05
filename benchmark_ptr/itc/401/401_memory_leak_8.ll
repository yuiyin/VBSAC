; ModuleID = './401_memory_leak_8.c'
source_filename = "./401_memory_leak_8.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: nounwind uwtable
define void @memory_leak_008_bad() #0 !dbg !10 {
entry:
  %ptr = alloca i32*, align 8
  %p = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %ptr, metadata !14, metadata !15), !dbg !16
  %call = call noalias i8* @malloc(i64 20) #3, !dbg !17
  %0 = bitcast i8* %call to i32*, !dbg !18
  store i32* %0, i32** %ptr, align 8, !dbg !16
  call void @llvm.dbg.declare(metadata i32** %p, metadata !19, metadata !15), !dbg !20
  %call1 = call noalias i8* @malloc(i64 20) #3, !dbg !21
  %1 = bitcast i8* %call1 to i32*, !dbg !22
  store i32* %1, i32** %p, align 8, !dbg !20
  %2 = load i32*, i32** %ptr, align 8, !dbg !23
  %cmp = icmp ne i32* %2, null, !dbg !25
  br i1 %cmp, label %if.then, label %if.end, !dbg !26

if.then:                                          ; preds = %entry
  %3 = load i32*, i32** %ptr, align 8, !dbg !27
  store i32* %3, i32** %p, align 8, !dbg !29
  %4 = load i32*, i32** %p, align 8, !dbg !30
  %add.ptr = getelementptr inbounds i32, i32* %4, i64 1, !dbg !31
  store i32 1, i32* %add.ptr, align 4, !dbg !32
  %5 = load i32*, i32** %ptr, align 8, !dbg !33
  %6 = bitcast i32* %5 to i8*, !dbg !33
  call void @free(i8* %6) #3, !dbg !34
  br label %if.end, !dbg !35

if.end:                                           ; preds = %if.then, %entry
  ret void, !dbg !36
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #2

; Function Attrs: nounwind
declare void @free(i8*) #2

; Function Attrs: nounwind uwtable
define void @memory_leak_008_good() #0 !dbg !37 {
entry:
  %ptr = alloca i32*, align 8
  %p = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %ptr, metadata !38, metadata !15), !dbg !39
  %call = call noalias i8* @malloc(i64 20) #3, !dbg !40
  %0 = bitcast i8* %call to i32*, !dbg !41
  store i32* %0, i32** %ptr, align 8, !dbg !39
  call void @llvm.dbg.declare(metadata i32** %p, metadata !42, metadata !15), !dbg !43
  store i32* null, i32** %p, align 8, !dbg !43
  %1 = load i32*, i32** %ptr, align 8, !dbg !44
  %cmp = icmp ne i32* %1, null, !dbg !46
  br i1 %cmp, label %if.then, label %if.end, !dbg !47

if.then:                                          ; preds = %entry
  %2 = load i32*, i32** %ptr, align 8, !dbg !48
  store i32* %2, i32** %p, align 8, !dbg !50
  %3 = load i32*, i32** %p, align 8, !dbg !51
  %add.ptr = getelementptr inbounds i32, i32* %3, i64 1, !dbg !52
  store i32 1, i32* %add.ptr, align 4, !dbg !53
  %4 = load i32*, i32** %ptr, align 8, !dbg !54
  %5 = bitcast i32* %4 to i8*, !dbg !54
  call void @free(i8* %5) #3, !dbg !55
  store i32* null, i32** %ptr, align 8, !dbg !56
  br label %if.end, !dbg !57

if.end:                                           ; preds = %if.then, %entry
  ret void, !dbg !58
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !59 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @memory_leak_008_good(), !dbg !62
  call void @memory_leak_008_bad(), !dbg !63
  ret i32 0, !dbg !64
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8}
!llvm.ident = !{!9}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (tags/RELEASE_390/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3)
!1 = !DIFile(filename: "401_memory_leak_8.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/itc/401")
!2 = !{}
!3 = !{!4, !6}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64, align: 64)
!5 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64, align: 64)
!7 = !{i32 2, !"Dwarf Version", i32 4}
!8 = !{i32 2, !"Debug Info Version", i32 3}
!9 = !{!"clang version 3.9.0 (tags/RELEASE_390/final)"}
!10 = distinct !DISubprogram(name: "memory_leak_008_bad", scope: !11, file: !11, line: 17, type: !12, isLocal: false, isDefinition: true, scopeLine: 18, isOptimized: false, unit: !0, variables: !2)
!11 = !DIFile(filename: "./401_memory_leak_8.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/itc/401")
!12 = !DISubroutineType(types: !13)
!13 = !{null}
!14 = !DILocalVariable(name: "ptr", scope: !10, file: !11, line: 19, type: !4)
!15 = !DIExpression()
!16 = !DILocation(line: 19, column: 7, scope: !10)
!17 = !DILocation(line: 19, column: 18, scope: !10)
!18 = !DILocation(line: 19, column: 11, scope: !10)
!19 = !DILocalVariable(name: "p", scope: !10, file: !11, line: 20, type: !4)
!20 = !DILocation(line: 20, column: 7, scope: !10)
!21 = !DILocation(line: 20, column: 17, scope: !10)
!22 = !DILocation(line: 20, column: 11, scope: !10)
!23 = !DILocation(line: 21, column: 5, scope: !24)
!24 = distinct !DILexicalBlock(scope: !10, file: !11, line: 21, column: 5)
!25 = !DILocation(line: 21, column: 9, scope: !24)
!26 = !DILocation(line: 21, column: 5, scope: !10)
!27 = !DILocation(line: 23, column: 6, scope: !28)
!28 = distinct !DILexicalBlock(scope: !24, file: !11, line: 22, column: 2)
!29 = !DILocation(line: 23, column: 4, scope: !28)
!30 = !DILocation(line: 24, column: 4, scope: !28)
!31 = !DILocation(line: 24, column: 5, scope: !28)
!32 = !DILocation(line: 24, column: 9, scope: !28)
!33 = !DILocation(line: 25, column: 7, scope: !28)
!34 = !DILocation(line: 25, column: 2, scope: !28)
!35 = !DILocation(line: 26, column: 2, scope: !28)
!36 = !DILocation(line: 27, column: 1, scope: !10)
!37 = distinct !DISubprogram(name: "memory_leak_008_good", scope: !11, file: !11, line: 33, type: !12, isLocal: false, isDefinition: true, scopeLine: 34, isOptimized: false, unit: !0, variables: !2)
!38 = !DILocalVariable(name: "ptr", scope: !37, file: !11, line: 35, type: !4)
!39 = !DILocation(line: 35, column: 7, scope: !37)
!40 = !DILocation(line: 35, column: 18, scope: !37)
!41 = !DILocation(line: 35, column: 11, scope: !37)
!42 = !DILocalVariable(name: "p", scope: !37, file: !11, line: 36, type: !4)
!43 = !DILocation(line: 36, column: 7, scope: !37)
!44 = !DILocation(line: 37, column: 5, scope: !45)
!45 = distinct !DILexicalBlock(scope: !37, file: !11, line: 37, column: 5)
!46 = !DILocation(line: 37, column: 9, scope: !45)
!47 = !DILocation(line: 37, column: 5, scope: !37)
!48 = !DILocation(line: 39, column: 9, scope: !49)
!49 = distinct !DILexicalBlock(scope: !45, file: !11, line: 38, column: 2)
!50 = !DILocation(line: 39, column: 7, scope: !49)
!51 = !DILocation(line: 40, column: 7, scope: !49)
!52 = !DILocation(line: 40, column: 8, scope: !49)
!53 = !DILocation(line: 40, column: 12, scope: !49)
!54 = !DILocation(line: 41, column: 11, scope: !49)
!55 = !DILocation(line: 41, column: 5, scope: !49)
!56 = !DILocation(line: 42, column: 9, scope: !49)
!57 = !DILocation(line: 43, column: 2, scope: !49)
!58 = !DILocation(line: 44, column: 1, scope: !37)
!59 = distinct !DISubprogram(name: "main", scope: !11, file: !11, line: 51, type: !60, isLocal: false, isDefinition: true, scopeLine: 52, isOptimized: false, unit: !0, variables: !2)
!60 = !DISubroutineType(types: !61)
!61 = !{!5}
!62 = !DILocation(line: 53, column: 2, scope: !59)
!63 = !DILocation(line: 54, column: 2, scope: !59)
!64 = !DILocation(line: 55, column: 2, scope: !59)
