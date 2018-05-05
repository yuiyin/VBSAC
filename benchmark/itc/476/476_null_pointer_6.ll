; ModuleID = './476_null_pointer_6.c'
source_filename = "./476_null_pointer_6.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: nounwind uwtable
define void @null_pointer_006_bad() #0 !dbg !12 {
entry:
  %p = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %p, metadata !16, metadata !17), !dbg !18
  %call = call i32 @rand(), !dbg !19
  %conv = sext i32 %call to i64, !dbg !20
  %0 = inttoptr i64 %conv to i32*, !dbg !21
  store i32* %0, i32** %p, align 8, !dbg !22
  %1 = load i32*, i32** %p, align 8, !dbg !23
  store i32 1, i32* %1, align 4, !dbg !24
  ret void, !dbg !25
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @rand() #2

; Function Attrs: nounwind uwtable
define void @null_pointer_006_good() #0 !dbg !26 {
entry:
  %a = alloca i32, align 4
  %p = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %a, metadata !27, metadata !17), !dbg !28
  store i32 20, i32* %a, align 4, !dbg !28
  call void @llvm.dbg.declare(metadata i32** %p, metadata !29, metadata !17), !dbg !30
  store i32* %a, i32** %p, align 8, !dbg !31
  %0 = load i32*, i32** %p, align 8, !dbg !32
  store i32 1, i32* %0, align 4, !dbg !33
  ret void, !dbg !34
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !35 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @null_pointer_006_good(), !dbg !38
  call void @null_pointer_006_bad(), !dbg !39
  ret i32 0, !dbg !40
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!9, !10}
!llvm.ident = !{!11}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (tags/RELEASE_390/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3)
!1 = !DIFile(filename: "476_null_pointer_6.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/itc/476")
!2 = !{}
!3 = !{!4, !6}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64, align: 64)
!5 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!6 = !DIDerivedType(tag: DW_TAG_typedef, name: "intptr_t", file: !7, line: 119, baseType: !8)
!7 = !DIFile(filename: "/usr/include/stdint.h", directory: "/home/guzuxing/Documents/VBSAC/benchmark/itc/476")
!8 = !DIBasicType(name: "long int", size: 64, align: 64, encoding: DW_ATE_signed)
!9 = !{i32 2, !"Dwarf Version", i32 4}
!10 = !{i32 2, !"Debug Info Version", i32 3}
!11 = !{!"clang version 3.9.0 (tags/RELEASE_390/final)"}
!12 = distinct !DISubprogram(name: "null_pointer_006_bad", scope: !13, file: !13, line: 19, type: !14, isLocal: false, isDefinition: true, scopeLine: 20, isOptimized: false, unit: !0, variables: !2)
!13 = !DIFile(filename: "./476_null_pointer_6.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/itc/476")
!14 = !DISubroutineType(types: !15)
!15 = !{null}
!16 = !DILocalVariable(name: "p", scope: !12, file: !13, line: 21, type: !4)
!17 = !DIExpression()
!18 = !DILocation(line: 21, column: 7, scope: !12)
!19 = !DILocation(line: 22, column: 23, scope: !12)
!20 = !DILocation(line: 22, column: 13, scope: !12)
!21 = !DILocation(line: 22, column: 6, scope: !12)
!22 = !DILocation(line: 22, column: 4, scope: !12)
!23 = !DILocation(line: 23, column: 3, scope: !12)
!24 = !DILocation(line: 23, column: 5, scope: !12)
!25 = !DILocation(line: 24, column: 1, scope: !12)
!26 = distinct !DISubprogram(name: "null_pointer_006_good", scope: !13, file: !13, line: 30, type: !14, isLocal: false, isDefinition: true, scopeLine: 31, isOptimized: false, unit: !0, variables: !2)
!27 = !DILocalVariable(name: "a", scope: !26, file: !13, line: 32, type: !5)
!28 = !DILocation(line: 32, column: 6, scope: !26)
!29 = !DILocalVariable(name: "p", scope: !26, file: !13, line: 33, type: !4)
!30 = !DILocation(line: 33, column: 7, scope: !26)
!31 = !DILocation(line: 34, column: 4, scope: !26)
!32 = !DILocation(line: 35, column: 3, scope: !26)
!33 = !DILocation(line: 35, column: 5, scope: !26)
!34 = !DILocation(line: 36, column: 1, scope: !26)
!35 = distinct !DISubprogram(name: "main", scope: !13, file: !13, line: 43, type: !36, isLocal: false, isDefinition: true, scopeLine: 44, isOptimized: false, unit: !0, variables: !2)
!36 = !DISubroutineType(types: !37)
!37 = !{!5}
!38 = !DILocation(line: 45, column: 2, scope: !35)
!39 = !DILocation(line: 46, column: 2, scope: !35)
!40 = !DILocation(line: 47, column: 2, scope: !35)
