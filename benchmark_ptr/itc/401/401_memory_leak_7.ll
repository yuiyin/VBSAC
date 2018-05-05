; ModuleID = './401_memory_leak_7.c'
source_filename = "./401_memory_leak_7.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@vptr_bad = common global i8* null, align 8
@vptr_good = common global i8* null, align 8

; Function Attrs: nounwind uwtable
define i32 @memory_leak_007_func_001_bad(i32 %flag) #0 !dbg !18 {
entry:
  %retval = alloca i32, align 4
  %flag.addr = alloca i32, align 4
  store i32 %flag, i32* %flag.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %flag.addr, metadata !21, metadata !22), !dbg !23
  %0 = load i32, i32* %flag.addr, align 4, !dbg !24
  switch i32 %0, label %sw.default [
    i32 1, label %sw.bb
    i32 2, label %sw.bb1
    i32 3, label %sw.bb7
  ], !dbg !25

sw.bb:                                            ; preds = %entry
  %call = call noalias i8* @calloc(i64 10, i64 4) #3, !dbg !26
  %1 = bitcast i8* %call to i32*, !dbg !29
  %2 = bitcast i32* %1 to i8*, !dbg !29
  store i8* %2, i8** @vptr_bad, align 8, !dbg !30
  %3 = load i8*, i8** @vptr_bad, align 8, !dbg !31
  %cmp = icmp ne i8* %3, null, !dbg !33
  br i1 %cmp, label %if.then, label %if.end, !dbg !34

if.then:                                          ; preds = %sw.bb
  %4 = load i8*, i8** @vptr_bad, align 8, !dbg !35
  %5 = bitcast i8* %4 to i32*, !dbg !37
  %add.ptr = getelementptr inbounds i32, i32* %5, i64 1, !dbg !38
  store i32 10, i32* %add.ptr, align 4, !dbg !39
  br label %if.end, !dbg !40

if.end:                                           ; preds = %if.then, %sw.bb
  store i32 1, i32* %retval, align 4, !dbg !41
  br label %return, !dbg !41

sw.bb1:                                           ; preds = %entry
  %call2 = call noalias i8* @calloc(i64 10, i64 1) #3, !dbg !42
  store i8* %call2, i8** @vptr_bad, align 8, !dbg !44
  %6 = load i8*, i8** @vptr_bad, align 8, !dbg !45
  %cmp3 = icmp ne i8* %6, null, !dbg !47
  br i1 %cmp3, label %if.then4, label %if.end6, !dbg !48

if.then4:                                         ; preds = %sw.bb1
  %7 = load i8*, i8** @vptr_bad, align 8, !dbg !49
  %add.ptr5 = getelementptr inbounds i8, i8* %7, i64 2, !dbg !51
  store i8 97, i8* %add.ptr5, align 1, !dbg !52
  br label %if.end6, !dbg !53

if.end6:                                          ; preds = %if.then4, %sw.bb1
  store i32 2, i32* %retval, align 4, !dbg !54
  br label %return, !dbg !54

sw.bb7:                                           ; preds = %entry
  %call8 = call noalias i8* @calloc(i64 10, i64 4) #3, !dbg !55
  %8 = bitcast i8* %call8 to float*, !dbg !57
  %9 = bitcast float* %8 to i8*, !dbg !57
  store i8* %9, i8** @vptr_bad, align 8, !dbg !58
  %10 = load i8*, i8** @vptr_bad, align 8, !dbg !59
  %cmp9 = icmp ne i8* %10, null, !dbg !61
  br i1 %cmp9, label %if.then10, label %if.end12, !dbg !62

if.then10:                                        ; preds = %sw.bb7
  %11 = load i8*, i8** @vptr_bad, align 8, !dbg !63
  %12 = bitcast i8* %11 to float*, !dbg !65
  %add.ptr11 = getelementptr inbounds float, float* %12, i64 3, !dbg !66
  store float 5.500000e+00, float* %add.ptr11, align 4, !dbg !67
  br label %if.end12, !dbg !68

if.end12:                                         ; preds = %if.then10, %sw.bb7
  store i32 3, i32* %retval, align 4, !dbg !69
  br label %return, !dbg !69

