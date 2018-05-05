; ModuleID = './476_null_pointer_13.c'
source_filename = "./476_null_pointer_13.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@buf_good = common global [5 x i32] zeroinitializer, align 16

; Function Attrs: nounwind uwtable
define i32* @null_pointer_013_func_001_bad() #0 !dbg !15 {
entry:
  ret i32* null, !dbg !19
}

; Function Attrs: nounwind uwtable
define void @null_pointer_013_bad() #0 !dbg !20 {
entry:
  %p = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %p, metadata !23, metadata !24), !dbg !25
  %call = call i32* @null_pointer_013_func_001_bad(), !dbg !26
  store i32* %call, i32** %p, align 8, !dbg !27
  %0 = load i32*, i32** %p, align 8, !dbg !28
  %cmp = icmp ne i32* %0, null, !dbg !30
  br i1 %cmp, label %if.then, label %if.end, !dbg !31

if.then:                                          ; preds = %entry
  %1 = load i32*, i32** %p, align 8, !dbg !32
  store i32 1, i32* %1, align 4, !dbg !34
  br label %if.end, !dbg !35

if.end:                                           ; preds = %if.then, %entry
  %2 = load i32*, i32** %p, align 8, !dbg !36
  store i32 2, i32* %2, align 4, !dbg !37
  ret void, !dbg !38
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind uwtable
define i32* @null_pointer_013_func_001_good() #0 !dbg !39 {
entry:
  ret i32* getelementptr inbounds ([5 x i32], [5 x i32]* @buf_good, i32 0, i32 0), !dbg !40
}

; Function Attrs: nounwind uwtable
define void @null_pointer_013_good() #0 !dbg !41 {
entry:
  %p = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %p, metadata !42, metadata !24), !dbg !43
  %call = call i32* @null_pointer_013_func_001_good(), !dbg !44
  store i32* %call, i32** %p, align 8, !dbg !45
  %0 = load i32*, i32** %p, align 8, !dbg !46
  %cmp = icmp ne i32* %0, null, !dbg !48
  br i1 %cmp, label %if.then, label %if.end, !dbg !49

if.then:                                          ; preds = %entry
  %1 = load i32*, i32** %p, align 8, !dbg !50
  store i32 1, i32* %1, align 4, !dbg !52
  br label %if.end, !dbg !53

if.end:                                           ; preds = %if.then, %entry
  ret void, !dbg !54
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !55 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @null_pointer_013_good(), !dbg !58
  call void @null_pointer_013_bad(), !dbg !59
  ret i32 0, !dbg !60
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!12, !13}
!llvm.ident = !{!14}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (tags/RELEASE_390/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, globals: !5)
!1 = !DIFile(filename: "476_null_pointer_13.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/itc/476")
!2 = !{}
!3 = !{!4}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64, align: 64)
!5 = !{!6}
!6 = distinct !DIGlobalVariable(name: "buf_good", scope: !0, file: !7, line: 37, type: !8, isLocal: false, isDefinition: true, variable: [5 x i32]* @buf_good)
!7 = !DIFile(filename: "./476_null_pointer_13.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/itc/476")
!8 = !DICompositeType(tag: DW_TAG_array_type, baseType: !9, size: 160, align: 32, elements: !10)
!9 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!10 = !{!11}
!11 = !DISubrange(count: 5)
!12 = !{i32 2, !"Dwarf Version", i32 4}
!13 = !{i32 2, !"Debug Info Version", i32 3}
!14 = !{!"clang version 3.9.0 (tags/RELEASE_390/final)"}
!15 = distinct !DISubprogram(name: "null_pointer_013_func_001_bad", scope: !7, file: !7, line: 17, type: !16, isLocal: false, isDefinition: true, scopeLine: 18, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!16 = !DISubroutineType(types: !17)
!17 = !{!18}
!18 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !9, size: 64, align: 64)
!19 = !DILocation(line: 19, column: 2, scope: !15)
!20 = distinct !DISubprogram(name: "null_pointer_013_bad", scope: !7, file: !7, line: 22, type: !21, isLocal: false, isDefinition: true, scopeLine: 23, isOptimized: false, unit: !0, variables: !2)
!21 = !DISubroutineType(types: !22)
!22 = !{null}
!23 = !DILocalVariable(name: "p", scope: !20, file: !7, line: 24, type: !18)
!24 = !DIExpression()
!25 = !DILocation(line: 24, column: 7, scope: !20)
!26 = !DILocation(line: 25, column: 6, scope: !20)
!27 = !DILocation(line: 25, column: 4, scope: !20)
!28 = !DILocation(line: 26, column: 6, scope: !29)
!29 = distinct !DILexicalBlock(scope: !20, file: !7, line: 26, column: 6)
!30 = !DILocation(line: 26, column: 8, scope: !29)
!31 = !DILocation(line: 26, column: 6, scope: !20)
!32 = !DILocation(line: 28, column: 4, scope: !33)
!33 = distinct !DILexicalBlock(scope: !29, file: !7, line: 27, column: 2)
!34 = !DILocation(line: 28, column: 6, scope: !33)
!35 = !DILocation(line: 29, column: 2, scope: !33)
!36 = !DILocation(line: 30, column: 3, scope: !20)
!37 = !DILocation(line: 30, column: 5, scope: !20)
!38 = !DILocation(line: 31, column: 1, scope: !20)
!39 = distinct !DISubprogram(name: "null_pointer_013_func_001_good", scope: !7, file: !7, line: 38, type: !16, isLocal: false, isDefinition: true, scopeLine: 39, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!40 = !DILocation(line: 40, column: 2, scope: !39)
!41 = distinct !DISubprogram(name: "null_pointer_013_good", scope: !7, file: !7, line: 43, type: !21, isLocal: false, isDefinition: true, scopeLine: 44, isOptimized: false, unit: !0, variables: !2)
!42 = !DILocalVariable(name: "p", scope: !41, file: !7, line: 45, type: !18)
!43 = !DILocation(line: 45, column: 7, scope: !41)
!44 = !DILocation(line: 46, column: 6, scope: !41)
!45 = !DILocation(line: 46, column: 4, scope: !41)
!46 = !DILocation(line: 47, column: 6, scope: !47)
!47 = distinct !DILexicalBlock(scope: !41, file: !7, line: 47, column: 6)
!48 = !DILocation(line: 47, column: 8, scope: !47)
!49 = !DILocation(line: 47, column: 6, scope: !41)
!50 = !DILocation(line: 49, column: 4, scope: !51)
!51 = distinct !DILexicalBlock(scope: !47, file: !7, line: 48, column: 2)
!52 = !DILocation(line: 49, column: 6, scope: !51)
!53 = !DILocation(line: 50, column: 2, scope: !51)
!54 = !DILocation(line: 51, column: 1, scope: !41)
!55 = distinct !DISubprogram(name: "main", scope: !7, file: !7, line: 58, type: !56, isLocal: false, isDefinition: true, scopeLine: 59, isOptimized: false, unit: !0, variables: !2)
!56 = !DISubroutineType(types: !57)
!57 = !{!9}
!58 = !DILocation(line: 60, column: 2, scope: !55)
!59 = !DILocation(line: 61, column: 2, scope: !55)
!60 = !DILocation(line: 62, column: 2, scope: !55)
