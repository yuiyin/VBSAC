; ModuleID = './457_uninit_memory_access_1.c'
source_filename = "./457_uninit_memory_access_1.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: nounwind uwtable
define void @uninit_memory_access_001_bad() #0 !dbg !6 {
entry:
  %a = alloca i64, align 8
  %ret = alloca i64*, align 8
  call void @llvm.dbg.declare(metadata i64* %a, metadata !10, metadata !12), !dbg !13
  call void @llvm.dbg.declare(metadata i64** %ret, metadata !14, metadata !12), !dbg !16
  store i64* %a, i64** %ret, align 8, !dbg !17
  ret void, !dbg !18
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind uwtable
define void @uninit_memory_access_001_good() #0 !dbg !19 {
entry:
  %a = alloca i64, align 8
  %ret = alloca i64*, align 8
  call void @llvm.dbg.declare(metadata i64* %a, metadata !20, metadata !12), !dbg !21
  store i64 10, i64* %a, align 8, !dbg !21
  call void @llvm.dbg.declare(metadata i64** %ret, metadata !22, metadata !12), !dbg !23
  store i64* %a, i64** %ret, align 8, !dbg !24
  ret void, !dbg !25
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !26 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @uninit_memory_access_001_good(), !dbg !30
  call void @uninit_memory_access_001_bad(), !dbg !31
  ret i32 0, !dbg !32
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4}
!llvm.ident = !{!5}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (tags/RELEASE_390/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2)
!1 = !DIFile(filename: "457_uninit_memory_access_1.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/itc/457")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{!"clang version 3.9.0 (tags/RELEASE_390/final)"}
!6 = distinct !DISubprogram(name: "uninit_memory_access_001_bad", scope: !7, file: !7, line: 7, type: !8, isLocal: false, isDefinition: true, scopeLine: 8, isOptimized: false, unit: !0, variables: !2)
!7 = !DIFile(filename: "./457_uninit_memory_access_1.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/itc/457")
!8 = !DISubroutineType(types: !9)
!9 = !{null}
!10 = !DILocalVariable(name: "a", scope: !6, file: !7, line: 9, type: !11)
!11 = !DIBasicType(name: "long unsigned int", size: 64, align: 64, encoding: DW_ATE_unsigned)
!12 = !DIExpression()
!13 = !DILocation(line: 9, column: 16, scope: !6)
!14 = !DILocalVariable(name: "ret", scope: !6, file: !7, line: 10, type: !15)
!15 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !11, size: 64, align: 64)
!16 = !DILocation(line: 10, column: 17, scope: !6)
!17 = !DILocation(line: 11, column: 6, scope: !6)
!18 = !DILocation(line: 12, column: 1, scope: !6)
!19 = distinct !DISubprogram(name: "uninit_memory_access_001_good", scope: !7, file: !7, line: 18, type: !8, isLocal: false, isDefinition: true, scopeLine: 19, isOptimized: false, unit: !0, variables: !2)
!20 = !DILocalVariable(name: "a", scope: !19, file: !7, line: 20, type: !11)
!21 = !DILocation(line: 20, column: 16, scope: !19)
!22 = !DILocalVariable(name: "ret", scope: !19, file: !7, line: 21, type: !15)
!23 = !DILocation(line: 21, column: 17, scope: !19)
!24 = !DILocation(line: 22, column: 6, scope: !19)
!25 = !DILocation(line: 23, column: 1, scope: !19)
!26 = distinct !DISubprogram(name: "main", scope: !7, file: !7, line: 25, type: !27, isLocal: false, isDefinition: true, scopeLine: 25, isOptimized: false, unit: !0, variables: !2)
!27 = !DISubroutineType(types: !28)
!28 = !{!29}
!29 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!30 = !DILocation(line: 26, column: 2, scope: !26)
!31 = !DILocation(line: 27, column: 2, scope: !26)
!32 = !DILocation(line: 28, column: 2, scope: !26)
