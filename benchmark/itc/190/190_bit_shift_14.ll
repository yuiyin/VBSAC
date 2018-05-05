; ModuleID = './190_bit_shift_14.c'
source_filename = "./190_bit_shift_14.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: nounwind uwtable
define void @bit_shift_017_bad() #0 !dbg !6 {
entry:
  %ret = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %ret, metadata !10, metadata !12), !dbg !13
  store i32 undef, i32* %ret, align 4, !dbg !14
  ret void, !dbg !15
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind uwtable
define void @bit_shift_017_good() #0 !dbg !16 {
entry:
  %ret = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %ret, metadata !17, metadata !12), !dbg !18
  store i32 1024, i32* %ret, align 4, !dbg !19
  ret void, !dbg !20
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !21 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @bit_shift_017_good(), !dbg !24
  call void @bit_shift_017_bad(), !dbg !25
  ret i32 0, !dbg !26
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4}
!llvm.ident = !{!5}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (tags/RELEASE_390/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2)
!1 = !DIFile(filename: "190_bit_shift_14.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/itc/190")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{!"clang version 3.9.0 (tags/RELEASE_390/final)"}
!6 = distinct !DISubprogram(name: "bit_shift_017_bad", scope: !7, file: !7, line: 7, type: !8, isLocal: false, isDefinition: true, scopeLine: 8, isOptimized: false, unit: !0, variables: !2)
!7 = !DIFile(filename: "./190_bit_shift_14.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/itc/190")
!8 = !DISubroutineType(types: !9)
!9 = !{null}
!10 = !DILocalVariable(name: "ret", scope: !6, file: !7, line: 9, type: !11)
!11 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!12 = !DIExpression()
!13 = !DILocation(line: 9, column: 6, scope: !6)
!14 = !DILocation(line: 10, column: 6, scope: !6)
!15 = !DILocation(line: 12, column: 1, scope: !6)
!16 = distinct !DISubprogram(name: "bit_shift_017_good", scope: !7, file: !7, line: 18, type: !8, isLocal: false, isDefinition: true, scopeLine: 19, isOptimized: false, unit: !0, variables: !2)
!17 = !DILocalVariable(name: "ret", scope: !16, file: !7, line: 20, type: !11)
!18 = !DILocation(line: 20, column: 6, scope: !16)
!19 = !DILocation(line: 21, column: 6, scope: !16)
!20 = !DILocation(line: 23, column: 1, scope: !16)
!21 = distinct !DISubprogram(name: "main", scope: !7, file: !7, line: 25, type: !22, isLocal: false, isDefinition: true, scopeLine: 25, isOptimized: false, unit: !0, variables: !2)
!22 = !DISubroutineType(types: !23)
!23 = !{!11}
!24 = !DILocation(line: 26, column: 3, scope: !21)
!25 = !DILocation(line: 27, column: 2, scope: !21)
!26 = !DILocation(line: 28, column: 3, scope: !21)
