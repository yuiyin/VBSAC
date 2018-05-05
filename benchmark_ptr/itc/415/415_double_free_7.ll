; ModuleID = './415_double_free_7.c'
source_filename = "./415_double_free_7.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: nounwind uwtable
define void @double_free_007_bad() #0 !dbg !10 {
entry:
  %ptr = alloca i8*, align 8
  %flag = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i8** %ptr, metadata !14, metadata !15), !dbg !16
  %call = call noalias i8* @malloc(i64 1) #3, !dbg !17
  store i8* %call, i8** %ptr, align 8, !dbg !16
  %0 = load i8*, i8** %ptr, align 8, !dbg !18
  %cmp = icmp eq i8* %0, null, !dbg !20
  br i1 %cmp, label %if.then, label %if.end, !dbg !21

if.then:                                          ; preds = %entry
  br label %return, !dbg !22

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %flag, metadata !24, metadata !15), !dbg !26
  store i32 0, i32* %flag, align 4, !dbg !26
  %1 = load i32, i32* %flag, align 4, !dbg !27
  %cmp1 = icmp sge i32 %1, 0, !dbg !29
  br i1 %cmp1, label %if.then2, label %if.end3, !dbg !30

if.then2:                                         ; preds = %if.end
  %2 = load i8*, i8** %ptr, align 8, !dbg !31
  call void @free(i8* %2) #3, !dbg !32
  br label %if.end3, !dbg !32

if.end3:                                          ; preds = %if.then2, %if.end
  %3 = load i8*, i8** %ptr, align 8, !dbg !33
  call void @free(i8* %3) #3, !dbg !34
  br label %return, !dbg !35

return:                                           ; preds = %if.end3, %if.then
  ret void, !dbg !36
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #2

; Function Attrs: nounwind
declare void @free(i8*) #2

; Function Attrs: nounwind uwtable
define void @double_free_007_good() #0 !dbg !38 {
entry:
  %ptr = alloca i8*, align 8
  %flag = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i8** %ptr, metadata !39, metadata !15), !dbg !40
  %call = call noalias i8* @malloc(i64 1) #3, !dbg !41
  store i8* %call, i8** %ptr, align 8, !dbg !40
  %0 = load i8*, i8** %ptr, align 8, !dbg !42
  %cmp = icmp eq i8* %0, null, !dbg !44
  br i1 %cmp, label %if.then, label %if.end, !dbg !45

if.then:                                          ; preds = %entry
  br label %return, !dbg !46

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %flag, metadata !48, metadata !15), !dbg !49
  store i32 0, i32* %flag, align 4, !dbg !49
  %1 = load i32, i32* %flag, align 4, !dbg !50
  %cmp1 = icmp slt i32 %1, 0, !dbg !52
  br i1 %cmp1, label %if.then2, label %if.end3, !dbg !53

if.then2:                                         ; preds = %if.end
  %2 = load i8*, i8** %ptr, align 8, !dbg !54
  call void @free(i8* %2) #3, !dbg !55
  br label %if.end3, !dbg !55

if.end3:                                          ; preds = %if.then2, %if.end
  %3 = load i8*, i8** %ptr, align 8, !dbg !56
  call void @free(i8* %3) #3, !dbg !57
  br label %return, !dbg !58

return:                                           ; preds = %if.end3, %if.then
  ret void, !dbg !59
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !61 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @double_free_007_good(), !dbg !64
  call void @double_free_007_bad(), !dbg !65
  ret i32 0, !dbg !66
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8}
!llvm.ident = !{!9}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (tags/RELEASE_390/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3)
!1 = !DIFile(filename: "415_double_free_7.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/itc/415")
!2 = !{}
!3 = !{!4, !6}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64, align: 64)
!5 = !DIBasicType(name: "char", size: 8, align: 8, encoding: DW_ATE_signed_char)
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64, align: 64)
!7 = !{i32 2, !"Dwarf Version", i32 4}
!8 = !{i32 2, !"Debug Info Version", i32 3}
!9 = !{!"clang version 3.9.0 (tags/RELEASE_390/final)"}
!10 = distinct !DISubprogram(name: "double_free_007_bad", scope: !11, file: !11, line: 18, type: !12, isLocal: false, isDefinition: true, scopeLine: 19, isOptimized: false, unit: !0, variables: !2)
!11 = !DIFile(filename: "./415_double_free_7.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/itc/415")
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
!27 = !DILocation(line: 24, column: 5, scope: !28)
!28 = distinct !DILexicalBlock(scope: !10, file: !11, line: 24, column: 5)
!29 = !DILocation(line: 24, column: 9, scope: !28)
!30 = !DILocation(line: 24, column: 5, scope: !10)
!31 = !DILocation(line: 25, column: 7, scope: !28)
!32 = !DILocation(line: 25, column: 2, scope: !28)
!33 = !DILocation(line: 27, column: 7, scope: !10)
!34 = !DILocation(line: 27, column: 2, scope: !10)
!35 = !DILocation(line: 28, column: 1, scope: !10)
!36 = !DILocation(line: 28, column: 1, scope: !37)
!37 = !DILexicalBlockFile(scope: !10, file: !11, discriminator: 1)
!38 = distinct !DISubprogram(name: "double_free_007_good", scope: !11, file: !11, line: 35, type: !12, isLocal: false, isDefinition: true, scopeLine: 36, isOptimized: false, unit: !0, variables: !2)
!39 = !DILocalVariable(name: "ptr", scope: !38, file: !11, line: 37, type: !4)
!40 = !DILocation(line: 37, column: 8, scope: !38)
!41 = !DILocation(line: 37, column: 21, scope: !38)
!42 = !DILocation(line: 38, column: 6, scope: !43)
!43 = distinct !DILexicalBlock(scope: !38, file: !11, line: 38, column: 6)
!44 = !DILocation(line: 38, column: 10, scope: !43)
!45 = !DILocation(line: 38, column: 6, scope: !38)
!46 = !DILocation(line: 38, column: 19, scope: !47)
!47 = !DILexicalBlockFile(scope: !43, file: !11, discriminator: 1)
!48 = !DILocalVariable(name: "flag", scope: !38, file: !11, line: 39, type: !25)
!49 = !DILocation(line: 39, column: 6, scope: !38)
!50 = !DILocation(line: 41, column: 5, scope: !51)
!51 = distinct !DILexicalBlock(scope: !38, file: !11, line: 41, column: 5)
!52 = !DILocation(line: 41, column: 9, scope: !51)
!53 = !DILocation(line: 41, column: 5, scope: !38)
!54 = !DILocation(line: 42, column: 7, scope: !51)
!55 = !DILocation(line: 42, column: 2, scope: !51)
!56 = !DILocation(line: 44, column: 7, scope: !38)
!57 = !DILocation(line: 44, column: 2, scope: !38)
!58 = !DILocation(line: 45, column: 1, scope: !38)
!59 = !DILocation(line: 45, column: 1, scope: !60)
!60 = !DILexicalBlockFile(scope: !38, file: !11, discriminator: 1)
!61 = distinct !DISubprogram(name: "main", scope: !11, file: !11, line: 52, type: !62, isLocal: false, isDefinition: true, scopeLine: 53, isOptimized: false, unit: !0, variables: !2)
!62 = !DISubroutineType(types: !63)
!63 = !{!25}
!64 = !DILocation(line: 54, column: 2, scope: !61)
!65 = !DILocation(line: 55, column: 2, scope: !61)
!66 = !DILocation(line: 56, column: 2, scope: !61)
