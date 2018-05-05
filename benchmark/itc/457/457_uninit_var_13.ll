; ModuleID = './457_uninit_var_13.c'
source_filename = "./457_uninit_var_13.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: nounwind uwtable
define void @uninit_var_015_func_001_bad(i32* %a) #0 !dbg !6 {
entry:
  %a.addr = alloca i32*, align 8
  store i32* %a, i32** %a.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %a.addr, metadata !12, metadata !13), !dbg !14
  %0 = load i32*, i32** %a.addr, align 8, !dbg !15
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 0, !dbg !15
  store i32 0, i32* %arrayidx, align 4, !dbg !16
  %1 = load i32*, i32** %a.addr, align 8, !dbg !17
  %arrayidx1 = getelementptr inbounds i32, i32* %1, i64 2, !dbg !17
  store i32 2, i32* %arrayidx1, align 4, !dbg !18
  ret void, !dbg !19
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind uwtable
define void @uninit_var_015_bad() #0 !dbg !20 {
entry:
  %a = alloca [3 x i32], align 4
  %ret = alloca i32, align 4
  call void @llvm.dbg.declare(metadata [3 x i32]* %a, metadata !23, metadata !13), !dbg !27
  call void @llvm.dbg.declare(metadata i32* %ret, metadata !28, metadata !13), !dbg !29
  %arraydecay = getelementptr inbounds [3 x i32], [3 x i32]* %a, i32 0, i32 0, !dbg !30
  call void @uninit_var_015_func_001_bad(i32* %arraydecay), !dbg !31
  %arrayidx = getelementptr inbounds [3 x i32], [3 x i32]* %a, i64 0, i64 1, !dbg !32
  %0 = load i32, i32* %arrayidx, align 4, !dbg !32
  store i32 %0, i32* %ret, align 4, !dbg !33
  ret void, !dbg !34
}

; Function Attrs: nounwind uwtable
define void @uninit_var_015_func_001_good(i32* %a) #0 !dbg !35 {
entry:
  %a.addr = alloca i32*, align 8
  store i32* %a, i32** %a.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %a.addr, metadata !36, metadata !13), !dbg !37
  %0 = load i32*, i32** %a.addr, align 8, !dbg !38
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 0, !dbg !38
  store i32 0, i32* %arrayidx, align 4, !dbg !39
  %1 = load i32*, i32** %a.addr, align 8, !dbg !40
  %arrayidx1 = getelementptr inbounds i32, i32* %1, i64 1, !dbg !40
  store i32 1, i32* %arrayidx1, align 4, !dbg !41
  %2 = load i32*, i32** %a.addr, align 8, !dbg !42
  %arrayidx2 = getelementptr inbounds i32, i32* %2, i64 2, !dbg !42
  store i32 2, i32* %arrayidx2, align 4, !dbg !43
  ret void, !dbg !44
}

