; ModuleID = './401_memory_leak_10.c'
source_filename = "./401_memory_leak_10.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: nounwind uwtable
define void @memory_leak_0010_bad() #0 !dbg !10 {
entry:
  %ptr = alloca i32*, align 8
  %p1 = alloca i32*, align 8
  %p2 = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %ptr, metadata !14, metadata !15), !dbg !16
  %call = call noalias i8* @calloc(i64 5, i64 4) #3, !dbg !17
  %0 = bitcast i8* %call to i32*, !dbg !18
  store i32* %0, i32** %ptr, align 8, !dbg !16
  %1 = load i32*, i32** %ptr, align 8, !dbg !19
  %cmp = icmp eq i32* %1, null, !dbg !21
  br i1 %cmp, label %if.then, label %if.end, !dbg !22

if.then:                                          ; preds = %entry
  br label %return, !dbg !23

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata i32** %p1, metadata !25, metadata !15), !dbg !26
  %call1 = call noalias i8* @calloc(i64 5, i64 4) #3, !dbg !27
  %2 = bitcast i8* %call1 to i32*, !dbg !28
  store i32* %2, i32** %p1, align 8, !dbg !26
  call void @llvm.dbg.declare(metadata i32** %p2, metadata !29, metadata !15), !dbg !30
  store i32* null, i32** %p2, align 8, !dbg !30
  %3 = load i32*, i32** %ptr, align 8, !dbg !31
  store i32* %3, i32** %p1, align 8, !dbg !32
  %4 = load i32*, i32** %p1, align 8, !dbg !33
  store i32* %4, i32** %p2, align 8, !dbg !34
  %5 = load i32*, i32** %p2, align 8, !dbg !35
  %add.ptr = getelementptr inbounds i32, i32* %5, i64 4, !dbg !36
  store i32 1, i32* %add.ptr, align 4, !dbg !37
  %6 = load i32*, i32** %ptr, align 8, !dbg !38
  %7 = bitcast i32* %6 to i8*, !dbg !38
  call void @free(i8* %7) #3, !dbg !39
  br label %return, !dbg !40

return:                                           ; preds = %if.end, %if.then
  ret void, !dbg !41
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare noalias i8* @calloc(i64, i64) #2

; Function Attrs: nounwind
declare void @free(i8*) #2

; Function Attrs: nounwind uwtable
define void @memory_leak_0010_good() #0 !dbg !43 {
entry:
  %ptr = alloca i32*, align 8
  %p1 = alloca i32*, align 8
  %p2 = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %ptr, metadata !44, metadata !15), !dbg !45
  %call = call noalias i8* @calloc(i64 5, i64 4) #3, !dbg !46
  %0 = bitcast i8* %call to i32*, !dbg !47
  store i32* %0, i32** %ptr, align 8, !dbg !45
  call void @llvm.dbg.declare(metadata i32** %p1, metadata !48, metadata !15), !dbg !49
  store i32* null, i32** %p1, align 8, !dbg !49
  call void @llvm.dbg.declare(metadata i32** %p2, metadata !50, metadata !15), !dbg !51
  store i32* null, i32** %p2, align 8, !dbg !51
  %1 = load i32*, i32** %ptr, align 8, !dbg !52
  %cmp = icmp ne i32* %1, null, !dbg !54
  br i1 %cmp, label %if.then, label %if.end, !dbg !55

if.then:                                          ; preds = %entry
  %2 = load i32*, i32** %ptr, align 8, !dbg !56
  store i32* %2, i32** %p1, align 8, !dbg !58
  %3 = load i32*, i32** %p1, align 8, !dbg !59
  store i32* %3, i32** %p2, align 8, !dbg !60
  %4 = load i32*, i32** %p2, align 8, !dbg !61
  %add.ptr = getelementptr inbounds i32, i32* %4, i64 4, !dbg !62
  store i32 1, i32* %add.ptr, align 4, !dbg !63
  %5 = load i32*, i32** %ptr, align 8, !dbg !64
  %6 = bitcast i32* %5 to i8*, !dbg !64
  call void @free(i8* %6) #3, !dbg !65
  br label %if.end, !dbg !66

