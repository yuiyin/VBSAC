; ModuleID = './457_uninit_memory_access_2.c'
source_filename = "./457_uninit_memory_access_2.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [15 x i8] c"THIS IS STRING\00", align 1

; Function Attrs: nounwind uwtable
define void @uninit_memory_access_003_bad() #0 !dbg !10 {
entry:
  %str1 = alloca i8*, align 8
  %str2 = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %str1, metadata !14, metadata !15), !dbg !16
  %call = call noalias i8* @calloc(i64 25, i64 1) #3, !dbg !17
  store i8* %call, i8** %str1, align 8, !dbg !16
  call void @llvm.dbg.declare(metadata i8** %str2, metadata !18, metadata !15), !dbg !19
  %0 = load i8*, i8** %str1, align 8, !dbg !20
  %cmp = icmp ne i8* %0, null, !dbg !22
  br i1 %cmp, label %if.then, label %if.end, !dbg !23

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** %str1, align 8, !dbg !24
  %2 = load i8*, i8** %str2, align 8, !dbg !26
  %call1 = call i8* @strcpy(i8* %1, i8* %2) #3, !dbg !27
  %3 = load i8*, i8** %str1, align 8, !dbg !28
  call void @free(i8* %3) #3, !dbg !29
  br label %if.end, !dbg !30

if.end:                                           ; preds = %if.then, %entry
  ret void, !dbg !31
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare noalias i8* @calloc(i64, i64) #2

; Function Attrs: nounwind
declare i8* @strcpy(i8*, i8*) #2

; Function Attrs: nounwind
declare void @free(i8*) #2

; Function Attrs: nounwind uwtable
define void @uninit_memory_access_003_good() #0 !dbg !32 {
entry:
  %str1 = alloca i8*, align 8
  %str2 = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %str1, metadata !33, metadata !15), !dbg !34
  %call = call noalias i8* @calloc(i64 25, i64 1) #3, !dbg !35
  store i8* %call, i8** %str1, align 8, !dbg !34
  call void @llvm.dbg.declare(metadata i8** %str2, metadata !36, metadata !15), !dbg !37
  store i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str, i32 0, i32 0), i8** %str2, align 8, !dbg !37
  %0 = load i8*, i8** %str1, align 8, !dbg !38
  %cmp = icmp ne i8* %0, null, !dbg !40
  br i1 %cmp, label %if.then, label %if.end, !dbg !41

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** %str1, align 8, !dbg !42
  %2 = load i8*, i8** %str2, align 8, !dbg !44
  %call1 = call i8* @strcpy(i8* %1, i8* %2) #3, !dbg !45
  %3 = load i8*, i8** %str1, align 8, !dbg !46
  call void @free(i8* %3) #3, !dbg !47
  br label %if.end, !dbg !48

if.end:                                           ; preds = %if.then, %entry
  ret void, !dbg !49
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !50 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @uninit_memory_access_003_good(), !dbg !54
  call void @uninit_memory_access_003_bad(), !dbg !55
  ret i32 0, !dbg !56
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8}
!llvm.ident = !{!9}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (tags/RELEASE_390/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3)
!1 = !DIFile(filename: "457_uninit_memory_access_2.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/itc/457")
!2 = !{}
!3 = !{!4, !6}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64, align: 64)
!5 = !DIBasicType(name: "char", size: 8, align: 8, encoding: DW_ATE_signed_char)
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64, align: 64)
!7 = !{i32 2, !"Dwarf Version", i32 4}
!8 = !{i32 2, !"Debug Info Version", i32 3}
!9 = !{!"clang version 3.9.0 (tags/RELEASE_390/final)"}
!10 = distinct !DISubprogram(name: "uninit_memory_access_003_bad", scope: !11, file: !11, line: 10, type: !12, isLocal: false, isDefinition: true, scopeLine: 11, isOptimized: false, unit: !0, variables: !2)
!11 = !DIFile(filename: "./457_uninit_memory_access_2.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/itc/457")
!12 = !DISubroutineType(types: !13)
!13 = !{null}
!14 = !DILocalVariable(name: "str1", scope: !10, file: !11, line: 12, type: !4)
!15 = !DIExpression()
!16 = !DILocation(line: 12, column: 8, scope: !10)
!17 = !DILocation(line: 12, column: 24, scope: !10)
!18 = !DILocalVariable(name: "str2", scope: !10, file: !11, line: 13, type: !4)
!19 = !DILocation(line: 13, column: 8, scope: !10)
!20 = !DILocation(line: 14, column: 6, scope: !21)
!21 = distinct !DILexicalBlock(scope: !10, file: !11, line: 14, column: 6)
!22 = !DILocation(line: 14, column: 10, scope: !21)
!23 = !DILocation(line: 14, column: 6, scope: !10)
!24 = !DILocation(line: 16, column: 10, scope: !25)
!25 = distinct !DILexicalBlock(scope: !21, file: !11, line: 15, column: 2)
!26 = !DILocation(line: 16, column: 16, scope: !25)
!27 = !DILocation(line: 16, column: 3, scope: !25)
!28 = !DILocation(line: 17, column: 14, scope: !25)
!29 = !DILocation(line: 17, column: 9, scope: !25)
!30 = !DILocation(line: 18, column: 2, scope: !25)
!31 = !DILocation(line: 19, column: 1, scope: !10)
!32 = distinct !DISubprogram(name: "uninit_memory_access_003_good", scope: !11, file: !11, line: 25, type: !12, isLocal: false, isDefinition: true, scopeLine: 26, isOptimized: false, unit: !0, variables: !2)
!33 = !DILocalVariable(name: "str1", scope: !32, file: !11, line: 27, type: !4)
!34 = !DILocation(line: 27, column: 8, scope: !32)
!35 = !DILocation(line: 27, column: 24, scope: !32)
!36 = !DILocalVariable(name: "str2", scope: !32, file: !11, line: 28, type: !4)
!37 = !DILocation(line: 28, column: 8, scope: !32)
!38 = !DILocation(line: 29, column: 6, scope: !39)
!39 = distinct !DILexicalBlock(scope: !32, file: !11, line: 29, column: 6)
!40 = !DILocation(line: 29, column: 10, scope: !39)
!41 = !DILocation(line: 29, column: 6, scope: !32)
!42 = !DILocation(line: 31, column: 10, scope: !43)
!43 = distinct !DILexicalBlock(scope: !39, file: !11, line: 30, column: 2)
!44 = !DILocation(line: 31, column: 16, scope: !43)
!45 = !DILocation(line: 31, column: 3, scope: !43)
!46 = !DILocation(line: 32, column: 14, scope: !43)
!47 = !DILocation(line: 32, column: 9, scope: !43)
!48 = !DILocation(line: 33, column: 2, scope: !43)
!49 = !DILocation(line: 34, column: 1, scope: !32)
!50 = distinct !DISubprogram(name: "main", scope: !11, file: !11, line: 36, type: !51, isLocal: false, isDefinition: true, scopeLine: 36, isOptimized: false, unit: !0, variables: !2)
!51 = !DISubroutineType(types: !52)
!52 = !{!53}
!53 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!54 = !DILocation(line: 37, column: 2, scope: !50)
!55 = !DILocation(line: 38, column: 2, scope: !50)
!56 = !DILocation(line: 39, column: 2, scope: !50)
