; ModuleID = './401_memory_leak_15.c'
source_filename = "./401_memory_leak_15.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [17 x i8] c"This is a string\00", align 1

; Function Attrs: nounwind uwtable
define i8* @memory_leak_0015_func_001_bad(i32 %len) #0 !dbg !8 {
entry:
  %len.addr = alloca i32, align 4
  %stringPtr = alloca i8*, align 8
  store i32 %len, i32* %len.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %len.addr, metadata !15, metadata !16), !dbg !17
  call void @llvm.dbg.declare(metadata i8** %stringPtr, metadata !18, metadata !16), !dbg !19
  %0 = load i32, i32* %len.addr, align 4, !dbg !20
  %add = add nsw i32 %0, 1, !dbg !21
  %conv = sext i32 %add to i64, !dbg !22
  %mul = mul i64 1, %conv, !dbg !23
  %call = call noalias i8* @malloc(i64 %mul) #4, !dbg !24
  store i8* %call, i8** %stringPtr, align 8, !dbg !19
  %1 = load i8*, i8** %stringPtr, align 8, !dbg !25
  ret i8* %1, !dbg !26
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #2

; Function Attrs: nounwind uwtable
define void @memory_leak_0015_bad() #0 !dbg !27 {
entry:
  %str = alloca i8*, align 8
  %str1 = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %str, metadata !30, metadata !16), !dbg !31
  store i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str, i32 0, i32 0), i8** %str, align 8, !dbg !31
  call void @llvm.dbg.declare(metadata i8** %str1, metadata !32, metadata !16), !dbg !33
  %0 = load i8*, i8** %str, align 8, !dbg !34
  %call = call i64 @strlen(i8* %0) #5, !dbg !35
  %conv = trunc i64 %call to i32, !dbg !35
  %call1 = call i8* @memory_leak_0015_func_001_bad(i32 %conv), !dbg !36
  store i8* %call1, i8** %str1, align 8, !dbg !33
  %1 = load i8*, i8** %str1, align 8, !dbg !38
  %cmp = icmp ne i8* %1, null, !dbg !40
  br i1 %cmp, label %if.then, label %if.end, !dbg !41

if.then:                                          ; preds = %entry
  %2 = load i8*, i8** %str1, align 8, !dbg !42
  %3 = load i8*, i8** %str, align 8, !dbg !44
  %call3 = call i8* @strcpy(i8* %2, i8* %3) #4, !dbg !45
  br label %if.end, !dbg !46

if.end:                                           ; preds = %if.then, %entry
  ret void, !dbg !47
}

; Function Attrs: nounwind readonly
declare i64 @strlen(i8*) #3

; Function Attrs: nounwind
declare i8* @strcpy(i8*, i8*) #2

; Function Attrs: nounwind uwtable
define i8* @memory_leak_0015_func_001_good(i32 %len) #0 !dbg !48 {
entry:
  %len.addr = alloca i32, align 4
  %stringPtr = alloca i8*, align 8
  store i32 %len, i32* %len.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %len.addr, metadata !49, metadata !16), !dbg !50
  call void @llvm.dbg.declare(metadata i8** %stringPtr, metadata !51, metadata !16), !dbg !52
  %0 = load i32, i32* %len.addr, align 4, !dbg !53
  %add = add nsw i32 %0, 1, !dbg !54
  %conv = sext i32 %add to i64, !dbg !55
  %mul = mul i64 1, %conv, !dbg !56
  %call = call noalias i8* @malloc(i64 %mul) #4, !dbg !57
  store i8* %call, i8** %stringPtr, align 8, !dbg !52
  %1 = load i8*, i8** %stringPtr, align 8, !dbg !58
  ret i8* %1, !dbg !59
}

