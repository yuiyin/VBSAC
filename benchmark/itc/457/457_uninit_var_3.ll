; ModuleID = './457_uninit_var_3.c'
source_filename = "./457_uninit_var_3.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@uninit_var_003_good.buf = private unnamed_addr constant [5 x [6 x i32]] [[6 x i32] [i32 1, i32 2, i32 3, i32 4, i32 5, i32 6], [6 x i32] [i32 11, i32 12, i32 13, i32 14, i32 15, i32 16], [6 x i32] [i32 21, i32 22, i32 23, i32 24, i32 25, i32 26], [6 x i32] [i32 31, i32 32, i32 33, i32 34, i32 35, i32 36], [6 x i32] [i32 41, i32 42, i32 43, i32 44, i32 45, i32 46]], align 16

; Function Attrs: nounwind uwtable
define void @uninit_var_003_bad() #0 !dbg !6 {
entry:
  %buf = alloca [5 x [6 x i32]], align 16
  %ret = alloca i32, align 4
  call void @llvm.dbg.declare(metadata [5 x [6 x i32]]* %buf, metadata !10, metadata !16), !dbg !17
  call void @llvm.dbg.declare(metadata i32* %ret, metadata !18, metadata !16), !dbg !19
  %arrayidx = getelementptr inbounds [5 x [6 x i32]], [5 x [6 x i32]]* %buf, i64 0, i64 1, !dbg !20
  %arrayidx1 = getelementptr inbounds [6 x i32], [6 x i32]* %arrayidx, i64 0, i64 1, !dbg !20
  %0 = load i32, i32* %arrayidx1, align 4, !dbg !20
  store i32 %0, i32* %ret, align 4, !dbg !21
  ret void, !dbg !22
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind uwtable
define void @uninit_var_003_good() #0 !dbg !23 {
entry:
  %buf = alloca [5 x [6 x i32]], align 16
  %ret = alloca i32, align 4
  call void @llvm.dbg.declare(metadata [5 x [6 x i32]]* %buf, metadata !24, metadata !16), !dbg !25
  %0 = bitcast [5 x [6 x i32]]* %buf to i8*, !dbg !25
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %0, i8* bitcast ([5 x [6 x i32]]* @uninit_var_003_good.buf to i8*), i64 120, i32 16, i1 false), !dbg !25
  call void @llvm.dbg.declare(metadata i32* %ret, metadata !26, metadata !16), !dbg !27
  %arrayidx = getelementptr inbounds [5 x [6 x i32]], [5 x [6 x i32]]* %buf, i64 0, i64 1, !dbg !28
  %arrayidx1 = getelementptr inbounds [6 x i32], [6 x i32]* %arrayidx, i64 0, i64 1, !dbg !28
  %1 = load i32, i32* %arrayidx1, align 4, !dbg !28
  store i32 %1, i32* %ret, align 4, !dbg !29
  ret void, !dbg !30
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i32, i1) #2

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !31 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @uninit_var_003_good(), !dbg !34
  call void @uninit_var_003_bad(), !dbg !35
  ret i32 0, !dbg !36
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { argmemonly nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4}
!llvm.ident = !{!5}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (tags/RELEASE_390/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2)
!1 = !DIFile(filename: "457_uninit_var_3.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/itc/457")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{!"clang version 3.9.0 (tags/RELEASE_390/final)"}
!6 = distinct !DISubprogram(name: "uninit_var_003_bad", scope: !7, file: !7, line: 7, type: !8, isLocal: false, isDefinition: true, scopeLine: 7, isOptimized: false, unit: !0, variables: !2)
!7 = !DIFile(filename: "./457_uninit_var_3.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/itc/457")
!8 = !DISubroutineType(types: !9)
!9 = !{null}
!10 = !DILocalVariable(name: "buf", scope: !6, file: !7, line: 8, type: !11)
!11 = !DICompositeType(tag: DW_TAG_array_type, baseType: !12, size: 960, align: 32, elements: !13)
!12 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!13 = !{!14, !15}
!14 = !DISubrange(count: 5)
!15 = !DISubrange(count: 6)
!16 = !DIExpression()
!17 = !DILocation(line: 8, column: 6, scope: !6)
!18 = !DILocalVariable(name: "ret", scope: !6, file: !7, line: 9, type: !12)
!19 = !DILocation(line: 9, column: 6, scope: !6)
!20 = !DILocation(line: 10, column: 8, scope: !6)
!21 = !DILocation(line: 10, column: 6, scope: !6)
!22 = !DILocation(line: 11, column: 1, scope: !6)
!23 = distinct !DISubprogram(name: "uninit_var_003_good", scope: !7, file: !7, line: 17, type: !8, isLocal: false, isDefinition: true, scopeLine: 18, isOptimized: false, unit: !0, variables: !2)
!24 = !DILocalVariable(name: "buf", scope: !23, file: !7, line: 19, type: !11)
!25 = !DILocation(line: 19, column: 6, scope: !23)
!26 = !DILocalVariable(name: "ret", scope: !23, file: !7, line: 24, type: !12)
!27 = !DILocation(line: 24, column: 6, scope: !23)
!28 = !DILocation(line: 25, column: 8, scope: !23)
!29 = !DILocation(line: 25, column: 6, scope: !23)
!30 = !DILocation(line: 27, column: 1, scope: !23)
!31 = distinct !DISubprogram(name: "main", scope: !7, file: !7, line: 29, type: !32, isLocal: false, isDefinition: true, scopeLine: 29, isOptimized: false, unit: !0, variables: !2)
!32 = !DISubroutineType(types: !33)
!33 = !{!12}
!34 = !DILocation(line: 30, column: 2, scope: !31)
!35 = !DILocation(line: 31, column: 2, scope: !31)
!36 = !DILocation(line: 32, column: 2, scope: !31)
