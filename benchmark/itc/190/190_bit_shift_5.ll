; ModuleID = './190_bit_shift_5.c'
source_filename = "./190_bit_shift_5.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: nounwind uwtable
define void @bit_shift_008_bad() #0 !dbg !6 {
entry:
  %a = alloca i32, align 4
  %shift = alloca i32, align 4
  %ret = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %a, metadata !10, metadata !12), !dbg !13
  store i32 1, i32* %a, align 4, !dbg !13
  call void @llvm.dbg.declare(metadata i32* %shift, metadata !14, metadata !12), !dbg !15
  store i32 32, i32* %shift, align 4, !dbg !15
  call void @llvm.dbg.declare(metadata i32* %ret, metadata !16, metadata !12), !dbg !17
  %0 = load i32, i32* %a, align 4, !dbg !18
  %1 = load i32, i32* %shift, align 4, !dbg !19
  %shl = shl i32 %0, %1, !dbg !20
  store i32 %shl, i32* %ret, align 4, !dbg !21
  ret void, !dbg !22
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind uwtable
define void @bit_shift_008_good() #0 !dbg !23 {
entry:
  %a = alloca i32, align 4
  %shift = alloca i32, align 4
  %ret = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %a, metadata !24, metadata !12), !dbg !25
  store i32 1, i32* %a, align 4, !dbg !25
  call void @llvm.dbg.declare(metadata i32* %shift, metadata !26, metadata !12), !dbg !27
  store i32 10, i32* %shift, align 4, !dbg !27
  call void @llvm.dbg.declare(metadata i32* %ret, metadata !28, metadata !12), !dbg !29
  %0 = load i32, i32* %a, align 4, !dbg !30
  %1 = load i32, i32* %shift, align 4, !dbg !31
  %shl = shl i32 %0, %1, !dbg !32
  store i32 %shl, i32* %ret, align 4, !dbg !33
  ret void, !dbg !34
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !35 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @bit_shift_008_good(), !dbg !38
  call void @bit_shift_008_bad(), !dbg !39
  ret i32 0, !dbg !40
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4}
!llvm.ident = !{!5}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (tags/RELEASE_390/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2)
!1 = !DIFile(filename: "190_bit_shift_5.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/itc/190")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{!"clang version 3.9.0 (tags/RELEASE_390/final)"}
!6 = distinct !DISubprogram(name: "bit_shift_008_bad", scope: !7, file: !7, line: 7, type: !8, isLocal: false, isDefinition: true, scopeLine: 8, isOptimized: false, unit: !0, variables: !2)
!7 = !DIFile(filename: "./190_bit_shift_5.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/itc/190")
!8 = !DISubroutineType(types: !9)
!9 = !{null}
!10 = !DILocalVariable(name: "a", scope: !6, file: !7, line: 9, type: !11)
!11 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!12 = !DIExpression()
!13 = !DILocation(line: 9, column: 6, scope: !6)
!14 = !DILocalVariable(name: "shift", scope: !6, file: !7, line: 10, type: !11)
!15 = !DILocation(line: 10, column: 6, scope: !6)
!16 = !DILocalVariable(name: "ret", scope: !6, file: !7, line: 11, type: !11)
!17 = !DILocation(line: 11, column: 6, scope: !6)
!18 = !DILocation(line: 12, column: 8, scope: !6)
!19 = !DILocation(line: 12, column: 13, scope: !6)
!20 = !DILocation(line: 12, column: 10, scope: !6)
!21 = !DILocation(line: 12, column: 6, scope: !6)
!22 = !DILocation(line: 14, column: 1, scope: !6)
!23 = distinct !DISubprogram(name: "bit_shift_008_good", scope: !7, file: !7, line: 20, type: !8, isLocal: false, isDefinition: true, scopeLine: 21, isOptimized: false, unit: !0, variables: !2)
!24 = !DILocalVariable(name: "a", scope: !23, file: !7, line: 22, type: !11)
!25 = !DILocation(line: 22, column: 6, scope: !23)
!26 = !DILocalVariable(name: "shift", scope: !23, file: !7, line: 23, type: !11)
!27 = !DILocation(line: 23, column: 6, scope: !23)
!28 = !DILocalVariable(name: "ret", scope: !23, file: !7, line: 24, type: !11)
!29 = !DILocation(line: 24, column: 6, scope: !23)
!30 = !DILocation(line: 25, column: 8, scope: !23)
!31 = !DILocation(line: 25, column: 13, scope: !23)
!32 = !DILocation(line: 25, column: 10, scope: !23)
!33 = !DILocation(line: 25, column: 6, scope: !23)
!34 = !DILocation(line: 27, column: 1, scope: !23)
!35 = distinct !DISubprogram(name: "main", scope: !7, file: !7, line: 29, type: !36, isLocal: false, isDefinition: true, scopeLine: 29, isOptimized: false, unit: !0, variables: !2)
!36 = !DISubroutineType(types: !37)
!37 = !{!11}
!38 = !DILocation(line: 30, column: 3, scope: !35)
!39 = !DILocation(line: 31, column: 2, scope: !35)
!40 = !DILocation(line: 32, column: 3, scope: !35)
