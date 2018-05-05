; ModuleID = './401_memory_leak_11.c'
source_filename = "./401_memory_leak_11.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%union.memory_leak_0011_uni_001 = type { i8* }

@.str = private unnamed_addr constant [17 x i8] c"This Is A String\00", align 1

; Function Attrs: nounwind uwtable
define void @memory_leak_0011_bad() #0 !dbg !10 {
entry:
  %buf = alloca i8*, align 8
  %un = alloca %union.memory_leak_0011_uni_001, align 8
  call void @llvm.dbg.declare(metadata i8** %buf, metadata !14, metadata !15), !dbg !16
  store i8* null, i8** %buf, align 8, !dbg !16
  call void @llvm.dbg.declare(metadata %union.memory_leak_0011_uni_001* %un, metadata !17, metadata !15), !dbg !23
  %call = call noalias i8* @calloc(i64 50, i64 1) #3, !dbg !24
  store i8* %call, i8** %buf, align 8, !dbg !25
  %0 = load i8*, i8** %buf, align 8, !dbg !26
  %cmp = icmp ne i8* %0, null, !dbg !28
  br i1 %cmp, label %if.then, label %if.end, !dbg !29

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** %buf, align 8, !dbg !30
  %call1 = call i8* @strcpy(i8* %1, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str, i32 0, i32 0)) #3, !dbg !32
  %2 = load i8*, i8** %buf, align 8, !dbg !33
  %u1 = bitcast %union.memory_leak_0011_uni_001* %un to i8**, !dbg !34
  store i8* %2, i8** %u1, align 8, !dbg !35
  br label %if.end, !dbg !36

if.end:                                           ; preds = %if.then, %entry
  ret void, !dbg !37
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare noalias i8* @calloc(i64, i64) #2

; Function Attrs: nounwind
declare i8* @strcpy(i8*, i8*) #2

; Function Attrs: nounwind uwtable
define void @memory_leak_0011_good() #0 !dbg !38 {
entry:
  %buf = alloca i8*, align 8
  %un = alloca %union.memory_leak_0011_uni_001, align 8
  %buf2 = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %buf, metadata !39, metadata !15), !dbg !40
  store i8* null, i8** %buf, align 8, !dbg !40
  call void @llvm.dbg.declare(metadata %union.memory_leak_0011_uni_001* %un, metadata !41, metadata !15), !dbg !42
  %call = call noalias i8* @calloc(i64 50, i64 1) #3, !dbg !43
  store i8* %call, i8** %buf, align 8, !dbg !44
  %0 = load i8*, i8** %buf, align 8, !dbg !45
  %cmp = icmp ne i8* %0, null, !dbg !47
  br i1 %cmp, label %if.then, label %if.end5, !dbg !48

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** %buf, align 8, !dbg !49
  %call1 = call i8* @strcpy(i8* %1, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str, i32 0, i32 0)) #3, !dbg !51
  %2 = load i8*, i8** %buf, align 8, !dbg !52
  %u1 = bitcast %union.memory_leak_0011_uni_001* %un to i8**, !dbg !53
  store i8* %2, i8** %u1, align 8, !dbg !54
  call void @llvm.dbg.declare(metadata i8** %buf2, metadata !55, metadata !15), !dbg !56
  %u13 = bitcast %union.memory_leak_0011_uni_001* %un to i8**, !dbg !57
  %3 = load i8*, i8** %u13, align 8, !dbg !57
  store i8* %3, i8** %buf2, align 8, !dbg !56
  %4 = load i8*, i8** %buf2, align 8, !dbg !58
  %tobool = icmp ne i8* %4, null, !dbg !58
  br i1 %tobool, label %if.then4, label %if.end, !dbg !60

if.then4:                                         ; preds = %if.then
  %5 = load i8*, i8** %buf2, align 8, !dbg !61
  call void @free(i8* %5) #3, !dbg !62
  br label %if.end, !dbg !62

if.end:                                           ; preds = %if.then4, %if.then
  store i8* null, i8** %buf2, align 8, !dbg !63
  br label %if.end5, !dbg !64

if.end5:                                          ; preds = %if.end, %entry
  ret void, !dbg !65
}