; Function Attrs: nounwind uwtable
define void @uninit_var_015_good() #0 !dbg !45 {
entry:
  %a = alloca [3 x i32], align 4
  call void @llvm.dbg.declare(metadata [3 x i32]* %a, metadata !46, metadata !13), !dbg !47
  %arraydecay = getelementptr inbounds [3 x i32], [3 x i32]* %a, i32 0, i32 0, !dbg !48
  call void @uninit_var_015_func_001_good(i32* %arraydecay), !dbg !49
  ret void, !dbg !50
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !51 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @uninit_var_015_good(), !dbg !54
  call void @uninit_var_015_bad(), !dbg !55
  ret i32 0, !dbg !56
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4}
!llvm.ident = !{!5}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (tags/RELEASE_390/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2)
!1 = !DIFile(filename: "457_uninit_var_13.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/itc/457")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{!"clang version 3.9.0 (tags/RELEASE_390/final)"}
!6 = distinct !DISubprogram(name: "uninit_var_015_func_001_bad", scope: !7, file: !7, line: 10, type: !8, isLocal: false, isDefinition: true, scopeLine: 10, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!7 = !DIFile(filename: "./457_uninit_var_13.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/itc/457")
!8 = !DISubroutineType(types: !9)
!9 = !{null, !10}
!10 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !11, size: 64, align: 64)
!11 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!12 = !DILocalVariable(name: "a", arg: 1, scope: !6, file: !7, line: 10, type: !10)
!13 = !DIExpression()
!14 = !DILocation(line: 10, column: 38, scope: !6)
!15 = !DILocation(line: 11, column: 2, scope: !6)
!16 = !DILocation(line: 11, column: 7, scope: !6)
!17 = !DILocation(line: 12, column: 2, scope: !6)
!18 = !DILocation(line: 12, column: 7, scope: !6)
!19 = !DILocation(line: 13, column: 1, scope: !6)
!20 = distinct !DISubprogram(name: "uninit_var_015_bad", scope: !7, file: !7, line: 15, type: !21, isLocal: false, isDefinition: true, scopeLine: 15, isOptimized: false, unit: !0, variables: !2)
!21 = !DISubroutineType(types: !22)
!22 = !{null}
!23 = !DILocalVariable(name: "a", scope: !20, file: !7, line: 16, type: !24)
!24 = !DICompositeType(tag: DW_TAG_array_type, baseType: !11, size: 96, align: 32, elements: !25)
!25 = !{!26}
!26 = !DISubrange(count: 3)
!27 = !DILocation(line: 16, column: 9, scope: !20)
!28 = !DILocalVariable(name: "ret", scope: !20, file: !7, line: 16, type: !11)
!29 = !DILocation(line: 16, column: 14, scope: !20)
!30 = !DILocation(line: 17, column: 33, scope: !20)
!31 = !DILocation(line: 17, column: 5, scope: !20)
!32 = !DILocation(line: 18, column: 11, scope: !20)
!33 = !DILocation(line: 18, column: 9, scope: !20)
!34 = !DILocation(line: 19, column: 1, scope: !20)
!35 = distinct !DISubprogram(name: "uninit_var_015_func_001_good", scope: !7, file: !7, line: 25, type: !8, isLocal: false, isDefinition: true, scopeLine: 26, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!36 = !DILocalVariable(name: "a", arg: 1, scope: !35, file: !7, line: 25, type: !10)
!37 = !DILocation(line: 25, column: 39, scope: !35)
!38 = !DILocation(line: 27, column: 2, scope: !35)
!39 = !DILocation(line: 27, column: 7, scope: !35)
!40 = !DILocation(line: 28, column: 2, scope: !35)
!41 = !DILocation(line: 28, column: 7, scope: !35)
!42 = !DILocation(line: 29, column: 2, scope: !35)
!43 = !DILocation(line: 29, column: 7, scope: !35)
!44 = !DILocation(line: 30, column: 1, scope: !35)
!45 = distinct !DISubprogram(name: "uninit_var_015_good", scope: !7, file: !7, line: 32, type: !21, isLocal: false, isDefinition: true, scopeLine: 33, isOptimized: false, unit: !0, variables: !2)
!46 = !DILocalVariable(name: "a", scope: !45, file: !7, line: 34, type: !24)
!47 = !DILocation(line: 34, column: 9, scope: !45)
!48 = !DILocation(line: 35, column: 34, scope: !45)
!49 = !DILocation(line: 35, column: 5, scope: !45)
!50 = !DILocation(line: 36, column: 1, scope: !45)
!51 = distinct !DISubprogram(name: "main", scope: !7, file: !7, line: 39, type: !52, isLocal: false, isDefinition: true, scopeLine: 39, isOptimized: false, unit: !0, variables: !2)
!52 = !DISubroutineType(types: !53)
!53 = !{!11}
!54 = !DILocation(line: 40, column: 2, scope: !51)
!55 = !DILocation(line: 41, column: 2, scope: !51)
!56 = !DILocation(line: 42, column: 2, scope: !51)