; Function Attrs: nounwind uwtable
define void @memory_leak_0015_good() #0 !dbg !60 {
entry:
  %str = alloca i8*, align 8
  %str1 = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %str, metadata !61, metadata !16), !dbg !62
  store i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str, i32 0, i32 0), i8** %str, align 8, !dbg !62
  call void @llvm.dbg.declare(metadata i8** %str1, metadata !63, metadata !16), !dbg !64
  %0 = load i8*, i8** %str, align 8, !dbg !65
  %call = call i64 @strlen(i8* %0) #5, !dbg !66
  %conv = trunc i64 %call to i32, !dbg !66
  %call1 = call i8* @memory_leak_0015_func_001_good(i32 %conv), !dbg !67
  store i8* %call1, i8** %str1, align 8, !dbg !64
  %1 = load i8*, i8** %str1, align 8, !dbg !69
  %cmp = icmp ne i8* %1, null, !dbg !71
  br i1 %cmp, label %if.then, label %if.end, !dbg !72

if.then:                                          ; preds = %entry
  %2 = load i8*, i8** %str1, align 8, !dbg !73
  %3 = load i8*, i8** %str, align 8, !dbg !75
  %call3 = call i8* @strcpy(i8* %2, i8* %3) #4, !dbg !76
  %4 = load i8*, i8** %str1, align 8, !dbg !77
  call void @free(i8* %4) #4, !dbg !78
  br label %if.end, !dbg !79

if.end:                                           ; preds = %if.then, %entry
  ret void, !dbg !80
}