if.end:                                           ; preds = %if.then, %entry
  ret void, !dbg !67
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !68 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @memory_leak_0010_good(), !dbg !71
  call void @memory_leak_0010_bad(), !dbg !72
  ret i32 0, !dbg !73
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8}
!llvm.ident = !{!9}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (tags/RELEASE_390/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3)
!1 = !DIFile(filename: "401_memory_leak_10.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/itc/401")
!2 = !{}
!3 = !{!4, !6}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64, align: 64)
!5 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64, align: 64)
!7 = !{i32 2, !"Dwarf Version", i32 4}
!8 = !{i32 2, !"Debug Info Version", i32 3}
!9 = !{!"clang version 3.9.0 (tags/RELEASE_390/final)"}
!10 = distinct !DISubprogram(name: "memory_leak_0010_bad", scope: !11, file: !11, line: 17, type: !12, isLocal: false, isDefinition: true, scopeLine: 18, isOptimized: false, unit: !0, variables: !2)
!11 = !DIFile(filename: "./401_memory_leak_10.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/itc/401")
!12 = !DISubroutineType(types: !13)
!13 = !{null}
!14 = !DILocalVariable(name: "ptr", scope: !10, file: !11, line: 19, type: !4)
!15 = !DIExpression()
!16 = !DILocation(line: 19, column: 7, scope: !10)
!17 = !DILocation(line: 19, column: 20, scope: !10)
!18 = !DILocation(line: 19, column: 13, scope: !10)
!19 = !DILocation(line: 20, column: 6, scope: !20)
!20 = distinct !DILexicalBlock(scope: !10, file: !11, line: 20, column: 6)
!21 = !DILocation(line: 20, column: 10, scope: !20)
!22 = !DILocation(line: 20, column: 6, scope: !10)
!23 = !DILocation(line: 22, column: 3, scope: !24)
!24 = distinct !DILexicalBlock(scope: !20, file: !11, line: 21, column: 2)
!25 = !DILocalVariable(name: "p1", scope: !10, file: !11, line: 24, type: !4)
!26 = !DILocation(line: 24, column: 7, scope: !10)
!27 = !DILocation(line: 24, column: 19, scope: !10)
!28 = !DILocation(line: 24, column: 12, scope: !10)
!29 = !DILocalVariable(name: "p2", scope: !10, file: !11, line: 25, type: !4)
!30 = !DILocation(line: 25, column: 7, scope: !10)
!31 = !DILocation(line: 26, column: 7, scope: !10)
!32 = !DILocation(line: 26, column: 5, scope: !10)
!33 = !DILocation(line: 27, column: 7, scope: !10)
!34 = !DILocation(line: 27, column: 5, scope: !10)
!35 = !DILocation(line: 28, column: 4, scope: !10)
!36 = !DILocation(line: 28, column: 6, scope: !10)
!37 = !DILocation(line: 28, column: 10, scope: !10)
!38 = !DILocation(line: 29, column: 7, scope: !10)
!39 = !DILocation(line: 29, column: 2, scope: !10)
!40 = !DILocation(line: 30, column: 1, scope: !10)
!41 = !DILocation(line: 30, column: 1, scope: !42)
!42 = !DILexicalBlockFile(scope: !10, file: !11, discriminator: 1)
!43 = distinct !DISubprogram(name: "memory_leak_0010_good", scope: !11, file: !11, line: 36, type: !12, isLocal: false, isDefinition: true, scopeLine: 37, isOptimized: false, unit: !0, variables: !2)
!44 = !DILocalVariable(name: "ptr", scope: !43, file: !11, line: 38, type: !4)
!45 = !DILocation(line: 38, column: 7, scope: !43)
!46 = !DILocation(line: 38, column: 20, scope: !43)
!47 = !DILocation(line: 38, column: 13, scope: !43)
!48 = !DILocalVariable(name: "p1", scope: !43, file: !11, line: 39, type: !4)
!49 = !DILocation(line: 39, column: 7, scope: !43)
!50 = !DILocalVariable(name: "p2", scope: !43, file: !11, line: 40, type: !4)
!51 = !DILocation(line: 40, column: 7, scope: !43)
!52 = !DILocation(line: 41, column: 5, scope: !53)
!53 = distinct !DILexicalBlock(scope: !43, file: !11, line: 41, column: 5)
!54 = !DILocation(line: 41, column: 9, scope: !53)
!55 = !DILocation(line: 41, column: 5, scope: !43)
!56 = !DILocation(line: 43, column: 10, scope: !57)
!57 = distinct !DILexicalBlock(scope: !53, file: !11, line: 42, column: 2)
!58 = !DILocation(line: 43, column: 8, scope: !57)
!59 = !DILocation(line: 44, column: 10, scope: !57)
!60 = !DILocation(line: 44, column: 8, scope: !57)
!61 = !DILocation(line: 45, column: 7, scope: !57)
!62 = !DILocation(line: 45, column: 9, scope: !57)
!63 = !DILocation(line: 45, column: 13, scope: !57)
!64 = !DILocation(line: 46, column: 11, scope: !57)
!65 = !DILocation(line: 46, column: 5, scope: !57)
!66 = !DILocation(line: 47, column: 2, scope: !57)
!67 = !DILocation(line: 48, column: 1, scope: !43)
!68 = distinct !DISubprogram(name: "main", scope: !11, file: !11, line: 55, type: !69, isLocal: false, isDefinition: true, scopeLine: 56, isOptimized: false, unit: !0, variables: !2)
!69 = !DISubroutineType(types: !70)
!70 = !{!5}
!71 = !DILocation(line: 57, column: 2, scope: !68)
!72 = !DILocation(line: 58, column: 2, scope: !68)
!73 = !DILocation(line: 59, column: 2, scope: !68)