sw.default:                                       ; preds = %entry
  store i32 -1, i32* %retval, align 4, !dbg !70
  br label %return, !dbg !70

return:                                           ; preds = %sw.default, %if.end12, %if.end6, %if.end
  %13 = load i32, i32* %retval, align 4, !dbg !71
  ret i32 %13, !dbg !71
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare noalias i8* @calloc(i64, i64) #2

; Function Attrs: nounwind uwtable
define void @memory_leak_007_bad() #0 !dbg !72 {
entry:
  %ret = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %ret, metadata !75, metadata !22), !dbg !76
  %call = call i32 @rand() #3, !dbg !77
  %call1 = call i32 @memory_leak_007_func_001_bad(i32 %call), !dbg !78
  store i32 %call1, i32* %ret, align 4, !dbg !80
  %0 = load i32, i32* %ret, align 4, !dbg !81
  %cmp = icmp eq i32 %0, 0, !dbg !83
  br i1 %cmp, label %if.then, label %if.end4, !dbg !84

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** @vptr_bad, align 8, !dbg !85
  %cmp2 = icmp ne i8* %1, null, !dbg !87
  br i1 %cmp2, label %if.then3, label %if.end, !dbg !88

if.then3:                                         ; preds = %if.then
  %2 = load i8*, i8** @vptr_bad, align 8, !dbg !89
  call void @free(i8* %2) #3, !dbg !91
  br label %if.end, !dbg !92

if.end:                                           ; preds = %if.then3, %if.then
  br label %if.end4, !dbg !93

if.end4:                                          ; preds = %if.end, %entry
  ret void, !dbg !95
}

; Function Attrs: nounwind
declare i32 @rand() #2

; Function Attrs: nounwind
declare void @free(i8*) #2

; Function Attrs: nounwind uwtable
define i32 @memory_leak_007_func_001_good(i32 %flag) #0 !dbg !96 {
entry:
  %retval = alloca i32, align 4
  %flag.addr = alloca i32, align 4
  store i32 %flag, i32* %flag.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %flag.addr, metadata !97, metadata !22), !dbg !98
  %0 = load i32, i32* %flag.addr, align 4, !dbg !99
  switch i32 %0, label %sw.default [
    i32 1, label %sw.bb
    i32 2, label %sw.bb1
    i32 3, label %sw.bb7
  ], !dbg !100

sw.bb:                                            ; preds = %entry
  %call = call noalias i8* @calloc(i64 10, i64 4) #3, !dbg !101
  %1 = bitcast i8* %call to i32*, !dbg !104
  %2 = bitcast i32* %1 to i8*, !dbg !104
  store i8* %2, i8** @vptr_good, align 8, !dbg !105
  %3 = load i8*, i8** @vptr_good, align 8, !dbg !106
  %cmp = icmp ne i8* %3, null, !dbg !108
  br i1 %cmp, label %if.then, label %if.end, !dbg !109

if.then:                                          ; preds = %sw.bb
  %4 = load i8*, i8** @vptr_good, align 8, !dbg !110
  %5 = bitcast i8* %4 to i32*, !dbg !112
  %add.ptr = getelementptr inbounds i32, i32* %5, i64 1, !dbg !113
  store i32 10, i32* %add.ptr, align 4, !dbg !114
  br label %if.end, !dbg !115

if.end:                                           ; preds = %if.then, %sw.bb
  store i32 1, i32* %retval, align 4, !dbg !116
  br label %return, !dbg !116

sw.bb1:                                           ; preds = %entry
  %call2 = call noalias i8* @calloc(i64 10, i64 1) #3, !dbg !117
  store i8* %call2, i8** @vptr_good, align 8, !dbg !119
  %6 = load i8*, i8** @vptr_good, align 8, !dbg !120
  %cmp3 = icmp ne i8* %6, null, !dbg !122
  br i1 %cmp3, label %if.then4, label %if.end6, !dbg !123

if.then4:                                         ; preds = %sw.bb1
  %7 = load i8*, i8** @vptr_good, align 8, !dbg !124
  %add.ptr5 = getelementptr inbounds i8, i8* %7, i64 2, !dbg !126
  store i8 97, i8* %add.ptr5, align 1, !dbg !127
  br label %if.end6, !dbg !128

