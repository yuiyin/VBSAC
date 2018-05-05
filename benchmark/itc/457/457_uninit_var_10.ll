; ModuleID = './457_uninit_var_10.c'
source_filename = "./457_uninit_var_10.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@uninit_var_011_good.arr = private unnamed_addr constant [6 x i32] [i32 1, i32 2, i32 3, i32 4, i32 5, i32 6], align 16

; Function Attrs: nounwind uwtable
define i32 @uninit_var_011_func_001_bad(i32* %arr1, i32 %a) #0 !dbg !6 {
entry:
  %arr1.addr = alloca i32*, align 8
  %a.addr = alloca i32, align 4
  %ret = alloca i32, align 4
  store i32* %arr1, i32** %arr1.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %arr1.addr, metadata !12, metadata !13), !dbg !14
  store i32 %a, i32* %a.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %a.addr, metadata !15, metadata !13), !dbg !16
  call void @llvm.dbg.declare(metadata i32* %ret, metadata !17, metadata !13), !dbg !18
  store i32 0, i32* %ret, align 4, !dbg !18
  %0 = load i32*, i32** %arr1.addr, align 8, !dbg !19
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 0, !dbg !19
  %1 = load i32, i32* %arrayidx, align 4, !dbg !19
  %cmp = icmp sgt i32 %1, 0, !dbg !21
  br i1 %cmp, label %if.then, label %if.end, !dbg !22

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %a.addr, align 4, !dbg !23
  %3 = load i32*, i32** %arr1.addr, align 8, !dbg !24
  %arrayidx1 = getelementptr inbounds i32, i32* %3, i64 1, !dbg !24
  %4 = load i32, i32* %arrayidx1, align 4, !dbg !24
  %add = add nsw i32 %2, %4, !dbg !25
  store i32 %add, i32* %ret, align 4, !dbg !26
  br label %if.end, !dbg !27

if.end:                                           ; preds = %if.then, %entry
  %5 = load i32, i32* %ret, align 4, !dbg !28
  ret i32 %5, !dbg !29
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind uwtable
define void @uninit_var_011_bad() #0 !dbg !30 {
entry:
  %arr = alloca [5 x i32], align 16
  %p = alloca i32, align 4
  call void @llvm.dbg.declare(metadata [5 x i32]* %arr, metadata !33, metadata !13), !dbg !37
  call void @llvm.dbg.declare(metadata i32* %p, metadata !38, metadata !13), !dbg !39
  %arrayidx = getelementptr inbounds [5 x i32], [5 x i32]* %arr, i64 0, i64 0, !dbg !40
  store i32 1, i32* %arrayidx, align 16, !dbg !41
  %arraydecay = getelementptr inbounds [5 x i32], [5 x i32]* %arr, i32 0, i32 0, !dbg !42
  %call = call i32 @uninit_var_011_func_001_bad(i32* %arraydecay, i32 5), !dbg !43
  store i32 %call, i32* %p, align 4, !dbg !44
  ret void, !dbg !45
}

; Function Attrs: nounwind uwtable
define i32 @uninit_var_011_func_001_good(i32* %arr1, i32 %a) #0 !dbg !46 {
entry:
  %arr1.addr = alloca i32*, align 8
  %a.addr = alloca i32, align 4
  %ret = alloca i32, align 4
  store i32* %arr1, i32** %arr1.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %arr1.addr, metadata !47, metadata !13), !dbg !48
  store i32 %a, i32* %a.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %a.addr, metadata !49, metadata !13), !dbg !50
  call void @llvm.dbg.declare(metadata i32* %ret, metadata !51, metadata !13), !dbg !52
  store i32 0, i32* %ret, align 4, !dbg !52
  %0 = load i32*, i32** %arr1.addr, align 8, !dbg !53
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 0, !dbg !53
  %1 = load i32, i32* %arrayidx, align 4, !dbg !53
  %cmp = icmp sgt i32 %1, 0, !dbg !55
  br i1 %cmp, label %if.then, label %if.end, !dbg !56

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %a.addr, align 4, !dbg !57
  %3 = load i32*, i32** %arr1.addr, align 8, !dbg !58
  %arrayidx1 = getelementptr inbounds i32, i32* %3, i64 1, !dbg !58
  %4 = load i32, i32* %arrayidx1, align 4, !dbg !58
  %add = add nsw i32 %2, %4, !dbg !59
  store i32 %add, i32* %ret, align 4, !dbg !60
  br label %if.end, !dbg !61

