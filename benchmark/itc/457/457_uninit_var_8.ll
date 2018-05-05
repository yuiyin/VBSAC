; ModuleID = './457_uninit_var_8.c'
source_filename = "./457_uninit_var_8.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@uninit_var_009_func_001_good.ret = private unnamed_addr constant [17 x i8] c"This is a string\00", align 16

; Function Attrs: nounwind uwtable
define void @uninit_var_009_func_001_bad(i8* %buf) #0 !dbg !6 {
entry:
  %buf.addr = alloca i8*, align 8
  %ret = alloca [25 x i8], align 16
  store i8* %buf, i8** %buf.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %buf.addr, metadata !12, metadata !13), !dbg !14
  call void @llvm.dbg.declare(metadata [25 x i8]* %ret, metadata !15, metadata !13), !dbg !19
  %0 = load i8*, i8** %buf.addr, align 8, !dbg !20
  %arraydecay = getelementptr inbounds [25 x i8], [25 x i8]* %ret, i32 0, i32 0, !dbg !21
  %call = call i8* @strcpy(i8* %0, i8* %arraydecay) #4, !dbg !22
  ret void, !dbg !23
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare i8* @strcpy(i8*, i8*) #2

; Function Attrs: nounwind uwtable
define void @uninit_var_009_bad() #0 !dbg !24 {
entry:
  %buf = alloca [25 x i8], align 16
  call void @llvm.dbg.declare(metadata [25 x i8]* %buf, metadata !27, metadata !13), !dbg !28
  %arraydecay = getelementptr inbounds [25 x i8], [25 x i8]* %buf, i32 0, i32 0, !dbg !29
  call void @uninit_var_009_func_001_bad(i8* %arraydecay), !dbg !30
  ret void, !dbg !31
}

; Function Attrs: nounwind uwtable
define void @uninit_var_009_func_001_good(i8* %buf) #0 !dbg !32 {
entry:
  %buf.addr = alloca i8*, align 8
  %ret = alloca [17 x i8], align 16
  store i8* %buf, i8** %buf.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %buf.addr, metadata !33, metadata !13), !dbg !34
  call void @llvm.dbg.declare(metadata [17 x i8]* %ret, metadata !35, metadata !13), !dbg !39
  %0 = bitcast [17 x i8]* %ret to i8*, !dbg !39
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %0, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @uninit_var_009_func_001_good.ret, i32 0, i32 0), i64 17, i32 16, i1 false), !dbg !39
  %1 = load i8*, i8** %buf.addr, align 8, !dbg !40
  %arraydecay = getelementptr inbounds [17 x i8], [17 x i8]* %ret, i32 0, i32 0, !dbg !41
  %call = call i8* @strcpy(i8* %1, i8* %arraydecay) #4, !dbg !42
  ret void, !dbg !43
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i32, i1) #3

