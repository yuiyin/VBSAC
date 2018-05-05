; ModuleID = './415_double_free_11.c'
source_filename = "./415_double_free_11.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: nounwind uwtable
define void @double_free_011_bad() #0 !dbg !10 {
entry:
  %ptr = alloca i8*, align 8
  %flag = alloca i32, align 4
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i8** %ptr, metadata !14, metadata !15), !dbg !16
  %call = call noalias i8* @malloc(i64 1) #3, !dbg !17
  store i8* %call, i8** %ptr, align 8, !dbg !16
  %0 = load i8*, i8** %ptr, align 8, !dbg !18
  %cmp = icmp eq i8* %0, null, !dbg !20
  br i1 %cmp, label %if.then, label %if.end, !dbg !21

if.then:                                          ; preds = %entry
  br label %while.end, !dbg !22

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %flag, metadata !24, metadata !15), !dbg !26
  store i32 1, i32* %flag, align 4, !dbg !26
  call void @llvm.dbg.declare(metadata i32* %a, metadata !27, metadata !15), !dbg !28
  store i32 0, i32* %a, align 4, !dbg !28
  call void @llvm.dbg.declare(metadata i32* %b, metadata !29, metadata !15), !dbg !30
  store i32 2, i32* %b, align 4, !dbg !30
  br label %while.cond, !dbg !31

while.cond:                                       ; preds = %if.end4, %if.end
  %1 = load i32, i32* %a, align 4, !dbg !32
  %2 = load i32, i32* %b, align 4, !dbg !34
  %cmp1 = icmp slt i32 %1, %2, !dbg !35
  br i1 %cmp1, label %while.body, label %while.end, !dbg !36

while.body:                                       ; preds = %while.cond
  %3 = load i32, i32* %flag, align 4, !dbg !37
  %cmp2 = icmp eq i32 %3, 1, !dbg !40
  br i1 %cmp2, label %if.then3, label %if.end4, !dbg !41

if.then3:                                         ; preds = %while.body
  %4 = load i8*, i8** %ptr, align 8, !dbg !42
  call void @free(i8* %4) #3, !dbg !43
  br label %if.end4, !dbg !43

if.end4:                                          ; preds = %if.then3, %while.body
  %5 = load i32, i32* %a, align 4, !dbg !44
  %inc = add nsw i32 %5, 1, !dbg !44
  store i32 %inc, i32* %a, align 4, !dbg !44
  br label %while.cond, !dbg !45, !llvm.loop !47

while.end:                                        ; preds = %if.then, %while.cond
  ret void, !dbg !48
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #2

; Function Attrs: nounwind
declare void @free(i8*) #2

; Function Attrs: nounwind uwtable
define void @double_free_011_good() #0 !dbg !49 {
entry:
  %ptr = alloca i8*, align 8
  %flag = alloca i32, align 4
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i8** %ptr, metadata !50, metadata !15), !dbg !51
  %call = call noalias i8* @malloc(i64 1) #3, !dbg !52
  store i8* %call, i8** %ptr, align 8, !dbg !51
  %0 = load i8*, i8** %ptr, align 8, !dbg !53
  %cmp = icmp eq i8* %0, null, !dbg !55
  br i1 %cmp, label %if.then, label %if.end, !dbg !56

if.then:                                          ; preds = %entry
  br label %while.end, !dbg !57

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %flag, metadata !59, metadata !15), !dbg !60
  store i32 1, i32* %flag, align 4, !dbg !60
  call void @llvm.dbg.declare(metadata i32* %a, metadata !61, metadata !15), !dbg !62
  store i32 0, i32* %a, align 4, !dbg !62
  call void @llvm.dbg.declare(metadata i32* %b, metadata !63, metadata !15), !dbg !64
  store i32 1, i32* %b, align 4, !dbg !64
  br label %while.cond, !dbg !65