if.end:                                           ; preds = %if.then, %entry
  %5 = load i32, i32* %ret, align 4, !dbg !62
  ret i32 %5, !dbg !63
}

; Function Attrs: nounwind uwtable
define void @uninit_var_011_good() #0 !dbg !64 {
entry:
  %arr = alloca [6 x i32], align 16
  %p = alloca i32, align 4
  call void @llvm.dbg.declare(metadata [6 x i32]* %arr, metadata !65, metadata !13), !dbg !69
  %0 = bitcast [6 x i32]* %arr to i8*, !dbg !69
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %0, i8* bitcast ([6 x i32]* @uninit_var_011_good.arr to i8*), i64 24, i32 16, i1 false), !dbg !69
  call void @llvm.dbg.declare(metadata i32* %p, metadata !70, metadata !13), !dbg !71
  %arraydecay = getelementptr inbounds [6 x i32], [6 x i32]* %arr, i32 0, i32 0, !dbg !72
  %call = call i32 @uninit_var_011_func_001_good(i32* %arraydecay, i32 6), !dbg !73
  store i32 %call, i32* %p, align 4, !dbg !74
  ret void, !dbg !75
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i32, i1) #2

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !76 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @uninit_var_011_good(), !dbg !79
  call void @uninit_var_011_bad(), !dbg !80
  ret i32 0, !dbg !81
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { argmemonly nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4}
!llvm.ident = !{!5}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (tags/RELEASE_390/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2)
!1 = !DIFile(filename: "457_uninit_var_10.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/itc/457")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{!"clang version 3.9.0 (tags/RELEASE_390/final)"}
!6 = distinct !DISubprogram(name: "uninit_var_011_func_001_bad", scope: !7, file: !7, line: 8, type: !8, isLocal: false, isDefinition: true, scopeLine: 8, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!7 = !DIFile(filename: "./457_uninit_var_10.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/itc/457")
!8 = !DISubroutineType(types: !9)
!9 = !{!10, !11, !10}
!10 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!11 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !10, size: 64, align: 64)
!12 = !DILocalVariable(name: "arr1", arg: 1, scope: !6, file: !7, line: 8, type: !11)
!13 = !DIExpression()
!14 = !DILocation(line: 8, column: 37, scope: !6)
!15 = !DILocalVariable(name: "a", arg: 2, scope: !6, file: !7, line: 8, type: !10)
!16 = !DILocation(line: 8, column: 48, scope: !6)
!17 = !DILocalVariable(name: "ret", scope: !6, file: !7, line: 9, type: !10)
!18 = !DILocation(line: 9, column: 6, scope: !6)
!19 = !DILocation(line: 10, column: 5, scope: !20)
!20 = distinct !DILexicalBlock(scope: !6, file: !7, line: 10, column: 5)
!21 = !DILocation(line: 10, column: 13, scope: !20)
!22 = !DILocation(line: 10, column: 5, scope: !6)
!23 = !DILocation(line: 11, column: 9, scope: !20)
!24 = !DILocation(line: 11, column: 11, scope: !20)
!25 = !DILocation(line: 11, column: 10, scope: !20)
!26 = !DILocation(line: 11, column: 7, scope: !20)
!27 = !DILocation(line: 11, column: 3, scope: !20)
!28 = !DILocation(line: 12, column: 10, scope: !6)
!29 = !DILocation(line: 12, column: 3, scope: !6)
!30 = distinct !DISubprogram(name: "uninit_var_011_bad", scope: !7, file: !7, line: 15, type: !31, isLocal: false, isDefinition: true, scopeLine: 15, isOptimized: false, unit: !0, variables: !2)
!31 = !DISubroutineType(types: !32)
!32 = !{null}
!33 = !DILocalVariable(name: "arr", scope: !30, file: !7, line: 16, type: !34)
!34 = !DICompositeType(tag: DW_TAG_array_type, baseType: !10, size: 160, align: 32, elements: !35)
!35 = !{!36}
!36 = !DISubrange(count: 5)
!37 = !DILocation(line: 16, column: 6, scope: !30)
!38 = !DILocalVariable(name: "p", scope: !30, file: !7, line: 17, type: !10)
!39 = !DILocation(line: 17, column: 6, scope: !30)
!40 = !DILocation(line: 18, column: 2, scope: !30)
!41 = !DILocation(line: 18, column: 9, scope: !30)
!42 = !DILocation(line: 19, column: 33, scope: !30)
!43 = !DILocation(line: 19, column: 5, scope: !30)
!44 = !DILocation(line: 19, column: 3, scope: !30)
!45 = !DILocation(line: 20, column: 1, scope: !30)
!46 = distinct !DISubprogram(name: "uninit_var_011_func_001_good", scope: !7, file: !7, line: 27, type: !8, isLocal: false, isDefinition: true, scopeLine: 28, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!47 = !DILocalVariable(name: "arr1", arg: 1, scope: !46, file: !7, line: 27, type: !11)
!48 = !DILocation(line: 27, column: 38, scope: !46)
!49 = !DILocalVariable(name: "a", arg: 2, scope: !46, file: !7, line: 27, type: !10)
!50 = !DILocation(line: 27, column: 49, scope: !46)
!51 = !DILocalVariable(name: "ret", scope: !46, file: !7, line: 29, type: !10)
!52 = !DILocation(line: 29, column: 6, scope: !46)
!53 = !DILocation(line: 30, column: 5, scope: !54)
!54 = distinct !DILexicalBlock(scope: !46, file: !7, line: 30, column: 5)
!55 = !DILocation(line: 30, column: 13, scope: !54)
!56 = !DILocation(line: 30, column: 5, scope: !46)
!57 = !DILocation(line: 31, column: 9, scope: !54)
!58 = !DILocation(line: 31, column: 11, scope: !54)
!59 = !DILocation(line: 31, column: 10, scope: !54)
!60 = !DILocation(line: 31, column: 7, scope: !54)
!61 = !DILocation(line: 31, column: 3, scope: !54)
!62 = !DILocation(line: 32, column: 10, scope: !46)
!63 = !DILocation(line: 32, column: 3, scope: !46)
!64 = distinct !DISubprogram(name: "uninit_var_011_good", scope: !7, file: !7, line: 35, type: !31, isLocal: false, isDefinition: true, scopeLine: 36, isOptimized: false, unit: !0, variables: !2)
!65 = !DILocalVariable(name: "arr", scope: !64, file: !7, line: 37, type: !66)
!66 = !DICompositeType(tag: DW_TAG_array_type, baseType: !10, size: 192, align: 32, elements: !67)
!67 = !{!68}
!68 = !DISubrange(count: 6)
!69 = !DILocation(line: 37, column: 6, scope: !64)
!70 = !DILocalVariable(name: "p", scope: !64, file: !7, line: 38, type: !10)
!71 = !DILocation(line: 38, column: 6, scope: !64)
!72 = !DILocation(line: 39, column: 34, scope: !64)
!73 = !DILocation(line: 39, column: 5, scope: !64)
!74 = !DILocation(line: 39, column: 3, scope: !64)
!75 = !DILocation(line: 41, column: 1, scope: !64)
!76 = distinct !DISubprogram(name: "main", scope: !7, file: !7, line: 43, type: !77, isLocal: false, isDefinition: true, scopeLine: 43, isOptimized: false, unit: !0, variables: !2)
!77 = !DISubroutineType(types: !78)
!78 = !{!10}
!79 = !DILocation(line: 44, column: 2, scope: !76)
!80 = !DILocation(line: 45, column: 2, scope: !76)
!81 = !DILocation(line: 46, column: 2, scope: !76)
