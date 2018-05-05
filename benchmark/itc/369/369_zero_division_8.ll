; ModuleID = './369_zero_division_8.c'
source_filename = "./369_zero_division_8.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: nounwind uwtable
define void @zero_division_010_bad() #0 !dbg !6 {
entry:
  %dividend = alloca i32, align 4
  %divisor = alloca i32, align 4
  %ret = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %dividend, metadata !10, metadata !12), !dbg !13
  store i32 1000, i32* %dividend, align 4, !dbg !13
  call void @llvm.dbg.declare(metadata i32* %divisor, metadata !14, metadata !12), !dbg !15
  call void @llvm.dbg.declare(metadata i32* %ret, metadata !16, metadata !12), !dbg !17
  %call = call i32 @rand(), !dbg !18
  store i32 %call, i32* %divisor, align 4, !dbg !19
  %0 = load i32, i32* %dividend, align 4, !dbg !20
  %1 = load i32, i32* %divisor, align 4, !dbg !21
  %div = sdiv i32 %0, %1, !dbg !22
  store i32 %div, i32* %ret, align 4, !dbg !23
  ret void, !dbg !24
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @rand() #2

; Function Attrs: nounwind uwtable
define void @zero_division_010_good() #0 !dbg !25 {
entry:
  %dividend = alloca i32, align 4
  %divisor = alloca i32, align 4
  %ret = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %dividend, metadata !26, metadata !12), !dbg !27
  store i32 1000, i32* %dividend, align 4, !dbg !27
  call void @llvm.dbg.declare(metadata i32* %divisor, metadata !28, metadata !12), !dbg !29
  call void @llvm.dbg.declare(metadata i32* %ret, metadata !30, metadata !12), !dbg !31
  %call = call i32 @rand(), !dbg !32
  store i32 %call, i32* %divisor, align 4, !dbg !33
  %0 = load i32, i32* %divisor, align 4, !dbg !34
  %cmp = icmp ne i32 %0, 0, !dbg !36
  br i1 %cmp, label %if.then, label %if.end, !dbg !37

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %dividend, align 4, !dbg !38
  %2 = load i32, i32* %divisor, align 4, !dbg !40
  %div = sdiv i32 %1, %2, !dbg !41
  store i32 %div, i32* %ret, align 4, !dbg !42
  br label %if.end, !dbg !43

if.end:                                           ; preds = %if.then, %entry
  ret void, !dbg !44
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !45 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @zero_division_010_good(), !dbg !48
  call void @zero_division_010_bad(), !dbg !49
  ret i32 0, !dbg !50
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4}
!llvm.ident = !{!5}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (tags/RELEASE_390/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2)
!1 = !DIFile(filename: "369_zero_division_8.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/itc/369")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{!"clang version 3.9.0 (tags/RELEASE_390/final)"}
!6 = distinct !DISubprogram(name: "zero_division_010_bad", scope: !7, file: !7, line: 11, type: !8, isLocal: false, isDefinition: true, scopeLine: 12, isOptimized: false, unit: !0, variables: !2)
!7 = !DIFile(filename: "./369_zero_division_8.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/itc/369")
!8 = !DISubroutineType(types: !9)
!9 = !{null}
!10 = !DILocalVariable(name: "dividend", scope: !6, file: !7, line: 13, type: !11)
!11 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!12 = !DIExpression()
!13 = !DILocation(line: 13, column: 6, scope: !6)
!14 = !DILocalVariable(name: "divisor", scope: !6, file: !7, line: 14, type: !11)
!15 = !DILocation(line: 14, column: 6, scope: !6)
!16 = !DILocalVariable(name: "ret", scope: !6, file: !7, line: 15, type: !11)
!17 = !DILocation(line: 15, column: 6, scope: !6)
!18 = !DILocation(line: 16, column: 12, scope: !6)
!19 = !DILocation(line: 16, column: 10, scope: !6)
!20 = !DILocation(line: 17, column: 8, scope: !6)
!21 = !DILocation(line: 17, column: 19, scope: !6)
!22 = !DILocation(line: 17, column: 17, scope: !6)
!23 = !DILocation(line: 17, column: 6, scope: !6)
!24 = !DILocation(line: 18, column: 1, scope: !6)
!25 = distinct !DISubprogram(name: "zero_division_010_good", scope: !7, file: !7, line: 24, type: !8, isLocal: false, isDefinition: true, scopeLine: 25, isOptimized: false, unit: !0, variables: !2)
!26 = !DILocalVariable(name: "dividend", scope: !25, file: !7, line: 26, type: !11)
!27 = !DILocation(line: 26, column: 6, scope: !25)
!28 = !DILocalVariable(name: "divisor", scope: !25, file: !7, line: 27, type: !11)
!29 = !DILocation(line: 27, column: 6, scope: !25)
!30 = !DILocalVariable(name: "ret", scope: !25, file: !7, line: 28, type: !11)
!31 = !DILocation(line: 28, column: 6, scope: !25)
!32 = !DILocation(line: 29, column: 12, scope: !25)
!33 = !DILocation(line: 29, column: 10, scope: !25)
!34 = !DILocation(line: 30, column: 6, scope: !35)
!35 = distinct !DILexicalBlock(scope: !25, file: !7, line: 30, column: 6)
!36 = !DILocation(line: 30, column: 14, scope: !35)
!37 = !DILocation(line: 30, column: 6, scope: !25)
!38 = !DILocation(line: 32, column: 9, scope: !39)
!39 = distinct !DILexicalBlock(scope: !35, file: !7, line: 31, column: 2)
!40 = !DILocation(line: 32, column: 20, scope: !39)
!41 = !DILocation(line: 32, column: 18, scope: !39)
!42 = !DILocation(line: 32, column: 7, scope: !39)
!43 = !DILocation(line: 33, column: 2, scope: !39)
!44 = !DILocation(line: 34, column: 1, scope: !25)
!45 = distinct !DISubprogram(name: "main", scope: !7, file: !7, line: 37, type: !46, isLocal: false, isDefinition: true, scopeLine: 37, isOptimized: false, unit: !0, variables: !2)
!46 = !DISubroutineType(types: !47)
!47 = !{!11}
!48 = !DILocation(line: 38, column: 3, scope: !45)
!49 = !DILocation(line: 39, column: 2, scope: !45)
!50 = !DILocation(line: 40, column: 3, scope: !45)