; Function Attrs: nounwind uwtable
define void @uninit_var_009_good() #0 !dbg !44 {
entry:
  %buf = alloca [25 x i8], align 16
  call void @llvm.dbg.declare(metadata [25 x i8]* %buf, metadata !45, metadata !13), !dbg !46
  %arraydecay = getelementptr inbounds [25 x i8], [25 x i8]* %buf, i32 0, i32 0, !dbg !47
  call void @uninit_var_009_func_001_good(i8* %arraydecay), !dbg !48
  ret void, !dbg !49
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !50 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @uninit_var_009_good(), !dbg !54
  call void @uninit_var_009_bad(), !dbg !55
  ret i32 0, !dbg !56
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { argmemonly nounwind }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4}
!llvm.ident = !{!5}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (tags/RELEASE_390/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2)
!1 = !DIFile(filename: "457_uninit_var_8.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/itc/457")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{!"clang version 3.9.0 (tags/RELEASE_390/final)"}
!6 = distinct !DISubprogram(name: "uninit_var_009_func_001_bad", scope: !7, file: !7, line: 9, type: !8, isLocal: false, isDefinition: true, scopeLine: 9, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!7 = !DIFile(filename: "./457_uninit_var_8.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/itc/457")
!8 = !DISubroutineType(types: !9)
!9 = !{null, !10}
!10 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !11, size: 64, align: 64)
!11 = !DIBasicType(name: "char", size: 8, align: 8, encoding: DW_ATE_signed_char)
!12 = !DILocalVariable(name: "buf", arg: 1, scope: !6, file: !7, line: 9, type: !10)
!13 = !DIExpression()
!14 = !DILocation(line: 9, column: 39, scope: !6)
!15 = !DILocalVariable(name: "ret", scope: !6, file: !7, line: 10, type: !16)
!16 = !DICompositeType(tag: DW_TAG_array_type, baseType: !11, size: 200, align: 8, elements: !17)
!17 = !{!18}
!18 = !DISubrange(count: 25)
!19 = !DILocation(line: 10, column: 7, scope: !6)
!20 = !DILocation(line: 11, column: 9, scope: !6)
!21 = !DILocation(line: 11, column: 13, scope: !6)
!22 = !DILocation(line: 11, column: 2, scope: !6)
!23 = !DILocation(line: 12, column: 1, scope: !6)
!24 = distinct !DISubprogram(name: "uninit_var_009_bad", scope: !7, file: !7, line: 14, type: !25, isLocal: false, isDefinition: true, scopeLine: 14, isOptimized: false, unit: !0, variables: !2)
!25 = !DISubroutineType(types: !26)
!26 = !{null}
!27 = !DILocalVariable(name: "buf", scope: !24, file: !7, line: 15, type: !16)
!28 = !DILocation(line: 15, column: 7, scope: !24)
!29 = !DILocation(line: 16, column: 30, scope: !24)
!30 = !DILocation(line: 16, column: 2, scope: !24)
!31 = !DILocation(line: 17, column: 1, scope: !24)
!32 = distinct !DISubprogram(name: "uninit_var_009_func_001_good", scope: !7, file: !7, line: 23, type: !8, isLocal: false, isDefinition: true, scopeLine: 24, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!33 = !DILocalVariable(name: "buf", arg: 1, scope: !32, file: !7, line: 23, type: !10)
!34 = !DILocation(line: 23, column: 40, scope: !32)
!35 = !DILocalVariable(name: "ret", scope: !32, file: !7, line: 25, type: !36)
!36 = !DICompositeType(tag: DW_TAG_array_type, baseType: !11, size: 136, align: 8, elements: !37)
!37 = !{!38}
!38 = !DISubrange(count: 17)
!39 = !DILocation(line: 25, column: 7, scope: !32)
!40 = !DILocation(line: 26, column: 9, scope: !32)
!41 = !DILocation(line: 26, column: 13, scope: !32)
!42 = !DILocation(line: 26, column: 2, scope: !32)
!43 = !DILocation(line: 27, column: 1, scope: !32)
!44 = distinct !DISubprogram(name: "uninit_var_009_good", scope: !7, file: !7, line: 29, type: !25, isLocal: false, isDefinition: true, scopeLine: 30, isOptimized: false, unit: !0, variables: !2)
!45 = !DILocalVariable(name: "buf", scope: !44, file: !7, line: 31, type: !16)
!46 = !DILocation(line: 31, column: 7, scope: !44)
!47 = !DILocation(line: 32, column: 31, scope: !44)
!48 = !DILocation(line: 32, column: 2, scope: !44)
!49 = !DILocation(line: 33, column: 1, scope: !44)
!50 = distinct !DISubprogram(name: "main", scope: !7, file: !7, line: 35, type: !51, isLocal: false, isDefinition: true, scopeLine: 35, isOptimized: false, unit: !0, variables: !2)
!51 = !DISubroutineType(types: !52)
!52 = !{!53}
!53 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!54 = !DILocation(line: 36, column: 2, scope: !50)
!55 = !DILocation(line: 37, column: 2, scope: !50)
!56 = !DILocation(line: 38, column: 2, scope: !50)
