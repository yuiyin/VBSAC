; ModuleID = './415_double_free_10.c'
source_filename = "./415_double_free_10.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: nounwind uwtable
define void @double_free_010_bad() #0 !dbg !10 {
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
  store i32 1, i32* %flag, align 4, !dbg !26
  br label %while.cond, !dbg !27

while.cond:                                       ; preds = %while.body, %if.end
  %1 = load i32, i32* %flag, align 4, !dbg !28
  %tobool = icmp ne i32 %1, 0, !dbg !30
  br i1 %tobool, label %while.body, label %while.end, !dbg !30

while.body:                                       ; preds = %while.cond
  %2 = load i8*, i8** %ptr, align 8, !dbg !31
  call void @free(i8* %2) #3, !dbg !33
  %3 = load i32, i32* %flag, align 4, !dbg !34
  %dec = add nsw i32 %3, -1, !dbg !34
  store i32 %dec, i32* %flag, align 4, !dbg !34
  br label %while.cond, !dbg !35, !llvm.loop !37

while.end:                                        ; preds = %while.cond
  %4 = load i8*, i8** %ptr, align 8, !dbg !38
  call void @free(i8* %4) #3, !dbg !39
  br label %return, !dbg !40

return:                                           ; preds = %while.end, %if.then
  ret void, !dbg !41
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #2

; Function Attrs: nounwind
declare void @free(i8*) #2

; Function Attrs: nounwind uwtable
define void @double_free_010_good() #0 !dbg !42 {
entry:
  %ptr = alloca i8*, align 8
  %flag = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i8** %ptr, metadata !43, metadata !15), !dbg !44
  %call = call noalias i8* @malloc(i64 1) #3, !dbg !45
  store i8* %call, i8** %ptr, align 8, !dbg !44
  %0 = load i8*, i8** %ptr, align 8, !dbg !46
  %cmp = icmp eq i8* %0, null, !dbg !48
  br i1 %cmp, label %if.then, label %if.end, !dbg !49

if.then:                                          ; preds = %entry
  br label %while.end, !dbg !50

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %flag, metadata !52, metadata !15), !dbg !53
  store i32 1, i32* %flag, align 4, !dbg !53
  br label %while.cond, !dbg !54

while.cond:                                       ; preds = %while.body, %if.end
  %1 = load i32, i32* %flag, align 4, !dbg !55
  %tobool = icmp ne i32 %1, 0, !dbg !57
  br i1 %tobool, label %while.body, label %while.end, !dbg !57

while.body:                                       ; preds = %while.cond
  %2 = load i8*, i8** %ptr, align 8, !dbg !58
  call void @free(i8* %2) #3, !dbg !60
  %3 = load i32, i32* %flag, align 4, !dbg !61
  %dec = add nsw i32 %3, -1, !dbg !61
  store i32 %dec, i32* %flag, align 4, !dbg !61
  br label %while.cond, !dbg !62, !llvm.loop !64

while.end:                                        ; preds = %if.then, %while.cond
  ret void, !dbg !65
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !66 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @double_free_010_good(), !dbg !69
  call void @double_free_010_bad(), !dbg !70
  ret i32 0, !dbg !71
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8}
!llvm.ident = !{!9}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (tags/RELEASE_390/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3)
!1 = !DIFile(filename: "415_double_free_10.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/itc/415")
!2 = !{}
!3 = !{!4, !6}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64, align: 64)
!5 = !DIBasicType(name: "char", size: 8, align: 8, encoding: DW_ATE_signed_char)
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64, align: 64)
!7 = !{i32 2, !"Dwarf Version", i32 4}
!8 = !{i32 2, !"Debug Info Version", i32 3}
!9 = !{!"clang version 3.9.0 (tags/RELEASE_390/final)"}
!10 = distinct !DISubprogram(name: "double_free_010_bad", scope: !11, file: !11, line: 18, type: !12, isLocal: false, isDefinition: true, scopeLine: 19, isOptimized: false, unit: !0, variables: !2)
!11 = !DIFile(filename: "./415_double_free_10.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/itc/415")
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
!27 = !DILocation(line: 24, column: 2, scope: !10)
!28 = !DILocation(line: 24, column: 8, scope: !29)
!29 = !DILexicalBlockFile(scope: !10, file: !11, discriminator: 1)
!30 = !DILocation(line: 24, column: 2, scope: !29)
!31 = !DILocation(line: 26, column: 8, scope: !32)
!32 = distinct !DILexicalBlock(scope: !10, file: !11, line: 25, column: 2)
!33 = !DILocation(line: 26, column: 3, scope: !32)
!34 = !DILocation(line: 27, column: 7, scope: !32)
!35 = !DILocation(line: 24, column: 2, scope: !36)
!36 = !DILexicalBlockFile(scope: !10, file: !11, discriminator: 2)
!37 = distinct !{!37, !27}
!38 = !DILocation(line: 29, column: 7, scope: !10)
!39 = !DILocation(line: 29, column: 2, scope: !10)
!40 = !DILocation(line: 30, column: 1, scope: !10)
!41 = !DILocation(line: 30, column: 1, scope: !29)
!42 = distinct !DISubprogram(name: "double_free_010_good", scope: !11, file: !11, line: 37, type: !12, isLocal: false, isDefinition: true, scopeLine: 38, isOptimized: false, unit: !0, variables: !2)
!43 = !DILocalVariable(name: "ptr", scope: !42, file: !11, line: 39, type: !4)
!44 = !DILocation(line: 39, column: 8, scope: !42)
!45 = !DILocation(line: 39, column: 21, scope: !42)
!46 = !DILocation(line: 40, column: 6, scope: !47)
!47 = distinct !DILexicalBlock(scope: !42, file: !11, line: 40, column: 6)
!48 = !DILocation(line: 40, column: 10, scope: !47)
!49 = !DILocation(line: 40, column: 6, scope: !42)
!50 = !DILocation(line: 40, column: 19, scope: !51)
!51 = !DILexicalBlockFile(scope: !47, file: !11, discriminator: 1)
!52 = !DILocalVariable(name: "flag", scope: !42, file: !11, line: 41, type: !25)
!53 = !DILocation(line: 41, column: 6, scope: !42)
!54 = !DILocation(line: 43, column: 2, scope: !42)
!55 = !DILocation(line: 43, column: 8, scope: !56)
!56 = !DILexicalBlockFile(scope: !42, file: !11, discriminator: 1)
!57 = !DILocation(line: 43, column: 2, scope: !56)
!58 = !DILocation(line: 45, column: 8, scope: !59)
!59 = distinct !DILexicalBlock(scope: !42, file: !11, line: 44, column: 2)
!60 = !DILocation(line: 45, column: 3, scope: !59)
!61 = !DILocation(line: 46, column: 7, scope: !59)
!62 = !DILocation(line: 43, column: 2, scope: !63)
!63 = !DILexicalBlockFile(scope: !42, file: !11, discriminator: 2)
!64 = distinct !{!64, !54}
!65 = !DILocation(line: 48, column: 1, scope: !42)
!66 = distinct !DISubprogram(name: "main", scope: !11, file: !11, line: 50, type: !67, isLocal: false, isDefinition: true, scopeLine: 51, isOptimized: false, unit: !0, variables: !2)
!67 = !DISubroutineType(types: !68)
!68 = !{!25}
!69 = !DILocation(line: 52, column: 2, scope: !66)
!70 = !DILocation(line: 53, column: 2, scope: !66)
!71 = !DILocation(line: 54, column: 2, scope: !66)
