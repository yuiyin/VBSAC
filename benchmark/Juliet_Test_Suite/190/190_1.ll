; ModuleID = './190_1.c'
source_filename = "./190_1.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@stdin = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [3 x i8] c"%c\00", align 1

; Function Attrs: nounwind uwtable
define void @printHexCharLine(i8 signext %charHex) #0 !dbg !8 {
entry:
  %charHex.addr = alloca i8, align 1
  store i8 %charHex, i8* %charHex.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %charHex.addr, metadata !13, metadata !14), !dbg !15
  %0 = load i8, i8* %charHex.addr, align 1, !dbg !16
  %conv = sext i8 %0 to i32, !dbg !17
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), i32 %conv), !dbg !18
  ret void, !dbg !19
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @printf(i8*, ...) #2

; Function Attrs: nounwind uwtable
define void @bad1() #0 !dbg !20 {
entry:
  %data = alloca i8, align 1
  %result = alloca i8, align 1
  call void @llvm.dbg.declare(metadata i8* %data, metadata !23, metadata !14), !dbg !24
  store i8 32, i8* %data, align 1, !dbg !25
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !26
  %call = call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* %0, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.1, i32 0, i32 0), i8* %data), !dbg !27
  call void @llvm.dbg.declare(metadata i8* %result, metadata !28, metadata !14), !dbg !30
  %1 = load i8, i8* %data, align 1, !dbg !31
  %conv = sext i8 %1 to i32, !dbg !31
  %add = add nsw i32 %conv, 1, !dbg !32
  %conv1 = trunc i32 %add to i8, !dbg !31
  store i8 %conv1, i8* %result, align 1, !dbg !30
  %2 = load i8, i8* %result, align 1, !dbg !33
  call void @printHexCharLine(i8 signext %2), !dbg !34
  ret void, !dbg !35
}

declare i32 @__isoc99_fscanf(%struct._IO_FILE*, i8*, ...) #2

; Function Attrs: nounwind uwtable
define void @good1() #0 !dbg !36 {
entry:
  %data = alloca i8, align 1
  %result = alloca i8, align 1
  call void @llvm.dbg.declare(metadata i8* %data, metadata !37, metadata !14), !dbg !38
  store i8 32, i8* %data, align 1, !dbg !39
  store i8 2, i8* %data, align 1, !dbg !40
  call void @llvm.dbg.declare(metadata i8* %result, metadata !41, metadata !14), !dbg !43
  %0 = load i8, i8* %data, align 1, !dbg !44
  %conv = sext i8 %0 to i32, !dbg !44
  %add = add nsw i32 %conv, 1, !dbg !45
  %conv1 = trunc i32 %add to i8, !dbg !44
  store i8 %conv1, i8* %result, align 1, !dbg !43
  %1 = load i8, i8* %result, align 1, !dbg !46
  call void @printHexCharLine(i8 signext %1), !dbg !47
  ret void, !dbg !48
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !49 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @good1(), !dbg !51
  call void @bad1(), !dbg !52
  ret i32 1, !dbg !53
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6}
!llvm.ident = !{!7}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (tags/RELEASE_390/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3)
!1 = !DIFile(filename: "190_1.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/190")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!5 = !{i32 2, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{!"clang version 3.9.0 (tags/RELEASE_390/final)"}
!8 = distinct !DISubprogram(name: "printHexCharLine", scope: !9, file: !9, line: 10, type: !10, isLocal: false, isDefinition: true, scopeLine: 11, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!9 = !DIFile(filename: "./190_1.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/190")
!10 = !DISubroutineType(types: !11)
!11 = !{null, !12}
!12 = !DIBasicType(name: "char", size: 8, align: 8, encoding: DW_ATE_signed_char)
!13 = !DILocalVariable(name: "charHex", arg: 1, scope: !8, file: !9, line: 10, type: !12)
!14 = !DIExpression()
!15 = !DILocation(line: 10, column: 29, scope: !8)
!16 = !DILocation(line: 12, column: 25, scope: !8)
!17 = !DILocation(line: 12, column: 20, scope: !8)
!18 = !DILocation(line: 12, column: 5, scope: !8)
!19 = !DILocation(line: 13, column: 1, scope: !8)
!20 = distinct !DISubprogram(name: "bad1", scope: !9, file: !9, line: 15, type: !21, isLocal: false, isDefinition: true, scopeLine: 16, isOptimized: false, unit: !0, variables: !2)
!21 = !DISubroutineType(types: !22)
!22 = !{null}
!23 = !DILocalVariable(name: "data", scope: !20, file: !9, line: 17, type: !12)
!24 = !DILocation(line: 17, column: 10, scope: !20)
!25 = !DILocation(line: 18, column: 10, scope: !20)
!26 = !DILocation(line: 20, column: 13, scope: !20)
!27 = !DILocation(line: 20, column: 5, scope: !20)
!28 = !DILocalVariable(name: "result", scope: !29, file: !9, line: 23, type: !12)
!29 = distinct !DILexicalBlock(scope: !20, file: !9, line: 21, column: 5)
!30 = !DILocation(line: 23, column: 14, scope: !29)
!31 = !DILocation(line: 23, column: 23, scope: !29)
!32 = !DILocation(line: 23, column: 28, scope: !29)
!33 = !DILocation(line: 24, column: 26, scope: !29)
!34 = !DILocation(line: 24, column: 9, scope: !29)
!35 = !DILocation(line: 26, column: 1, scope: !20)
!36 = distinct !DISubprogram(name: "good1", scope: !9, file: !9, line: 28, type: !21, isLocal: false, isDefinition: true, scopeLine: 29, isOptimized: false, unit: !0, variables: !2)
!37 = !DILocalVariable(name: "data", scope: !36, file: !9, line: 30, type: !12)
!38 = !DILocation(line: 30, column: 10, scope: !36)
!39 = !DILocation(line: 31, column: 10, scope: !36)
!40 = !DILocation(line: 33, column: 10, scope: !36)
!41 = !DILocalVariable(name: "result", scope: !42, file: !9, line: 36, type: !12)
!42 = distinct !DILexicalBlock(scope: !36, file: !9, line: 34, column: 5)
!43 = !DILocation(line: 36, column: 14, scope: !42)
!44 = !DILocation(line: 36, column: 23, scope: !42)
!45 = !DILocation(line: 36, column: 28, scope: !42)
!46 = !DILocation(line: 37, column: 26, scope: !42)
!47 = !DILocation(line: 37, column: 9, scope: !42)
!48 = !DILocation(line: 39, column: 1, scope: !36)
!49 = distinct !DISubprogram(name: "main", scope: !9, file: !9, line: 41, type: !50, isLocal: false, isDefinition: true, scopeLine: 41, isOptimized: false, unit: !0, variables: !2)
!50 = !DISubroutineType(types: !3)
!51 = !DILocation(line: 42, column: 2, scope: !49)
!52 = !DILocation(line: 43, column: 5, scope: !49)
!53 = !DILocation(line: 44, column: 5, scope: !49)
