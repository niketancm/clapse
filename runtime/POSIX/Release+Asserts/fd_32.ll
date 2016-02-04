; ModuleID = 'fd_32.c'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:32:64-f32:32:32-f64:32:64-v64:64:64-v128:128:128-a0:0:64-f80:32:32-f128:128:128-n8:16:32"
target triple = "i386-pc-linux-gnu"

%struct.__fsid_t = type { [2 x i32] }
%struct.dirent = type { i32, i32, i16, i8, [256 x i8] }
%struct.dirent64 = type { i64, i64, i16, i8, [256 x i8] }
%struct.stat = type { i64, i16, i32, i32, i32, i32, i32, i64, i16, i32, i32, i32, %struct.timespec, %struct.timespec, %struct.timespec, i32, i32 }
%struct.stat64 = type { i64, i32, i32, i32, i32, i32, i32, i64, i32, i64, i32, i64, %struct.timespec, %struct.timespec, %struct.timespec, i64 }
%struct.statfs = type { i32, i32, i32, i32, i32, i32, i32, %struct.__fsid_t, i32, i32, [5 x i32] }
%struct.timespec = type { i32, i32 }

@__getdents = alias i32 (i32, %struct.dirent*, i32)* @getdents

define i32 @open(i8* %pathname, i32 %flags, ...) nounwind {
entry:
  %ap = alloca i8*, align 4
  call void @llvm.dbg.value(metadata !{i8* %pathname}, i64 0, metadata !217), !dbg !246
  call void @llvm.dbg.value(metadata !{i32 %flags}, i64 0, metadata !218), !dbg !246
  call void @llvm.dbg.value(metadata !247, i64 0, metadata !219), !dbg !248
  %0 = and i32 %flags, 64, !dbg !249
  %1 = icmp eq i32 %0, 0, !dbg !249
  br i1 %1, label %bb3, label %bb, !dbg !249

bb:                                               ; preds = %entry
  call void @llvm.dbg.declare(metadata !{i8** %ap}, metadata !221), !dbg !250
  %ap1 = bitcast i8** %ap to i8*, !dbg !251
  call void @llvm.va_start(i8* %ap1), !dbg !251
  %2 = load i8** %ap, align 4, !dbg !252
  %3 = getelementptr inbounds i8* %2, i32 4, !dbg !252
  store i8* %3, i8** %ap, align 4, !dbg !252
  %4 = bitcast i8* %2 to i32*, !dbg !252
  %5 = load i32* %4, align 4, !dbg !252
  call void @llvm.dbg.value(metadata !{i32 %5}, i64 0, metadata !219), !dbg !252
  call void @llvm.va_end(i8* %ap1), !dbg !253
  br label %bb3, !dbg !253

bb3:                                              ; preds = %entry, %bb
  %mode.0 = phi i32 [ %5, %bb ], [ 0, %entry ]
  %6 = call i32 @__fd_open(i8* %pathname, i32 %flags, i32 %mode.0) nounwind, !dbg !254
  ret i32 %6, !dbg !254
}

declare void @llvm.dbg.declare(metadata, metadata) nounwind readnone

declare void @llvm.dbg.value(metadata, i64, metadata) nounwind readnone

define weak i32 @fstat64(i32 %fd, %struct.stat64* %buf) nounwind {
entry:
  tail call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !162), !dbg !255
  tail call void @llvm.dbg.value(metadata !{%struct.stat64* %buf}, i64 0, metadata !163), !dbg !255
  %0 = tail call i32 @__fd_fstat(i32 %fd, %struct.stat64* %buf) nounwind, !dbg !256
  ret i32 %0, !dbg !256
}

declare i32 @__fd_fstat(i32, %struct.stat64*)

define i32 @fstat(i32 %fd, %struct.stat* nocapture %buf) nounwind {
entry:
  %tmp = alloca %struct.stat64, align 8
  call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !164), !dbg !258
  call void @llvm.dbg.value(metadata !{%struct.stat* %buf}, i64 0, metadata !165), !dbg !258
  call void @llvm.dbg.declare(metadata !{%struct.stat64* %tmp}, metadata !166), !dbg !259
  %0 = call i32 @__fd_fstat(i32 %fd, %struct.stat64* %tmp) nounwind, !dbg !260
  call void @llvm.dbg.value(metadata !{i32 %0}, i64 0, metadata !168), !dbg !260
  tail call void @llvm.dbg.value(metadata !{%struct.stat64* %tmp}, i64 0, metadata !160), !dbg !261
  tail call void @llvm.dbg.value(metadata !{%struct.stat* %buf}, i64 0, metadata !161), !dbg !261
  %1 = getelementptr inbounds %struct.stat64* %tmp, i32 0, i32 0, !dbg !263
  %2 = load i64* %1, align 8, !dbg !263
  %3 = getelementptr inbounds %struct.stat* %buf, i32 0, i32 0, !dbg !263
  store i64 %2, i64* %3, align 4, !dbg !263
  %4 = getelementptr inbounds %struct.stat64* %tmp, i32 0, i32 15, !dbg !265
  %5 = load i64* %4, align 8, !dbg !265
  %6 = trunc i64 %5 to i32, !dbg !265
  %7 = getelementptr inbounds %struct.stat* %buf, i32 0, i32 2, !dbg !265
  store i32 %6, i32* %7, align 4, !dbg !265
  %8 = getelementptr inbounds %struct.stat64* %tmp, i32 0, i32 3, !dbg !266
  %9 = load i32* %8, align 8, !dbg !266
  %10 = getelementptr inbounds %struct.stat* %buf, i32 0, i32 3, !dbg !266
  store i32 %9, i32* %10, align 4, !dbg !266
  %11 = getelementptr inbounds %struct.stat64* %tmp, i32 0, i32 4, !dbg !267
  %12 = load i32* %11, align 4, !dbg !267
  %13 = getelementptr inbounds %struct.stat* %buf, i32 0, i32 4, !dbg !267
  store i32 %12, i32* %13, align 4, !dbg !267
  %14 = getelementptr inbounds %struct.stat64* %tmp, i32 0, i32 5, !dbg !268
  %15 = load i32* %14, align 8, !dbg !268
  %16 = getelementptr inbounds %struct.stat* %buf, i32 0, i32 5, !dbg !268
  store i32 %15, i32* %16, align 4, !dbg !268
  %17 = getelementptr inbounds %struct.stat64* %tmp, i32 0, i32 6, !dbg !269
  %18 = load i32* %17, align 4, !dbg !269
  %19 = getelementptr inbounds %struct.stat* %buf, i32 0, i32 6, !dbg !269
  store i32 %18, i32* %19, align 4, !dbg !269
  %20 = getelementptr inbounds %struct.stat64* %tmp, i32 0, i32 7, !dbg !270
  %21 = load i64* %20, align 8, !dbg !270
  %22 = getelementptr inbounds %struct.stat* %buf, i32 0, i32 7, !dbg !270
  store i64 %21, i64* %22, align 4, !dbg !270
  %23 = getelementptr inbounds %struct.stat64* %tmp, i32 0, i32 9, !dbg !271
  %24 = load i64* %23, align 4, !dbg !271
  %25 = trunc i64 %24 to i32, !dbg !271
  %26 = getelementptr inbounds %struct.stat* %buf, i32 0, i32 9, !dbg !271
  store i32 %25, i32* %26, align 4, !dbg !271
  %27 = getelementptr inbounds %struct.stat64* %tmp, i32 0, i32 12, i32 0, !dbg !272
  %28 = load i32* %27, align 8, !dbg !272
  %29 = getelementptr inbounds %struct.stat* %buf, i32 0, i32 12, i32 0, !dbg !272
  store i32 %28, i32* %29, align 4, !dbg !272
  %30 = getelementptr inbounds %struct.stat64* %tmp, i32 0, i32 13, i32 0, !dbg !273
  %31 = load i32* %30, align 8, !dbg !273
  %32 = getelementptr inbounds %struct.stat* %buf, i32 0, i32 13, i32 0, !dbg !273
  store i32 %31, i32* %32, align 4, !dbg !273
  %33 = getelementptr inbounds %struct.stat64* %tmp, i32 0, i32 14, i32 0, !dbg !274
  %34 = load i32* %33, align 8, !dbg !274
  %35 = getelementptr inbounds %struct.stat* %buf, i32 0, i32 14, i32 0, !dbg !274
  store i32 %34, i32* %35, align 4, !dbg !274
  %36 = getelementptr inbounds %struct.stat64* %tmp, i32 0, i32 10, !dbg !275
  %37 = load i32* %36, align 4, !dbg !275
  %38 = getelementptr inbounds %struct.stat* %buf, i32 0, i32 10, !dbg !275
  store i32 %37, i32* %38, align 4, !dbg !275
  %39 = getelementptr inbounds %struct.stat64* %tmp, i32 0, i32 11, !dbg !276
  %40 = load i64* %39, align 8, !dbg !276
  %41 = trunc i64 %40 to i32, !dbg !276
  %42 = getelementptr inbounds %struct.stat* %buf, i32 0, i32 11, !dbg !276
  store i32 %41, i32* %42, align 4, !dbg !276
  ret i32 %0, !dbg !277
}

define i32 @__fxstat(i32 %vers, i32 %fd, %struct.stat* nocapture %buf) nounwind {
entry:
  %tmp = alloca %struct.stat64, align 8
  call void @llvm.dbg.value(metadata !{i32 %vers}, i64 0, metadata !169), !dbg !278
  call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !170), !dbg !278
  call void @llvm.dbg.value(metadata !{%struct.stat* %buf}, i64 0, metadata !171), !dbg !278
  call void @llvm.dbg.declare(metadata !{%struct.stat64* %tmp}, metadata !172), !dbg !279
  %0 = call i32 @__fd_fstat(i32 %fd, %struct.stat64* %tmp) nounwind, !dbg !280
  call void @llvm.dbg.value(metadata !{i32 %0}, i64 0, metadata !174), !dbg !280
  tail call void @llvm.dbg.value(metadata !{%struct.stat64* %tmp}, i64 0, metadata !160), !dbg !281
  tail call void @llvm.dbg.value(metadata !{%struct.stat* %buf}, i64 0, metadata !161), !dbg !281
  %1 = getelementptr inbounds %struct.stat64* %tmp, i32 0, i32 0, !dbg !283
  %2 = load i64* %1, align 8, !dbg !283
  %3 = getelementptr inbounds %struct.stat* %buf, i32 0, i32 0, !dbg !283
  store i64 %2, i64* %3, align 4, !dbg !283
  %4 = getelementptr inbounds %struct.stat64* %tmp, i32 0, i32 15, !dbg !284
  %5 = load i64* %4, align 8, !dbg !284
  %6 = trunc i64 %5 to i32, !dbg !284
  %7 = getelementptr inbounds %struct.stat* %buf, i32 0, i32 2, !dbg !284
  store i32 %6, i32* %7, align 4, !dbg !284
  %8 = getelementptr inbounds %struct.stat64* %tmp, i32 0, i32 3, !dbg !285
  %9 = load i32* %8, align 8, !dbg !285
  %10 = getelementptr inbounds %struct.stat* %buf, i32 0, i32 3, !dbg !285
  store i32 %9, i32* %10, align 4, !dbg !285
  %11 = getelementptr inbounds %struct.stat64* %tmp, i32 0, i32 4, !dbg !286
  %12 = load i32* %11, align 4, !dbg !286
  %13 = getelementptr inbounds %struct.stat* %buf, i32 0, i32 4, !dbg !286
  store i32 %12, i32* %13, align 4, !dbg !286
  %14 = getelementptr inbounds %struct.stat64* %tmp, i32 0, i32 5, !dbg !287
  %15 = load i32* %14, align 8, !dbg !287
  %16 = getelementptr inbounds %struct.stat* %buf, i32 0, i32 5, !dbg !287
  store i32 %15, i32* %16, align 4, !dbg !287
  %17 = getelementptr inbounds %struct.stat64* %tmp, i32 0, i32 6, !dbg !288
  %18 = load i32* %17, align 4, !dbg !288
  %19 = getelementptr inbounds %struct.stat* %buf, i32 0, i32 6, !dbg !288
  store i32 %18, i32* %19, align 4, !dbg !288
  %20 = getelementptr inbounds %struct.stat64* %tmp, i32 0, i32 7, !dbg !289
  %21 = load i64* %20, align 8, !dbg !289
  %22 = getelementptr inbounds %struct.stat* %buf, i32 0, i32 7, !dbg !289
  store i64 %21, i64* %22, align 4, !dbg !289
  %23 = getelementptr inbounds %struct.stat64* %tmp, i32 0, i32 9, !dbg !290
  %24 = load i64* %23, align 4, !dbg !290
  %25 = trunc i64 %24 to i32, !dbg !290
  %26 = getelementptr inbounds %struct.stat* %buf, i32 0, i32 9, !dbg !290
  store i32 %25, i32* %26, align 4, !dbg !290
  %27 = getelementptr inbounds %struct.stat64* %tmp, i32 0, i32 12, i32 0, !dbg !291
  %28 = load i32* %27, align 8, !dbg !291
  %29 = getelementptr inbounds %struct.stat* %buf, i32 0, i32 12, i32 0, !dbg !291
  store i32 %28, i32* %29, align 4, !dbg !291
  %30 = getelementptr inbounds %struct.stat64* %tmp, i32 0, i32 13, i32 0, !dbg !292
  %31 = load i32* %30, align 8, !dbg !292
  %32 = getelementptr inbounds %struct.stat* %buf, i32 0, i32 13, i32 0, !dbg !292
  store i32 %31, i32* %32, align 4, !dbg !292
  %33 = getelementptr inbounds %struct.stat64* %tmp, i32 0, i32 14, i32 0, !dbg !293
  %34 = load i32* %33, align 8, !dbg !293
  %35 = getelementptr inbounds %struct.stat* %buf, i32 0, i32 14, i32 0, !dbg !293
  store i32 %34, i32* %35, align 4, !dbg !293
  %36 = getelementptr inbounds %struct.stat64* %tmp, i32 0, i32 10, !dbg !294
  %37 = load i32* %36, align 4, !dbg !294
  %38 = getelementptr inbounds %struct.stat* %buf, i32 0, i32 10, !dbg !294
  store i32 %37, i32* %38, align 4, !dbg !294
  %39 = getelementptr inbounds %struct.stat64* %tmp, i32 0, i32 11, !dbg !295
  %40 = load i64* %39, align 8, !dbg !295
  %41 = trunc i64 %40 to i32, !dbg !295
  %42 = getelementptr inbounds %struct.stat* %buf, i32 0, i32 11, !dbg !295
  store i32 %41, i32* %42, align 4, !dbg !295
  ret i32 %0, !dbg !296
}