; Function Attrs: nounwind
declare void @free(i8*) #2

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !81 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @memory_leak_0015_good(), !dbg !84
  call void @memory_leak_0015_bad(), !dbg !85
  ret i32 0, !dbg !86
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readonly "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { nounwind readonly }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6}
!llvm.ident = !{!7}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (tags/RELEASE_390/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3)
!1 = !DIFile(filename: "401_memory_leak_15.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/itc/401")
!2 = !{}
!3 = !{!4}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64, align: 64)
!5 = !{i32 2, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{!"clang version 3.9.0 (tags/RELEASE_390/final)"}
!8 = distinct !DISubprogram(name: "memory_leak_0015_func_001_bad", scope: !9, file: !9, line: 18, type: !10, isLocal: false, isDefinition: true, scopeLine: 19, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!9 = !DIFile(filename: "./401_memory_leak_15.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/itc/401")
!10 = !DISubroutineType(types: !11)
!11 = !{!12, !14}
!12 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !13, size: 64, align: 64)
!13 = !DIBasicType(name: "char", size: 8, align: 8, encoding: DW_ATE_signed_char)
!14 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!15 = !DILocalVariable(name: "len", arg: 1, scope: !8, file: !9, line: 18, type: !14)
!16 = !DIExpression()
!17 = !DILocation(line: 18, column: 42, scope: !8)
!18 = !DILocalVariable(name: "stringPtr", scope: !8, file: !9, line: 20, type: !12)
!19 = !DILocation(line: 20, column: 8, scope: !8)
!20 = !DILocation(line: 20, column: 43, scope: !8)
!21 = !DILocation(line: 20, column: 46, scope: !8)
!22 = !DILocation(line: 20, column: 42, scope: !8)
!23 = !DILocation(line: 20, column: 40, scope: !8)
!24 = !DILocation(line: 20, column: 20, scope: !8)
!25 = !DILocation(line: 21, column: 9, scope: !8)
!26 = !DILocation(line: 21, column: 2, scope: !8)
!27 = distinct !DISubprogram(name: "memory_leak_0015_bad", scope: !9, file: !9, line: 24, type: !28, isLocal: false, isDefinition: true, scopeLine: 25, isOptimized: false, unit: !0, variables: !2)
!28 = !DISubroutineType(types: !29)
!29 = !{null}
!30 = !DILocalVariable(name: "str", scope: !27, file: !9, line: 26, type: !12)
!31 = !DILocation(line: 26, column: 8, scope: !27)
!32 = !DILocalVariable(name: "str1", scope: !27, file: !9, line: 27, type: !12)
!33 = !DILocation(line: 27, column: 8, scope: !27)
!34 = !DILocation(line: 27, column: 52, scope: !27)
!35 = !DILocation(line: 27, column: 45, scope: !27)
!36 = !DILocation(line: 27, column: 15, scope: !37)
!37 = !DILexicalBlockFile(scope: !27, file: !9, discriminator: 1)
!38 = !DILocation(line: 28, column: 5, scope: !39)
!39 = distinct !DILexicalBlock(scope: !27, file: !9, line: 28, column: 5)
!40 = !DILocation(line: 28, column: 9, scope: !39)
!41 = !DILocation(line: 28, column: 5, scope: !27)
!42 = !DILocation(line: 30, column: 13, scope: !43)
!43 = distinct !DILexicalBlock(scope: !39, file: !9, line: 29, column: 2)
!44 = !DILocation(line: 30, column: 18, scope: !43)
!45 = !DILocation(line: 30, column: 6, scope: !43)
!46 = !DILocation(line: 31, column: 2, scope: !43)
!47 = !DILocation(line: 32, column: 1, scope: !27)
!48 = distinct !DISubprogram(name: "memory_leak_0015_func_001_good", scope: !9, file: !9, line: 38, type: !10, isLocal: false, isDefinition: true, scopeLine: 39, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!49 = !DILocalVariable(name: "len", arg: 1, scope: !48, file: !9, line: 38, type: !14)
!50 = !DILocation(line: 38, column: 43, scope: !48)
!51 = !DILocalVariable(name: "stringPtr", scope: !48, file: !9, line: 40, type: !12)
!52 = !DILocation(line: 40, column: 8, scope: !48)
!53 = !DILocation(line: 40, column: 43, scope: !48)
!54 = !DILocation(line: 40, column: 46, scope: !48)
!55 = !DILocation(line: 40, column: 42, scope: !48)
!56 = !DILocation(line: 40, column: 40, scope: !48)
!57 = !DILocation(line: 40, column: 20, scope: !48)
!58 = !DILocation(line: 41, column: 9, scope: !48)
!59 = !DILocation(line: 41, column: 2, scope: !48)
!60 = distinct !DISubprogram(name: "memory_leak_0015_good", scope: !9, file: !9, line: 44, type: !28, isLocal: false, isDefinition: true, scopeLine: 45, isOptimized: false, unit: !0, variables: !2)
!61 = !DILocalVariable(name: "str", scope: !60, file: !9, line: 46, type: !12)
!62 = !DILocation(line: 46, column: 8, scope: !60)
!63 = !DILocalVariable(name: "str1", scope: !60, file: !9, line: 47, type: !12)
!64 = !DILocation(line: 47, column: 8, scope: !60)
!65 = !DILocation(line: 47, column: 53, scope: !60)
!66 = !DILocation(line: 47, column: 46, scope: !60)
!67 = !DILocation(line: 47, column: 15, scope: !68)
!68 = !DILexicalBlockFile(scope: !60, file: !9, discriminator: 1)
!69 = !DILocation(line: 48, column: 5, scope: !70)
!70 = distinct !DILexicalBlock(scope: !60, file: !9, line: 48, column: 5)
!71 = !DILocation(line: 48, column: 9, scope: !70)
!72 = !DILocation(line: 48, column: 5, scope: !60)
!73 = !DILocation(line: 50, column: 12, scope: !74)
!74 = distinct !DILexicalBlock(scope: !70, file: !9, line: 49, column: 2)
!75 = !DILocation(line: 50, column: 17, scope: !74)
!76 = !DILocation(line: 50, column: 5, scope: !74)
!77 = !DILocation(line: 51, column: 10, scope: !74)
!78 = !DILocation(line: 51, column: 5, scope: !74)
!79 = !DILocation(line: 52, column: 2, scope: !74)
!80 = !DILocation(line: 53, column: 1, scope: !60)
!81 = distinct !DISubprogram(name: "main", scope: !9, file: !9, line: 60, type: !82, isLocal: false, isDefinition: true, scopeLine: 61, isOptimized: false, unit: !0, variables: !2)
!82 = !DISubroutineType(types: !83)
!83 = !{!14}
!84 = !DILocation(line: 62, column: 2, scope: !81)
!85 = !DILocation(line: 63, column: 2, scope: !81)
!86 = !DILocation(line: 64, column: 2, scope: !81)
