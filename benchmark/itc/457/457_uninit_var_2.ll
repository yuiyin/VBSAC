; ModuleID = './457_uninit_var_2.c'
source_filename = "./457_uninit_var_2.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@uninit_var_002_good.buf = private unnamed_addr constant [5 x i32] [i32 1, i32 2, i32 3, i32 4, i32 5], align 16

; Function Attrs: nounwind uwtable
define void @uninit_var_002_bad() #0 !dbg !6 {
entry:
  %buf = alloca [5 x i32], align 16
  %ret = alloca i32, align 4
  call void @llvm.dbg.declare(metadata [5 x i32]* %buf, metadata !10, metadata !15), !dbg !16
  call void @llvm.dbg.declare(metadata i32* %ret, metadata !17, metadata !15), !dbg !18
  %arrayidx = getelementptr inbounds [5 x i32], [5 x i32]* %buf, i64 0, i64 3, !dbg !19
  %0 = load i32, i32* %arrayidx, align 4, !dbg !19
  store i32 %0, i32* %ret, align 4, !dbg !20
  ret void, !dbg !21
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind uwtable
define void @uninit_var_002_good() #0 !dbg !22 {
entry:
  %buf = alloca [5 x i32], align 16
  %ret = alloca i32, align 4
  call void @llvm.dbg.declare(metadata [5 x i32]* %buf, metadata !23, metadata !15), !dbg !24
  %0 = bitcast [5 x i32]* %buf to i8*, !dbg !24
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %0, i8* bitcast ([5 x i32]* @uninit_var_002_good.buf to i8*), i64 20, i32 16, i1 false), !dbg !24
  call void @llvm.dbg.declare(metadata i32* %ret, metadata !25, metadata !15), !dbg !26
  %arrayidx = getelementptr inbounds [5 x i32], [5 x i32]* %buf, i64 0, i64 3, !dbg !27
  %1 = load i32, i32* %arrayidx, align 4, !dbg !27
  store i32 %1, i32* %ret, align 4, !dbg !28
  ret void, !dbg !29
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i32, i1) #2

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !30 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @uninit_var_002_good(), !dbg !33
  call void @uninit_var_002_bad(), !dbg !34
  ret i32 0, !dbg !35
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { argmemonly nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4}
!llvm.ident = !{!5}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (tags/RELEASE_390/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2)
!1 = !DIFile(filename: "457_uninit_var_2.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/itc/457")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{!"clang version 3.9.0 (tags/RELEASE_390/final)"}
!6 = distinct !DISubprogram(name: "uninit_var_002_bad", scope: !7, file: !7, line: 7, type: !8, isLocal: false, isDefinition: true, scopeLine: 7, isOptimized: false, unit: !0, variables: !2)
!7 = !DIFile(filename: "./457_uninit_var_2.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/itc/457")
!8 = !DISubroutineType(types: !9)
!9 = !{null}
!10 = !DILocalVariable(name: "buf", scope: !6, file: !7, line: 8, type: !11)
!11 = !DICompositeType(tag: DW_TAG_array_type, baseType: !12, size: 160, align: 32, elements: !13)
!12 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!13 = !{!14}
!14 = !DISubrange(count: 5)
!15 = !DIExpression()
!16 = !DILocation(line: 8, column: 6, scope: !6)
!17 = !DILocalVariable(name: "ret", scope: !6, file: !7, line: 9, type: !12)
!18 = !DILocation(line: 9, column: 6, scope: !6)
!19 = !DILocation(line: 10, column: 8, scope: !6)
!20 = !DILocation(line: 10, column: 6, scope: !6)
!21 = !DILocation(line: 11, column: 1, scope: !6)
!22 = distinct !DISubprogram(name: "uninit_var_002_good", scope: !7, file: !7, line: 17, type: !8, isLocal: false, isDefinition: true, scopeLine: 18, isOptimized: false, unit: !0, variables: !2)
!23 = !DILocalVariable(name: "buf", scope: !22, file: !7, line: 19, type: !11)
!24 = !DILocation(line: 19, column: 6, scope: !22)
!25 = !DILocalVariable(name: "ret", scope: !22, file: !7, line: 20, type: !12)
!26 = !DILocation(line: 20, column: 6, scope: !22)
!27 = !DILocation(line: 21, column: 8, scope: !22)
!28 = !DILocation(line: 21, column: 6, scope: !22)
!29 = !DILocation(line: 23, column: 1, scope: !22)
!30 = distinct !DISubprogram(name: "main", scope: !7, file: !7, line: 25, type: !31, isLocal: false, isDefinition: true, scopeLine: 25, isOptimized: false, unit: !0, variables: !2)
!31 = !DISubroutineType(types: !32)
!32 = !{!12}
!33 = !DILocation(line: 26, column: 2, scope: !30)
!34 = !DILocation(line: 27, column: 2, scope: !30)
!35 = !DILocation(line: 28, column: 2, scope: !30)
