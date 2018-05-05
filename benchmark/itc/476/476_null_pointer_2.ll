; ModuleID = './476_null_pointer_2.c'
source_filename = "./476_null_pointer_2.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@null_pointer_002_good.buf = private unnamed_addr constant [5 x i32] [i32 1, i32 2, i32 3, i32 4, i32 5], align 16

; Function Attrs: nounwind uwtable
define void @null_pointer_002_bad() #0 !dbg !6 {
entry:
  %p = alloca i32*, align 8
  %ret = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32** %p, metadata !10, metadata !13), !dbg !14
  store i32* null, i32** %p, align 8, !dbg !14
  call void @llvm.dbg.declare(metadata i32* %ret, metadata !15, metadata !13), !dbg !16
  %0 = load i32*, i32** %p, align 8, !dbg !17
  %1 = load i32, i32* %0, align 4, !dbg !18
  store i32 %1, i32* %ret, align 4, !dbg !19
  ret void, !dbg !20
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind uwtable
define void @null_pointer_002_good() #0 !dbg !21 {
entry:
  %buf = alloca [5 x i32], align 16
  %p = alloca i32*, align 8
  %ret = alloca i32, align 4
  call void @llvm.dbg.declare(metadata [5 x i32]* %buf, metadata !22, metadata !13), !dbg !26
  %0 = bitcast [5 x i32]* %buf to i8*, !dbg !26
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %0, i8* bitcast ([5 x i32]* @null_pointer_002_good.buf to i8*), i64 20, i32 16, i1 false), !dbg !26
  call void @llvm.dbg.declare(metadata i32** %p, metadata !27, metadata !13), !dbg !28
  %arraydecay = getelementptr inbounds [5 x i32], [5 x i32]* %buf, i32 0, i32 0, !dbg !29
  store i32* %arraydecay, i32** %p, align 8, !dbg !28
  call void @llvm.dbg.declare(metadata i32* %ret, metadata !30, metadata !13), !dbg !31
  %1 = load i32*, i32** %p, align 8, !dbg !32
  %2 = load i32, i32* %1, align 4, !dbg !33
  store i32 %2, i32* %ret, align 4, !dbg !34
  ret void, !dbg !35
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i32, i1) #2

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !36 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @null_pointer_002_good(), !dbg !39
  call void @null_pointer_002_bad(), !dbg !40
  ret i32 0, !dbg !41
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { argmemonly nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4}
!llvm.ident = !{!5}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (tags/RELEASE_390/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2)
!1 = !DIFile(filename: "476_null_pointer_2.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/itc/476")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{!"clang version 3.9.0 (tags/RELEASE_390/final)"}
!6 = distinct !DISubprogram(name: "null_pointer_002_bad", scope: !7, file: !7, line: 17, type: !8, isLocal: false, isDefinition: true, scopeLine: 18, isOptimized: false, unit: !0, variables: !2)
!7 = !DIFile(filename: "./476_null_pointer_2.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/itc/476")
!8 = !DISubroutineType(types: !9)
!9 = !{null}
!10 = !DILocalVariable(name: "p", scope: !6, file: !7, line: 19, type: !11)
!11 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !12, size: 64, align: 64)
!12 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!13 = !DIExpression()
!14 = !DILocation(line: 19, column: 7, scope: !6)
!15 = !DILocalVariable(name: "ret", scope: !6, file: !7, line: 20, type: !12)
!16 = !DILocation(line: 20, column: 6, scope: !6)
!17 = !DILocation(line: 21, column: 9, scope: !6)
!18 = !DILocation(line: 21, column: 8, scope: !6)
!19 = !DILocation(line: 21, column: 6, scope: !6)
!20 = !DILocation(line: 23, column: 1, scope: !6)
!21 = distinct !DISubprogram(name: "null_pointer_002_good", scope: !7, file: !7, line: 29, type: !8, isLocal: false, isDefinition: true, scopeLine: 30, isOptimized: false, unit: !0, variables: !2)
!22 = !DILocalVariable(name: "buf", scope: !21, file: !7, line: 31, type: !23)
!23 = !DICompositeType(tag: DW_TAG_array_type, baseType: !12, size: 160, align: 32, elements: !24)
!24 = !{!25}
!25 = !DISubrange(count: 5)
!26 = !DILocation(line: 31, column: 6, scope: !21)
!27 = !DILocalVariable(name: "p", scope: !21, file: !7, line: 32, type: !11)
!28 = !DILocation(line: 32, column: 7, scope: !21)
!29 = !DILocation(line: 32, column: 11, scope: !21)
!30 = !DILocalVariable(name: "ret", scope: !21, file: !7, line: 33, type: !12)
!31 = !DILocation(line: 33, column: 6, scope: !21)
!32 = !DILocation(line: 34, column: 9, scope: !21)
!33 = !DILocation(line: 34, column: 8, scope: !21)
!34 = !DILocation(line: 34, column: 6, scope: !21)
!35 = !DILocation(line: 36, column: 1, scope: !21)
!36 = distinct !DISubprogram(name: "main", scope: !7, file: !7, line: 43, type: !37, isLocal: false, isDefinition: true, scopeLine: 44, isOptimized: false, unit: !0, variables: !2)
!37 = !DISubroutineType(types: !38)
!38 = !{!12}
!39 = !DILocation(line: 45, column: 2, scope: !36)
!40 = !DILocation(line: 46, column: 2, scope: !36)
!41 = !DILocation(line: 47, column: 2, scope: !36)
