; ModuleID = './190_bit_shift_6.c'
source_filename = "./190_bit_shift_6.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: nounwind uwtable
define void @bit_shift_009_bad() #0 !dbg !6 {
entry:
  %a = alloca i32, align 4
  %shift = alloca i32, align 4
  %ret = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %a, metadata !10, metadata !12), !dbg !13
  store i32 1, i32* %a, align 4, !dbg !13
  call void @llvm.dbg.declare(metadata i32* %shift, metadata !14, metadata !12), !dbg !15
  call void @llvm.dbg.declare(metadata i32* %ret, metadata !16, metadata !12), !dbg !17
  %call = call i32 @rand(), !dbg !18
  store i32 %call, i32* %shift, align 4, !dbg !19
  %0 = load i32, i32* %a, align 4, !dbg !20
  %1 = load i32, i32* %shift, align 4, !dbg !21
  %shl = shl i32 %0, %1, !dbg !22
  store i32 %shl, i32* %ret, align 4, !dbg !23
  ret void, !dbg !24
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @rand() #2

; Function Attrs: nounwind uwtable
define void @bit_shift_009_good() #0 !dbg !25 {
entry:
  %a = alloca i32, align 4
  %shift = alloca i32, align 4
  %ret = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %a, metadata !26, metadata !12), !dbg !27
  store i32 1, i32* %a, align 4, !dbg !27
  call void @llvm.dbg.declare(metadata i32* %shift, metadata !28, metadata !12), !dbg !29
  call void @llvm.dbg.declare(metadata i32* %ret, metadata !30, metadata !12), !dbg !31
  %call = call i32 @rand(), !dbg !32
  %rem = srem i32 %call, 30, !dbg !33
  store i32 %rem, i32* %shift, align 4, !dbg !34
  %0 = load i32, i32* %a, align 4, !dbg !35
  %1 = load i32, i32* %shift, align 4, !dbg !36
  %shl = shl i32 %0, %1, !dbg !37
  store i32 %shl, i32* %ret, align 4, !dbg !38
  ret void, !dbg !39
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !40 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @bit_shift_009_good(), !dbg !43
  call void @bit_shift_009_bad(), !dbg !44
  ret i32 0, !dbg !45
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4}
!llvm.ident = !{!5}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (tags/RELEASE_390/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2)
!1 = !DIFile(filename: "190_bit_shift_6.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/itc/190")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{!"clang version 3.9.0 (tags/RELEASE_390/final)"}
!6 = distinct !DISubprogram(name: "bit_shift_009_bad", scope: !7, file: !7, line: 10, type: !8, isLocal: false, isDefinition: true, scopeLine: 11, isOptimized: false, unit: !0, variables: !2)
!7 = !DIFile(filename: "./190_bit_shift_6.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/itc/190")
!8 = !DISubroutineType(types: !9)
!9 = !{null}
!10 = !DILocalVariable(name: "a", scope: !6, file: !7, line: 12, type: !11)
!11 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!12 = !DIExpression()
!13 = !DILocation(line: 12, column: 6, scope: !6)
!14 = !DILocalVariable(name: "shift", scope: !6, file: !7, line: 13, type: !11)
!15 = !DILocation(line: 13, column: 6, scope: !6)
!16 = !DILocalVariable(name: "ret", scope: !6, file: !7, line: 14, type: !11)
!17 = !DILocation(line: 14, column: 6, scope: !6)
!18 = !DILocation(line: 15, column: 10, scope: !6)
!19 = !DILocation(line: 15, column: 8, scope: !6)
!20 = !DILocation(line: 16, column: 8, scope: !6)
!21 = !DILocation(line: 16, column: 13, scope: !6)
!22 = !DILocation(line: 16, column: 10, scope: !6)
!23 = !DILocation(line: 16, column: 6, scope: !6)
!24 = !DILocation(line: 18, column: 1, scope: !6)
!25 = distinct !DISubprogram(name: "bit_shift_009_good", scope: !7, file: !7, line: 24, type: !8, isLocal: false, isDefinition: true, scopeLine: 25, isOptimized: false, unit: !0, variables: !2)
!26 = !DILocalVariable(name: "a", scope: !25, file: !7, line: 26, type: !11)
!27 = !DILocation(line: 26, column: 6, scope: !25)
!28 = !DILocalVariable(name: "shift", scope: !25, file: !7, line: 27, type: !11)
!29 = !DILocation(line: 27, column: 6, scope: !25)
!30 = !DILocalVariable(name: "ret", scope: !25, file: !7, line: 28, type: !11)
!31 = !DILocation(line: 28, column: 6, scope: !25)
!32 = !DILocation(line: 29, column: 10, scope: !25)
!33 = !DILocation(line: 29, column: 17, scope: !25)
!34 = !DILocation(line: 29, column: 8, scope: !25)
!35 = !DILocation(line: 30, column: 8, scope: !25)
!36 = !DILocation(line: 30, column: 13, scope: !25)
!37 = !DILocation(line: 30, column: 10, scope: !25)
!38 = !DILocation(line: 30, column: 6, scope: !25)
!39 = !DILocation(line: 32, column: 1, scope: !25)
!40 = distinct !DISubprogram(name: "main", scope: !7, file: !7, line: 34, type: !41, isLocal: false, isDefinition: true, scopeLine: 34, isOptimized: false, unit: !0, variables: !2)
!41 = !DISubroutineType(types: !42)
!42 = !{!11}
!43 = !DILocation(line: 35, column: 3, scope: !40)
!44 = !DILocation(line: 36, column: 2, scope: !40)
!45 = !DILocation(line: 37, column: 3, scope: !40)