if.end6:                                          ; preds = %if.then4, %sw.bb1
  store i32 2, i32* %retval, align 4, !dbg !129
  br label %return, !dbg !129

sw.bb7:                                           ; preds = %entry
  %call8 = call noalias i8* @calloc(i64 10, i64 4) #3, !dbg !130
  %8 = bitcast i8* %call8 to float*, !dbg !132
  %9 = bitcast float* %8 to i8*, !dbg !132
  store i8* %9, i8** @vptr_good, align 8, !dbg !133
  %10 = load i8*, i8** @vptr_good, align 8, !dbg !134
  %cmp9 = icmp ne i8* %10, null, !dbg !136
  br i1 %cmp9, label %if.then10, label %if.end12, !dbg !137

if.then10:                                        ; preds = %sw.bb7
  %11 = load i8*, i8** @vptr_good, align 8, !dbg !138
  %12 = bitcast i8* %11 to float*, !dbg !140
  %add.ptr11 = getelementptr inbounds float, float* %12, i64 3, !dbg !141
  store float 5.500000e+00, float* %add.ptr11, align 4, !dbg !142
  br label %if.end12, !dbg !143

if.end12:                                         ; preds = %if.then10, %sw.bb7
  store i32 3, i32* %retval, align 4, !dbg !144
  br label %return, !dbg !144

sw.default:                                       ; preds = %entry
  store i32 -1, i32* %retval, align 4, !dbg !145
  br label %return, !dbg !145

return:                                           ; preds = %sw.default, %if.end12, %if.end6, %if.end
  %13 = load i32, i32* %retval, align 4, !dbg !146
  ret i32 %13, !dbg !146
}

; Function Attrs: nounwind uwtable
define void @memory_leak_007_good() #0 !dbg !147 {
entry:
  %ret = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %ret, metadata !148, metadata !22), !dbg !149
  %call = call i32 @rand() #3, !dbg !150
  %call1 = call i32 @memory_leak_007_func_001_good(i32 %call), !dbg !151
  store i32 %call1, i32* %ret, align 4, !dbg !153
  %0 = load i32, i32* %ret, align 4, !dbg !154
  %cmp = icmp sge i32 %0, 0, !dbg !156
  br i1 %cmp, label %if.then, label %if.end4, !dbg !157

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** @vptr_good, align 8, !dbg !158
  %cmp2 = icmp ne i8* %1, null, !dbg !160
  br i1 %cmp2, label %if.then3, label %if.end, !dbg !161

if.then3:                                         ; preds = %if.then
  %2 = load i8*, i8** @vptr_good, align 8, !dbg !162
  call void @free(i8* %2) #3, !dbg !164
  br label %if.end, !dbg !165

if.end:                                           ; preds = %if.then3, %if.then
  br label %if.end4, !dbg !166

