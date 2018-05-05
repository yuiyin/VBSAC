; ModuleID = './369_zero_division_15.c'
source_filename = "./369_zero_division_15.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@zero_division_005_bad.divisors = private unnamed_addr constant [5 x i32] [i32 2, i32 1, i32 0, i32 3, i32 4], align 16
@zero_division_005_good.divisors = private unnamed_addr constant [5 x i32] [i32 2, i32 1, i32 3, i32 0, i32 4], align 16

; Function Attrs: nounwind uwtable
define void @zero_division_005_bad() #0 !dbg !6 {
entry:
  %dividend = alloca i32, align 4
  %divisors = alloca [5 x i32], align 16
  %ret = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %dividend, metadata !10, metadata !12), !dbg !13
  store i32 1000, i32* %dividend, align 4, !dbg !13
  call void @llvm.dbg.declare(metadata [5 x i32]* %divisors, metadata !14, metadata !12), !dbg !18
  %0 = bitcast [5 x i32]* %divisors to i8*, !dbg !18
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %0, i8* bitcast ([5 x i32]* @zero_division_005_bad.divisors to i8*), i64 20, i32 16, i1 false), !dbg !18
  call void @llvm.dbg.declare(metadata i32* %ret, metadata !19, metadata !12), !dbg !20
  %1 = load i32, i32* %dividend, align 4, !dbg !21
  %arrayidx = getelementptr inbounds [5 x i32], [5 x i32]* %divisors, i64 0, i64 2, !dbg !22
  %2 = load i32, i32* %arrayidx, align 8, !dbg !22
  %div = sdiv i32 %1, %2, !dbg !23
  store i32 %div, i32* %ret, align 4, !dbg !24
  ret void, !dbg !25
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i32, i1) #2

; Function Attrs: nounwind uwtable
define void @zero_division_005_good() #0 !dbg !26 {
entry:
  %dividend = alloca i32, align 4
  %divisors = alloca [5 x i32], align 16
  %ret = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %dividend, metadata !27, metadata !12), !dbg !28
  store i32 1000, i32* %dividend, align 4, !dbg !28
  call void @llvm.dbg.declare(metadata [5 x i32]* %divisors, metadata !29, metadata !12), !dbg !30
  %0 = bitcast [5 x i32]* %divisors to i8*, !dbg !30
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %0, i8* bitcast ([5 x i32]* @zero_division_005_good.divisors to i8*), i64 20, i32 16, i1 false), !dbg !30
  call void @llvm.dbg.declare(metadata i32* %ret, metadata !31, metadata !12), !dbg !32
  %1 = load i32, i32* %dividend, align 4, !dbg !33
  %arrayidx = getelementptr inbounds [5 x i32], [5 x i32]* %divisors, i64 0, i64 2, !dbg !34
  %2 = load i32, i32* %arrayidx, align 8, !dbg !34
  %div = sdiv i32 %1, %2, !dbg !35
  store i32 %div, i32* %ret, align 4, !dbg !36
  ret void, !dbg !37
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !38 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @zero_division_005_good(), !dbg !41
  call void @zero_division_005_bad(), !dbg !42
  ret i32 0, !dbg !43
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { argmemonly nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4}
!llvm.ident = !{!5}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (tags/RELEASE_390/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2)
!1 = !DIFile(filename: "369_zero_division_15.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/itc/369")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{!"clang version 3.9.0 (tags/RELEASE_390/final)"}
!6 = distinct !DISubprogram(name: "zero_division_005_bad", scope: !7, file: !7, line: 11, type: !8, isLocal: false, isDefinition: true, scopeLine: 12, isOptimized: false, unit: !0, variables: !2)
!7 = !DIFile(filename: "./369_zero_division_15.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/itc/369")
!8 = !DISubroutineType(types: !9)
!9 = !{null}
!10 = !DILocalVariable(name: "dividend", scope: !6, file: !7, line: 13, type: !11)
!11 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!12 = !DIExpression()
!13 = !DILocation(line: 13, column: 6, scope: !6)
!14 = !DILocalVariable(name: "divisors", scope: !6, file: !7, line: 14, type: !15)
!15 = !DICompositeType(tag: DW_TAG_array_type, baseType: !11, size: 160, align: 32, elements: !16)
!16 = !{!17}
!17 = !DISubrange(count: 5)
!18 = !DILocation(line: 14, column: 6, scope: !6)
!19 = !DILocalVariable(name: "ret", scope: !6, file: !7, line: 15, type: !11)
!20 = !DILocation(line: 15, column: 6, scope: !6)
!21 = !DILocation(line: 16, column: 8, scope: !6)
!22 = !DILocation(line: 16, column: 19, scope: !6)
!23 = !DILocation(line: 16, column: 17, scope: !6)
!24 = !DILocation(line: 16, column: 6, scope: !6)
!25 = !DILocation(line: 17, column: 1, scope: !6)
!26 = distinct !DISubprogram(name: "zero_division_005_good", scope: !7, file: !7, line: 23, type: !8, isLocal: false, isDefinition: true, scopeLine: 24, isOptimized: false, unit: !0, variables: !2)
!27 = !DILocalVariable(name: "dividend", scope: !26, file: !7, line: 25, type: !11)
!28 = !DILocation(line: 25, column: 6, scope: !26)
!29 = !DILocalVariable(name: "divisors", scope: !26, file: !7, line: 26, type: !15)
!30 = !DILocation(line: 26, column: 6, scope: !26)
!31 = !DILocalVariable(name: "ret", scope: !26, file: !7, line: 27, type: !11)
!32 = !DILocation(line: 27, column: 6, scope: !26)
!33 = !DILocation(line: 28, column: 8, scope: !26)
!34 = !DILocation(line: 28, column: 19, scope: !26)
!35 = !DILocation(line: 28, column: 17, scope: !26)
!36 = !DILocation(line: 28, column: 6, scope: !26)
!37 = !DILocation(line: 29, column: 1, scope: !26)
!38 = distinct !DISubprogram(name: "main", scope: !7, file: !7, line: 31, type: !39, isLocal: false, isDefinition: true, scopeLine: 31, isOptimized: false, unit: !0, variables: !2)
!39 = !DISubroutineType(types: !40)
!40 = !{!11}
!41 = !DILocation(line: 32, column: 2, scope: !38)
!42 = !DILocation(line: 33, column: 3, scope: !38)
!43 = !DILocation(line: 34, column: 3, scope: !38)