define weak i32 @lstat64(i8* %path, %struct.stat64* %buf) nounwind {
entry:
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !175), !dbg !297
  tail call void @llvm.dbg.value(metadata !{%struct.stat64* %buf}, i64 0, metadata !176), !dbg !297
  %0 = tail call i32 @__fd_lstat(i8* %path, %struct.stat64* %buf) nounwind, !dbg !298
  ret i32 %0, !dbg !298
}

declare i32 @__fd_lstat(i8*, %struct.stat64*)

define i32 @lstat(i8* %path, %struct.stat* nocapture %buf) nounwind {
entry:
  %tmp = alloca %struct.stat64, align 8
  call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !177), !dbg !300
  call void @llvm.dbg.value(metadata !{%struct.stat* %buf}, i64 0, metadata !178), !dbg !300
  call void @llvm.dbg.declare(metadata !{%struct.stat64* %tmp}, metadata !179), !dbg !301
  %0 = call i32 @__fd_lstat(i8* %path, %struct.stat64* %tmp) nounwind, !dbg !302
  call void @llvm.dbg.value(metadata !{i32 %0}, i64 0, metadata !181), !dbg !302
  tail call void @llvm.dbg.value(metadata !{%struct.stat64* %tmp}, i64 0, metadata !160), !dbg !303
  tail call void @llvm.dbg.value(metadata !{%struct.stat* %buf}, i64 0, metadata !161), !dbg !303
  %1 = getelementptr inbounds %struct.stat64* %tmp, i32 0, i32 0, !dbg !305
  %2 = load i64* %1, align 8, !dbg !305
  %3 = getelementptr inbounds %struct.stat* %buf, i32 0, i32 0, !dbg !305
  store i64 %2, i64* %3, align 4, !dbg !305
  %4 = getelementptr inbounds %struct.stat64* %tmp, i32 0, i32 15, !dbg !306
  %5 = load i64* %4, align 8, !dbg !306
  %6 = trunc i64 %5 to i32, !dbg !306
  %7 = getelementptr inbounds %struct.stat* %buf, i32 0, i32 2, !dbg !306
  store i32 %6, i32* %7, align 4, !dbg !306
  %8 = getelementptr inbounds %struct.stat64* %tmp, i32 0, i32 3, !dbg !307
  %9 = load i32* %8, align 8, !dbg !307
  %10 = getelementptr inbounds %struct.stat* %buf, i32 0, i32 3, !dbg !307
  store i32 %9, i32* %10, align 4, !dbg !307
  %11 = getelementptr inbounds %struct.stat64* %tmp, i32 0, i32 4, !dbg !308
  %12 = load i32* %11, align 4, !dbg !308
  %13 = getelementptr inbounds %struct.stat* %buf, i32 0, i32 4, !dbg !308
  store i32 %12, i32* %13, align 4, !dbg !308
  %14 = getelementptr inbounds %struct.stat64* %tmp, i32 0, i32 5, !dbg !309
  %15 = load i32* %14, align 8, !dbg !309
  %16 = getelementptr inbounds %struct.stat* %buf, i32 0, i32 5, !dbg !309
  store i32 %15, i32* %16, align 4, !dbg !309
  %17 = getelementptr inbounds %struct.stat64* %tmp, i32 0, i32 6, !dbg !310
  %18 = load i32* %17, align 4, !dbg !310
  %19 = getelementptr inbounds %struct.stat* %buf, i32 0, i32 6, !dbg !310
  store i32 %18, i32* %19, align 4, !dbg !310
  %20 = getelementptr inbounds %struct.stat64* %tmp, i32 0, i32 7, !dbg !311
  %21 = load i64* %20, align 8, !dbg !311
  %22 = getelementptr inbounds %struct.stat* %buf, i32 0, i32 7, !dbg !311
  store i64 %21, i64* %22, align 4, !dbg !311
  %23 = getelementptr inbounds %struct.stat64* %tmp, i32 0, i32 9, !dbg !312
  %24 = load i64* %23, align 4, !dbg !312
  %25 = trunc i64 %24 to i32, !dbg !312
  %26 = getelementptr inbounds %struct.stat* %buf, i32 0, i32 9, !dbg !312
  store i32 %25, i32* %26, align 4, !dbg !312
  %27 = getelementptr inbounds %struct.stat64* %tmp, i32 0, i32 12, i32 0, !dbg !313
  %28 = load i32* %27, align 8, !dbg !313
  %29 = getelementptr inbounds %struct.stat* %buf, i32 0, i32 12, i32 0, !dbg !313
  store i32 %28, i32* %29, align 4, !dbg !313
  %30 = getelementptr inbounds %struct.stat64* %tmp, i32 0, i32 13, i32 0, !dbg !314
  %31 = load i32* %30, align 8, !dbg !314
  %32 = getelementptr inbounds %struct.stat* %buf, i32 0, i32 13, i32 0, !dbg !314
  store i32 %31, i32* %32, align 4, !dbg !314
  %33 = getelementptr inbounds %struct.stat64* %tmp, i32 0, i32 14, i32 0, !dbg !315
  %34 = load i32* %33, align 8, !dbg !315
  %35 = getelementptr inbounds %struct.stat* %buf, i32 0, i32 14, i32 0, !dbg !315
  store i32 %34, i32* %35, align 4, !dbg !315
  %36 = getelementptr inbounds %struct.stat64* %tmp, i32 0, i32 10, !dbg !316
  %37 = load i32* %36, align 4, !dbg !316
  %38 = getelementptr inbounds %struct.stat* %buf, i32 0, i32 10, !dbg !316
  store i32 %37, i32* %38, align 4, !dbg !316
  %39 = getelementptr inbounds %struct.stat64* %tmp, i32 0, i32 11, !dbg !317
  %40 = load i64* %39, align 8, !dbg !317
  %41 = trunc i64 %40 to i32, !dbg !317
  %42 = getelementptr inbounds %struct.stat* %buf, i32 0, i32 11, !dbg !317
  store i32 %41, i32* %42, align 4, !dbg !317
  ret i32 %0, !dbg !318
}

define i32 @__lxstat(i32 %vers, i8* %path, %struct.stat* nocapture %buf) nounwind {
entry:
  %tmp = alloca %struct.stat64, align 8
  call void @llvm.dbg.value(metadata !{i32 %vers}, i64 0, metadata !182), !dbg !319
  call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !183), !dbg !319
  call void @llvm.dbg.value(metadata !{%struct.stat* %buf}, i64 0, metadata !184), !dbg !319
  call void @llvm.dbg.declare(metadata !{%struct.stat64* %tmp}, metadata !185), !dbg !320
  %0 = call i32 @__fd_lstat(i8* %path, %struct.stat64* %tmp) nounwind, !dbg !321
  call void @llvm.dbg.value(metadata !{i32 %0}, i64 0, metadata !187), !dbg !321
  tail call void @llvm.dbg.value(metadata !{%struct.stat64* %tmp}, i64 0, metadata !160), !dbg !322
  tail call void @llvm.dbg.value(metadata !{%struct.stat* %buf}, i64 0, metadata !161), !dbg !322
  %1 = getelementptr inbounds %struct.stat64* %tmp, i32 0, i32 0, !dbg !324
  %2 = load i64* %1, align 8, !dbg !324
  %3 = getelementptr inbounds %struct.stat* %buf, i32 0, i32 0, !dbg !324
  store i64 %2, i64* %3, align 4, !dbg !324
  %4 = getelementptr inbounds %struct.stat64* %tmp, i32 0, i32 15, !dbg !325
  %5 = load i64* %4, align 8, !dbg !325
  %6 = trunc i64 %5 to i32, !dbg !325
  %7 = getelementptr inbounds %struct.stat* %buf, i32 0, i32 2, !dbg !325
  store i32 %6, i32* %7, align 4, !dbg !325
  %8 = getelementptr inbounds %struct.stat64* %tmp, i32 0, i32 3, !dbg !326
  %9 = load i32* %8, align 8, !dbg !326
  %10 = getelementptr inbounds %struct.stat* %buf, i32 0, i32 3, !dbg !326
  store i32 %9, i32* %10, align 4, !dbg !326
  %11 = getelementptr inbounds %struct.stat64* %tmp, i32 0, i32 4, !dbg !327
  %12 = load i32* %11, align 4, !dbg !327
  %13 = getelementptr inbounds %struct.stat* %buf, i32 0, i32 4, !dbg !327
  store i32 %12, i32* %13, align 4, !dbg !327
  %14 = getelementptr inbounds %struct.stat64* %tmp, i32 0, i32 5, !dbg !328
  %15 = load i32* %14, align 8, !dbg !328
  %16 = getelementptr inbounds %struct.stat* %buf, i32 0, i32 5, !dbg !328
  store i32 %15, i32* %16, align 4, !dbg !328
  %17 = getelementptr inbounds %struct.stat64* %tmp, i32 0, i32 6, !dbg !329
  %18 = load i32* %17, align 4, !dbg !329
  %19 = getelementptr inbounds %struct.stat* %buf, i32 0, i32 6, !dbg !329
  store i32 %18, i32* %19, align 4, !dbg !329
  %20 = getelementptr inbounds %struct.stat64* %tmp, i32 0, i32 7, !dbg !330
  %21 = load i64* %20, align 8, !dbg !330
  %22 = getelementptr inbounds %struct.stat* %buf, i32 0, i32 7, !dbg !330
  store i64 %21, i64* %22, align 4, !dbg !330
  %23 = getelementptr inbounds %struct.stat64* %tmp, i32 0, i32 9, !dbg !331
  %24 = load i64* %23, align 4, !dbg !331
  %25 = trunc i64 %24 to i32, !dbg !331
  %26 = getelementptr inbounds %struct.stat* %buf, i32 0, i32 9, !dbg !331
  store i32 %25, i32* %26, align 4, !dbg !331
  %27 = getelementptr inbounds %struct.stat64* %tmp, i32 0, i32 12, i32 0, !dbg !332
  %28 = load i32* %27, align 8, !dbg !332
  %29 = getelementptr inbounds %struct.stat* %buf, i32 0, i32 12, i32 0, !dbg !332
  store i32 %28, i32* %29, align 4, !dbg !332
  %30 = getelementptr inbounds %struct.stat64* %tmp, i32 0, i32 13, i32 0, !dbg !333
  %31 = load i32* %30, align 8, !dbg !333
  %32 = getelementptr inbounds %struct.stat* %buf, i32 0, i32 13, i32 0, !dbg !333
  store i32 %31, i32* %32, align 4, !dbg !333
  %33 = getelementptr inbounds %struct.stat64* %tmp, i32 0, i32 14, i32 0, !dbg !334
  %34 = load i32* %33, align 8, !dbg !334
  %35 = getelementptr inbounds %struct.stat* %buf, i32 0, i32 14, i32 0, !dbg !334
  store i32 %34, i32* %35, align 4, !dbg !334
  %36 = getelementptr inbounds %struct.stat64* %tmp, i32 0, i32 10, !dbg !335
  %37 = load i32* %36, align 4, !dbg !335
  %38 = getelementptr inbounds %struct.stat* %buf, i32 0, i32 10, !dbg !335
  store i32 %37, i32* %38, align 4, !dbg !335
  %39 = getelementptr inbounds %struct.stat64* %tmp, i32 0, i32 11, !dbg !336
  %40 = load i64* %39, align 8, !dbg !336
  %41 = trunc i64 %40 to i32, !dbg !336
  %42 = getelementptr inbounds %struct.stat* %buf, i32 0, i32 11, !dbg !336
  store i32 %41, i32* %42, align 4, !dbg !336
  ret i32 %0, !dbg !337
}