while.cond:                                       ; preds = %if.end4, %if.end
  %1 = load i32, i32* %a, align 4, !dbg !66
  %2 = load i32, i32* %b, align 4, !dbg !68
  %cmp1 = icmp slt i32 %1, %2, !dbg !69
  br i1 %cmp1, label %while.body, label %while.end, !dbg !70

while.body:                                       ; preds = %while.cond
  %3 = load i32, i32* %flag, align 4, !dbg !71
  %cmp2 = icmp eq i32 %3, 1, !dbg !74
  br i1 %cmp2, label %if.then3, label %if.end4, !dbg !75

if.then3:                                         ; preds = %while.body
  %4 = load i8*, i8** %ptr, align 8, !dbg !76
  call void @free(i8* %4) #3, !dbg !77
  br label %if.end4, !dbg !77

if.end4:                                          ; preds = %if.then3, %while.body
  %5 = load i32, i32* %a, align 4, !dbg !78
  %inc = add nsw i32 %5, 1, !dbg !78
  store i32 %inc, i32* %a, align 4, !dbg !78
  br label %while.cond, !dbg !79, !llvm.loop !81

while.end:                                        ; preds = %if.then, %while.cond
  ret void, !dbg !82
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !83 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @double_free_011_good(), !dbg !86
  call void @double_free_011_bad(), !dbg !87
  ret i32 0, !dbg !88
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8}
!llvm.ident = !{!9}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (tags/RELEASE_390/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3)
!1 = !DIFile(filename: "415_double_free_11.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/itc/415")
!2 = !{}
!3 = !{!4, !6}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64, align: 64)
!5 = !DIBasicType(name: "char", size: 8, align: 8, encoding: DW_ATE_signed_char)
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64, align: 64)
!7 = !{i32 2, !"Dwarf Version", i32 4}
!8 = !{i32 2, !"Debug Info Version", i32 3}
!9 = !{!"clang version 3.9.0 (tags/RELEASE_390/final)"}
!10 = distinct !DISubprogram(name: "double_free_011_bad", scope: !11, file: !11, line: 18, type: !12, isLocal: false, isDefinition: true, scopeLine: 19, isOptimized: false, unit: !0, variables: !2)
!11 = !DIFile(filename: "./415_double_free_11.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/itc/415")
!12 = !DISubroutineType(types: !13)
!13 = !{null}
!14 = !DILocalVariable(name: "ptr", scope: !10, file: !11, line: 20, type: !4)
!15 = !DIExpression()
!16 = !DILocation(line: 20, column: 8, scope: !10)
!17 = !DILocation(line: 20, column: 21, scope: !10)
!18 = !DILocation(line: 21, column: 6, scope: !19)
!19 = distinct !DILexicalBlock(scope: !10, file: !11, line: 21, column: 6)
!20 = !DILocation(line: 21, column: 10, scope: !19)
!21 = !DILocation(line: 21, column: 6, scope: !10)
!22 = !DILocation(line: 21, column: 19, scope: !23)
!23 = !DILexicalBlockFile(scope: !19, file: !11, discriminator: 1)
!24 = !DILocalVariable(name: "flag", scope: !10, file: !11, line: 22, type: !25)
!25 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!26 = !DILocation(line: 22, column: 6, scope: !10)
!27 = !DILocalVariable(name: "a", scope: !10, file: !11, line: 22, type: !25)
!28 = !DILocation(line: 22, column: 13, scope: !10)
!29 = !DILocalVariable(name: "b", scope: !10, file: !11, line: 22, type: !25)
!30 = !DILocation(line: 22, column: 17, scope: !10)
!31 = !DILocation(line: 24, column: 2, scope: !10)
!32 = !DILocation(line: 24, column: 8, scope: !33)
!33 = !DILexicalBlockFile(scope: !10, file: !11, discriminator: 1)
!34 = !DILocation(line: 24, column: 10, scope: !33)
!35 = !DILocation(line: 24, column: 9, scope: !33)
!36 = !DILocation(line: 24, column: 2, scope: !33)
!37 = !DILocation(line: 26, column: 6, scope: !38)
!38 = distinct !DILexicalBlock(scope: !39, file: !11, line: 26, column: 6)
!39 = distinct !DILexicalBlock(scope: !10, file: !11, line: 25, column: 2)
!40 = !DILocation(line: 26, column: 11, scope: !38)
!41 = !DILocation(line: 26, column: 6, scope: !39)
!42 = !DILocation(line: 27, column: 8, scope: !38)
!43 = !DILocation(line: 27, column: 3, scope: !38)
!44 = !DILocation(line: 28, column: 4, scope: !39)
!45 = !DILocation(line: 24, column: 2, scope: !46)
!46 = !DILexicalBlockFile(scope: !10, file: !11, discriminator: 2)
!47 = distinct !{!47, !31}
!48 = !DILocation(line: 30, column: 1, scope: !10)
!49 = distinct !DISubprogram(name: "double_free_011_good", scope: !11, file: !11, line: 37, type: !12, isLocal: false, isDefinition: true, scopeLine: 38, isOptimized: false, unit: !0, variables: !2)
!50 = !DILocalVariable(name: "ptr", scope: !49, file: !11, line: 39, type: !4)
!51 = !DILocation(line: 39, column: 8, scope: !49)
!52 = !DILocation(line: 39, column: 21, scope: !49)
!53 = !DILocation(line: 40, column: 6, scope: !54)
!54 = distinct !DILexicalBlock(scope: !49, file: !11, line: 40, column: 6)
!55 = !DILocation(line: 40, column: 10, scope: !54)
!56 = !DILocation(line: 40, column: 6, scope: !49)
!57 = !DILocation(line: 40, column: 19, scope: !58)
!58 = !DILexicalBlockFile(scope: !54, file: !11, discriminator: 1)
!59 = !DILocalVariable(name: "flag", scope: !49, file: !11, line: 41, type: !25)
!60 = !DILocation(line: 41, column: 6, scope: !49)
!61 = !DILocalVariable(name: "a", scope: !49, file: !11, line: 41, type: !25)
!62 = !DILocation(line: 41, column: 13, scope: !49)
!63 = !DILocalVariable(name: "b", scope: !49, file: !11, line: 41, type: !25)
!64 = !DILocation(line: 41, column: 17, scope: !49)
!65 = !DILocation(line: 43, column: 2, scope: !49)
!66 = !DILocation(line: 43, column: 8, scope: !67)
!67 = !DILexicalBlockFile(scope: !49, file: !11, discriminator: 1)
!68 = !DILocation(line: 43, column: 10, scope: !67)
!69 = !DILocation(line: 43, column: 9, scope: !67)
!70 = !DILocation(line: 43, column: 2, scope: !67)
!71 = !DILocation(line: 45, column: 6, scope: !72)
!72 = distinct !DILexicalBlock(scope: !73, file: !11, line: 45, column: 6)
!73 = distinct !DILexicalBlock(scope: !49, file: !11, line: 44, column: 2)
!74 = !DILocation(line: 45, column: 11, scope: !72)
!75 = !DILocation(line: 45, column: 6, scope: !73)
!76 = !DILocation(line: 46, column: 8, scope: !72)
!77 = !DILocation(line: 46, column: 3, scope: !72)
!78 = !DILocation(line: 47, column: 4, scope: !73)
!79 = !DILocation(line: 43, column: 2, scope: !80)
!80 = !DILexicalBlockFile(scope: !49, file: !11, discriminator: 2)
!81 = distinct !{!81, !65}
!82 = !DILocation(line: 49, column: 1, scope: !49)
!83 = distinct !DISubprogram(name: "main", scope: !11, file: !11, line: 56, type: !84, isLocal: false, isDefinition: true, scopeLine: 57, isOptimized: false, unit: !0, variables: !2)
!84 = !DISubroutineType(types: !85)
!85 = !{!25}
!86 = !DILocation(line: 58, column: 2, scope: !83)
!87 = !DILocation(line: 59, column: 2, scope: !83)
!88 = !DILocation(line: 60, column: 2, scope: !83)
