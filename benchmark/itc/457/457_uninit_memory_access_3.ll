; ModuleID = './457_uninit_memory_access_3.c'
source_filename = "./457_uninit_memory_access_3.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [7 x i8] c"STRING\00", align 1

; Function Attrs: nounwind uwtable
define void @_001_bad(i8* %msg) #0 !dbg !6 {
entry:
  %msg.addr = alloca i8*, align 8
  %error_log = alloca i8*, align 8
  %buffer = alloca [24 x i8], align 16
  store i8* %msg, i8** %msg.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %msg.addr, metadata !13, metadata !14), !dbg !15
  call void @llvm.dbg.declare(metadata i8** %error_log, metadata !16, metadata !14), !dbg !17
  %0 = load i8*, i8** %msg.addr, align 8, !dbg !18
  store i8* %0, i8** %error_log, align 8, !dbg !17
  call void @llvm.dbg.declare(metadata [24 x i8]* %buffer, metadata !19, metadata !14), !dbg !23
  ret void, !dbg !24
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind uwtable
define void @bad() #0 !dbg !25 {
entry:
  %str = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %str, metadata !28, metadata !14), !dbg !30
  %0 = load i8*, i8** %str, align 8, !dbg !31
  call void @_001_bad(i8* %0), !dbg !32
  ret void, !dbg !33
}

; Function Attrs: nounwind uwtable
define void @_001_good(i8* %msg) #0 !dbg !34 {
entry:
  %msg.addr = alloca i8*, align 8
  %error_log = alloca i8*, align 8
  %buffer = alloca [24 x i8], align 16
  store i8* %msg, i8** %msg.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %msg.addr, metadata !35, metadata !14), !dbg !36
  call void @llvm.dbg.declare(metadata i8** %error_log, metadata !37, metadata !14), !dbg !38
  %0 = load i8*, i8** %msg.addr, align 8, !dbg !39
  store i8* %0, i8** %error_log, align 8, !dbg !38
  call void @llvm.dbg.declare(metadata [24 x i8]* %buffer, metadata !40, metadata !14), !dbg !41
  ret void, !dbg !42
}

; Function Attrs: nounwind uwtable
define void @good() #0 !dbg !43 {
entry:
  %str = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %str, metadata !44, metadata !14), !dbg !45
  store i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8** %str, align 8, !dbg !45
  %0 = load i8*, i8** %str, align 8, !dbg !46
  call void @_001_good(i8* %0), !dbg !47
  ret void, !dbg !48
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !49 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @good(), !dbg !53
  call void @bad(), !dbg !54
  ret i32 0, !dbg !55
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4}
!llvm.ident = !{!5}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (tags/RELEASE_390/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2)
!1 = !DIFile(filename: "457_uninit_memory_access_3.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/itc/457")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{!"clang version 3.9.0 (tags/RELEASE_390/final)"}
!6 = distinct !DISubprogram(name: "_001_bad", scope: !7, file: !7, line: 8, type: !8, isLocal: false, isDefinition: true, scopeLine: 8, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!7 = !DIFile(filename: "./457_uninit_memory_access_3.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/itc/457")
!8 = !DISubroutineType(types: !9)
!9 = !{null, !10}
!10 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !11, size: 64, align: 64)
!11 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !12)
!12 = !DIBasicType(name: "char", size: 8, align: 8, encoding: DW_ATE_signed_char)
!13 = !DILocalVariable(name: "msg", arg: 1, scope: !6, file: !7, line: 8, type: !10)
!14 = !DIExpression()
!15 = !DILocation(line: 8, column: 27, scope: !6)
!16 = !DILocalVariable(name: "error_log", scope: !6, file: !7, line: 9, type: !10)
!17 = !DILocation(line: 9, column: 15, scope: !6)
!18 = !DILocation(line: 9, column: 27, scope: !6)
!19 = !DILocalVariable(name: "buffer", scope: !6, file: !7, line: 10, type: !20)
!20 = !DICompositeType(tag: DW_TAG_array_type, baseType: !12, size: 192, align: 8, elements: !21)
!21 = !{!22}
!22 = !DISubrange(count: 24)
!23 = !DILocation(line: 10, column: 8, scope: !6)
!24 = !DILocation(line: 12, column: 1, scope: !6)
!25 = distinct !DISubprogram(name: "bad", scope: !7, file: !7, line: 13, type: !26, isLocal: false, isDefinition: true, scopeLine: 14, isOptimized: false, unit: !0, variables: !2)
!26 = !DISubroutineType(types: !27)
!27 = !{null}
!28 = !DILocalVariable(name: "str", scope: !25, file: !7, line: 15, type: !29)
!29 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !12, size: 64, align: 64)
!30 = !DILocation(line: 15, column: 8, scope: !25)
!31 = !DILocation(line: 16, column: 11, scope: !25)
!32 = !DILocation(line: 16, column: 2, scope: !25)
!33 = !DILocation(line: 17, column: 1, scope: !25)
!34 = distinct !DISubprogram(name: "_001_good", scope: !7, file: !7, line: 22, type: !8, isLocal: false, isDefinition: true, scopeLine: 22, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!35 = !DILocalVariable(name: "msg", arg: 1, scope: !34, file: !7, line: 22, type: !10)
!36 = !DILocation(line: 22, column: 28, scope: !34)
!37 = !DILocalVariable(name: "error_log", scope: !34, file: !7, line: 23, type: !10)
!38 = !DILocation(line: 23, column: 15, scope: !34)
!39 = !DILocation(line: 23, column: 27, scope: !34)
!40 = !DILocalVariable(name: "buffer", scope: !34, file: !7, line: 24, type: !20)
!41 = !DILocation(line: 24, column: 8, scope: !34)
!42 = !DILocation(line: 26, column: 1, scope: !34)
!43 = distinct !DISubprogram(name: "good", scope: !7, file: !7, line: 27, type: !26, isLocal: false, isDefinition: true, scopeLine: 28, isOptimized: false, unit: !0, variables: !2)
!44 = !DILocalVariable(name: "str", scope: !43, file: !7, line: 29, type: !29)
!45 = !DILocation(line: 29, column: 8, scope: !43)
!46 = !DILocation(line: 30, column: 12, scope: !43)
!47 = !DILocation(line: 30, column: 2, scope: !43)
!48 = !DILocation(line: 31, column: 1, scope: !43)
!49 = distinct !DISubprogram(name: "main", scope: !7, file: !7, line: 33, type: !50, isLocal: false, isDefinition: true, scopeLine: 33, isOptimized: false, unit: !0, variables: !2)
!50 = !DISubroutineType(types: !51)
!51 = !{!52}
!52 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!53 = !DILocation(line: 34, column: 3, scope: !49)
!54 = !DILocation(line: 35, column: 2, scope: !49)
!55 = !DILocation(line: 36, column: 2, scope: !49)
