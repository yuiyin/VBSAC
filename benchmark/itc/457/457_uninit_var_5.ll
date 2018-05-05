; ModuleID = './457_uninit_var_5.c'
source_filename = "./457_uninit_var_5.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: nounwind uwtable
define void @uninit_var_006_bad() #0 !dbg !6 {
entry:
  %a = alloca i64, align 8
  %flag = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i64* %a, metadata !10, metadata !12), !dbg !13
  call void @llvm.dbg.declare(metadata i32* %flag, metadata !14, metadata !12), !dbg !16
  store i32 0, i32* %flag, align 4, !dbg !16
  %0 = load i32, i32* %flag, align 4, !dbg !17
  %cmp = icmp eq i32 %0, 10, !dbg !18
  br i1 %cmp, label %cond.true, label %cond.false, !dbg !19

cond.true:                                        ; preds = %entry
  store i64 1, i64* %a, align 8, !dbg !20
  br label %cond.end, !dbg !22

cond.false:                                       ; preds = %entry
  %1 = load i64, i64* %a, align 8, !dbg !23
  %conv = trunc i64 %1 to i32, !dbg !23
  store i32 %conv, i32* %flag, align 4, !dbg !25
  %conv1 = sext i32 %conv to i64, !dbg !26
  br label %cond.end, !dbg !27

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i64 [ 1, %cond.true ], [ %conv1, %cond.false ], !dbg !28
  ret void, !dbg !30
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind uwtable
define void @uninit_var_006_good() #0 !dbg !31 {
entry:
  %a = alloca i64, align 8
  %flag = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i64* %a, metadata !32, metadata !12), !dbg !33
  call void @llvm.dbg.declare(metadata i32* %flag, metadata !34, metadata !12), !dbg !35
  store i32 10, i32* %flag, align 4, !dbg !35
  %0 = load i32, i32* %flag, align 4, !dbg !36
  %cmp = icmp eq i32 %0, 10, !dbg !37
  br i1 %cmp, label %cond.true, label %cond.false, !dbg !38

cond.true:                                        ; preds = %entry
  store i64 1, i64* %a, align 8, !dbg !39
  br label %cond.end, !dbg !41

cond.false:                                       ; preds = %entry
  store i64 5, i64* %a, align 8, !dbg !42
  br label %cond.end, !dbg !44

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i64 [ 1, %cond.true ], [ 5, %cond.false ], !dbg !45
  ret void, !dbg !47
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !48 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @uninit_var_006_good(), !dbg !51
  call void @uninit_var_006_bad(), !dbg !52
  ret i32 0, !dbg !53
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4}
!llvm.ident = !{!5}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (tags/RELEASE_390/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2)
!1 = !DIFile(filename: "457_uninit_var_5.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/itc/457")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{!"clang version 3.9.0 (tags/RELEASE_390/final)"}
!6 = distinct !DISubprogram(name: "uninit_var_006_bad", scope: !7, file: !7, line: 7, type: !8, isLocal: false, isDefinition: true, scopeLine: 7, isOptimized: false, unit: !0, variables: !2)
!7 = !DIFile(filename: "./457_uninit_var_5.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/itc/457")
!8 = !DISubroutineType(types: !9)
!9 = !{null}
!10 = !DILocalVariable(name: "a", scope: !6, file: !7, line: 8, type: !11)
!11 = !DIBasicType(name: "long int", size: 64, align: 64, encoding: DW_ATE_signed)
!12 = !DIExpression()
!13 = !DILocation(line: 8, column: 10, scope: !6)
!14 = !DILocalVariable(name: "flag", scope: !6, file: !7, line: 9, type: !15)
!15 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!16 = !DILocation(line: 9, column: 9, scope: !6)
!17 = !DILocation(line: 10, column: 6, scope: !6)
!18 = !DILocation(line: 10, column: 10, scope: !6)
!19 = !DILocation(line: 10, column: 5, scope: !6)
!20 = !DILocation(line: 10, column: 20, scope: !21)
!21 = !DILexicalBlockFile(scope: !6, file: !7, discriminator: 1)
!22 = !DILocation(line: 10, column: 5, scope: !21)
!23 = !DILocation(line: 10, column: 32, scope: !24)
!24 = !DILexicalBlockFile(scope: !6, file: !7, discriminator: 2)
!25 = !DILocation(line: 10, column: 31, scope: !24)
!26 = !DILocation(line: 10, column: 25, scope: !24)
!27 = !DILocation(line: 10, column: 5, scope: !24)
!28 = !DILocation(line: 10, column: 5, scope: !29)
!29 = !DILexicalBlockFile(scope: !6, file: !7, discriminator: 3)
!30 = !DILocation(line: 11, column: 1, scope: !6)
!31 = distinct !DISubprogram(name: "uninit_var_006_good", scope: !7, file: !7, line: 17, type: !8, isLocal: false, isDefinition: true, scopeLine: 18, isOptimized: false, unit: !0, variables: !2)
!32 = !DILocalVariable(name: "a", scope: !31, file: !7, line: 19, type: !11)
!33 = !DILocation(line: 19, column: 10, scope: !31)
!34 = !DILocalVariable(name: "flag", scope: !31, file: !7, line: 20, type: !15)
!35 = !DILocation(line: 20, column: 9, scope: !31)
!36 = !DILocation(line: 21, column: 6, scope: !31)
!37 = !DILocation(line: 21, column: 10, scope: !31)
!38 = !DILocation(line: 21, column: 5, scope: !31)
!39 = !DILocation(line: 21, column: 20, scope: !40)
!40 = !DILexicalBlockFile(scope: !31, file: !7, discriminator: 1)
!41 = !DILocation(line: 21, column: 5, scope: !40)
!42 = !DILocation(line: 21, column: 28, scope: !43)
!43 = !DILexicalBlockFile(scope: !31, file: !7, discriminator: 2)
!44 = !DILocation(line: 21, column: 5, scope: !43)
!45 = !DILocation(line: 21, column: 5, scope: !46)
!46 = !DILexicalBlockFile(scope: !31, file: !7, discriminator: 3)
!47 = !DILocation(line: 22, column: 1, scope: !31)
!48 = distinct !DISubprogram(name: "main", scope: !7, file: !7, line: 24, type: !49, isLocal: false, isDefinition: true, scopeLine: 24, isOptimized: false, unit: !0, variables: !2)
!49 = !DISubroutineType(types: !50)
!50 = !{!15}
!51 = !DILocation(line: 25, column: 2, scope: !48)
!52 = !DILocation(line: 26, column: 3, scope: !48)
!53 = !DILocation(line: 27, column: 2, scope: !48)
