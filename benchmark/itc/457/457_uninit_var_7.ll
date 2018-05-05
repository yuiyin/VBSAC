; ModuleID = './457_uninit_var_7.c'
source_filename = "./457_uninit_var_7.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@_bad.ret_good = internal global i32 10, align 4

; Function Attrs: nounwind uwtable
define i32 @_bad(i32 %a) #0 !dbg !5 {
entry:
  %a.addr = alloca i32, align 4
  store i32 %a, i32* %a.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %a.addr, metadata !13, metadata !14), !dbg !15
  %0 = load i32, i32* %a.addr, align 4, !dbg !16
  %1 = load i32, i32* @_bad.ret_good, align 4, !dbg !17
  %sub = sub nsw i32 %1, %0, !dbg !17
  store i32 %sub, i32* @_bad.ret_good, align 4, !dbg !17
  %2 = load i32, i32* @_bad.ret_good, align 4, !dbg !18
  ret i32 %2, !dbg !19
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind uwtable
define void @u_bad() #0 !dbg !20 {
entry:
  %flag = alloca i32, align 4
  %data = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %flag, metadata !23, metadata !14), !dbg !24
  store i32 1, i32* %flag, align 4, !dbg !24
  call void @llvm.dbg.declare(metadata i32* %data, metadata !25, metadata !14), !dbg !26
  br label %while.cond, !dbg !27

while.cond:                                       ; preds = %while.body, %entry
  %0 = load i32, i32* %flag, align 4, !dbg !28
  %call = call i32 @_bad(i32 %0), !dbg !30
  %cmp = icmp sgt i32 %call, 0, !dbg !31
  br i1 %cmp, label %while.body, label %while.end, !dbg !32

while.body:                                       ; preds = %while.cond
  %1 = load i32, i32* %flag, align 4, !dbg !33
  %2 = load i32, i32* %data, align 4, !dbg !35
  %add = add nsw i32 %2, %1, !dbg !35
  store i32 %add, i32* %data, align 4, !dbg !35
  br label %while.cond, !dbg !36, !llvm.loop !38

while.end:                                        ; preds = %while.cond
  ret void, !dbg !39
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !40 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @u_bad(), !dbg !43
  ret i32 0, !dbg !44
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (tags/RELEASE_390/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, globals: !3)
!1 = !DIFile(filename: "457_uninit_var_7.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/itc/457")
!2 = !{}
!3 = !{!4}
!4 = distinct !DIGlobalVariable(name: "ret_good", scope: !5, file: !6, line: 27, type: !9, isLocal: true, isDefinition: true, variable: i32* @_bad.ret_good)
!5 = distinct !DISubprogram(name: "_bad", scope: !6, file: !6, line: 25, type: !7, isLocal: false, isDefinition: true, scopeLine: 26, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!6 = !DIFile(filename: "./457_uninit_var_7.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/itc/457")
!7 = !DISubroutineType(types: !8)
!8 = !{!9, !9}
!9 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!10 = !{i32 2, !"Dwarf Version", i32 4}
!11 = !{i32 2, !"Debug Info Version", i32 3}
!12 = !{!"clang version 3.9.0 (tags/RELEASE_390/final)"}
!13 = !DILocalVariable(name: "a", arg: 1, scope: !5, file: !6, line: 25, type: !9)
!14 = !DIExpression()
!15 = !DILocation(line: 25, column: 14, scope: !5)
!16 = !DILocation(line: 28, column: 14, scope: !5)
!17 = !DILocation(line: 28, column: 11, scope: !5)
!18 = !DILocation(line: 29, column: 9, scope: !5)
!19 = !DILocation(line: 29, column: 2, scope: !5)
!20 = distinct !DISubprogram(name: "u_bad", scope: !6, file: !6, line: 32, type: !21, isLocal: false, isDefinition: true, scopeLine: 33, isOptimized: false, unit: !0, variables: !2)
!21 = !DISubroutineType(types: !22)
!22 = !{null}
!23 = !DILocalVariable(name: "flag", scope: !20, file: !6, line: 34, type: !9)
!24 = !DILocation(line: 34, column: 9, scope: !20)
!25 = !DILocalVariable(name: "data", scope: !20, file: !6, line: 35, type: !9)
!26 = !DILocation(line: 35, column: 9, scope: !20)
!27 = !DILocation(line: 36, column: 5, scope: !20)
!28 = !DILocation(line: 36, column: 16, scope: !29)
!29 = !DILexicalBlockFile(scope: !20, file: !6, discriminator: 1)
!30 = !DILocation(line: 36, column: 11, scope: !29)
!31 = !DILocation(line: 36, column: 21, scope: !29)
!32 = !DILocation(line: 36, column: 5, scope: !29)
!33 = !DILocation(line: 38, column: 13, scope: !34)
!34 = distinct !DILexicalBlock(scope: !20, file: !6, line: 37, column: 5)
!35 = !DILocation(line: 38, column: 11, scope: !34)
!36 = !DILocation(line: 36, column: 5, scope: !37)
!37 = !DILexicalBlockFile(scope: !20, file: !6, discriminator: 2)
!38 = distinct !{!38, !27}
!39 = !DILocation(line: 40, column: 1, scope: !20)
!40 = distinct !DISubprogram(name: "main", scope: !6, file: !6, line: 42, type: !41, isLocal: false, isDefinition: true, scopeLine: 42, isOptimized: false, unit: !0, variables: !2)
!41 = !DISubroutineType(types: !42)
!42 = !{!9}
!43 = !DILocation(line: 43, column: 2, scope: !40)
!44 = !DILocation(line: 45, column: 2, scope: !40)