define weak i32 @stat64(i8* %path, %struct.stat64* %buf) nounwind {
entry:
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !188), !dbg !338
  tail call void @llvm.dbg.value(metadata !{%struct.stat64* %buf}, i64 0, metadata !189), !dbg !338
  %0 = tail call i32 @__fd_stat(i8* %path, %struct.stat64* %buf) nounwind, !dbg !339
  ret i32 %0, !dbg !339
}

declare i32 @__fd_stat(i8*, %struct.stat64*)

define i32 @stat(i8* %path, %struct.stat* nocapture %buf) nounwind {
entry:
  %tmp = alloca %struct.stat64, align 8
  call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !190), !dbg !341
  call void @llvm.dbg.value(metadata !{%struct.stat* %buf}, i64 0, metadata !191), !dbg !341
  call void @llvm.dbg.declare(metadata !{%struct.stat64* %tmp}, metadata !192), !dbg !342
  %0 = call i32 @__fd_stat(i8* %path, %struct.stat64* %tmp) nounwind, !dbg !343
  call void @llvm.dbg.value(metadata !{i32 %0}, i64 0, metadata !194), !dbg !343
  tail call void @llvm.dbg.value(metadata !{%struct.stat64* %tmp}, i64 0, metadata !160), !dbg !344
  tail call void @llvm.dbg.value(metadata !{%struct.stat* %buf}, i64 0, metadata !161), !dbg !344
  %1 = getelementptr inbounds %struct.stat64* %tmp, i32 0, i32 0, !dbg !346
  %2 = load i64* %1, align 8, !dbg !346
  %3 = getelementptr inbounds %struct.stat* %buf, i32 0, i32 0, !dbg !346
  store i64 %2, i64* %3, align 4, !dbg !346
  %4 = getelementptr inbounds %struct.stat64* %tmp, i32 0, i32 15, !dbg !347
  %5 = load i64* %4, align 8, !dbg !347
  %6 = trunc i64 %5 to i32, !dbg !347
  %7 = getelementptr inbounds %struct.stat* %buf, i32 0, i32 2, !dbg !347
  store i32 %6, i32* %7, align 4, !dbg !347
  %8 = getelementptr inbounds %struct.stat64* %tmp, i32 0, i32 3, !dbg !348
  %9 = load i32* %8, align 8, !dbg !348
  %10 = getelementptr inbounds %struct.stat* %buf, i32 0, i32 3, !dbg !348
  store i32 %9, i32* %10, align 4, !dbg !348
  %11 = getelementptr inbounds %struct.stat64* %tmp, i32 0, i32 4, !dbg !349
  %12 = load i32* %11, align 4, !dbg !349
  %13 = getelementptr inbounds %struct.stat* %buf, i32 0, i32 4, !dbg !349
  store i32 %12, i32* %13, align 4, !dbg !349
  %14 = getelementptr inbounds %struct.stat64* %tmp, i32 0, i32 5, !dbg !350
  %15 = load i32* %14, align 8, !dbg !350
  %16 = getelementptr inbounds %struct.stat* %buf, i32 0, i32 5, !dbg !350
  store i32 %15, i32* %16, align 4, !dbg !350
  %17 = getelementptr inbounds %struct.stat64* %tmp, i32 0, i32 6, !dbg !351
  %18 = load i32* %17, align 4, !dbg !351
  %19 = getelementptr inbounds %struct.stat* %buf, i32 0, i32 6, !dbg !351
  store i32 %18, i32* %19, align 4, !dbg !351
  %20 = getelementptr inbounds %struct.stat64* %tmp, i32 0, i32 7, !dbg !352
  %21 = load i64* %20, align 8, !dbg !352
  %22 = getelementptr inbounds %struct.stat* %buf, i32 0, i32 7, !dbg !352
  store i64 %21, i64* %22, align 4, !dbg !352
  %23 = getelementptr inbounds %struct.stat64* %tmp, i32 0, i32 9, !dbg !353
  %24 = load i64* %23, align 4, !dbg !353
  %25 = trunc i64 %24 to i32, !dbg !353
  %26 = getelementptr inbounds %struct.stat* %buf, i32 0, i32 9, !dbg !353
  store i32 %25, i32* %26, align 4, !dbg !353
  %27 = getelementptr inbounds %struct.stat64* %tmp, i32 0, i32 12, i32 0, !dbg !354
  %28 = load i32* %27, align 8, !dbg !354
  %29 = getelementptr inbounds %struct.stat* %buf, i32 0, i32 12, i32 0, !dbg !354
  store i32 %28, i32* %29, align 4, !dbg !354
  %30 = getelementptr inbounds %struct.stat64* %tmp, i32 0, i32 13, i32 0, !dbg !355
  %31 = load i32* %30, align 8, !dbg !355
  %32 = getelementptr inbounds %struct.stat* %buf, i32 0, i32 13, i32 0, !dbg !355
  store i32 %31, i32* %32, align 4, !dbg !355
  %33 = getelementptr inbounds %struct.stat64* %tmp, i32 0, i32 14, i32 0, !dbg !356
  %34 = load i32* %33, align 8, !dbg !356
  %35 = getelementptr inbounds %struct.stat* %buf, i32 0, i32 14, i32 0, !dbg !356
  store i32 %34, i32* %35, align 4, !dbg !356
  %36 = getelementptr inbounds %struct.stat64* %tmp, i32 0, i32 10, !dbg !357
  %37 = load i32* %36, align 4, !dbg !357
  %38 = getelementptr inbounds %struct.stat* %buf, i32 0, i32 10, !dbg !357
  store i32 %37, i32* %38, align 4, !dbg !357
  %39 = getelementptr inbounds %struct.stat64* %tmp, i32 0, i32 11, !dbg !358
  %40 = load i64* %39, align 8, !dbg !358
  %41 = trunc i64 %40 to i32, !dbg !358
  %42 = getelementptr inbounds %struct.stat* %buf, i32 0, i32 11, !dbg !358
  store i32 %41, i32* %42, align 4, !dbg !358
  ret i32 %0, !dbg !359
}

define i32 @__xstat(i32 %vers, i8* %path, %struct.stat* nocapture %buf) nounwind {
entry:
  %tmp = alloca %struct.stat64, align 8
  call void @llvm.dbg.value(metadata !{i32 %vers}, i64 0, metadata !195), !dbg !360
  call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !196), !dbg !360
  call void @llvm.dbg.value(metadata !{%struct.stat* %buf}, i64 0, metadata !197), !dbg !360
  call void @llvm.dbg.declare(metadata !{%struct.stat64* %tmp}, metadata !198), !dbg !361
  %0 = call i32 @__fd_stat(i8* %path, %struct.stat64* %tmp) nounwind, !dbg !362
  call void @llvm.dbg.value(metadata !{i32 %0}, i64 0, metadata !200), !dbg !362
  tail call void @llvm.dbg.value(metadata !{%struct.stat64* %tmp}, i64 0, metadata !160), !dbg !363
  tail call void @llvm.dbg.value(metadata !{%struct.stat* %buf}, i64 0, metadata !161), !dbg !363
  %1 = getelementptr inbounds %struct.stat64* %tmp, i32 0, i32 0, !dbg !365
  %2 = load i64* %1, align 8, !dbg !365
  %3 = getelementptr inbounds %struct.stat* %buf, i32 0, i32 0, !dbg !365
  store i64 %2, i64* %3, align 4, !dbg !365
  %4 = getelementptr inbounds %struct.stat64* %tmp, i32 0, i32 15, !dbg !366
  %5 = load i64* %4, align 8, !dbg !366
  %6 = trunc i64 %5 to i32, !dbg !366
  %7 = getelementptr inbounds %struct.stat* %buf, i32 0, i32 2, !dbg !366
  store i32 %6, i32* %7, align 4, !dbg !366
  %8 = getelementptr inbounds %struct.stat64* %tmp, i32 0, i32 3, !dbg !367
  %9 = load i32* %8, align 8, !dbg !367
  %10 = getelementptr inbounds %struct.stat* %buf, i32 0, i32 3, !dbg !367
  store i32 %9, i32* %10, align 4, !dbg !367
  %11 = getelementptr inbounds %struct.stat64* %tmp, i32 0, i32 4, !dbg !368
  %12 = load i32* %11, align 4, !dbg !368
  %13 = getelementptr inbounds %struct.stat* %buf, i32 0, i32 4, !dbg !368
  store i32 %12, i32* %13, align 4, !dbg !368
  %14 = getelementptr inbounds %struct.stat64* %tmp, i32 0, i32 5, !dbg !369
  %15 = load i32* %14, align 8, !dbg !369
  %16 = getelementptr inbounds %struct.stat* %buf, i32 0, i32 5, !dbg !369
  store i32 %15, i32* %16, align 4, !dbg !369
  %17 = getelementptr inbounds %struct.stat64* %tmp, i32 0, i32 6, !dbg !370
  %18 = load i32* %17, align 4, !dbg !370
  %19 = getelementptr inbounds %struct.stat* %buf, i32 0, i32 6, !dbg !370
  store i32 %18, i32* %19, align 4, !dbg !370
  %20 = getelementptr inbounds %struct.stat64* %tmp, i32 0, i32 7, !dbg !371
  %21 = load i64* %20, align 8, !dbg !371
  %22 = getelementptr inbounds %struct.stat* %buf, i32 0, i32 7, !dbg !371
  store i64 %21, i64* %22, align 4, !dbg !371
  %23 = getelementptr inbounds %struct.stat64* %tmp, i32 0, i32 9, !dbg !372
  %24 = load i64* %23, align 4, !dbg !372
  %25 = trunc i64 %24 to i32, !dbg !372
  %26 = getelementptr inbounds %struct.stat* %buf, i32 0, i32 9, !dbg !372
  store i32 %25, i32* %26, align 4, !dbg !372
  %27 = getelementptr inbounds %struct.stat64* %tmp, i32 0, i32 12, i32 0, !dbg !373
  %28 = load i32* %27, align 8, !dbg !373
  %29 = getelementptr inbounds %struct.stat* %buf, i32 0, i32 12, i32 0, !dbg !373
  store i32 %28, i32* %29, align 4, !dbg !373
  %30 = getelementptr inbounds %struct.stat64* %tmp, i32 0, i32 13, i32 0, !dbg !374
  %31 = load i32* %30, align 8, !dbg !374
  %32 = getelementptr inbounds %struct.stat* %buf, i32 0, i32 13, i32 0, !dbg !374
  store i32 %31, i32* %32, align 4, !dbg !374
  %33 = getelementptr inbounds %struct.stat64* %tmp, i32 0, i32 14, i32 0, !dbg !375
  %34 = load i32* %33, align 8, !dbg !375
  %35 = getelementptr inbounds %struct.stat* %buf, i32 0, i32 14, i32 0, !dbg !375
  store i32 %34, i32* %35, align 4, !dbg !375
  %36 = getelementptr inbounds %struct.stat64* %tmp, i32 0, i32 10, !dbg !376
  %37 = load i32* %36, align 4, !dbg !376
  %38 = getelementptr inbounds %struct.stat* %buf, i32 0, i32 10, !dbg !376
  store i32 %37, i32* %38, align 4, !dbg !376
  %39 = getelementptr inbounds %struct.stat64* %tmp, i32 0, i32 11, !dbg !377
  %40 = load i64* %39, align 8, !dbg !377
  %41 = trunc i64 %40 to i32, !dbg !377
  %42 = getelementptr inbounds %struct.stat* %buf, i32 0, i32 11, !dbg !377
  store i32 %41, i32* %42, align 4, !dbg !377
  ret i32 %0, !dbg !378
}

define weak i64 @lseek64(i32 %fd, i64 %off, i32 %whence) nounwind {
entry:
  tail call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !201), !dbg !379
  tail call void @llvm.dbg.value(metadata !{i64 %off}, i64 0, metadata !202), !dbg !379
  tail call void @llvm.dbg.value(metadata !{i32 %whence}, i64 0, metadata !203), !dbg !379
  %0 = tail call i64 @__fd_lseek(i32 %fd, i64 %off, i32 %whence) nounwind, !dbg !380
  ret i64 %0, !dbg !380
}

declare i64 @__fd_lseek(i32, i64, i32)

define i32 @lseek(i32 %fd, i32 %off, i32 %whence) nounwind {
entry:
  tail call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !204), !dbg !382
  tail call void @llvm.dbg.value(metadata !{i32 %off}, i64 0, metadata !205), !dbg !382
  tail call void @llvm.dbg.value(metadata !{i32 %whence}, i64 0, metadata !206), !dbg !382
  %0 = sext i32 %off to i64, !dbg !383
  %1 = tail call i64 @__fd_lseek(i32 %fd, i64 %0, i32 %whence) nounwind, !dbg !383
  %2 = trunc i64 %1 to i32, !dbg !383
  ret i32 %2, !dbg !383
}