; Function Attrs: nounwind
declare void @free(i8*) #2

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !66 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @memory_leak_0011_good(), !dbg !70
  call void @memory_leak_0011_bad(), !dbg !71
  ret i32 0, !dbg !72
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8}
!llvm.ident = !{!9}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (tags/RELEASE_390/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3)
!1 = !DIFile(filename: "401_memory_leak_11.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/itc/401")
!2 = !{}
!3 = !{!4, !6}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64, align: 64)
!5 = !DIBasicType(name: "char", size: 8, align: 8, encoding: DW_ATE_signed_char)
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64, align: 64)
!7 = !{i32 2, !"Dwarf Version", i32 4}
!8 = !{i32 2, !"Debug Info Version", i32 3}
!9 = !{!"clang version 3.9.0 (tags/RELEASE_390/final)"}
!10 = distinct !DISubprogram(name: "memory_leak_0011_bad", scope: !11, file: !11, line: 24, type: !12, isLocal: false, isDefinition: true, scopeLine: 25, isOptimized: false, unit: !0, variables: !2)
!11 = !DIFile(filename: "./401_memory_leak_11.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/itc/401")
!12 = !DISubroutineType(types: !13)
!13 = !{null}
!14 = !DILocalVariable(name: "buf", scope: !10, file: !11, line: 26, type: !4)
!15 = !DIExpression()
!16 = !DILocation(line: 26, column: 12, scope: !10)
!17 = !DILocalVariable(name: "un", scope: !10, file: !11, line: 27, type: !18)
!18 = !DIDerivedType(tag: DW_TAG_typedef, name: "memory_leak_0011_uni_001", file: !11, line: 21, baseType: !19)
!19 = distinct !DICompositeType(tag: DW_TAG_union_type, file: !11, line: 18, size: 64, align: 64, elements: !20)
!20 = !{!21, !22}
!21 = !DIDerivedType(tag: DW_TAG_member, name: "u1", scope: !19, file: !11, line: 19, baseType: !4, size: 64, align: 64)
!22 = !DIDerivedType(tag: DW_TAG_member, name: "u2", scope: !19, file: !11, line: 20, baseType: !4, size: 64, align: 64)
!23 = !DILocation(line: 27, column: 30, scope: !10)
!24 = !DILocation(line: 28, column: 19, scope: !10)
!25 = !DILocation(line: 28, column: 9, scope: !10)
!26 = !DILocation(line: 29, column: 5, scope: !27)
!27 = distinct !DILexicalBlock(scope: !10, file: !11, line: 29, column: 5)
!28 = !DILocation(line: 29, column: 8, scope: !27)
!29 = !DILocation(line: 29, column: 5, scope: !10)
!30 = !DILocation(line: 31, column: 12, scope: !31)
!31 = distinct !DILexicalBlock(scope: !27, file: !11, line: 30, column: 2)
!32 = !DILocation(line: 31, column: 5, scope: !31)
!33 = !DILocation(line: 32, column: 13, scope: !31)
!34 = !DILocation(line: 32, column: 8, scope: !31)
!35 = !DILocation(line: 32, column: 11, scope: !31)
!36 = !DILocation(line: 33, column: 2, scope: !31)
!37 = !DILocation(line: 34, column: 1, scope: !10)
!38 = distinct !DISubprogram(name: "memory_leak_0011_good", scope: !11, file: !11, line: 40, type: !12, isLocal: false, isDefinition: true, scopeLine: 41, isOptimized: false, unit: !0, variables: !2)
!39 = !DILocalVariable(name: "buf", scope: !38, file: !11, line: 42, type: !4)
!40 = !DILocation(line: 42, column: 12, scope: !38)
!41 = !DILocalVariable(name: "un", scope: !38, file: !11, line: 43, type: !18)
!42 = !DILocation(line: 43, column: 30, scope: !38)
!43 = !DILocation(line: 44, column: 19, scope: !38)
!44 = !DILocation(line: 44, column: 9, scope: !38)
!45 = !DILocation(line: 45, column: 5, scope: !46)
!46 = distinct !DILexicalBlock(scope: !38, file: !11, line: 45, column: 5)
!47 = !DILocation(line: 45, column: 8, scope: !46)
!48 = !DILocation(line: 45, column: 5, scope: !38)
!49 = !DILocation(line: 47, column: 18, scope: !50)
!50 = distinct !DILexicalBlock(scope: !46, file: !11, line: 46, column: 2)
!51 = !DILocation(line: 47, column: 11, scope: !50)
!52 = !DILocation(line: 48, column: 19, scope: !50)
!53 = !DILocation(line: 48, column: 14, scope: !50)
!54 = !DILocation(line: 48, column: 17, scope: !50)
!55 = !DILocalVariable(name: "buf", scope: !50, file: !11, line: 49, type: !4)
!56 = !DILocation(line: 49, column: 18, scope: !50)
!57 = !DILocation(line: 49, column: 27, scope: !50)
!58 = !DILocation(line: 50, column: 15, scope: !59)
!59 = distinct !DILexicalBlock(scope: !50, file: !11, line: 50, column: 15)
!60 = !DILocation(line: 50, column: 15, scope: !50)
!61 = !DILocation(line: 51, column: 18, scope: !59)
!62 = !DILocation(line: 51, column: 13, scope: !59)
!63 = !DILocation(line: 52, column: 15, scope: !50)
!64 = !DILocation(line: 53, column: 9, scope: !50)
!65 = !DILocation(line: 54, column: 1, scope: !38)
!66 = distinct !DISubprogram(name: "main", scope: !11, file: !11, line: 61, type: !67, isLocal: false, isDefinition: true, scopeLine: 62, isOptimized: false, unit: !0, variables: !2)
!67 = !DISubroutineType(types: !68)
!68 = !{!69}
!69 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!70 = !DILocation(line: 63, column: 3, scope: !66)
!71 = !DILocation(line: 64, column: 2, scope: !66)
!72 = !DILocation(line: 65, column: 2, scope: !66)