if.end4:                                          ; preds = %if.end, %entry
  ret void, !dbg !168
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !169 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @memory_leak_007_good(), !dbg !172
  call void @memory_leak_007_bad(), !dbg !173
  ret i32 0, !dbg !174
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!15, !16}
!llvm.ident = !{!17}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (tags/RELEASE_390/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, globals: !11)
!1 = !DIFile(filename: "401_memory_leak_7.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/itc/401")
!2 = !{}
!3 = !{!4, !6, !7, !9}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64, align: 64)
!5 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64, align: 64)
!7 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !8, size: 64, align: 64)
!8 = !DIBasicType(name: "char", size: 8, align: 8, encoding: DW_ATE_signed_char)
!9 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !10, size: 64, align: 64)
!10 = !DIBasicType(name: "float", size: 32, align: 32, encoding: DW_ATE_float)
!11 = !{!12, !14}
!12 = distinct !DIGlobalVariable(name: "vptr_bad", scope: !0, file: !13, line: 20, type: !6, isLocal: false, isDefinition: true, variable: i8** @vptr_bad)
!13 = !DIFile(filename: "./401_memory_leak_7.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/itc/401")
!14 = distinct !DIGlobalVariable(name: "vptr_good", scope: !0, file: !13, line: 72, type: !6, isLocal: false, isDefinition: true, variable: i8** @vptr_good)
!15 = !{i32 2, !"Dwarf Version", i32 4}
!16 = !{i32 2, !"Debug Info Version", i32 3}
!17 = !{!"clang version 3.9.0 (tags/RELEASE_390/final)"}
!18 = distinct !DISubprogram(name: "memory_leak_007_func_001_bad", scope: !13, file: !13, line: 21, type: !19, isLocal: false, isDefinition: true, scopeLine: 22, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!19 = !DISubroutineType(types: !20)
!20 = !{!5, !5}
!21 = !DILocalVariable(name: "flag", arg: 1, scope: !18, file: !13, line: 21, type: !5)
!22 = !DIExpression()
!23 = !DILocation(line: 21, column: 38, scope: !18)
!24 = !DILocation(line: 23, column: 10, scope: !18)
!25 = !DILocation(line: 23, column: 2, scope: !18)
!26 = !DILocation(line: 27, column: 22, scope: !27)
!27 = distinct !DILexicalBlock(scope: !28, file: !13, line: 26, column: 3)
!28 = distinct !DILexicalBlock(scope: !18, file: !13, line: 24, column: 2)
!29 = !DILocation(line: 27, column: 15, scope: !27)
!30 = !DILocation(line: 27, column: 13, scope: !27)
!31 = !DILocation(line: 28, column: 7, scope: !32)
!32 = distinct !DILexicalBlock(scope: !27, file: !13, line: 28, column: 7)
!33 = !DILocation(line: 28, column: 15, scope: !32)
!34 = !DILocation(line: 28, column: 7, scope: !27)
!35 = !DILocation(line: 30, column: 15, scope: !36)
!36 = distinct !DILexicalBlock(scope: !32, file: !13, line: 29, column: 4)
!37 = !DILocation(line: 30, column: 9, scope: !36)
!38 = !DILocation(line: 30, column: 23, scope: !36)
!39 = !DILocation(line: 30, column: 27, scope: !36)
!40 = !DILocation(line: 31, column: 4, scope: !36)
!41 = !DILocation(line: 32, column: 4, scope: !27)
!42 = !DILocation(line: 36, column: 23, scope: !43)
!43 = distinct !DILexicalBlock(scope: !28, file: !13, line: 35, column: 3)
!44 = !DILocation(line: 36, column: 13, scope: !43)
!45 = !DILocation(line: 37, column: 7, scope: !46)
!46 = distinct !DILexicalBlock(scope: !43, file: !13, line: 37, column: 7)
!47 = !DILocation(line: 37, column: 15, scope: !46)
!48 = !DILocation(line: 37, column: 7, scope: !43)
!49 = !DILocation(line: 39, column: 16, scope: !50)
!50 = distinct !DILexicalBlock(scope: !46, file: !13, line: 38, column: 4)
!51 = !DILocation(line: 39, column: 24, scope: !50)
!52 = !DILocation(line: 39, column: 28, scope: !50)
!53 = !DILocation(line: 40, column: 4, scope: !50)
!54 = !DILocation(line: 41, column: 4, scope: !43)
!55 = !DILocation(line: 45, column: 24, scope: !56)
!56 = distinct !DILexicalBlock(scope: !28, file: !13, line: 44, column: 3)
!57 = !DILocation(line: 45, column: 15, scope: !56)
!58 = !DILocation(line: 45, column: 13, scope: !56)
!59 = !DILocation(line: 46, column: 7, scope: !60)
!60 = distinct !DILexicalBlock(scope: !56, file: !13, line: 46, column: 7)
!61 = !DILocation(line: 46, column: 15, scope: !60)
!62 = !DILocation(line: 46, column: 7, scope: !56)
!63 = !DILocation(line: 48, column: 17, scope: !64)
!64 = distinct !DILexicalBlock(scope: !60, file: !13, line: 47, column: 4)
!65 = !DILocation(line: 48, column: 9, scope: !64)
!66 = !DILocation(line: 48, column: 25, scope: !64)
!67 = !DILocation(line: 48, column: 29, scope: !64)
!68 = !DILocation(line: 49, column: 4, scope: !64)
!69 = !DILocation(line: 50, column: 4, scope: !56)
!70 = !DILocation(line: 53, column: 4, scope: !28)
!71 = !DILocation(line: 55, column: 1, scope: !18)
!72 = distinct !DISubprogram(name: "memory_leak_007_bad", scope: !13, file: !13, line: 57, type: !73, isLocal: false, isDefinition: true, scopeLine: 58, isOptimized: false, unit: !0, variables: !2)
!73 = !DISubroutineType(types: !74)
!74 = !{null}
!75 = !DILocalVariable(name: "ret", scope: !72, file: !13, line: 59, type: !5)
!76 = !DILocation(line: 59, column: 6, scope: !72)
!77 = !DILocation(line: 60, column: 37, scope: !72)
!78 = !DILocation(line: 60, column: 8, scope: !79)
!79 = !DILexicalBlockFile(scope: !72, file: !13, discriminator: 1)
!80 = !DILocation(line: 60, column: 6, scope: !72)
!81 = !DILocation(line: 61, column: 5, scope: !82)
!82 = distinct !DILexicalBlock(scope: !72, file: !13, line: 61, column: 5)
!83 = !DILocation(line: 61, column: 9, scope: !82)
!84 = !DILocation(line: 61, column: 5, scope: !72)
!85 = !DILocation(line: 62, column: 6, scope: !86)
!86 = distinct !DILexicalBlock(scope: !82, file: !13, line: 62, column: 6)
!87 = !DILocation(line: 62, column: 14, scope: !86)
!88 = !DILocation(line: 62, column: 6, scope: !82)
!89 = !DILocation(line: 64, column: 8, scope: !90)
!90 = distinct !DILexicalBlock(scope: !86, file: !13, line: 63, column: 3)
!91 = !DILocation(line: 64, column: 3, scope: !90)
!92 = !DILocation(line: 65, column: 3, scope: !90)
!93 = !DILocation(line: 62, column: 16, scope: !94)
!94 = !DILexicalBlockFile(scope: !86, file: !13, discriminator: 1)
!95 = !DILocation(line: 66, column: 1, scope: !72)
!96 = distinct !DISubprogram(name: "memory_leak_007_func_001_good", scope: !13, file: !13, line: 73, type: !19, isLocal: false, isDefinition: true, scopeLine: 74, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!97 = !DILocalVariable(name: "flag", arg: 1, scope: !96, file: !13, line: 73, type: !5)
!98 = !DILocation(line: 73, column: 39, scope: !96)
!99 = !DILocation(line: 75, column: 10, scope: !96)
!100 = !DILocation(line: 75, column: 2, scope: !96)
!101 = !DILocation(line: 79, column: 23, scope: !102)
!102 = distinct !DILexicalBlock(scope: !103, file: !13, line: 78, column: 3)
!103 = distinct !DILexicalBlock(scope: !96, file: !13, line: 76, column: 2)
!104 = !DILocation(line: 79, column: 16, scope: !102)
!105 = !DILocation(line: 79, column: 14, scope: !102)
!106 = !DILocation(line: 80, column: 7, scope: !107)
!107 = distinct !DILexicalBlock(scope: !102, file: !13, line: 80, column: 7)
!108 = !DILocation(line: 80, column: 16, scope: !107)
!109 = !DILocation(line: 80, column: 7, scope: !102)
!110 = !DILocation(line: 82, column: 15, scope: !111)
!111 = distinct !DILexicalBlock(scope: !107, file: !13, line: 81, column: 4)
!112 = !DILocation(line: 82, column: 9, scope: !111)
!113 = !DILocation(line: 82, column: 24, scope: !111)
!114 = !DILocation(line: 82, column: 28, scope: !111)
!115 = !DILocation(line: 83, column: 4, scope: !111)
!116 = !DILocation(line: 84, column: 4, scope: !102)
!117 = !DILocation(line: 88, column: 24, scope: !118)
!118 = distinct !DILexicalBlock(scope: !103, file: !13, line: 87, column: 3)
!119 = !DILocation(line: 88, column: 14, scope: !118)
!120 = !DILocation(line: 89, column: 7, scope: !121)
!121 = distinct !DILexicalBlock(scope: !118, file: !13, line: 89, column: 7)
!122 = !DILocation(line: 89, column: 16, scope: !121)
!123 = !DILocation(line: 89, column: 7, scope: !118)
!124 = !DILocation(line: 91, column: 16, scope: !125)
!125 = distinct !DILexicalBlock(scope: !121, file: !13, line: 90, column: 4)
!126 = !DILocation(line: 91, column: 25, scope: !125)
!127 = !DILocation(line: 91, column: 29, scope: !125)
!128 = !DILocation(line: 92, column: 4, scope: !125)
!129 = !DILocation(line: 93, column: 4, scope: !118)
!130 = !DILocation(line: 97, column: 25, scope: !131)
!131 = distinct !DILexicalBlock(scope: !103, file: !13, line: 96, column: 3)
!132 = !DILocation(line: 97, column: 16, scope: !131)
!133 = !DILocation(line: 97, column: 14, scope: !131)
!134 = !DILocation(line: 98, column: 7, scope: !135)
!135 = distinct !DILexicalBlock(scope: !131, file: !13, line: 98, column: 7)
!136 = !DILocation(line: 98, column: 16, scope: !135)
!137 = !DILocation(line: 98, column: 7, scope: !131)
!138 = !DILocation(line: 100, column: 17, scope: !139)
!139 = distinct !DILexicalBlock(scope: !135, file: !13, line: 99, column: 4)
!140 = !DILocation(line: 100, column: 9, scope: !139)
!141 = !DILocation(line: 100, column: 26, scope: !139)
!142 = !DILocation(line: 100, column: 30, scope: !139)
!143 = !DILocation(line: 101, column: 4, scope: !139)
!144 = !DILocation(line: 102, column: 4, scope: !131)
!145 = !DILocation(line: 105, column: 4, scope: !103)
!146 = !DILocation(line: 107, column: 1, scope: !96)
!147 = distinct !DISubprogram(name: "memory_leak_007_good", scope: !13, file: !13, line: 109, type: !73, isLocal: false, isDefinition: true, scopeLine: 110, isOptimized: false, unit: !0, variables: !2)
!148 = !DILocalVariable(name: "ret", scope: !147, file: !13, line: 111, type: !5)
!149 = !DILocation(line: 111, column: 6, scope: !147)
!150 = !DILocation(line: 112, column: 38, scope: !147)
!151 = !DILocation(line: 112, column: 8, scope: !152)
!152 = !DILexicalBlockFile(scope: !147, file: !13, discriminator: 1)
!153 = !DILocation(line: 112, column: 6, scope: !147)
!154 = !DILocation(line: 113, column: 5, scope: !155)
!155 = distinct !DILexicalBlock(scope: !147, file: !13, line: 113, column: 5)
!156 = !DILocation(line: 113, column: 9, scope: !155)
!157 = !DILocation(line: 113, column: 5, scope: !147)
!158 = !DILocation(line: 114, column: 6, scope: !159)
!159 = distinct !DILexicalBlock(scope: !155, file: !13, line: 114, column: 6)
!160 = !DILocation(line: 114, column: 15, scope: !159)
!161 = !DILocation(line: 114, column: 6, scope: !155)
!162 = !DILocation(line: 116, column: 11, scope: !163)
!163 = distinct !DILexicalBlock(scope: !159, file: !13, line: 115, column: 3)
!164 = !DILocation(line: 116, column: 6, scope: !163)
!165 = !DILocation(line: 117, column: 3, scope: !163)
!166 = !DILocation(line: 114, column: 17, scope: !167)
!167 = !DILexicalBlockFile(scope: !159, file: !13, discriminator: 1)
!168 = !DILocation(line: 118, column: 1, scope: !147)
!169 = distinct !DISubprogram(name: "main", scope: !13, file: !13, line: 125, type: !170, isLocal: false, isDefinition: true, scopeLine: 126, isOptimized: false, unit: !0, variables: !2)
!170 = !DISubroutineType(types: !171)
!171 = !{!5}
!172 = !DILocation(line: 127, column: 2, scope: !169)
!173 = !DILocation(line: 128, column: 2, scope: !169)
!174 = !DILocation(line: 129, column: 2, scope: !169)