define weak i32 @open64(i8* %pathname, i32 %flags, ...) nounwind {
entry:
  %ap = alloca i8*, align 4
  call void @llvm.dbg.value(metadata !{i8* %pathname}, i64 0, metadata !207), !dbg !385
  call void @llvm.dbg.value(metadata !{i32 %flags}, i64 0, metadata !208), !dbg !385
  call void @llvm.dbg.value(metadata !247, i64 0, metadata !209), !dbg !386
  %0 = and i32 %flags, 64, !dbg !387
  %1 = icmp eq i32 %0, 0, !dbg !387
  br i1 %1, label %bb3, label %bb, !dbg !387

bb:                                               ; preds = %entry
  call void @llvm.dbg.declare(metadata !{i8** %ap}, metadata !212), !dbg !388
  %ap1 = bitcast i8** %ap to i8*, !dbg !389
  call void @llvm.va_start(i8* %ap1), !dbg !389
  %2 = load i8** %ap, align 4, !dbg !390
  %3 = getelementptr inbounds i8* %2, i32 4, !dbg !390
  store i8* %3, i8** %ap, align 4, !dbg !390
  %4 = bitcast i8* %2 to i32*, !dbg !390
  %5 = load i32* %4, align 4, !dbg !390
  call void @llvm.dbg.value(metadata !{i32 %5}, i64 0, metadata !209), !dbg !390
  call void @llvm.va_end(i8* %ap1), !dbg !391
  br label %bb3, !dbg !391

bb3:                                              ; preds = %entry, %bb
  %mode.0 = phi i32 [ %5, %bb ], [ 0, %entry ]
  %6 = call i32 @__fd_open(i8* %pathname, i32 %flags, i32 %mode.0) nounwind, !dbg !392
  ret i32 %6, !dbg !392
}

declare void @llvm.va_start(i8*) nounwind

declare void @llvm.va_end(i8*) nounwind

declare i32 @__fd_open(i8*, i32, i32)

define i32 @getdents(i32 %fd, %struct.dirent* %dirp, i32 %nbytes) nounwind {
entry:
  tail call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !223), !dbg !393
  tail call void @llvm.dbg.value(metadata !{%struct.dirent* %dirp}, i64 0, metadata !224), !dbg !393
  tail call void @llvm.dbg.value(metadata !{i32 %nbytes}, i64 0, metadata !225), !dbg !393
  %0 = bitcast %struct.dirent* %dirp to %struct.dirent64*, !dbg !394
  tail call void @llvm.dbg.value(metadata !{%struct.dirent64* %0}, i64 0, metadata !226), !dbg !394
  %1 = tail call i32 @__fd_getdents(i32 %fd, %struct.dirent64* %0, i32 %nbytes) nounwind, !dbg !395
  tail call void @llvm.dbg.value(metadata !{i32 %1}, i64 0, metadata !236), !dbg !395
  %2 = icmp sgt i32 %1, 0, !dbg !396
  br i1 %2, label %bb, label %bb3, !dbg !396

bb:                                               ; preds = %entry
  %3 = bitcast %struct.dirent* %dirp to i8*, !dbg !397
  %4 = getelementptr inbounds i8* %3, i32 %1, !dbg !397
  tail call void @llvm.dbg.value(metadata !{null}, i64 0, metadata !237), !dbg !397
  %5 = bitcast i8* %4 to %struct.dirent*
  %6 = icmp ugt %struct.dirent* %5, %dirp, !dbg !398
  br i1 %6, label %bb1, label %bb3, !dbg !398

bb1:                                              ; preds = %bb, %bb1
  %dp64.05 = phi %struct.dirent64* [ %28, %bb1 ], [ %0, %bb ]
  %7 = bitcast %struct.dirent64* %dp64.05 to %struct.dirent*, !dbg !399
  %8 = getelementptr inbounds %struct.dirent64* %dp64.05, i32 0, i32 2, !dbg !400
  %9 = load i16* %8, align 4, !dbg !400
  %10 = zext i16 %9 to i32, !dbg !400
  %11 = add i32 %10, -19, !dbg !400
  %12 = getelementptr inbounds %struct.dirent64* %dp64.05, i32 0, i32 0, !dbg !401
  %13 = load i64* %12, align 4, !dbg !401
  %14 = trunc i64 %13 to i32, !dbg !401
  %15 = bitcast %struct.dirent64* %dp64.05 to i32*, !dbg !401
  store i32 %14, i32* %15, align 4, !dbg !401
  %16 = getelementptr inbounds %struct.dirent64* %dp64.05, i32 0, i32 1, !dbg !402
  %17 = load i64* %16, align 4, !dbg !402
  %18 = trunc i64 %17 to i32, !dbg !402
  %19 = getelementptr inbounds %struct.dirent* %7, i32 0, i32 1, !dbg !402
  store i32 %18, i32* %19, align 4, !dbg !402
  %20 = bitcast i64* %16 to i16*, !dbg !403
  store i16 %9, i16* %20, align 4, !dbg !403
  %21 = getelementptr inbounds %struct.dirent64* %dp64.05, i32 0, i32 3, !dbg !404
  %22 = load i8* %21, align 2, !dbg !404
  %23 = getelementptr inbounds %struct.dirent* %7, i32 0, i32 3, !dbg !404
  store i8 %22, i8* %23, align 2, !dbg !404
  %24 = getelementptr inbounds %struct.dirent64* %dp64.05, i32 0, i32 4, i32 0, !dbg !405
  %25 = getelementptr inbounds %struct.dirent* %7, i32 0, i32 4, i32 0, !dbg !405
  tail call void @llvm.memmove.p0i8.p0i8.i32(i8* %25, i8* %24, i32 %11, i32 1, i1 false), !dbg !405
  %26 = bitcast %struct.dirent64* %dp64.05 to i8*, !dbg !406
  %27 = getelementptr inbounds i8* %26, i32 %10, !dbg !406
  %28 = bitcast i8* %27 to %struct.dirent64*, !dbg !406
  %29 = icmp ult i8* %27, %4, !dbg !398
  br i1 %29, label %bb1, label %bb3, !dbg !398

bb3:                                              ; preds = %bb, %bb1, %entry
  ret i32 %1, !dbg !407
}

declare i32 @__fd_getdents(i32, %struct.dirent64*, i32)

declare void @llvm.memmove.p0i8.p0i8.i32(i8* nocapture, i8* nocapture, i32, i32, i1) nounwind

define i32 @statfs(i8* %path, %struct.statfs* %buf32) nounwind {
entry:
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !242), !dbg !408
  tail call void @llvm.dbg.value(metadata !{%struct.statfs* %buf32}, i64 0, metadata !243), !dbg !408
  %0 = tail call i32 @__fd_statfs(i8* %path, %struct.statfs* %buf32) nounwind, !dbg !409
  ret i32 %0, !dbg !409
}

declare i32 @__fd_statfs(i8*, %struct.statfs*)

define i32 @ftruncate(i32 %fd, i32 %length) nounwind {
entry:
  tail call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !244), !dbg !411
  tail call void @llvm.dbg.value(metadata !{i32 %length}, i64 0, metadata !245), !dbg !411
  %0 = sext i32 %length to i64, !dbg !412
  %1 = tail call i32 @__fd_ftruncate(i32 %fd, i64 %0) nounwind, !dbg !412
  ret i32 %1, !dbg !412
}

declare i32 @__fd_ftruncate(i32, i64)

!llvm.dbg.sp = !{!0, !71, !75, !78, !81, !87, !90, !93, !94, !95, !96, !101, !105, !108, !109, !127, !157}
!llvm.dbg.lv.__stat64_to_stat = !{!160, !161}
!llvm.dbg.lv.fstat64 = !{!162, !163}
!llvm.dbg.lv.fstat = !{!164, !165, !166, !168}
!llvm.dbg.lv.__fxstat = !{!169, !170, !171, !172, !174}
!llvm.dbg.lv.lstat64 = !{!175, !176}
!llvm.dbg.lv.lstat = !{!177, !178, !179, !181}
!llvm.dbg.lv.__lxstat = !{!182, !183, !184, !185, !187}
!llvm.dbg.lv.stat64 = !{!188, !189}
!llvm.dbg.lv.stat = !{!190, !191, !192, !194}
!llvm.dbg.lv.__xstat = !{!195, !196, !197, !198, !200}
!llvm.dbg.lv.lseek64 = !{!201, !202, !203}
!llvm.dbg.lv.lseek = !{!204, !205, !206}
!llvm.dbg.lv.open64 = !{!207, !208, !209, !212}
!llvm.dbg.lv.open = !{!217, !218, !219, !221}
!llvm.dbg.lv.getdents = !{!223, !224, !225, !226, !236, !237, !239, !241}
!llvm.dbg.lv.statfs = !{!242, !243}
!llvm.dbg.lv.ftruncate = !{!244, !245}

!0 = metadata !{i32 589870, i32 0, metadata !1, metadata !"__stat64_to_stat", metadata !"__stat64_to_stat", metadata !"", metadata !1, i32 30, metadata !3, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 true, null} ; [ DW_TAG_subprogram ]
!1 = metadata !{i32 589865, metadata !"fd_32.c", metadata !"/home/jeffwalt/Desktop/LLVM/workspace/klee/runtime/POSIX/", metadata !2} ; [ DW_TAG_file_type ]
!2 = metadata !{i32 589841, i32 0, i32 1, metadata !"fd_32.c", metadata !"/home/jeffwalt/Desktop/LLVM/workspace/klee/runtime/POSIX/", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build 2.9)", i1 true, i1 true, metadata !"", i32 0} ; [ DW_TAG_compile_unit ]
!3 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !4, i32 0, null} ; [ DW_TAG_subroutine_type ]
!4 = metadata !{null, metadata !5, metadata !48}
!5 = metadata !{i32 589839, metadata !1, metadata !"", metadata !1, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !6} ; [ DW_TAG_pointer_type ]
!6 = metadata !{i32 589843, metadata !1, metadata !"stat64", metadata !7, i32 23, i64 768, i64 32, i64 0, i32 0, null, metadata !8, i32 0, null} ; [ DW_TAG_structure_type ]
!7 = metadata !{i32 589865, metadata !"fd.h", metadata !"/home/jeffwalt/Desktop/LLVM/workspace/klee/runtime/POSIX/", metadata !2} ; [ DW_TAG_file_type ]
!8 = metadata !{metadata !9, metadata !14, metadata !16, metadata !19, metadata !21, metadata !23, metadata !25, metadata !27, metadata !28, metadata !29, metadata !32, metadata !35, metadata !37, metadata !44, metadata !45, metadata !46}
!9 = metadata !{i32 589837, metadata !6, metadata !"st_dev", metadata !10, i32 118, i64 64, i64 64, i64 0, i32 0, metadata !11} ; [ DW_TAG_member ]
!10 = metadata !{i32 589865, metadata !"stat.h", metadata !"/usr/include/bits", metadata !2} ; [ DW_TAG_file_type ]
!11 = metadata !{i32 589846, metadata !12, metadata !"__dev_t", metadata !12, i32 135, i64 0, i64 0, i64 0, i32 0, metadata !13} ; [ DW_TAG_typedef ]
!12 = metadata !{i32 589865, metadata !"types.h", metadata !"/usr/include/bits", metadata !2} ; [ DW_TAG_file_type ]
!13 = metadata !{i32 589860, metadata !1, metadata !"long long unsigned int", metadata !1, i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!14 = metadata !{i32 589837, metadata !6, metadata !"__pad1", metadata !10, i32 124, i64 32, i64 32, i64 64, i32 0, metadata !15} ; [ DW_TAG_member ]
!15 = metadata !{i32 589860, metadata !1, metadata !"unsigned int", metadata !1, i32 0, i64 32, i64 32, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!16 = metadata !{i32 589837, metadata !6, metadata !"__st_ino", metadata !10, i32 125, i64 32, i64 32, i64 96, i32 0, metadata !17} ; [ DW_TAG_member ]
!17 = metadata !{i32 589846, metadata !12, metadata !"__ino_t", metadata !12, i32 138, i64 0, i64 0, i64 0, i32 0, metadata !18} ; [ DW_TAG_typedef ]
!18 = metadata !{i32 589860, metadata !1, metadata !"long unsigned int", metadata !1, i32 0, i64 32, i64 32, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!19 = metadata !{i32 589837, metadata !6, metadata !"st_mode", metadata !10, i32 126, i64 32, i64 32, i64 128, i32 0, metadata !20} ; [ DW_TAG_member ]
!20 = metadata !{i32 589846, metadata !12, metadata !"__mode_t", metadata !12, i32 140, i64 0, i64 0, i64 0, i32 0, metadata !15} ; [ DW_TAG_typedef ]
!21 = metadata !{i32 589837, metadata !6, metadata !"st_nlink", metadata !10, i32 127, i64 32, i64 32, i64 160, i32 0, metadata !22} ; [ DW_TAG_member ]
!22 = metadata !{i32 589846, metadata !12, metadata !"__nlink_t", metadata !12, i32 141, i64 0, i64 0, i64 0, i32 0, metadata !15} ; [ DW_TAG_typedef ]
!23 = metadata !{i32 589837, metadata !6, metadata !"st_uid", metadata !10, i32 129, i64 32, i64 32, i64 192, i32 0, metadata !24} ; [ DW_TAG_member ]
!24 = metadata !{i32 589846, metadata !12, metadata !"__uid_t", metadata !12, i32 136, i64 0, i64 0, i64 0, i32 0, metadata !15} ; [ DW_TAG_typedef ]
!25 = metadata !{i32 589837, metadata !6, metadata !"st_gid", metadata !10, i32 130, i64 32, i64 32, i64 224, i32 0, metadata !26} ; [ DW_TAG_member ]
!26 = metadata !{i32 589846, metadata !12, metadata !"__gid_t", metadata !12, i32 137, i64 0, i64 0, i64 0, i32 0, metadata !15} ; [ DW_TAG_typedef ]
!27 = metadata !{i32 589837, metadata !6, metadata !"st_rdev", metadata !10, i32 136, i64 64, i64 64, i64 256, i32 0, metadata !11} ; [ DW_TAG_member ]
!28 = metadata !{i32 589837, metadata !6, metadata !"__pad2", metadata !10, i32 137, i64 32, i64 32, i64 320, i32 0, metadata !15} ; [ DW_TAG_member ]
!29 = metadata !{i32 589837, metadata !6, metadata !"st_size", metadata !10, i32 138, i64 64, i64 64, i64 352, i32 0, metadata !30} ; [ DW_TAG_member ]
!30 = metadata !{i32 589846, metadata !12, metadata !"__off64_t", metadata !12, i32 143, i64 0, i64 0, i64 0, i32 0, metadata !31} ; [ DW_TAG_typedef ]
!31 = metadata !{i32 589860, metadata !1, metadata !"long long int", metadata !1, i32 0, i64 64, i64 64, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!32 = metadata !{i32 589837, metadata !6, metadata !"st_blksize", metadata !10, i32 140, i64 32, i64 32, i64 416, i32 0, metadata !33} ; [ DW_TAG_member ]
!33 = metadata !{i32 589846, metadata !12, metadata !"__blksize_t", metadata !12, i32 169, i64 0, i64 0, i64 0, i32 0, metadata !34} ; [ DW_TAG_typedef ]
!34 = metadata !{i32 589860, metadata !1, metadata !"long int", metadata !1, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!35 = metadata !{i32 589837, metadata !6, metadata !"st_blocks", metadata !10, i32 141, i64 64, i64 64, i64 448, i32 0, metadata !36} ; [ DW_TAG_member ]
!36 = metadata !{i32 589846, metadata !12, metadata !"__blkcnt64_t", metadata !12, i32 173, i64 0, i64 0, i64 0, i32 0, metadata !31} ; [ DW_TAG_typedef ]
!37 = metadata !{i32 589837, metadata !6, metadata !"st_atim", metadata !10, i32 149, i64 64, i64 32, i64 512, i32 0, metadata !38} ; [ DW_TAG_member ]
!38 = metadata !{i32 589843, metadata !1, metadata !"timespec", metadata !39, i32 121, i64 64, i64 32, i64 0, i32 0, null, metadata !40, i32 0, null} ; [ DW_TAG_structure_type ]
!39 = metadata !{i32 589865, metadata !"time.h", metadata !"/usr/include", metadata !2} ; [ DW_TAG_file_type ]
!40 = metadata !{metadata !41, metadata !43}
!41 = metadata !{i32 589837, metadata !38, metadata !"tv_sec", metadata !39, i32 122, i64 32, i64 32, i64 0, i32 0, metadata !42} ; [ DW_TAG_member ]
!42 = metadata !{i32 589846, metadata !12, metadata !"__time_t", metadata !12, i32 150, i64 0, i64 0, i64 0, i32 0, metadata !34} ; [ DW_TAG_typedef ]
!43 = metadata !{i32 589837, metadata !38, metadata !"tv_nsec", metadata !39, i32 123, i64 32, i64 32, i64 32, i32 0, metadata !34} ; [ DW_TAG_member ]
!44 = metadata !{i32 589837, metadata !6, metadata !"st_mtim", metadata !10, i32 150, i64 64, i64 32, i64 576, i32 0, metadata !38} ; [ DW_TAG_member ]
!45 = metadata !{i32 589837, metadata !6, metadata !"st_ctim", metadata !10, i32 151, i64 64, i64 32, i64 640, i32 0, metadata !38} ; [ DW_TAG_member ]
!46 = metadata !{i32 589837, metadata !6, metadata !"st_ino", metadata !10, i32 166, i64 64, i64 64, i64 704, i32 0, metadata !47} ; [ DW_TAG_member ]
!47 = metadata !{i32 589846, metadata !12, metadata !"__ino64_t", metadata !12, i32 139, i64 0, i64 0, i64 0, i32 0, metadata !13} ; [ DW_TAG_typedef ]
!48 = metadata !{i32 589839, metadata !1, metadata !"", metadata !1, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !49} ; [ DW_TAG_pointer_type ]
!49 = metadata !{i32 589843, metadata !1, metadata !"stat", metadata !10, i32 44, i64 704, i64 32, i64 0, i32 0, null, metadata !50, i32 0, null} ; [ DW_TAG_structure_type ]
!50 = metadata !{metadata !51, metadata !52, metadata !54, metadata !55, metadata !56, metadata !57, metadata !58, metadata !59, metadata !60, metadata !61, metadata !63, metadata !64, metadata !66, metadata !67, metadata !68, metadata !69, metadata !70}
!51 = metadata !{i32 589837, metadata !49, metadata !"st_dev", metadata !10, i32 45, i64 64, i64 64, i64 0, i32 0, metadata !11} ; [ DW_TAG_member ]
!52 = metadata !{i32 589837, metadata !49, metadata !"__pad1", metadata !10, i32 47, i64 16, i64 16, i64 64, i32 0, metadata !53} ; [ DW_TAG_member ]
!53 = metadata !{i32 589860, metadata !1, metadata !"short unsigned int", metadata !1, i32 0, i64 16, i64 16, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!54 = metadata !{i32 589837, metadata !49, metadata !"st_ino", metadata !10, i32 50, i64 32, i64 32, i64 96, i32 0, metadata !17} ; [ DW_TAG_member ]
!55 = metadata !{i32 589837, metadata !49, metadata !"st_mode", metadata !10, i32 55, i64 32, i64 32, i64 128, i32 0, metadata !20} ; [ DW_TAG_member ]
!56 = metadata !{i32 589837, metadata !49, metadata !"st_nlink", metadata !10, i32 56, i64 32, i64 32, i64 160, i32 0, metadata !22} ; [ DW_TAG_member ]
!57 = metadata !{i32 589837, metadata !49, metadata !"st_uid", metadata !10, i32 61, i64 32, i64 32, i64 192, i32 0, metadata !24} ; [ DW_TAG_member ]
!58 = metadata !{i32 589837, metadata !49, metadata !"st_gid", metadata !10, i32 62, i64 32, i64 32, i64 224, i32 0, metadata !26} ; [ DW_TAG_member ]
!59 = metadata !{i32 589837, metadata !49, metadata !"st_rdev", metadata !10, i32 66, i64 64, i64 64, i64 256, i32 0, metadata !11} ; [ DW_TAG_member ]
!60 = metadata !{i32 589837, metadata !49, metadata !"__pad2", metadata !10, i32 68, i64 16, i64 16, i64 320, i32 0, metadata !53} ; [ DW_TAG_member ]
!61 = metadata !{i32 589837, metadata !49, metadata !"st_size", metadata !10, i32 71, i64 32, i64 32, i64 352, i32 0, metadata !62} ; [ DW_TAG_member ]
!62 = metadata !{i32 589846, metadata !12, metadata !"__off_t", metadata !12, i32 142, i64 0, i64 0, i64 0, i32 0, metadata !34} ; [ DW_TAG_typedef ]
!63 = metadata !{i32 589837, metadata !49, metadata !"st_blksize", metadata !10, i32 75, i64 32, i64 32, i64 384, i32 0, metadata !33} ; [ DW_TAG_member ]
!64 = metadata !{i32 589837, metadata !49, metadata !"st_blocks", metadata !10, i32 77, i64 32, i64 32, i64 416, i32 0, metadata !65} ; [ DW_TAG_member ]
!65 = metadata !{i32 589846, metadata !12, metadata !"__blkcnt_t", metadata !12, i32 170, i64 0, i64 0, i64 0, i32 0, metadata !34} ; [ DW_TAG_typedef ]
!66 = metadata !{i32 589837, metadata !49, metadata !"st_atim", metadata !10, i32 88, i64 64, i64 32, i64 448, i32 0, metadata !38} ; [ DW_TAG_member ]
!67 = metadata !{i32 589837, metadata !49, metadata !"st_mtim", metadata !10, i32 89, i64 64, i64 32, i64 512, i32 0, metadata !38} ; [ DW_TAG_member ]
!68 = metadata !{i32 589837, metadata !49, metadata !"st_ctim", metadata !10, i32 90, i64 64, i64 32, i64 576, i32 0, metadata !38} ; [ DW_TAG_member ]
!69 = metadata !{i32 589837, metadata !49, metadata !"__unused4", metadata !10, i32 106, i64 32, i64 32, i64 640, i32 0, metadata !18} ; [ DW_TAG_member ]
!70 = metadata !{i32 589837, metadata !49, metadata !"__unused5", metadata !10, i32 107, i64 32, i64 32, i64 672, i32 0, metadata !18} ; [ DW_TAG_member ]
!71 = metadata !{i32 589870, i32 0, metadata !1, metadata !"fstat64", metadata !"fstat64", metadata !"fstat64", metadata !1, i32 194, metadata !72, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, %struct.stat64*)* @fstat64} ; [ DW_TAG_subprogram ]
!72 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !73, i32 0, null} ; [ DW_TAG_subroutine_type ]
!73 = metadata !{metadata !74, metadata !74, metadata !5}
!74 = metadata !{i32 589860, metadata !1, metadata !"int", metadata !1, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!75 = metadata !{i32 589870, i32 0, metadata !1, metadata !"fstat", metadata !"fstat", metadata !"fstat", metadata !1, i32 101, metadata !76, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, %struct.stat*)* @fstat} ; [ DW_TAG_subprogram ]
!76 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !77, i32 0, null} ; [ DW_TAG_subroutine_type ]
!77 = metadata !{metadata !74, metadata !74, metadata !48}
!78 = metadata !{i32 589870, i32 0, metadata !1, metadata !"__fxstat", metadata !"__fxstat", metadata !"__fxstat", metadata !1, i32 94, metadata !79, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i32, %struct.stat*)* @__fxstat} ; [ DW_TAG_subprogram ]
!79 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !80, i32 0, null} ; [ DW_TAG_subroutine_type ]
!80 = metadata !{metadata !74, metadata !74, metadata !74, metadata !48}
!81 = metadata !{i32 589870, i32 0, metadata !1, metadata !"lstat64", metadata !"lstat64", metadata !"lstat64", metadata !1, i32 189, metadata !82, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, %struct.stat64*)* @lstat64} ; [ DW_TAG_subprogram ]
!82 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !83, i32 0, null} ; [ DW_TAG_subroutine_type ]
!83 = metadata !{metadata !74, metadata !84, metadata !5}
!84 = metadata !{i32 589839, metadata !1, metadata !"", metadata !1, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !85} ; [ DW_TAG_pointer_type ]
!85 = metadata !{i32 589862, metadata !1, metadata !"", metadata !1, i32 0, i64 8, i64 8, i64 0, i32 0, metadata !86} ; [ DW_TAG_const_type ]
!86 = metadata !{i32 589860, metadata !1, metadata !"char", metadata !1, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ]
!87 = metadata !{i32 589870, i32 0, metadata !1, metadata !"lstat", metadata !"lstat", metadata !"lstat", metadata !1, i32 87, metadata !88, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, %struct.stat*)* @lstat} ; [ DW_TAG_subprogram ]
!88 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !89, i32 0, null} ; [ DW_TAG_subroutine_type ]
!89 = metadata !{metadata !74, metadata !84, metadata !48}
!90 = metadata !{i32 589870, i32 0, metadata !1, metadata !"__lxstat", metadata !"__lxstat", metadata !"__lxstat", metadata !1, i32 80, metadata !91, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i8*, %struct.stat*)* @__lxstat} ; [ DW_TAG_subprogram ]
!91 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !92, i32 0, null} ; [ DW_TAG_subroutine_type ]
!92 = metadata !{metadata !74, metadata !74, metadata !84, metadata !48}
!93 = metadata !{i32 589870, i32 0, metadata !1, metadata !"stat64", metadata !"stat64", metadata !"stat64", metadata !1, i32 184, metadata !82, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, %struct.stat64*)* @stat64} ; [ DW_TAG_subprogram ]
!94 = metadata !{i32 589870, i32 0, metadata !1, metadata !"stat", metadata !"stat", metadata !"stat", metadata !1, i32 73, metadata !88, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, %struct.stat*)* @stat} ; [ DW_TAG_subprogram ]
!95 = metadata !{i32 589870, i32 0, metadata !1, metadata !"__xstat", metadata !"__xstat", metadata !"__xstat", metadata !1, i32 66, metadata !91, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i8*, %struct.stat*)* @__xstat} ; [ DW_TAG_subprogram ]
!96 = metadata !{i32 589870, i32 0, metadata !1, metadata !"lseek64", metadata !"lseek64", metadata !"lseek64", metadata !1, i32 179, metadata !97, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i64 (i32, i64, i32)* @lseek64} ; [ DW_TAG_subprogram ]
!97 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !98, i32 0, null} ; [ DW_TAG_subroutine_type ]
!98 = metadata !{metadata !99, metadata !74, metadata !99, metadata !74}
!99 = metadata !{i32 589846, metadata !100, metadata !"off64_t", metadata !100, i32 100, i64 0, i64 0, i64 0, i32 0, metadata !31} ; [ DW_TAG_typedef ]
!100 = metadata !{i32 589865, metadata !"types.h", metadata !"/usr/include/sys", metadata !2} ; [ DW_TAG_file_type ]
!101 = metadata !{i32 589870, i32 0, metadata !1, metadata !"lseek", metadata !"lseek", metadata !"lseek", metadata !1, i32 62, metadata !102, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i32, i32)* @lseek} ; [ DW_TAG_subprogram ]
!102 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !103, i32 0, null} ; [ DW_TAG_subroutine_type ]
!103 = metadata !{metadata !104, metadata !74, metadata !104, metadata !74}
!104 = metadata !{i32 589846, metadata !100, metadata !"off_t", metadata !100, i32 95, i64 0, i64 0, i64 0, i32 0, metadata !34} ; [ DW_TAG_typedef ]
!105 = metadata !{i32 589870, i32 0, metadata !1, metadata !"open64", metadata !"open64", metadata !"open64", metadata !1, i32 164, metadata !106, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i32, ...)* @open64} ; [ DW_TAG_subprogram ]
!106 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !107, i32 0, null} ; [ DW_TAG_subroutine_type ]
!107 = metadata !{metadata !74, metadata !84, metadata !74}
!108 = metadata !{i32 589870, i32 0, metadata !1, metadata !"open", metadata !"open", metadata !"open", metadata !1, i32 48, metadata !106, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i32, ...)* @open} ; [ DW_TAG_subprogram ]
!109 = metadata !{i32 589870, i32 0, metadata !1, metadata !"getdents", metadata !"getdents", metadata !"getdents", metadata !1, i32 137, metadata !110, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, %struct.dirent*, i32)* @getdents} ; [ DW_TAG_subprogram ]
!110 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !111, i32 0, null} ; [ DW_TAG_subroutine_type ]
!111 = metadata !{metadata !112, metadata !74, metadata !113, metadata !126}
!112 = metadata !{i32 589846, metadata !100, metadata !"ssize_t", metadata !100, i32 116, i64 0, i64 0, i64 0, i32 0, metadata !74} ; [ DW_TAG_typedef ]
!113 = metadata !{i32 589839, metadata !1, metadata !"", metadata !1, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !114} ; [ DW_TAG_pointer_type ]
!114 = metadata !{i32 589843, metadata !1, metadata !"dirent", metadata !115, i32 24, i64 2144, i64 32, i64 0, i32 0, null, metadata !116, i32 0, null} ; [ DW_TAG_structure_type ]
!115 = metadata !{i32 589865, metadata !"dirent.h", metadata !"/usr/include/bits", metadata !2} ; [ DW_TAG_file_type ]
!116 = metadata !{metadata !117, metadata !118, metadata !119, metadata !120, metadata !122}
!117 = metadata !{i32 589837, metadata !114, metadata !"d_ino", metadata !115, i32 26, i64 32, i64 32, i64 0, i32 0, metadata !17} ; [ DW_TAG_member ]
!118 = metadata !{i32 589837, metadata !114, metadata !"d_off", metadata !115, i32 27, i64 32, i64 32, i64 32, i32 0, metadata !62} ; [ DW_TAG_member ]
!119 = metadata !{i32 589837, metadata !114, metadata !"d_reclen", metadata !115, i32 32, i64 16, i64 16, i64 64, i32 0, metadata !53} ; [ DW_TAG_member ]
!120 = metadata !{i32 589837, metadata !114, metadata !"d_type", metadata !115, i32 33, i64 8, i64 8, i64 80, i32 0, metadata !121} ; [ DW_TAG_member ]
!121 = metadata !{i32 589860, metadata !1, metadata !"unsigned char", metadata !1, i32 0, i64 8, i64 8, i64 0, i32 0, i32 8} ; [ DW_TAG_base_type ]
!122 = metadata !{i32 589837, metadata !114, metadata !"d_name", metadata !115, i32 34, i64 2048, i64 8, i64 88, i32 0, metadata !123} ; [ DW_TAG_member ]
!123 = metadata !{i32 589825, metadata !1, metadata !"", metadata !1, i32 0, i64 2048, i64 8, i64 0, i32 0, metadata !86, metadata !124, i32 0, null} ; [ DW_TAG_array_type ]
!124 = metadata !{metadata !125}
!125 = metadata !{i32 589857, i64 0, i64 255}     ; [ DW_TAG_subrange_type ]
!126 = metadata !{i32 589846, metadata !100, metadata !"size_t", metadata !100, i32 151, i64 0, i64 0, i64 0, i32 0, metadata !15} ; [ DW_TAG_typedef ]
!127 = metadata !{i32 589870, i32 0, metadata !1, metadata !"statfs", metadata !"statfs", metadata !"statfs", metadata !1, i32 112, metadata !128, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, %struct.statfs*)* @statfs} ; [ DW_TAG_subprogram ]
!128 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !129, i32 0, null} ; [ DW_TAG_subroutine_type ]
!129 = metadata !{metadata !74, metadata !84, metadata !130}
!130 = metadata !{i32 589839, metadata !1, metadata !"", metadata !1, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !131} ; [ DW_TAG_pointer_type ]
!131 = metadata !{i32 589843, metadata !1, metadata !"statfs", metadata !132, i32 26, i64 512, i64 32, i64 0, i32 0, null, metadata !133, i32 0, null} ; [ DW_TAG_structure_type ]
!132 = metadata !{i32 589865, metadata !"statfs.h", metadata !"/usr/include/bits", metadata !2} ; [ DW_TAG_file_type ]
!133 = metadata !{metadata !134, metadata !135, metadata !136, metadata !138, metadata !139, metadata !140, metadata !142, metadata !143, metadata !151, metadata !152, metadata !153}
!134 = metadata !{i32 589837, metadata !131, metadata !"f_type", metadata !132, i32 27, i64 32, i64 32, i64 0, i32 0, metadata !74} ; [ DW_TAG_member ]
!135 = metadata !{i32 589837, metadata !131, metadata !"f_bsize", metadata !132, i32 28, i64 32, i64 32, i64 32, i32 0, metadata !74} ; [ DW_TAG_member ]
!136 = metadata !{i32 589837, metadata !131, metadata !"f_blocks", metadata !132, i32 30, i64 32, i64 32, i64 64, i32 0, metadata !137} ; [ DW_TAG_member ]
!137 = metadata !{i32 589846, metadata !12, metadata !"__fsblkcnt_t", metadata !12, i32 174, i64 0, i64 0, i64 0, i32 0, metadata !18} ; [ DW_TAG_typedef ]
!138 = metadata !{i32 589837, metadata !131, metadata !"f_bfree", metadata !132, i32 31, i64 32, i64 32, i64 96, i32 0, metadata !137} ; [ DW_TAG_member ]
!139 = metadata !{i32 589837, metadata !131, metadata !"f_bavail", metadata !132, i32 32, i64 32, i64 32, i64 128, i32 0, metadata !137} ; [ DW_TAG_member ]
!140 = metadata !{i32 589837, metadata !131, metadata !"f_files", metadata !132, i32 33, i64 32, i64 32, i64 160, i32 0, metadata !141} ; [ DW_TAG_member ]
!141 = metadata !{i32 589846, metadata !12, metadata !"__fsfilcnt_t", metadata !12, i32 178, i64 0, i64 0, i64 0, i32 0, metadata !18} ; [ DW_TAG_typedef ]
!142 = metadata !{i32 589837, metadata !131, metadata !"f_ffree", metadata !132, i32 34, i64 32, i64 32, i64 192, i32 0, metadata !141} ; [ DW_TAG_member ]
!143 = metadata !{i32 589837, metadata !131, metadata !"f_fsid", metadata !132, i32 42, i64 64, i64 32, i64 224, i32 0, metadata !144} ; [ DW_TAG_member ]
!144 = metadata !{i32 589846, metadata !12, metadata !"__fsid_t", metadata !12, i32 145, i64 0, i64 0, i64 0, i32 0, metadata !145} ; [ DW_TAG_typedef ]
!145 = metadata !{i32 589843, metadata !1, metadata !"", metadata !12, i32 144, i64 64, i64 32, i64 0, i32 0, null, metadata !146, i32 0, null} ; [ DW_TAG_structure_type ]
!146 = metadata !{metadata !147}
!147 = metadata !{i32 589837, metadata !145, metadata !"__val", metadata !12, i32 144, i64 64, i64 32, i64 0, i32 0, metadata !148} ; [ DW_TAG_member ]
!148 = metadata !{i32 589825, metadata !1, metadata !"", metadata !1, i32 0, i64 64, i64 32, i64 0, i32 0, metadata !74, metadata !149, i32 0, null} ; [ DW_TAG_array_type ]
!149 = metadata !{metadata !150}
!150 = metadata !{i32 589857, i64 0, i64 1}       ; [ DW_TAG_subrange_type ]
!151 = metadata !{i32 589837, metadata !131, metadata !"f_namelen", metadata !132, i32 43, i64 32, i64 32, i64 288, i32 0, metadata !74} ; [ DW_TAG_member ]
!152 = metadata !{i32 589837, metadata !131, metadata !"f_frsize", metadata !132, i32 44, i64 32, i64 32, i64 320, i32 0, metadata !74} ; [ DW_TAG_member ]
!153 = metadata !{i32 589837, metadata !131, metadata !"f_spare", metadata !132, i32 45, i64 160, i64 32, i64 352, i32 0, metadata !154} ; [ DW_TAG_member ]
!154 = metadata !{i32 589825, metadata !1, metadata !"", metadata !1, i32 0, i64 160, i64 32, i64 0, i32 0, metadata !74, metadata !155, i32 0, null} ; [ DW_TAG_array_type ]
!155 = metadata !{metadata !156}
!156 = metadata !{i32 589857, i64 0, i64 4}       ; [ DW_TAG_subrange_type ]
!157 = metadata !{i32 589870, i32 0, metadata !1, metadata !"ftruncate", metadata !"ftruncate", metadata !"ftruncate", metadata !1, i32 108, metadata !158, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i32)* @ftruncate} ; [ DW_TAG_subprogram ]
!158 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !159, i32 0, null} ; [ DW_TAG_subroutine_type ]
!159 = metadata !{metadata !74, metadata !74, metadata !104}
!160 = metadata !{i32 590081, metadata !0, metadata !"a", metadata !1, i32 30, metadata !5, i32 0} ; [ DW_TAG_arg_variable ]
!161 = metadata !{i32 590081, metadata !0, metadata !"b", metadata !1, i32 30, metadata !48, i32 0} ; [ DW_TAG_arg_variable ]
!162 = metadata !{i32 590081, metadata !71, metadata !"fd", metadata !1, i32 194, metadata !74, i32 0} ; [ DW_TAG_arg_variable ]
!163 = metadata !{i32 590081, metadata !71, metadata !"buf", metadata !1, i32 194, metadata !5, i32 0} ; [ DW_TAG_arg_variable ]
!164 = metadata !{i32 590081, metadata !75, metadata !"fd", metadata !1, i32 101, metadata !74, i32 0} ; [ DW_TAG_arg_variable ]
!165 = metadata !{i32 590081, metadata !75, metadata !"buf", metadata !1, i32 101, metadata !48, i32 0} ; [ DW_TAG_arg_variable ]
!166 = metadata !{i32 590080, metadata !167, metadata !"tmp", metadata !1, i32 102, metadata !6, i32 0} ; [ DW_TAG_auto_variable ]
!167 = metadata !{i32 589835, metadata !75, i32 101, i32 0, metadata !1, i32 2} ; [ DW_TAG_lexical_block ]
!168 = metadata !{i32 590080, metadata !167, metadata !"res", metadata !1, i32 103, metadata !74, i32 0} ; [ DW_TAG_auto_variable ]
!169 = metadata !{i32 590081, metadata !78, metadata !"vers", metadata !1, i32 94, metadata !74, i32 0} ; [ DW_TAG_arg_variable ]
!170 = metadata !{i32 590081, metadata !78, metadata !"fd", metadata !1, i32 94, metadata !74, i32 0} ; [ DW_TAG_arg_variable ]
!171 = metadata !{i32 590081, metadata !78, metadata !"buf", metadata !1, i32 94, metadata !48, i32 0} ; [ DW_TAG_arg_variable ]
!172 = metadata !{i32 590080, metadata !173, metadata !"tmp", metadata !1, i32 95, metadata !6, i32 0} ; [ DW_TAG_auto_variable ]
!173 = metadata !{i32 589835, metadata !78, i32 94, i32 0, metadata !1, i32 3} ; [ DW_TAG_lexical_block ]
!174 = metadata !{i32 590080, metadata !173, metadata !"res", metadata !1, i32 96, metadata !74, i32 0} ; [ DW_TAG_auto_variable ]
!175 = metadata !{i32 590081, metadata !81, metadata !"path", metadata !1, i32 189, metadata !84, i32 0} ; [ DW_TAG_arg_variable ]
!176 = metadata !{i32 590081, metadata !81, metadata !"buf", metadata !1, i32 189, metadata !5, i32 0} ; [ DW_TAG_arg_variable ]
!177 = metadata !{i32 590081, metadata !87, metadata !"path", metadata !1, i32 87, metadata !84, i32 0} ; [ DW_TAG_arg_variable ]
!178 = metadata !{i32 590081, metadata !87, metadata !"buf", metadata !1, i32 87, metadata !48, i32 0} ; [ DW_TAG_arg_variable ]
!179 = metadata !{i32 590080, metadata !180, metadata !"tmp", metadata !1, i32 88, metadata !6, i32 0} ; [ DW_TAG_auto_variable ]
!180 = metadata !{i32 589835, metadata !87, i32 87, i32 0, metadata !1, i32 5} ; [ DW_TAG_lexical_block ]
!181 = metadata !{i32 590080, metadata !180, metadata !"res", metadata !1, i32 89, metadata !74, i32 0} ; [ DW_TAG_auto_variable ]
!182 = metadata !{i32 590081, metadata !90, metadata !"vers", metadata !1, i32 80, metadata !74, i32 0} ; [ DW_TAG_arg_variable ]
!183 = metadata !{i32 590081, metadata !90, metadata !"path", metadata !1, i32 80, metadata !84, i32 0} ; [ DW_TAG_arg_variable ]
!184 = metadata !{i32 590081, metadata !90, metadata !"buf", metadata !1, i32 80, metadata !48, i32 0} ; [ DW_TAG_arg_variable ]
!185 = metadata !{i32 590080, metadata !186, metadata !"tmp", metadata !1, i32 81, metadata !6, i32 0} ; [ DW_TAG_auto_variable ]
!186 = metadata !{i32 589835, metadata !90, i32 80, i32 0, metadata !1, i32 6} ; [ DW_TAG_lexical_block ]
!187 = metadata !{i32 590080, metadata !186, metadata !"res", metadata !1, i32 82, metadata !74, i32 0} ; [ DW_TAG_auto_variable ]
!188 = metadata !{i32 590081, metadata !93, metadata !"path", metadata !1, i32 184, metadata !84, i32 0} ; [ DW_TAG_arg_variable ]
!189 = metadata !{i32 590081, metadata !93, metadata !"buf", metadata !1, i32 184, metadata !5, i32 0} ; [ DW_TAG_arg_variable ]
!190 = metadata !{i32 590081, metadata !94, metadata !"path", metadata !1, i32 73, metadata !84, i32 0} ; [ DW_TAG_arg_variable ]
!191 = metadata !{i32 590081, metadata !94, metadata !"buf", metadata !1, i32 73, metadata !48, i32 0} ; [ DW_TAG_arg_variable ]
!192 = metadata !{i32 590080, metadata !193, metadata !"tmp", metadata !1, i32 74, metadata !6, i32 0} ; [ DW_TAG_auto_variable ]
!193 = metadata !{i32 589835, metadata !94, i32 73, i32 0, metadata !1, i32 8} ; [ DW_TAG_lexical_block ]
!194 = metadata !{i32 590080, metadata !193, metadata !"res", metadata !1, i32 75, metadata !74, i32 0} ; [ DW_TAG_auto_variable ]
!195 = metadata !{i32 590081, metadata !95, metadata !"vers", metadata !1, i32 66, metadata !74, i32 0} ; [ DW_TAG_arg_variable ]
!196 = metadata !{i32 590081, metadata !95, metadata !"path", metadata !1, i32 66, metadata !84, i32 0} ; [ DW_TAG_arg_variable ]
!197 = metadata !{i32 590081, metadata !95, metadata !"buf", metadata !1, i32 66, metadata !48, i32 0} ; [ DW_TAG_arg_variable ]
!198 = metadata !{i32 590080, metadata !199, metadata !"tmp", metadata !1, i32 67, metadata !6, i32 0} ; [ DW_TAG_auto_variable ]
!199 = metadata !{i32 589835, metadata !95, i32 66, i32 0, metadata !1, i32 9} ; [ DW_TAG_lexical_block ]
!200 = metadata !{i32 590080, metadata !199, metadata !"res", metadata !1, i32 68, metadata !74, i32 0} ; [ DW_TAG_auto_variable ]
!201 = metadata !{i32 590081, metadata !96, metadata !"fd", metadata !1, i32 179, metadata !74, i32 0} ; [ DW_TAG_arg_variable ]
!202 = metadata !{i32 590081, metadata !96, metadata !"off", metadata !1, i32 179, metadata !99, i32 0} ; [ DW_TAG_arg_variable ]
!203 = metadata !{i32 590081, metadata !96, metadata !"whence", metadata !1, i32 179, metadata !74, i32 0} ; [ DW_TAG_arg_variable ]
!204 = metadata !{i32 590081, metadata !101, metadata !"fd", metadata !1, i32 62, metadata !74, i32 0} ; [ DW_TAG_arg_variable ]
!205 = metadata !{i32 590081, metadata !101, metadata !"off", metadata !1, i32 62, metadata !104, i32 0} ; [ DW_TAG_arg_variable ]
!206 = metadata !{i32 590081, metadata !101, metadata !"whence", metadata !1, i32 62, metadata !74, i32 0} ; [ DW_TAG_arg_variable ]
!207 = metadata !{i32 590081, metadata !105, metadata !"pathname", metadata !1, i32 164, metadata !84, i32 0} ; [ DW_TAG_arg_variable ]
!208 = metadata !{i32 590081, metadata !105, metadata !"flags", metadata !1, i32 164, metadata !74, i32 0} ; [ DW_TAG_arg_variable ]
!209 = metadata !{i32 590080, metadata !210, metadata !"mode", metadata !1, i32 165, metadata !211, i32 0} ; [ DW_TAG_auto_variable ]
!210 = metadata !{i32 589835, metadata !105, i32 164, i32 0, metadata !1, i32 12} ; [ DW_TAG_lexical_block ]
!211 = metadata !{i32 589846, metadata !100, metadata !"mode_t", metadata !100, i32 77, i64 0, i64 0, i64 0, i32 0, metadata !15} ; [ DW_TAG_typedef ]
!212 = metadata !{i32 590080, metadata !213, metadata !"ap", metadata !1, i32 169, metadata !214, i32 0} ; [ DW_TAG_auto_variable ]
!213 = metadata !{i32 589835, metadata !210, i32 170, i32 0, metadata !1, i32 13} ; [ DW_TAG_lexical_block ]
!214 = metadata !{i32 589846, metadata !215, metadata !"va_list", metadata !215, i32 91, i64 0, i64 0, i64 0, i32 0, metadata !216} ; [ DW_TAG_typedef ]
!215 = metadata !{i32 589865, metadata !"stdio.h", metadata !"/usr/include", metadata !2} ; [ DW_TAG_file_type ]
!216 = metadata !{i32 589839, metadata !1, metadata !"", metadata !1, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !86} ; [ DW_TAG_pointer_type ]
!217 = metadata !{i32 590081, metadata !108, metadata !"pathname", metadata !1, i32 48, metadata !84, i32 0} ; [ DW_TAG_arg_variable ]
!218 = metadata !{i32 590081, metadata !108, metadata !"flags", metadata !1, i32 48, metadata !74, i32 0} ; [ DW_TAG_arg_variable ]
!219 = metadata !{i32 590080, metadata !220, metadata !"mode", metadata !1, i32 49, metadata !211, i32 0} ; [ DW_TAG_auto_variable ]
!220 = metadata !{i32 589835, metadata !108, i32 48, i32 0, metadata !1, i32 14} ; [ DW_TAG_lexical_block ]
!221 = metadata !{i32 590080, metadata !222, metadata !"ap", metadata !1, i32 53, metadata !214, i32 0} ; [ DW_TAG_auto_variable ]
!222 = metadata !{i32 589835, metadata !220, i32 54, i32 0, metadata !1, i32 15} ; [ DW_TAG_lexical_block ]
!223 = metadata !{i32 590081, metadata !109, metadata !"fd", metadata !1, i32 137, metadata !74, i32 0} ; [ DW_TAG_arg_variable ]
!224 = metadata !{i32 590081, metadata !109, metadata !"dirp", metadata !1, i32 137, metadata !113, i32 0} ; [ DW_TAG_arg_variable ]
!225 = metadata !{i32 590081, metadata !109, metadata !"nbytes", metadata !1, i32 137, metadata !126, i32 0} ; [ DW_TAG_arg_variable ]
!226 = metadata !{i32 590080, metadata !227, metadata !"dp64", metadata !1, i32 138, metadata !228, i32 0} ; [ DW_TAG_auto_variable ]
!227 = metadata !{i32 589835, metadata !109, i32 137, i32 0, metadata !1, i32 16} ; [ DW_TAG_lexical_block ]
!228 = metadata !{i32 589839, metadata !1, metadata !"", metadata !1, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !229} ; [ DW_TAG_pointer_type ]
!229 = metadata !{i32 589843, metadata !1, metadata !"dirent64", metadata !115, i32 39, i64 2208, i64 32, i64 0, i32 0, null, metadata !230, i32 0, null} ; [ DW_TAG_structure_type ]
!230 = metadata !{metadata !231, metadata !232, metadata !233, metadata !234, metadata !235}
!231 = metadata !{i32 589837, metadata !229, metadata !"d_ino", metadata !115, i32 40, i64 64, i64 64, i64 0, i32 0, metadata !47} ; [ DW_TAG_member ]
!232 = metadata !{i32 589837, metadata !229, metadata !"d_off", metadata !115, i32 41, i64 64, i64 64, i64 64, i32 0, metadata !30} ; [ DW_TAG_member ]
!233 = metadata !{i32 589837, metadata !229, metadata !"d_reclen", metadata !115, i32 42, i64 16, i64 16, i64 128, i32 0, metadata !53} ; [ DW_TAG_member ]
!234 = metadata !{i32 589837, metadata !229, metadata !"d_type", metadata !115, i32 43, i64 8, i64 8, i64 144, i32 0, metadata !121} ; [ DW_TAG_member ]
!235 = metadata !{i32 589837, metadata !229, metadata !"d_name", metadata !115, i32 44, i64 2048, i64 8, i64 152, i32 0, metadata !123} ; [ DW_TAG_member ]
!236 = metadata !{i32 590080, metadata !227, metadata !"res", metadata !1, i32 139, metadata !112, i32 0} ; [ DW_TAG_auto_variable ]
!237 = metadata !{i32 590080, metadata !238, metadata !"end", metadata !1, i32 142, metadata !228, i32 0} ; [ DW_TAG_auto_variable ]
!238 = metadata !{i32 589835, metadata !227, i32 142, i32 0, metadata !1, i32 17} ; [ DW_TAG_lexical_block ]
!239 = metadata !{i32 590080, metadata !240, metadata !"dp", metadata !1, i32 144, metadata !113, i32 0} ; [ DW_TAG_auto_variable ]
!240 = metadata !{i32 589835, metadata !238, i32 144, i32 0, metadata !1, i32 18} ; [ DW_TAG_lexical_block ]
!241 = metadata !{i32 590080, metadata !240, metadata !"name_len", metadata !1, i32 145, metadata !126, i32 0} ; [ DW_TAG_auto_variable ]
!242 = metadata !{i32 590081, metadata !127, metadata !"path", metadata !1, i32 112, metadata !84, i32 0} ; [ DW_TAG_arg_variable ]
!243 = metadata !{i32 590081, metadata !127, metadata !"buf32", metadata !1, i32 112, metadata !130, i32 0} ; [ DW_TAG_arg_variable ]
!244 = metadata !{i32 590081, metadata !157, metadata !"fd", metadata !1, i32 108, metadata !74, i32 0} ; [ DW_TAG_arg_variable ]
!245 = metadata !{i32 590081, metadata !157, metadata !"length", metadata !1, i32 108, metadata !104, i32 0} ; [ DW_TAG_arg_variable ]
!246 = metadata !{i32 48, i32 0, metadata !108, null}
!247 = metadata !{i32 0}
!248 = metadata !{i32 49, i32 0, metadata !220, null}
!249 = metadata !{i32 51, i32 0, metadata !220, null}
!250 = metadata !{i32 53, i32 0, metadata !222, null}
!251 = metadata !{i32 54, i32 0, metadata !222, null}
!252 = metadata !{i32 55, i32 0, metadata !222, null}
!253 = metadata !{i32 56, i32 0, metadata !222, null}
!254 = metadata !{i32 59, i32 0, metadata !220, null}
!255 = metadata !{i32 194, i32 0, metadata !71, null}
!256 = metadata !{i32 195, i32 0, metadata !257, null}
!257 = metadata !{i32 589835, metadata !71, i32 194, i32 0, metadata !1, i32 1} ; [ DW_TAG_lexical_block ]
!258 = metadata !{i32 101, i32 0, metadata !75, null}
!259 = metadata !{i32 102, i32 0, metadata !167, null}
!260 = metadata !{i32 103, i32 0, metadata !167, null}
!261 = metadata !{i32 30, i32 0, metadata !0, metadata !262}
!262 = metadata !{i32 104, i32 0, metadata !167, null}
!263 = metadata !{i32 31, i32 0, metadata !264, metadata !262}
!264 = metadata !{i32 589835, metadata !0, i32 30, i32 0, metadata !1, i32 0} ; [ DW_TAG_lexical_block ]
!265 = metadata !{i32 32, i32 0, metadata !264, metadata !262}
!266 = metadata !{i32 33, i32 0, metadata !264, metadata !262}
!267 = metadata !{i32 34, i32 0, metadata !264, metadata !262}
!268 = metadata !{i32 35, i32 0, metadata !264, metadata !262}
!269 = metadata !{i32 36, i32 0, metadata !264, metadata !262}
!270 = metadata !{i32 37, i32 0, metadata !264, metadata !262}
!271 = metadata !{i32 38, i32 0, metadata !264, metadata !262}
!272 = metadata !{i32 39, i32 0, metadata !264, metadata !262}
!273 = metadata !{i32 40, i32 0, metadata !264, metadata !262}
!274 = metadata !{i32 41, i32 0, metadata !264, metadata !262}
!275 = metadata !{i32 42, i32 0, metadata !264, metadata !262}
!276 = metadata !{i32 43, i32 0, metadata !264, metadata !262}
!277 = metadata !{i32 105, i32 0, metadata !167, null}
!278 = metadata !{i32 94, i32 0, metadata !78, null}
!279 = metadata !{i32 95, i32 0, metadata !173, null}
!280 = metadata !{i32 96, i32 0, metadata !173, null}
!281 = metadata !{i32 30, i32 0, metadata !0, metadata !282}
!282 = metadata !{i32 97, i32 0, metadata !173, null}
!283 = metadata !{i32 31, i32 0, metadata !264, metadata !282}
!284 = metadata !{i32 32, i32 0, metadata !264, metadata !282}
!285 = metadata !{i32 33, i32 0, metadata !264, metadata !282}
!286 = metadata !{i32 34, i32 0, metadata !264, metadata !282}
!287 = metadata !{i32 35, i32 0, metadata !264, metadata !282}
!288 = metadata !{i32 36, i32 0, metadata !264, metadata !282}
!289 = metadata !{i32 37, i32 0, metadata !264, metadata !282}
!290 = metadata !{i32 38, i32 0, metadata !264, metadata !282}
!291 = metadata !{i32 39, i32 0, metadata !264, metadata !282}
!292 = metadata !{i32 40, i32 0, metadata !264, metadata !282}
!293 = metadata !{i32 41, i32 0, metadata !264, metadata !282}
!294 = metadata !{i32 42, i32 0, metadata !264, metadata !282}
!295 = metadata !{i32 43, i32 0, metadata !264, metadata !282}
!296 = metadata !{i32 98, i32 0, metadata !173, null}
!297 = metadata !{i32 189, i32 0, metadata !81, null}
!298 = metadata !{i32 190, i32 0, metadata !299, null}
!299 = metadata !{i32 589835, metadata !81, i32 189, i32 0, metadata !1, i32 4} ; [ DW_TAG_lexical_block ]
!300 = metadata !{i32 87, i32 0, metadata !87, null}
!301 = metadata !{i32 88, i32 0, metadata !180, null}
!302 = metadata !{i32 89, i32 0, metadata !180, null}
!303 = metadata !{i32 30, i32 0, metadata !0, metadata !304}
!304 = metadata !{i32 90, i32 0, metadata !180, null}
!305 = metadata !{i32 31, i32 0, metadata !264, metadata !304}
!306 = metadata !{i32 32, i32 0, metadata !264, metadata !304}
!307 = metadata !{i32 33, i32 0, metadata !264, metadata !304}
!308 = metadata !{i32 34, i32 0, metadata !264, metadata !304}
!309 = metadata !{i32 35, i32 0, metadata !264, metadata !304}
!310 = metadata !{i32 36, i32 0, metadata !264, metadata !304}
!311 = metadata !{i32 37, i32 0, metadata !264, metadata !304}
!312 = metadata !{i32 38, i32 0, metadata !264, metadata !304}
!313 = metadata !{i32 39, i32 0, metadata !264, metadata !304}
!314 = metadata !{i32 40, i32 0, metadata !264, metadata !304}
!315 = metadata !{i32 41, i32 0, metadata !264, metadata !304}
!316 = metadata !{i32 42, i32 0, metadata !264, metadata !304}
!317 = metadata !{i32 43, i32 0, metadata !264, metadata !304}
!318 = metadata !{i32 91, i32 0, metadata !180, null}
!319 = metadata !{i32 80, i32 0, metadata !90, null}
!320 = metadata !{i32 81, i32 0, metadata !186, null}
!321 = metadata !{i32 82, i32 0, metadata !186, null}
!322 = metadata !{i32 30, i32 0, metadata !0, metadata !323}
!323 = metadata !{i32 83, i32 0, metadata !186, null}
!324 = metadata !{i32 31, i32 0, metadata !264, metadata !323}
!325 = metadata !{i32 32, i32 0, metadata !264, metadata !323}
!326 = metadata !{i32 33, i32 0, metadata !264, metadata !323}
!327 = metadata !{i32 34, i32 0, metadata !264, metadata !323}
!328 = metadata !{i32 35, i32 0, metadata !264, metadata !323}
!329 = metadata !{i32 36, i32 0, metadata !264, metadata !323}
!330 = metadata !{i32 37, i32 0, metadata !264, metadata !323}
!331 = metadata !{i32 38, i32 0, metadata !264, metadata !323}
!332 = metadata !{i32 39, i32 0, metadata !264, metadata !323}
!333 = metadata !{i32 40, i32 0, metadata !264, metadata !323}
!334 = metadata !{i32 41, i32 0, metadata !264, metadata !323}
!335 = metadata !{i32 42, i32 0, metadata !264, metadata !323}
!336 = metadata !{i32 43, i32 0, metadata !264, metadata !323}
!337 = metadata !{i32 84, i32 0, metadata !186, null}
!338 = metadata !{i32 184, i32 0, metadata !93, null}
!339 = metadata !{i32 185, i32 0, metadata !340, null}
!340 = metadata !{i32 589835, metadata !93, i32 184, i32 0, metadata !1, i32 7} ; [ DW_TAG_lexical_block ]
!341 = metadata !{i32 73, i32 0, metadata !94, null}
!342 = metadata !{i32 74, i32 0, metadata !193, null}
!343 = metadata !{i32 75, i32 0, metadata !193, null}
!344 = metadata !{i32 30, i32 0, metadata !0, metadata !345}
!345 = metadata !{i32 76, i32 0, metadata !193, null}
!346 = metadata !{i32 31, i32 0, metadata !264, metadata !345}
!347 = metadata !{i32 32, i32 0, metadata !264, metadata !345}
!348 = metadata !{i32 33, i32 0, metadata !264, metadata !345}
!349 = metadata !{i32 34, i32 0, metadata !264, metadata !345}
!350 = metadata !{i32 35, i32 0, metadata !264, metadata !345}
!351 = metadata !{i32 36, i32 0, metadata !264, metadata !345}
!352 = metadata !{i32 37, i32 0, metadata !264, metadata !345}
!353 = metadata !{i32 38, i32 0, metadata !264, metadata !345}
!354 = metadata !{i32 39, i32 0, metadata !264, metadata !345}
!355 = metadata !{i32 40, i32 0, metadata !264, metadata !345}
!356 = metadata !{i32 41, i32 0, metadata !264, metadata !345}
!357 = metadata !{i32 42, i32 0, metadata !264, metadata !345}
!358 = metadata !{i32 43, i32 0, metadata !264, metadata !345}
!359 = metadata !{i32 77, i32 0, metadata !193, null}
!360 = metadata !{i32 66, i32 0, metadata !95, null}
!361 = metadata !{i32 67, i32 0, metadata !199, null}
!362 = metadata !{i32 68, i32 0, metadata !199, null}
!363 = metadata !{i32 30, i32 0, metadata !0, metadata !364}
!364 = metadata !{i32 69, i32 0, metadata !199, null}
!365 = metadata !{i32 31, i32 0, metadata !264, metadata !364}
!366 = metadata !{i32 32, i32 0, metadata !264, metadata !364}
!367 = metadata !{i32 33, i32 0, metadata !264, metadata !364}
!368 = metadata !{i32 34, i32 0, metadata !264, metadata !364}
!369 = metadata !{i32 35, i32 0, metadata !264, metadata !364}
!370 = metadata !{i32 36, i32 0, metadata !264, metadata !364}
!371 = metadata !{i32 37, i32 0, metadata !264, metadata !364}
!372 = metadata !{i32 38, i32 0, metadata !264, metadata !364}
!373 = metadata !{i32 39, i32 0, metadata !264, metadata !364}
!374 = metadata !{i32 40, i32 0, metadata !264, metadata !364}
!375 = metadata !{i32 41, i32 0, metadata !264, metadata !364}
!376 = metadata !{i32 42, i32 0, metadata !264, metadata !364}
!377 = metadata !{i32 43, i32 0, metadata !264, metadata !364}
!378 = metadata !{i32 70, i32 0, metadata !199, null}
!379 = metadata !{i32 179, i32 0, metadata !96, null}
!380 = metadata !{i32 180, i32 0, metadata !381, null}
!381 = metadata !{i32 589835, metadata !96, i32 179, i32 0, metadata !1, i32 10} ; [ DW_TAG_lexical_block ]
!382 = metadata !{i32 62, i32 0, metadata !101, null}
!383 = metadata !{i32 63, i32 0, metadata !384, null}
!384 = metadata !{i32 589835, metadata !101, i32 62, i32 0, metadata !1, i32 11} ; [ DW_TAG_lexical_block ]
!385 = metadata !{i32 164, i32 0, metadata !105, null}
!386 = metadata !{i32 165, i32 0, metadata !210, null}
!387 = metadata !{i32 167, i32 0, metadata !210, null}
!388 = metadata !{i32 169, i32 0, metadata !213, null}
!389 = metadata !{i32 170, i32 0, metadata !213, null}
!390 = metadata !{i32 171, i32 0, metadata !213, null}
!391 = metadata !{i32 172, i32 0, metadata !213, null}
!392 = metadata !{i32 175, i32 0, metadata !210, null}
!393 = metadata !{i32 137, i32 0, metadata !109, null}
!394 = metadata !{i32 138, i32 0, metadata !227, null}
!395 = metadata !{i32 139, i32 0, metadata !227, null}
!396 = metadata !{i32 141, i32 0, metadata !227, null}
!397 = metadata !{i32 142, i32 0, metadata !238, null}
!398 = metadata !{i32 143, i32 0, metadata !238, null}
!399 = metadata !{i32 144, i32 0, metadata !240, null}
!400 = metadata !{i32 146, i32 0, metadata !240, null}
!401 = metadata !{i32 147, i32 0, metadata !240, null}
!402 = metadata !{i32 148, i32 0, metadata !240, null}
!403 = metadata !{i32 149, i32 0, metadata !240, null}
!404 = metadata !{i32 150, i32 0, metadata !240, null}
!405 = metadata !{i32 151, i32 0, metadata !240, null}
!406 = metadata !{i32 152, i32 0, metadata !240, null}
!407 = metadata !{i32 156, i32 0, metadata !227, null}
!408 = metadata !{i32 112, i32 0, metadata !127, null}
!409 = metadata !{i32 131, i32 0, metadata !410, null}
!410 = metadata !{i32 589835, metadata !127, i32 112, i32 0, metadata !1, i32 19} ; [ DW_TAG_lexical_block ]
!411 = metadata !{i32 108, i32 0, metadata !157, null}
!412 = metadata !{i32 109, i32 0, metadata !413, null}
!413 = metadata !{i32 589835, metadata !157, i32 108, i32 0, metadata !1, i32 20} ; [ DW_TAG_lexical_block ]
