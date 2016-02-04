; ModuleID = 'fd.c'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:32:64-f32:32:32-f64:32:64-v64:64:64-v128:128:128-a0:0:64-f80:32:32-f128:128:128-n8:16:32"
target triple = "i386-pc-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i32, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i32, i32, [40 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.__fsid_t = type { [2 x i32] }
%struct.dirent64 = type { i64, i64, i16, i8, [256 x i8] }
%struct.exe_disk_file_t = type { i32, i8*, %struct.stat64* }
%struct.exe_file_system_t = type { i32, %struct.exe_disk_file_t*, %struct.exe_disk_file_t*, i32, %struct.exe_disk_file_t*, i32, i32*, i32*, i32*, i32*, i32*, i32*, i32* }
%struct.exe_file_t = type { i32, i32, i64, %struct.exe_disk_file_t* }
%struct.exe_sym_env_t = type { [32 x %struct.exe_file_t], i32, i32, i32 }
%struct.fd_set = type { [32 x i32] }
%struct.stat64 = type { i64, i32, i32, i32, i32, i32, i32, i64, i32, i64, i32, i64, %struct.timespec, %struct.timespec, %struct.timespec, i64 }
%struct.statfs = type { i32, i32, i32, i32, i32, i32, i32, %struct.__fsid_t, i32, i32, [5 x i32] }
%struct.timespec = type { i32, i32 }

@__exe_fs = external unnamed_addr global %struct.exe_file_system_t
@__exe_env = external unnamed_addr global %struct.exe_sym_env_t
@.str = private unnamed_addr constant [18 x i8] c"ignoring (ENOENT)\00", align 1
@.str1 = private unnamed_addr constant [17 x i8] c"ignoring (EPERM)\00", align 1
@.str2 = private unnamed_addr constant [32 x i8] c"symbolic file, ignoring (EPERM)\00", align 4
@.str3 = private unnamed_addr constant [32 x i8] c"symbolic file, ignoring (EBADF)\00", align 4
@n_calls.4750 = internal unnamed_addr global i32 0
@.str4 = private unnamed_addr constant [30 x i8] c"symbolic file, ignoring (EIO)\00", align 1
@.str5 = private unnamed_addr constant [33 x i8] c"symbolic file, ignoring (ENOENT)\00", align 4
@n_calls.5268 = internal unnamed_addr global i32 0
@n_calls.4382 = internal unnamed_addr global i32 0
@.str6 = private unnamed_addr constant [33 x i8] c"symbolic file, ignoring (EINVAL)\00", align 4
@.str7 = private unnamed_addr constant [41 x i8] c"(TCGETS) symbolic file, incomplete model\00", align 4
@.str8 = private unnamed_addr constant [42 x i8] c"(TCSETS) symbolic file, silently ignoring\00", align 4
@.str9 = private unnamed_addr constant [43 x i8] c"(TCSETSW) symbolic file, silently ignoring\00", align 4
@.str10 = private unnamed_addr constant [43 x i8] c"(TCSETSF) symbolic file, silently ignoring\00", align 4
@.str11 = private unnamed_addr constant [45 x i8] c"(TIOCGWINSZ) symbolic file, incomplete model\00", align 4
@.str12 = private unnamed_addr constant [46 x i8] c"(TIOCSWINSZ) symbolic file, ignoring (EINVAL)\00", align 4
@.str13 = private unnamed_addr constant [43 x i8] c"(FIONREAD) symbolic file, incomplete model\00", align 4
@.str14 = private unnamed_addr constant [44 x i8] c"(MTIOCGET) symbolic file, ignoring (EINVAL)\00", align 4
@.str15 = private unnamed_addr constant [18 x i8] c"s != (off64_t) -1\00", align 1
@.str16 = private unnamed_addr constant [5 x i8] c"fd.c\00", align 1
@__PRETTY_FUNCTION__.4787 = internal unnamed_addr constant [14 x i8] c"__fd_getdents\00"
@.str17 = private unnamed_addr constant [18 x i8] c"new_off == f->off\00", align 1
@__PRETTY_FUNCTION__.4531 = internal unnamed_addr constant [11 x i8] c"__fd_lseek\00"
@n_calls.4402 = internal unnamed_addr global i32 0
@.str18 = private unnamed_addr constant [12 x i8] c"f->off >= 0\00", align 1
@__PRETTY_FUNCTION__.4405 = internal unnamed_addr constant [5 x i8] c"read\00"
@n_calls.4657 = internal unnamed_addr global i32 0
@n_calls.4634 = internal unnamed_addr global i32 0
@n_calls.4461 = internal unnamed_addr global i32 0
@.str19 = private unnamed_addr constant [7 x i8] c"r >= 0\00", align 1
@__PRETTY_FUNCTION__.4464 = internal unnamed_addr constant [6 x i8] c"write\00"
@.str20 = private unnamed_addr constant [2 x i8] c"0\00", align 1
@stderr = external unnamed_addr global %struct._IO_FILE*
@.str21 = private unnamed_addr constant [33 x i8] c"WARNING: write() ignores bytes.\0A\00", align 4
@.str22 = private unnamed_addr constant [47 x i8] c"Undefined call to open(): O_EXCL w/o O_RDONLY\0A\00", align 4

define i32 @access(i8* %pathname, i32 %mode) nounwind {
entry:
  tail call void @llvm.dbg.value(metadata !{i8* %pathname}, i64 0, metadata !344), !dbg !544
  tail call void @llvm.dbg.value(metadata !{i32 %mode}, i64 0, metadata !345), !dbg !544
  tail call void @llvm.dbg.value(metadata !{i8* %pathname}, i64 0, metadata !229), !dbg !545
  %0 = load i8* %pathname, align 1, !dbg !547
  tail call void @llvm.dbg.value(metadata !{i8 %0}, i64 0, metadata !230), !dbg !547
  %1 = icmp eq i8 %0, 0, !dbg !548
  br i1 %1, label %bb1, label %bb.i, !dbg !548

bb.i:                                             ; preds = %entry
  %2 = getelementptr inbounds i8* %pathname, i32 1, !dbg !548
  %3 = load i8* %2, align 1, !dbg !548
  %4 = icmp eq i8 %3, 0, !dbg !548
  br i1 %4, label %bb8.preheader.i, label %bb1, !dbg !548

bb8.preheader.i:                                  ; preds = %bb.i
  %5 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i32 0, i32 0), align 4, !dbg !549
  %6 = sext i8 %0 to i32, !dbg !550
  br label %bb8.i

bb3.i:                                            ; preds = %bb8.i
  %sext.i = shl i32 %17, 24
  %7 = ashr exact i32 %sext.i, 24, !dbg !550
  %8 = add nsw i32 %7, 65, !dbg !550
  %9 = icmp eq i32 %6, %8, !dbg !550
  br i1 %9, label %bb4.i, label %bb7.i, !dbg !550

bb4.i:                                            ; preds = %bb3.i
  %10 = load %struct.exe_disk_file_t** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i32 0, i32 4), align 4, !dbg !551
  tail call void @llvm.dbg.value(metadata !552, i64 0, metadata !233), !dbg !551
  %11 = getelementptr inbounds %struct.exe_disk_file_t* %10, i32 %17, i32 2, !dbg !553
  %12 = load %struct.stat64** %11, align 4, !dbg !553
  %13 = getelementptr inbounds %struct.stat64* %12, i32 0, i32 15, !dbg !553
  %14 = load i64* %13, align 4, !dbg !553
  %15 = icmp eq i64 %14, 0, !dbg !553
  br i1 %15, label %bb1, label %__get_sym_file.exit, !dbg !553

bb7.i:                                            ; preds = %bb3.i
  %16 = add i32 %17, 1, !dbg !549
  br label %bb8.i, !dbg !549

bb8.i:                                            ; preds = %bb7.i, %bb8.preheader.i
  %17 = phi i32 [ %16, %bb7.i ], [ 0, %bb8.preheader.i ]
  %18 = icmp ugt i32 %5, %17, !dbg !549
  br i1 %18, label %bb3.i, label %bb1, !dbg !549

__get_sym_file.exit:                              ; preds = %bb4.i
  %19 = getelementptr inbounds %struct.exe_disk_file_t* %10, i32 %17, !dbg !551
  tail call void @llvm.dbg.value(metadata !{%struct.exe_disk_file_t* %19}, i64 0, metadata !346), !dbg !546
  %20 = icmp eq %struct.exe_disk_file_t* %19, null, !dbg !554
  br i1 %20, label %bb1, label %bb4, !dbg !554

bb1:                                              ; preds = %bb8.i, %bb4.i, %entry, %bb.i, %__get_sym_file.exit
  tail call void @llvm.dbg.value(metadata !{i8* %pathname}, i64 0, metadata !311) nounwind, !dbg !555
  tail call void @llvm.dbg.value(metadata !{i8* %pathname}, i64 0, metadata !301) nounwind, !dbg !557
  %21 = ptrtoint i8* %pathname to i32, !dbg !559
  %22 = tail call i32 @klee_get_valuel(i32 %21) nounwind, !dbg !559
  %23 = inttoptr i32 %22 to i8*, !dbg !559
  tail call void @llvm.dbg.value(metadata !{i8* %23}, i64 0, metadata !302) nounwind, !dbg !559
  %24 = icmp eq i8* %23, %pathname, !dbg !560
  %25 = zext i1 %24 to i32, !dbg !560
  tail call void @klee_assume(i32 %25) nounwind, !dbg !560
  tail call void @llvm.dbg.value(metadata !{i8* %23}, i64 0, metadata !312) nounwind, !dbg !558
  tail call void @llvm.dbg.value(metadata !561, i64 0, metadata !314) nounwind, !dbg !562
  br label %bb.i6, !dbg !562

bb.i6:                                            ; preds = %bb6.i8, %bb1
  %sc.0.i = phi i8* [ %23, %bb1 ], [ %sc.1.i, %bb6.i8 ]
  %26 = phi i32 [ 0, %bb1 ], [ %38, %bb6.i8 ]
  %tmp.i = add i32 %26, -1
  %27 = load i8* %sc.0.i, align 1, !dbg !563
  %28 = and i32 %tmp.i, %26, !dbg !564
  %29 = icmp eq i32 %28, 0, !dbg !564
  br i1 %29, label %bb1.i, label %bb5.i, !dbg !564

bb1.i:                                            ; preds = %bb.i6
  switch i8 %27, label %bb6.i8 [
    i8 0, label %bb2.i
    i8 47, label %bb4.i7
  ]

bb2.i:                                            ; preds = %bb1.i
  tail call void @llvm.dbg.value(metadata !{i8 %27}, i64 0, metadata !315) nounwind, !dbg !563
  store i8 0, i8* %sc.0.i, align 1, !dbg !565
  tail call void @llvm.dbg.value(metadata !{null}, i64 0, metadata !312) nounwind, !dbg !565
  br label %__concretize_string.exit, !dbg !565

bb4.i7:                                           ; preds = %bb1.i
  store i8 47, i8* %sc.0.i, align 1, !dbg !566
  %30 = getelementptr inbounds i8* %sc.0.i, i32 1, !dbg !566
  br label %bb6.i8, !dbg !566

bb5.i:                                            ; preds = %bb.i6
  %31 = sext i8 %27 to i32, !dbg !567
  %32 = tail call i32 @klee_get_valuel(i32 %31) nounwind, !dbg !567
  %33 = trunc i32 %32 to i8, !dbg !567
  %34 = icmp eq i8 %33, %27, !dbg !568
  %35 = zext i1 %34 to i32, !dbg !568
  tail call void @klee_assume(i32 %35) nounwind, !dbg !568
  store i8 %33, i8* %sc.0.i, align 1, !dbg !569
  %36 = getelementptr inbounds i8* %sc.0.i, i32 1, !dbg !569
  %37 = icmp eq i8 %33, 0, !dbg !570
  br i1 %37, label %__concretize_string.exit, label %bb6.i8, !dbg !570

bb6.i8:                                           ; preds = %bb5.i, %bb4.i7, %bb1.i
  %sc.1.i = phi i8* [ %30, %bb4.i7 ], [ %36, %bb5.i ], [ %sc.0.i, %bb1.i ]
  %38 = add i32 %26, 1, !dbg !562
  br label %bb.i6, !dbg !562

__concretize_string.exit:                         ; preds = %bb5.i, %bb2.i
  %39 = tail call i32 (i32, ...)* @syscall(i32 33, i8* %pathname, i32 %mode) nounwind, !dbg !556
  tail call void @llvm.dbg.value(metadata !{i32 %39}, i64 0, metadata !348), !dbg !556
  %40 = icmp eq i32 %39, -1, !dbg !571
  br i1 %40, label %bb2, label %bb4, !dbg !571

bb2:                                              ; preds = %__concretize_string.exit
  %41 = tail call i32* @__errno_location() nounwind readnone, !dbg !572
  %42 = tail call i32 @klee_get_errno() nounwind, !dbg !572
  store i32 %42, i32* %41, align 4, !dbg !572
  br label %bb4, !dbg !572

bb4:                                              ; preds = %__concretize_string.exit, %bb2, %__get_sym_file.exit
  %.0 = phi i32 [ 0, %__get_sym_file.exit ], [ -1, %bb2 ], [ %39, %__concretize_string.exit ]
  ret i32 %.0, !dbg !573
}

declare void @llvm.dbg.declare(metadata, metadata) nounwind readnone

declare void @llvm.dbg.value(metadata, i64, metadata) nounwind readnone

define i32 @umask(i32 %mask) nounwind {
entry:
  tail call void @llvm.dbg.value(metadata !{i32 %mask}, i64 0, metadata !239), !dbg !574
  %0 = load i32* getelementptr inbounds (%struct.exe_sym_env_t* @__exe_env, i32 0, i32 1), align 4, !dbg !575
  tail call void @llvm.dbg.value(metadata !{i32 %0}, i64 0, metadata !240), !dbg !575
  %1 = and i32 %mask, 511, !dbg !576
  store i32 %1, i32* getelementptr inbounds (%struct.exe_sym_env_t* @__exe_env, i32 0, i32 1), align 4, !dbg !576
  ret i32 %0, !dbg !577
}

define i32 @chroot(i8* nocapture %path) nounwind {
entry:
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !248), !dbg !578
  %0 = load i8* %path, align 1, !dbg !579
  switch i8 %0, label %bb4 [
    i8 0, label %bb
    i8 47, label %bb2
  ]

bb:                                               ; preds = %entry
  %1 = tail call i32* @__errno_location() nounwind readnone, !dbg !581
  store i32 2, i32* %1, align 4, !dbg !581
  br label %bb5, !dbg !582

bb2:                                              ; preds = %entry
  %2 = getelementptr inbounds i8* %path, i32 1, !dbg !583
  %3 = load i8* %2, align 1, !dbg !583
  %4 = icmp eq i8 %3, 0, !dbg !583
  br i1 %4, label %bb5, label %bb4, !dbg !583

bb4:                                              ; preds = %entry, %bb2
  tail call void @klee_warning(i8* getelementptr inbounds ([18 x i8]* @.str, i32 0, i32 0)) nounwind, !dbg !584
  %5 = tail call i32* @__errno_location() nounwind readnone, !dbg !585
  store i32 2, i32* %5, align 4, !dbg !585
  br label %bb5, !dbg !586

bb5:                                              ; preds = %bb2, %bb4, %bb
  %.0 = phi i32 [ -1, %bb ], [ -1, %bb4 ], [ 0, %bb2 ]
  ret i32 %.0, !dbg !582
}

declare i32* @__errno_location() nounwind readnone

declare void @klee_warning(i8*)

define i32 @unlink(i8* nocapture %pathname) nounwind {
entry:
  tail call void @llvm.dbg.value(metadata !{i8* %pathname}, i64 0, metadata !249), !dbg !587
  tail call void @llvm.dbg.value(metadata !{i8* %pathname}, i64 0, metadata !229), !dbg !588
  %0 = load i8* %pathname, align 1, !dbg !590
  tail call void @llvm.dbg.value(metadata !{i8 %0}, i64 0, metadata !230), !dbg !590
  %1 = icmp eq i8 %0, 0, !dbg !591
  br i1 %1, label %bb5, label %bb.i, !dbg !591

bb.i:                                             ; preds = %entry
  %2 = getelementptr inbounds i8* %pathname, i32 1, !dbg !591
  %3 = load i8* %2, align 1, !dbg !591
  %4 = icmp eq i8 %3, 0, !dbg !591
  br i1 %4, label %bb8.preheader.i, label %bb5, !dbg !591

bb8.preheader.i:                                  ; preds = %bb.i
  %5 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i32 0, i32 0), align 4, !dbg !592
  %6 = sext i8 %0 to i32, !dbg !593
  br label %bb8.i

bb3.i:                                            ; preds = %bb8.i
  %sext.i = shl i32 %17, 24
  %7 = ashr exact i32 %sext.i, 24, !dbg !593
  %8 = add nsw i32 %7, 65, !dbg !593
  %9 = icmp eq i32 %6, %8, !dbg !593
  br i1 %9, label %bb4.i, label %bb7.i, !dbg !593

bb4.i:                                            ; preds = %bb3.i
  %10 = load %struct.exe_disk_file_t** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i32 0, i32 4), align 4, !dbg !594
  tail call void @llvm.dbg.value(metadata !552, i64 0, metadata !233), !dbg !594
  %11 = getelementptr inbounds %struct.exe_disk_file_t* %10, i32 %17, i32 2, !dbg !595
  %12 = load %struct.stat64** %11, align 4, !dbg !595
  %13 = getelementptr inbounds %struct.stat64* %12, i32 0, i32 15, !dbg !595
  %14 = load i64* %13, align 4, !dbg !595
  %15 = icmp eq i64 %14, 0, !dbg !595
  br i1 %15, label %bb5, label %__get_sym_file.exit, !dbg !595

bb7.i:                                            ; preds = %bb3.i
  %16 = add i32 %17, 1, !dbg !592
  br label %bb8.i, !dbg !592

bb8.i:                                            ; preds = %bb7.i, %bb8.preheader.i
  %17 = phi i32 [ %16, %bb7.i ], [ 0, %bb8.preheader.i ]
  %18 = icmp ugt i32 %5, %17, !dbg !592
  br i1 %18, label %bb3.i, label %bb5, !dbg !592

__get_sym_file.exit:                              ; preds = %bb4.i
  %19 = getelementptr inbounds %struct.exe_disk_file_t* %10, i32 %17, !dbg !594
  tail call void @llvm.dbg.value(metadata !{%struct.exe_disk_file_t* %19}, i64 0, metadata !250), !dbg !589
  %20 = icmp eq %struct.exe_disk_file_t* %19, null, !dbg !596
  br i1 %20, label %bb5, label %bb, !dbg !596

bb:                                               ; preds = %__get_sym_file.exit
  %21 = getelementptr inbounds %struct.stat64* %12, i32 0, i32 3, !dbg !597
  %22 = load i32* %21, align 4, !dbg !597
  %23 = and i32 %22, 61440, !dbg !597
  %24 = icmp eq i32 %23, 32768, !dbg !597
  br i1 %24, label %bb1, label %bb2, !dbg !597

bb1:                                              ; preds = %bb
  store i64 0, i64* %13, align 4, !dbg !598
  br label %bb6, !dbg !599

bb2:                                              ; preds = %bb
  %25 = icmp eq i32 %23, 16384, !dbg !600
  %26 = tail call i32* @__errno_location() nounwind readnone, !dbg !601
  br i1 %25, label %bb3, label %bb4, !dbg !600

bb3:                                              ; preds = %bb2
  store i32 21, i32* %26, align 4, !dbg !601
  br label %bb6, !dbg !602

bb4:                                              ; preds = %bb2
  store i32 1, i32* %26, align 4, !dbg !603
  br label %bb6, !dbg !604

bb5:                                              ; preds = %bb8.i, %bb4.i, %entry, %bb.i, %__get_sym_file.exit
  tail call void @klee_warning(i8* getelementptr inbounds ([17 x i8]* @.str1, i32 0, i32 0)) nounwind, !dbg !605
  %27 = tail call i32* @__errno_location() nounwind readnone, !dbg !606
  store i32 1, i32* %27, align 4, !dbg !606
  br label %bb6, !dbg !607

bb6:                                              ; preds = %bb5, %bb4, %bb3, %bb1
  %.0 = phi i32 [ 0, %bb1 ], [ -1, %bb3 ], [ -1, %bb4 ], [ -1, %bb5 ]
  ret i32 %.0, !dbg !599
}

define i32 @rmdir(i8* nocapture %pathname) nounwind {
entry:
  tail call void @llvm.dbg.value(metadata !{i8* %pathname}, i64 0, metadata !252), !dbg !608
  tail call void @llvm.dbg.value(metadata !{i8* %pathname}, i64 0, metadata !229), !dbg !609
  %0 = load i8* %pathname, align 1, !dbg !611
  tail call void @llvm.dbg.value(metadata !{i8 %0}, i64 0, metadata !230), !dbg !611
  %1 = icmp eq i8 %0, 0, !dbg !612
  br i1 %1, label %bb3, label %bb.i, !dbg !612

bb.i:                                             ; preds = %entry
  %2 = getelementptr inbounds i8* %pathname, i32 1, !dbg !612
  %3 = load i8* %2, align 1, !dbg !612
  %4 = icmp eq i8 %3, 0, !dbg !612
  br i1 %4, label %bb8.preheader.i, label %bb3, !dbg !612

bb8.preheader.i:                                  ; preds = %bb.i
  %5 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i32 0, i32 0), align 4, !dbg !613
  %6 = sext i8 %0 to i32, !dbg !614
  br label %bb8.i

bb3.i:                                            ; preds = %bb8.i
  %sext.i = shl i32 %17, 24
  %7 = ashr exact i32 %sext.i, 24, !dbg !614
  %8 = add nsw i32 %7, 65, !dbg !614
  %9 = icmp eq i32 %6, %8, !dbg !614
  br i1 %9, label %bb4.i, label %bb7.i, !dbg !614

bb4.i:                                            ; preds = %bb3.i
  %10 = load %struct.exe_disk_file_t** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i32 0, i32 4), align 4, !dbg !615
  tail call void @llvm.dbg.value(metadata !552, i64 0, metadata !233), !dbg !615
  %11 = getelementptr inbounds %struct.exe_disk_file_t* %10, i32 %17, i32 2, !dbg !616
  %12 = load %struct.stat64** %11, align 4, !dbg !616
  %13 = getelementptr inbounds %struct.stat64* %12, i32 0, i32 15, !dbg !616
  %14 = load i64* %13, align 4, !dbg !616
  %15 = icmp eq i64 %14, 0, !dbg !616
  br i1 %15, label %bb3, label %__get_sym_file.exit, !dbg !616

bb7.i:                                            ; preds = %bb3.i
  %16 = add i32 %17, 1, !dbg !613
  br label %bb8.i, !dbg !613

bb8.i:                                            ; preds = %bb7.i, %bb8.preheader.i
  %17 = phi i32 [ %16, %bb7.i ], [ 0, %bb8.preheader.i ]
  %18 = icmp ugt i32 %5, %17, !dbg !613
  br i1 %18, label %bb3.i, label %bb3, !dbg !613

__get_sym_file.exit:                              ; preds = %bb4.i
  %19 = getelementptr inbounds %struct.exe_disk_file_t* %10, i32 %17, !dbg !615
  tail call void @llvm.dbg.value(metadata !{%struct.exe_disk_file_t* %19}, i64 0, metadata !253), !dbg !610
  %20 = icmp eq %struct.exe_disk_file_t* %19, null, !dbg !617
  br i1 %20, label %bb3, label %bb, !dbg !617

bb:                                               ; preds = %__get_sym_file.exit
  %21 = getelementptr inbounds %struct.stat64* %12, i32 0, i32 3, !dbg !618
  %22 = load i32* %21, align 4, !dbg !618
  %23 = and i32 %22, 61440, !dbg !618
  %24 = icmp eq i32 %23, 16384, !dbg !618
  br i1 %24, label %bb1, label %bb2, !dbg !618

bb1:                                              ; preds = %bb
  store i64 0, i64* %13, align 4, !dbg !619
  br label %bb4, !dbg !620

bb2:                                              ; preds = %bb
  %25 = tail call i32* @__errno_location() nounwind readnone, !dbg !621
  store i32 20, i32* %25, align 4, !dbg !621
  br label %bb4, !dbg !622

bb3:                                              ; preds = %bb8.i, %bb4.i, %entry, %bb.i, %__get_sym_file.exit
  tail call void @klee_warning(i8* getelementptr inbounds ([17 x i8]* @.str1, i32 0, i32 0)) nounwind, !dbg !623
  %26 = tail call i32* @__errno_location() nounwind readnone, !dbg !624
  store i32 1, i32* %26, align 4, !dbg !624
  br label %bb4, !dbg !625

bb4:                                              ; preds = %bb3, %bb2, %bb1
  %.0 = phi i32 [ 0, %bb1 ], [ -1, %bb2 ], [ -1, %bb3 ]
  ret i32 %.0, !dbg !620
}

define i32 @readlink(i8* %path, i8* %buf, i32 %bufsize) nounwind {
entry:
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !258), !dbg !626
  tail call void @llvm.dbg.value(metadata !{i8* %buf}, i64 0, metadata !259), !dbg !626
  tail call void @llvm.dbg.value(metadata !{i32 %bufsize}, i64 0, metadata !260), !dbg !626
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !229), !dbg !627
  %0 = load i8* %path, align 1, !dbg !629
  tail call void @llvm.dbg.value(metadata !{i8 %0}, i64 0, metadata !230), !dbg !629
  %1 = icmp eq i8 %0, 0, !dbg !630
  br i1 %1, label %bb12, label %bb.i, !dbg !630

bb.i:                                             ; preds = %entry
  %2 = getelementptr inbounds i8* %path, i32 1, !dbg !630
  %3 = load i8* %2, align 1, !dbg !630
  %4 = icmp eq i8 %3, 0, !dbg !630
  br i1 %4, label %bb8.preheader.i, label %bb12, !dbg !630

bb8.preheader.i:                                  ; preds = %bb.i
  %5 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i32 0, i32 0), align 4, !dbg !631
  %6 = sext i8 %0 to i32, !dbg !632
  br label %bb8.i

bb3.i:                                            ; preds = %bb8.i
  %sext.i = shl i32 %17, 24
  %7 = ashr exact i32 %sext.i, 24, !dbg !632
  %8 = add nsw i32 %7, 65, !dbg !632
  %9 = icmp eq i32 %6, %8, !dbg !632
  br i1 %9, label %bb4.i, label %bb7.i, !dbg !632

bb4.i:                                            ; preds = %bb3.i
  %10 = load %struct.exe_disk_file_t** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i32 0, i32 4), align 4, !dbg !633
  tail call void @llvm.dbg.value(metadata !552, i64 0, metadata !233), !dbg !633
  %11 = getelementptr inbounds %struct.exe_disk_file_t* %10, i32 %17, i32 2, !dbg !634
  %12 = load %struct.stat64** %11, align 4, !dbg !634
  %13 = getelementptr inbounds %struct.stat64* %12, i32 0, i32 15, !dbg !634
  %14 = load i64* %13, align 4, !dbg !634
  %15 = icmp eq i64 %14, 0, !dbg !634
  br i1 %15, label %bb12, label %__get_sym_file.exit, !dbg !634

bb7.i:                                            ; preds = %bb3.i
  %16 = add i32 %17, 1, !dbg !631
  br label %bb8.i, !dbg !631

bb8.i:                                            ; preds = %bb7.i, %bb8.preheader.i
  %17 = phi i32 [ %16, %bb7.i ], [ 0, %bb8.preheader.i ]
  %18 = icmp ugt i32 %5, %17, !dbg !631
  br i1 %18, label %bb3.i, label %bb12, !dbg !631

__get_sym_file.exit:                              ; preds = %bb4.i
  %19 = getelementptr inbounds %struct.exe_disk_file_t* %10, i32 %17, !dbg !633
  tail call void @llvm.dbg.value(metadata !{%struct.exe_disk_file_t* %19}, i64 0, metadata !261), !dbg !628
  %20 = icmp eq %struct.exe_disk_file_t* %19, null, !dbg !635
  br i1 %20, label %bb12, label %bb, !dbg !635

bb:                                               ; preds = %__get_sym_file.exit
  %21 = getelementptr inbounds %struct.stat64* %12, i32 0, i32 3, !dbg !636
  %22 = load i32* %21, align 4, !dbg !636
  %23 = and i32 %22, 61440, !dbg !636
  %24 = icmp eq i32 %23, 40960, !dbg !636
  br i1 %24, label %bb1, label %bb11, !dbg !636

bb1:                                              ; preds = %bb
  store i8 %0, i8* %buf, align 1, !dbg !637
  %25 = icmp ugt i32 %bufsize, 1, !dbg !638
  br i1 %25, label %bb3, label %bb9, !dbg !638

bb3:                                              ; preds = %bb1
  %26 = getelementptr inbounds i8* %buf, i32 1, !dbg !638
  store i8 46, i8* %26, align 1, !dbg !638
  %27 = icmp ugt i32 %bufsize, 2, !dbg !639
  br i1 %27, label %bb5, label %bb9, !dbg !639

bb5:                                              ; preds = %bb3
  %28 = getelementptr inbounds i8* %buf, i32 2, !dbg !639
  store i8 108, i8* %28, align 1, !dbg !639
  %29 = icmp ugt i32 %bufsize, 3, !dbg !640
  br i1 %29, label %bb7, label %bb9, !dbg !640

bb7:                                              ; preds = %bb5
  %30 = getelementptr inbounds i8* %buf, i32 3, !dbg !640
  store i8 110, i8* %30, align 1, !dbg !640
  %31 = icmp ugt i32 %bufsize, 4, !dbg !641
  br i1 %31, label %bb8, label %bb9, !dbg !641

bb8:                                              ; preds = %bb7
  %32 = getelementptr inbounds i8* %buf, i32 4, !dbg !641
  store i8 107, i8* %32, align 1, !dbg !641
  br label %bb9, !dbg !641

bb9:                                              ; preds = %bb3, %bb1, %bb5, %bb8, %bb7
  %33 = icmp ugt i32 %bufsize, 5, !dbg !642
  %min = select i1 %33, i32 5, i32 %bufsize, !dbg !642
  br label %bb15, !dbg !642

bb11:                                             ; preds = %bb
  %34 = tail call i32* @__errno_location() nounwind readnone, !dbg !643
  store i32 22, i32* %34, align 4, !dbg !643
  br label %bb15, !dbg !644

bb12:                                             ; preds = %bb8.i, %bb4.i, %entry, %bb.i, %__get_sym_file.exit
  %35 = tail call i32 (i32, ...)* @syscall(i32 85, i8* %path, i8* %buf, i32 %bufsize) nounwind, !dbg !645
  tail call void @llvm.dbg.value(metadata !{i32 %35}, i64 0, metadata !263), !dbg !645
  %36 = icmp eq i32 %35, -1, !dbg !646
  br i1 %36, label %bb13, label %bb15, !dbg !646

bb13:                                             ; preds = %bb12
  %37 = tail call i32* @__errno_location() nounwind readnone, !dbg !647
  %38 = tail call i32 @klee_get_errno() nounwind, !dbg !647
  store i32 %38, i32* %37, align 4, !dbg !647
  br label %bb15, !dbg !647

bb15:                                             ; preds = %bb12, %bb13, %bb11, %bb9
  %.0 = phi i32 [ %min, %bb9 ], [ -1, %bb11 ], [ -1, %bb13 ], [ %35, %bb12 ]
  ret i32 %.0, !dbg !642
}

declare i32 @syscall(i32, ...) nounwind

declare i32 @klee_get_errno()

define i32 @fsync(i32 %fd) nounwind {
entry:
  tail call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !265), !dbg !648
  tail call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !235), !dbg !649
  %0 = icmp ult i32 %fd, 32, !dbg !651
  br i1 %0, label %bb.i, label %bb, !dbg !651

bb.i:                                             ; preds = %entry
  tail call void @llvm.dbg.value(metadata !552, i64 0, metadata !236), !dbg !652
  %1 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i32 0, i32 0, i32 %fd, i32 1, !dbg !653
  %2 = load i32* %1, align 4, !dbg !653
  %3 = and i32 %2, 1
  %toBool.i = icmp eq i32 %3, 0, !dbg !653
  br i1 %toBool.i, label %bb, label %__get_file.exit, !dbg !653

__get_file.exit:                                  ; preds = %bb.i
  %4 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i32 0, i32 0, i32 %fd, !dbg !652
  tail call void @llvm.dbg.value(metadata !{%struct.exe_file_t* %4}, i64 0, metadata !266), !dbg !650
  %5 = icmp eq %struct.exe_file_t* %4, null, !dbg !654
  br i1 %5, label %bb, label %bb1, !dbg !654

bb:                                               ; preds = %entry, %bb.i, %__get_file.exit
  %6 = tail call i32* @__errno_location() nounwind readnone, !dbg !655
  store i32 9, i32* %6, align 4, !dbg !655
  br label %bb6, !dbg !656

bb1:                                              ; preds = %__get_file.exit
  %7 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i32 0, i32 0, i32 %fd, i32 3, !dbg !657
  %8 = load %struct.exe_disk_file_t** %7, align 4, !dbg !657
  %9 = icmp eq %struct.exe_disk_file_t* %8, null, !dbg !657
  br i1 %9, label %bb3, label %bb6, !dbg !657

bb3:                                              ; preds = %bb1
  %10 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i32 0, i32 0, i32 %fd, i32 0, !dbg !658
  %11 = load i32* %10, align 4, !dbg !658
  %12 = tail call i32 (i32, ...)* @syscall(i32 118, i32 %11) nounwind, !dbg !658
  tail call void @llvm.dbg.value(metadata !{i32 %12}, i64 0, metadata !268), !dbg !658
  %13 = icmp eq i32 %12, -1, !dbg !659
  br i1 %13, label %bb4, label %bb6, !dbg !659

bb4:                                              ; preds = %bb3
  %14 = tail call i32* @__errno_location() nounwind readnone, !dbg !660
  %15 = tail call i32 @klee_get_errno() nounwind, !dbg !660
  store i32 %15, i32* %14, align 4, !dbg !660
  br label %bb6, !dbg !660

bb6:                                              ; preds = %bb3, %bb4, %bb1, %bb
  %.0 = phi i32 [ -1, %bb ], [ 0, %bb1 ], [ -1, %bb4 ], [ %12, %bb3 ]
  ret i32 %.0, !dbg !656
}

define i32 @fstatfs(i32 %fd, %struct.statfs* %buf) nounwind {
entry:
  tail call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !270), !dbg !661
  tail call void @llvm.dbg.value(metadata !{%struct.statfs* %buf}, i64 0, metadata !271), !dbg !661
  tail call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !235), !dbg !662
  %0 = icmp ult i32 %fd, 32, !dbg !664
  br i1 %0, label %bb.i, label %bb, !dbg !664

bb.i:                                             ; preds = %entry
  tail call void @llvm.dbg.value(metadata !552, i64 0, metadata !236), !dbg !665
  %1 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i32 0, i32 0, i32 %fd, i32 1, !dbg !666
  %2 = load i32* %1, align 4, !dbg !666
  %3 = and i32 %2, 1
  %toBool.i = icmp eq i32 %3, 0, !dbg !666
  br i1 %toBool.i, label %bb, label %__get_file.exit, !dbg !666

__get_file.exit:                                  ; preds = %bb.i
  %4 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i32 0, i32 0, i32 %fd, !dbg !665
  tail call void @llvm.dbg.value(metadata !{%struct.exe_file_t* %4}, i64 0, metadata !272), !dbg !663
  %5 = icmp eq %struct.exe_file_t* %4, null, !dbg !667
  br i1 %5, label %bb, label %bb1, !dbg !667

bb:                                               ; preds = %entry, %bb.i, %__get_file.exit
  %6 = tail call i32* @__errno_location() nounwind readnone, !dbg !668
  store i32 9, i32* %6, align 4, !dbg !668
  br label %bb6, !dbg !669

bb1:                                              ; preds = %__get_file.exit
  %7 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i32 0, i32 0, i32 %fd, i32 3, !dbg !670
  %8 = load %struct.exe_disk_file_t** %7, align 4, !dbg !670
  %9 = icmp eq %struct.exe_disk_file_t* %8, null, !dbg !670
  br i1 %9, label %bb3, label %bb2, !dbg !670

bb2:                                              ; preds = %bb1
  tail call void @klee_warning(i8* getelementptr inbounds ([32 x i8]* @.str3, i32 0, i32 0)) nounwind, !dbg !671
  %10 = tail call i32* @__errno_location() nounwind readnone, !dbg !672
  store i32 9, i32* %10, align 4, !dbg !672
  br label %bb6, !dbg !673

bb3:                                              ; preds = %bb1
  %11 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i32 0, i32 0, i32 %fd, i32 0, !dbg !674
  %12 = load i32* %11, align 4, !dbg !674
  %13 = tail call i32 (i32, ...)* @syscall(i32 100, i32 %12, %struct.statfs* %buf) nounwind, !dbg !674
  tail call void @llvm.dbg.value(metadata !{i32 %13}, i64 0, metadata !274), !dbg !674
  %14 = icmp eq i32 %13, -1, !dbg !675
  br i1 %14, label %bb4, label %bb6, !dbg !675

bb4:                                              ; preds = %bb3
  %15 = tail call i32* @__errno_location() nounwind readnone, !dbg !676
  %16 = tail call i32 @klee_get_errno() nounwind, !dbg !676
  store i32 %16, i32* %15, align 4, !dbg !676
  br label %bb6, !dbg !676

bb6:                                              ; preds = %bb3, %bb4, %bb2, %bb
  %.0 = phi i32 [ -1, %bb ], [ -1, %bb2 ], [ -1, %bb4 ], [ %13, %bb3 ]
  ret i32 %.0, !dbg !669
}

define i32 @__fd_ftruncate(i32 %fd, i64 %length) nounwind {
entry:
  tail call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !276), !dbg !677
  tail call void @llvm.dbg.value(metadata !{i64 %length}, i64 0, metadata !277), !dbg !677
  tail call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !235), !dbg !678
  %0 = icmp ult i32 %fd, 32, !dbg !680
  br i1 %0, label %bb.i, label %__get_file.exit.thread, !dbg !680

bb.i:                                             ; preds = %entry
  tail call void @llvm.dbg.value(metadata !552, i64 0, metadata !236), !dbg !681
  %1 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i32 0, i32 0, i32 %fd, i32 1, !dbg !682
  %2 = load i32* %1, align 4, !dbg !682
  %3 = and i32 %2, 1
  %toBool.i = icmp eq i32 %3, 0, !dbg !682
  br i1 %toBool.i, label %__get_file.exit.thread, label %__get_file.exit, !dbg !682

__get_file.exit.thread:                           ; preds = %bb.i, %entry
  tail call void @llvm.dbg.value(metadata !{%struct.exe_file_t* %6}, i64 0, metadata !278), !dbg !679
  %4 = load i32* @n_calls.4750, align 4, !dbg !683
  %5 = add nsw i32 %4, 1, !dbg !683
  store i32 %5, i32* @n_calls.4750, align 4, !dbg !683
  br label %bb

__get_file.exit:                                  ; preds = %bb.i
  %6 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i32 0, i32 0, i32 %fd, !dbg !681
  tail call void @llvm.dbg.value(metadata !{%struct.exe_file_t* %6}, i64 0, metadata !278), !dbg !679
  %7 = load i32* @n_calls.4750, align 4, !dbg !683
  %8 = add nsw i32 %7, 1, !dbg !683
  store i32 %8, i32* @n_calls.4750, align 4, !dbg !683
  %9 = icmp eq %struct.exe_file_t* %6, null, !dbg !684
  br i1 %9, label %bb, label %bb1, !dbg !684

bb:                                               ; preds = %__get_file.exit.thread, %__get_file.exit
  %10 = tail call i32* @__errno_location() nounwind readnone, !dbg !685
  store i32 9, i32* %10, align 4, !dbg !685
  br label %bb9, !dbg !686

bb1:                                              ; preds = %__get_file.exit
  %11 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i32 0, i32 5), align 4, !dbg !687
  %12 = icmp eq i32 %11, 0, !dbg !687
  br i1 %12, label %bb4, label %bb2, !dbg !687

bb2:                                              ; preds = %bb1
  %13 = load i32** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i32 0, i32 9), align 4, !dbg !687
  %14 = load i32* %13, align 4, !dbg !687
  %15 = icmp eq i32 %14, %8, !dbg !687
  br i1 %15, label %bb3, label %bb4, !dbg !687

bb3:                                              ; preds = %bb2
  %16 = add i32 %11, -1, !dbg !688
  store i32 %16, i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i32 0, i32 5), align 4, !dbg !688
  %17 = tail call i32* @__errno_location() nounwind readnone, !dbg !689
  store i32 5, i32* %17, align 4, !dbg !689
  br label %bb9, !dbg !690

bb4:                                              ; preds = %bb1, %bb2
  %18 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i32 0, i32 0, i32 %fd, i32 3, !dbg !691
  %19 = load %struct.exe_disk_file_t** %18, align 4, !dbg !691
  %20 = icmp eq %struct.exe_disk_file_t* %19, null, !dbg !691
  br i1 %20, label %bb6, label %bb5, !dbg !691

bb5:                                              ; preds = %bb4
  tail call void @klee_warning(i8* getelementptr inbounds ([30 x i8]* @.str4, i32 0, i32 0)) nounwind, !dbg !692
  %21 = tail call i32* @__errno_location() nounwind readnone, !dbg !693
  store i32 5, i32* %21, align 4, !dbg !693
  br label %bb9, !dbg !694

bb6:                                              ; preds = %bb4
  %22 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i32 0, i32 0, i32 %fd, i32 0, !dbg !695
  %23 = load i32* %22, align 4, !dbg !695
  %24 = tail call i32 (i32, ...)* @syscall(i32 194, i32 %23, i64 %length) nounwind, !dbg !695
  tail call void @llvm.dbg.value(metadata !{i32 %24}, i64 0, metadata !280), !dbg !695
  %25 = icmp eq i32 %24, -1, !dbg !696
  br i1 %25, label %bb7, label %bb9, !dbg !696

bb7:                                              ; preds = %bb6
  %26 = tail call i32* @__errno_location() nounwind readnone, !dbg !697
  %27 = tail call i32 @klee_get_errno() nounwind, !dbg !697
  store i32 %27, i32* %26, align 4, !dbg !697
  br label %bb9, !dbg !697

bb9:                                              ; preds = %bb6, %bb7, %bb5, %bb3, %bb
  %.0 = phi i32 [ -1, %bb ], [ -1, %bb3 ], [ -1, %bb5 ], [ -1, %bb7 ], [ %24, %bb6 ]
  ret i32 %.0, !dbg !686
}

define i32 @fchown(i32 %fd, i32 %owner, i32 %group) nounwind {
entry:
  tail call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !289), !dbg !698
  tail call void @llvm.dbg.value(metadata !{i32 %owner}, i64 0, metadata !290), !dbg !698
  tail call void @llvm.dbg.value(metadata !{i32 %group}, i64 0, metadata !291), !dbg !698
  tail call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !235), !dbg !699
  %0 = icmp ult i32 %fd, 32, !dbg !701
  br i1 %0, label %bb.i, label %bb, !dbg !701

bb.i:                                             ; preds = %entry
  tail call void @llvm.dbg.value(metadata !552, i64 0, metadata !236), !dbg !702
  %1 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i32 0, i32 0, i32 %fd, i32 1, !dbg !703
  %2 = load i32* %1, align 4, !dbg !703
  %3 = and i32 %2, 1
  %toBool.i = icmp eq i32 %3, 0, !dbg !703
  br i1 %toBool.i, label %bb, label %__get_file.exit, !dbg !703

__get_file.exit:                                  ; preds = %bb.i
  %4 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i32 0, i32 0, i32 %fd, !dbg !702
  tail call void @llvm.dbg.value(metadata !{%struct.exe_file_t* %4}, i64 0, metadata !292), !dbg !700
  %5 = icmp eq %struct.exe_file_t* %4, null, !dbg !704
  br i1 %5, label %bb, label %bb1, !dbg !704

bb:                                               ; preds = %entry, %bb.i, %__get_file.exit
  %6 = tail call i32* @__errno_location() nounwind readnone, !dbg !705
  store i32 9, i32* %6, align 4, !dbg !705
  br label %bb6, !dbg !706

bb1:                                              ; preds = %__get_file.exit
  %7 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i32 0, i32 0, i32 %fd, i32 3, !dbg !707
  %8 = load %struct.exe_disk_file_t** %7, align 4, !dbg !707
  %9 = icmp eq %struct.exe_disk_file_t* %8, null, !dbg !707
  br i1 %9, label %bb3, label %bb2, !dbg !707

bb2:                                              ; preds = %bb1
  tail call void @llvm.dbg.value(metadata !708, i64 0, metadata !255) nounwind, !dbg !709
  tail call void @llvm.dbg.value(metadata !561, i64 0, metadata !256) nounwind, !dbg !709
  tail call void @llvm.dbg.value(metadata !561, i64 0, metadata !257) nounwind, !dbg !709
  tail call void @klee_warning(i8* getelementptr inbounds ([32 x i8]* @.str2, i32 0, i32 0)) nounwind, !dbg !711
  %10 = tail call i32* @__errno_location() nounwind readnone, !dbg !713
  store i32 1, i32* %10, align 4, !dbg !713
  br label %bb6, !dbg !710

bb3:                                              ; preds = %bb1
  %11 = tail call i32 (i32, ...)* @syscall(i32 95, i32 %fd, i32 %owner, i32 %group) nounwind, !dbg !714
  tail call void @llvm.dbg.value(metadata !{i32 %11}, i64 0, metadata !294), !dbg !714
  %12 = icmp eq i32 %11, -1, !dbg !715
  br i1 %12, label %bb4, label %bb6, !dbg !715

bb4:                                              ; preds = %bb3
  %13 = tail call i32* @__errno_location() nounwind readnone, !dbg !716
  %14 = tail call i32 @klee_get_errno() nounwind, !dbg !716
  store i32 %14, i32* %13, align 4, !dbg !716
  br label %bb6, !dbg !716

bb6:                                              ; preds = %bb3, %bb4, %bb2, %bb
  %.0 = phi i32 [ -1, %bb ], [ -1, %bb2 ], [ -1, %bb4 ], [ %11, %bb3 ]
  ret i32 %.0, !dbg !706
}

define i32 @fchdir(i32 %fd) nounwind {
entry:
  tail call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !296), !dbg !717
  tail call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !235), !dbg !718
  %0 = icmp ult i32 %fd, 32, !dbg !720
  br i1 %0, label %bb.i, label %bb, !dbg !720

bb.i:                                             ; preds = %entry
  tail call void @llvm.dbg.value(metadata !552, i64 0, metadata !236), !dbg !721
  %1 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i32 0, i32 0, i32 %fd, i32 1, !dbg !722
  %2 = load i32* %1, align 4, !dbg !722
  %3 = and i32 %2, 1
  %toBool.i = icmp eq i32 %3, 0, !dbg !722
  br i1 %toBool.i, label %bb, label %__get_file.exit, !dbg !722

__get_file.exit:                                  ; preds = %bb.i
  %4 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i32 0, i32 0, i32 %fd, !dbg !721
  tail call void @llvm.dbg.value(metadata !{%struct.exe_file_t* %4}, i64 0, metadata !297), !dbg !719
  %5 = icmp eq %struct.exe_file_t* %4, null, !dbg !723
  br i1 %5, label %bb, label %bb1, !dbg !723

bb:                                               ; preds = %entry, %bb.i, %__get_file.exit
  %6 = tail call i32* @__errno_location() nounwind readnone, !dbg !724
  store i32 9, i32* %6, align 4, !dbg !724
  br label %bb6, !dbg !725

bb1:                                              ; preds = %__get_file.exit
  %7 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i32 0, i32 0, i32 %fd, i32 3, !dbg !726
  %8 = load %struct.exe_disk_file_t** %7, align 4, !dbg !726
  %9 = icmp eq %struct.exe_disk_file_t* %8, null, !dbg !726
  br i1 %9, label %bb3, label %bb2, !dbg !726

bb2:                                              ; preds = %bb1
  tail call void @klee_warning(i8* getelementptr inbounds ([33 x i8]* @.str5, i32 0, i32 0)) nounwind, !dbg !727
  %10 = tail call i32* @__errno_location() nounwind readnone, !dbg !728
  store i32 2, i32* %10, align 4, !dbg !728
  br label %bb6, !dbg !729

bb3:                                              ; preds = %bb1
  %11 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i32 0, i32 0, i32 %fd, i32 0, !dbg !730
  %12 = load i32* %11, align 4, !dbg !730
  %13 = tail call i32 (i32, ...)* @syscall(i32 133, i32 %12) nounwind, !dbg !730
  tail call void @llvm.dbg.value(metadata !{i32 %13}, i64 0, metadata !299), !dbg !730
  %14 = icmp eq i32 %13, -1, !dbg !731
  br i1 %14, label %bb4, label %bb6, !dbg !731

bb4:                                              ; preds = %bb3
  %15 = tail call i32* @__errno_location() nounwind readnone, !dbg !732
  %16 = tail call i32 @klee_get_errno() nounwind, !dbg !732
  store i32 %16, i32* %15, align 4, !dbg !732
  br label %bb6, !dbg !732

bb6:                                              ; preds = %bb3, %bb4, %bb2, %bb
  %.0 = phi i32 [ -1, %bb ], [ -1, %bb2 ], [ -1, %bb4 ], [ %13, %bb3 ]
  ret i32 %.0, !dbg !725
}

declare i32 @klee_get_valuel(i32)

declare void @klee_assume(i32)

define i8* @getcwd(i8* %buf, i32 %size) nounwind {
entry:
  tail call void @llvm.dbg.value(metadata !{i8* %buf}, i64 0, metadata !307), !dbg !733
  tail call void @llvm.dbg.value(metadata !{i32 %size}, i64 0, metadata !308), !dbg !733
  %0 = load i32* @n_calls.5268, align 4, !dbg !734
  %1 = add nsw i32 %0, 1, !dbg !734
  store i32 %1, i32* @n_calls.5268, align 4, !dbg !734
  %2 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i32 0, i32 5), align 4, !dbg !735
  %3 = icmp eq i32 %2, 0, !dbg !735
  br i1 %3, label %bb2, label %bb, !dbg !735

bb:                                               ; preds = %entry
  %4 = load i32** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i32 0, i32 10), align 4, !dbg !735
  %5 = load i32* %4, align 4, !dbg !735
  %6 = icmp eq i32 %5, %1, !dbg !735
  br i1 %6, label %bb1, label %bb2, !dbg !735

bb1:                                              ; preds = %bb
  %7 = add i32 %2, -1, !dbg !736
  store i32 %7, i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i32 0, i32 5), align 4, !dbg !736
  %8 = tail call i32* @__errno_location() nounwind readnone, !dbg !737
  store i32 34, i32* %8, align 4, !dbg !737
  br label %bb9, !dbg !738

bb2:                                              ; preds = %entry, %bb
  %9 = icmp eq i8* %buf, null, !dbg !739
  br i1 %9, label %bb3, label %bb6, !dbg !739

bb3:                                              ; preds = %bb2
  %10 = icmp eq i32 %size, 0, !dbg !740
  tail call void @llvm.dbg.value(metadata !741, i64 0, metadata !308), !dbg !742
  %size_addr.0 = select i1 %10, i32 1024, i32 %size
  %11 = tail call noalias i8* @malloc(i32 %size_addr.0) nounwind, !dbg !743
  tail call void @llvm.dbg.value(metadata !{i8* %11}, i64 0, metadata !307), !dbg !743
  br label %bb6, !dbg !743

bb6:                                              ; preds = %bb3, %bb2
  %size_addr.1 = phi i32 [ %size_addr.0, %bb3 ], [ %size, %bb2 ]
  %buf_addr.0 = phi i8* [ %11, %bb3 ], [ %buf, %bb2 ]
  tail call void @llvm.dbg.value(metadata !{i8* %buf_addr.0}, i64 0, metadata !301) nounwind, !dbg !744
  %12 = ptrtoint i8* %buf_addr.0 to i32, !dbg !746
  %13 = tail call i32 @klee_get_valuel(i32 %12) nounwind, !dbg !746
  %14 = inttoptr i32 %13 to i8*, !dbg !746
  tail call void @llvm.dbg.value(metadata !{i8* %14}, i64 0, metadata !302) nounwind, !dbg !746
  %15 = icmp eq i8* %14, %buf_addr.0, !dbg !747
  %16 = zext i1 %15 to i32, !dbg !747
  tail call void @klee_assume(i32 %16) nounwind, !dbg !747
  tail call void @llvm.dbg.value(metadata !{i8* %14}, i64 0, metadata !307), !dbg !745
  tail call void @llvm.dbg.value(metadata !{i32 %size_addr.1}, i64 0, metadata !304) nounwind, !dbg !748
  %17 = tail call i32 @klee_get_valuel(i32 %size_addr.1) nounwind, !dbg !750
  tail call void @llvm.dbg.value(metadata !{i32 %17}, i64 0, metadata !305) nounwind, !dbg !750
  %18 = icmp eq i32 %17, %size_addr.1, !dbg !751
  %19 = zext i1 %18 to i32, !dbg !751
  tail call void @klee_assume(i32 %19) nounwind, !dbg !751
  tail call void @llvm.dbg.value(metadata !{i32 %17}, i64 0, metadata !308), !dbg !749
  tail call void @klee_check_memory_access(i8* %14, i32 %17) nounwind, !dbg !752
  %20 = tail call i32 (i32, ...)* @syscall(i32 183, i8* %14, i32 %17) nounwind, !dbg !753
  tail call void @llvm.dbg.value(metadata !{i32 %20}, i64 0, metadata !309), !dbg !753
  %21 = icmp eq i32 %20, -1, !dbg !754
  br i1 %21, label %bb7, label %bb9, !dbg !754

bb7:                                              ; preds = %bb6
  %22 = tail call i32* @__errno_location() nounwind readnone, !dbg !755
  %23 = tail call i32 @klee_get_errno() nounwind, !dbg !755
  store i32 %23, i32* %22, align 4, !dbg !755
  br label %bb9, !dbg !756

bb9:                                              ; preds = %bb6, %bb7, %bb1
  %.0 = phi i8* [ null, %bb1 ], [ null, %bb7 ], [ %14, %bb6 ]
  ret i8* %.0, !dbg !738
}

declare noalias i8* @malloc(i32) nounwind

declare void @klee_check_memory_access(i8*, i32)

define i32 @__fd_statfs(i8* %path, %struct.statfs* %buf) nounwind {
entry:
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !319), !dbg !757
  tail call void @llvm.dbg.value(metadata !{%struct.statfs* %buf}, i64 0, metadata !320), !dbg !757
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !229), !dbg !758
  %0 = load i8* %path, align 1, !dbg !760
  tail call void @llvm.dbg.value(metadata !{i8 %0}, i64 0, metadata !230), !dbg !760
  %1 = icmp eq i8 %0, 0, !dbg !761
  br i1 %1, label %bb1, label %bb.i, !dbg !761

bb.i:                                             ; preds = %entry
  %2 = getelementptr inbounds i8* %path, i32 1, !dbg !761
  %3 = load i8* %2, align 1, !dbg !761
  %4 = icmp eq i8 %3, 0, !dbg !761
  br i1 %4, label %bb8.preheader.i, label %bb1, !dbg !761

bb8.preheader.i:                                  ; preds = %bb.i
  %5 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i32 0, i32 0), align 4, !dbg !762
  %6 = sext i8 %0 to i32, !dbg !763
  br label %bb8.i

bb3.i:                                            ; preds = %bb8.i
  %sext.i = shl i32 %17, 24
  %7 = ashr exact i32 %sext.i, 24, !dbg !763
  %8 = add nsw i32 %7, 65, !dbg !763
  %9 = icmp eq i32 %6, %8, !dbg !763
  br i1 %9, label %bb4.i, label %bb7.i, !dbg !763

bb4.i:                                            ; preds = %bb3.i
  %10 = load %struct.exe_disk_file_t** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i32 0, i32 4), align 4, !dbg !764
  tail call void @llvm.dbg.value(metadata !552, i64 0, metadata !233), !dbg !764
  %11 = getelementptr inbounds %struct.exe_disk_file_t* %10, i32 %17, i32 2, !dbg !765
  %12 = load %struct.stat64** %11, align 4, !dbg !765
  %13 = getelementptr inbounds %struct.stat64* %12, i32 0, i32 15, !dbg !765
  %14 = load i64* %13, align 4, !dbg !765
  %15 = icmp eq i64 %14, 0, !dbg !765
  br i1 %15, label %bb1, label %__get_sym_file.exit, !dbg !765

bb7.i:                                            ; preds = %bb3.i
  %16 = add i32 %17, 1, !dbg !762
  br label %bb8.i, !dbg !762

bb8.i:                                            ; preds = %bb7.i, %bb8.preheader.i
  %17 = phi i32 [ %16, %bb7.i ], [ 0, %bb8.preheader.i ]
  %18 = icmp ugt i32 %5, %17, !dbg !762
  br i1 %18, label %bb3.i, label %bb1, !dbg !762

__get_sym_file.exit:                              ; preds = %bb4.i
  %19 = getelementptr inbounds %struct.exe_disk_file_t* %10, i32 %17, !dbg !764
  tail call void @llvm.dbg.value(metadata !{%struct.exe_disk_file_t* %19}, i64 0, metadata !321), !dbg !759
  %20 = icmp eq %struct.exe_disk_file_t* %19, null, !dbg !766
  br i1 %20, label %bb1, label %bb, !dbg !766

bb:                                               ; preds = %__get_sym_file.exit
  tail call void @klee_warning(i8* getelementptr inbounds ([33 x i8]* @.str5, i32 0, i32 0)) nounwind, !dbg !767
  %21 = tail call i32* @__errno_location() nounwind readnone, !dbg !768
  store i32 2, i32* %21, align 4, !dbg !768
  br label %bb4, !dbg !769

bb1:                                              ; preds = %bb8.i, %bb4.i, %entry, %bb.i, %__get_sym_file.exit
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !311) nounwind, !dbg !770
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !301) nounwind, !dbg !772
  %22 = ptrtoint i8* %path to i32, !dbg !774
  %23 = tail call i32 @klee_get_valuel(i32 %22) nounwind, !dbg !774
  %24 = inttoptr i32 %23 to i8*, !dbg !774
  tail call void @llvm.dbg.value(metadata !{i8* %24}, i64 0, metadata !302) nounwind, !dbg !774
  %25 = icmp eq i8* %24, %path, !dbg !775
  %26 = zext i1 %25 to i32, !dbg !775
  tail call void @klee_assume(i32 %26) nounwind, !dbg !775
  tail call void @llvm.dbg.value(metadata !{i8* %24}, i64 0, metadata !312) nounwind, !dbg !773
  tail call void @llvm.dbg.value(metadata !561, i64 0, metadata !314) nounwind, !dbg !776
  br label %bb.i6, !dbg !776

bb.i6:                                            ; preds = %bb6.i8, %bb1
  %sc.0.i = phi i8* [ %24, %bb1 ], [ %sc.1.i, %bb6.i8 ]
  %27 = phi i32 [ 0, %bb1 ], [ %39, %bb6.i8 ]
  %tmp.i = add i32 %27, -1
  %28 = load i8* %sc.0.i, align 1, !dbg !777
  %29 = and i32 %tmp.i, %27, !dbg !778
  %30 = icmp eq i32 %29, 0, !dbg !778
  br i1 %30, label %bb1.i, label %bb5.i, !dbg !778

bb1.i:                                            ; preds = %bb.i6
  switch i8 %28, label %bb6.i8 [
    i8 0, label %bb2.i
    i8 47, label %bb4.i7
  ]

bb2.i:                                            ; preds = %bb1.i
  tail call void @llvm.dbg.value(metadata !{i8 %28}, i64 0, metadata !315) nounwind, !dbg !777
  store i8 0, i8* %sc.0.i, align 1, !dbg !779
  tail call void @llvm.dbg.value(metadata !{null}, i64 0, metadata !312) nounwind, !dbg !779
  br label %__concretize_string.exit, !dbg !779

bb4.i7:                                           ; preds = %bb1.i
  store i8 47, i8* %sc.0.i, align 1, !dbg !780
  %31 = getelementptr inbounds i8* %sc.0.i, i32 1, !dbg !780
  br label %bb6.i8, !dbg !780

bb5.i:                                            ; preds = %bb.i6
  %32 = sext i8 %28 to i32, !dbg !781
  %33 = tail call i32 @klee_get_valuel(i32 %32) nounwind, !dbg !781
  %34 = trunc i32 %33 to i8, !dbg !781
  %35 = icmp eq i8 %34, %28, !dbg !782
  %36 = zext i1 %35 to i32, !dbg !782
  tail call void @klee_assume(i32 %36) nounwind, !dbg !782
  store i8 %34, i8* %sc.0.i, align 1, !dbg !783
  %37 = getelementptr inbounds i8* %sc.0.i, i32 1, !dbg !783
  %38 = icmp eq i8 %34, 0, !dbg !784
  br i1 %38, label %__concretize_string.exit, label %bb6.i8, !dbg !784

bb6.i8:                                           ; preds = %bb5.i, %bb4.i7, %bb1.i
  %sc.1.i = phi i8* [ %31, %bb4.i7 ], [ %37, %bb5.i ], [ %sc.0.i, %bb1.i ]
  %39 = add i32 %27, 1, !dbg !776
  br label %bb.i6, !dbg !776

__concretize_string.exit:                         ; preds = %bb5.i, %bb2.i
  %40 = tail call i32 (i32, ...)* @syscall(i32 99, i8* %path, %struct.statfs* %buf) nounwind, !dbg !771
  tail call void @llvm.dbg.value(metadata !{i32 %40}, i64 0, metadata !323), !dbg !771
  %41 = icmp eq i32 %40, -1, !dbg !785
  br i1 %41, label %bb2, label %bb4, !dbg !785

bb2:                                              ; preds = %__concretize_string.exit
  %42 = tail call i32* @__errno_location() nounwind readnone, !dbg !786
  %43 = tail call i32 @klee_get_errno() nounwind, !dbg !786
  store i32 %43, i32* %42, align 4, !dbg !786
  br label %bb4, !dbg !786

bb4:                                              ; preds = %__concretize_string.exit, %bb2, %bb
  %.0 = phi i32 [ -1, %bb ], [ -1, %bb2 ], [ %40, %__concretize_string.exit ]
  ret i32 %.0, !dbg !769
}

define i32 @lchown(i8* %path, i32 %owner, i32 %group) nounwind {
entry:
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !325), !dbg !787
  tail call void @llvm.dbg.value(metadata !{i32 %owner}, i64 0, metadata !326), !dbg !787
  tail call void @llvm.dbg.value(metadata !{i32 %group}, i64 0, metadata !327), !dbg !787
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !229), !dbg !788
  %0 = load i8* %path, align 1, !dbg !790
  tail call void @llvm.dbg.value(metadata !{i8 %0}, i64 0, metadata !230), !dbg !790
  %1 = icmp eq i8 %0, 0, !dbg !791
  br i1 %1, label %bb1, label %bb.i, !dbg !791

bb.i:                                             ; preds = %entry
  %2 = getelementptr inbounds i8* %path, i32 1, !dbg !791
  %3 = load i8* %2, align 1, !dbg !791
  %4 = icmp eq i8 %3, 0, !dbg !791
  br i1 %4, label %bb8.preheader.i, label %bb1, !dbg !791

bb8.preheader.i:                                  ; preds = %bb.i
  %5 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i32 0, i32 0), align 4, !dbg !792
  %6 = sext i8 %0 to i32, !dbg !793
  br label %bb8.i

bb3.i:                                            ; preds = %bb8.i
  %sext.i = shl i32 %17, 24
  %7 = ashr exact i32 %sext.i, 24, !dbg !793
  %8 = add nsw i32 %7, 65, !dbg !793
  %9 = icmp eq i32 %6, %8, !dbg !793
  br i1 %9, label %bb4.i, label %bb7.i, !dbg !793

bb4.i:                                            ; preds = %bb3.i
  %10 = load %struct.exe_disk_file_t** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i32 0, i32 4), align 4, !dbg !794
  tail call void @llvm.dbg.value(metadata !552, i64 0, metadata !233), !dbg !794
  %11 = getelementptr inbounds %struct.exe_disk_file_t* %10, i32 %17, i32 2, !dbg !795
  %12 = load %struct.stat64** %11, align 4, !dbg !795
  %13 = getelementptr inbounds %struct.stat64* %12, i32 0, i32 15, !dbg !795
  %14 = load i64* %13, align 4, !dbg !795
  %15 = icmp eq i64 %14, 0, !dbg !795
  br i1 %15, label %bb1, label %__get_sym_file.exit, !dbg !795

bb7.i:                                            ; preds = %bb3.i
  %16 = add i32 %17, 1, !dbg !792
  br label %bb8.i, !dbg !792

bb8.i:                                            ; preds = %bb7.i, %bb8.preheader.i
  %17 = phi i32 [ %16, %bb7.i ], [ 0, %bb8.preheader.i ]
  %18 = icmp ugt i32 %5, %17, !dbg !792
  br i1 %18, label %bb3.i, label %bb1, !dbg !792

__get_sym_file.exit:                              ; preds = %bb4.i
  %19 = getelementptr inbounds %struct.exe_disk_file_t* %10, i32 %17, !dbg !794
  tail call void @llvm.dbg.value(metadata !{%struct.exe_disk_file_t* %19}, i64 0, metadata !328), !dbg !789
  %20 = icmp eq %struct.exe_disk_file_t* %19, null, !dbg !796
  br i1 %20, label %bb1, label %bb, !dbg !796

bb:                                               ; preds = %__get_sym_file.exit
  tail call void @llvm.dbg.value(metadata !708, i64 0, metadata !255) nounwind, !dbg !797
  tail call void @llvm.dbg.value(metadata !561, i64 0, metadata !256) nounwind, !dbg !797
  tail call void @llvm.dbg.value(metadata !561, i64 0, metadata !257) nounwind, !dbg !797
  tail call void @klee_warning(i8* getelementptr inbounds ([32 x i8]* @.str2, i32 0, i32 0)) nounwind, !dbg !799
  %21 = tail call i32* @__errno_location() nounwind readnone, !dbg !800
  store i32 1, i32* %21, align 4, !dbg !800
  br label %bb4, !dbg !798

bb1:                                              ; preds = %bb8.i, %bb4.i, %entry, %bb.i, %__get_sym_file.exit
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !311) nounwind, !dbg !801
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !301) nounwind, !dbg !803
  %22 = ptrtoint i8* %path to i32, !dbg !805
  %23 = tail call i32 @klee_get_valuel(i32 %22) nounwind, !dbg !805
  %24 = inttoptr i32 %23 to i8*, !dbg !805
  tail call void @llvm.dbg.value(metadata !{i8* %24}, i64 0, metadata !302) nounwind, !dbg !805
  %25 = icmp eq i8* %24, %path, !dbg !806
  %26 = zext i1 %25 to i32, !dbg !806
  tail call void @klee_assume(i32 %26) nounwind, !dbg !806
  tail call void @llvm.dbg.value(metadata !{i8* %24}, i64 0, metadata !312) nounwind, !dbg !804
  tail call void @llvm.dbg.value(metadata !561, i64 0, metadata !314) nounwind, !dbg !807
  br label %bb.i6, !dbg !807

bb.i6:                                            ; preds = %bb6.i8, %bb1
  %sc.0.i = phi i8* [ %24, %bb1 ], [ %sc.1.i, %bb6.i8 ]
  %27 = phi i32 [ 0, %bb1 ], [ %39, %bb6.i8 ]
  %tmp.i = add i32 %27, -1
  %28 = load i8* %sc.0.i, align 1, !dbg !808
  %29 = and i32 %tmp.i, %27, !dbg !809
  %30 = icmp eq i32 %29, 0, !dbg !809
  br i1 %30, label %bb1.i, label %bb5.i, !dbg !809

bb1.i:                                            ; preds = %bb.i6
  switch i8 %28, label %bb6.i8 [
    i8 0, label %bb2.i
    i8 47, label %bb4.i7
  ]

bb2.i:                                            ; preds = %bb1.i
  tail call void @llvm.dbg.value(metadata !{i8 %28}, i64 0, metadata !315) nounwind, !dbg !808
  store i8 0, i8* %sc.0.i, align 1, !dbg !810
  tail call void @llvm.dbg.value(metadata !{null}, i64 0, metadata !312) nounwind, !dbg !810
  br label %__concretize_string.exit, !dbg !810

bb4.i7:                                           ; preds = %bb1.i
  store i8 47, i8* %sc.0.i, align 1, !dbg !811
  %31 = getelementptr inbounds i8* %sc.0.i, i32 1, !dbg !811
  br label %bb6.i8, !dbg !811

bb5.i:                                            ; preds = %bb.i6
  %32 = sext i8 %28 to i32, !dbg !812
  %33 = tail call i32 @klee_get_valuel(i32 %32) nounwind, !dbg !812
  %34 = trunc i32 %33 to i8, !dbg !812
  %35 = icmp eq i8 %34, %28, !dbg !813
  %36 = zext i1 %35 to i32, !dbg !813
  tail call void @klee_assume(i32 %36) nounwind, !dbg !813
  store i8 %34, i8* %sc.0.i, align 1, !dbg !814
  %37 = getelementptr inbounds i8* %sc.0.i, i32 1, !dbg !814
  %38 = icmp eq i8 %34, 0, !dbg !815
  br i1 %38, label %__concretize_string.exit, label %bb6.i8, !dbg !815

bb6.i8:                                           ; preds = %bb5.i, %bb4.i7, %bb1.i
  %sc.1.i = phi i8* [ %31, %bb4.i7 ], [ %37, %bb5.i ], [ %sc.0.i, %bb1.i ]
  %39 = add i32 %27, 1, !dbg !807
  br label %bb.i6, !dbg !807

__concretize_string.exit:                         ; preds = %bb5.i, %bb2.i
  %40 = tail call i32 (i32, ...)* @syscall(i32 182, i8* %path, i32 %owner, i32 %group) nounwind, !dbg !802
  tail call void @llvm.dbg.value(metadata !{i32 %40}, i64 0, metadata !330), !dbg !802
  %41 = icmp eq i32 %40, -1, !dbg !816
  br i1 %41, label %bb2, label %bb4, !dbg !816

bb2:                                              ; preds = %__concretize_string.exit
  %42 = tail call i32* @__errno_location() nounwind readnone, !dbg !817
  %43 = tail call i32 @klee_get_errno() nounwind, !dbg !817
  store i32 %43, i32* %42, align 4, !dbg !817
  br label %bb4, !dbg !817

bb4:                                              ; preds = %__concretize_string.exit, %bb2, %bb
  %.0 = phi i32 [ -1, %bb ], [ -1, %bb2 ], [ %40, %__concretize_string.exit ]
  ret i32 %.0, !dbg !798
}

define i32 @chown(i8* %path, i32 %owner, i32 %group) nounwind {
entry:
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !332), !dbg !818
  tail call void @llvm.dbg.value(metadata !{i32 %owner}, i64 0, metadata !333), !dbg !818
  tail call void @llvm.dbg.value(metadata !{i32 %group}, i64 0, metadata !334), !dbg !818
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !229), !dbg !819
  %0 = load i8* %path, align 1, !dbg !821
  tail call void @llvm.dbg.value(metadata !{i8 %0}, i64 0, metadata !230), !dbg !821
  %1 = icmp eq i8 %0, 0, !dbg !822
  br i1 %1, label %bb1, label %bb.i, !dbg !822

bb.i:                                             ; preds = %entry
  %2 = getelementptr inbounds i8* %path, i32 1, !dbg !822
  %3 = load i8* %2, align 1, !dbg !822
  %4 = icmp eq i8 %3, 0, !dbg !822
  br i1 %4, label %bb8.preheader.i, label %bb1, !dbg !822

bb8.preheader.i:                                  ; preds = %bb.i
  %5 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i32 0, i32 0), align 4, !dbg !823
  %6 = sext i8 %0 to i32, !dbg !824
  br label %bb8.i

bb3.i:                                            ; preds = %bb8.i
  %sext.i = shl i32 %17, 24
  %7 = ashr exact i32 %sext.i, 24, !dbg !824
  %8 = add nsw i32 %7, 65, !dbg !824
  %9 = icmp eq i32 %6, %8, !dbg !824
  br i1 %9, label %bb4.i, label %bb7.i, !dbg !824

bb4.i:                                            ; preds = %bb3.i
  %10 = load %struct.exe_disk_file_t** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i32 0, i32 4), align 4, !dbg !825
  tail call void @llvm.dbg.value(metadata !552, i64 0, metadata !233), !dbg !825
  %11 = getelementptr inbounds %struct.exe_disk_file_t* %10, i32 %17, i32 2, !dbg !826
  %12 = load %struct.stat64** %11, align 4, !dbg !826
  %13 = getelementptr inbounds %struct.stat64* %12, i32 0, i32 15, !dbg !826
  %14 = load i64* %13, align 4, !dbg !826
  %15 = icmp eq i64 %14, 0, !dbg !826
  br i1 %15, label %bb1, label %__get_sym_file.exit, !dbg !826

bb7.i:                                            ; preds = %bb3.i
  %16 = add i32 %17, 1, !dbg !823
  br label %bb8.i, !dbg !823

bb8.i:                                            ; preds = %bb7.i, %bb8.preheader.i
  %17 = phi i32 [ %16, %bb7.i ], [ 0, %bb8.preheader.i ]
  %18 = icmp ugt i32 %5, %17, !dbg !823
  br i1 %18, label %bb3.i, label %bb1, !dbg !823

__get_sym_file.exit:                              ; preds = %bb4.i
  %19 = getelementptr inbounds %struct.exe_disk_file_t* %10, i32 %17, !dbg !825
  tail call void @llvm.dbg.value(metadata !{%struct.exe_disk_file_t* %19}, i64 0, metadata !335), !dbg !820
  %20 = icmp eq %struct.exe_disk_file_t* %19, null, !dbg !827
  br i1 %20, label %bb1, label %bb, !dbg !827

bb:                                               ; preds = %__get_sym_file.exit
  tail call void @llvm.dbg.value(metadata !708, i64 0, metadata !255) nounwind, !dbg !828
  tail call void @llvm.dbg.value(metadata !561, i64 0, metadata !256) nounwind, !dbg !828
  tail call void @llvm.dbg.value(metadata !561, i64 0, metadata !257) nounwind, !dbg !828
  tail call void @klee_warning(i8* getelementptr inbounds ([32 x i8]* @.str2, i32 0, i32 0)) nounwind, !dbg !830
  %21 = tail call i32* @__errno_location() nounwind readnone, !dbg !831
  store i32 1, i32* %21, align 4, !dbg !831
  br label %bb4, !dbg !829

bb1:                                              ; preds = %bb8.i, %bb4.i, %entry, %bb.i, %__get_sym_file.exit
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !311) nounwind, !dbg !832
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !301) nounwind, !dbg !834
  %22 = ptrtoint i8* %path to i32, !dbg !836
  %23 = tail call i32 @klee_get_valuel(i32 %22) nounwind, !dbg !836
  %24 = inttoptr i32 %23 to i8*, !dbg !836
  tail call void @llvm.dbg.value(metadata !{i8* %24}, i64 0, metadata !302) nounwind, !dbg !836
  %25 = icmp eq i8* %24, %path, !dbg !837
  %26 = zext i1 %25 to i32, !dbg !837
  tail call void @klee_assume(i32 %26) nounwind, !dbg !837
  tail call void @llvm.dbg.value(metadata !{i8* %24}, i64 0, metadata !312) nounwind, !dbg !835
  tail call void @llvm.dbg.value(metadata !561, i64 0, metadata !314) nounwind, !dbg !838
  br label %bb.i6, !dbg !838

bb.i6:                                            ; preds = %bb6.i8, %bb1
  %sc.0.i = phi i8* [ %24, %bb1 ], [ %sc.1.i, %bb6.i8 ]
  %27 = phi i32 [ 0, %bb1 ], [ %39, %bb6.i8 ]
  %tmp.i = add i32 %27, -1
  %28 = load i8* %sc.0.i, align 1, !dbg !839
  %29 = and i32 %tmp.i, %27, !dbg !840
  %30 = icmp eq i32 %29, 0, !dbg !840
  br i1 %30, label %bb1.i, label %bb5.i, !dbg !840

bb1.i:                                            ; preds = %bb.i6
  switch i8 %28, label %bb6.i8 [
    i8 0, label %bb2.i
    i8 47, label %bb4.i7
  ]

bb2.i:                                            ; preds = %bb1.i
  tail call void @llvm.dbg.value(metadata !{i8 %28}, i64 0, metadata !315) nounwind, !dbg !839
  store i8 0, i8* %sc.0.i, align 1, !dbg !841
  tail call void @llvm.dbg.value(metadata !{null}, i64 0, metadata !312) nounwind, !dbg !841
  br label %__concretize_string.exit, !dbg !841

bb4.i7:                                           ; preds = %bb1.i
  store i8 47, i8* %sc.0.i, align 1, !dbg !842
  %31 = getelementptr inbounds i8* %sc.0.i, i32 1, !dbg !842
  br label %bb6.i8, !dbg !842

bb5.i:                                            ; preds = %bb.i6
  %32 = sext i8 %28 to i32, !dbg !843
  %33 = tail call i32 @klee_get_valuel(i32 %32) nounwind, !dbg !843
  %34 = trunc i32 %33 to i8, !dbg !843
  %35 = icmp eq i8 %34, %28, !dbg !844
  %36 = zext i1 %35 to i32, !dbg !844
  tail call void @klee_assume(i32 %36) nounwind, !dbg !844
  store i8 %34, i8* %sc.0.i, align 1, !dbg !845
  %37 = getelementptr inbounds i8* %sc.0.i, i32 1, !dbg !845
  %38 = icmp eq i8 %34, 0, !dbg !846
  br i1 %38, label %__concretize_string.exit, label %bb6.i8, !dbg !846

bb6.i8:                                           ; preds = %bb5.i, %bb4.i7, %bb1.i
  %sc.1.i = phi i8* [ %31, %bb4.i7 ], [ %37, %bb5.i ], [ %sc.0.i, %bb1.i ]
  %39 = add i32 %27, 1, !dbg !838
  br label %bb.i6, !dbg !838

__concretize_string.exit:                         ; preds = %bb5.i, %bb2.i
  %40 = tail call i32 (i32, ...)* @syscall(i32 182, i8* %path, i32 %owner, i32 %group) nounwind, !dbg !833
  tail call void @llvm.dbg.value(metadata !{i32 %40}, i64 0, metadata !337), !dbg !833
  %41 = icmp eq i32 %40, -1, !dbg !847
  br i1 %41, label %bb2, label %bb4, !dbg !847

bb2:                                              ; preds = %__concretize_string.exit
  %42 = tail call i32* @__errno_location() nounwind readnone, !dbg !848
  %43 = tail call i32 @klee_get_errno() nounwind, !dbg !848
  store i32 %43, i32* %42, align 4, !dbg !848
  br label %bb4, !dbg !848

bb4:                                              ; preds = %__concretize_string.exit, %bb2, %bb
  %.0 = phi i32 [ -1, %bb ], [ -1, %bb2 ], [ %40, %__concretize_string.exit ]
  ret i32 %.0, !dbg !829
}

define i32 @chdir(i8* %path) nounwind {
entry:
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !339), !dbg !849
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !229), !dbg !850
  %0 = load i8* %path, align 1, !dbg !852
  tail call void @llvm.dbg.value(metadata !{i8 %0}, i64 0, metadata !230), !dbg !852
  %1 = icmp eq i8 %0, 0, !dbg !853
  br i1 %1, label %bb1, label %bb.i, !dbg !853

bb.i:                                             ; preds = %entry
  %2 = getelementptr inbounds i8* %path, i32 1, !dbg !853
  %3 = load i8* %2, align 1, !dbg !853
  %4 = icmp eq i8 %3, 0, !dbg !853
  br i1 %4, label %bb8.preheader.i, label %bb1, !dbg !853

bb8.preheader.i:                                  ; preds = %bb.i
  %5 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i32 0, i32 0), align 4, !dbg !854
  %6 = sext i8 %0 to i32, !dbg !855
  br label %bb8.i

bb3.i:                                            ; preds = %bb8.i
  %sext.i = shl i32 %17, 24
  %7 = ashr exact i32 %sext.i, 24, !dbg !855
  %8 = add nsw i32 %7, 65, !dbg !855
  %9 = icmp eq i32 %6, %8, !dbg !855
  br i1 %9, label %bb4.i, label %bb7.i, !dbg !855

bb4.i:                                            ; preds = %bb3.i
  %10 = load %struct.exe_disk_file_t** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i32 0, i32 4), align 4, !dbg !856
  tail call void @llvm.dbg.value(metadata !552, i64 0, metadata !233), !dbg !856
  %11 = getelementptr inbounds %struct.exe_disk_file_t* %10, i32 %17, i32 2, !dbg !857
  %12 = load %struct.stat64** %11, align 4, !dbg !857
  %13 = getelementptr inbounds %struct.stat64* %12, i32 0, i32 15, !dbg !857
  %14 = load i64* %13, align 4, !dbg !857
  %15 = icmp eq i64 %14, 0, !dbg !857
  br i1 %15, label %bb1, label %__get_sym_file.exit, !dbg !857

bb7.i:                                            ; preds = %bb3.i
  %16 = add i32 %17, 1, !dbg !854
  br label %bb8.i, !dbg !854

bb8.i:                                            ; preds = %bb7.i, %bb8.preheader.i
  %17 = phi i32 [ %16, %bb7.i ], [ 0, %bb8.preheader.i ]
  %18 = icmp ugt i32 %5, %17, !dbg !854
  br i1 %18, label %bb3.i, label %bb1, !dbg !854

__get_sym_file.exit:                              ; preds = %bb4.i
  %19 = getelementptr inbounds %struct.exe_disk_file_t* %10, i32 %17, !dbg !856
  tail call void @llvm.dbg.value(metadata !{%struct.exe_disk_file_t* %19}, i64 0, metadata !340), !dbg !851
  %20 = icmp eq %struct.exe_disk_file_t* %19, null, !dbg !858
  br i1 %20, label %bb1, label %bb, !dbg !858

bb:                                               ; preds = %__get_sym_file.exit
  tail call void @klee_warning(i8* getelementptr inbounds ([33 x i8]* @.str5, i32 0, i32 0)) nounwind, !dbg !859
  %21 = tail call i32* @__errno_location() nounwind readnone, !dbg !860
  store i32 2, i32* %21, align 4, !dbg !860
  br label %bb4, !dbg !861

bb1:                                              ; preds = %bb8.i, %bb4.i, %entry, %bb.i, %__get_sym_file.exit
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !311) nounwind, !dbg !862
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !301) nounwind, !dbg !864
  %22 = ptrtoint i8* %path to i32, !dbg !866
  %23 = tail call i32 @klee_get_valuel(i32 %22) nounwind, !dbg !866
  %24 = inttoptr i32 %23 to i8*, !dbg !866
  tail call void @llvm.dbg.value(metadata !{i8* %24}, i64 0, metadata !302) nounwind, !dbg !866
  %25 = icmp eq i8* %24, %path, !dbg !867
  %26 = zext i1 %25 to i32, !dbg !867
  tail call void @klee_assume(i32 %26) nounwind, !dbg !867
  tail call void @llvm.dbg.value(metadata !{i8* %24}, i64 0, metadata !312) nounwind, !dbg !865
  tail call void @llvm.dbg.value(metadata !561, i64 0, metadata !314) nounwind, !dbg !868
  br label %bb.i6, !dbg !868

bb.i6:                                            ; preds = %bb6.i8, %bb1
  %sc.0.i = phi i8* [ %24, %bb1 ], [ %sc.1.i, %bb6.i8 ]
  %27 = phi i32 [ 0, %bb1 ], [ %39, %bb6.i8 ]
  %tmp.i = add i32 %27, -1
  %28 = load i8* %sc.0.i, align 1, !dbg !869
  %29 = and i32 %tmp.i, %27, !dbg !870
  %30 = icmp eq i32 %29, 0, !dbg !870
  br i1 %30, label %bb1.i, label %bb5.i, !dbg !870

bb1.i:                                            ; preds = %bb.i6
  switch i8 %28, label %bb6.i8 [
    i8 0, label %bb2.i
    i8 47, label %bb4.i7
  ]

bb2.i:                                            ; preds = %bb1.i
  tail call void @llvm.dbg.value(metadata !{i8 %28}, i64 0, metadata !315) nounwind, !dbg !869
  store i8 0, i8* %sc.0.i, align 1, !dbg !871
  tail call void @llvm.dbg.value(metadata !{null}, i64 0, metadata !312) nounwind, !dbg !871
  br label %__concretize_string.exit, !dbg !871

bb4.i7:                                           ; preds = %bb1.i
  store i8 47, i8* %sc.0.i, align 1, !dbg !872
  %31 = getelementptr inbounds i8* %sc.0.i, i32 1, !dbg !872
  br label %bb6.i8, !dbg !872

bb5.i:                                            ; preds = %bb.i6
  %32 = sext i8 %28 to i32, !dbg !873
  %33 = tail call i32 @klee_get_valuel(i32 %32) nounwind, !dbg !873
  %34 = trunc i32 %33 to i8, !dbg !873
  %35 = icmp eq i8 %34, %28, !dbg !874
  %36 = zext i1 %35 to i32, !dbg !874
  tail call void @klee_assume(i32 %36) nounwind, !dbg !874
  store i8 %34, i8* %sc.0.i, align 1, !dbg !875
  %37 = getelementptr inbounds i8* %sc.0.i, i32 1, !dbg !875
  %38 = icmp eq i8 %34, 0, !dbg !876
  br i1 %38, label %__concretize_string.exit, label %bb6.i8, !dbg !876

bb6.i8:                                           ; preds = %bb5.i, %bb4.i7, %bb1.i
  %sc.1.i = phi i8* [ %31, %bb4.i7 ], [ %37, %bb5.i ], [ %sc.0.i, %bb1.i ]
  %39 = add i32 %27, 1, !dbg !868
  br label %bb.i6, !dbg !868

__concretize_string.exit:                         ; preds = %bb5.i, %bb2.i
  %40 = tail call i32 (i32, ...)* @syscall(i32 12, i8* %path) nounwind, !dbg !863
  tail call void @llvm.dbg.value(metadata !{i32 %40}, i64 0, metadata !342), !dbg !863
  %41 = icmp eq i32 %40, -1, !dbg !877
  br i1 %41, label %bb2, label %bb4, !dbg !877

bb2:                                              ; preds = %__concretize_string.exit
  %42 = tail call i32* @__errno_location() nounwind readnone, !dbg !878
  %43 = tail call i32 @klee_get_errno() nounwind, !dbg !878
  store i32 %43, i32* %42, align 4, !dbg !878
  br label %bb4, !dbg !878

bb4:                                              ; preds = %__concretize_string.exit, %bb2, %bb
  %.0 = phi i32 [ -1, %bb ], [ -1, %bb2 ], [ %40, %__concretize_string.exit ]
  ret i32 %.0, !dbg !861
}

define i32 @select(i32 %nfds, %struct.fd_set* %read, %struct.fd_set* %write, %struct.fd_set* %except, %struct.timespec* nocapture %timeout) nounwind {
entry:
  %in_read = alloca %struct.fd_set, align 8
  %in_write = alloca %struct.fd_set, align 8
  %in_except = alloca %struct.fd_set, align 8
  %os_read = alloca %struct.fd_set, align 8
  %os_write = alloca %struct.fd_set, align 8
  %os_except = alloca %struct.fd_set, align 8
  %tv = alloca %struct.timespec, align 8
  call void @llvm.dbg.value(metadata !{i32 %nfds}, i64 0, metadata !350), !dbg !879
  call void @llvm.dbg.value(metadata !{%struct.fd_set* %read}, i64 0, metadata !351), !dbg !879
  call void @llvm.dbg.value(metadata !{%struct.fd_set* %write}, i64 0, metadata !352), !dbg !879
  call void @llvm.dbg.value(metadata !{%struct.fd_set* %except}, i64 0, metadata !353), !dbg !880
  call void @llvm.dbg.value(metadata !{%struct.timespec* %timeout}, i64 0, metadata !354), !dbg !880
  call void @llvm.dbg.declare(metadata !{%struct.fd_set* %in_read}, metadata !355), !dbg !881
  call void @llvm.dbg.declare(metadata !{%struct.fd_set* %in_write}, metadata !357), !dbg !881
  call void @llvm.dbg.declare(metadata !{%struct.fd_set* %in_except}, metadata !358), !dbg !881
  call void @llvm.dbg.declare(metadata !{%struct.fd_set* %os_read}, metadata !359), !dbg !881
  call void @llvm.dbg.declare(metadata !{%struct.fd_set* %os_write}, metadata !360), !dbg !881
  call void @llvm.dbg.declare(metadata !{%struct.fd_set* %os_except}, metadata !361), !dbg !881
  call void @llvm.dbg.value(metadata !561, i64 0, metadata !363), !dbg !882
  call void @llvm.dbg.value(metadata !561, i64 0, metadata !364), !dbg !882
  %0 = icmp eq %struct.fd_set* %read, null, !dbg !883
  %in_read3 = bitcast %struct.fd_set* %in_read to i8*, !dbg !884
  br i1 %0, label %bb2, label %bb, !dbg !883

bb:                                               ; preds = %entry
  %1 = bitcast %struct.fd_set* %read to i8*, !dbg !885
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %in_read3, i8* %1, i32 128, i32 4, i1 false), !dbg !885
  call void @llvm.memset.p0i8.i32(i8* %1, i8 0, i32 128, i32 4, i1 false), !dbg !886
  br label %bb4, !dbg !886

bb2:                                              ; preds = %entry
  call void @llvm.memset.p0i8.i32(i8* %in_read3, i8 0, i32 128, i32 8, i1 false), !dbg !884
  br label %bb4, !dbg !884

bb4:                                              ; preds = %bb2, %bb
  %2 = icmp eq %struct.fd_set* %write, null, !dbg !887
  %in_write8 = bitcast %struct.fd_set* %in_write to i8*, !dbg !888
  br i1 %2, label %bb7, label %bb5, !dbg !887

bb5:                                              ; preds = %bb4
  %3 = bitcast %struct.fd_set* %write to i8*, !dbg !889
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %in_write8, i8* %3, i32 128, i32 4, i1 false), !dbg !889
  call void @llvm.memset.p0i8.i32(i8* %3, i8 0, i32 128, i32 4, i1 false), !dbg !890
  br label %bb9, !dbg !890

bb7:                                              ; preds = %bb4
  call void @llvm.memset.p0i8.i32(i8* %in_write8, i8 0, i32 128, i32 8, i1 false), !dbg !888
  br label %bb9, !dbg !888

bb9:                                              ; preds = %bb7, %bb5
  %4 = icmp eq %struct.fd_set* %except, null, !dbg !891
  %in_except13 = bitcast %struct.fd_set* %in_except to i8*, !dbg !892
  br i1 %4, label %bb12, label %bb10, !dbg !891

bb10:                                             ; preds = %bb9
  %5 = bitcast %struct.fd_set* %except to i8*, !dbg !893
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %in_except13, i8* %5, i32 128, i32 4, i1 false), !dbg !893
  call void @llvm.memset.p0i8.i32(i8* %5, i8 0, i32 128, i32 4, i1 false), !dbg !894
  br label %bb14, !dbg !894

bb12:                                             ; preds = %bb9
  call void @llvm.memset.p0i8.i32(i8* %in_except13, i8 0, i32 128, i32 8, i1 false), !dbg !892
  br label %bb14, !dbg !892

bb14:                                             ; preds = %bb12, %bb10
  %os_read15 = bitcast %struct.fd_set* %os_read to i8*, !dbg !895
  call void @llvm.memset.p0i8.i32(i8* %os_read15, i8 0, i32 128, i32 8, i1 false), !dbg !895
  %os_write16 = bitcast %struct.fd_set* %os_write to i8*, !dbg !896
  call void @llvm.memset.p0i8.i32(i8* %os_write16, i8 0, i32 128, i32 8, i1 false), !dbg !896
  %os_except17 = bitcast %struct.fd_set* %os_except to i8*, !dbg !897
  call void @llvm.memset.p0i8.i32(i8* %os_except17, i8 0, i32 128, i32 8, i1 false), !dbg !897
  call void @llvm.dbg.value(metadata !561, i64 0, metadata !362), !dbg !898
  br label %bb40, !dbg !898

bb18:                                             ; preds = %bb40
  %6 = sdiv i32 %78, 32, !dbg !899
  %7 = getelementptr inbounds %struct.fd_set* %in_read, i32 0, i32 0, i32 %6, !dbg !899
  %8 = load i32* %7, align 4, !dbg !899
  %9 = and i32 %78, 31
  %10 = shl i32 1, %9, !dbg !899
  %11 = and i32 %8, %10, !dbg !899
  %12 = icmp eq i32 %11, 0, !dbg !899
  br i1 %12, label %bb19, label %bb21, !dbg !899

bb19:                                             ; preds = %bb18
  %13 = getelementptr inbounds %struct.fd_set* %in_write, i32 0, i32 0, i32 %6, !dbg !899
  %14 = load i32* %13, align 4, !dbg !899
  %15 = and i32 %14, %10, !dbg !899
  %16 = icmp eq i32 %15, 0, !dbg !899
  br i1 %16, label %bb20, label %bb21, !dbg !899

bb20:                                             ; preds = %bb19
  %17 = getelementptr inbounds %struct.fd_set* %in_except, i32 0, i32 0, i32 %6, !dbg !899
  %18 = load i32* %17, align 4, !dbg !899
  %19 = and i32 %18, %10, !dbg !899
  %20 = icmp eq i32 %19, 0, !dbg !899
  br i1 %20, label %bb39, label %bb21, !dbg !899

bb21:                                             ; preds = %bb20, %bb19, %bb18
  %21 = icmp ult i32 %78, 32, !dbg !900
  br i1 %21, label %bb.i, label %bb22, !dbg !900

bb.i:                                             ; preds = %bb21
  %22 = load i32* %scevgep79, align 4, !dbg !902
  %23 = and i32 %22, 1
  %toBool.i = icmp eq i32 %23, 0, !dbg !902
  %24 = icmp eq %struct.exe_file_t* %scevgep76, null, !dbg !903
  %or.cond = or i1 %toBool.i, %24
  br i1 %or.cond, label %bb22, label %bb23, !dbg !902

bb22:                                             ; preds = %bb21, %bb.i
  tail call void @llvm.dbg.value(metadata !{i32 %78}, i64 0, metadata !235), !dbg !904
  %25 = call i32* @__errno_location() nounwind readnone, !dbg !905
  store i32 9, i32* %25, align 4, !dbg !905
  br label %bb61, !dbg !906

bb23:                                             ; preds = %bb.i
  %26 = load %struct.exe_disk_file_t** %scevgep78, align 4, !dbg !907
  %27 = icmp eq %struct.exe_disk_file_t* %26, null, !dbg !907
  %28 = icmp ne i32 %11, 0, !dbg !908
  br i1 %27, label %bb31, label %bb24, !dbg !907

bb24:                                             ; preds = %bb23
  br i1 %28, label %bb25, label %bb26, !dbg !908

bb25:                                             ; preds = %bb24
  %29 = getelementptr inbounds %struct.fd_set* %read, i32 0, i32 0, i32 %6, !dbg !908
  %30 = load i32* %29, align 4, !dbg !908
  %31 = or i32 %30, %10, !dbg !908
  store i32 %31, i32* %29, align 4, !dbg !908
  br label %bb26, !dbg !908

bb26:                                             ; preds = %bb24, %bb25
  %32 = getelementptr inbounds %struct.fd_set* %in_write, i32 0, i32 0, i32 %6, !dbg !909
  %33 = load i32* %32, align 4, !dbg !909
  %34 = and i32 %33, %10, !dbg !909
  %35 = icmp eq i32 %34, 0, !dbg !909
  br i1 %35, label %bb28, label %bb27, !dbg !909

bb27:                                             ; preds = %bb26
  %36 = getelementptr inbounds %struct.fd_set* %write, i32 0, i32 0, i32 %6, !dbg !909
  %37 = load i32* %36, align 4, !dbg !909
  %38 = or i32 %37, %10, !dbg !909
  store i32 %38, i32* %36, align 4, !dbg !909
  br label %bb28, !dbg !909

bb28:                                             ; preds = %bb26, %bb27
  %39 = getelementptr inbounds %struct.fd_set* %in_except, i32 0, i32 0, i32 %6, !dbg !910
  %40 = load i32* %39, align 4, !dbg !910
  %41 = and i32 %40, %10, !dbg !910
  %42 = icmp eq i32 %41, 0, !dbg !910
  br i1 %42, label %bb30, label %bb29, !dbg !910

bb29:                                             ; preds = %bb28
  %43 = getelementptr inbounds %struct.fd_set* %except, i32 0, i32 0, i32 %6, !dbg !910
  %44 = load i32* %43, align 4, !dbg !910
  %45 = or i32 %44, %10, !dbg !910
  store i32 %45, i32* %43, align 4, !dbg !910
  br label %bb30, !dbg !910

bb30:                                             ; preds = %bb28, %bb29
  %46 = add nsw i32 %count.1, 1, !dbg !911
  br label %bb39, !dbg !911

bb31:                                             ; preds = %bb23
  br i1 %28, label %bb32, label %bb33, !dbg !912

bb32:                                             ; preds = %bb31
  %47 = load i32* %scevgep7677, align 4, !dbg !912
  %48 = sdiv i32 %47, 32, !dbg !912
  %49 = getelementptr inbounds %struct.fd_set* %os_read, i32 0, i32 0, i32 %48, !dbg !912
  %50 = load i32* %49, align 4, !dbg !912
  %51 = and i32 %47, 31
  %52 = shl i32 1, %51, !dbg !912
  %53 = or i32 %50, %52, !dbg !912
  store i32 %53, i32* %49, align 4, !dbg !912
  br label %bb33, !dbg !912

bb33:                                             ; preds = %bb31, %bb32
  %54 = getelementptr inbounds %struct.fd_set* %in_write, i32 0, i32 0, i32 %6, !dbg !913
  %55 = load i32* %54, align 4, !dbg !913
  %56 = and i32 %55, %10, !dbg !913
  %57 = icmp eq i32 %56, 0, !dbg !913
  br i1 %57, label %bb35, label %bb34, !dbg !913

bb34:                                             ; preds = %bb33
  %58 = load i32* %scevgep7677, align 4, !dbg !913
  %59 = sdiv i32 %58, 32, !dbg !913
  %60 = getelementptr inbounds %struct.fd_set* %os_write, i32 0, i32 0, i32 %59, !dbg !913
  %61 = load i32* %60, align 4, !dbg !913
  %62 = and i32 %58, 31
  %63 = shl i32 1, %62, !dbg !913
  %64 = or i32 %61, %63, !dbg !913
  store i32 %64, i32* %60, align 4, !dbg !913
  br label %bb35, !dbg !913

bb35:                                             ; preds = %bb33, %bb34
  %65 = getelementptr inbounds %struct.fd_set* %in_except, i32 0, i32 0, i32 %6, !dbg !914
  %66 = load i32* %65, align 4, !dbg !914
  %67 = and i32 %66, %10, !dbg !914
  %68 = icmp eq i32 %67, 0, !dbg !914
  %.pre = load i32* %scevgep7677, align 4
  br i1 %68, label %bb37, label %bb36, !dbg !914

bb36:                                             ; preds = %bb35
  %69 = sdiv i32 %.pre, 32, !dbg !914
  %70 = getelementptr inbounds %struct.fd_set* %os_except, i32 0, i32 0, i32 %69, !dbg !914
  %71 = load i32* %70, align 4, !dbg !914
  %72 = and i32 %.pre, 31
  %73 = shl i32 1, %72, !dbg !914
  %74 = or i32 %71, %73, !dbg !914
  store i32 %74, i32* %70, align 4, !dbg !914
  br label %bb37, !dbg !914

bb37:                                             ; preds = %bb35, %bb36
  %75 = add nsw i32 %.pre, 1, !dbg !915
  %76 = icmp slt i32 %.pre, %os_nfds.1, !dbg !915
  %os_nfds.1. = select i1 %76, i32 %os_nfds.1, i32 %75
  br label %bb39

bb39:                                             ; preds = %bb37, %bb20, %bb30
  %count.0 = phi i32 [ %46, %bb30 ], [ %count.1, %bb20 ], [ %count.1, %bb37 ]
  %os_nfds.0 = phi i32 [ %os_nfds.1, %bb30 ], [ %os_nfds.1, %bb20 ], [ %os_nfds.1., %bb37 ]
  %77 = add nsw i32 %78, 1, !dbg !898
  br label %bb40, !dbg !898

bb40:                                             ; preds = %bb39, %bb14
  %78 = phi i32 [ 0, %bb14 ], [ %77, %bb39 ]
  %count.1 = phi i32 [ 0, %bb14 ], [ %count.0, %bb39 ]
  %os_nfds.1 = phi i32 [ 0, %bb14 ], [ %os_nfds.0, %bb39 ]
  %scevgep76 = getelementptr %struct.exe_sym_env_t* @__exe_env, i32 0, i32 0, i32 %78
  %scevgep7677 = getelementptr %struct.exe_sym_env_t* @__exe_env, i32 0, i32 0, i32 %78, i32 0
  %scevgep78 = getelementptr %struct.exe_sym_env_t* @__exe_env, i32 0, i32 0, i32 %78, i32 3
  %scevgep79 = getelementptr %struct.exe_sym_env_t* @__exe_env, i32 0, i32 0, i32 %78, i32 1
  %79 = icmp slt i32 %78, %nfds, !dbg !898
  br i1 %79, label %bb18, label %bb41, !dbg !898

bb41:                                             ; preds = %bb40
  %80 = icmp sgt i32 %os_nfds.1, 0, !dbg !916
  br i1 %80, label %bb42, label %bb61, !dbg !916

bb42:                                             ; preds = %bb41
  call void @llvm.dbg.declare(metadata !{%struct.timespec* %tv}, metadata !367), !dbg !917
  %81 = getelementptr inbounds %struct.timespec* %tv, i32 0, i32 0, !dbg !917
  store i32 0, i32* %81, align 8, !dbg !917
  %82 = getelementptr inbounds %struct.timespec* %tv, i32 0, i32 1, !dbg !917
  store i32 0, i32* %82, align 4, !dbg !917
  %83 = call i32 (i32, ...)* @syscall(i32 82, i32 %os_nfds.1, %struct.fd_set* %os_read, %struct.fd_set* %os_write, %struct.fd_set* %os_except, %struct.timespec* %tv) nounwind, !dbg !918
  call void @llvm.dbg.value(metadata !{i32 %83}, i64 0, metadata !369), !dbg !918
  %84 = icmp eq i32 %83, -1, !dbg !919
  br i1 %84, label %bb43, label %bb45, !dbg !919

bb43:                                             ; preds = %bb42
  %85 = icmp eq i32 %count.1, 0, !dbg !920
  br i1 %85, label %bb44, label %bb61, !dbg !920

bb44:                                             ; preds = %bb43
  %86 = call i32* @__errno_location() nounwind readnone, !dbg !921
  %87 = call i32 @klee_get_errno() nounwind, !dbg !921
  store i32 %87, i32* %86, align 4, !dbg !921
  br label %bb61, !dbg !922

bb45:                                             ; preds = %bb42
  %88 = add nsw i32 %83, %count.1, !dbg !923
  call void @llvm.dbg.value(metadata !{i32 %88}, i64 0, metadata !363), !dbg !923
  call void @llvm.dbg.value(metadata !561, i64 0, metadata !362), !dbg !924
  %89 = icmp sgt i32 %nfds, 0, !dbg !924
  br i1 %89, label %bb46, label %bb61, !dbg !924

bb46:                                             ; preds = %bb45, %bb58
  %90 = phi i32 [ %139, %bb58 ], [ 0, %bb45 ]
  %scevgep71 = getelementptr %struct.exe_sym_env_t* @__exe_env, i32 0, i32 0, i32 %90
  %scevgep7173 = getelementptr %struct.exe_sym_env_t* @__exe_env, i32 0, i32 0, i32 %90, i32 0
  %scevgep72 = getelementptr %struct.exe_sym_env_t* @__exe_env, i32 0, i32 0, i32 %90, i32 3
  %91 = icmp ult i32 %90, 32, !dbg !925
  br i1 %91, label %bb.i64, label %bb58, !dbg !925

bb.i64:                                           ; preds = %bb46
  %scevgep = getelementptr %struct.exe_sym_env_t* @__exe_env, i32 0, i32 0, i32 %90, i32 1
  %92 = load i32* %scevgep, align 4, !dbg !927
  %93 = and i32 %92, 1
  %toBool.i63 = icmp eq i32 %93, 0, !dbg !927
  %94 = icmp eq %struct.exe_file_t* %scevgep71, null, !dbg !928
  %or.cond80 = or i1 %toBool.i63, %94
  br i1 %or.cond80, label %bb58, label %bb48, !dbg !927

bb48:                                             ; preds = %bb.i64
  %95 = load %struct.exe_disk_file_t** %scevgep72, align 4, !dbg !928
  %96 = icmp eq %struct.exe_disk_file_t* %95, null, !dbg !928
  br i1 %96, label %bb49, label %bb58, !dbg !928

bb49:                                             ; preds = %bb48
  br i1 %0, label %bb52, label %bb50, !dbg !929

bb50:                                             ; preds = %bb49
  %97 = load i32* %scevgep7173, align 4, !dbg !929
  %98 = sdiv i32 %97, 32, !dbg !929
  %99 = getelementptr inbounds %struct.fd_set* %os_read, i32 0, i32 0, i32 %98, !dbg !929
  %100 = load i32* %99, align 4, !dbg !929
  %101 = and i32 %97, 31
  %102 = shl i32 1, %101, !dbg !929
  %103 = and i32 %100, %102, !dbg !929
  %104 = icmp eq i32 %103, 0, !dbg !929
  br i1 %104, label %bb52, label %bb51, !dbg !929

bb51:                                             ; preds = %bb50
  %105 = sdiv i32 %90, 32, !dbg !929
  %106 = getelementptr inbounds %struct.fd_set* %read, i32 0, i32 0, i32 %105, !dbg !929
  %107 = load i32* %106, align 4, !dbg !929
  %108 = and i32 %90, 31
  %109 = shl i32 1, %108, !dbg !929
  %110 = or i32 %107, %109, !dbg !929
  store i32 %110, i32* %106, align 4, !dbg !929
  br label %bb52, !dbg !929

bb52:                                             ; preds = %bb50, %bb49, %bb51
  br i1 %2, label %bb55, label %bb53, !dbg !930

bb53:                                             ; preds = %bb52
  %111 = load i32* %scevgep7173, align 4, !dbg !930
  %112 = sdiv i32 %111, 32, !dbg !930
  %113 = getelementptr inbounds %struct.fd_set* %os_write, i32 0, i32 0, i32 %112, !dbg !930
  %114 = load i32* %113, align 4, !dbg !930
  %115 = and i32 %111, 31
  %116 = shl i32 1, %115, !dbg !930
  %117 = and i32 %114, %116, !dbg !930
  %118 = icmp eq i32 %117, 0, !dbg !930
  br i1 %118, label %bb55, label %bb54, !dbg !930

bb54:                                             ; preds = %bb53
  %119 = sdiv i32 %90, 32, !dbg !930
  %120 = getelementptr inbounds %struct.fd_set* %write, i32 0, i32 0, i32 %119, !dbg !930
  %121 = load i32* %120, align 4, !dbg !930
  %122 = and i32 %90, 31
  %123 = shl i32 1, %122, !dbg !930
  %124 = or i32 %121, %123, !dbg !930
  store i32 %124, i32* %120, align 4, !dbg !930
  br label %bb55, !dbg !930

bb55:                                             ; preds = %bb53, %bb52, %bb54
  br i1 %4, label %bb58, label %bb56, !dbg !931

bb56:                                             ; preds = %bb55
  %125 = load i32* %scevgep7173, align 4, !dbg !931
  %126 = sdiv i32 %125, 32, !dbg !931
  %127 = getelementptr inbounds %struct.fd_set* %os_except, i32 0, i32 0, i32 %126, !dbg !931
  %128 = load i32* %127, align 4, !dbg !931
  %129 = and i32 %125, 31
  %130 = shl i32 1, %129, !dbg !931
  %131 = and i32 %128, %130, !dbg !931
  %132 = icmp eq i32 %131, 0, !dbg !931
  br i1 %132, label %bb58, label %bb57, !dbg !931

bb57:                                             ; preds = %bb56
  %133 = sdiv i32 %90, 32, !dbg !931
  %134 = getelementptr inbounds %struct.fd_set* %except, i32 0, i32 0, i32 %133, !dbg !931
  %135 = load i32* %134, align 4, !dbg !931
  %136 = and i32 %90, 31
  %137 = shl i32 1, %136, !dbg !931
  %138 = or i32 %135, %137, !dbg !931
  store i32 %138, i32* %134, align 4, !dbg !931
  br label %bb58, !dbg !931

bb58:                                             ; preds = %bb46, %bb.i64, %bb56, %bb55, %bb57, %bb48
  %139 = add nsw i32 %90, 1, !dbg !924
  %exitcond = icmp eq i32 %139, %nfds
  br i1 %exitcond, label %bb61, label %bb46, !dbg !924

bb61:                                             ; preds = %bb45, %bb58, %bb41, %bb43, %bb44, %bb22
  %.0 = phi i32 [ -1, %bb22 ], [ -1, %bb44 ], [ %count.1, %bb43 ], [ %count.1, %bb41 ], [ %88, %bb58 ], [ %88, %bb45 ]
  ret i32 %.0, !dbg !906
}

declare void @llvm.memcpy.p0i8.p0i8.i32(i8* nocapture, i8* nocapture, i32, i32, i1) nounwind

declare void @llvm.memset.p0i8.i32(i8* nocapture, i8, i32, i32, i1) nounwind

define i32 @close(i32 %fd) nounwind {
entry:
  tail call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !372), !dbg !932
  tail call void @llvm.dbg.value(metadata !561, i64 0, metadata !375), !dbg !933
  %0 = load i32* @n_calls.4382, align 4, !dbg !934
  %1 = add nsw i32 %0, 1, !dbg !934
  store i32 %1, i32* @n_calls.4382, align 4, !dbg !934
  tail call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !235), !dbg !935
  %2 = icmp ult i32 %fd, 32, !dbg !937
  br i1 %2, label %bb.i, label %bb, !dbg !937

bb.i:                                             ; preds = %entry
  tail call void @llvm.dbg.value(metadata !552, i64 0, metadata !236), !dbg !938
  %3 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i32 0, i32 0, i32 %fd, i32 1, !dbg !939
  %4 = load i32* %3, align 4, !dbg !939
  %5 = and i32 %4, 1
  %toBool.i = icmp eq i32 %5, 0, !dbg !939
  br i1 %toBool.i, label %bb, label %__get_file.exit, !dbg !939

__get_file.exit:                                  ; preds = %bb.i
  %6 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i32 0, i32 0, i32 %fd, !dbg !938
  tail call void @llvm.dbg.value(metadata !{%struct.exe_file_t* %6}, i64 0, metadata !373), !dbg !936
  %7 = icmp eq %struct.exe_file_t* %6, null, !dbg !940
  br i1 %7, label %bb, label %bb1, !dbg !940

bb:                                               ; preds = %entry, %bb.i, %__get_file.exit
  %8 = tail call i32* @__errno_location() nounwind readnone, !dbg !941
  store i32 9, i32* %8, align 4, !dbg !941
  br label %bb5, !dbg !942

bb1:                                              ; preds = %__get_file.exit
  %9 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i32 0, i32 5), align 4, !dbg !943
  %10 = icmp eq i32 %9, 0, !dbg !943
  br i1 %10, label %bb4, label %bb2, !dbg !943

bb2:                                              ; preds = %bb1
  %11 = load i32** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i32 0, i32 8), align 4, !dbg !943
  %12 = load i32* %11, align 4, !dbg !943
  %13 = icmp eq i32 %12, %1, !dbg !943
  br i1 %13, label %bb3, label %bb4, !dbg !943

bb3:                                              ; preds = %bb2
  %14 = add i32 %9, -1, !dbg !944
  store i32 %14, i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i32 0, i32 5), align 4, !dbg !944
  %15 = tail call i32* @__errno_location() nounwind readnone, !dbg !945
  store i32 5, i32* %15, align 4, !dbg !945
  br label %bb5, !dbg !946

bb4:                                              ; preds = %bb1, %bb2
  %16 = bitcast %struct.exe_file_t* %6 to i8*, !dbg !947
  tail call void @llvm.memset.p0i8.i32(i8* %16, i8 0, i32 20, i32 4, i1 false), !dbg !947
  br label %bb5, !dbg !948

bb5:                                              ; preds = %bb4, %bb3, %bb
  %.0 = phi i32 [ -1, %bb ], [ -1, %bb3 ], [ 0, %bb4 ]
  ret i32 %.0, !dbg !942
}

define i32 @dup2(i32 %oldfd, i32 %newfd) nounwind {
entry:
  tail call void @llvm.dbg.value(metadata !{i32 %oldfd}, i64 0, metadata !376), !dbg !949
  tail call void @llvm.dbg.value(metadata !{i32 %newfd}, i64 0, metadata !377), !dbg !949
  tail call void @llvm.dbg.value(metadata !{i32 %oldfd}, i64 0, metadata !235), !dbg !950
  %0 = icmp ult i32 %oldfd, 32, !dbg !952
  br i1 %0, label %bb.i, label %bb, !dbg !952

bb.i:                                             ; preds = %entry
  tail call void @llvm.dbg.value(metadata !552, i64 0, metadata !236), !dbg !953
  %1 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i32 0, i32 0, i32 %oldfd, i32 1, !dbg !954
  %2 = load i32* %1, align 4, !dbg !954
  %3 = and i32 %2, 1
  %toBool.i = icmp eq i32 %3, 0, !dbg !954
  br i1 %toBool.i, label %bb, label %__get_file.exit, !dbg !954

__get_file.exit:                                  ; preds = %bb.i
  %4 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i32 0, i32 0, i32 %oldfd, !dbg !953
  tail call void @llvm.dbg.value(metadata !{%struct.exe_file_t* %4}, i64 0, metadata !378), !dbg !951
  %5 = icmp eq %struct.exe_file_t* %4, null, !dbg !955
  %6 = icmp ugt i32 %newfd, 31, !dbg !955
  %7 = or i1 %5, %6, !dbg !955
  br i1 %7, label %bb, label %bb3, !dbg !955

bb:                                               ; preds = %entry, %bb.i, %__get_file.exit
  %8 = tail call i32* @__errno_location() nounwind readnone, !dbg !956
  store i32 9, i32* %8, align 4, !dbg !956
  br label %bb7, !dbg !957

bb3:                                              ; preds = %__get_file.exit
  tail call void @llvm.dbg.value(metadata !{null}, i64 0, metadata !380), !dbg !958
  %9 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i32 0, i32 0, i32 %newfd, i32 1, !dbg !959
  %10 = load i32* %9, align 4, !dbg !959
  %11 = and i32 %10, 1
  %toBool4 = icmp eq i32 %11, 0, !dbg !959
  br i1 %toBool4, label %bb6, label %bb5, !dbg !959

bb5:                                              ; preds = %bb3
  tail call void @llvm.dbg.value(metadata !{i32 %newfd}, i64 0, metadata !372) nounwind, !dbg !960
  tail call void @llvm.dbg.value(metadata !561, i64 0, metadata !375) nounwind, !dbg !961
  %12 = load i32* @n_calls.4382, align 4, !dbg !962
  %13 = add nsw i32 %12, 1, !dbg !962
  store i32 %13, i32* @n_calls.4382, align 4, !dbg !962
  tail call void @llvm.dbg.value(metadata !{i32 %newfd}, i64 0, metadata !235) nounwind, !dbg !963
  %14 = icmp ult i32 %newfd, 32, !dbg !965
  br i1 %14, label %__get_file.exit.i, label %bb.i9, !dbg !965

__get_file.exit.i:                                ; preds = %bb5
  %15 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i32 0, i32 0, i32 %newfd, !dbg !966
  tail call void @llvm.dbg.value(metadata !{%struct.exe_file_t* %15}, i64 0, metadata !373) nounwind, !dbg !964
  %16 = icmp eq %struct.exe_file_t* %15, null, !dbg !967
  br i1 %16, label %bb.i9, label %bb1.i10, !dbg !967

bb.i9:                                            ; preds = %__get_file.exit.i, %bb5
  %17 = tail call i32* @__errno_location() nounwind readnone, !dbg !968
  store i32 9, i32* %17, align 4, !dbg !968
  br label %bb6, !dbg !969

bb1.i10:                                          ; preds = %__get_file.exit.i
  %18 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i32 0, i32 5), align 4, !dbg !970
  %19 = icmp eq i32 %18, 0, !dbg !970
  br i1 %19, label %bb4.i, label %bb2.i, !dbg !970

bb2.i:                                            ; preds = %bb1.i10
  %20 = load i32** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i32 0, i32 8), align 4, !dbg !970
  %21 = load i32* %20, align 4, !dbg !970
  %22 = icmp eq i32 %21, %13, !dbg !970
  br i1 %22, label %bb3.i, label %bb4.i, !dbg !970

bb3.i:                                            ; preds = %bb2.i
  %23 = add i32 %18, -1, !dbg !971
  store i32 %23, i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i32 0, i32 5), align 4, !dbg !971
  %24 = tail call i32* @__errno_location() nounwind readnone, !dbg !972
  store i32 5, i32* %24, align 4, !dbg !972
  br label %bb6, !dbg !973

bb4.i:                                            ; preds = %bb2.i, %bb1.i10
  %25 = bitcast %struct.exe_file_t* %15 to i8*, !dbg !974
  tail call void @llvm.memset.p0i8.i32(i8* %25, i8 0, i32 20, i32 4, i1 false) nounwind, !dbg !974
  br label %bb6, !dbg !975

bb6:                                              ; preds = %bb4.i, %bb3.i, %bb.i9, %bb3
  %26 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i32 0, i32 0, i32 %newfd, i32 0, !dbg !976
  %27 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i32 0, i32 0, i32 %oldfd, i32 0, !dbg !976
  %28 = load i32* %27, align 4, !dbg !976
  store i32 %28, i32* %26, align 4, !dbg !976
  %29 = load i32* %1, align 4, !dbg !976
  %30 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i32 0, i32 0, i32 %newfd, i32 2, !dbg !976
  %31 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i32 0, i32 0, i32 %oldfd, i32 2, !dbg !976
  %32 = load i64* %31, align 4, !dbg !976
  store i64 %32, i64* %30, align 4, !dbg !976
  %33 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i32 0, i32 0, i32 %newfd, i32 3, !dbg !976
  %34 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i32 0, i32 0, i32 %oldfd, i32 3, !dbg !976
  %35 = load %struct.exe_disk_file_t** %34, align 4, !dbg !976
  store %struct.exe_disk_file_t* %35, %struct.exe_disk_file_t** %33, align 4, !dbg !976
  %36 = and i32 %29, -3, !dbg !977
  store i32 %36, i32* %9, align 4, !dbg !977
  br label %bb7, !dbg !978

bb7:                                              ; preds = %bb6, %bb
  %.0 = phi i32 [ -1, %bb ], [ %newfd, %bb6 ]
  ret i32 %.0, !dbg !957
}

define i32 @dup(i32 %oldfd) nounwind {
entry:
  tail call void @llvm.dbg.value(metadata !{i32 %oldfd}, i64 0, metadata !382), !dbg !979
  tail call void @llvm.dbg.value(metadata !{i32 %oldfd}, i64 0, metadata !235), !dbg !980
  %0 = icmp ult i32 %oldfd, 32, !dbg !982
  br i1 %0, label %bb.i, label %bb, !dbg !982

bb.i:                                             ; preds = %entry
  tail call void @llvm.dbg.value(metadata !552, i64 0, metadata !236), !dbg !983
  %1 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i32 0, i32 0, i32 %oldfd, i32 1, !dbg !984
  %2 = load i32* %1, align 4, !dbg !984
  %3 = and i32 %2, 1
  %toBool.i = icmp eq i32 %3, 0, !dbg !984
  br i1 %toBool.i, label %bb, label %__get_file.exit, !dbg !984

__get_file.exit:                                  ; preds = %bb.i
  %4 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i32 0, i32 0, i32 %oldfd, !dbg !983
  tail call void @llvm.dbg.value(metadata !{%struct.exe_file_t* %4}, i64 0, metadata !383), !dbg !981
  %5 = icmp eq %struct.exe_file_t* %4, null, !dbg !985
  br i1 %5, label %bb, label %bb4, !dbg !985

bb:                                               ; preds = %entry, %bb.i, %__get_file.exit
  %6 = tail call i32* @__errno_location() nounwind readnone, !dbg !986
  store i32 9, i32* %6, align 4, !dbg !986
  br label %bb8, !dbg !987

bb2:                                              ; preds = %bb4
  %scevgep = getelementptr %struct.exe_sym_env_t* @__exe_env, i32 0, i32 0, i32 %11, i32 1
  %7 = load i32* %scevgep, align 4, !dbg !988
  %8 = and i32 %7, 1, !dbg !988
  %9 = icmp eq i32 %8, 0, !dbg !988
  br i1 %9, label %bb7, label %bb3, !dbg !988

bb3:                                              ; preds = %bb2
  %10 = add nsw i32 %11, 1, !dbg !989
  br label %bb4, !dbg !989

bb4:                                              ; preds = %__get_file.exit, %bb3
  %11 = phi i32 [ %10, %bb3 ], [ 0, %__get_file.exit ]
  %12 = icmp slt i32 %11, 32, !dbg !989
  br i1 %12, label %bb2, label %bb5, !dbg !989

bb5:                                              ; preds = %bb4
  %13 = icmp eq i32 %11, 32, !dbg !990
  br i1 %13, label %bb6, label %bb7, !dbg !990

bb6:                                              ; preds = %bb5
  %14 = tail call i32* @__errno_location() nounwind readnone, !dbg !991
  store i32 24, i32* %14, align 4, !dbg !991
  br label %bb8, !dbg !992

bb7:                                              ; preds = %bb2, %bb5
  %15 = tail call i32 @dup2(i32 %oldfd, i32 %11) nounwind, !dbg !993
  br label %bb8, !dbg !993

bb8:                                              ; preds = %bb7, %bb6, %bb
  %.0 = phi i32 [ -1, %bb ], [ -1, %bb6 ], [ %15, %bb7 ]
  ret i32 %.0, !dbg !987
}

define i32 @fcntl(i32 %fd, i32 %cmd, ...) nounwind {
entry:
  %ap = alloca i8*, align 4
  call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !387), !dbg !994
  call void @llvm.dbg.value(metadata !{i32 %cmd}, i64 0, metadata !388), !dbg !994
  call void @llvm.dbg.declare(metadata !{i8** %ap}, metadata !391), !dbg !995
  tail call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !235), !dbg !996
  %0 = icmp ult i32 %fd, 32, !dbg !998
  br i1 %0, label %bb.i, label %bb, !dbg !998

bb.i:                                             ; preds = %entry
  tail call void @llvm.dbg.value(metadata !552, i64 0, metadata !236), !dbg !999
  %1 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i32 0, i32 0, i32 %fd, i32 1, !dbg !1000
  %2 = load i32* %1, align 4, !dbg !1000
  %3 = and i32 %2, 1
  %toBool.i = icmp eq i32 %3, 0, !dbg !1000
  br i1 %toBool.i, label %bb, label %__get_file.exit, !dbg !1000

__get_file.exit:                                  ; preds = %bb.i
  %4 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i32 0, i32 0, i32 %fd, !dbg !999
  call void @llvm.dbg.value(metadata !{%struct.exe_file_t* %4}, i64 0, metadata !389), !dbg !997
  %5 = icmp eq %struct.exe_file_t* %4, null, !dbg !1001
  br i1 %5, label %bb, label %bb1, !dbg !1001

bb:                                               ; preds = %entry, %bb.i, %__get_file.exit
  %6 = call i32* @__errno_location() nounwind readnone, !dbg !1002
  store i32 9, i32* %6, align 4, !dbg !1002
  br label %bb30, !dbg !1003

bb1:                                              ; preds = %__get_file.exit
  switch i32 %cmd, label %bb8 [
    i32 3, label %bb16
    i32 1, label %bb16
    i32 11, label %bb16
    i32 9, label %bb16
  ]

bb8:                                              ; preds = %bb1
  %cmd.off = add i32 %cmd, -1025
  %7 = icmp ult i32 %cmd.off, 2
  br i1 %7, label %bb16, label %bb13, !dbg !1004

bb13:                                             ; preds = %bb8
  %ap14 = bitcast i8** %ap to i8*, !dbg !1005
  call void @llvm.va_start(i8* %ap14), !dbg !1005
  %8 = load i8** %ap, align 4, !dbg !1006
  %9 = getelementptr inbounds i8* %8, i32 4, !dbg !1006
  store i8* %9, i8** %ap, align 4, !dbg !1006
  %10 = bitcast i8* %8 to i32*, !dbg !1006
  %11 = load i32* %10, align 4, !dbg !1006
  call void @llvm.dbg.value(metadata !{i32 %11}, i64 0, metadata !394), !dbg !1006
  call void @llvm.va_end(i8* %ap14), !dbg !1007
  br label %bb16, !dbg !1007

bb16:                                             ; preds = %bb1, %bb1, %bb1, %bb1, %bb8, %bb13
  %arg.0 = phi i32 [ %11, %bb13 ], [ 0, %bb1 ], [ 0, %bb1 ], [ 0, %bb8 ], [ 0, %bb1 ], [ 0, %bb1 ]
  %12 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i32 0, i32 0, i32 %fd, i32 3, !dbg !1008
  %13 = load %struct.exe_disk_file_t** %12, align 4, !dbg !1008
  %14 = icmp eq %struct.exe_disk_file_t* %13, null, !dbg !1008
  br i1 %14, label %bb27, label %bb17, !dbg !1008

bb17:                                             ; preds = %bb16
  switch i32 %cmd, label %bb26 [
    i32 1, label %bb18
    i32 2, label %bb21
    i32 3, label %bb30
  ], !dbg !1009

bb18:                                             ; preds = %bb17
  call void @llvm.dbg.value(metadata !561, i64 0, metadata !395), !dbg !1010
  %15 = load i32* %1, align 4, !dbg !1011
  call void @llvm.dbg.value(metadata !1012, i64 0, metadata !395), !dbg !1013
  %16 = lshr i32 %15, 1
  %.lobit = and i32 %16, 1
  br label %bb30

bb21:                                             ; preds = %bb17
  %17 = load i32* %1, align 4, !dbg !1014
  %18 = and i32 %17, -3, !dbg !1014
  store i32 %18, i32* %1, align 4, !dbg !1014
  %19 = and i32 %arg.0, 1
  %toBool22 = icmp eq i32 %19, 0, !dbg !1015
  br i1 %toBool22, label %bb30, label %bb23, !dbg !1015

bb23:                                             ; preds = %bb21
  %20 = or i32 %17, 2, !dbg !1016
  store i32 %20, i32* %1, align 4, !dbg !1016
  br label %bb30, !dbg !1016

bb26:                                             ; preds = %bb17
  call void @klee_warning(i8* getelementptr inbounds ([33 x i8]* @.str6, i32 0, i32 0)) nounwind, !dbg !1017
  %21 = call i32* @__errno_location() nounwind readnone, !dbg !1018
  store i32 22, i32* %21, align 4, !dbg !1018
  br label %bb30, !dbg !1019

bb27:                                             ; preds = %bb16
  %22 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i32 0, i32 0, i32 %fd, i32 0, !dbg !1020
  %23 = load i32* %22, align 4, !dbg !1020
  %24 = call i32 (i32, ...)* @syscall(i32 55, i32 %23, i32 %cmd, i32 %arg.0) nounwind, !dbg !1020
  call void @llvm.dbg.value(metadata !{i32 %24}, i64 0, metadata !397), !dbg !1020
  %25 = icmp eq i32 %24, -1, !dbg !1021
  br i1 %25, label %bb28, label %bb30, !dbg !1021

bb28:                                             ; preds = %bb27
  %26 = call i32* @__errno_location() nounwind readnone, !dbg !1022
  %27 = call i32 @klee_get_errno() nounwind, !dbg !1022
  store i32 %27, i32* %26, align 4, !dbg !1022
  br label %bb30, !dbg !1022

bb30:                                             ; preds = %bb27, %bb28, %bb17, %bb23, %bb21, %bb18, %bb26, %bb
  %.0 = phi i32 [ -1, %bb ], [ -1, %bb26 ], [ %.lobit, %bb18 ], [ 0, %bb21 ], [ 0, %bb23 ], [ 0, %bb17 ], [ -1, %bb28 ], [ %24, %bb27 ]
  ret i32 %.0, !dbg !1003
}

declare void @llvm.va_start(i8*) nounwind

declare void @llvm.va_end(i8*) nounwind

define i32 @ioctl(i32 %fd, i32 %request, ...) nounwind {
entry:
  %ap = alloca i8*, align 4
  call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !399), !dbg !1023
  call void @llvm.dbg.value(metadata !{i32 %request}, i64 0, metadata !400), !dbg !1023
  call void @llvm.dbg.declare(metadata !{i8** %ap}, metadata !403), !dbg !1024
  tail call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !235), !dbg !1025
  %0 = icmp ult i32 %fd, 32, !dbg !1027
  br i1 %0, label %bb.i, label %bb, !dbg !1027

bb.i:                                             ; preds = %entry
  tail call void @llvm.dbg.value(metadata !552, i64 0, metadata !236), !dbg !1028
  %1 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i32 0, i32 0, i32 %fd, i32 1, !dbg !1029
  %2 = load i32* %1, align 4, !dbg !1029
  %3 = and i32 %2, 1
  %toBool.i = icmp eq i32 %3, 0, !dbg !1029
  br i1 %toBool.i, label %bb, label %__get_file.exit, !dbg !1029

__get_file.exit:                                  ; preds = %bb.i
  %4 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i32 0, i32 0, i32 %fd, !dbg !1028
  call void @llvm.dbg.value(metadata !{%struct.exe_file_t* %4}, i64 0, metadata !401), !dbg !1026
  %5 = icmp eq %struct.exe_file_t* %4, null, !dbg !1030
  br i1 %5, label %bb, label %bb1, !dbg !1030

bb:                                               ; preds = %entry, %bb.i, %__get_file.exit
  %6 = call i32* @__errno_location() nounwind readnone, !dbg !1031
  store i32 9, i32* %6, align 4, !dbg !1031
  br label %bb34, !dbg !1032

bb1:                                              ; preds = %__get_file.exit
  %ap2 = bitcast i8** %ap to i8*, !dbg !1033
  call void @llvm.va_start(i8* %ap2), !dbg !1033
  %7 = load i8** %ap, align 4, !dbg !1034
  %8 = getelementptr inbounds i8* %7, i32 4, !dbg !1034
  store i8* %8, i8** %ap, align 4, !dbg !1034
  %9 = bitcast i8* %7 to i8**, !dbg !1034
  %10 = load i8** %9, align 4, !dbg !1034
  call void @llvm.dbg.value(metadata !{i8* %10}, i64 0, metadata !404), !dbg !1034
  call void @llvm.va_end(i8* %ap2), !dbg !1035
  %11 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i32 0, i32 0, i32 %fd, i32 3, !dbg !1036
  %12 = load %struct.exe_disk_file_t** %11, align 4, !dbg !1036
  %13 = icmp eq %struct.exe_disk_file_t* %12, null, !dbg !1036
  br i1 %13, label %bb31, label %bb4, !dbg !1036

bb4:                                              ; preds = %bb1
  %14 = getelementptr inbounds %struct.exe_disk_file_t* %12, i32 0, i32 2, !dbg !1037
  %15 = load %struct.stat64** %14, align 4, !dbg !1037
  call void @llvm.dbg.value(metadata !{null}, i64 0, metadata !405), !dbg !1037
  switch i32 %request, label %bb30 [
    i32 21505, label %bb5
    i32 21506, label %bb8
    i32 21507, label %bb11
    i32 21508, label %bb14
    i32 21523, label %bb17
    i32 21524, label %bb20
    i32 21531, label %bb23
    i32 -2145620734, label %bb29
  ], !dbg !1038

bb5:                                              ; preds = %bb4
  call void @llvm.dbg.value(metadata !{null}, i64 0, metadata !429), !dbg !1039
  call void @klee_warning_once(i8* getelementptr inbounds ([41 x i8]* @.str7, i32 0, i32 0)) nounwind, !dbg !1040
  %16 = getelementptr inbounds %struct.stat64* %15, i32 0, i32 3
  %17 = load i32* %16, align 4, !dbg !1041
  %18 = and i32 %17, 61440, !dbg !1041
  %19 = icmp eq i32 %18, 8192, !dbg !1041
  br i1 %19, label %bb6, label %bb7, !dbg !1041

bb6:                                              ; preds = %bb5
  %20 = bitcast i8* %10 to i32*, !dbg !1042
  store i32 27906, i32* %20, align 4, !dbg !1042
  %21 = getelementptr inbounds i8* %10, i32 4
  %22 = bitcast i8* %21 to i32*, !dbg !1043
  store i32 5, i32* %22, align 4, !dbg !1043
  %23 = getelementptr inbounds i8* %10, i32 8
  %24 = bitcast i8* %23 to i32*, !dbg !1044
  store i32 1215, i32* %24, align 4, !dbg !1044
  %25 = getelementptr inbounds i8* %10, i32 12
  %26 = bitcast i8* %25 to i32*, !dbg !1045
  store i32 35287, i32* %26, align 4, !dbg !1045
  %27 = getelementptr inbounds i8* %10, i32 16
  store i8 0, i8* %27, align 4, !dbg !1046
  %28 = getelementptr inbounds i8* %10, i32 17
  store i8 3, i8* %28, align 1, !dbg !1047
  %29 = getelementptr inbounds i8* %10, i32 18, !dbg !1048
  store i8 28, i8* %29, align 1, !dbg !1048
  %30 = getelementptr inbounds i8* %10, i32 19, !dbg !1049
  store i8 127, i8* %30, align 1, !dbg !1049
  %31 = getelementptr inbounds i8* %10, i32 20, !dbg !1050
  store i8 21, i8* %31, align 1, !dbg !1050
  %32 = getelementptr inbounds i8* %10, i32 21, !dbg !1051
  store i8 4, i8* %32, align 1, !dbg !1051
  %33 = getelementptr inbounds i8* %10, i32 22, !dbg !1052
  store i8 0, i8* %33, align 1, !dbg !1052
  %34 = getelementptr inbounds i8* %10, i32 23, !dbg !1053
  store i8 1, i8* %34, align 1, !dbg !1053
  %35 = getelementptr inbounds i8* %10, i32 24, !dbg !1054
  store i8 -1, i8* %35, align 1, !dbg !1054
  %36 = getelementptr inbounds i8* %10, i32 25, !dbg !1055
  store i8 17, i8* %36, align 1, !dbg !1055
  %37 = getelementptr inbounds i8* %10, i32 26, !dbg !1056
  store i8 19, i8* %37, align 1, !dbg !1056
  %38 = getelementptr inbounds i8* %10, i32 27, !dbg !1057
  store i8 26, i8* %38, align 1, !dbg !1057
  %39 = getelementptr inbounds i8* %10, i32 28, !dbg !1058
  store i8 -1, i8* %39, align 1, !dbg !1058
  %40 = getelementptr inbounds i8* %10, i32 29, !dbg !1059
  store i8 18, i8* %40, align 1, !dbg !1059
  %41 = getelementptr inbounds i8* %10, i32 30, !dbg !1060
  store i8 15, i8* %41, align 1, !dbg !1060
  %42 = getelementptr inbounds i8* %10, i32 31, !dbg !1061
  store i8 23, i8* %42, align 1, !dbg !1061
  %43 = getelementptr inbounds i8* %10, i32 32, !dbg !1062
  store i8 22, i8* %43, align 1, !dbg !1062
  %44 = getelementptr inbounds i8* %10, i32 33, !dbg !1063
  store i8 -1, i8* %44, align 1, !dbg !1063
  %45 = getelementptr inbounds i8* %10, i32 34, !dbg !1064
  store i8 0, i8* %45, align 1, !dbg !1064
  %46 = getelementptr inbounds i8* %10, i32 35, !dbg !1065
  store i8 0, i8* %46, align 1, !dbg !1065
  br label %bb34, !dbg !1066

bb7:                                              ; preds = %bb5
  %47 = call i32* @__errno_location() nounwind readnone, !dbg !1067
  store i32 25, i32* %47, align 4, !dbg !1067
  br label %bb34, !dbg !1068

bb8:                                              ; preds = %bb4
  call void @klee_warning_once(i8* getelementptr inbounds ([42 x i8]* @.str8, i32 0, i32 0)) nounwind, !dbg !1069
  %48 = getelementptr inbounds %struct.stat64* %15, i32 0, i32 3
  %49 = load i32* %48, align 4, !dbg !1070
  %50 = and i32 %49, 61440, !dbg !1070
  %51 = icmp eq i32 %50, 8192, !dbg !1070
  br i1 %51, label %bb34, label %bb10, !dbg !1070

bb10:                                             ; preds = %bb8
  %52 = call i32* @__errno_location() nounwind readnone, !dbg !1071
  store i32 25, i32* %52, align 4, !dbg !1071
  br label %bb34, !dbg !1072

bb11:                                             ; preds = %bb4
  call void @klee_warning_once(i8* getelementptr inbounds ([43 x i8]* @.str9, i32 0, i32 0)) nounwind, !dbg !1073
  %53 = icmp eq i32 %fd, 0, !dbg !1074
  br i1 %53, label %bb34, label %bb13, !dbg !1074

bb13:                                             ; preds = %bb11
  %54 = call i32* @__errno_location() nounwind readnone, !dbg !1075
  store i32 25, i32* %54, align 4, !dbg !1075
  br label %bb34, !dbg !1076

bb14:                                             ; preds = %bb4
  call void @klee_warning_once(i8* getelementptr inbounds ([43 x i8]* @.str10, i32 0, i32 0)) nounwind, !dbg !1077
  %55 = getelementptr inbounds %struct.stat64* %15, i32 0, i32 3
  %56 = load i32* %55, align 4, !dbg !1078
  %57 = and i32 %56, 61440, !dbg !1078
  %58 = icmp eq i32 %57, 8192, !dbg !1078
  br i1 %58, label %bb34, label %bb16, !dbg !1078

bb16:                                             ; preds = %bb14
  %59 = call i32* @__errno_location() nounwind readnone, !dbg !1079
  store i32 25, i32* %59, align 4, !dbg !1079
  br label %bb34, !dbg !1080

bb17:                                             ; preds = %bb4
  call void @llvm.dbg.value(metadata !{null}, i64 0, metadata !447), !dbg !1081
  %60 = bitcast i8* %10 to i16*, !dbg !1082
  store i16 24, i16* %60, align 2, !dbg !1082
  %61 = getelementptr inbounds i8* %10, i32 2
  %62 = bitcast i8* %61 to i16*, !dbg !1083
  store i16 80, i16* %62, align 2, !dbg !1083
  call void @klee_warning_once(i8* getelementptr inbounds ([45 x i8]* @.str11, i32 0, i32 0)) nounwind, !dbg !1084
  %63 = getelementptr inbounds %struct.stat64* %15, i32 0, i32 3
  %64 = load i32* %63, align 4, !dbg !1085
  %65 = and i32 %64, 61440, !dbg !1085
  %66 = icmp eq i32 %65, 8192, !dbg !1085
  br i1 %66, label %bb34, label %bb19, !dbg !1085

bb19:                                             ; preds = %bb17
  %67 = call i32* @__errno_location() nounwind readnone, !dbg !1086
  store i32 25, i32* %67, align 4, !dbg !1086
  br label %bb34, !dbg !1087

bb20:                                             ; preds = %bb4
  call void @klee_warning_once(i8* getelementptr inbounds ([46 x i8]* @.str12, i32 0, i32 0)) nounwind, !dbg !1088
  %68 = getelementptr inbounds %struct.stat64* %15, i32 0, i32 3
  %69 = load i32* %68, align 4, !dbg !1089
  %70 = and i32 %69, 61440, !dbg !1089
  %71 = icmp eq i32 %70, 8192, !dbg !1089
  %72 = call i32* @__errno_location() nounwind readnone, !dbg !1090
  br i1 %71, label %bb21, label %bb22, !dbg !1089

bb21:                                             ; preds = %bb20
  store i32 22, i32* %72, align 4, !dbg !1090
  br label %bb34, !dbg !1091

bb22:                                             ; preds = %bb20
  store i32 25, i32* %72, align 4, !dbg !1092
  br label %bb34, !dbg !1093

bb23:                                             ; preds = %bb4
  %73 = bitcast i8* %10 to i32*, !dbg !1094
  call void @llvm.dbg.value(metadata !{i32* %73}, i64 0, metadata !457), !dbg !1094
  call void @klee_warning_once(i8* getelementptr inbounds ([43 x i8]* @.str13, i32 0, i32 0)) nounwind, !dbg !1095
  %74 = getelementptr inbounds %struct.stat64* %15, i32 0, i32 3
  %75 = load i32* %74, align 4, !dbg !1096
  %76 = and i32 %75, 61440, !dbg !1096
  %77 = icmp eq i32 %76, 8192, !dbg !1096
  br i1 %77, label %bb24, label %bb28, !dbg !1096

bb24:                                             ; preds = %bb23
  %78 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i32 0, i32 0, i32 %fd, i32 2, !dbg !1097
  %79 = load i64* %78, align 4, !dbg !1097
  %80 = load %struct.exe_disk_file_t** %11, align 4, !dbg !1097
  %81 = getelementptr inbounds %struct.exe_disk_file_t* %80, i32 0, i32 0, !dbg !1097
  %82 = load i32* %81, align 4, !dbg !1097
  %83 = zext i32 %82 to i64, !dbg !1097
  %84 = icmp slt i64 %79, %83, !dbg !1097
  br i1 %84, label %bb25, label %bb27, !dbg !1097

bb25:                                             ; preds = %bb24
  %85 = trunc i64 %79 to i32, !dbg !1098
  %86 = sub i32 %82, %85, !dbg !1098
  br label %bb27, !dbg !1098

bb27:                                             ; preds = %bb24, %bb25
  %storemerge = phi i32 [ %86, %bb25 ], [ 0, %bb24 ]
  store i32 %storemerge, i32* %73, align 4
  br label %bb34, !dbg !1099

bb28:                                             ; preds = %bb23
  %87 = call i32* @__errno_location() nounwind readnone, !dbg !1100
  store i32 25, i32* %87, align 4, !dbg !1100
  br label %bb34, !dbg !1101

bb29:                                             ; preds = %bb4
  call void @klee_warning(i8* getelementptr inbounds ([44 x i8]* @.str14, i32 0, i32 0)) nounwind, !dbg !1102
  %88 = call i32* @__errno_location() nounwind readnone, !dbg !1103
  store i32 22, i32* %88, align 4, !dbg !1103
  br label %bb34, !dbg !1104

bb30:                                             ; preds = %bb4
  call void @klee_warning(i8* getelementptr inbounds ([33 x i8]* @.str6, i32 0, i32 0)) nounwind, !dbg !1105
  %89 = call i32* @__errno_location() nounwind readnone, !dbg !1106
  store i32 22, i32* %89, align 4, !dbg !1106
  br label %bb34, !dbg !1107

bb31:                                             ; preds = %bb1
  %90 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i32 0, i32 0, i32 %fd, i32 0, !dbg !1108
  %91 = load i32* %90, align 4, !dbg !1108
  %92 = call i32 (i32, ...)* @syscall(i32 54, i32 %91, i32 %request, i8* %10) nounwind, !dbg !1108
  call void @llvm.dbg.value(metadata !{i32 %92}, i64 0, metadata !460), !dbg !1108
  %93 = icmp eq i32 %92, -1, !dbg !1109
  br i1 %93, label %bb32, label %bb34, !dbg !1109

bb32:                                             ; preds = %bb31
  %94 = call i32* @__errno_location() nounwind readnone, !dbg !1110
  %95 = call i32 @klee_get_errno() nounwind, !dbg !1110
  store i32 %95, i32* %94, align 4, !dbg !1110
  br label %bb34, !dbg !1110

bb34:                                             ; preds = %bb31, %bb32, %bb17, %bb14, %bb11, %bb8, %bb30, %bb29, %bb28, %bb27, %bb22, %bb21, %bb19, %bb16, %bb13, %bb10, %bb7, %bb6, %bb
  %.0 = phi i32 [ -1, %bb ], [ -1, %bb30 ], [ -1, %bb29 ], [ 0, %bb27 ], [ -1, %bb28 ], [ -1, %bb21 ], [ -1, %bb22 ], [ -1, %bb19 ], [ -1, %bb16 ], [ -1, %bb13 ], [ -1, %bb10 ], [ 0, %bb6 ], [ -1, %bb7 ], [ 0, %bb8 ], [ 0, %bb11 ], [ 0, %bb14 ], [ 0, %bb17 ], [ -1, %bb32 ], [ %92, %bb31 ]
  ret i32 %.0, !dbg !1032
}

declare void @klee_warning_once(i8*)

define i32 @__fd_getdents(i32 %fd, %struct.dirent64* %dirp, i32 %count) nounwind {
entry:
  tail call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !462), !dbg !1111
  tail call void @llvm.dbg.value(metadata !{%struct.dirent64* %dirp}, i64 0, metadata !463), !dbg !1111
  tail call void @llvm.dbg.value(metadata !{i32 %count}, i64 0, metadata !464), !dbg !1111
  tail call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !235), !dbg !1112
  %0 = icmp ult i32 %fd, 32, !dbg !1114
  br i1 %0, label %bb.i, label %bb, !dbg !1114

bb.i:                                             ; preds = %entry
  tail call void @llvm.dbg.value(metadata !552, i64 0, metadata !236), !dbg !1115
  %1 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i32 0, i32 0, i32 %fd, i32 1, !dbg !1116
  %2 = load i32* %1, align 4, !dbg !1116
  %3 = and i32 %2, 1
  %toBool.i = icmp eq i32 %3, 0, !dbg !1116
  br i1 %toBool.i, label %bb, label %__get_file.exit, !dbg !1116

__get_file.exit:                                  ; preds = %bb.i
  %4 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i32 0, i32 0, i32 %fd, !dbg !1115
  tail call void @llvm.dbg.value(metadata !{%struct.exe_file_t* %4}, i64 0, metadata !465), !dbg !1113
  %5 = icmp eq %struct.exe_file_t* %4, null, !dbg !1117
  br i1 %5, label %bb, label %bb1, !dbg !1117

bb:                                               ; preds = %entry, %bb.i, %__get_file.exit
  %6 = tail call i32* @__errno_location() nounwind readnone, !dbg !1118
  store i32 9, i32* %6, align 4, !dbg !1118
  br label %bb18, !dbg !1119

bb1:                                              ; preds = %__get_file.exit
  %7 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i32 0, i32 0, i32 %fd, i32 3, !dbg !1120
  %8 = load %struct.exe_disk_file_t** %7, align 4, !dbg !1120
  %9 = icmp eq %struct.exe_disk_file_t* %8, null, !dbg !1120
  br i1 %9, label %bb3, label %bb2, !dbg !1120

bb2:                                              ; preds = %bb1
  tail call void @klee_warning(i8* getelementptr inbounds ([33 x i8]* @.str6, i32 0, i32 0)) nounwind, !dbg !1121
  %10 = tail call i32* @__errno_location() nounwind readnone, !dbg !1122
  store i32 22, i32* %10, align 4, !dbg !1122
  br label %bb18, !dbg !1123

bb3:                                              ; preds = %bb1
  %11 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i32 0, i32 0, i32 %fd, i32 2, !dbg !1124
  %12 = load i64* %11, align 4, !dbg !1124
  %13 = trunc i64 %12 to i32, !dbg !1124
  %14 = icmp ult i32 %13, 4096, !dbg !1124
  br i1 %14, label %bb4, label %bb10, !dbg !1124

bb4:                                              ; preds = %bb3
  tail call void @llvm.dbg.value(metadata !561, i64 0, metadata !470), !dbg !1125
  %15 = sdiv i64 %12, 276, !dbg !1126
  %16 = trunc i64 %15 to i32, !dbg !1126
  tail call void @llvm.dbg.value(metadata !{i32 %16}, i64 0, metadata !467), !dbg !1126
  %17 = mul i32 %16, 276, !dbg !1127
  %18 = zext i32 %17 to i64, !dbg !1127
  %19 = icmp ne i64 %18, %12, !dbg !1127
  %20 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i32 0, i32 0), align 4, !dbg !1127
  %21 = icmp ult i32 %20, %16, !dbg !1127
  %or.cond = or i1 %19, %21
  br i1 %or.cond, label %bb6, label %bb8.preheader, !dbg !1127

bb8.preheader:                                    ; preds = %bb4
  %22 = icmp ugt i32 %20, %16, !dbg !1128
  br i1 %22, label %bb7.lr.ph, label %bb9, !dbg !1128

bb7.lr.ph:                                        ; preds = %bb8.preheader
  %tmp38 = add i32 %16, 65
  %tmp48 = add i32 %17, 276
  %tmp50 = add i32 %16, 1
  br label %bb7

bb6:                                              ; preds = %bb4
  %23 = tail call i32* @__errno_location() nounwind readnone, !dbg !1129
  store i32 22, i32* %23, align 4, !dbg !1129
  br label %bb18, !dbg !1130

bb7:                                              ; preds = %bb7.lr.ph, %bb7
  %indvar = phi i32 [ 0, %bb7.lr.ph ], [ %indvar.next, %bb7 ]
  %bytes.025 = phi i32 [ 0, %bb7.lr.ph ], [ %34, %bb7 ]
  %scevgep29 = getelementptr inbounds %struct.dirent64* %dirp, i32 %indvar, i32 0
  %scevgep30 = getelementptr %struct.dirent64* %dirp, i32 %indvar, i32 2
  %scevgep31 = getelementptr %struct.dirent64* %dirp, i32 %indvar, i32 3
  %scevgep32 = getelementptr %struct.dirent64* %dirp, i32 %indvar, i32 1
  %scevgep35 = getelementptr %struct.dirent64* %dirp, i32 %indvar, i32 4, i32 0
  %scevgep36 = getelementptr %struct.dirent64* %dirp, i32 %indvar, i32 4, i32 1
  %tmp40 = add i32 %tmp38, %indvar
  %tmp41 = trunc i32 %tmp40 to i8
  %tmp43 = add i32 %16, %indvar
  %tmp46 = mul i32 %indvar, 276
  %tmp49 = add i32 %tmp48, %tmp46
  %tmp51 = add i32 %tmp50, %indvar
  %24 = load %struct.exe_disk_file_t** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i32 0, i32 4), align 4, !dbg !1131
  %scevgep45 = getelementptr %struct.exe_disk_file_t* %24, i32 %tmp43, i32 2
  %25 = load %struct.stat64** %scevgep45, align 4, !dbg !1132
  %26 = getelementptr inbounds %struct.stat64* %25, i32 0, i32 15, !dbg !1132
  %27 = load i64* %26, align 4, !dbg !1132
  store i64 %27, i64* %scevgep29, align 4, !dbg !1132
  store i16 276, i16* %scevgep30, align 4, !dbg !1133
  %28 = load %struct.stat64** %scevgep45, align 4, !dbg !1134
  %29 = getelementptr inbounds %struct.stat64* %28, i32 0, i32 3, !dbg !1134
  %30 = load i32* %29, align 4, !dbg !1134
  %31 = lshr i32 %30, 12
  %.tr = trunc i32 %31 to i8
  %32 = and i8 %.tr, 15, !dbg !1134
  store i8 %32, i8* %scevgep31, align 2, !dbg !1134
  store i8 %tmp41, i8* %scevgep35, align 1, !dbg !1135
  store i8 0, i8* %scevgep36, align 1, !dbg !1136
  %33 = zext i32 %tmp49 to i64, !dbg !1137
  store i64 %33, i64* %scevgep32, align 4, !dbg !1137
  %34 = add i32 %bytes.025, 276, !dbg !1138
  %35 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i32 0, i32 0), align 4, !dbg !1128
  %36 = icmp ugt i32 %35, %tmp51, !dbg !1128
  %indvar.next = add i32 %indvar, 1
  br i1 %36, label %bb7, label %bb8.bb9_crit_edge, !dbg !1128

bb8.bb9_crit_edge:                                ; preds = %bb7
  %scevgep34 = getelementptr %struct.dirent64* %dirp, i32 %indvar.next
  tail call void @llvm.dbg.value(metadata !{null}, i64 0, metadata !471), !dbg !1131
  tail call void @llvm.dbg.value(metadata !{i32 %34}, i64 0, metadata !470), !dbg !1138
  tail call void @llvm.dbg.value(metadata !{null}, i64 0, metadata !463), !dbg !1139
  tail call void @llvm.dbg.value(metadata !{null}, i64 0, metadata !467), !dbg !1128
  br label %bb9

bb9:                                              ; preds = %bb8.bb9_crit_edge, %bb8.preheader
  %dirp_addr.0.lcssa = phi %struct.dirent64* [ %scevgep34, %bb8.bb9_crit_edge ], [ %dirp, %bb8.preheader ]
  %bytes.0.lcssa = phi i32 [ %34, %bb8.bb9_crit_edge ], [ 0, %bb8.preheader ]
  %37 = icmp ugt i32 %count, 4096, !dbg !1140
  %min = select i1 %37, i32 4096, i32 %count, !dbg !1140
  tail call void @llvm.dbg.value(metadata !{i32 %min}, i64 0, metadata !469), !dbg !1140
  %38 = getelementptr inbounds %struct.dirent64* %dirp_addr.0.lcssa, i32 0, i32 0, !dbg !1141
  store i64 0, i64* %38, align 4, !dbg !1141
  %39 = trunc i32 %min to i16, !dbg !1142
  %40 = trunc i32 %bytes.0.lcssa to i16, !dbg !1142
  %41 = sub i16 %39, %40, !dbg !1142
  %42 = getelementptr inbounds %struct.dirent64* %dirp_addr.0.lcssa, i32 0, i32 2, !dbg !1142
  store i16 %41, i16* %42, align 4, !dbg !1142
  %43 = getelementptr inbounds %struct.dirent64* %dirp_addr.0.lcssa, i32 0, i32 3, !dbg !1143
  store i8 0, i8* %43, align 2, !dbg !1143
  %44 = getelementptr inbounds %struct.dirent64* %dirp_addr.0.lcssa, i32 0, i32 4, i32 0, !dbg !1144
  store i8 0, i8* %44, align 1, !dbg !1144
  %45 = getelementptr inbounds %struct.dirent64* %dirp_addr.0.lcssa, i32 0, i32 1, !dbg !1145
  store i64 4096, i64* %45, align 4, !dbg !1145
  %46 = zext i16 %41 to i32, !dbg !1146
  %47 = add i32 %46, %bytes.0.lcssa, !dbg !1146
  tail call void @llvm.dbg.value(metadata !{i32 %47}, i64 0, metadata !470), !dbg !1146
  %48 = zext i32 %min to i64, !dbg !1147
  store i64 %48, i64* %11, align 4, !dbg !1147
  br label %bb18, !dbg !1148

bb10:                                             ; preds = %bb3
  %49 = add i32 %13, -4096, !dbg !1149
  tail call void @llvm.dbg.value(metadata !{i32 %49}, i64 0, metadata !473), !dbg !1149
  %50 = bitcast %struct.dirent64* %dirp to i8*, !dbg !1150
  tail call void @llvm.memset.p0i8.i32(i8* %50, i8 0, i32 %count, i32 4, i1 false), !dbg !1150
  %51 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i32 0, i32 0, i32 %fd, i32 0, !dbg !1151
  %52 = load i32* %51, align 4, !dbg !1151
  %53 = tail call i32 (i32, ...)* @syscall(i32 19, i32 %52, i32 %49, i32 0) nounwind, !dbg !1151
  tail call void @llvm.dbg.value(metadata !{i32 %53}, i64 0, metadata !476), !dbg !1151
  %54 = icmp eq i32 %53, -1, !dbg !1152
  br i1 %54, label %bb11, label %bb12, !dbg !1152

bb11:                                             ; preds = %bb10
  tail call void @__assert_fail(i8* getelementptr inbounds ([18 x i8]* @.str15, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8]* @.str16, i32 0, i32 0), i32 735, i8* getelementptr inbounds ([14 x i8]* @__PRETTY_FUNCTION__.4787, i32 0, i32 0)) noreturn nounwind, !dbg !1152
  unreachable, !dbg !1152

bb12:                                             ; preds = %bb10
  %55 = load i32* %51, align 4, !dbg !1153
  %56 = tail call i32 (i32, ...)* @syscall(i32 220, i32 %55, %struct.dirent64* %dirp, i32 %count) nounwind, !dbg !1153
  tail call void @llvm.dbg.value(metadata !{i32 %56}, i64 0, metadata !475), !dbg !1153
  %57 = icmp eq i32 %56, -1, !dbg !1154
  br i1 %57, label %bb13, label %bb14, !dbg !1154

bb13:                                             ; preds = %bb12
  %58 = tail call i32* @__errno_location() nounwind readnone, !dbg !1155
  %59 = tail call i32 @klee_get_errno() nounwind, !dbg !1155
  store i32 %59, i32* %58, align 4, !dbg !1155
  br label %bb18, !dbg !1155

bb14:                                             ; preds = %bb12
  tail call void @llvm.dbg.value(metadata !561, i64 0, metadata !477), !dbg !1156
  %60 = load i32* %51, align 4, !dbg !1157
  %61 = tail call i32 (i32, ...)* @syscall(i32 19, i32 %60, i32 0, i32 1) nounwind, !dbg !1157
  %62 = add nsw i32 %61, 4096, !dbg !1157
  %63 = sext i32 %62 to i64, !dbg !1157
  store i64 %63, i64* %11, align 4, !dbg !1157
  %64 = icmp sgt i32 %56, 0, !dbg !1158
  br i1 %64, label %bb15, label %bb18, !dbg !1158

bb15:                                             ; preds = %bb14, %bb15
  %pos.023 = phi i32 [ %73, %bb15 ], [ 0, %bb14 ]
  %.sum = add i32 %pos.023, 8
  %65 = getelementptr inbounds i8* %50, i32 %.sum
  %66 = bitcast i8* %65 to i64*, !dbg !1159
  %67 = load i64* %66, align 4, !dbg !1159
  %68 = add nsw i64 %67, 4096, !dbg !1159
  store i64 %68, i64* %66, align 4, !dbg !1159
  %.sum21 = add i32 %pos.023, 16
  %69 = getelementptr inbounds i8* %50, i32 %.sum21
  %70 = bitcast i8* %69 to i16*, !dbg !1160
  %71 = load i16* %70, align 4, !dbg !1160
  %72 = zext i16 %71 to i32, !dbg !1160
  %73 = add nsw i32 %72, %pos.023, !dbg !1160
  %74 = icmp slt i32 %73, %56, !dbg !1158
  br i1 %74, label %bb15, label %bb18, !dbg !1158

bb18:                                             ; preds = %bb14, %bb15, %bb13, %bb9, %bb6, %bb2, %bb
  %.0 = phi i32 [ -1, %bb ], [ -1, %bb2 ], [ -1, %bb6 ], [ %47, %bb9 ], [ -1, %bb13 ], [ %56, %bb15 ], [ %56, %bb14 ]
  ret i32 %.0, !dbg !1119
}

declare void @__assert_fail(i8*, i8*, i32, i8*) noreturn nounwind

define i64 @__fd_lseek(i32 %fd, i64 %offset, i32 %whence) nounwind {
entry:
  tail call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !481), !dbg !1161
  tail call void @llvm.dbg.value(metadata !{i64 %offset}, i64 0, metadata !482), !dbg !1161
  tail call void @llvm.dbg.value(metadata !{i32 %whence}, i64 0, metadata !483), !dbg !1161
  tail call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !235), !dbg !1162
  %0 = icmp ult i32 %fd, 32, !dbg !1164
  br i1 %0, label %bb.i, label %bb, !dbg !1164

bb.i:                                             ; preds = %entry
  tail call void @llvm.dbg.value(metadata !552, i64 0, metadata !236), !dbg !1165
  %1 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i32 0, i32 0, i32 %fd, i32 1, !dbg !1166
  %2 = load i32* %1, align 4, !dbg !1166
  %3 = and i32 %2, 1
  %toBool.i = icmp eq i32 %3, 0, !dbg !1166
  br i1 %toBool.i, label %bb, label %__get_file.exit, !dbg !1166

__get_file.exit:                                  ; preds = %bb.i
  %4 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i32 0, i32 0, i32 %fd, !dbg !1165
  tail call void @llvm.dbg.value(metadata !{%struct.exe_file_t* %4}, i64 0, metadata !486), !dbg !1163
  %5 = icmp eq %struct.exe_file_t* %4, null, !dbg !1167
  br i1 %5, label %bb, label %bb1, !dbg !1167

bb:                                               ; preds = %entry, %bb.i, %__get_file.exit
  %6 = tail call i32* @__errno_location() nounwind readnone, !dbg !1168
  store i32 9, i32* %6, align 4, !dbg !1168
  br label %bb19, !dbg !1169

bb1:                                              ; preds = %__get_file.exit
  %7 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i32 0, i32 0, i32 %fd, i32 3, !dbg !1170
  %8 = load %struct.exe_disk_file_t** %7, align 4, !dbg !1170
  %9 = icmp eq %struct.exe_disk_file_t* %8, null, !dbg !1170
  br i1 %9, label %bb2, label %bb11, !dbg !1170

bb2:                                              ; preds = %bb1
  %10 = icmp eq i32 %whence, 0, !dbg !1171
  br i1 %10, label %bb3, label %bb4, !dbg !1171

bb3:                                              ; preds = %bb2
  %11 = trunc i64 %offset to i32, !dbg !1172
  %12 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i32 0, i32 0, i32 %fd, i32 0, !dbg !1172
  %13 = load i32* %12, align 4, !dbg !1172
  %14 = tail call i32 (i32, ...)* @syscall(i32 19, i32 %13, i32 %11, i32 0) nounwind, !dbg !1172
  %15 = sext i32 %14 to i64, !dbg !1172
  tail call void @llvm.dbg.value(metadata !{i64 %15}, i64 0, metadata !484), !dbg !1172
  br label %bb8, !dbg !1172

bb4:                                              ; preds = %bb2
  %16 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i32 0, i32 0, i32 %fd, i32 2, !dbg !1173
  %17 = load i64* %16, align 4, !dbg !1173
  %18 = trunc i64 %17 to i32, !dbg !1173
  %19 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i32 0, i32 0, i32 %fd, i32 0, !dbg !1173
  %20 = load i32* %19, align 4, !dbg !1173
  %21 = tail call i32 (i32, ...)* @syscall(i32 19, i32 %20, i32 %18, i32 0) nounwind, !dbg !1173
  %22 = sext i32 %21 to i64, !dbg !1173
  tail call void @llvm.dbg.value(metadata !{i64 %22}, i64 0, metadata !484), !dbg !1173
  %23 = icmp eq i32 %21, -1, !dbg !1174
  br i1 %23, label %bb8, label %bb5, !dbg !1174

bb5:                                              ; preds = %bb4
  %24 = load i64* %16, align 4, !dbg !1175
  %25 = icmp eq i64 %24, %22, !dbg !1175
  br i1 %25, label %bb7, label %bb6, !dbg !1175

bb6:                                              ; preds = %bb5
  tail call void @__assert_fail(i8* getelementptr inbounds ([18 x i8]* @.str17, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8]* @.str16, i32 0, i32 0), i32 397, i8* getelementptr inbounds ([11 x i8]* @__PRETTY_FUNCTION__.4531, i32 0, i32 0)) noreturn nounwind, !dbg !1175
  unreachable, !dbg !1175

bb7:                                              ; preds = %bb5
  %26 = trunc i64 %offset to i32, !dbg !1176
  %27 = load i32* %19, align 4, !dbg !1176
  %28 = tail call i32 (i32, ...)* @syscall(i32 19, i32 %27, i32 %26, i32 %whence) nounwind, !dbg !1176
  %29 = sext i32 %28 to i64, !dbg !1176
  tail call void @llvm.dbg.value(metadata !{i64 %29}, i64 0, metadata !484), !dbg !1176
  br label %bb8, !dbg !1176

bb8:                                              ; preds = %bb4, %bb7, %bb3
  %new_off.0 = phi i64 [ %15, %bb3 ], [ %29, %bb7 ], [ %22, %bb4 ]
  %30 = icmp eq i64 %new_off.0, -1, !dbg !1177
  br i1 %30, label %bb9, label %bb10, !dbg !1177

bb9:                                              ; preds = %bb8
  %31 = tail call i32* @__errno_location() nounwind readnone, !dbg !1178
  %32 = tail call i32 @klee_get_errno() nounwind, !dbg !1178
  store i32 %32, i32* %31, align 4, !dbg !1178
  br label %bb19, !dbg !1179

bb10:                                             ; preds = %bb8
  %33 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i32 0, i32 0, i32 %fd, i32 2, !dbg !1180
  store i64 %new_off.0, i64* %33, align 4, !dbg !1180
  br label %bb19, !dbg !1181

bb11:                                             ; preds = %bb1
  switch i32 %whence, label %bb15 [
    i32 0, label %bb16
    i32 1, label %bb13
    i32 2, label %bb14
  ], !dbg !1182

bb13:                                             ; preds = %bb11
  %34 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i32 0, i32 0, i32 %fd, i32 2, !dbg !1183
  %35 = load i64* %34, align 4, !dbg !1183
  %36 = add nsw i64 %35, %offset, !dbg !1183
  tail call void @llvm.dbg.value(metadata !{i64 %36}, i64 0, metadata !484), !dbg !1183
  br label %bb16, !dbg !1183

bb14:                                             ; preds = %bb11
  %37 = getelementptr inbounds %struct.exe_disk_file_t* %8, i32 0, i32 0, !dbg !1184
  %38 = load i32* %37, align 4, !dbg !1184
  %39 = zext i32 %38 to i64, !dbg !1184
  %40 = add nsw i64 %39, %offset, !dbg !1184
  tail call void @llvm.dbg.value(metadata !{i64 %40}, i64 0, metadata !484), !dbg !1184
  br label %bb16, !dbg !1184

bb15:                                             ; preds = %bb11
  %41 = tail call i32* @__errno_location() nounwind readnone, !dbg !1185
  store i32 22, i32* %41, align 4, !dbg !1185
  br label %bb19, !dbg !1186

bb16:                                             ; preds = %bb11, %bb14, %bb13
  %new_off.1 = phi i64 [ %40, %bb14 ], [ %36, %bb13 ], [ %offset, %bb11 ]
  %42 = icmp slt i64 %new_off.1, 0, !dbg !1187
  br i1 %42, label %bb17, label %bb18, !dbg !1187

bb17:                                             ; preds = %bb16
  %43 = tail call i32* @__errno_location() nounwind readnone, !dbg !1188
  store i32 22, i32* %43, align 4, !dbg !1188
  br label %bb19, !dbg !1189

bb18:                                             ; preds = %bb16
  %44 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i32 0, i32 0, i32 %fd, i32 2, !dbg !1190
  store i64 %new_off.1, i64* %44, align 4, !dbg !1190
  br label %bb19, !dbg !1191

bb19:                                             ; preds = %bb18, %bb17, %bb15, %bb10, %bb9, %bb
  %.0 = phi i64 [ -1, %bb ], [ -1, %bb9 ], [ %new_off.0, %bb10 ], [ -1, %bb15 ], [ -1, %bb17 ], [ %new_off.1, %bb18 ]
  ret i64 %.0, !dbg !1169
}

define i32 @__fd_fstat(i32 %fd, %struct.stat64* %buf) nounwind {
entry:
  tail call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !487), !dbg !1192
  tail call void @llvm.dbg.value(metadata !{%struct.stat64* %buf}, i64 0, metadata !488), !dbg !1192
  tail call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !235), !dbg !1193
  %0 = icmp ult i32 %fd, 32, !dbg !1195
  br i1 %0, label %bb.i, label %bb, !dbg !1195

bb.i:                                             ; preds = %entry
  tail call void @llvm.dbg.value(metadata !552, i64 0, metadata !236), !dbg !1196
  %1 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i32 0, i32 0, i32 %fd, i32 1, !dbg !1197
  %2 = load i32* %1, align 4, !dbg !1197
  %3 = and i32 %2, 1
  %toBool.i = icmp eq i32 %3, 0, !dbg !1197
  br i1 %toBool.i, label %bb, label %__get_file.exit, !dbg !1197

__get_file.exit:                                  ; preds = %bb.i
  %4 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i32 0, i32 0, i32 %fd, !dbg !1196
  tail call void @llvm.dbg.value(metadata !{%struct.exe_file_t* %4}, i64 0, metadata !489), !dbg !1194
  %5 = icmp eq %struct.exe_file_t* %4, null, !dbg !1198
  br i1 %5, label %bb, label %bb1, !dbg !1198

bb:                                               ; preds = %entry, %bb.i, %__get_file.exit
  %6 = tail call i32* @__errno_location() nounwind readnone, !dbg !1199
  store i32 9, i32* %6, align 4, !dbg !1199
  br label %bb6, !dbg !1200

bb1:                                              ; preds = %__get_file.exit
  %7 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i32 0, i32 0, i32 %fd, i32 3, !dbg !1201
  %8 = load %struct.exe_disk_file_t** %7, align 4, !dbg !1201
  %9 = icmp eq %struct.exe_disk_file_t* %8, null, !dbg !1201
  br i1 %9, label %bb2, label %bb5, !dbg !1201

bb2:                                              ; preds = %bb1
  %10 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i32 0, i32 0, i32 %fd, i32 0, !dbg !1202
  %11 = load i32* %10, align 4, !dbg !1202
  %12 = tail call i32 (i32, ...)* @syscall(i32 197, i32 %11, %struct.stat64* %buf) nounwind, !dbg !1202
  tail call void @llvm.dbg.value(metadata !{i32 %12}, i64 0, metadata !491), !dbg !1202
  %13 = icmp eq i32 %12, -1, !dbg !1203
  br i1 %13, label %bb3, label %bb6, !dbg !1203

bb3:                                              ; preds = %bb2
  %14 = tail call i32* @__errno_location() nounwind readnone, !dbg !1204
  %15 = tail call i32 @klee_get_errno() nounwind, !dbg !1204
  store i32 %15, i32* %14, align 4, !dbg !1204
  br label %bb6, !dbg !1204

bb5:                                              ; preds = %bb1
  %16 = getelementptr inbounds %struct.exe_disk_file_t* %8, i32 0, i32 2, !dbg !1205
  %17 = load %struct.stat64** %16, align 4, !dbg !1205
  %18 = bitcast %struct.stat64* %buf to i8*, !dbg !1205
  %19 = bitcast %struct.stat64* %17 to i8*, !dbg !1205
  tail call void @llvm.memcpy.p0i8.p0i8.i32(i8* %18, i8* %19, i32 96, i32 4, i1 false), !dbg !1205
  br label %bb6, !dbg !1206

bb6:                                              ; preds = %bb2, %bb3, %bb5, %bb
  %.0 = phi i32 [ -1, %bb ], [ 0, %bb5 ], [ -1, %bb3 ], [ %12, %bb2 ]
  ret i32 %.0, !dbg !1200
}

define i32 @__fd_lstat(i8* %path, %struct.stat64* %buf) nounwind {
entry:
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !493), !dbg !1207
  tail call void @llvm.dbg.value(metadata !{%struct.stat64* %buf}, i64 0, metadata !494), !dbg !1207
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !229), !dbg !1208
  %0 = load i8* %path, align 1, !dbg !1210
  tail call void @llvm.dbg.value(metadata !{i8 %0}, i64 0, metadata !230), !dbg !1210
  %1 = icmp eq i8 %0, 0, !dbg !1211
  br i1 %1, label %bb1, label %bb.i, !dbg !1211

bb.i:                                             ; preds = %entry
  %2 = getelementptr inbounds i8* %path, i32 1, !dbg !1211
  %3 = load i8* %2, align 1, !dbg !1211
  %4 = icmp eq i8 %3, 0, !dbg !1211
  br i1 %4, label %bb8.preheader.i, label %bb1, !dbg !1211

bb8.preheader.i:                                  ; preds = %bb.i
  %5 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i32 0, i32 0), align 4, !dbg !1212
  %6 = sext i8 %0 to i32, !dbg !1213
  br label %bb8.i

bb3.i:                                            ; preds = %bb8.i
  %sext.i = shl i32 %17, 24
  %7 = ashr exact i32 %sext.i, 24, !dbg !1213
  %8 = add nsw i32 %7, 65, !dbg !1213
  %9 = icmp eq i32 %6, %8, !dbg !1213
  br i1 %9, label %bb4.i, label %bb7.i, !dbg !1213

bb4.i:                                            ; preds = %bb3.i
  %10 = load %struct.exe_disk_file_t** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i32 0, i32 4), align 4, !dbg !1214
  tail call void @llvm.dbg.value(metadata !552, i64 0, metadata !233), !dbg !1214
  %11 = getelementptr inbounds %struct.exe_disk_file_t* %10, i32 %17, i32 2, !dbg !1215
  %12 = load %struct.stat64** %11, align 4, !dbg !1215
  %13 = getelementptr inbounds %struct.stat64* %12, i32 0, i32 15, !dbg !1215
  %14 = load i64* %13, align 4, !dbg !1215
  %15 = icmp eq i64 %14, 0, !dbg !1215
  br i1 %15, label %bb1, label %__get_sym_file.exit, !dbg !1215

bb7.i:                                            ; preds = %bb3.i
  %16 = add i32 %17, 1, !dbg !1212
  br label %bb8.i, !dbg !1212

bb8.i:                                            ; preds = %bb7.i, %bb8.preheader.i
  %17 = phi i32 [ %16, %bb7.i ], [ 0, %bb8.preheader.i ]
  %18 = icmp ugt i32 %5, %17, !dbg !1212
  br i1 %18, label %bb3.i, label %bb1, !dbg !1212

__get_sym_file.exit:                              ; preds = %bb4.i
  %19 = getelementptr inbounds %struct.exe_disk_file_t* %10, i32 %17, !dbg !1214
  tail call void @llvm.dbg.value(metadata !{%struct.exe_disk_file_t* %19}, i64 0, metadata !495), !dbg !1209
  %20 = icmp eq %struct.exe_disk_file_t* %19, null, !dbg !1216
  br i1 %20, label %bb1, label %bb, !dbg !1216

bb:                                               ; preds = %__get_sym_file.exit
  %21 = bitcast %struct.stat64* %buf to i8*, !dbg !1217
  %22 = bitcast %struct.stat64* %12 to i8*, !dbg !1217
  tail call void @llvm.memcpy.p0i8.p0i8.i32(i8* %21, i8* %22, i32 96, i32 4, i1 false), !dbg !1217
  br label %bb4, !dbg !1218

bb1:                                              ; preds = %bb8.i, %bb4.i, %entry, %bb.i, %__get_sym_file.exit
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !311) nounwind, !dbg !1219
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !301) nounwind, !dbg !1221
  %23 = ptrtoint i8* %path to i32, !dbg !1223
  %24 = tail call i32 @klee_get_valuel(i32 %23) nounwind, !dbg !1223
  %25 = inttoptr i32 %24 to i8*, !dbg !1223
  tail call void @llvm.dbg.value(metadata !{i8* %25}, i64 0, metadata !302) nounwind, !dbg !1223
  %26 = icmp eq i8* %25, %path, !dbg !1224
  %27 = zext i1 %26 to i32, !dbg !1224
  tail call void @klee_assume(i32 %27) nounwind, !dbg !1224
  tail call void @llvm.dbg.value(metadata !{i8* %25}, i64 0, metadata !312) nounwind, !dbg !1222
  tail call void @llvm.dbg.value(metadata !561, i64 0, metadata !314) nounwind, !dbg !1225
  br label %bb.i6, !dbg !1225

bb.i6:                                            ; preds = %bb6.i8, %bb1
  %sc.0.i = phi i8* [ %25, %bb1 ], [ %sc.1.i, %bb6.i8 ]
  %28 = phi i32 [ 0, %bb1 ], [ %40, %bb6.i8 ]
  %tmp.i = add i32 %28, -1
  %29 = load i8* %sc.0.i, align 1, !dbg !1226
  %30 = and i32 %tmp.i, %28, !dbg !1227
  %31 = icmp eq i32 %30, 0, !dbg !1227
  br i1 %31, label %bb1.i, label %bb5.i, !dbg !1227

bb1.i:                                            ; preds = %bb.i6
  switch i8 %29, label %bb6.i8 [
    i8 0, label %bb2.i
    i8 47, label %bb4.i7
  ]

bb2.i:                                            ; preds = %bb1.i
  tail call void @llvm.dbg.value(metadata !{i8 %29}, i64 0, metadata !315) nounwind, !dbg !1226
  store i8 0, i8* %sc.0.i, align 1, !dbg !1228
  tail call void @llvm.dbg.value(metadata !{null}, i64 0, metadata !312) nounwind, !dbg !1228
  br label %__concretize_string.exit, !dbg !1228

bb4.i7:                                           ; preds = %bb1.i
  store i8 47, i8* %sc.0.i, align 1, !dbg !1229
  %32 = getelementptr inbounds i8* %sc.0.i, i32 1, !dbg !1229
  br label %bb6.i8, !dbg !1229

bb5.i:                                            ; preds = %bb.i6
  %33 = sext i8 %29 to i32, !dbg !1230
  %34 = tail call i32 @klee_get_valuel(i32 %33) nounwind, !dbg !1230
  %35 = trunc i32 %34 to i8, !dbg !1230
  %36 = icmp eq i8 %35, %29, !dbg !1231
  %37 = zext i1 %36 to i32, !dbg !1231
  tail call void @klee_assume(i32 %37) nounwind, !dbg !1231
  store i8 %35, i8* %sc.0.i, align 1, !dbg !1232
  %38 = getelementptr inbounds i8* %sc.0.i, i32 1, !dbg !1232
  %39 = icmp eq i8 %35, 0, !dbg !1233
  br i1 %39, label %__concretize_string.exit, label %bb6.i8, !dbg !1233

bb6.i8:                                           ; preds = %bb5.i, %bb4.i7, %bb1.i
  %sc.1.i = phi i8* [ %32, %bb4.i7 ], [ %38, %bb5.i ], [ %sc.0.i, %bb1.i ]
  %40 = add i32 %28, 1, !dbg !1225
  br label %bb.i6, !dbg !1225

__concretize_string.exit:                         ; preds = %bb5.i, %bb2.i
  %41 = tail call i32 (i32, ...)* @syscall(i32 196, i8* %path, %struct.stat64* %buf) nounwind, !dbg !1220
  tail call void @llvm.dbg.value(metadata !{i32 %41}, i64 0, metadata !497), !dbg !1220
  %42 = icmp eq i32 %41, -1, !dbg !1234
  br i1 %42, label %bb2, label %bb4, !dbg !1234

bb2:                                              ; preds = %__concretize_string.exit
  %43 = tail call i32* @__errno_location() nounwind readnone, !dbg !1235
  %44 = tail call i32 @klee_get_errno() nounwind, !dbg !1235
  store i32 %44, i32* %43, align 4, !dbg !1235
  br label %bb4, !dbg !1235

bb4:                                              ; preds = %__concretize_string.exit, %bb2, %bb
  %.0 = phi i32 [ 0, %bb ], [ -1, %bb2 ], [ %41, %__concretize_string.exit ]
  ret i32 %.0, !dbg !1218
}

define i32 @__fd_stat(i8* %path, %struct.stat64* %buf) nounwind {
entry:
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !499), !dbg !1236
  tail call void @llvm.dbg.value(metadata !{%struct.stat64* %buf}, i64 0, metadata !500), !dbg !1236
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !229), !dbg !1237
  %0 = load i8* %path, align 1, !dbg !1239
  tail call void @llvm.dbg.value(metadata !{i8 %0}, i64 0, metadata !230), !dbg !1239
  %1 = icmp eq i8 %0, 0, !dbg !1240
  br i1 %1, label %bb1, label %bb.i, !dbg !1240

bb.i:                                             ; preds = %entry
  %2 = getelementptr inbounds i8* %path, i32 1, !dbg !1240
  %3 = load i8* %2, align 1, !dbg !1240
  %4 = icmp eq i8 %3, 0, !dbg !1240
  br i1 %4, label %bb8.preheader.i, label %bb1, !dbg !1240

bb8.preheader.i:                                  ; preds = %bb.i
  %5 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i32 0, i32 0), align 4, !dbg !1241
  %6 = sext i8 %0 to i32, !dbg !1242
  br label %bb8.i

bb3.i:                                            ; preds = %bb8.i
  %sext.i = shl i32 %17, 24
  %7 = ashr exact i32 %sext.i, 24, !dbg !1242
  %8 = add nsw i32 %7, 65, !dbg !1242
  %9 = icmp eq i32 %6, %8, !dbg !1242
  br i1 %9, label %bb4.i, label %bb7.i, !dbg !1242

bb4.i:                                            ; preds = %bb3.i
  %10 = load %struct.exe_disk_file_t** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i32 0, i32 4), align 4, !dbg !1243
  tail call void @llvm.dbg.value(metadata !552, i64 0, metadata !233), !dbg !1243
  %11 = getelementptr inbounds %struct.exe_disk_file_t* %10, i32 %17, i32 2, !dbg !1244
  %12 = load %struct.stat64** %11, align 4, !dbg !1244
  %13 = getelementptr inbounds %struct.stat64* %12, i32 0, i32 15, !dbg !1244
  %14 = load i64* %13, align 4, !dbg !1244
  %15 = icmp eq i64 %14, 0, !dbg !1244
  br i1 %15, label %bb1, label %__get_sym_file.exit, !dbg !1244

bb7.i:                                            ; preds = %bb3.i
  %16 = add i32 %17, 1, !dbg !1241
  br label %bb8.i, !dbg !1241

bb8.i:                                            ; preds = %bb7.i, %bb8.preheader.i
  %17 = phi i32 [ %16, %bb7.i ], [ 0, %bb8.preheader.i ]
  %18 = icmp ugt i32 %5, %17, !dbg !1241
  br i1 %18, label %bb3.i, label %bb1, !dbg !1241

__get_sym_file.exit:                              ; preds = %bb4.i
  %19 = getelementptr inbounds %struct.exe_disk_file_t* %10, i32 %17, !dbg !1243
  tail call void @llvm.dbg.value(metadata !{%struct.exe_disk_file_t* %19}, i64 0, metadata !501), !dbg !1238
  %20 = icmp eq %struct.exe_disk_file_t* %19, null, !dbg !1245
  br i1 %20, label %bb1, label %bb, !dbg !1245

bb:                                               ; preds = %__get_sym_file.exit
  %21 = bitcast %struct.stat64* %buf to i8*, !dbg !1246
  %22 = bitcast %struct.stat64* %12 to i8*, !dbg !1246
  tail call void @llvm.memcpy.p0i8.p0i8.i32(i8* %21, i8* %22, i32 96, i32 4, i1 false), !dbg !1246
  br label %bb4, !dbg !1247

bb1:                                              ; preds = %bb8.i, %bb4.i, %entry, %bb.i, %__get_sym_file.exit
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !311) nounwind, !dbg !1248
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !301) nounwind, !dbg !1250
  %23 = ptrtoint i8* %path to i32, !dbg !1252
  %24 = tail call i32 @klee_get_valuel(i32 %23) nounwind, !dbg !1252
  %25 = inttoptr i32 %24 to i8*, !dbg !1252
  tail call void @llvm.dbg.value(metadata !{i8* %25}, i64 0, metadata !302) nounwind, !dbg !1252
  %26 = icmp eq i8* %25, %path, !dbg !1253
  %27 = zext i1 %26 to i32, !dbg !1253
  tail call void @klee_assume(i32 %27) nounwind, !dbg !1253
  tail call void @llvm.dbg.value(metadata !{i8* %25}, i64 0, metadata !312) nounwind, !dbg !1251
  tail call void @llvm.dbg.value(metadata !561, i64 0, metadata !314) nounwind, !dbg !1254
  br label %bb.i6, !dbg !1254

bb.i6:                                            ; preds = %bb6.i8, %bb1
  %sc.0.i = phi i8* [ %25, %bb1 ], [ %sc.1.i, %bb6.i8 ]
  %28 = phi i32 [ 0, %bb1 ], [ %40, %bb6.i8 ]
  %tmp.i = add i32 %28, -1
  %29 = load i8* %sc.0.i, align 1, !dbg !1255
  %30 = and i32 %tmp.i, %28, !dbg !1256
  %31 = icmp eq i32 %30, 0, !dbg !1256
  br i1 %31, label %bb1.i, label %bb5.i, !dbg !1256

bb1.i:                                            ; preds = %bb.i6
  switch i8 %29, label %bb6.i8 [
    i8 0, label %bb2.i
    i8 47, label %bb4.i7
  ]

bb2.i:                                            ; preds = %bb1.i
  tail call void @llvm.dbg.value(metadata !{i8 %29}, i64 0, metadata !315) nounwind, !dbg !1255
  store i8 0, i8* %sc.0.i, align 1, !dbg !1257
  tail call void @llvm.dbg.value(metadata !{null}, i64 0, metadata !312) nounwind, !dbg !1257
  br label %__concretize_string.exit, !dbg !1257

bb4.i7:                                           ; preds = %bb1.i
  store i8 47, i8* %sc.0.i, align 1, !dbg !1258
  %32 = getelementptr inbounds i8* %sc.0.i, i32 1, !dbg !1258
  br label %bb6.i8, !dbg !1258

bb5.i:                                            ; preds = %bb.i6
  %33 = sext i8 %29 to i32, !dbg !1259
  %34 = tail call i32 @klee_get_valuel(i32 %33) nounwind, !dbg !1259
  %35 = trunc i32 %34 to i8, !dbg !1259
  %36 = icmp eq i8 %35, %29, !dbg !1260
  %37 = zext i1 %36 to i32, !dbg !1260
  tail call void @klee_assume(i32 %37) nounwind, !dbg !1260
  store i8 %35, i8* %sc.0.i, align 1, !dbg !1261
  %38 = getelementptr inbounds i8* %sc.0.i, i32 1, !dbg !1261
  %39 = icmp eq i8 %35, 0, !dbg !1262
  br i1 %39, label %__concretize_string.exit, label %bb6.i8, !dbg !1262

bb6.i8:                                           ; preds = %bb5.i, %bb4.i7, %bb1.i
  %sc.1.i = phi i8* [ %32, %bb4.i7 ], [ %38, %bb5.i ], [ %sc.0.i, %bb1.i ]
  %40 = add i32 %28, 1, !dbg !1254
  br label %bb.i6, !dbg !1254

__concretize_string.exit:                         ; preds = %bb5.i, %bb2.i
  %41 = tail call i32 (i32, ...)* @syscall(i32 195, i8* %path, %struct.stat64* %buf) nounwind, !dbg !1249
  tail call void @llvm.dbg.value(metadata !{i32 %41}, i64 0, metadata !503), !dbg !1249
  %42 = icmp eq i32 %41, -1, !dbg !1263
  br i1 %42, label %bb2, label %bb4, !dbg !1263

bb2:                                              ; preds = %__concretize_string.exit
  %43 = tail call i32* @__errno_location() nounwind readnone, !dbg !1264
  %44 = tail call i32 @klee_get_errno() nounwind, !dbg !1264
  store i32 %44, i32* %43, align 4, !dbg !1264
  br label %bb4, !dbg !1264

bb4:                                              ; preds = %__concretize_string.exit, %bb2, %bb
  %.0 = phi i32 [ 0, %bb ], [ -1, %bb2 ], [ %41, %__concretize_string.exit ]
  ret i32 %.0, !dbg !1247
}

define i32 @read(i32 %fd, i8* %buf, i32 %count) nounwind {
entry:
  tail call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !505), !dbg !1265
  tail call void @llvm.dbg.value(metadata !{i8* %buf}, i64 0, metadata !506), !dbg !1265
  tail call void @llvm.dbg.value(metadata !{i32 %count}, i64 0, metadata !507), !dbg !1265
  %0 = load i32* @n_calls.4402, align 4, !dbg !1266
  %1 = add nsw i32 %0, 1, !dbg !1266
  store i32 %1, i32* @n_calls.4402, align 4, !dbg !1266
  %2 = icmp eq i32 %count, 0, !dbg !1267
  br i1 %2, label %bb24, label %bb1, !dbg !1267

bb1:                                              ; preds = %entry
  %3 = icmp eq i8* %buf, null, !dbg !1268
  br i1 %3, label %bb2, label %bb3, !dbg !1268

bb2:                                              ; preds = %bb1
  %4 = tail call i32* @__errno_location() nounwind readnone, !dbg !1269
  store i32 14, i32* %4, align 4, !dbg !1269
  br label %bb24, !dbg !1270

bb3:                                              ; preds = %bb1
  tail call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !235), !dbg !1271
  %5 = icmp ult i32 %fd, 32, !dbg !1273
  br i1 %5, label %bb.i, label %bb4, !dbg !1273

bb.i:                                             ; preds = %bb3
  tail call void @llvm.dbg.value(metadata !552, i64 0, metadata !236), !dbg !1274
  %6 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i32 0, i32 0, i32 %fd, i32 1, !dbg !1275
  %7 = load i32* %6, align 4, !dbg !1275
  %8 = and i32 %7, 1
  %toBool.i = icmp eq i32 %8, 0, !dbg !1275
  br i1 %toBool.i, label %bb4, label %__get_file.exit, !dbg !1275

__get_file.exit:                                  ; preds = %bb.i
  %9 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i32 0, i32 0, i32 %fd, !dbg !1274
  tail call void @llvm.dbg.value(metadata !{%struct.exe_file_t* %9}, i64 0, metadata !508), !dbg !1272
  %10 = icmp eq %struct.exe_file_t* %9, null, !dbg !1276
  br i1 %10, label %bb4, label %bb5, !dbg !1276

bb4:                                              ; preds = %bb3, %bb.i, %__get_file.exit
  %11 = tail call i32* @__errno_location() nounwind readnone, !dbg !1277
  store i32 9, i32* %11, align 4, !dbg !1277
  br label %bb24, !dbg !1278

bb5:                                              ; preds = %__get_file.exit
  %12 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i32 0, i32 5), align 4, !dbg !1279
  %13 = icmp eq i32 %12, 0, !dbg !1279
  br i1 %13, label %bb8, label %bb6, !dbg !1279

bb6:                                              ; preds = %bb5
  %14 = load i32** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i32 0, i32 6), align 4, !dbg !1279
  %15 = load i32* %14, align 4, !dbg !1279
  %16 = icmp eq i32 %15, %1, !dbg !1279
  br i1 %16, label %bb7, label %bb8, !dbg !1279

bb7:                                              ; preds = %bb6
  %17 = add i32 %12, -1, !dbg !1280
  store i32 %17, i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i32 0, i32 5), align 4, !dbg !1280
  %18 = tail call i32* @__errno_location() nounwind readnone, !dbg !1281
  store i32 5, i32* %18, align 4, !dbg !1281
  br label %bb24, !dbg !1282

bb8:                                              ; preds = %bb5, %bb6
  %19 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i32 0, i32 0, i32 %fd, i32 3, !dbg !1283
  %20 = load %struct.exe_disk_file_t** %19, align 4, !dbg !1283
  %21 = icmp eq %struct.exe_disk_file_t* %20, null, !dbg !1283
  br i1 %21, label %bb9, label %bb17, !dbg !1283

bb9:                                              ; preds = %bb8
  tail call void @llvm.dbg.value(metadata !{i8* %buf}, i64 0, metadata !301) nounwind, !dbg !1284
  %22 = ptrtoint i8* %buf to i32, !dbg !1286
  %23 = tail call i32 @klee_get_valuel(i32 %22) nounwind, !dbg !1286
  %24 = inttoptr i32 %23 to i8*, !dbg !1286
  tail call void @llvm.dbg.value(metadata !{i8* %24}, i64 0, metadata !302) nounwind, !dbg !1286
  %25 = icmp eq i8* %24, %buf, !dbg !1287
  %26 = zext i1 %25 to i32, !dbg !1287
  tail call void @klee_assume(i32 %26) nounwind, !dbg !1287
  tail call void @llvm.dbg.value(metadata !{i8* %24}, i64 0, metadata !506), !dbg !1285
  tail call void @llvm.dbg.value(metadata !{i32 %count}, i64 0, metadata !304) nounwind, !dbg !1288
  %27 = tail call i32 @klee_get_valuel(i32 %count) nounwind, !dbg !1290
  tail call void @llvm.dbg.value(metadata !{i32 %27}, i64 0, metadata !305) nounwind, !dbg !1290
  %28 = icmp eq i32 %27, %count, !dbg !1291
  %29 = zext i1 %28 to i32, !dbg !1291
  tail call void @klee_assume(i32 %29) nounwind, !dbg !1291
  tail call void @llvm.dbg.value(metadata !{i32 %27}, i64 0, metadata !507), !dbg !1289
  tail call void @klee_check_memory_access(i8* %24, i32 %27) nounwind, !dbg !1292
  %30 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i32 0, i32 0, i32 %fd, i32 0, !dbg !1293
  %31 = load i32* %30, align 4, !dbg !1293
  %32 = icmp eq i32 %31, 0, !dbg !1293
  br i1 %32, label %bb10, label %bb11, !dbg !1293

bb10:                                             ; preds = %bb9
  %33 = tail call i32 (i32, ...)* @syscall(i32 3, i32 %31, i8* %24, i32 %27) nounwind, !dbg !1294
  tail call void @llvm.dbg.value(metadata !{i32 %33}, i64 0, metadata !510), !dbg !1294
  br label %bb12, !dbg !1294

bb11:                                             ; preds = %bb9
  %34 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i32 0, i32 0, i32 %fd, i32 2, !dbg !1295
  %35 = load i64* %34, align 4, !dbg !1295
  %36 = tail call i32 (i32, ...)* @syscall(i32 180, i32 %31, i8* %24, i32 %27, i64 %35) nounwind, !dbg !1295
  tail call void @llvm.dbg.value(metadata !{i32 %36}, i64 0, metadata !510), !dbg !1295
  br label %bb12, !dbg !1295

bb12:                                             ; preds = %bb11, %bb10
  %r.0 = phi i32 [ %33, %bb10 ], [ %36, %bb11 ]
  %37 = icmp eq i32 %r.0, -1, !dbg !1296
  br i1 %37, label %bb13, label %bb14, !dbg !1296

bb13:                                             ; preds = %bb12
  %38 = tail call i32* @__errno_location() nounwind readnone, !dbg !1297
  %39 = tail call i32 @klee_get_errno() nounwind, !dbg !1297
  store i32 %39, i32* %38, align 4, !dbg !1297
  br label %bb24, !dbg !1298

bb14:                                             ; preds = %bb12
  %40 = load i32* %30, align 4, !dbg !1299
  %41 = icmp eq i32 %40, 0, !dbg !1299
  br i1 %41, label %bb24, label %bb15, !dbg !1299

bb15:                                             ; preds = %bb14
  %42 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i32 0, i32 0, i32 %fd, i32 2, !dbg !1300
  %43 = load i64* %42, align 4, !dbg !1300
  %44 = sext i32 %r.0 to i64, !dbg !1300
  %45 = add nsw i64 %43, %44, !dbg !1300
  store i64 %45, i64* %42, align 4, !dbg !1300
  br label %bb24, !dbg !1300

bb17:                                             ; preds = %bb8
  %46 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i32 0, i32 0, i32 %fd, i32 2, !dbg !1301
  %47 = load i64* %46, align 4, !dbg !1301
  %48 = icmp slt i64 %47, 0, !dbg !1301
  br i1 %48, label %bb18, label %bb19, !dbg !1301

bb18:                                             ; preds = %bb17
  tail call void @__assert_fail(i8* getelementptr inbounds ([12 x i8]* @.str18, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8]* @.str16, i32 0, i32 0), i32 284, i8* getelementptr inbounds ([5 x i8]* @__PRETTY_FUNCTION__.4405, i32 0, i32 0)) noreturn nounwind, !dbg !1301
  unreachable, !dbg !1301

bb19:                                             ; preds = %bb17
  %49 = getelementptr inbounds %struct.exe_disk_file_t* %20, i32 0, i32 0, !dbg !1302
  %50 = load i32* %49, align 4, !dbg !1302
  %51 = zext i32 %50 to i64, !dbg !1302
  %52 = icmp slt i64 %51, %47, !dbg !1302
  br i1 %52, label %bb24, label %bb21, !dbg !1302

bb21:                                             ; preds = %bb19
  %53 = zext i32 %count to i64, !dbg !1303
  %54 = add nsw i64 %47, %53, !dbg !1303
  %55 = icmp sgt i64 %54, %51, !dbg !1303
  %56 = trunc i64 %47 to i32, !dbg !1304
  %57 = sub i32 %50, %56, !dbg !1304
  tail call void @llvm.dbg.value(metadata !{i32 %57}, i64 0, metadata !507), !dbg !1304
  %count_addr.0 = select i1 %55, i32 %57, i32 %count
  %58 = getelementptr inbounds %struct.exe_disk_file_t* %20, i32 0, i32 1, !dbg !1305
  %59 = load i8** %58, align 4, !dbg !1305
  %60 = getelementptr inbounds i8* %59, i32 %56, !dbg !1305
  tail call void @llvm.memcpy.p0i8.p0i8.i32(i8* %buf, i8* %60, i32 %count_addr.0, i32 1, i1 false), !dbg !1305
  %61 = load i64* %46, align 4, !dbg !1306
  %62 = zext i32 %count_addr.0 to i64, !dbg !1306
  %63 = add nsw i64 %61, %62, !dbg !1306
  store i64 %63, i64* %46, align 4, !dbg !1306
  br label %bb24, !dbg !1307

bb24:                                             ; preds = %bb19, %bb15, %bb14, %entry, %bb21, %bb13, %bb7, %bb4, %bb2
  %.0 = phi i32 [ -1, %bb2 ], [ -1, %bb4 ], [ -1, %bb7 ], [ -1, %bb13 ], [ %count_addr.0, %bb21 ], [ 0, %entry ], [ %r.0, %bb14 ], [ %r.0, %bb15 ], [ 0, %bb19 ]
  ret i32 %.0, !dbg !1308
}

declare i32 @geteuid() nounwind

declare i32 @getgid() nounwind

define i32 @fchmod(i32 %fd, i32 %mode) nounwind {
entry:
  tail call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !514), !dbg !1309
  tail call void @llvm.dbg.value(metadata !{i32 %mode}, i64 0, metadata !515), !dbg !1309
  tail call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !235), !dbg !1310
  %0 = icmp ult i32 %fd, 32, !dbg !1312
  br i1 %0, label %bb.i, label %bb, !dbg !1312

bb.i:                                             ; preds = %entry
  tail call void @llvm.dbg.value(metadata !552, i64 0, metadata !236), !dbg !1313
  %1 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i32 0, i32 0, i32 %fd, i32 1, !dbg !1314
  %2 = load i32* %1, align 4, !dbg !1314
  %3 = and i32 %2, 1
  %toBool.i = icmp eq i32 %3, 0, !dbg !1314
  br i1 %toBool.i, label %bb, label %__get_file.exit, !dbg !1314

__get_file.exit:                                  ; preds = %bb.i
  %4 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i32 0, i32 0, i32 %fd, !dbg !1313
  tail call void @llvm.dbg.value(metadata !{%struct.exe_file_t* %4}, i64 0, metadata !516), !dbg !1311
  %5 = icmp eq %struct.exe_file_t* %4, null, !dbg !1315
  br i1 %5, label %bb, label %bb1, !dbg !1315

bb:                                               ; preds = %entry, %bb.i, %__get_file.exit
  %6 = tail call i32* @__errno_location() nounwind readnone, !dbg !1316
  store i32 9, i32* %6, align 4, !dbg !1316
  br label %bb9, !dbg !1317

bb1:                                              ; preds = %__get_file.exit
  %7 = load i32* @n_calls.4657, align 4, !dbg !1318
  %8 = add nsw i32 %7, 1, !dbg !1318
  store i32 %8, i32* @n_calls.4657, align 4, !dbg !1318
  %9 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i32 0, i32 5), align 4, !dbg !1319
  %10 = icmp eq i32 %9, 0, !dbg !1319
  br i1 %10, label %bb4, label %bb2, !dbg !1319

bb2:                                              ; preds = %bb1
  %11 = load i32** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i32 0, i32 12), align 4, !dbg !1319
  %12 = load i32* %11, align 4, !dbg !1319
  %13 = icmp eq i32 %12, %8, !dbg !1319
  br i1 %13, label %bb3, label %bb4, !dbg !1319

bb3:                                              ; preds = %bb2
  %14 = add i32 %9, -1, !dbg !1320
  store i32 %14, i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i32 0, i32 5), align 4, !dbg !1320
  %15 = tail call i32* @__errno_location() nounwind readnone, !dbg !1321
  store i32 5, i32* %15, align 4, !dbg !1321
  br label %bb9, !dbg !1322

bb4:                                              ; preds = %bb1, %bb2
  %16 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i32 0, i32 0, i32 %fd, i32 3, !dbg !1323
  %17 = load %struct.exe_disk_file_t** %16, align 4, !dbg !1323
  %18 = icmp eq %struct.exe_disk_file_t* %17, null, !dbg !1323
  br i1 %18, label %bb6, label %bb5, !dbg !1323

bb5:                                              ; preds = %bb4
  tail call void @llvm.dbg.value(metadata !{%struct.exe_disk_file_t* %17}, i64 0, metadata !512) nounwind, !dbg !1324
  tail call void @llvm.dbg.value(metadata !{i32 %mode}, i64 0, metadata !513) nounwind, !dbg !1324
  %19 = tail call i32 @geteuid() nounwind, !dbg !1326
  %20 = getelementptr inbounds %struct.exe_disk_file_t* %17, i32 0, i32 2, !dbg !1326
  %21 = load %struct.stat64** %20, align 4, !dbg !1326
  %22 = getelementptr inbounds %struct.stat64* %21, i32 0, i32 5, !dbg !1326
  %23 = load i32* %22, align 4, !dbg !1326
  %24 = icmp eq i32 %19, %23, !dbg !1326
  br i1 %24, label %bb.i11, label %bb3.i, !dbg !1326

bb.i11:                                           ; preds = %bb5
  %25 = tail call i32 @getgid() nounwind, !dbg !1328
  %26 = load %struct.stat64** %20, align 4, !dbg !1328
  %27 = getelementptr inbounds %struct.stat64* %26, i32 0, i32 6, !dbg !1328
  %28 = load i32* %27, align 4, !dbg !1328
  %29 = and i32 %mode, 3071, !dbg !1329
  %30 = icmp eq i32 %25, %28, !dbg !1328
  %mode..i = select i1 %30, i32 %mode, i32 %29
  %31 = getelementptr inbounds %struct.stat64* %26, i32 0, i32 3, !dbg !1330
  %32 = load i32* %31, align 4, !dbg !1330
  %33 = and i32 %32, -4096, !dbg !1330
  %34 = and i32 %mode..i, 4095, !dbg !1330
  %35 = or i32 %34, %33, !dbg !1330
  store i32 %35, i32* %31, align 4, !dbg !1330
  br label %bb9, !dbg !1331

bb3.i:                                            ; preds = %bb5
  %36 = tail call i32* @__errno_location() nounwind readnone, !dbg !1332
  store i32 1, i32* %36, align 4, !dbg !1332
  br label %bb9, !dbg !1333

bb6:                                              ; preds = %bb4
  %37 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i32 0, i32 0, i32 %fd, i32 0, !dbg !1334
  %38 = load i32* %37, align 4, !dbg !1334
  %39 = tail call i32 (i32, ...)* @syscall(i32 94, i32 %38, i32 %mode) nounwind, !dbg !1334
  tail call void @llvm.dbg.value(metadata !{i32 %39}, i64 0, metadata !518), !dbg !1334
  %40 = icmp eq i32 %39, -1, !dbg !1335
  br i1 %40, label %bb7, label %bb9, !dbg !1335

bb7:                                              ; preds = %bb6
  %41 = tail call i32* @__errno_location() nounwind readnone, !dbg !1336
  %42 = tail call i32 @klee_get_errno() nounwind, !dbg !1336
  store i32 %42, i32* %41, align 4, !dbg !1336
  br label %bb9, !dbg !1336

bb9:                                              ; preds = %bb3.i, %bb.i11, %bb6, %bb7, %bb3, %bb
  %.0 = phi i32 [ -1, %bb ], [ -1, %bb3 ], [ -1, %bb7 ], [ %39, %bb6 ], [ 0, %bb.i11 ], [ -1, %bb3.i ]
  ret i32 %.0, !dbg !1317
}

define i32 @chmod(i8* %path, i32 %mode) nounwind {
entry:
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !520), !dbg !1337
  tail call void @llvm.dbg.value(metadata !{i32 %mode}, i64 0, metadata !521), !dbg !1337
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !229), !dbg !1338
  %0 = load i8* %path, align 1, !dbg !1340
  tail call void @llvm.dbg.value(metadata !{i8 %0}, i64 0, metadata !230), !dbg !1340
  %1 = icmp eq i8 %0, 0, !dbg !1341
  br i1 %1, label %__get_sym_file.exit, label %bb.i, !dbg !1341

bb.i:                                             ; preds = %entry
  %2 = getelementptr inbounds i8* %path, i32 1, !dbg !1341
  %3 = load i8* %2, align 1, !dbg !1341
  %4 = icmp eq i8 %3, 0, !dbg !1341
  br i1 %4, label %bb8.preheader.i, label %__get_sym_file.exit, !dbg !1341

bb8.preheader.i:                                  ; preds = %bb.i
  %5 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i32 0, i32 0), align 4, !dbg !1342
  %6 = sext i8 %0 to i32, !dbg !1343
  br label %bb8.i

bb3.i:                                            ; preds = %bb8.i
  %sext.i = shl i32 %18, 24
  %7 = ashr exact i32 %sext.i, 24, !dbg !1343
  %8 = add nsw i32 %7, 65, !dbg !1343
  %9 = icmp eq i32 %6, %8, !dbg !1343
  br i1 %9, label %bb4.i, label %bb7.i, !dbg !1343

bb4.i:                                            ; preds = %bb3.i
  %10 = load %struct.exe_disk_file_t** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i32 0, i32 4), align 4, !dbg !1344
  tail call void @llvm.dbg.value(metadata !552, i64 0, metadata !233), !dbg !1344
  %11 = getelementptr inbounds %struct.exe_disk_file_t* %10, i32 %18, i32 2, !dbg !1345
  %12 = load %struct.stat64** %11, align 4, !dbg !1345
  %13 = getelementptr inbounds %struct.stat64* %12, i32 0, i32 15, !dbg !1345
  %14 = load i64* %13, align 4, !dbg !1345
  %15 = icmp eq i64 %14, 0, !dbg !1345
  br i1 %15, label %__get_sym_file.exit, label %bb6.i, !dbg !1345

bb6.i:                                            ; preds = %bb4.i
  %16 = getelementptr inbounds %struct.exe_disk_file_t* %10, i32 %18, !dbg !1344
  br label %__get_sym_file.exit, !dbg !1346

bb7.i:                                            ; preds = %bb3.i
  %17 = add i32 %18, 1, !dbg !1342
  br label %bb8.i, !dbg !1342

bb8.i:                                            ; preds = %bb7.i, %bb8.preheader.i
  %18 = phi i32 [ %17, %bb7.i ], [ 0, %bb8.preheader.i ]
  %19 = icmp ugt i32 %5, %18, !dbg !1342
  br i1 %19, label %bb3.i, label %__get_sym_file.exit, !dbg !1342

__get_sym_file.exit:                              ; preds = %bb8.i, %entry, %bb.i, %bb4.i, %bb6.i
  %.0.i = phi %struct.exe_disk_file_t* [ %16, %bb6.i ], [ null, %bb.i ], [ null, %entry ], [ null, %bb4.i ], [ null, %bb8.i ]
  tail call void @llvm.dbg.value(metadata !{%struct.exe_disk_file_t* %.0.i}, i64 0, metadata !522), !dbg !1339
  %20 = load i32* @n_calls.4634, align 4, !dbg !1347
  %21 = add nsw i32 %20, 1, !dbg !1347
  store i32 %21, i32* @n_calls.4634, align 4, !dbg !1347
  %22 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i32 0, i32 5), align 4, !dbg !1348
  %23 = icmp eq i32 %22, 0, !dbg !1348
  br i1 %23, label %bb2, label %bb, !dbg !1348

bb:                                               ; preds = %__get_sym_file.exit
  %24 = load i32** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i32 0, i32 11), align 4, !dbg !1348
  %25 = load i32* %24, align 4, !dbg !1348
  %26 = icmp eq i32 %25, %21, !dbg !1348
  br i1 %26, label %bb1, label %bb2, !dbg !1348

bb1:                                              ; preds = %bb
  %27 = add i32 %22, -1, !dbg !1349
  store i32 %27, i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i32 0, i32 5), align 4, !dbg !1349
  %28 = tail call i32* @__errno_location() nounwind readnone, !dbg !1350
  store i32 5, i32* %28, align 4, !dbg !1350
  br label %bb7, !dbg !1351

bb2:                                              ; preds = %__get_sym_file.exit, %bb
  %29 = icmp eq %struct.exe_disk_file_t* %.0.i, null, !dbg !1352
  br i1 %29, label %bb4, label %bb3, !dbg !1352

bb3:                                              ; preds = %bb2
  tail call void @llvm.dbg.value(metadata !{%struct.exe_disk_file_t* %.0.i}, i64 0, metadata !512) nounwind, !dbg !1353
  tail call void @llvm.dbg.value(metadata !{i32 %mode}, i64 0, metadata !513) nounwind, !dbg !1353
  %30 = tail call i32 @geteuid() nounwind, !dbg !1355
  %31 = getelementptr inbounds %struct.exe_disk_file_t* %.0.i, i32 0, i32 2, !dbg !1355
  %32 = load %struct.stat64** %31, align 4, !dbg !1355
  %33 = getelementptr inbounds %struct.stat64* %32, i32 0, i32 5, !dbg !1355
  %34 = load i32* %33, align 4, !dbg !1355
  %35 = icmp eq i32 %30, %34, !dbg !1355
  br i1 %35, label %bb.i13, label %bb3.i14, !dbg !1355

bb.i13:                                           ; preds = %bb3
  %36 = tail call i32 @getgid() nounwind, !dbg !1356
  %37 = load %struct.stat64** %31, align 4, !dbg !1356
  %38 = getelementptr inbounds %struct.stat64* %37, i32 0, i32 6, !dbg !1356
  %39 = load i32* %38, align 4, !dbg !1356
  %40 = and i32 %mode, 3071, !dbg !1357
  %41 = icmp eq i32 %36, %39, !dbg !1356
  %mode..i = select i1 %41, i32 %mode, i32 %40
  %42 = getelementptr inbounds %struct.stat64* %37, i32 0, i32 3, !dbg !1358
  %43 = load i32* %42, align 4, !dbg !1358
  %44 = and i32 %43, -4096, !dbg !1358
  %45 = and i32 %mode..i, 4095, !dbg !1358
  %46 = or i32 %45, %44, !dbg !1358
  store i32 %46, i32* %42, align 4, !dbg !1358
  br label %bb7, !dbg !1359

bb3.i14:                                          ; preds = %bb3
  %47 = tail call i32* @__errno_location() nounwind readnone, !dbg !1360
  store i32 1, i32* %47, align 4, !dbg !1360
  br label %bb7, !dbg !1361

bb4:                                              ; preds = %bb2
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !311) nounwind, !dbg !1362
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !301) nounwind, !dbg !1364
  %48 = ptrtoint i8* %path to i32, !dbg !1366
  %49 = tail call i32 @klee_get_valuel(i32 %48) nounwind, !dbg !1366
  %50 = inttoptr i32 %49 to i8*, !dbg !1366
  tail call void @llvm.dbg.value(metadata !{i8* %50}, i64 0, metadata !302) nounwind, !dbg !1366
  %51 = icmp eq i8* %50, %path, !dbg !1367
  %52 = zext i1 %51 to i32, !dbg !1367
  tail call void @klee_assume(i32 %52) nounwind, !dbg !1367
  tail call void @llvm.dbg.value(metadata !{i8* %50}, i64 0, metadata !312) nounwind, !dbg !1365
  tail call void @llvm.dbg.value(metadata !561, i64 0, metadata !314) nounwind, !dbg !1368
  br label %bb.i9, !dbg !1368

bb.i9:                                            ; preds = %bb6.i11, %bb4
  %sc.0.i = phi i8* [ %50, %bb4 ], [ %sc.1.i, %bb6.i11 ]
  %53 = phi i32 [ 0, %bb4 ], [ %65, %bb6.i11 ]
  %tmp.i = add i32 %53, -1
  %54 = load i8* %sc.0.i, align 1, !dbg !1369
  %55 = and i32 %tmp.i, %53, !dbg !1370
  %56 = icmp eq i32 %55, 0, !dbg !1370
  br i1 %56, label %bb1.i, label %bb5.i, !dbg !1370

bb1.i:                                            ; preds = %bb.i9
  switch i8 %54, label %bb6.i11 [
    i8 0, label %bb2.i
    i8 47, label %bb4.i10
  ]

bb2.i:                                            ; preds = %bb1.i
  tail call void @llvm.dbg.value(metadata !{i8 %54}, i64 0, metadata !315) nounwind, !dbg !1369
  store i8 0, i8* %sc.0.i, align 1, !dbg !1371
  tail call void @llvm.dbg.value(metadata !{null}, i64 0, metadata !312) nounwind, !dbg !1371
  br label %__concretize_string.exit, !dbg !1371

bb4.i10:                                          ; preds = %bb1.i
  store i8 47, i8* %sc.0.i, align 1, !dbg !1372
  %57 = getelementptr inbounds i8* %sc.0.i, i32 1, !dbg !1372
  br label %bb6.i11, !dbg !1372

bb5.i:                                            ; preds = %bb.i9
  %58 = sext i8 %54 to i32, !dbg !1373
  %59 = tail call i32 @klee_get_valuel(i32 %58) nounwind, !dbg !1373
  %60 = trunc i32 %59 to i8, !dbg !1373
  %61 = icmp eq i8 %60, %54, !dbg !1374
  %62 = zext i1 %61 to i32, !dbg !1374
  tail call void @klee_assume(i32 %62) nounwind, !dbg !1374
  store i8 %60, i8* %sc.0.i, align 1, !dbg !1375
  %63 = getelementptr inbounds i8* %sc.0.i, i32 1, !dbg !1375
  %64 = icmp eq i8 %60, 0, !dbg !1376
  br i1 %64, label %__concretize_string.exit, label %bb6.i11, !dbg !1376

bb6.i11:                                          ; preds = %bb5.i, %bb4.i10, %bb1.i
  %sc.1.i = phi i8* [ %57, %bb4.i10 ], [ %63, %bb5.i ], [ %sc.0.i, %bb1.i ]
  %65 = add i32 %53, 1, !dbg !1368
  br label %bb.i9, !dbg !1368

__concretize_string.exit:                         ; preds = %bb5.i, %bb2.i
  %66 = tail call i32 (i32, ...)* @syscall(i32 15, i8* %path, i32 %mode) nounwind, !dbg !1363
  tail call void @llvm.dbg.value(metadata !{i32 %66}, i64 0, metadata !524), !dbg !1363
  %67 = icmp eq i32 %66, -1, !dbg !1377
  br i1 %67, label %bb5, label %bb7, !dbg !1377

bb5:                                              ; preds = %__concretize_string.exit
  %68 = tail call i32* @__errno_location() nounwind readnone, !dbg !1378
  %69 = tail call i32 @klee_get_errno() nounwind, !dbg !1378
  store i32 %69, i32* %68, align 4, !dbg !1378
  br label %bb7, !dbg !1378

bb7:                                              ; preds = %bb3.i14, %bb.i13, %__concretize_string.exit, %bb5, %bb1
  %.0 = phi i32 [ -1, %bb1 ], [ -1, %bb5 ], [ %66, %__concretize_string.exit ], [ 0, %bb.i13 ], [ -1, %bb3.i14 ]
  ret i32 %.0, !dbg !1351
}

define i32 @write(i32 %fd, i8* %buf, i32 %count) nounwind {
entry:
  tail call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !526), !dbg !1379
  tail call void @llvm.dbg.value(metadata !{i8* %buf}, i64 0, metadata !527), !dbg !1379
  tail call void @llvm.dbg.value(metadata !{i32 %count}, i64 0, metadata !528), !dbg !1379
  %0 = load i32* @n_calls.4461, align 4, !dbg !1380
  %1 = add nsw i32 %0, 1, !dbg !1380
  store i32 %1, i32* @n_calls.4461, align 4, !dbg !1380
  tail call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !235), !dbg !1381
  %2 = icmp ult i32 %fd, 32, !dbg !1383
  br i1 %2, label %bb.i, label %bb, !dbg !1383

bb.i:                                             ; preds = %entry
  tail call void @llvm.dbg.value(metadata !552, i64 0, metadata !236), !dbg !1384
  %3 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i32 0, i32 0, i32 %fd, i32 1, !dbg !1385
  %4 = load i32* %3, align 4, !dbg !1385
  %5 = and i32 %4, 1
  %toBool.i = icmp eq i32 %5, 0, !dbg !1385
  br i1 %toBool.i, label %bb, label %__get_file.exit, !dbg !1385

__get_file.exit:                                  ; preds = %bb.i
  %6 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i32 0, i32 0, i32 %fd, !dbg !1384
  tail call void @llvm.dbg.value(metadata !{%struct.exe_file_t* %6}, i64 0, metadata !529), !dbg !1382
  %7 = icmp eq %struct.exe_file_t* %6, null, !dbg !1386
  br i1 %7, label %bb, label %bb1, !dbg !1386

bb:                                               ; preds = %entry, %bb.i, %__get_file.exit
  %8 = tail call i32* @__errno_location() nounwind readnone, !dbg !1387
  store i32 9, i32* %8, align 4, !dbg !1387
  br label %bb28, !dbg !1388

bb1:                                              ; preds = %__get_file.exit
  %9 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i32 0, i32 5), align 4, !dbg !1389
  %10 = icmp eq i32 %9, 0, !dbg !1389
  br i1 %10, label %bb4, label %bb2, !dbg !1389

bb2:                                              ; preds = %bb1
  %11 = load i32** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i32 0, i32 7), align 4, !dbg !1389
  %12 = load i32* %11, align 4, !dbg !1389
  %13 = icmp eq i32 %12, %1, !dbg !1389
  br i1 %13, label %bb3, label %bb4, !dbg !1389

bb3:                                              ; preds = %bb2
  %14 = add i32 %9, -1, !dbg !1390
  store i32 %14, i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i32 0, i32 5), align 4, !dbg !1390
  %15 = tail call i32* @__errno_location() nounwind readnone, !dbg !1391
  store i32 5, i32* %15, align 4, !dbg !1391
  br label %bb28, !dbg !1392

bb4:                                              ; preds = %bb1, %bb2
  %16 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i32 0, i32 0, i32 %fd, i32 3, !dbg !1393
  %17 = load %struct.exe_disk_file_t** %16, align 4, !dbg !1393
  %18 = icmp eq %struct.exe_disk_file_t* %17, null, !dbg !1393
  br i1 %18, label %bb5, label %bb15, !dbg !1393

bb5:                                              ; preds = %bb4
  tail call void @llvm.dbg.value(metadata !{i8* %buf}, i64 0, metadata !301) nounwind, !dbg !1394
  %19 = ptrtoint i8* %buf to i32, !dbg !1396
  %20 = tail call i32 @klee_get_valuel(i32 %19) nounwind, !dbg !1396
  %21 = inttoptr i32 %20 to i8*, !dbg !1396
  tail call void @llvm.dbg.value(metadata !{i8* %21}, i64 0, metadata !302) nounwind, !dbg !1396
  %22 = icmp eq i8* %21, %buf, !dbg !1397
  %23 = zext i1 %22 to i32, !dbg !1397
  tail call void @klee_assume(i32 %23) nounwind, !dbg !1397
  tail call void @llvm.dbg.value(metadata !{i8* %21}, i64 0, metadata !527), !dbg !1395
  tail call void @llvm.dbg.value(metadata !{i32 %count}, i64 0, metadata !304) nounwind, !dbg !1398
  %24 = tail call i32 @klee_get_valuel(i32 %count) nounwind, !dbg !1400
  tail call void @llvm.dbg.value(metadata !{i32 %24}, i64 0, metadata !305) nounwind, !dbg !1400
  %25 = icmp eq i32 %24, %count, !dbg !1401
  %26 = zext i1 %25 to i32, !dbg !1401
  tail call void @klee_assume(i32 %26) nounwind, !dbg !1401
  tail call void @llvm.dbg.value(metadata !{i32 %24}, i64 0, metadata !528), !dbg !1399
  tail call void @klee_check_memory_access(i8* %21, i32 %24) nounwind, !dbg !1402
  %27 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i32 0, i32 0, i32 %fd, i32 0, !dbg !1403
  %28 = load i32* %27, align 4, !dbg !1403
  %29 = add i32 %28, -1, !dbg !1403
  %30 = icmp ult i32 %29, 2, !dbg !1403
  br i1 %30, label %bb6, label %bb7, !dbg !1403

bb6:                                              ; preds = %bb5
  %31 = tail call i32 (i32, ...)* @syscall(i32 4, i32 %28, i8* %21, i32 %24) nounwind, !dbg !1404
  tail call void @llvm.dbg.value(metadata !{i32 %31}, i64 0, metadata !531), !dbg !1404
  br label %bb8, !dbg !1404

bb7:                                              ; preds = %bb5
  %32 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i32 0, i32 0, i32 %fd, i32 2, !dbg !1405
  %33 = load i64* %32, align 4, !dbg !1405
  %34 = tail call i32 (i32, ...)* @syscall(i32 181, i32 %28, i8* %21, i32 %24, i64 %33) nounwind, !dbg !1405
  tail call void @llvm.dbg.value(metadata !{i32 %34}, i64 0, metadata !531), !dbg !1405
  br label %bb8, !dbg !1405

bb8:                                              ; preds = %bb7, %bb6
  %r.0 = phi i32 [ %31, %bb6 ], [ %34, %bb7 ]
  %35 = icmp eq i32 %r.0, -1, !dbg !1406
  br i1 %35, label %bb9, label %bb10, !dbg !1406

bb9:                                              ; preds = %bb8
  %36 = tail call i32* @__errno_location() nounwind readnone, !dbg !1407
  %37 = tail call i32 @klee_get_errno() nounwind, !dbg !1407
  store i32 %37, i32* %36, align 4, !dbg !1407
  br label %bb28, !dbg !1408

bb10:                                             ; preds = %bb8
  %38 = icmp slt i32 %r.0, 0, !dbg !1409
  br i1 %38, label %bb11, label %bb12, !dbg !1409

bb11:                                             ; preds = %bb10
  tail call void @__assert_fail(i8* getelementptr inbounds ([7 x i8]* @.str19, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8]* @.str16, i32 0, i32 0), i32 338, i8* getelementptr inbounds ([6 x i8]* @__PRETTY_FUNCTION__.4464, i32 0, i32 0)) noreturn nounwind, !dbg !1409
  unreachable, !dbg !1409

bb12:                                             ; preds = %bb10
  %39 = load i32* %27, align 4, !dbg !1410
  %40 = add i32 %39, -1, !dbg !1410
  %41 = icmp ugt i32 %40, 1, !dbg !1410
  br i1 %41, label %bb13, label %bb28, !dbg !1410

bb13:                                             ; preds = %bb12
  %42 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i32 0, i32 0, i32 %fd, i32 2, !dbg !1411
  %43 = load i64* %42, align 4, !dbg !1411
  %44 = sext i32 %r.0 to i64, !dbg !1411
  %45 = add nsw i64 %43, %44, !dbg !1411
  store i64 %45, i64* %42, align 4, !dbg !1411
  br label %bb28, !dbg !1411

bb15:                                             ; preds = %bb4
  tail call void @llvm.dbg.value(metadata !561, i64 0, metadata !533), !dbg !1412
  %46 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i32 0, i32 0, i32 %fd, i32 2, !dbg !1413
  %47 = load i64* %46, align 4, !dbg !1413
  %48 = zext i32 %count to i64, !dbg !1413
  %49 = add nsw i64 %47, %48, !dbg !1413
  %50 = getelementptr inbounds %struct.exe_disk_file_t* %17, i32 0, i32 0, !dbg !1413
  %51 = load i32* %50, align 4, !dbg !1413
  %52 = zext i32 %51 to i64, !dbg !1413
  %53 = icmp sgt i64 %49, %52, !dbg !1413
  br i1 %53, label %bb17, label %bb21, !dbg !1413

bb17:                                             ; preds = %bb15
  %54 = load i32* getelementptr inbounds (%struct.exe_sym_env_t* @__exe_env, i32 0, i32 3), align 4, !dbg !1414
  %55 = icmp eq i32 %54, 0, !dbg !1414
  br i1 %55, label %bb19, label %bb18, !dbg !1414

bb18:                                             ; preds = %bb17
  tail call void @__assert_fail(i8* getelementptr inbounds ([2 x i8]* @.str20, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8]* @.str16, i32 0, i32 0), i32 351, i8* getelementptr inbounds ([6 x i8]* @__PRETTY_FUNCTION__.4464, i32 0, i32 0)) noreturn nounwind, !dbg !1415
  unreachable, !dbg !1415

bb19:                                             ; preds = %bb17
  %56 = icmp slt i64 %47, %52, !dbg !1416
  br i1 %56, label %bb20, label %bb23, !dbg !1416

bb20:                                             ; preds = %bb19
  %57 = trunc i64 %47 to i32, !dbg !1417
  %58 = sub i32 %51, %57, !dbg !1417
  tail call void @llvm.dbg.value(metadata !{i32 %58}, i64 0, metadata !533), !dbg !1417
  br label %bb21, !dbg !1417

bb21:                                             ; preds = %bb15, %bb20
  %actual_count.0 = phi i32 [ %58, %bb20 ], [ %count, %bb15 ]
  %59 = icmp eq i32 %actual_count.0, 0, !dbg !1418
  br i1 %59, label %bb23, label %bb22, !dbg !1418

bb22:                                             ; preds = %bb21
  %60 = getelementptr inbounds %struct.exe_disk_file_t* %17, i32 0, i32 1, !dbg !1419
  %61 = load i8** %60, align 4, !dbg !1419
  %62 = trunc i64 %47 to i32, !dbg !1419
  %63 = getelementptr inbounds i8* %61, i32 %62, !dbg !1419
  tail call void @llvm.memcpy.p0i8.p0i8.i32(i8* %63, i8* %buf, i32 %actual_count.0, i32 1, i1 false), !dbg !1419
  br label %bb23, !dbg !1419

bb23:                                             ; preds = %bb19, %bb21, %bb22
  %actual_count.030 = phi i32 [ 0, %bb21 ], [ %actual_count.0, %bb22 ], [ 0, %bb19 ]
  %64 = icmp eq i32 %actual_count.030, %count, !dbg !1420
  br i1 %64, label %bb25, label %bb24, !dbg !1420

bb24:                                             ; preds = %bb23
  %65 = load %struct._IO_FILE** @stderr, align 4, !dbg !1421
  %66 = bitcast %struct._IO_FILE* %65 to i8*, !dbg !1421
  %67 = tail call i32 @fwrite(i8* getelementptr inbounds ([33 x i8]* @.str21, i32 0, i32 0), i32 1, i32 32, i8* %66) nounwind, !dbg !1421
  br label %bb25, !dbg !1421

bb25:                                             ; preds = %bb23, %bb24
  %68 = load %struct.exe_disk_file_t** %16, align 4, !dbg !1422
  %69 = load %struct.exe_disk_file_t** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i32 0, i32 2), align 4, !dbg !1422
  %70 = icmp eq %struct.exe_disk_file_t* %68, %69, !dbg !1422
  br i1 %70, label %bb26, label %bb27, !dbg !1422

bb26:                                             ; preds = %bb25
  %71 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i32 0, i32 3), align 4, !dbg !1423
  %72 = add i32 %71, %actual_count.030, !dbg !1423
  store i32 %72, i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i32 0, i32 3), align 4, !dbg !1423
  br label %bb27, !dbg !1423

bb27:                                             ; preds = %bb25, %bb26
  %73 = load i64* %46, align 4, !dbg !1424
  %74 = add nsw i64 %73, %48, !dbg !1424
  store i64 %74, i64* %46, align 4, !dbg !1424
  br label %bb28, !dbg !1425

bb28:                                             ; preds = %bb12, %bb13, %bb27, %bb9, %bb3, %bb
  %.0 = phi i32 [ -1, %bb ], [ -1, %bb3 ], [ -1, %bb9 ], [ %count, %bb27 ], [ %r.0, %bb13 ], [ %r.0, %bb12 ]
  ret i32 %.0, !dbg !1388
}

declare i32 @fwrite(i8* nocapture, i32, i32, i8* nocapture) nounwind

define i32 @__fd_open(i8* %pathname, i32 %flags, i32 %mode) nounwind {
entry:
  tail call void @llvm.dbg.value(metadata !{i8* %pathname}, i64 0, metadata !535), !dbg !1426
  tail call void @llvm.dbg.value(metadata !{i32 %flags}, i64 0, metadata !536), !dbg !1426
  tail call void @llvm.dbg.value(metadata !{i32 %mode}, i64 0, metadata !537), !dbg !1426
  tail call void @llvm.dbg.value(metadata !561, i64 0, metadata !541), !dbg !1427
  br label %bb2, !dbg !1427

bb:                                               ; preds = %bb2
  %scevgep = getelementptr %struct.exe_sym_env_t* @__exe_env, i32 0, i32 0, i32 %4, i32 1
  %0 = load i32* %scevgep, align 4, !dbg !1428
  %1 = and i32 %0, 1, !dbg !1428
  %2 = icmp eq i32 %1, 0, !dbg !1428
  br i1 %2, label %bb5, label %bb1, !dbg !1428

bb1:                                              ; preds = %bb
  %3 = add nsw i32 %4, 1, !dbg !1427
  br label %bb2, !dbg !1427

bb2:                                              ; preds = %bb1, %entry
  %4 = phi i32 [ 0, %entry ], [ %3, %bb1 ]
  %5 = icmp slt i32 %4, 32, !dbg !1427
  br i1 %5, label %bb, label %bb3, !dbg !1427

bb3:                                              ; preds = %bb2
  %6 = icmp eq i32 %4, 32, !dbg !1429
  br i1 %6, label %bb4, label %bb5, !dbg !1429

bb4:                                              ; preds = %bb3
  %7 = tail call i32* @__errno_location() nounwind readnone, !dbg !1430
  store i32 24, i32* %7, align 4, !dbg !1430
  br label %bb25, !dbg !1431

bb5:                                              ; preds = %bb, %bb3
  %8 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i32 0, i32 0, i32 %4, !dbg !1432
  tail call void @llvm.dbg.value(metadata !{%struct.exe_file_t* %8}, i64 0, metadata !540), !dbg !1432
  %9 = bitcast %struct.exe_file_t* %8 to i8*, !dbg !1433
  tail call void @llvm.memset.p0i8.i32(i8* %9, i8 0, i32 20, i32 4, i1 false), !dbg !1433
  tail call void @llvm.dbg.value(metadata !{i8* %pathname}, i64 0, metadata !229), !dbg !1434
  %10 = load i8* %pathname, align 1, !dbg !1436
  tail call void @llvm.dbg.value(metadata !{i8 %10}, i64 0, metadata !230), !dbg !1436
  %11 = icmp eq i8 %10, 0, !dbg !1437
  br i1 %11, label %bb16, label %bb.i, !dbg !1437

bb.i:                                             ; preds = %bb5
  %12 = getelementptr inbounds i8* %pathname, i32 1, !dbg !1437
  %13 = load i8* %12, align 1, !dbg !1437
  %14 = icmp eq i8 %13, 0, !dbg !1437
  br i1 %14, label %bb8.preheader.i, label %bb16, !dbg !1437

bb8.preheader.i:                                  ; preds = %bb.i
  %15 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i32 0, i32 0), align 4, !dbg !1438
  %16 = sext i8 %10 to i32, !dbg !1439
  br label %bb8.i

bb3.i:                                            ; preds = %bb8.i
  %sext.i = shl i32 %27, 24
  %17 = ashr exact i32 %sext.i, 24, !dbg !1439
  %18 = add nsw i32 %17, 65, !dbg !1439
  %19 = icmp eq i32 %16, %18, !dbg !1439
  br i1 %19, label %bb4.i, label %bb7.i, !dbg !1439

bb4.i:                                            ; preds = %bb3.i
  %20 = load %struct.exe_disk_file_t** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i32 0, i32 4), align 4, !dbg !1440
  tail call void @llvm.dbg.value(metadata !552, i64 0, metadata !233), !dbg !1440
  %21 = getelementptr inbounds %struct.exe_disk_file_t* %20, i32 %27, i32 2, !dbg !1441
  %22 = load %struct.stat64** %21, align 4, !dbg !1441
  %23 = getelementptr inbounds %struct.stat64* %22, i32 0, i32 15, !dbg !1441
  %24 = load i64* %23, align 4, !dbg !1441
  %25 = icmp eq i64 %24, 0, !dbg !1441
  br i1 %25, label %bb16, label %__get_sym_file.exit, !dbg !1441

bb7.i:                                            ; preds = %bb3.i
  %26 = add i32 %27, 1, !dbg !1438
  br label %bb8.i, !dbg !1438

bb8.i:                                            ; preds = %bb7.i, %bb8.preheader.i
  %27 = phi i32 [ %26, %bb7.i ], [ 0, %bb8.preheader.i ]
  %28 = icmp ugt i32 %15, %27, !dbg !1438
  br i1 %28, label %bb3.i, label %bb16, !dbg !1438

__get_sym_file.exit:                              ; preds = %bb4.i
  %29 = getelementptr inbounds %struct.exe_disk_file_t* %20, i32 %27, !dbg !1440
  tail call void @llvm.dbg.value(metadata !{%struct.exe_disk_file_t* %29}, i64 0, metadata !538), !dbg !1435
  %30 = icmp eq %struct.exe_disk_file_t* %29, null, !dbg !1442
  br i1 %30, label %bb16, label %bb6, !dbg !1442

bb6:                                              ; preds = %__get_sym_file.exit
  %31 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i32 0, i32 0, i32 %4, i32 3, !dbg !1443
  store %struct.exe_disk_file_t* %29, %struct.exe_disk_file_t** %31, align 4, !dbg !1443
  %32 = and i32 %flags, 192
  switch i32 %32, label %bb12 [
    i32 192, label %bb8
    i32 128, label %bb11
  ]

bb8:                                              ; preds = %bb6
  %33 = tail call i32* @__errno_location() nounwind readnone, !dbg !1444
  store i32 17, i32* %33, align 4, !dbg !1444
  br label %bb25, !dbg !1445

bb11:                                             ; preds = %bb6
  %34 = load %struct._IO_FILE** @stderr, align 4, !dbg !1446
  %35 = bitcast %struct._IO_FILE* %34 to i8*, !dbg !1446
  %36 = tail call i32 @fwrite(i8* getelementptr inbounds ([47 x i8]* @.str22, i32 0, i32 0), i32 1, i32 46, i8* %35) nounwind, !dbg !1446
  %37 = tail call i32* @__errno_location() nounwind readnone, !dbg !1447
  store i32 13, i32* %37, align 4, !dbg !1447
  br label %bb25, !dbg !1448

bb12:                                             ; preds = %bb6
  %38 = load %struct.stat64** %21, align 4, !dbg !1449
  tail call void @llvm.dbg.value(metadata !{i32 %flags}, i64 0, metadata !242), !dbg !1450
  tail call void @llvm.dbg.value(metadata !{%struct.stat64* %38}, i64 0, metadata !243), !dbg !1450
  %39 = getelementptr inbounds %struct.stat64* %38, i32 0, i32 3, !dbg !1451
  %40 = load i32* %39, align 4, !dbg !1451
  tail call void @llvm.dbg.value(metadata !{i32 %40}, i64 0, metadata !247), !dbg !1451
  %41 = and i32 %flags, 2, !dbg !1452
  %42 = icmp eq i32 %41, 0, !dbg !1452
  %43 = and i32 %flags, 3
  %44 = icmp eq i32 %43, 0
  tail call void @llvm.dbg.value(metadata !561, i64 0, metadata !244), !dbg !1453
  br i1 %42, label %bb9.i, label %bb7.i34, !dbg !1454

bb7.i34:                                          ; preds = %bb12
  %45 = and i32 %40, 292, !dbg !1454
  %46 = icmp eq i32 %45, 0, !dbg !1454
  br i1 %46, label %bb9.i, label %bb13, !dbg !1454

bb9.i:                                            ; preds = %bb7.i34, %bb12
  br i1 %44, label %bb14, label %bb10.i, !dbg !1455

bb10.i:                                           ; preds = %bb9.i
  %47 = and i32 %40, 146, !dbg !1455
  %48 = icmp eq i32 %47, 0, !dbg !1455
  br i1 %48, label %bb13, label %bb14, !dbg !1455

bb13:                                             ; preds = %bb7.i34, %bb10.i
  %49 = tail call i32* @__errno_location() nounwind readnone, !dbg !1456
  store i32 13, i32* %49, align 4, !dbg !1456
  br label %bb25, !dbg !1457

bb14:                                             ; preds = %bb10.i, %bb9.i
  %50 = and i32 %40, -512, !dbg !1458
  %51 = load i32* getelementptr inbounds (%struct.exe_sym_env_t* @__exe_env, i32 0, i32 1), align 4, !dbg !1458
  %not = xor i32 %51, -1, !dbg !1458
  %52 = and i32 %not, %mode, !dbg !1458
  %53 = or i32 %52, %50, !dbg !1458
  store i32 %53, i32* %39, align 4, !dbg !1458
  br label %bb19, !dbg !1458

bb16:                                             ; preds = %bb8.i, %bb4.i, %bb5, %bb.i, %__get_sym_file.exit
  tail call void @llvm.dbg.value(metadata !{i8* %pathname}, i64 0, metadata !311) nounwind, !dbg !1459
  tail call void @llvm.dbg.value(metadata !{i8* %pathname}, i64 0, metadata !301) nounwind, !dbg !1461
  %54 = ptrtoint i8* %pathname to i32, !dbg !1463
  %55 = tail call i32 @klee_get_valuel(i32 %54) nounwind, !dbg !1463
  %56 = inttoptr i32 %55 to i8*, !dbg !1463
  tail call void @llvm.dbg.value(metadata !{i8* %56}, i64 0, metadata !302) nounwind, !dbg !1463
  %57 = icmp eq i8* %56, %pathname, !dbg !1464
  %58 = zext i1 %57 to i32, !dbg !1464
  tail call void @klee_assume(i32 %58) nounwind, !dbg !1464
  tail call void @llvm.dbg.value(metadata !{i8* %56}, i64 0, metadata !312) nounwind, !dbg !1462
  tail call void @llvm.dbg.value(metadata !561, i64 0, metadata !314) nounwind, !dbg !1465
  br label %bb.i30, !dbg !1465

bb.i30:                                           ; preds = %bb6.i32, %bb16
  %sc.0.i = phi i8* [ %56, %bb16 ], [ %sc.1.i, %bb6.i32 ]
  %59 = phi i32 [ 0, %bb16 ], [ %71, %bb6.i32 ]
  %tmp.i = add i32 %59, -1
  %60 = load i8* %sc.0.i, align 1, !dbg !1466
  %61 = and i32 %tmp.i, %59, !dbg !1467
  %62 = icmp eq i32 %61, 0, !dbg !1467
  br i1 %62, label %bb1.i, label %bb5.i, !dbg !1467

bb1.i:                                            ; preds = %bb.i30
  switch i8 %60, label %bb6.i32 [
    i8 0, label %bb2.i
    i8 47, label %bb4.i31
  ]

bb2.i:                                            ; preds = %bb1.i
  tail call void @llvm.dbg.value(metadata !{i8 %60}, i64 0, metadata !315) nounwind, !dbg !1466
  store i8 0, i8* %sc.0.i, align 1, !dbg !1468
  tail call void @llvm.dbg.value(metadata !{null}, i64 0, metadata !312) nounwind, !dbg !1468
  br label %__concretize_string.exit, !dbg !1468

bb4.i31:                                          ; preds = %bb1.i
  store i8 47, i8* %sc.0.i, align 1, !dbg !1469
  %63 = getelementptr inbounds i8* %sc.0.i, i32 1, !dbg !1469
  br label %bb6.i32, !dbg !1469

bb5.i:                                            ; preds = %bb.i30
  %64 = sext i8 %60 to i32, !dbg !1470
  %65 = tail call i32 @klee_get_valuel(i32 %64) nounwind, !dbg !1470
  %66 = trunc i32 %65 to i8, !dbg !1470
  %67 = icmp eq i8 %66, %60, !dbg !1471
  %68 = zext i1 %67 to i32, !dbg !1471
  tail call void @klee_assume(i32 %68) nounwind, !dbg !1471
  store i8 %66, i8* %sc.0.i, align 1, !dbg !1472
  %69 = getelementptr inbounds i8* %sc.0.i, i32 1, !dbg !1472
  %70 = icmp eq i8 %66, 0, !dbg !1473
  br i1 %70, label %__concretize_string.exit, label %bb6.i32, !dbg !1473

bb6.i32:                                          ; preds = %bb5.i, %bb4.i31, %bb1.i
  %sc.1.i = phi i8* [ %63, %bb4.i31 ], [ %69, %bb5.i ], [ %sc.0.i, %bb1.i ]
  %71 = add i32 %59, 1, !dbg !1465
  br label %bb.i30, !dbg !1465

__concretize_string.exit:                         ; preds = %bb5.i, %bb2.i
  %72 = tail call i32 (i32, ...)* @syscall(i32 5, i8* %pathname, i32 %flags, i32 %mode) nounwind, !dbg !1460
  tail call void @llvm.dbg.value(metadata !{i32 %72}, i64 0, metadata !542), !dbg !1460
  %73 = icmp eq i32 %72, -1, !dbg !1474
  br i1 %73, label %bb17, label %bb18, !dbg !1474

bb17:                                             ; preds = %__concretize_string.exit
  %74 = tail call i32* @__errno_location() nounwind readnone, !dbg !1475
  %75 = tail call i32 @klee_get_errno() nounwind, !dbg !1475
  store i32 %75, i32* %74, align 4, !dbg !1475
  br label %bb25, !dbg !1476

bb18:                                             ; preds = %__concretize_string.exit
  %76 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i32 0, i32 0, i32 %4, i32 0, !dbg !1477
  store i32 %72, i32* %76, align 4, !dbg !1477
  %.pre = and i32 %flags, 3, !dbg !1478
  br label %bb19, !dbg !1477

bb19:                                             ; preds = %bb18, %bb14
  %.pre-phi = phi i32 [ %.pre, %bb18 ], [ %43, %bb14 ]
  %77 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i32 0, i32 0, i32 %4, i32 1, !dbg !1479
  store i32 1, i32* %77, align 4, !dbg !1479
  switch i32 %.pre-phi, label %bb23 [
    i32 0, label %bb20
    i32 1, label %bb22
  ]

bb20:                                             ; preds = %bb19
  store i32 5, i32* %77, align 4, !dbg !1480
  br label %bb25, !dbg !1480

bb22:                                             ; preds = %bb19
  store i32 9, i32* %77, align 4, !dbg !1481
  br label %bb25, !dbg !1481

bb23:                                             ; preds = %bb19
  store i32 13, i32* %77, align 4, !dbg !1482
  br label %bb25, !dbg !1482

bb25:                                             ; preds = %bb20, %bb22, %bb23, %bb17, %bb13, %bb11, %bb8, %bb4
  %.0 = phi i32 [ -1, %bb4 ], [ -1, %bb8 ], [ -1, %bb11 ], [ -1, %bb13 ], [ -1, %bb17 ], [ %4, %bb23 ], [ %4, %bb22 ], [ %4, %bb20 ]
  ret i32 %.0, !dbg !1431
}

!llvm.dbg.sp = !{!0, !59, !73, !77, !80, !83, !84, !85, !90, !95, !98, !128, !131, !134, !135, !139, !142, !145, !148, !151, !154, !155, !156, !159, !179, !180, !183, !184, !185, !188, !205, !208, !209, !212, !213, !216, !219, !222, !225, !226}
!llvm.dbg.lv.__get_sym_file = !{!229, !230, !232, !233}
!llvm.dbg.lv.__get_file = !{!235, !236}
!llvm.dbg.lv.umask = !{!239, !240}
!llvm.dbg.lv.has_permission = !{!242, !243, !244, !246, !247}
!llvm.dbg.lv.chroot = !{!248}
!llvm.dbg.lv.unlink = !{!249, !250}
!llvm.dbg.lv.rmdir = !{!252, !253}
!llvm.dbg.lv.__df_chown = !{!255, !256, !257}
!llvm.dbg.lv.readlink = !{!258, !259, !260, !261, !263}
!llvm.dbg.lv.fsync = !{!265, !266, !268}
!llvm.dbg.lv.fstatfs = !{!270, !271, !272, !274}
!llvm.dbg.lv.__fd_ftruncate = !{!276, !277, !278, !280}
!llvm.dbg.gv = !{!282, !283, !284, !285, !286, !287, !288}
!llvm.dbg.lv.fchown = !{!289, !290, !291, !292, !294}
!llvm.dbg.lv.fchdir = !{!296, !297, !299}
!llvm.dbg.lv.__concretize_ptr = !{!301, !302}
!llvm.dbg.lv.__concretize_size = !{!304, !305}
!llvm.dbg.lv.getcwd = !{!307, !308, !309}
!llvm.dbg.lv.__concretize_string = !{!311, !312, !314, !315, !317}
!llvm.dbg.lv.__fd_statfs = !{!319, !320, !321, !323}
!llvm.dbg.lv.lchown = !{!325, !326, !327, !328, !330}
!llvm.dbg.lv.chown = !{!332, !333, !334, !335, !337}
!llvm.dbg.lv.chdir = !{!339, !340, !342}
!llvm.dbg.lv.access = !{!344, !345, !346, !348}
!llvm.dbg.lv.select = !{!350, !351, !352, !353, !354, !355, !357, !358, !359, !360, !361, !362, !363, !364, !365, !367, !369, !370}
!llvm.dbg.lv.close = !{!372, !373, !375}
!llvm.dbg.lv.dup2 = !{!376, !377, !378, !380}
!llvm.dbg.lv.dup = !{!382, !383, !385}
!llvm.dbg.lv.fcntl = !{!387, !388, !389, !391, !394, !395, !397}
!llvm.dbg.lv.ioctl = !{!399, !400, !401, !403, !404, !405, !429, !447, !457, !460}
!llvm.dbg.lv.__fd_getdents = !{!462, !463, !464, !465, !467, !469, !470, !471, !473, !475, !476, !477, !479}
!llvm.dbg.lv.__fd_lseek = !{!481, !482, !483, !484, !486}
!llvm.dbg.lv.__fd_fstat = !{!487, !488, !489, !491}
!llvm.dbg.lv.__fd_lstat = !{!493, !494, !495, !497}
!llvm.dbg.lv.__fd_stat = !{!499, !500, !501, !503}
!llvm.dbg.lv.read = !{!505, !506, !507, !508, !510}
!llvm.dbg.lv.__df_chmod = !{!512, !513}
!llvm.dbg.lv.fchmod = !{!514, !515, !516, !518}
!llvm.dbg.lv.chmod = !{!520, !521, !522, !524}
!llvm.dbg.lv.write = !{!526, !527, !528, !529, !531, !533}
!llvm.dbg.lv.__fd_open = !{!535, !536, !537, !538, !540, !541, !542}

!0 = metadata !{i32 589870, i32 0, metadata !1, metadata !"__get_sym_file", metadata !"__get_sym_file", metadata !"", metadata !1, i32 39, metadata !3, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 true, null} ; [ DW_TAG_subprogram ]
!1 = metadata !{i32 589865, metadata !"fd.c", metadata !"/home/jeffwalt/Desktop/LLVM/workspace/klee/runtime/POSIX/", metadata !2} ; [ DW_TAG_file_type ]
!2 = metadata !{i32 589841, i32 0, i32 1, metadata !"fd.c", metadata !"/home/jeffwalt/Desktop/LLVM/workspace/klee/runtime/POSIX/", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build 2.9)", i1 true, i1 true, metadata !"", i32 0} ; [ DW_TAG_compile_unit ]
!3 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !4, i32 0, null} ; [ DW_TAG_subroutine_type ]
!4 = metadata !{metadata !5, metadata !57}
!5 = metadata !{i32 589839, metadata !1, metadata !"", metadata !1, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !6} ; [ DW_TAG_pointer_type ]
!6 = metadata !{i32 589846, metadata !7, metadata !"exe_disk_file_t", metadata !7, i32 26, i64 0, i64 0, i64 0, i32 0, metadata !8} ; [ DW_TAG_typedef ]
!7 = metadata !{i32 589865, metadata !"fd.h", metadata !"/home/jeffwalt/Desktop/LLVM/workspace/klee/runtime/POSIX/", metadata !2} ; [ DW_TAG_file_type ]
!8 = metadata !{i32 589843, metadata !1, metadata !"", metadata !7, i32 20, i64 96, i64 32, i64 0, i32 0, null, metadata !9, i32 0, null} ; [ DW_TAG_structure_type ]
!9 = metadata !{metadata !10, metadata !12, metadata !15}
!10 = metadata !{i32 589837, metadata !8, metadata !"size", metadata !7, i32 21, i64 32, i64 32, i64 0, i32 0, metadata !11} ; [ DW_TAG_member ]
!11 = metadata !{i32 589860, metadata !1, metadata !"unsigned int", metadata !1, i32 0, i64 32, i64 32, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!12 = metadata !{i32 589837, metadata !8, metadata !"contents", metadata !7, i32 22, i64 32, i64 32, i64 32, i32 0, metadata !13} ; [ DW_TAG_member ]
!13 = metadata !{i32 589839, metadata !1, metadata !"", metadata !1, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !14} ; [ DW_TAG_pointer_type ]
!14 = metadata !{i32 589860, metadata !1, metadata !"char", metadata !1, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ]
!15 = metadata !{i32 589837, metadata !8, metadata !"stat", metadata !7, i32 23, i64 32, i64 32, i64 64, i32 0, metadata !16} ; [ DW_TAG_member ]
!16 = metadata !{i32 589839, metadata !1, metadata !"", metadata !1, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !17} ; [ DW_TAG_pointer_type ]
!17 = metadata !{i32 589843, metadata !1, metadata !"stat64", metadata !7, i32 23, i64 768, i64 32, i64 0, i32 0, null, metadata !18, i32 0, null} ; [ DW_TAG_structure_type ]
!18 = metadata !{metadata !19, metadata !24, metadata !25, metadata !28, metadata !30, metadata !32, metadata !34, metadata !36, metadata !37, metadata !38, metadata !41, metadata !44, metadata !46, metadata !53, metadata !54, metadata !55}
!19 = metadata !{i32 589837, metadata !17, metadata !"st_dev", metadata !20, i32 118, i64 64, i64 64, i64 0, i32 0, metadata !21} ; [ DW_TAG_member ]
!20 = metadata !{i32 589865, metadata !"stat.h", metadata !"/usr/include/bits", metadata !2} ; [ DW_TAG_file_type ]
!21 = metadata !{i32 589846, metadata !22, metadata !"__dev_t", metadata !22, i32 135, i64 0, i64 0, i64 0, i32 0, metadata !23} ; [ DW_TAG_typedef ]
!22 = metadata !{i32 589865, metadata !"types.h", metadata !"/usr/include/bits", metadata !2} ; [ DW_TAG_file_type ]
!23 = metadata !{i32 589860, metadata !1, metadata !"long long unsigned int", metadata !1, i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!24 = metadata !{i32 589837, metadata !17, metadata !"__pad1", metadata !20, i32 124, i64 32, i64 32, i64 64, i32 0, metadata !11} ; [ DW_TAG_member ]
!25 = metadata !{i32 589837, metadata !17, metadata !"__st_ino", metadata !20, i32 125, i64 32, i64 32, i64 96, i32 0, metadata !26} ; [ DW_TAG_member ]
!26 = metadata !{i32 589846, metadata !22, metadata !"__ino_t", metadata !22, i32 138, i64 0, i64 0, i64 0, i32 0, metadata !27} ; [ DW_TAG_typedef ]
!27 = metadata !{i32 589860, metadata !1, metadata !"long unsigned int", metadata !1, i32 0, i64 32, i64 32, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!28 = metadata !{i32 589837, metadata !17, metadata !"st_mode", metadata !20, i32 126, i64 32, i64 32, i64 128, i32 0, metadata !29} ; [ DW_TAG_member ]
!29 = metadata !{i32 589846, metadata !22, metadata !"__mode_t", metadata !22, i32 140, i64 0, i64 0, i64 0, i32 0, metadata !11} ; [ DW_TAG_typedef ]
!30 = metadata !{i32 589837, metadata !17, metadata !"st_nlink", metadata !20, i32 127, i64 32, i64 32, i64 160, i32 0, metadata !31} ; [ DW_TAG_member ]
!31 = metadata !{i32 589846, metadata !22, metadata !"__nlink_t", metadata !22, i32 141, i64 0, i64 0, i64 0, i32 0, metadata !11} ; [ DW_TAG_typedef ]
!32 = metadata !{i32 589837, metadata !17, metadata !"st_uid", metadata !20, i32 129, i64 32, i64 32, i64 192, i32 0, metadata !33} ; [ DW_TAG_member ]
!33 = metadata !{i32 589846, metadata !22, metadata !"__uid_t", metadata !22, i32 136, i64 0, i64 0, i64 0, i32 0, metadata !11} ; [ DW_TAG_typedef ]
!34 = metadata !{i32 589837, metadata !17, metadata !"st_gid", metadata !20, i32 130, i64 32, i64 32, i64 224, i32 0, metadata !35} ; [ DW_TAG_member ]
!35 = metadata !{i32 589846, metadata !22, metadata !"__gid_t", metadata !22, i32 137, i64 0, i64 0, i64 0, i32 0, metadata !11} ; [ DW_TAG_typedef ]
!36 = metadata !{i32 589837, metadata !17, metadata !"st_rdev", metadata !20, i32 136, i64 64, i64 64, i64 256, i32 0, metadata !21} ; [ DW_TAG_member ]
!37 = metadata !{i32 589837, metadata !17, metadata !"__pad2", metadata !20, i32 137, i64 32, i64 32, i64 320, i32 0, metadata !11} ; [ DW_TAG_member ]
!38 = metadata !{i32 589837, metadata !17, metadata !"st_size", metadata !20, i32 138, i64 64, i64 64, i64 352, i32 0, metadata !39} ; [ DW_TAG_member ]
!39 = metadata !{i32 589846, metadata !22, metadata !"__off64_t", metadata !22, i32 143, i64 0, i64 0, i64 0, i32 0, metadata !40} ; [ DW_TAG_typedef ]
!40 = metadata !{i32 589860, metadata !1, metadata !"long long int", metadata !1, i32 0, i64 64, i64 64, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!41 = metadata !{i32 589837, metadata !17, metadata !"st_blksize", metadata !20, i32 140, i64 32, i64 32, i64 416, i32 0, metadata !42} ; [ DW_TAG_member ]
!42 = metadata !{i32 589846, metadata !22, metadata !"__blksize_t", metadata !22, i32 169, i64 0, i64 0, i64 0, i32 0, metadata !43} ; [ DW_TAG_typedef ]
!43 = metadata !{i32 589860, metadata !1, metadata !"long int", metadata !1, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!44 = metadata !{i32 589837, metadata !17, metadata !"st_blocks", metadata !20, i32 141, i64 64, i64 64, i64 448, i32 0, metadata !45} ; [ DW_TAG_member ]
!45 = metadata !{i32 589846, metadata !22, metadata !"__blkcnt64_t", metadata !22, i32 173, i64 0, i64 0, i64 0, i32 0, metadata !40} ; [ DW_TAG_typedef ]
!46 = metadata !{i32 589837, metadata !17, metadata !"st_atim", metadata !20, i32 149, i64 64, i64 32, i64 512, i32 0, metadata !47} ; [ DW_TAG_member ]
!47 = metadata !{i32 589843, metadata !1, metadata !"timespec", metadata !48, i32 121, i64 64, i64 32, i64 0, i32 0, null, metadata !49, i32 0, null} ; [ DW_TAG_structure_type ]
!48 = metadata !{i32 589865, metadata !"time.h", metadata !"/usr/include", metadata !2} ; [ DW_TAG_file_type ]
!49 = metadata !{metadata !50, metadata !52}
!50 = metadata !{i32 589837, metadata !47, metadata !"tv_sec", metadata !48, i32 122, i64 32, i64 32, i64 0, i32 0, metadata !51} ; [ DW_TAG_member ]
!51 = metadata !{i32 589846, metadata !22, metadata !"__time_t", metadata !22, i32 150, i64 0, i64 0, i64 0, i32 0, metadata !43} ; [ DW_TAG_typedef ]
!52 = metadata !{i32 589837, metadata !47, metadata !"tv_nsec", metadata !48, i32 123, i64 32, i64 32, i64 32, i32 0, metadata !43} ; [ DW_TAG_member ]
!53 = metadata !{i32 589837, metadata !17, metadata !"st_mtim", metadata !20, i32 150, i64 64, i64 32, i64 576, i32 0, metadata !47} ; [ DW_TAG_member ]
!54 = metadata !{i32 589837, metadata !17, metadata !"st_ctim", metadata !20, i32 151, i64 64, i64 32, i64 640, i32 0, metadata !47} ; [ DW_TAG_member ]
!55 = metadata !{i32 589837, metadata !17, metadata !"st_ino", metadata !20, i32 166, i64 64, i64 64, i64 704, i32 0, metadata !56} ; [ DW_TAG_member ]
!56 = metadata !{i32 589846, metadata !22, metadata !"__ino64_t", metadata !22, i32 139, i64 0, i64 0, i64 0, i32 0, metadata !23} ; [ DW_TAG_typedef ]
!57 = metadata !{i32 589839, metadata !1, metadata !"", metadata !1, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !58} ; [ DW_TAG_pointer_type ]
!58 = metadata !{i32 589862, metadata !1, metadata !"", metadata !1, i32 0, i64 8, i64 8, i64 0, i32 0, metadata !14} ; [ DW_TAG_const_type ]
!59 = metadata !{i32 589870, i32 0, metadata !1, metadata !"__get_file", metadata !"__get_file", metadata !"", metadata !1, i32 63, metadata !60, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 true, null} ; [ DW_TAG_subprogram ]
!60 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !61, i32 0, null} ; [ DW_TAG_subroutine_type ]
!61 = metadata !{metadata !62, metadata !67}
!62 = metadata !{i32 589839, metadata !1, metadata !"", metadata !1, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !63} ; [ DW_TAG_pointer_type ]
!63 = metadata !{i32 589846, metadata !7, metadata !"exe_file_t", metadata !7, i32 42, i64 0, i64 0, i64 0, i32 0, metadata !64} ; [ DW_TAG_typedef ]
!64 = metadata !{i32 589843, metadata !1, metadata !"", metadata !7, i32 33, i64 160, i64 32, i64 0, i32 0, null, metadata !65, i32 0, null} ; [ DW_TAG_structure_type ]
!65 = metadata !{metadata !66, metadata !68, metadata !69, metadata !72}
!66 = metadata !{i32 589837, metadata !64, metadata !"fd", metadata !7, i32 34, i64 32, i64 32, i64 0, i32 0, metadata !67} ; [ DW_TAG_member ]
!67 = metadata !{i32 589860, metadata !1, metadata !"int", metadata !1, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!68 = metadata !{i32 589837, metadata !64, metadata !"flags", metadata !7, i32 35, i64 32, i64 32, i64 32, i32 0, metadata !11} ; [ DW_TAG_member ]
!69 = metadata !{i32 589837, metadata !64, metadata !"off", metadata !7, i32 38, i64 64, i64 64, i64 64, i32 0, metadata !70} ; [ DW_TAG_member ]
!70 = metadata !{i32 589846, metadata !71, metadata !"off64_t", metadata !71, i32 100, i64 0, i64 0, i64 0, i32 0, metadata !40} ; [ DW_TAG_typedef ]
!71 = metadata !{i32 589865, metadata !"types.h", metadata !"/usr/include/sys", metadata !2} ; [ DW_TAG_file_type ]
!72 = metadata !{i32 589837, metadata !64, metadata !"dfile", metadata !7, i32 39, i64 32, i64 32, i64 128, i32 0, metadata !5} ; [ DW_TAG_member ]
!73 = metadata !{i32 589870, i32 0, metadata !1, metadata !"umask", metadata !"umask", metadata !"umask", metadata !1, i32 88, metadata !74, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32)* @umask} ; [ DW_TAG_subprogram ]
!74 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !75, i32 0, null} ; [ DW_TAG_subroutine_type ]
!75 = metadata !{metadata !76, metadata !76}
!76 = metadata !{i32 589846, metadata !71, metadata !"mode_t", metadata !71, i32 77, i64 0, i64 0, i64 0, i32 0, metadata !11} ; [ DW_TAG_typedef ]
!77 = metadata !{i32 589870, i32 0, metadata !1, metadata !"has_permission", metadata !"has_permission", metadata !"", metadata !1, i32 97, metadata !78, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 true, null} ; [ DW_TAG_subprogram ]
!78 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !79, i32 0, null} ; [ DW_TAG_subroutine_type ]
!79 = metadata !{metadata !67, metadata !67, metadata !16}
!80 = metadata !{i32 589870, i32 0, metadata !1, metadata !"chroot", metadata !"chroot", metadata !"chroot", metadata !1, i32 1294, metadata !81, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*)* @chroot} ; [ DW_TAG_subprogram ]
!81 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !82, i32 0, null} ; [ DW_TAG_subroutine_type ]
!82 = metadata !{metadata !67, metadata !57}
!83 = metadata !{i32 589870, i32 0, metadata !1, metadata !"unlink", metadata !"unlink", metadata !"unlink", metadata !1, i32 1078, metadata !81, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*)* @unlink} ; [ DW_TAG_subprogram ]
!84 = metadata !{i32 589870, i32 0, metadata !1, metadata !"rmdir", metadata !"rmdir", metadata !"rmdir", metadata !1, i32 1060, metadata !81, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*)* @rmdir} ; [ DW_TAG_subprogram ]
!85 = metadata !{i32 589870, i32 0, metadata !1, metadata !"__df_chown", metadata !"__df_chown", metadata !"", metadata !1, i32 569, metadata !86, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 true, null} ; [ DW_TAG_subprogram ]
!86 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !87, i32 0, null} ; [ DW_TAG_subroutine_type ]
!87 = metadata !{metadata !67, metadata !5, metadata !88, metadata !89}
!88 = metadata !{i32 589846, metadata !71, metadata !"uid_t", metadata !71, i32 88, i64 0, i64 0, i64 0, i32 0, metadata !11} ; [ DW_TAG_typedef ]
!89 = metadata !{i32 589846, metadata !71, metadata !"gid_t", metadata !71, i32 72, i64 0, i64 0, i64 0, i32 0, metadata !11} ; [ DW_TAG_typedef ]
!90 = metadata !{i32 589870, i32 0, metadata !1, metadata !"readlink", metadata !"readlink", metadata !"readlink", metadata !1, i32 1099, metadata !91, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i8*, i32)* @readlink} ; [ DW_TAG_subprogram ]
!91 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !92, i32 0, null} ; [ DW_TAG_subroutine_type ]
!92 = metadata !{metadata !93, metadata !57, metadata !13, metadata !94}
!93 = metadata !{i32 589846, metadata !71, metadata !"ssize_t", metadata !71, i32 116, i64 0, i64 0, i64 0, i32 0, metadata !67} ; [ DW_TAG_typedef ]
!94 = metadata !{i32 589846, metadata !71, metadata !"size_t", metadata !71, i32 151, i64 0, i64 0, i64 0, i32 0, metadata !11} ; [ DW_TAG_typedef ]
!95 = metadata !{i32 589870, i32 0, metadata !1, metadata !"fsync", metadata !"fsync", metadata !"fsync", metadata !1, i32 1000, metadata !96, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32)* @fsync} ; [ DW_TAG_subprogram ]
!96 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !97, i32 0, null} ; [ DW_TAG_subroutine_type ]
!97 = metadata !{metadata !67, metadata !67}
!98 = metadata !{i32 589870, i32 0, metadata !1, metadata !"fstatfs", metadata !"fstatfs", metadata !"fstatfs", metadata !1, i32 980, metadata !99, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, %struct.statfs*)* @fstatfs} ; [ DW_TAG_subprogram ]
!99 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !100, i32 0, null} ; [ DW_TAG_subroutine_type ]
!100 = metadata !{metadata !67, metadata !67, metadata !101}
!101 = metadata !{i32 589839, metadata !1, metadata !"", metadata !1, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !102} ; [ DW_TAG_pointer_type ]
!102 = metadata !{i32 589843, metadata !1, metadata !"statfs", metadata !103, i32 26, i64 512, i64 32, i64 0, i32 0, null, metadata !104, i32 0, null} ; [ DW_TAG_structure_type ]
!103 = metadata !{i32 589865, metadata !"statfs.h", metadata !"/usr/include/bits", metadata !2} ; [ DW_TAG_file_type ]
!104 = metadata !{metadata !105, metadata !106, metadata !107, metadata !109, metadata !110, metadata !111, metadata !113, metadata !114, metadata !122, metadata !123, metadata !124}
!105 = metadata !{i32 589837, metadata !102, metadata !"f_type", metadata !103, i32 27, i64 32, i64 32, i64 0, i32 0, metadata !67} ; [ DW_TAG_member ]
!106 = metadata !{i32 589837, metadata !102, metadata !"f_bsize", metadata !103, i32 28, i64 32, i64 32, i64 32, i32 0, metadata !67} ; [ DW_TAG_member ]
!107 = metadata !{i32 589837, metadata !102, metadata !"f_blocks", metadata !103, i32 30, i64 32, i64 32, i64 64, i32 0, metadata !108} ; [ DW_TAG_member ]
!108 = metadata !{i32 589846, metadata !22, metadata !"__fsblkcnt_t", metadata !22, i32 174, i64 0, i64 0, i64 0, i32 0, metadata !27} ; [ DW_TAG_typedef ]
!109 = metadata !{i32 589837, metadata !102, metadata !"f_bfree", metadata !103, i32 31, i64 32, i64 32, i64 96, i32 0, metadata !108} ; [ DW_TAG_member ]
!110 = metadata !{i32 589837, metadata !102, metadata !"f_bavail", metadata !103, i32 32, i64 32, i64 32, i64 128, i32 0, metadata !108} ; [ DW_TAG_member ]
!111 = metadata !{i32 589837, metadata !102, metadata !"f_files", metadata !103, i32 33, i64 32, i64 32, i64 160, i32 0, metadata !112} ; [ DW_TAG_member ]
!112 = metadata !{i32 589846, metadata !22, metadata !"__fsfilcnt_t", metadata !22, i32 178, i64 0, i64 0, i64 0, i32 0, metadata !27} ; [ DW_TAG_typedef ]
!113 = metadata !{i32 589837, metadata !102, metadata !"f_ffree", metadata !103, i32 34, i64 32, i64 32, i64 192, i32 0, metadata !112} ; [ DW_TAG_member ]
!114 = metadata !{i32 589837, metadata !102, metadata !"f_fsid", metadata !103, i32 42, i64 64, i64 32, i64 224, i32 0, metadata !115} ; [ DW_TAG_member ]
!115 = metadata !{i32 589846, metadata !22, metadata !"__fsid_t", metadata !22, i32 145, i64 0, i64 0, i64 0, i32 0, metadata !116} ; [ DW_TAG_typedef ]
!116 = metadata !{i32 589843, metadata !1, metadata !"", metadata !22, i32 144, i64 64, i64 32, i64 0, i32 0, null, metadata !117, i32 0, null} ; [ DW_TAG_structure_type ]
!117 = metadata !{metadata !118}
!118 = metadata !{i32 589837, metadata !116, metadata !"__val", metadata !22, i32 144, i64 64, i64 32, i64 0, i32 0, metadata !119} ; [ DW_TAG_member ]
!119 = metadata !{i32 589825, metadata !1, metadata !"", metadata !1, i32 0, i64 64, i64 32, i64 0, i32 0, metadata !67, metadata !120, i32 0, null} ; [ DW_TAG_array_type ]
!120 = metadata !{metadata !121}
!121 = metadata !{i32 589857, i64 0, i64 1}       ; [ DW_TAG_subrange_type ]
!122 = metadata !{i32 589837, metadata !102, metadata !"f_namelen", metadata !103, i32 43, i64 32, i64 32, i64 288, i32 0, metadata !67} ; [ DW_TAG_member ]
!123 = metadata !{i32 589837, metadata !102, metadata !"f_frsize", metadata !103, i32 44, i64 32, i64 32, i64 320, i32 0, metadata !67} ; [ DW_TAG_member ]
!124 = metadata !{i32 589837, metadata !102, metadata !"f_spare", metadata !103, i32 45, i64 160, i64 32, i64 352, i32 0, metadata !125} ; [ DW_TAG_member ]
!125 = metadata !{i32 589825, metadata !1, metadata !"", metadata !1, i32 0, i64 160, i64 32, i64 0, i32 0, metadata !67, metadata !126, i32 0, null} ; [ DW_TAG_array_type ]
!126 = metadata !{metadata !127}
!127 = metadata !{i32 589857, i64 0, i64 4}       ; [ DW_TAG_subrange_type ]
!128 = metadata !{i32 589870, i32 0, metadata !1, metadata !"__fd_ftruncate", metadata !"__fd_ftruncate", metadata !"__fd_ftruncate", metadata !1, i32 643, metadata !129, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i64)* @__fd_ftruncate} ; [ DW_TAG_subprogram ]
!129 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !130, i32 0, null} ; [ DW_TAG_subroutine_type ]
!130 = metadata !{metadata !67, metadata !67, metadata !70}
!131 = metadata !{i32 589870, i32 0, metadata !1, metadata !"fchown", metadata !"fchown", metadata !"fchown", metadata !1, i32 588, metadata !132, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i32, i32)* @fchown} ; [ DW_TAG_subprogram ]
!132 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !133, i32 0, null} ; [ DW_TAG_subroutine_type ]
!133 = metadata !{metadata !67, metadata !67, metadata !88, metadata !89}
!134 = metadata !{i32 589870, i32 0, metadata !1, metadata !"fchdir", metadata !"fchdir", metadata !"fchdir", metadata !1, i32 486, metadata !96, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32)* @fchdir} ; [ DW_TAG_subprogram ]
!135 = metadata !{i32 589870, i32 0, metadata !1, metadata !"__concretize_ptr", metadata !"__concretize_ptr", metadata !"", metadata !1, i32 1252, metadata !136, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 true, null} ; [ DW_TAG_subprogram ]
!136 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !137, i32 0, null} ; [ DW_TAG_subroutine_type ]
!137 = metadata !{metadata !138, metadata !138}
!138 = metadata !{i32 589839, metadata !1, metadata !"", metadata !1, i32 0, i64 32, i64 32, i64 0, i32 0, null} ; [ DW_TAG_pointer_type ]
!139 = metadata !{i32 589870, i32 0, metadata !1, metadata !"__concretize_size", metadata !"__concretize_size", metadata !"", metadata !1, i32 1259, metadata !140, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 true, null} ; [ DW_TAG_subprogram ]
!140 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !141, i32 0, null} ; [ DW_TAG_subroutine_type ]
!141 = metadata !{metadata !94, metadata !94}
!142 = metadata !{i32 589870, i32 0, metadata !1, metadata !"getcwd", metadata !"getcwd", metadata !"getcwd", metadata !1, i32 1217, metadata !143, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i8* (i8*, i32)* @getcwd} ; [ DW_TAG_subprogram ]
!143 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !144, i32 0, null} ; [ DW_TAG_subroutine_type ]
!144 = metadata !{metadata !13, metadata !13, metadata !94}
!145 = metadata !{i32 589870, i32 0, metadata !1, metadata !"__concretize_string", metadata !"__concretize_string", metadata !"", metadata !1, i32 1265, metadata !146, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 true, null} ; [ DW_TAG_subprogram ]
!146 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !147, i32 0, null} ; [ DW_TAG_subroutine_type ]
!147 = metadata !{metadata !57, metadata !57}
!148 = metadata !{i32 589870, i32 0, metadata !1, metadata !"__fd_statfs", metadata !"__fd_statfs", metadata !"__fd_statfs", metadata !1, i32 963, metadata !149, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, %struct.statfs*)* @__fd_statfs} ; [ DW_TAG_subprogram ]
!149 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !150, i32 0, null} ; [ DW_TAG_subroutine_type ]
!150 = metadata !{metadata !67, metadata !57, metadata !101}
!151 = metadata !{i32 589870, i32 0, metadata !1, metadata !"lchown", metadata !"lchown", metadata !"lchown", metadata !1, i32 606, metadata !152, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i32, i32)* @lchown} ; [ DW_TAG_subprogram ]
!152 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !153, i32 0, null} ; [ DW_TAG_subroutine_type ]
!153 = metadata !{metadata !67, metadata !57, metadata !88, metadata !89}
!154 = metadata !{i32 589870, i32 0, metadata !1, metadata !"chown", metadata !"chown", metadata !"chown", metadata !1, i32 575, metadata !152, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i32, i32)* @chown} ; [ DW_TAG_subprogram ]
!155 = metadata !{i32 589870, i32 0, metadata !1, metadata !"chdir", metadata !"chdir", metadata !"chdir", metadata !1, i32 468, metadata !81, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*)* @chdir} ; [ DW_TAG_subprogram ]
!156 = metadata !{i32 589870, i32 0, metadata !1, metadata !"access", metadata !"access", metadata !"access", metadata !1, i32 73, metadata !157, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i32)* @access} ; [ DW_TAG_subprogram ]
!157 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !158, i32 0, null} ; [ DW_TAG_subroutine_type ]
!158 = metadata !{metadata !67, metadata !57, metadata !67}
!159 = metadata !{i32 589870, i32 0, metadata !1, metadata !"select", metadata !"select", metadata !"select", metadata !1, i32 1132, metadata !160, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, %struct.fd_set*, %struct.fd_set*, %struct.fd_set*, %struct.timespec*)* @select} ; [ DW_TAG_subprogram ]
!160 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !161, i32 0, null} ; [ DW_TAG_subroutine_type ]
!161 = metadata !{metadata !67, metadata !67, metadata !162, metadata !162, metadata !162, metadata !172}
!162 = metadata !{i32 589839, metadata !1, metadata !"", metadata !1, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !163} ; [ DW_TAG_pointer_type ]
!163 = metadata !{i32 589846, metadata !164, metadata !"fd_set", metadata !164, i32 85, i64 0, i64 0, i64 0, i32 0, metadata !165} ; [ DW_TAG_typedef ]
!164 = metadata !{i32 589865, metadata !"select.h", metadata !"/usr/include/sys", metadata !2} ; [ DW_TAG_file_type ]
!165 = metadata !{i32 589843, metadata !1, metadata !"", metadata !164, i32 68, i64 1024, i64 32, i64 0, i32 0, null, metadata !166, i32 0, null} ; [ DW_TAG_structure_type ]
!166 = metadata !{metadata !167}
!167 = metadata !{i32 589837, metadata !165, metadata !"fds_bits", metadata !164, i32 72, i64 1024, i64 32, i64 0, i32 0, metadata !168} ; [ DW_TAG_member ]
!168 = metadata !{i32 589825, metadata !1, metadata !"", metadata !1, i32 0, i64 1024, i64 32, i64 0, i32 0, metadata !169, metadata !170, i32 0, null} ; [ DW_TAG_array_type ]
!169 = metadata !{i32 589846, metadata !164, metadata !"__fd_mask", metadata !164, i32 68, i64 0, i64 0, i64 0, i32 0, metadata !43} ; [ DW_TAG_typedef ]
!170 = metadata !{metadata !171}
!171 = metadata !{i32 589857, i64 0, i64 31}      ; [ DW_TAG_subrange_type ]
!172 = metadata !{i32 589839, metadata !1, metadata !"", metadata !1, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !173} ; [ DW_TAG_pointer_type ]
!173 = metadata !{i32 589843, metadata !1, metadata !"timeval", metadata !174, i32 70, i64 64, i64 32, i64 0, i32 0, null, metadata !175, i32 0, null} ; [ DW_TAG_structure_type ]
!174 = metadata !{i32 589865, metadata !"time.h", metadata !"/usr/include/bits", metadata !2} ; [ DW_TAG_file_type ]
!175 = metadata !{metadata !176, metadata !177}
!176 = metadata !{i32 589837, metadata !173, metadata !"tv_sec", metadata !174, i32 71, i64 32, i64 32, i64 0, i32 0, metadata !51} ; [ DW_TAG_member ]
!177 = metadata !{i32 589837, metadata !173, metadata !"tv_usec", metadata !174, i32 72, i64 32, i64 32, i64 32, i32 0, metadata !178} ; [ DW_TAG_member ]
!178 = metadata !{i32 589846, metadata !22, metadata !"__suseconds_t", metadata !22, i32 153, i64 0, i64 0, i64 0, i32 0, metadata !43} ; [ DW_TAG_typedef ]
!179 = metadata !{i32 589870, i32 0, metadata !1, metadata !"close", metadata !"close", metadata !"close", metadata !1, i32 201, metadata !96, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32)* @close} ; [ DW_TAG_subprogram ]
!180 = metadata !{i32 589870, i32 0, metadata !1, metadata !"dup2", metadata !"dup2", metadata !"dup2", metadata !1, i32 1016, metadata !181, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i32)* @dup2} ; [ DW_TAG_subprogram ]
!181 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !182, i32 0, null} ; [ DW_TAG_subroutine_type ]
!182 = metadata !{metadata !67, metadata !67, metadata !67}
!183 = metadata !{i32 589870, i32 0, metadata !1, metadata !"dup", metadata !"dup", metadata !"dup", metadata !1, i32 1041, metadata !96, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32)* @dup} ; [ DW_TAG_subprogram ]
!184 = metadata !{i32 589870, i32 0, metadata !1, metadata !"fcntl", metadata !"fcntl", metadata !"fcntl", metadata !1, i32 908, metadata !181, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i32, ...)* @fcntl} ; [ DW_TAG_subprogram ]
!185 = metadata !{i32 589870, i32 0, metadata !1, metadata !"ioctl", metadata !"ioctl", metadata !"ioctl", metadata !1, i32 760, metadata !186, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i32, ...)* @ioctl} ; [ DW_TAG_subprogram ]
!186 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !187, i32 0, null} ; [ DW_TAG_subroutine_type ]
!187 = metadata !{metadata !67, metadata !67, metadata !27}
!188 = metadata !{i32 589870, i32 0, metadata !1, metadata !"__fd_getdents", metadata !"__fd_getdents", metadata !"__fd_getdents", metadata !1, i32 676, metadata !189, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, %struct.dirent64*, i32)* @__fd_getdents} ; [ DW_TAG_subprogram ]
!189 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !190, i32 0, null} ; [ DW_TAG_subroutine_type ]
!190 = metadata !{metadata !67, metadata !11, metadata !191, metadata !11}
!191 = metadata !{i32 589839, metadata !1, metadata !"", metadata !1, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !192} ; [ DW_TAG_pointer_type ]
!192 = metadata !{i32 589843, metadata !1, metadata !"dirent64", metadata !193, i32 39, i64 2208, i64 32, i64 0, i32 0, null, metadata !194, i32 0, null} ; [ DW_TAG_structure_type ]
!193 = metadata !{i32 589865, metadata !"dirent.h", metadata !"/usr/include/bits", metadata !2} ; [ DW_TAG_file_type ]
!194 = metadata !{metadata !195, metadata !196, metadata !197, metadata !199, metadata !201}
!195 = metadata !{i32 589837, metadata !192, metadata !"d_ino", metadata !193, i32 40, i64 64, i64 64, i64 0, i32 0, metadata !56} ; [ DW_TAG_member ]
!196 = metadata !{i32 589837, metadata !192, metadata !"d_off", metadata !193, i32 41, i64 64, i64 64, i64 64, i32 0, metadata !39} ; [ DW_TAG_member ]
!197 = metadata !{i32 589837, metadata !192, metadata !"d_reclen", metadata !193, i32 42, i64 16, i64 16, i64 128, i32 0, metadata !198} ; [ DW_TAG_member ]
!198 = metadata !{i32 589860, metadata !1, metadata !"short unsigned int", metadata !1, i32 0, i64 16, i64 16, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!199 = metadata !{i32 589837, metadata !192, metadata !"d_type", metadata !193, i32 43, i64 8, i64 8, i64 144, i32 0, metadata !200} ; [ DW_TAG_member ]
!200 = metadata !{i32 589860, metadata !1, metadata !"unsigned char", metadata !1, i32 0, i64 8, i64 8, i64 0, i32 0, i32 8} ; [ DW_TAG_base_type ]
!201 = metadata !{i32 589837, metadata !192, metadata !"d_name", metadata !193, i32 44, i64 2048, i64 8, i64 152, i32 0, metadata !202} ; [ DW_TAG_member ]
!202 = metadata !{i32 589825, metadata !1, metadata !"", metadata !1, i32 0, i64 2048, i64 8, i64 0, i32 0, metadata !14, metadata !203, i32 0, null} ; [ DW_TAG_array_type ]
!203 = metadata !{metadata !204}
!204 = metadata !{i32 589857, i64 0, i64 255}     ; [ DW_TAG_subrange_type ]
!205 = metadata !{i32 589870, i32 0, metadata !1, metadata !"__fd_lseek", metadata !"__fd_lseek", metadata !"__fd_lseek", metadata !1, i32 373, metadata !206, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i64 (i32, i64, i32)* @__fd_lseek} ; [ DW_TAG_subprogram ]
!206 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !207, i32 0, null} ; [ DW_TAG_subroutine_type ]
!207 = metadata !{metadata !70, metadata !67, metadata !70, metadata !67}
!208 = metadata !{i32 589870, i32 0, metadata !1, metadata !"__fd_fstat", metadata !"__fd_fstat", metadata !"__fd_fstat", metadata !1, i32 620, metadata !78, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, %struct.stat64*)* @__fd_fstat} ; [ DW_TAG_subprogram ]
!209 = metadata !{i32 589870, i32 0, metadata !1, metadata !"__fd_lstat", metadata !"__fd_lstat", metadata !"__fd_lstat", metadata !1, i32 449, metadata !210, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, %struct.stat64*)* @__fd_lstat} ; [ DW_TAG_subprogram ]
!210 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !211, i32 0, null} ; [ DW_TAG_subroutine_type ]
!211 = metadata !{metadata !67, metadata !57, metadata !16}
!212 = metadata !{i32 589870, i32 0, metadata !1, metadata !"__fd_stat", metadata !"__fd_stat", metadata !"__fd_stat", metadata !1, i32 430, metadata !210, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, %struct.stat64*)* @__fd_stat} ; [ DW_TAG_subprogram ]
!213 = metadata !{i32 589870, i32 0, metadata !1, metadata !"read", metadata !"read", metadata !"read", metadata !1, i32 233, metadata !214, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i8*, i32)* @read} ; [ DW_TAG_subprogram ]
!214 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !215, i32 0, null} ; [ DW_TAG_subroutine_type ]
!215 = metadata !{metadata !93, metadata !67, metadata !138, metadata !94}
!216 = metadata !{i32 589870, i32 0, metadata !1, metadata !"__df_chmod", metadata !"__df_chmod", metadata !"", metadata !1, i32 507, metadata !217, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 true, null} ; [ DW_TAG_subprogram ]
!217 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !218, i32 0, null} ; [ DW_TAG_subroutine_type ]
!218 = metadata !{metadata !67, metadata !5, metadata !76}
!219 = metadata !{i32 589870, i32 0, metadata !1, metadata !"fchmod", metadata !"fchmod", metadata !"fchmod", metadata !1, i32 542, metadata !220, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i32)* @fchmod} ; [ DW_TAG_subprogram ]
!220 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !221, i32 0, null} ; [ DW_TAG_subroutine_type ]
!221 = metadata !{metadata !67, metadata !67, metadata !76}
!222 = metadata !{i32 589870, i32 0, metadata !1, metadata !"chmod", metadata !"chmod", metadata !"chmod", metadata !1, i32 520, metadata !223, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i32)* @chmod} ; [ DW_TAG_subprogram ]
!223 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !224, i32 0, null} ; [ DW_TAG_subroutine_type ]
!224 = metadata !{metadata !67, metadata !57, metadata !76}
!225 = metadata !{i32 589870, i32 0, metadata !1, metadata !"write", metadata !"write", metadata !"write", metadata !1, i32 301, metadata !214, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i8*, i32)* @write} ; [ DW_TAG_subprogram ]
!226 = metadata !{i32 589870, i32 0, metadata !1, metadata !"__fd_open", metadata !"__fd_open", metadata !"__fd_open", metadata !1, i32 128, metadata !227, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i32, i32)* @__fd_open} ; [ DW_TAG_subprogram ]
!227 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !228, i32 0, null} ; [ DW_TAG_subroutine_type ]
!228 = metadata !{metadata !67, metadata !57, metadata !67, metadata !76}
!229 = metadata !{i32 590081, metadata !0, metadata !"pathname", metadata !1, i32 39, metadata !57, i32 0} ; [ DW_TAG_arg_variable ]
!230 = metadata !{i32 590080, metadata !231, metadata !"c", metadata !1, i32 40, metadata !14, i32 0} ; [ DW_TAG_auto_variable ]
!231 = metadata !{i32 589835, metadata !0, i32 39, i32 0, metadata !1, i32 0} ; [ DW_TAG_lexical_block ]
!232 = metadata !{i32 590080, metadata !231, metadata !"i", metadata !1, i32 41, metadata !11, i32 0} ; [ DW_TAG_auto_variable ]
!233 = metadata !{i32 590080, metadata !234, metadata !"df", metadata !1, i32 48, metadata !5, i32 0} ; [ DW_TAG_auto_variable ]
!234 = metadata !{i32 589835, metadata !231, i32 48, i32 0, metadata !1, i32 1} ; [ DW_TAG_lexical_block ]
!235 = metadata !{i32 590081, metadata !59, metadata !"fd", metadata !1, i32 63, metadata !67, i32 0} ; [ DW_TAG_arg_variable ]
!236 = metadata !{i32 590080, metadata !237, metadata !"f", metadata !1, i32 65, metadata !62, i32 0} ; [ DW_TAG_auto_variable ]
!237 = metadata !{i32 589835, metadata !238, i32 63, i32 0, metadata !1, i32 3} ; [ DW_TAG_lexical_block ]
!238 = metadata !{i32 589835, metadata !59, i32 63, i32 0, metadata !1, i32 2} ; [ DW_TAG_lexical_block ]
!239 = metadata !{i32 590081, metadata !73, metadata !"mask", metadata !1, i32 88, metadata !76, i32 0} ; [ DW_TAG_arg_variable ]
!240 = metadata !{i32 590080, metadata !241, metadata !"r", metadata !1, i32 89, metadata !76, i32 0} ; [ DW_TAG_auto_variable ]
!241 = metadata !{i32 589835, metadata !73, i32 88, i32 0, metadata !1, i32 4} ; [ DW_TAG_lexical_block ]
!242 = metadata !{i32 590081, metadata !77, metadata !"flags", metadata !1, i32 97, metadata !67, i32 0} ; [ DW_TAG_arg_variable ]
!243 = metadata !{i32 590081, metadata !77, metadata !"s", metadata !1, i32 97, metadata !16, i32 0} ; [ DW_TAG_arg_variable ]
!244 = metadata !{i32 590080, metadata !245, metadata !"write_access", metadata !1, i32 98, metadata !67, i32 0} ; [ DW_TAG_auto_variable ]
!245 = metadata !{i32 589835, metadata !77, i32 97, i32 0, metadata !1, i32 5} ; [ DW_TAG_lexical_block ]
!246 = metadata !{i32 590080, metadata !245, metadata !"read_access", metadata !1, i32 98, metadata !67, i32 0} ; [ DW_TAG_auto_variable ]
!247 = metadata !{i32 590080, metadata !245, metadata !"mode", metadata !1, i32 99, metadata !76, i32 0} ; [ DW_TAG_auto_variable ]
!248 = metadata !{i32 590081, metadata !80, metadata !"path", metadata !1, i32 1294, metadata !57, i32 0} ; [ DW_TAG_arg_variable ]
!249 = metadata !{i32 590081, metadata !83, metadata !"pathname", metadata !1, i32 1078, metadata !57, i32 0} ; [ DW_TAG_arg_variable ]
!250 = metadata !{i32 590080, metadata !251, metadata !"dfile", metadata !1, i32 1079, metadata !5, i32 0} ; [ DW_TAG_auto_variable ]
!251 = metadata !{i32 589835, metadata !83, i32 1078, i32 0, metadata !1, i32 7} ; [ DW_TAG_lexical_block ]
!252 = metadata !{i32 590081, metadata !84, metadata !"pathname", metadata !1, i32 1060, metadata !57, i32 0} ; [ DW_TAG_arg_variable ]
!253 = metadata !{i32 590080, metadata !254, metadata !"dfile", metadata !1, i32 1061, metadata !5, i32 0} ; [ DW_TAG_auto_variable ]
!254 = metadata !{i32 589835, metadata !84, i32 1060, i32 0, metadata !1, i32 8} ; [ DW_TAG_lexical_block ]
!255 = metadata !{i32 590081, metadata !85, metadata !"df", metadata !1, i32 569, metadata !5, i32 0} ; [ DW_TAG_arg_variable ]
!256 = metadata !{i32 590081, metadata !85, metadata !"owner", metadata !1, i32 569, metadata !88, i32 0} ; [ DW_TAG_arg_variable ]
!257 = metadata !{i32 590081, metadata !85, metadata !"group", metadata !1, i32 569, metadata !89, i32 0} ; [ DW_TAG_arg_variable ]
!258 = metadata !{i32 590081, metadata !90, metadata !"path", metadata !1, i32 1099, metadata !57, i32 0} ; [ DW_TAG_arg_variable ]
!259 = metadata !{i32 590081, metadata !90, metadata !"buf", metadata !1, i32 1099, metadata !13, i32 0} ; [ DW_TAG_arg_variable ]
!260 = metadata !{i32 590081, metadata !90, metadata !"bufsize", metadata !1, i32 1099, metadata !94, i32 0} ; [ DW_TAG_arg_variable ]
!261 = metadata !{i32 590080, metadata !262, metadata !"dfile", metadata !1, i32 1100, metadata !5, i32 0} ; [ DW_TAG_auto_variable ]
!262 = metadata !{i32 589835, metadata !90, i32 1099, i32 0, metadata !1, i32 10} ; [ DW_TAG_lexical_block ]
!263 = metadata !{i32 590080, metadata !264, metadata !"r", metadata !1, i32 1116, metadata !67, i32 0} ; [ DW_TAG_auto_variable ]
!264 = metadata !{i32 589835, metadata !262, i32 1116, i32 0, metadata !1, i32 11} ; [ DW_TAG_lexical_block ]
!265 = metadata !{i32 590081, metadata !95, metadata !"fd", metadata !1, i32 1000, metadata !67, i32 0} ; [ DW_TAG_arg_variable ]
!266 = metadata !{i32 590080, metadata !267, metadata !"f", metadata !1, i32 1001, metadata !62, i32 0} ; [ DW_TAG_auto_variable ]
!267 = metadata !{i32 589835, metadata !95, i32 1000, i32 0, metadata !1, i32 12} ; [ DW_TAG_lexical_block ]
!268 = metadata !{i32 590080, metadata !269, metadata !"r", metadata !1, i32 1009, metadata !67, i32 0} ; [ DW_TAG_auto_variable ]
!269 = metadata !{i32 589835, metadata !267, i32 1009, i32 0, metadata !1, i32 13} ; [ DW_TAG_lexical_block ]
!270 = metadata !{i32 590081, metadata !98, metadata !"fd", metadata !1, i32 980, metadata !67, i32 0} ; [ DW_TAG_arg_variable ]
!271 = metadata !{i32 590081, metadata !98, metadata !"buf", metadata !1, i32 980, metadata !101, i32 0} ; [ DW_TAG_arg_variable ]
!272 = metadata !{i32 590080, metadata !273, metadata !"f", metadata !1, i32 981, metadata !62, i32 0} ; [ DW_TAG_auto_variable ]
!273 = metadata !{i32 589835, metadata !98, i32 980, i32 0, metadata !1, i32 14} ; [ DW_TAG_lexical_block ]
!274 = metadata !{i32 590080, metadata !275, metadata !"r", metadata !1, i32 993, metadata !67, i32 0} ; [ DW_TAG_auto_variable ]
!275 = metadata !{i32 589835, metadata !273, i32 993, i32 0, metadata !1, i32 15} ; [ DW_TAG_lexical_block ]
!276 = metadata !{i32 590081, metadata !128, metadata !"fd", metadata !1, i32 643, metadata !67, i32 0} ; [ DW_TAG_arg_variable ]
!277 = metadata !{i32 590081, metadata !128, metadata !"length", metadata !1, i32 643, metadata !70, i32 0} ; [ DW_TAG_arg_variable ]
!278 = metadata !{i32 590080, metadata !279, metadata !"f", metadata !1, i32 645, metadata !62, i32 0} ; [ DW_TAG_auto_variable ]
!279 = metadata !{i32 589835, metadata !128, i32 643, i32 0, metadata !1, i32 16} ; [ DW_TAG_lexical_block ]
!280 = metadata !{i32 590080, metadata !281, metadata !"r", metadata !1, i32 668, metadata !67, i32 0} ; [ DW_TAG_auto_variable ]
!281 = metadata !{i32 589835, metadata !279, i32 668, i32 0, metadata !1, i32 17} ; [ DW_TAG_lexical_block ]
!282 = metadata !{i32 589876, i32 0, metadata !128, metadata !"n_calls", metadata !"n_calls", metadata !"", metadata !1, i32 644, metadata !67, i1 true, i1 true, i32* @n_calls.4750} ; [ DW_TAG_variable ]
!283 = metadata !{i32 589876, i32 0, metadata !142, metadata !"n_calls", metadata !"n_calls", metadata !"", metadata !1, i32 1218, metadata !67, i1 true, i1 true, i32* @n_calls.5268} ; [ DW_TAG_variable ]
!284 = metadata !{i32 589876, i32 0, metadata !179, metadata !"n_calls", metadata !"n_calls", metadata !"", metadata !1, i32 202, metadata !67, i1 true, i1 true, i32* @n_calls.4382} ; [ DW_TAG_variable ]
!285 = metadata !{i32 589876, i32 0, metadata !213, metadata !"n_calls", metadata !"n_calls", metadata !"", metadata !1, i32 234, metadata !67, i1 true, i1 true, i32* @n_calls.4402} ; [ DW_TAG_variable ]
!286 = metadata !{i32 589876, i32 0, metadata !219, metadata !"n_calls", metadata !"n_calls", metadata !"", metadata !1, i32 543, metadata !67, i1 true, i1 true, i32* @n_calls.4657} ; [ DW_TAG_variable ]
!287 = metadata !{i32 589876, i32 0, metadata !222, metadata !"n_calls", metadata !"n_calls", metadata !"", metadata !1, i32 521, metadata !67, i1 true, i1 true, i32* @n_calls.4634} ; [ DW_TAG_variable ]
!288 = metadata !{i32 589876, i32 0, metadata !225, metadata !"n_calls", metadata !"n_calls", metadata !"", metadata !1, i32 302, metadata !67, i1 true, i1 true, i32* @n_calls.4461} ; [ DW_TAG_variable ]
!289 = metadata !{i32 590081, metadata !131, metadata !"fd", metadata !1, i32 588, metadata !67, i32 0} ; [ DW_TAG_arg_variable ]
!290 = metadata !{i32 590081, metadata !131, metadata !"owner", metadata !1, i32 588, metadata !88, i32 0} ; [ DW_TAG_arg_variable ]
!291 = metadata !{i32 590081, metadata !131, metadata !"group", metadata !1, i32 588, metadata !89, i32 0} ; [ DW_TAG_arg_variable ]
!292 = metadata !{i32 590080, metadata !293, metadata !"f", metadata !1, i32 589, metadata !62, i32 0} ; [ DW_TAG_auto_variable ]
!293 = metadata !{i32 589835, metadata !131, i32 588, i32 0, metadata !1, i32 18} ; [ DW_TAG_lexical_block ]
!294 = metadata !{i32 590080, metadata !295, metadata !"r", metadata !1, i32 599, metadata !67, i32 0} ; [ DW_TAG_auto_variable ]
!295 = metadata !{i32 589835, metadata !293, i32 599, i32 0, metadata !1, i32 19} ; [ DW_TAG_lexical_block ]
!296 = metadata !{i32 590081, metadata !134, metadata !"fd", metadata !1, i32 486, metadata !67, i32 0} ; [ DW_TAG_arg_variable ]
!297 = metadata !{i32 590080, metadata !298, metadata !"f", metadata !1, i32 487, metadata !62, i32 0} ; [ DW_TAG_auto_variable ]
!298 = metadata !{i32 589835, metadata !134, i32 486, i32 0, metadata !1, i32 20} ; [ DW_TAG_lexical_block ]
!299 = metadata !{i32 590080, metadata !300, metadata !"r", metadata !1, i32 499, metadata !67, i32 0} ; [ DW_TAG_auto_variable ]
!300 = metadata !{i32 589835, metadata !298, i32 499, i32 0, metadata !1, i32 21} ; [ DW_TAG_lexical_block ]
!301 = metadata !{i32 590081, metadata !135, metadata !"p", metadata !1, i32 1252, metadata !138, i32 0} ; [ DW_TAG_arg_variable ]
!302 = metadata !{i32 590080, metadata !303, metadata !"pc", metadata !1, i32 1254, metadata !13, i32 0} ; [ DW_TAG_auto_variable ]
!303 = metadata !{i32 589835, metadata !135, i32 1252, i32 0, metadata !1, i32 22} ; [ DW_TAG_lexical_block ]
!304 = metadata !{i32 590081, metadata !139, metadata !"s", metadata !1, i32 1259, metadata !94, i32 0} ; [ DW_TAG_arg_variable ]
!305 = metadata !{i32 590080, metadata !306, metadata !"sc", metadata !1, i32 1260, metadata !94, i32 0} ; [ DW_TAG_auto_variable ]
!306 = metadata !{i32 589835, metadata !139, i32 1259, i32 0, metadata !1, i32 23} ; [ DW_TAG_lexical_block ]
!307 = metadata !{i32 590081, metadata !142, metadata !"buf", metadata !1, i32 1217, metadata !13, i32 0} ; [ DW_TAG_arg_variable ]
!308 = metadata !{i32 590081, metadata !142, metadata !"size", metadata !1, i32 1217, metadata !94, i32 0} ; [ DW_TAG_arg_variable ]
!309 = metadata !{i32 590080, metadata !310, metadata !"r", metadata !1, i32 1219, metadata !67, i32 0} ; [ DW_TAG_auto_variable ]
!310 = metadata !{i32 589835, metadata !142, i32 1217, i32 0, metadata !1, i32 24} ; [ DW_TAG_lexical_block ]
!311 = metadata !{i32 590081, metadata !145, metadata !"s", metadata !1, i32 1265, metadata !57, i32 0} ; [ DW_TAG_arg_variable ]
!312 = metadata !{i32 590080, metadata !313, metadata !"sc", metadata !1, i32 1266, metadata !13, i32 0} ; [ DW_TAG_auto_variable ]
!313 = metadata !{i32 589835, metadata !145, i32 1265, i32 0, metadata !1, i32 25} ; [ DW_TAG_lexical_block ]
!314 = metadata !{i32 590080, metadata !313, metadata !"i", metadata !1, i32 1267, metadata !11, i32 0} ; [ DW_TAG_auto_variable ]
!315 = metadata !{i32 590080, metadata !316, metadata !"c", metadata !1, i32 1270, metadata !14, i32 0} ; [ DW_TAG_auto_variable ]
!316 = metadata !{i32 589835, metadata !313, i32 1270, i32 0, metadata !1, i32 26} ; [ DW_TAG_lexical_block ]
!317 = metadata !{i32 590080, metadata !318, metadata !"cc", metadata !1, i32 1279, metadata !14, i32 0} ; [ DW_TAG_auto_variable ]
!318 = metadata !{i32 589835, metadata !316, i32 1279, i32 0, metadata !1, i32 27} ; [ DW_TAG_lexical_block ]
!319 = metadata !{i32 590081, metadata !148, metadata !"path", metadata !1, i32 963, metadata !57, i32 0} ; [ DW_TAG_arg_variable ]
!320 = metadata !{i32 590081, metadata !148, metadata !"buf", metadata !1, i32 963, metadata !101, i32 0} ; [ DW_TAG_arg_variable ]
!321 = metadata !{i32 590080, metadata !322, metadata !"dfile", metadata !1, i32 964, metadata !5, i32 0} ; [ DW_TAG_auto_variable ]
!322 = metadata !{i32 589835, metadata !148, i32 963, i32 0, metadata !1, i32 28} ; [ DW_TAG_lexical_block ]
!323 = metadata !{i32 590080, metadata !324, metadata !"r", metadata !1, i32 973, metadata !67, i32 0} ; [ DW_TAG_auto_variable ]
!324 = metadata !{i32 589835, metadata !322, i32 973, i32 0, metadata !1, i32 29} ; [ DW_TAG_lexical_block ]
!325 = metadata !{i32 590081, metadata !151, metadata !"path", metadata !1, i32 606, metadata !57, i32 0} ; [ DW_TAG_arg_variable ]
!326 = metadata !{i32 590081, metadata !151, metadata !"owner", metadata !1, i32 606, metadata !88, i32 0} ; [ DW_TAG_arg_variable ]
!327 = metadata !{i32 590081, metadata !151, metadata !"group", metadata !1, i32 606, metadata !89, i32 0} ; [ DW_TAG_arg_variable ]
!328 = metadata !{i32 590080, metadata !329, metadata !"df", metadata !1, i32 608, metadata !5, i32 0} ; [ DW_TAG_auto_variable ]
!329 = metadata !{i32 589835, metadata !151, i32 606, i32 0, metadata !1, i32 30} ; [ DW_TAG_lexical_block ]
!330 = metadata !{i32 590080, metadata !331, metadata !"r", metadata !1, i32 613, metadata !67, i32 0} ; [ DW_TAG_auto_variable ]
!331 = metadata !{i32 589835, metadata !329, i32 613, i32 0, metadata !1, i32 31} ; [ DW_TAG_lexical_block ]
!332 = metadata !{i32 590081, metadata !154, metadata !"path", metadata !1, i32 575, metadata !57, i32 0} ; [ DW_TAG_arg_variable ]
!333 = metadata !{i32 590081, metadata !154, metadata !"owner", metadata !1, i32 575, metadata !88, i32 0} ; [ DW_TAG_arg_variable ]
!334 = metadata !{i32 590081, metadata !154, metadata !"group", metadata !1, i32 575, metadata !89, i32 0} ; [ DW_TAG_arg_variable ]
!335 = metadata !{i32 590080, metadata !336, metadata !"df", metadata !1, i32 576, metadata !5, i32 0} ; [ DW_TAG_auto_variable ]
!336 = metadata !{i32 589835, metadata !154, i32 575, i32 0, metadata !1, i32 32} ; [ DW_TAG_lexical_block ]
!337 = metadata !{i32 590080, metadata !338, metadata !"r", metadata !1, i32 581, metadata !67, i32 0} ; [ DW_TAG_auto_variable ]
!338 = metadata !{i32 589835, metadata !336, i32 581, i32 0, metadata !1, i32 33} ; [ DW_TAG_lexical_block ]
!339 = metadata !{i32 590081, metadata !155, metadata !"path", metadata !1, i32 468, metadata !57, i32 0} ; [ DW_TAG_arg_variable ]
!340 = metadata !{i32 590080, metadata !341, metadata !"dfile", metadata !1, i32 469, metadata !5, i32 0} ; [ DW_TAG_auto_variable ]
!341 = metadata !{i32 589835, metadata !155, i32 468, i32 0, metadata !1, i32 34} ; [ DW_TAG_lexical_block ]
!342 = metadata !{i32 590080, metadata !343, metadata !"r", metadata !1, i32 479, metadata !67, i32 0} ; [ DW_TAG_auto_variable ]
!343 = metadata !{i32 589835, metadata !341, i32 479, i32 0, metadata !1, i32 35} ; [ DW_TAG_lexical_block ]
!344 = metadata !{i32 590081, metadata !156, metadata !"pathname", metadata !1, i32 73, metadata !57, i32 0} ; [ DW_TAG_arg_variable ]
!345 = metadata !{i32 590081, metadata !156, metadata !"mode", metadata !1, i32 73, metadata !67, i32 0} ; [ DW_TAG_arg_variable ]
!346 = metadata !{i32 590080, metadata !347, metadata !"dfile", metadata !1, i32 74, metadata !5, i32 0} ; [ DW_TAG_auto_variable ]
!347 = metadata !{i32 589835, metadata !156, i32 73, i32 0, metadata !1, i32 36} ; [ DW_TAG_lexical_block ]
!348 = metadata !{i32 590080, metadata !349, metadata !"r", metadata !1, i32 81, metadata !67, i32 0} ; [ DW_TAG_auto_variable ]
!349 = metadata !{i32 589835, metadata !347, i32 81, i32 0, metadata !1, i32 37} ; [ DW_TAG_lexical_block ]
!350 = metadata !{i32 590081, metadata !159, metadata !"nfds", metadata !1, i32 1131, metadata !67, i32 0} ; [ DW_TAG_arg_variable ]
!351 = metadata !{i32 590081, metadata !159, metadata !"read", metadata !1, i32 1131, metadata !162, i32 0} ; [ DW_TAG_arg_variable ]
!352 = metadata !{i32 590081, metadata !159, metadata !"write", metadata !1, i32 1131, metadata !162, i32 0} ; [ DW_TAG_arg_variable ]
!353 = metadata !{i32 590081, metadata !159, metadata !"except", metadata !1, i32 1132, metadata !162, i32 0} ; [ DW_TAG_arg_variable ]
!354 = metadata !{i32 590081, metadata !159, metadata !"timeout", metadata !1, i32 1132, metadata !172, i32 0} ; [ DW_TAG_arg_variable ]
!355 = metadata !{i32 590080, metadata !356, metadata !"in_read", metadata !1, i32 1133, metadata !163, i32 0} ; [ DW_TAG_auto_variable ]
!356 = metadata !{i32 589835, metadata !159, i32 1132, i32 0, metadata !1, i32 38} ; [ DW_TAG_lexical_block ]
!357 = metadata !{i32 590080, metadata !356, metadata !"in_write", metadata !1, i32 1133, metadata !163, i32 0} ; [ DW_TAG_auto_variable ]
!358 = metadata !{i32 590080, metadata !356, metadata !"in_except", metadata !1, i32 1133, metadata !163, i32 0} ; [ DW_TAG_auto_variable ]
!359 = metadata !{i32 590080, metadata !356, metadata !"os_read", metadata !1, i32 1133, metadata !163, i32 0} ; [ DW_TAG_auto_variable ]
!360 = metadata !{i32 590080, metadata !356, metadata !"os_write", metadata !1, i32 1133, metadata !163, i32 0} ; [ DW_TAG_auto_variable ]
!361 = metadata !{i32 590080, metadata !356, metadata !"os_except", metadata !1, i32 1133, metadata !163, i32 0} ; [ DW_TAG_auto_variable ]
!362 = metadata !{i32 590080, metadata !356, metadata !"i", metadata !1, i32 1134, metadata !67, i32 0} ; [ DW_TAG_auto_variable ]
!363 = metadata !{i32 590080, metadata !356, metadata !"count", metadata !1, i32 1134, metadata !67, i32 0} ; [ DW_TAG_auto_variable ]
!364 = metadata !{i32 590080, metadata !356, metadata !"os_nfds", metadata !1, i32 1134, metadata !67, i32 0} ; [ DW_TAG_auto_variable ]
!365 = metadata !{i32 590080, metadata !366, metadata !"f", metadata !1, i32 1164, metadata !62, i32 0} ; [ DW_TAG_auto_variable ]
!366 = metadata !{i32 589835, metadata !356, i32 1164, i32 0, metadata !1, i32 39} ; [ DW_TAG_lexical_block ]
!367 = metadata !{i32 590080, metadata !368, metadata !"tv", metadata !1, i32 1186, metadata !173, i32 0} ; [ DW_TAG_auto_variable ]
!368 = metadata !{i32 589835, metadata !356, i32 1186, i32 0, metadata !1, i32 40} ; [ DW_TAG_lexical_block ]
!369 = metadata !{i32 590080, metadata !368, metadata !"r", metadata !1, i32 1187, metadata !67, i32 0} ; [ DW_TAG_auto_variable ]
!370 = metadata !{i32 590080, metadata !371, metadata !"f", metadata !1, i32 1202, metadata !62, i32 0} ; [ DW_TAG_auto_variable ]
!371 = metadata !{i32 589835, metadata !368, i32 1202, i32 0, metadata !1, i32 41} ; [ DW_TAG_lexical_block ]
!372 = metadata !{i32 590081, metadata !179, metadata !"fd", metadata !1, i32 201, metadata !67, i32 0} ; [ DW_TAG_arg_variable ]
!373 = metadata !{i32 590080, metadata !374, metadata !"f", metadata !1, i32 203, metadata !62, i32 0} ; [ DW_TAG_auto_variable ]
!374 = metadata !{i32 589835, metadata !179, i32 201, i32 0, metadata !1, i32 42} ; [ DW_TAG_lexical_block ]
!375 = metadata !{i32 590080, metadata !374, metadata !"r", metadata !1, i32 204, metadata !67, i32 0} ; [ DW_TAG_auto_variable ]
!376 = metadata !{i32 590081, metadata !180, metadata !"oldfd", metadata !1, i32 1016, metadata !67, i32 0} ; [ DW_TAG_arg_variable ]
!377 = metadata !{i32 590081, metadata !180, metadata !"newfd", metadata !1, i32 1016, metadata !67, i32 0} ; [ DW_TAG_arg_variable ]
!378 = metadata !{i32 590080, metadata !379, metadata !"f", metadata !1, i32 1017, metadata !62, i32 0} ; [ DW_TAG_auto_variable ]
!379 = metadata !{i32 589835, metadata !180, i32 1016, i32 0, metadata !1, i32 43} ; [ DW_TAG_lexical_block ]
!380 = metadata !{i32 590080, metadata !381, metadata !"f2", metadata !1, i32 1023, metadata !62, i32 0} ; [ DW_TAG_auto_variable ]
!381 = metadata !{i32 589835, metadata !379, i32 1023, i32 0, metadata !1, i32 44} ; [ DW_TAG_lexical_block ]
!382 = metadata !{i32 590081, metadata !183, metadata !"oldfd", metadata !1, i32 1041, metadata !67, i32 0} ; [ DW_TAG_arg_variable ]
!383 = metadata !{i32 590080, metadata !384, metadata !"f", metadata !1, i32 1042, metadata !62, i32 0} ; [ DW_TAG_auto_variable ]
!384 = metadata !{i32 589835, metadata !183, i32 1041, i32 0, metadata !1, i32 45} ; [ DW_TAG_lexical_block ]
!385 = metadata !{i32 590080, metadata !386, metadata !"fd", metadata !1, i32 1047, metadata !67, i32 0} ; [ DW_TAG_auto_variable ]
!386 = metadata !{i32 589835, metadata !384, i32 1048, i32 0, metadata !1, i32 46} ; [ DW_TAG_lexical_block ]
!387 = metadata !{i32 590081, metadata !184, metadata !"fd", metadata !1, i32 908, metadata !67, i32 0} ; [ DW_TAG_arg_variable ]
!388 = metadata !{i32 590081, metadata !184, metadata !"cmd", metadata !1, i32 908, metadata !67, i32 0} ; [ DW_TAG_arg_variable ]
!389 = metadata !{i32 590080, metadata !390, metadata !"f", metadata !1, i32 909, metadata !62, i32 0} ; [ DW_TAG_auto_variable ]
!390 = metadata !{i32 589835, metadata !184, i32 908, i32 0, metadata !1, i32 47} ; [ DW_TAG_lexical_block ]
!391 = metadata !{i32 590080, metadata !390, metadata !"ap", metadata !1, i32 910, metadata !392, i32 0} ; [ DW_TAG_auto_variable ]
!392 = metadata !{i32 589846, metadata !393, metadata !"va_list", metadata !393, i32 91, i64 0, i64 0, i64 0, i32 0, metadata !13} ; [ DW_TAG_typedef ]
!393 = metadata !{i32 589865, metadata !"stdio.h", metadata !"/usr/include", metadata !2} ; [ DW_TAG_file_type ]
!394 = metadata !{i32 590080, metadata !390, metadata !"arg", metadata !1, i32 911, metadata !11, i32 0} ; [ DW_TAG_auto_variable ]
!395 = metadata !{i32 590080, metadata !396, metadata !"flags", metadata !1, i32 930, metadata !67, i32 0} ; [ DW_TAG_auto_variable ]
!396 = metadata !{i32 589835, metadata !390, i32 930, i32 0, metadata !1, i32 48} ; [ DW_TAG_lexical_block ]
!397 = metadata !{i32 590080, metadata !398, metadata !"r", metadata !1, i32 956, metadata !67, i32 0} ; [ DW_TAG_auto_variable ]
!398 = metadata !{i32 589835, metadata !390, i32 956, i32 0, metadata !1, i32 49} ; [ DW_TAG_lexical_block ]
!399 = metadata !{i32 590081, metadata !185, metadata !"fd", metadata !1, i32 760, metadata !67, i32 0} ; [ DW_TAG_arg_variable ]
!400 = metadata !{i32 590081, metadata !185, metadata !"request", metadata !1, i32 760, metadata !27, i32 0} ; [ DW_TAG_arg_variable ]
!401 = metadata !{i32 590080, metadata !402, metadata !"f", metadata !1, i32 762, metadata !62, i32 0} ; [ DW_TAG_auto_variable ]
!402 = metadata !{i32 589835, metadata !185, i32 760, i32 0, metadata !1, i32 50} ; [ DW_TAG_lexical_block ]
!403 = metadata !{i32 590080, metadata !402, metadata !"ap", metadata !1, i32 763, metadata !392, i32 0} ; [ DW_TAG_auto_variable ]
!404 = metadata !{i32 590080, metadata !402, metadata !"buf", metadata !1, i32 764, metadata !138, i32 0} ; [ DW_TAG_auto_variable ]
!405 = metadata !{i32 590080, metadata !406, metadata !"stat", metadata !1, i32 780, metadata !407, i32 0} ; [ DW_TAG_auto_variable ]
!406 = metadata !{i32 589835, metadata !402, i32 780, i32 0, metadata !1, i32 51} ; [ DW_TAG_lexical_block ]
!407 = metadata !{i32 589839, metadata !1, metadata !"", metadata !1, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !408} ; [ DW_TAG_pointer_type ]
!408 = metadata !{i32 589843, metadata !1, metadata !"stat", metadata !20, i32 44, i64 704, i64 32, i64 0, i32 0, null, metadata !409, i32 0, null} ; [ DW_TAG_structure_type ]
!409 = metadata !{metadata !410, metadata !411, metadata !412, metadata !413, metadata !414, metadata !415, metadata !416, metadata !417, metadata !418, metadata !419, metadata !421, metadata !422, metadata !424, metadata !425, metadata !426, metadata !427, metadata !428}
!410 = metadata !{i32 589837, metadata !408, metadata !"st_dev", metadata !20, i32 45, i64 64, i64 64, i64 0, i32 0, metadata !21} ; [ DW_TAG_member ]
!411 = metadata !{i32 589837, metadata !408, metadata !"__pad1", metadata !20, i32 47, i64 16, i64 16, i64 64, i32 0, metadata !198} ; [ DW_TAG_member ]
!412 = metadata !{i32 589837, metadata !408, metadata !"st_ino", metadata !20, i32 50, i64 32, i64 32, i64 96, i32 0, metadata !26} ; [ DW_TAG_member ]
!413 = metadata !{i32 589837, metadata !408, metadata !"st_mode", metadata !20, i32 55, i64 32, i64 32, i64 128, i32 0, metadata !29} ; [ DW_TAG_member ]
!414 = metadata !{i32 589837, metadata !408, metadata !"st_nlink", metadata !20, i32 56, i64 32, i64 32, i64 160, i32 0, metadata !31} ; [ DW_TAG_member ]
!415 = metadata !{i32 589837, metadata !408, metadata !"st_uid", metadata !20, i32 61, i64 32, i64 32, i64 192, i32 0, metadata !33} ; [ DW_TAG_member ]
!416 = metadata !{i32 589837, metadata !408, metadata !"st_gid", metadata !20, i32 62, i64 32, i64 32, i64 224, i32 0, metadata !35} ; [ DW_TAG_member ]
!417 = metadata !{i32 589837, metadata !408, metadata !"st_rdev", metadata !20, i32 66, i64 64, i64 64, i64 256, i32 0, metadata !21} ; [ DW_TAG_member ]
!418 = metadata !{i32 589837, metadata !408, metadata !"__pad2", metadata !20, i32 68, i64 16, i64 16, i64 320, i32 0, metadata !198} ; [ DW_TAG_member ]
!419 = metadata !{i32 589837, metadata !408, metadata !"st_size", metadata !20, i32 71, i64 32, i64 32, i64 352, i32 0, metadata !420} ; [ DW_TAG_member ]
!420 = metadata !{i32 589846, metadata !22, metadata !"__off_t", metadata !22, i32 142, i64 0, i64 0, i64 0, i32 0, metadata !43} ; [ DW_TAG_typedef ]
!421 = metadata !{i32 589837, metadata !408, metadata !"st_blksize", metadata !20, i32 75, i64 32, i64 32, i64 384, i32 0, metadata !42} ; [ DW_TAG_member ]
!422 = metadata !{i32 589837, metadata !408, metadata !"st_blocks", metadata !20, i32 77, i64 32, i64 32, i64 416, i32 0, metadata !423} ; [ DW_TAG_member ]
!423 = metadata !{i32 589846, metadata !22, metadata !"__blkcnt_t", metadata !22, i32 170, i64 0, i64 0, i64 0, i32 0, metadata !43} ; [ DW_TAG_typedef ]
!424 = metadata !{i32 589837, metadata !408, metadata !"st_atim", metadata !20, i32 88, i64 64, i64 32, i64 448, i32 0, metadata !47} ; [ DW_TAG_member ]
!425 = metadata !{i32 589837, metadata !408, metadata !"st_mtim", metadata !20, i32 89, i64 64, i64 32, i64 512, i32 0, metadata !47} ; [ DW_TAG_member ]
!426 = metadata !{i32 589837, metadata !408, metadata !"st_ctim", metadata !20, i32 90, i64 64, i64 32, i64 576, i32 0, metadata !47} ; [ DW_TAG_member ]
!427 = metadata !{i32 589837, metadata !408, metadata !"__unused4", metadata !20, i32 106, i64 32, i64 32, i64 640, i32 0, metadata !27} ; [ DW_TAG_member ]
!428 = metadata !{i32 589837, metadata !408, metadata !"__unused5", metadata !20, i32 107, i64 32, i64 32, i64 672, i32 0, metadata !27} ; [ DW_TAG_member ]
!429 = metadata !{i32 590080, metadata !430, metadata !"ts", metadata !1, i32 784, metadata !431, i32 0} ; [ DW_TAG_auto_variable ]
!430 = metadata !{i32 589835, metadata !406, i32 784, i32 0, metadata !1, i32 52} ; [ DW_TAG_lexical_block ]
!431 = metadata !{i32 589839, metadata !1, metadata !"", metadata !1, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !432} ; [ DW_TAG_pointer_type ]
!432 = metadata !{i32 589843, metadata !1, metadata !"termios", metadata !433, i32 31, i64 480, i64 32, i64 0, i32 0, null, metadata !434, i32 0, null} ; [ DW_TAG_structure_type ]
!433 = metadata !{i32 589865, metadata !"termios.h", metadata !"/usr/include/bits", metadata !2} ; [ DW_TAG_file_type ]
!434 = metadata !{metadata !435, metadata !437, metadata !438, metadata !439, metadata !440, metadata !442, metadata !444, metadata !446}
!435 = metadata !{i32 589837, metadata !432, metadata !"c_iflag", metadata !433, i32 32, i64 32, i64 32, i64 0, i32 0, metadata !436} ; [ DW_TAG_member ]
!436 = metadata !{i32 589846, metadata !433, metadata !"tcflag_t", metadata !433, i32 31, i64 0, i64 0, i64 0, i32 0, metadata !11} ; [ DW_TAG_typedef ]
!437 = metadata !{i32 589837, metadata !432, metadata !"c_oflag", metadata !433, i32 33, i64 32, i64 32, i64 32, i32 0, metadata !436} ; [ DW_TAG_member ]
!438 = metadata !{i32 589837, metadata !432, metadata !"c_cflag", metadata !433, i32 34, i64 32, i64 32, i64 64, i32 0, metadata !436} ; [ DW_TAG_member ]
!439 = metadata !{i32 589837, metadata !432, metadata !"c_lflag", metadata !433, i32 35, i64 32, i64 32, i64 96, i32 0, metadata !436} ; [ DW_TAG_member ]
!440 = metadata !{i32 589837, metadata !432, metadata !"c_line", metadata !433, i32 36, i64 8, i64 8, i64 128, i32 0, metadata !441} ; [ DW_TAG_member ]
!441 = metadata !{i32 589846, metadata !433, metadata !"cc_t", metadata !433, i32 26, i64 0, i64 0, i64 0, i32 0, metadata !200} ; [ DW_TAG_typedef ]
!442 = metadata !{i32 589837, metadata !432, metadata !"c_cc", metadata !433, i32 37, i64 256, i64 8, i64 136, i32 0, metadata !443} ; [ DW_TAG_member ]
!443 = metadata !{i32 589825, metadata !1, metadata !"", metadata !1, i32 0, i64 256, i64 8, i64 0, i32 0, metadata !441, metadata !170, i32 0, null} ; [ DW_TAG_array_type ]
!444 = metadata !{i32 589837, metadata !432, metadata !"c_ispeed", metadata !433, i32 38, i64 32, i64 32, i64 416, i32 0, metadata !445} ; [ DW_TAG_member ]
!445 = metadata !{i32 589846, metadata !433, metadata !"speed_t", metadata !433, i32 27, i64 0, i64 0, i64 0, i32 0, metadata !11} ; [ DW_TAG_typedef ]
!446 = metadata !{i32 589837, metadata !432, metadata !"c_ospeed", metadata !433, i32 39, i64 32, i64 32, i64 448, i32 0, metadata !445} ; [ DW_TAG_member ]
!447 = metadata !{i32 590080, metadata !448, metadata !"ws", metadata !1, i32 853, metadata !449, i32 0} ; [ DW_TAG_auto_variable ]
!448 = metadata !{i32 589835, metadata !406, i32 853, i32 0, metadata !1, i32 53} ; [ DW_TAG_lexical_block ]
!449 = metadata !{i32 589839, metadata !1, metadata !"", metadata !1, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !450} ; [ DW_TAG_pointer_type ]
!450 = metadata !{i32 589843, metadata !1, metadata !"winsize", metadata !451, i32 29, i64 64, i64 16, i64 0, i32 0, null, metadata !452, i32 0, null} ; [ DW_TAG_structure_type ]
!451 = metadata !{i32 589865, metadata !"ioctl-types.h", metadata !"/usr/include/bits", metadata !2} ; [ DW_TAG_file_type ]
!452 = metadata !{metadata !453, metadata !454, metadata !455, metadata !456}
!453 = metadata !{i32 589837, metadata !450, metadata !"ws_row", metadata !451, i32 30, i64 16, i64 16, i64 0, i32 0, metadata !198} ; [ DW_TAG_member ]
!454 = metadata !{i32 589837, metadata !450, metadata !"ws_col", metadata !451, i32 31, i64 16, i64 16, i64 16, i32 0, metadata !198} ; [ DW_TAG_member ]
!455 = metadata !{i32 589837, metadata !450, metadata !"ws_xpixel", metadata !451, i32 32, i64 16, i64 16, i64 32, i32 0, metadata !198} ; [ DW_TAG_member ]
!456 = metadata !{i32 589837, metadata !450, metadata !"ws_ypixel", metadata !451, i32 33, i64 16, i64 16, i64 48, i32 0, metadata !198} ; [ DW_TAG_member ]
!457 = metadata !{i32 590080, metadata !458, metadata !"res", metadata !1, i32 876, metadata !459, i32 0} ; [ DW_TAG_auto_variable ]
!458 = metadata !{i32 589835, metadata !406, i32 876, i32 0, metadata !1, i32 54} ; [ DW_TAG_lexical_block ]
!459 = metadata !{i32 589839, metadata !1, metadata !"", metadata !1, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !67} ; [ DW_TAG_pointer_type ]
!460 = metadata !{i32 590080, metadata !461, metadata !"r", metadata !1, i32 901, metadata !67, i32 0} ; [ DW_TAG_auto_variable ]
!461 = metadata !{i32 589835, metadata !402, i32 901, i32 0, metadata !1, i32 55} ; [ DW_TAG_lexical_block ]
!462 = metadata !{i32 590081, metadata !188, metadata !"fd", metadata !1, i32 676, metadata !11, i32 0} ; [ DW_TAG_arg_variable ]
!463 = metadata !{i32 590081, metadata !188, metadata !"dirp", metadata !1, i32 676, metadata !191, i32 0} ; [ DW_TAG_arg_variable ]
!464 = metadata !{i32 590081, metadata !188, metadata !"count", metadata !1, i32 676, metadata !11, i32 0} ; [ DW_TAG_arg_variable ]
!465 = metadata !{i32 590080, metadata !466, metadata !"f", metadata !1, i32 677, metadata !62, i32 0} ; [ DW_TAG_auto_variable ]
!466 = metadata !{i32 589835, metadata !188, i32 676, i32 0, metadata !1, i32 56} ; [ DW_TAG_lexical_block ]
!467 = metadata !{i32 590080, metadata !468, metadata !"i", metadata !1, i32 691, metadata !11, i32 0} ; [ DW_TAG_auto_variable ]
!468 = metadata !{i32 589835, metadata !466, i32 691, i32 0, metadata !1, i32 57} ; [ DW_TAG_lexical_block ]
!469 = metadata !{i32 590080, metadata !468, metadata !"pad", metadata !1, i32 691, metadata !11, i32 0} ; [ DW_TAG_auto_variable ]
!470 = metadata !{i32 590080, metadata !468, metadata !"bytes", metadata !1, i32 691, metadata !11, i32 0} ; [ DW_TAG_auto_variable ]
!471 = metadata !{i32 590080, metadata !472, metadata !"df", metadata !1, i32 701, metadata !5, i32 0} ; [ DW_TAG_auto_variable ]
!472 = metadata !{i32 589835, metadata !468, i32 701, i32 0, metadata !1, i32 58} ; [ DW_TAG_lexical_block ]
!473 = metadata !{i32 590080, metadata !474, metadata !"os_pos", metadata !1, i32 723, metadata !11, i32 0} ; [ DW_TAG_auto_variable ]
!474 = metadata !{i32 589835, metadata !466, i32 723, i32 0, metadata !1, i32 59} ; [ DW_TAG_lexical_block ]
!475 = metadata !{i32 590080, metadata !474, metadata !"res", metadata !1, i32 724, metadata !67, i32 0} ; [ DW_TAG_auto_variable ]
!476 = metadata !{i32 590080, metadata !474, metadata !"s", metadata !1, i32 724, metadata !67, i32 0} ; [ DW_TAG_auto_variable ]
!477 = metadata !{i32 590080, metadata !478, metadata !"pos", metadata !1, i32 740, metadata !67, i32 0} ; [ DW_TAG_auto_variable ]
!478 = metadata !{i32 589835, metadata !474, i32 740, i32 0, metadata !1, i32 60} ; [ DW_TAG_lexical_block ]
!479 = metadata !{i32 590080, metadata !480, metadata !"dp", metadata !1, i32 747, metadata !191, i32 0} ; [ DW_TAG_auto_variable ]
!480 = metadata !{i32 589835, metadata !478, i32 747, i32 0, metadata !1, i32 61} ; [ DW_TAG_lexical_block ]
!481 = metadata !{i32 590081, metadata !205, metadata !"fd", metadata !1, i32 373, metadata !67, i32 0} ; [ DW_TAG_arg_variable ]
!482 = metadata !{i32 590081, metadata !205, metadata !"offset", metadata !1, i32 373, metadata !70, i32 0} ; [ DW_TAG_arg_variable ]
!483 = metadata !{i32 590081, metadata !205, metadata !"whence", metadata !1, i32 373, metadata !67, i32 0} ; [ DW_TAG_arg_variable ]
!484 = metadata !{i32 590080, metadata !485, metadata !"new_off", metadata !1, i32 374, metadata !70, i32 0} ; [ DW_TAG_auto_variable ]
!485 = metadata !{i32 589835, metadata !205, i32 373, i32 0, metadata !1, i32 62} ; [ DW_TAG_lexical_block ]
!486 = metadata !{i32 590080, metadata !485, metadata !"f", metadata !1, i32 375, metadata !62, i32 0} ; [ DW_TAG_auto_variable ]
!487 = metadata !{i32 590081, metadata !208, metadata !"fd", metadata !1, i32 620, metadata !67, i32 0} ; [ DW_TAG_arg_variable ]
!488 = metadata !{i32 590081, metadata !208, metadata !"buf", metadata !1, i32 620, metadata !16, i32 0} ; [ DW_TAG_arg_variable ]
!489 = metadata !{i32 590080, metadata !490, metadata !"f", metadata !1, i32 621, metadata !62, i32 0} ; [ DW_TAG_auto_variable ]
!490 = metadata !{i32 589835, metadata !208, i32 620, i32 0, metadata !1, i32 63} ; [ DW_TAG_lexical_block ]
!491 = metadata !{i32 590080, metadata !492, metadata !"r", metadata !1, i32 632, metadata !67, i32 0} ; [ DW_TAG_auto_variable ]
!492 = metadata !{i32 589835, metadata !490, i32 632, i32 0, metadata !1, i32 64} ; [ DW_TAG_lexical_block ]
!493 = metadata !{i32 590081, metadata !209, metadata !"path", metadata !1, i32 449, metadata !57, i32 0} ; [ DW_TAG_arg_variable ]
!494 = metadata !{i32 590081, metadata !209, metadata !"buf", metadata !1, i32 449, metadata !16, i32 0} ; [ DW_TAG_arg_variable ]
!495 = metadata !{i32 590080, metadata !496, metadata !"dfile", metadata !1, i32 450, metadata !5, i32 0} ; [ DW_TAG_auto_variable ]
!496 = metadata !{i32 589835, metadata !209, i32 449, i32 0, metadata !1, i32 65} ; [ DW_TAG_lexical_block ]
!497 = metadata !{i32 590080, metadata !498, metadata !"r", metadata !1, i32 460, metadata !67, i32 0} ; [ DW_TAG_auto_variable ]
!498 = metadata !{i32 589835, metadata !496, i32 460, i32 0, metadata !1, i32 66} ; [ DW_TAG_lexical_block ]
!499 = metadata !{i32 590081, metadata !212, metadata !"path", metadata !1, i32 430, metadata !57, i32 0} ; [ DW_TAG_arg_variable ]
!500 = metadata !{i32 590081, metadata !212, metadata !"buf", metadata !1, i32 430, metadata !16, i32 0} ; [ DW_TAG_arg_variable ]
!501 = metadata !{i32 590080, metadata !502, metadata !"dfile", metadata !1, i32 431, metadata !5, i32 0} ; [ DW_TAG_auto_variable ]
!502 = metadata !{i32 589835, metadata !212, i32 430, i32 0, metadata !1, i32 67} ; [ DW_TAG_lexical_block ]
!503 = metadata !{i32 590080, metadata !504, metadata !"r", metadata !1, i32 441, metadata !67, i32 0} ; [ DW_TAG_auto_variable ]
!504 = metadata !{i32 589835, metadata !502, i32 441, i32 0, metadata !1, i32 68} ; [ DW_TAG_lexical_block ]
!505 = metadata !{i32 590081, metadata !213, metadata !"fd", metadata !1, i32 233, metadata !67, i32 0} ; [ DW_TAG_arg_variable ]
!506 = metadata !{i32 590081, metadata !213, metadata !"buf", metadata !1, i32 233, metadata !138, i32 0} ; [ DW_TAG_arg_variable ]
!507 = metadata !{i32 590081, metadata !213, metadata !"count", metadata !1, i32 233, metadata !94, i32 0} ; [ DW_TAG_arg_variable ]
!508 = metadata !{i32 590080, metadata !509, metadata !"f", metadata !1, i32 235, metadata !62, i32 0} ; [ DW_TAG_auto_variable ]
!509 = metadata !{i32 589835, metadata !213, i32 233, i32 0, metadata !1, i32 69} ; [ DW_TAG_lexical_block ]
!510 = metadata !{i32 590080, metadata !511, metadata !"r", metadata !1, i32 262, metadata !67, i32 0} ; [ DW_TAG_auto_variable ]
!511 = metadata !{i32 589835, metadata !509, i32 263, i32 0, metadata !1, i32 70} ; [ DW_TAG_lexical_block ]
!512 = metadata !{i32 590081, metadata !216, metadata !"df", metadata !1, i32 507, metadata !5, i32 0} ; [ DW_TAG_arg_variable ]
!513 = metadata !{i32 590081, metadata !216, metadata !"mode", metadata !1, i32 507, metadata !76, i32 0} ; [ DW_TAG_arg_variable ]
!514 = metadata !{i32 590081, metadata !219, metadata !"fd", metadata !1, i32 542, metadata !67, i32 0} ; [ DW_TAG_arg_variable ]
!515 = metadata !{i32 590081, metadata !219, metadata !"mode", metadata !1, i32 542, metadata !76, i32 0} ; [ DW_TAG_arg_variable ]
!516 = metadata !{i32 590080, metadata !517, metadata !"f", metadata !1, i32 545, metadata !62, i32 0} ; [ DW_TAG_auto_variable ]
!517 = metadata !{i32 589835, metadata !219, i32 542, i32 0, metadata !1, i32 72} ; [ DW_TAG_lexical_block ]
!518 = metadata !{i32 590080, metadata !519, metadata !"r", metadata !1, i32 562, metadata !67, i32 0} ; [ DW_TAG_auto_variable ]
!519 = metadata !{i32 589835, metadata !517, i32 562, i32 0, metadata !1, i32 73} ; [ DW_TAG_lexical_block ]
!520 = metadata !{i32 590081, metadata !222, metadata !"path", metadata !1, i32 520, metadata !57, i32 0} ; [ DW_TAG_arg_variable ]
!521 = metadata !{i32 590081, metadata !222, metadata !"mode", metadata !1, i32 520, metadata !76, i32 0} ; [ DW_TAG_arg_variable ]
!522 = metadata !{i32 590080, metadata !523, metadata !"dfile", metadata !1, i32 523, metadata !5, i32 0} ; [ DW_TAG_auto_variable ]
!523 = metadata !{i32 589835, metadata !222, i32 520, i32 0, metadata !1, i32 74} ; [ DW_TAG_lexical_block ]
!524 = metadata !{i32 590080, metadata !525, metadata !"r", metadata !1, i32 535, metadata !67, i32 0} ; [ DW_TAG_auto_variable ]
!525 = metadata !{i32 589835, metadata !523, i32 535, i32 0, metadata !1, i32 75} ; [ DW_TAG_lexical_block ]
!526 = metadata !{i32 590081, metadata !225, metadata !"fd", metadata !1, i32 301, metadata !67, i32 0} ; [ DW_TAG_arg_variable ]
!527 = metadata !{i32 590081, metadata !225, metadata !"buf", metadata !1, i32 301, metadata !138, i32 0} ; [ DW_TAG_arg_variable ]
!528 = metadata !{i32 590081, metadata !225, metadata !"count", metadata !1, i32 301, metadata !94, i32 0} ; [ DW_TAG_arg_variable ]
!529 = metadata !{i32 590080, metadata !530, metadata !"f", metadata !1, i32 303, metadata !62, i32 0} ; [ DW_TAG_auto_variable ]
!530 = metadata !{i32 589835, metadata !225, i32 301, i32 0, metadata !1, i32 76} ; [ DW_TAG_lexical_block ]
!531 = metadata !{i32 590080, metadata !532, metadata !"r", metadata !1, i32 321, metadata !67, i32 0} ; [ DW_TAG_auto_variable ]
!532 = metadata !{i32 589835, metadata !530, i32 323, i32 0, metadata !1, i32 77} ; [ DW_TAG_lexical_block ]
!533 = metadata !{i32 590080, metadata !534, metadata !"actual_count", metadata !1, i32 346, metadata !94, i32 0} ; [ DW_TAG_auto_variable ]
!534 = metadata !{i32 589835, metadata !530, i32 346, i32 0, metadata !1, i32 78} ; [ DW_TAG_lexical_block ]
!535 = metadata !{i32 590081, metadata !226, metadata !"pathname", metadata !1, i32 128, metadata !57, i32 0} ; [ DW_TAG_arg_variable ]
!536 = metadata !{i32 590081, metadata !226, metadata !"flags", metadata !1, i32 128, metadata !67, i32 0} ; [ DW_TAG_arg_variable ]
!537 = metadata !{i32 590081, metadata !226, metadata !"mode", metadata !1, i32 128, metadata !76, i32 0} ; [ DW_TAG_arg_variable ]
!538 = metadata !{i32 590080, metadata !539, metadata !"df", metadata !1, i32 129, metadata !5, i32 0} ; [ DW_TAG_auto_variable ]
!539 = metadata !{i32 589835, metadata !226, i32 128, i32 0, metadata !1, i32 79} ; [ DW_TAG_lexical_block ]
!540 = metadata !{i32 590080, metadata !539, metadata !"f", metadata !1, i32 130, metadata !62, i32 0} ; [ DW_TAG_auto_variable ]
!541 = metadata !{i32 590080, metadata !539, metadata !"fd", metadata !1, i32 131, metadata !67, i32 0} ; [ DW_TAG_auto_variable ]
!542 = metadata !{i32 590080, metadata !543, metadata !"os_fd", metadata !1, i32 181, metadata !67, i32 0} ; [ DW_TAG_auto_variable ]
!543 = metadata !{i32 589835, metadata !539, i32 181, i32 0, metadata !1, i32 80} ; [ DW_TAG_lexical_block ]
!544 = metadata !{i32 73, i32 0, metadata !156, null}
!545 = metadata !{i32 39, i32 0, metadata !0, metadata !546}
!546 = metadata !{i32 74, i32 0, metadata !347, null}
!547 = metadata !{i32 40, i32 0, metadata !231, metadata !546}
!548 = metadata !{i32 43, i32 0, metadata !231, metadata !546}
!549 = metadata !{i32 46, i32 0, metadata !231, metadata !546}
!550 = metadata !{i32 47, i32 0, metadata !231, metadata !546}
!551 = metadata !{i32 48, i32 0, metadata !234, metadata !546}
!552 = metadata !{null}
!553 = metadata !{i32 49, i32 0, metadata !234, metadata !546}
!554 = metadata !{i32 76, i32 0, metadata !347, null}
!555 = metadata !{i32 1265, i32 0, metadata !145, metadata !556}
!556 = metadata !{i32 81, i32 0, metadata !349, null}
!557 = metadata !{i32 1252, i32 0, metadata !135, metadata !558}
!558 = metadata !{i32 1266, i32 0, metadata !313, metadata !556}
!559 = metadata !{i32 1254, i32 0, metadata !303, metadata !558}
!560 = metadata !{i32 1255, i32 0, metadata !303, metadata !558}
!561 = metadata !{i32 0}
!562 = metadata !{i32 1269, i32 0, metadata !313, metadata !556}
!563 = metadata !{i32 1270, i32 0, metadata !316, metadata !556}
!564 = metadata !{i32 1271, i32 0, metadata !316, metadata !556}
!565 = metadata !{i32 1273, i32 0, metadata !316, metadata !556}
!566 = metadata !{i32 1276, i32 0, metadata !316, metadata !556}
!567 = metadata !{i32 1279, i32 0, metadata !318, metadata !556}
!568 = metadata !{i32 1280, i32 0, metadata !318, metadata !556}
!569 = metadata !{i32 1281, i32 0, metadata !318, metadata !556}
!570 = metadata !{i32 1282, i32 0, metadata !318, metadata !556}
!571 = metadata !{i32 82, i32 0, metadata !349, null}
!572 = metadata !{i32 83, i32 0, metadata !349, null}
!573 = metadata !{i32 79, i32 0, metadata !347, null}
!574 = metadata !{i32 88, i32 0, metadata !73, null}
!575 = metadata !{i32 89, i32 0, metadata !241, null}
!576 = metadata !{i32 90, i32 0, metadata !241, null}
!577 = metadata !{i32 91, i32 0, metadata !241, null}
!578 = metadata !{i32 1294, i32 0, metadata !80, null}
!579 = metadata !{i32 1295, i32 0, metadata !580, null}
!580 = metadata !{i32 589835, metadata !80, i32 1294, i32 0, metadata !1, i32 6} ; [ DW_TAG_lexical_block ]
!581 = metadata !{i32 1296, i32 0, metadata !580, null}
!582 = metadata !{i32 1297, i32 0, metadata !580, null}
!583 = metadata !{i32 1300, i32 0, metadata !580, null}
!584 = metadata !{i32 1304, i32 0, metadata !580, null}
!585 = metadata !{i32 1305, i32 0, metadata !580, null}
!586 = metadata !{i32 1306, i32 0, metadata !580, null}
!587 = metadata !{i32 1078, i32 0, metadata !83, null}
!588 = metadata !{i32 39, i32 0, metadata !0, metadata !589}
!589 = metadata !{i32 1079, i32 0, metadata !251, null}
!590 = metadata !{i32 40, i32 0, metadata !231, metadata !589}
!591 = metadata !{i32 43, i32 0, metadata !231, metadata !589}
!592 = metadata !{i32 46, i32 0, metadata !231, metadata !589}
!593 = metadata !{i32 47, i32 0, metadata !231, metadata !589}
!594 = metadata !{i32 48, i32 0, metadata !234, metadata !589}
!595 = metadata !{i32 49, i32 0, metadata !234, metadata !589}
!596 = metadata !{i32 1080, i32 0, metadata !251, null}
!597 = metadata !{i32 1082, i32 0, metadata !251, null}
!598 = metadata !{i32 1083, i32 0, metadata !251, null}
!599 = metadata !{i32 1084, i32 0, metadata !251, null}
!600 = metadata !{i32 1085, i32 0, metadata !251, null}
!601 = metadata !{i32 1086, i32 0, metadata !251, null}
!602 = metadata !{i32 1087, i32 0, metadata !251, null}
!603 = metadata !{i32 1089, i32 0, metadata !251, null}
!604 = metadata !{i32 1090, i32 0, metadata !251, null}
!605 = metadata !{i32 1094, i32 0, metadata !251, null}
!606 = metadata !{i32 1095, i32 0, metadata !251, null}
!607 = metadata !{i32 1096, i32 0, metadata !251, null}
!608 = metadata !{i32 1060, i32 0, metadata !84, null}
!609 = metadata !{i32 39, i32 0, metadata !0, metadata !610}
!610 = metadata !{i32 1061, i32 0, metadata !254, null}
!611 = metadata !{i32 40, i32 0, metadata !231, metadata !610}
!612 = metadata !{i32 43, i32 0, metadata !231, metadata !610}
!613 = metadata !{i32 46, i32 0, metadata !231, metadata !610}
!614 = metadata !{i32 47, i32 0, metadata !231, metadata !610}
!615 = metadata !{i32 48, i32 0, metadata !234, metadata !610}
!616 = metadata !{i32 49, i32 0, metadata !234, metadata !610}
!617 = metadata !{i32 1062, i32 0, metadata !254, null}
!618 = metadata !{i32 1064, i32 0, metadata !254, null}
!619 = metadata !{i32 1065, i32 0, metadata !254, null}
!620 = metadata !{i32 1066, i32 0, metadata !254, null}
!621 = metadata !{i32 1068, i32 0, metadata !254, null}
!622 = metadata !{i32 1069, i32 0, metadata !254, null}
!623 = metadata !{i32 1073, i32 0, metadata !254, null}
!624 = metadata !{i32 1074, i32 0, metadata !254, null}
!625 = metadata !{i32 1075, i32 0, metadata !254, null}
!626 = metadata !{i32 1099, i32 0, metadata !90, null}
!627 = metadata !{i32 39, i32 0, metadata !0, metadata !628}
!628 = metadata !{i32 1100, i32 0, metadata !262, null}
!629 = metadata !{i32 40, i32 0, metadata !231, metadata !628}
!630 = metadata !{i32 43, i32 0, metadata !231, metadata !628}
!631 = metadata !{i32 46, i32 0, metadata !231, metadata !628}
!632 = metadata !{i32 47, i32 0, metadata !231, metadata !628}
!633 = metadata !{i32 48, i32 0, metadata !234, metadata !628}
!634 = metadata !{i32 49, i32 0, metadata !234, metadata !628}
!635 = metadata !{i32 1101, i32 0, metadata !262, null}
!636 = metadata !{i32 1104, i32 0, metadata !262, null}
!637 = metadata !{i32 1105, i32 0, metadata !262, null}
!638 = metadata !{i32 1106, i32 0, metadata !262, null}
!639 = metadata !{i32 1107, i32 0, metadata !262, null}
!640 = metadata !{i32 1108, i32 0, metadata !262, null}
!641 = metadata !{i32 1109, i32 0, metadata !262, null}
!642 = metadata !{i32 1110, i32 0, metadata !262, null}
!643 = metadata !{i32 1112, i32 0, metadata !262, null}
!644 = metadata !{i32 1113, i32 0, metadata !262, null}
!645 = metadata !{i32 1116, i32 0, metadata !264, null}
!646 = metadata !{i32 1117, i32 0, metadata !264, null}
!647 = metadata !{i32 1118, i32 0, metadata !264, null}
!648 = metadata !{i32 1000, i32 0, metadata !95, null}
!649 = metadata !{i32 63, i32 0, metadata !59, metadata !650}
!650 = metadata !{i32 1001, i32 0, metadata !267, null}
!651 = metadata !{i32 64, i32 0, metadata !238, metadata !650}
!652 = metadata !{i32 65, i32 0, metadata !237, metadata !650}
!653 = metadata !{i32 66, i32 0, metadata !237, metadata !650}
!654 = metadata !{i32 1003, i32 0, metadata !267, null}
!655 = metadata !{i32 1004, i32 0, metadata !267, null}
!656 = metadata !{i32 1005, i32 0, metadata !267, null}
!657 = metadata !{i32 1006, i32 0, metadata !267, null}
!658 = metadata !{i32 1009, i32 0, metadata !269, null}
!659 = metadata !{i32 1010, i32 0, metadata !269, null}
!660 = metadata !{i32 1011, i32 0, metadata !269, null}
!661 = metadata !{i32 980, i32 0, metadata !98, null}
!662 = metadata !{i32 63, i32 0, metadata !59, metadata !663}
!663 = metadata !{i32 981, i32 0, metadata !273, null}
!664 = metadata !{i32 64, i32 0, metadata !238, metadata !663}
!665 = metadata !{i32 65, i32 0, metadata !237, metadata !663}
!666 = metadata !{i32 66, i32 0, metadata !237, metadata !663}
!667 = metadata !{i32 983, i32 0, metadata !273, null}
!668 = metadata !{i32 984, i32 0, metadata !273, null}
!669 = metadata !{i32 985, i32 0, metadata !273, null}
!670 = metadata !{i32 988, i32 0, metadata !273, null}
!671 = metadata !{i32 989, i32 0, metadata !273, null}
!672 = metadata !{i32 990, i32 0, metadata !273, null}
!673 = metadata !{i32 991, i32 0, metadata !273, null}
!674 = metadata !{i32 993, i32 0, metadata !275, null}
!675 = metadata !{i32 994, i32 0, metadata !275, null}
!676 = metadata !{i32 995, i32 0, metadata !275, null}
!677 = metadata !{i32 643, i32 0, metadata !128, null}
!678 = metadata !{i32 63, i32 0, metadata !59, metadata !679}
!679 = metadata !{i32 645, i32 0, metadata !279, null}
!680 = metadata !{i32 64, i32 0, metadata !238, metadata !679}
!681 = metadata !{i32 65, i32 0, metadata !237, metadata !679}
!682 = metadata !{i32 66, i32 0, metadata !237, metadata !679}
!683 = metadata !{i32 647, i32 0, metadata !279, null}
!684 = metadata !{i32 649, i32 0, metadata !279, null}
!685 = metadata !{i32 650, i32 0, metadata !279, null}
!686 = metadata !{i32 651, i32 0, metadata !279, null}
!687 = metadata !{i32 654, i32 0, metadata !279, null}
!688 = metadata !{i32 655, i32 0, metadata !279, null}
!689 = metadata !{i32 656, i32 0, metadata !279, null}
!690 = metadata !{i32 657, i32 0, metadata !279, null}
!691 = metadata !{i32 660, i32 0, metadata !279, null}
!692 = metadata !{i32 661, i32 0, metadata !279, null}
!693 = metadata !{i32 662, i32 0, metadata !279, null}
!694 = metadata !{i32 663, i32 0, metadata !279, null}
!695 = metadata !{i32 668, i32 0, metadata !281, null}
!696 = metadata !{i32 670, i32 0, metadata !281, null}
!697 = metadata !{i32 671, i32 0, metadata !281, null}
!698 = metadata !{i32 588, i32 0, metadata !131, null}
!699 = metadata !{i32 63, i32 0, metadata !59, metadata !700}
!700 = metadata !{i32 589, i32 0, metadata !293, null}
!701 = metadata !{i32 64, i32 0, metadata !238, metadata !700}
!702 = metadata !{i32 65, i32 0, metadata !237, metadata !700}
!703 = metadata !{i32 66, i32 0, metadata !237, metadata !700}
!704 = metadata !{i32 591, i32 0, metadata !293, null}
!705 = metadata !{i32 592, i32 0, metadata !293, null}
!706 = metadata !{i32 593, i32 0, metadata !293, null}
!707 = metadata !{i32 596, i32 0, metadata !293, null}
!708 = metadata !{%struct.exe_disk_file_t* null}
!709 = metadata !{i32 569, i32 0, metadata !85, metadata !710}
!710 = metadata !{i32 597, i32 0, metadata !293, null}
!711 = metadata !{i32 570, i32 0, metadata !712, metadata !710}
!712 = metadata !{i32 589835, metadata !85, i32 569, i32 0, metadata !1, i32 9} ; [ DW_TAG_lexical_block ]
!713 = metadata !{i32 571, i32 0, metadata !712, metadata !710}
!714 = metadata !{i32 599, i32 0, metadata !295, null}
!715 = metadata !{i32 600, i32 0, metadata !295, null}
!716 = metadata !{i32 601, i32 0, metadata !295, null}
!717 = metadata !{i32 486, i32 0, metadata !134, null}
!718 = metadata !{i32 63, i32 0, metadata !59, metadata !719}
!719 = metadata !{i32 487, i32 0, metadata !298, null}
!720 = metadata !{i32 64, i32 0, metadata !238, metadata !719}
!721 = metadata !{i32 65, i32 0, metadata !237, metadata !719}
!722 = metadata !{i32 66, i32 0, metadata !237, metadata !719}
!723 = metadata !{i32 489, i32 0, metadata !298, null}
!724 = metadata !{i32 490, i32 0, metadata !298, null}
!725 = metadata !{i32 491, i32 0, metadata !298, null}
!726 = metadata !{i32 494, i32 0, metadata !298, null}
!727 = metadata !{i32 495, i32 0, metadata !298, null}
!728 = metadata !{i32 496, i32 0, metadata !298, null}
!729 = metadata !{i32 497, i32 0, metadata !298, null}
!730 = metadata !{i32 499, i32 0, metadata !300, null}
!731 = metadata !{i32 500, i32 0, metadata !300, null}
!732 = metadata !{i32 501, i32 0, metadata !300, null}
!733 = metadata !{i32 1217, i32 0, metadata !142, null}
!734 = metadata !{i32 1221, i32 0, metadata !310, null}
!735 = metadata !{i32 1223, i32 0, metadata !310, null}
!736 = metadata !{i32 1224, i32 0, metadata !310, null}
!737 = metadata !{i32 1225, i32 0, metadata !310, null}
!738 = metadata !{i32 1226, i32 0, metadata !310, null}
!739 = metadata !{i32 1229, i32 0, metadata !310, null}
!740 = metadata !{i32 1230, i32 0, metadata !310, null}
!741 = metadata !{i32 1024}
!742 = metadata !{i32 1231, i32 0, metadata !310, null}
!743 = metadata !{i32 1232, i32 0, metadata !310, null}
!744 = metadata !{i32 1252, i32 0, metadata !135, metadata !745}
!745 = metadata !{i32 1235, i32 0, metadata !310, null}
!746 = metadata !{i32 1254, i32 0, metadata !303, metadata !745}
!747 = metadata !{i32 1255, i32 0, metadata !303, metadata !745}
!748 = metadata !{i32 1259, i32 0, metadata !139, metadata !749}
!749 = metadata !{i32 1236, i32 0, metadata !310, null}
!750 = metadata !{i32 1260, i32 0, metadata !306, metadata !749}
!751 = metadata !{i32 1261, i32 0, metadata !306, metadata !749}
!752 = metadata !{i32 1240, i32 0, metadata !310, null}
!753 = metadata !{i32 1241, i32 0, metadata !310, null}
!754 = metadata !{i32 1242, i32 0, metadata !310, null}
!755 = metadata !{i32 1243, i32 0, metadata !310, null}
!756 = metadata !{i32 1244, i32 0, metadata !310, null}
!757 = metadata !{i32 963, i32 0, metadata !148, null}
!758 = metadata !{i32 39, i32 0, metadata !0, metadata !759}
!759 = metadata !{i32 964, i32 0, metadata !322, null}
!760 = metadata !{i32 40, i32 0, metadata !231, metadata !759}
!761 = metadata !{i32 43, i32 0, metadata !231, metadata !759}
!762 = metadata !{i32 46, i32 0, metadata !231, metadata !759}
!763 = metadata !{i32 47, i32 0, metadata !231, metadata !759}
!764 = metadata !{i32 48, i32 0, metadata !234, metadata !759}
!765 = metadata !{i32 49, i32 0, metadata !234, metadata !759}
!766 = metadata !{i32 965, i32 0, metadata !322, null}
!767 = metadata !{i32 967, i32 0, metadata !322, null}
!768 = metadata !{i32 968, i32 0, metadata !322, null}
!769 = metadata !{i32 969, i32 0, metadata !322, null}
!770 = metadata !{i32 1265, i32 0, metadata !145, metadata !771}
!771 = metadata !{i32 973, i32 0, metadata !324, null}
!772 = metadata !{i32 1252, i32 0, metadata !135, metadata !773}
!773 = metadata !{i32 1266, i32 0, metadata !313, metadata !771}
!774 = metadata !{i32 1254, i32 0, metadata !303, metadata !773}
!775 = metadata !{i32 1255, i32 0, metadata !303, metadata !773}
!776 = metadata !{i32 1269, i32 0, metadata !313, metadata !771}
!777 = metadata !{i32 1270, i32 0, metadata !316, metadata !771}
!778 = metadata !{i32 1271, i32 0, metadata !316, metadata !771}
!779 = metadata !{i32 1273, i32 0, metadata !316, metadata !771}
!780 = metadata !{i32 1276, i32 0, metadata !316, metadata !771}
!781 = metadata !{i32 1279, i32 0, metadata !318, metadata !771}
!782 = metadata !{i32 1280, i32 0, metadata !318, metadata !771}
!783 = metadata !{i32 1281, i32 0, metadata !318, metadata !771}
!784 = metadata !{i32 1282, i32 0, metadata !318, metadata !771}
!785 = metadata !{i32 974, i32 0, metadata !324, null}
!786 = metadata !{i32 975, i32 0, metadata !324, null}
!787 = metadata !{i32 606, i32 0, metadata !151, null}
!788 = metadata !{i32 39, i32 0, metadata !0, metadata !789}
!789 = metadata !{i32 608, i32 0, metadata !329, null}
!790 = metadata !{i32 40, i32 0, metadata !231, metadata !789}
!791 = metadata !{i32 43, i32 0, metadata !231, metadata !789}
!792 = metadata !{i32 46, i32 0, metadata !231, metadata !789}
!793 = metadata !{i32 47, i32 0, metadata !231, metadata !789}
!794 = metadata !{i32 48, i32 0, metadata !234, metadata !789}
!795 = metadata !{i32 49, i32 0, metadata !234, metadata !789}
!796 = metadata !{i32 610, i32 0, metadata !329, null}
!797 = metadata !{i32 569, i32 0, metadata !85, metadata !798}
!798 = metadata !{i32 611, i32 0, metadata !329, null}
!799 = metadata !{i32 570, i32 0, metadata !712, metadata !798}
!800 = metadata !{i32 571, i32 0, metadata !712, metadata !798}
!801 = metadata !{i32 1265, i32 0, metadata !145, metadata !802}
!802 = metadata !{i32 613, i32 0, metadata !331, null}
!803 = metadata !{i32 1252, i32 0, metadata !135, metadata !804}
!804 = metadata !{i32 1266, i32 0, metadata !313, metadata !802}
!805 = metadata !{i32 1254, i32 0, metadata !303, metadata !804}
!806 = metadata !{i32 1255, i32 0, metadata !303, metadata !804}
!807 = metadata !{i32 1269, i32 0, metadata !313, metadata !802}
!808 = metadata !{i32 1270, i32 0, metadata !316, metadata !802}
!809 = metadata !{i32 1271, i32 0, metadata !316, metadata !802}
!810 = metadata !{i32 1273, i32 0, metadata !316, metadata !802}
!811 = metadata !{i32 1276, i32 0, metadata !316, metadata !802}
!812 = metadata !{i32 1279, i32 0, metadata !318, metadata !802}
!813 = metadata !{i32 1280, i32 0, metadata !318, metadata !802}
!814 = metadata !{i32 1281, i32 0, metadata !318, metadata !802}
!815 = metadata !{i32 1282, i32 0, metadata !318, metadata !802}
!816 = metadata !{i32 614, i32 0, metadata !331, null}
!817 = metadata !{i32 615, i32 0, metadata !331, null}
!818 = metadata !{i32 575, i32 0, metadata !154, null}
!819 = metadata !{i32 39, i32 0, metadata !0, metadata !820}
!820 = metadata !{i32 576, i32 0, metadata !336, null}
!821 = metadata !{i32 40, i32 0, metadata !231, metadata !820}
!822 = metadata !{i32 43, i32 0, metadata !231, metadata !820}
!823 = metadata !{i32 46, i32 0, metadata !231, metadata !820}
!824 = metadata !{i32 47, i32 0, metadata !231, metadata !820}
!825 = metadata !{i32 48, i32 0, metadata !234, metadata !820}
!826 = metadata !{i32 49, i32 0, metadata !234, metadata !820}
!827 = metadata !{i32 578, i32 0, metadata !336, null}
!828 = metadata !{i32 569, i32 0, metadata !85, metadata !829}
!829 = metadata !{i32 579, i32 0, metadata !336, null}
!830 = metadata !{i32 570, i32 0, metadata !712, metadata !829}
!831 = metadata !{i32 571, i32 0, metadata !712, metadata !829}
!832 = metadata !{i32 1265, i32 0, metadata !145, metadata !833}
!833 = metadata !{i32 581, i32 0, metadata !338, null}
!834 = metadata !{i32 1252, i32 0, metadata !135, metadata !835}
!835 = metadata !{i32 1266, i32 0, metadata !313, metadata !833}
!836 = metadata !{i32 1254, i32 0, metadata !303, metadata !835}
!837 = metadata !{i32 1255, i32 0, metadata !303, metadata !835}
!838 = metadata !{i32 1269, i32 0, metadata !313, metadata !833}
!839 = metadata !{i32 1270, i32 0, metadata !316, metadata !833}
!840 = metadata !{i32 1271, i32 0, metadata !316, metadata !833}
!841 = metadata !{i32 1273, i32 0, metadata !316, metadata !833}
!842 = metadata !{i32 1276, i32 0, metadata !316, metadata !833}
!843 = metadata !{i32 1279, i32 0, metadata !318, metadata !833}
!844 = metadata !{i32 1280, i32 0, metadata !318, metadata !833}
!845 = metadata !{i32 1281, i32 0, metadata !318, metadata !833}
!846 = metadata !{i32 1282, i32 0, metadata !318, metadata !833}
!847 = metadata !{i32 582, i32 0, metadata !338, null}
!848 = metadata !{i32 583, i32 0, metadata !338, null}
!849 = metadata !{i32 468, i32 0, metadata !155, null}
!850 = metadata !{i32 39, i32 0, metadata !0, metadata !851}
!851 = metadata !{i32 469, i32 0, metadata !341, null}
!852 = metadata !{i32 40, i32 0, metadata !231, metadata !851}
!853 = metadata !{i32 43, i32 0, metadata !231, metadata !851}
!854 = metadata !{i32 46, i32 0, metadata !231, metadata !851}
!855 = metadata !{i32 47, i32 0, metadata !231, metadata !851}
!856 = metadata !{i32 48, i32 0, metadata !234, metadata !851}
!857 = metadata !{i32 49, i32 0, metadata !234, metadata !851}
!858 = metadata !{i32 471, i32 0, metadata !341, null}
!859 = metadata !{i32 473, i32 0, metadata !341, null}
!860 = metadata !{i32 474, i32 0, metadata !341, null}
!861 = metadata !{i32 475, i32 0, metadata !341, null}
!862 = metadata !{i32 1265, i32 0, metadata !145, metadata !863}
!863 = metadata !{i32 479, i32 0, metadata !343, null}
!864 = metadata !{i32 1252, i32 0, metadata !135, metadata !865}
!865 = metadata !{i32 1266, i32 0, metadata !313, metadata !863}
!866 = metadata !{i32 1254, i32 0, metadata !303, metadata !865}
!867 = metadata !{i32 1255, i32 0, metadata !303, metadata !865}
!868 = metadata !{i32 1269, i32 0, metadata !313, metadata !863}
!869 = metadata !{i32 1270, i32 0, metadata !316, metadata !863}
!870 = metadata !{i32 1271, i32 0, metadata !316, metadata !863}
!871 = metadata !{i32 1273, i32 0, metadata !316, metadata !863}
!872 = metadata !{i32 1276, i32 0, metadata !316, metadata !863}
!873 = metadata !{i32 1279, i32 0, metadata !318, metadata !863}
!874 = metadata !{i32 1280, i32 0, metadata !318, metadata !863}
!875 = metadata !{i32 1281, i32 0, metadata !318, metadata !863}
!876 = metadata !{i32 1282, i32 0, metadata !318, metadata !863}
!877 = metadata !{i32 480, i32 0, metadata !343, null}
!878 = metadata !{i32 481, i32 0, metadata !343, null}
!879 = metadata !{i32 1131, i32 0, metadata !159, null}
!880 = metadata !{i32 1132, i32 0, metadata !159, null}
!881 = metadata !{i32 1133, i32 0, metadata !356, null}
!882 = metadata !{i32 1134, i32 0, metadata !356, null}
!883 = metadata !{i32 1136, i32 0, metadata !356, null}
!884 = metadata !{i32 1140, i32 0, metadata !356, null}
!885 = metadata !{i32 1137, i32 0, metadata !356, null}
!886 = metadata !{i32 1138, i32 0, metadata !356, null}
!887 = metadata !{i32 1143, i32 0, metadata !356, null}
!888 = metadata !{i32 1147, i32 0, metadata !356, null}
!889 = metadata !{i32 1144, i32 0, metadata !356, null}
!890 = metadata !{i32 1145, i32 0, metadata !356, null}
!891 = metadata !{i32 1150, i32 0, metadata !356, null}
!892 = metadata !{i32 1154, i32 0, metadata !356, null}
!893 = metadata !{i32 1151, i32 0, metadata !356, null}
!894 = metadata !{i32 1152, i32 0, metadata !356, null}
!895 = metadata !{i32 1157, i32 0, metadata !356, null}
!896 = metadata !{i32 1158, i32 0, metadata !356, null}
!897 = metadata !{i32 1159, i32 0, metadata !356, null}
!898 = metadata !{i32 1162, i32 0, metadata !356, null}
!899 = metadata !{i32 1163, i32 0, metadata !356, null}
!900 = metadata !{i32 64, i32 0, metadata !238, metadata !901}
!901 = metadata !{i32 1164, i32 0, metadata !366, null}
!902 = metadata !{i32 66, i32 0, metadata !237, metadata !901}
!903 = metadata !{i32 1165, i32 0, metadata !366, null}
!904 = metadata !{i32 63, i32 0, metadata !59, metadata !901}
!905 = metadata !{i32 1166, i32 0, metadata !366, null}
!906 = metadata !{i32 1167, i32 0, metadata !366, null}
!907 = metadata !{i32 1168, i32 0, metadata !366, null}
!908 = metadata !{i32 1170, i32 0, metadata !366, null}
!909 = metadata !{i32 1171, i32 0, metadata !366, null}
!910 = metadata !{i32 1172, i32 0, metadata !366, null}
!911 = metadata !{i32 1173, i32 0, metadata !366, null}
!912 = metadata !{i32 1175, i32 0, metadata !366, null}
!913 = metadata !{i32 1176, i32 0, metadata !366, null}
!914 = metadata !{i32 1177, i32 0, metadata !366, null}
!915 = metadata !{i32 1178, i32 0, metadata !366, null}
!916 = metadata !{i32 1183, i32 0, metadata !356, null}
!917 = metadata !{i32 1186, i32 0, metadata !368, null}
!918 = metadata !{i32 1188, i32 0, metadata !368, null}
!919 = metadata !{i32 1190, i32 0, metadata !368, null}
!920 = metadata !{i32 1193, i32 0, metadata !368, null}
!921 = metadata !{i32 1194, i32 0, metadata !368, null}
!922 = metadata !{i32 1195, i32 0, metadata !368, null}
!923 = metadata !{i32 1198, i32 0, metadata !368, null}
!924 = metadata !{i32 1201, i32 0, metadata !368, null}
!925 = metadata !{i32 64, i32 0, metadata !238, metadata !926}
!926 = metadata !{i32 1202, i32 0, metadata !371, null}
!927 = metadata !{i32 66, i32 0, metadata !237, metadata !926}
!928 = metadata !{i32 1203, i32 0, metadata !371, null}
!929 = metadata !{i32 1204, i32 0, metadata !371, null}
!930 = metadata !{i32 1205, i32 0, metadata !371, null}
!931 = metadata !{i32 1206, i32 0, metadata !371, null}
!932 = metadata !{i32 201, i32 0, metadata !179, null}
!933 = metadata !{i32 204, i32 0, metadata !374, null}
!934 = metadata !{i32 206, i32 0, metadata !374, null}
!935 = metadata !{i32 63, i32 0, metadata !59, metadata !936}
!936 = metadata !{i32 208, i32 0, metadata !374, null}
!937 = metadata !{i32 64, i32 0, metadata !238, metadata !936}
!938 = metadata !{i32 65, i32 0, metadata !237, metadata !936}
!939 = metadata !{i32 66, i32 0, metadata !237, metadata !936}
!940 = metadata !{i32 209, i32 0, metadata !374, null}
!941 = metadata !{i32 210, i32 0, metadata !374, null}
!942 = metadata !{i32 211, i32 0, metadata !374, null}
!943 = metadata !{i32 214, i32 0, metadata !374, null}
!944 = metadata !{i32 215, i32 0, metadata !374, null}
!945 = metadata !{i32 216, i32 0, metadata !374, null}
!946 = metadata !{i32 217, i32 0, metadata !374, null}
!947 = metadata !{i32 228, i32 0, metadata !374, null}
!948 = metadata !{i32 230, i32 0, metadata !374, null}
!949 = metadata !{i32 1016, i32 0, metadata !180, null}
!950 = metadata !{i32 63, i32 0, metadata !59, metadata !951}
!951 = metadata !{i32 1017, i32 0, metadata !379, null}
!952 = metadata !{i32 64, i32 0, metadata !238, metadata !951}
!953 = metadata !{i32 65, i32 0, metadata !237, metadata !951}
!954 = metadata !{i32 66, i32 0, metadata !237, metadata !951}
!955 = metadata !{i32 1019, i32 0, metadata !379, null}
!956 = metadata !{i32 1020, i32 0, metadata !379, null}
!957 = metadata !{i32 1021, i32 0, metadata !379, null}
!958 = metadata !{i32 1023, i32 0, metadata !381, null}
!959 = metadata !{i32 1024, i32 0, metadata !381, null}
!960 = metadata !{i32 201, i32 0, metadata !179, metadata !959}
!961 = metadata !{i32 204, i32 0, metadata !374, metadata !959}
!962 = metadata !{i32 206, i32 0, metadata !374, metadata !959}
!963 = metadata !{i32 63, i32 0, metadata !59, metadata !964}
!964 = metadata !{i32 208, i32 0, metadata !374, metadata !959}
!965 = metadata !{i32 64, i32 0, metadata !238, metadata !964}
!966 = metadata !{i32 65, i32 0, metadata !237, metadata !964}
!967 = metadata !{i32 209, i32 0, metadata !374, metadata !959}
!968 = metadata !{i32 210, i32 0, metadata !374, metadata !959}
!969 = metadata !{i32 211, i32 0, metadata !374, metadata !959}
!970 = metadata !{i32 214, i32 0, metadata !374, metadata !959}
!971 = metadata !{i32 215, i32 0, metadata !374, metadata !959}
!972 = metadata !{i32 216, i32 0, metadata !374, metadata !959}
!973 = metadata !{i32 217, i32 0, metadata !374, metadata !959}
!974 = metadata !{i32 228, i32 0, metadata !374, metadata !959}
!975 = metadata !{i32 230, i32 0, metadata !374, metadata !959}
!976 = metadata !{i32 1028, i32 0, metadata !381, null}
!977 = metadata !{i32 1030, i32 0, metadata !381, null}
!978 = metadata !{i32 1037, i32 0, metadata !381, null}
!979 = metadata !{i32 1041, i32 0, metadata !183, null}
!980 = metadata !{i32 63, i32 0, metadata !59, metadata !981}
!981 = metadata !{i32 1042, i32 0, metadata !384, null}
!982 = metadata !{i32 64, i32 0, metadata !238, metadata !981}
!983 = metadata !{i32 65, i32 0, metadata !237, metadata !981}
!984 = metadata !{i32 66, i32 0, metadata !237, metadata !981}
!985 = metadata !{i32 1043, i32 0, metadata !384, null}
!986 = metadata !{i32 1044, i32 0, metadata !384, null}
!987 = metadata !{i32 1045, i32 0, metadata !384, null}
!988 = metadata !{i32 1049, i32 0, metadata !386, null}
!989 = metadata !{i32 1048, i32 0, metadata !386, null}
!990 = metadata !{i32 1051, i32 0, metadata !386, null}
!991 = metadata !{i32 1052, i32 0, metadata !386, null}
!992 = metadata !{i32 1053, i32 0, metadata !386, null}
!993 = metadata !{i32 1055, i32 0, metadata !386, null}
!994 = metadata !{i32 908, i32 0, metadata !184, null}
!995 = metadata !{i32 910, i32 0, metadata !390, null}
!996 = metadata !{i32 63, i32 0, metadata !59, metadata !997}
!997 = metadata !{i32 909, i32 0, metadata !390, null}
!998 = metadata !{i32 64, i32 0, metadata !238, metadata !997}
!999 = metadata !{i32 65, i32 0, metadata !237, metadata !997}
!1000 = metadata !{i32 66, i32 0, metadata !237, metadata !997}
!1001 = metadata !{i32 913, i32 0, metadata !390, null}
!1002 = metadata !{i32 914, i32 0, metadata !390, null}
!1003 = metadata !{i32 915, i32 0, metadata !390, null}
!1004 = metadata !{i32 918, i32 0, metadata !390, null}
!1005 = metadata !{i32 922, i32 0, metadata !390, null}
!1006 = metadata !{i32 923, i32 0, metadata !390, null}
!1007 = metadata !{i32 924, i32 0, metadata !390, null}
!1008 = metadata !{i32 927, i32 0, metadata !390, null}
!1009 = metadata !{i32 928, i32 0, metadata !390, null}
!1010 = metadata !{i32 930, i32 0, metadata !396, null}
!1011 = metadata !{i32 931, i32 0, metadata !396, null}
!1012 = metadata !{i32 1}
!1013 = metadata !{i32 932, i32 0, metadata !396, null}
!1014 = metadata !{i32 936, i32 0, metadata !390, null}
!1015 = metadata !{i32 937, i32 0, metadata !390, null}
!1016 = metadata !{i32 938, i32 0, metadata !390, null}
!1017 = metadata !{i32 951, i32 0, metadata !390, null}
!1018 = metadata !{i32 952, i32 0, metadata !390, null}
!1019 = metadata !{i32 953, i32 0, metadata !390, null}
!1020 = metadata !{i32 956, i32 0, metadata !398, null}
!1021 = metadata !{i32 957, i32 0, metadata !398, null}
!1022 = metadata !{i32 958, i32 0, metadata !398, null}
!1023 = metadata !{i32 760, i32 0, metadata !185, null}
!1024 = metadata !{i32 763, i32 0, metadata !402, null}
!1025 = metadata !{i32 63, i32 0, metadata !59, metadata !1026}
!1026 = metadata !{i32 762, i32 0, metadata !402, null}
!1027 = metadata !{i32 64, i32 0, metadata !238, metadata !1026}
!1028 = metadata !{i32 65, i32 0, metadata !237, metadata !1026}
!1029 = metadata !{i32 66, i32 0, metadata !237, metadata !1026}
!1030 = metadata !{i32 770, i32 0, metadata !402, null}
!1031 = metadata !{i32 771, i32 0, metadata !402, null}
!1032 = metadata !{i32 772, i32 0, metadata !402, null}
!1033 = metadata !{i32 775, i32 0, metadata !402, null}
!1034 = metadata !{i32 776, i32 0, metadata !402, null}
!1035 = metadata !{i32 777, i32 0, metadata !402, null}
!1036 = metadata !{i32 779, i32 0, metadata !402, null}
!1037 = metadata !{i32 780, i32 0, metadata !406, null}
!1038 = metadata !{i32 782, i32 0, metadata !406, null}
!1039 = metadata !{i32 784, i32 0, metadata !430, null}
!1040 = metadata !{i32 786, i32 0, metadata !430, null}
!1041 = metadata !{i32 789, i32 0, metadata !430, null}
!1042 = metadata !{i32 792, i32 0, metadata !430, null}
!1043 = metadata !{i32 793, i32 0, metadata !430, null}
!1044 = metadata !{i32 794, i32 0, metadata !430, null}
!1045 = metadata !{i32 795, i32 0, metadata !430, null}
!1046 = metadata !{i32 796, i32 0, metadata !430, null}
!1047 = metadata !{i32 797, i32 0, metadata !430, null}
!1048 = metadata !{i32 798, i32 0, metadata !430, null}
!1049 = metadata !{i32 799, i32 0, metadata !430, null}
!1050 = metadata !{i32 800, i32 0, metadata !430, null}
!1051 = metadata !{i32 801, i32 0, metadata !430, null}
!1052 = metadata !{i32 802, i32 0, metadata !430, null}
!1053 = metadata !{i32 803, i32 0, metadata !430, null}
!1054 = metadata !{i32 804, i32 0, metadata !430, null}
!1055 = metadata !{i32 805, i32 0, metadata !430, null}
!1056 = metadata !{i32 806, i32 0, metadata !430, null}
!1057 = metadata !{i32 807, i32 0, metadata !430, null}
!1058 = metadata !{i32 808, i32 0, metadata !430, null}
!1059 = metadata !{i32 809, i32 0, metadata !430, null}
!1060 = metadata !{i32 810, i32 0, metadata !430, null}
!1061 = metadata !{i32 811, i32 0, metadata !430, null}
!1062 = metadata !{i32 812, i32 0, metadata !430, null}
!1063 = metadata !{i32 813, i32 0, metadata !430, null}
!1064 = metadata !{i32 814, i32 0, metadata !430, null}
!1065 = metadata !{i32 815, i32 0, metadata !430, null}
!1066 = metadata !{i32 816, i32 0, metadata !430, null}
!1067 = metadata !{i32 818, i32 0, metadata !430, null}
!1068 = metadata !{i32 819, i32 0, metadata !430, null}
!1069 = metadata !{i32 824, i32 0, metadata !406, null}
!1070 = metadata !{i32 825, i32 0, metadata !406, null}
!1071 = metadata !{i32 828, i32 0, metadata !406, null}
!1072 = metadata !{i32 829, i32 0, metadata !406, null}
!1073 = metadata !{i32 834, i32 0, metadata !406, null}
!1074 = metadata !{i32 835, i32 0, metadata !406, null}
!1075 = metadata !{i32 838, i32 0, metadata !406, null}
!1076 = metadata !{i32 839, i32 0, metadata !406, null}
!1077 = metadata !{i32 844, i32 0, metadata !406, null}
!1078 = metadata !{i32 845, i32 0, metadata !406, null}
!1079 = metadata !{i32 848, i32 0, metadata !406, null}
!1080 = metadata !{i32 849, i32 0, metadata !406, null}
!1081 = metadata !{i32 853, i32 0, metadata !448, null}
!1082 = metadata !{i32 854, i32 0, metadata !448, null}
!1083 = metadata !{i32 855, i32 0, metadata !448, null}
!1084 = metadata !{i32 856, i32 0, metadata !448, null}
!1085 = metadata !{i32 857, i32 0, metadata !448, null}
!1086 = metadata !{i32 860, i32 0, metadata !448, null}
!1087 = metadata !{i32 861, i32 0, metadata !448, null}
!1088 = metadata !{i32 866, i32 0, metadata !406, null}
!1089 = metadata !{i32 867, i32 0, metadata !406, null}
!1090 = metadata !{i32 868, i32 0, metadata !406, null}
!1091 = metadata !{i32 869, i32 0, metadata !406, null}
!1092 = metadata !{i32 871, i32 0, metadata !406, null}
!1093 = metadata !{i32 872, i32 0, metadata !406, null}
!1094 = metadata !{i32 876, i32 0, metadata !458, null}
!1095 = metadata !{i32 877, i32 0, metadata !458, null}
!1096 = metadata !{i32 878, i32 0, metadata !458, null}
!1097 = metadata !{i32 879, i32 0, metadata !458, null}
!1098 = metadata !{i32 880, i32 0, metadata !458, null}
!1099 = metadata !{i32 884, i32 0, metadata !458, null}
!1100 = metadata !{i32 886, i32 0, metadata !458, null}
!1101 = metadata !{i32 887, i32 0, metadata !458, null}
!1102 = metadata !{i32 891, i32 0, metadata !406, null}
!1103 = metadata !{i32 892, i32 0, metadata !406, null}
!1104 = metadata !{i32 893, i32 0, metadata !406, null}
!1105 = metadata !{i32 896, i32 0, metadata !406, null}
!1106 = metadata !{i32 897, i32 0, metadata !406, null}
!1107 = metadata !{i32 898, i32 0, metadata !406, null}
!1108 = metadata !{i32 901, i32 0, metadata !461, null}
!1109 = metadata !{i32 902, i32 0, metadata !461, null}
!1110 = metadata !{i32 903, i32 0, metadata !461, null}
!1111 = metadata !{i32 676, i32 0, metadata !188, null}
!1112 = metadata !{i32 63, i32 0, metadata !59, metadata !1113}
!1113 = metadata !{i32 677, i32 0, metadata !466, null}
!1114 = metadata !{i32 64, i32 0, metadata !238, metadata !1113}
!1115 = metadata !{i32 65, i32 0, metadata !237, metadata !1113}
!1116 = metadata !{i32 66, i32 0, metadata !237, metadata !1113}
!1117 = metadata !{i32 679, i32 0, metadata !466, null}
!1118 = metadata !{i32 680, i32 0, metadata !466, null}
!1119 = metadata !{i32 681, i32 0, metadata !466, null}
!1120 = metadata !{i32 684, i32 0, metadata !466, null}
!1121 = metadata !{i32 685, i32 0, metadata !466, null}
!1122 = metadata !{i32 686, i32 0, metadata !466, null}
!1123 = metadata !{i32 687, i32 0, metadata !466, null}
!1124 = metadata !{i32 689, i32 0, metadata !466, null}
!1125 = metadata !{i32 691, i32 0, metadata !468, null}
!1126 = metadata !{i32 694, i32 0, metadata !468, null}
!1127 = metadata !{i32 695, i32 0, metadata !468, null}
!1128 = metadata !{i32 700, i32 0, metadata !468, null}
!1129 = metadata !{i32 697, i32 0, metadata !468, null}
!1130 = metadata !{i32 698, i32 0, metadata !468, null}
!1131 = metadata !{i32 701, i32 0, metadata !472, null}
!1132 = metadata !{i32 702, i32 0, metadata !472, null}
!1133 = metadata !{i32 703, i32 0, metadata !472, null}
!1134 = metadata !{i32 704, i32 0, metadata !472, null}
!1135 = metadata !{i32 705, i32 0, metadata !472, null}
!1136 = metadata !{i32 706, i32 0, metadata !472, null}
!1137 = metadata !{i32 707, i32 0, metadata !472, null}
!1138 = metadata !{i32 708, i32 0, metadata !472, null}
!1139 = metadata !{i32 709, i32 0, metadata !472, null}
!1140 = metadata !{i32 713, i32 0, metadata !468, null}
!1141 = metadata !{i32 714, i32 0, metadata !468, null}
!1142 = metadata !{i32 715, i32 0, metadata !468, null}
!1143 = metadata !{i32 716, i32 0, metadata !468, null}
!1144 = metadata !{i32 717, i32 0, metadata !468, null}
!1145 = metadata !{i32 718, i32 0, metadata !468, null}
!1146 = metadata !{i32 719, i32 0, metadata !468, null}
!1147 = metadata !{i32 720, i32 0, metadata !468, null}
!1148 = metadata !{i32 721, i32 0, metadata !468, null}
!1149 = metadata !{i32 723, i32 0, metadata !474, null}
!1150 = metadata !{i32 733, i32 0, metadata !474, null}
!1151 = metadata !{i32 734, i32 0, metadata !474, null}
!1152 = metadata !{i32 735, i32 0, metadata !474, null}
!1153 = metadata !{i32 736, i32 0, metadata !474, null}
!1154 = metadata !{i32 737, i32 0, metadata !474, null}
!1155 = metadata !{i32 738, i32 0, metadata !474, null}
!1156 = metadata !{i32 740, i32 0, metadata !478, null}
!1157 = metadata !{i32 742, i32 0, metadata !478, null}
!1158 = metadata !{i32 746, i32 0, metadata !478, null}
!1159 = metadata !{i32 748, i32 0, metadata !480, null}
!1160 = metadata !{i32 749, i32 0, metadata !480, null}
!1161 = metadata !{i32 373, i32 0, metadata !205, null}
!1162 = metadata !{i32 63, i32 0, metadata !59, metadata !1163}
!1163 = metadata !{i32 375, i32 0, metadata !485, null}
!1164 = metadata !{i32 64, i32 0, metadata !238, metadata !1163}
!1165 = metadata !{i32 65, i32 0, metadata !237, metadata !1163}
!1166 = metadata !{i32 66, i32 0, metadata !237, metadata !1163}
!1167 = metadata !{i32 377, i32 0, metadata !485, null}
!1168 = metadata !{i32 378, i32 0, metadata !485, null}
!1169 = metadata !{i32 379, i32 0, metadata !485, null}
!1170 = metadata !{i32 382, i32 0, metadata !485, null}
!1171 = metadata !{i32 389, i32 0, metadata !485, null}
!1172 = metadata !{i32 390, i32 0, metadata !485, null}
!1173 = metadata !{i32 392, i32 0, metadata !485, null}
!1174 = metadata !{i32 396, i32 0, metadata !485, null}
!1175 = metadata !{i32 397, i32 0, metadata !485, null}
!1176 = metadata !{i32 398, i32 0, metadata !485, null}
!1177 = metadata !{i32 402, i32 0, metadata !485, null}
!1178 = metadata !{i32 403, i32 0, metadata !485, null}
!1179 = metadata !{i32 404, i32 0, metadata !485, null}
!1180 = metadata !{i32 407, i32 0, metadata !485, null}
!1181 = metadata !{i32 408, i32 0, metadata !485, null}
!1182 = metadata !{i32 411, i32 0, metadata !485, null}
!1183 = metadata !{i32 413, i32 0, metadata !485, null}
!1184 = metadata !{i32 414, i32 0, metadata !485, null}
!1185 = metadata !{i32 416, i32 0, metadata !485, null}
!1186 = metadata !{i32 417, i32 0, metadata !485, null}
!1187 = metadata !{i32 421, i32 0, metadata !485, null}
!1188 = metadata !{i32 422, i32 0, metadata !485, null}
!1189 = metadata !{i32 423, i32 0, metadata !485, null}
!1190 = metadata !{i32 426, i32 0, metadata !485, null}
!1191 = metadata !{i32 427, i32 0, metadata !485, null}
!1192 = metadata !{i32 620, i32 0, metadata !208, null}
!1193 = metadata !{i32 63, i32 0, metadata !59, metadata !1194}
!1194 = metadata !{i32 621, i32 0, metadata !490, null}
!1195 = metadata !{i32 64, i32 0, metadata !238, metadata !1194}
!1196 = metadata !{i32 65, i32 0, metadata !237, metadata !1194}
!1197 = metadata !{i32 66, i32 0, metadata !237, metadata !1194}
!1198 = metadata !{i32 623, i32 0, metadata !490, null}
!1199 = metadata !{i32 624, i32 0, metadata !490, null}
!1200 = metadata !{i32 625, i32 0, metadata !490, null}
!1201 = metadata !{i32 628, i32 0, metadata !490, null}
!1202 = metadata !{i32 632, i32 0, metadata !492, null}
!1203 = metadata !{i32 634, i32 0, metadata !492, null}
!1204 = metadata !{i32 635, i32 0, metadata !492, null}
!1205 = metadata !{i32 639, i32 0, metadata !490, null}
!1206 = metadata !{i32 640, i32 0, metadata !490, null}
!1207 = metadata !{i32 449, i32 0, metadata !209, null}
!1208 = metadata !{i32 39, i32 0, metadata !0, metadata !1209}
!1209 = metadata !{i32 450, i32 0, metadata !496, null}
!1210 = metadata !{i32 40, i32 0, metadata !231, metadata !1209}
!1211 = metadata !{i32 43, i32 0, metadata !231, metadata !1209}
!1212 = metadata !{i32 46, i32 0, metadata !231, metadata !1209}
!1213 = metadata !{i32 47, i32 0, metadata !231, metadata !1209}
!1214 = metadata !{i32 48, i32 0, metadata !234, metadata !1209}
!1215 = metadata !{i32 49, i32 0, metadata !234, metadata !1209}
!1216 = metadata !{i32 451, i32 0, metadata !496, null}
!1217 = metadata !{i32 452, i32 0, metadata !496, null}
!1218 = metadata !{i32 453, i32 0, metadata !496, null}
!1219 = metadata !{i32 1265, i32 0, metadata !145, metadata !1220}
!1220 = metadata !{i32 460, i32 0, metadata !498, null}
!1221 = metadata !{i32 1252, i32 0, metadata !135, metadata !1222}
!1222 = metadata !{i32 1266, i32 0, metadata !313, metadata !1220}
!1223 = metadata !{i32 1254, i32 0, metadata !303, metadata !1222}
!1224 = metadata !{i32 1255, i32 0, metadata !303, metadata !1222}
!1225 = metadata !{i32 1269, i32 0, metadata !313, metadata !1220}
!1226 = metadata !{i32 1270, i32 0, metadata !316, metadata !1220}
!1227 = metadata !{i32 1271, i32 0, metadata !316, metadata !1220}
!1228 = metadata !{i32 1273, i32 0, metadata !316, metadata !1220}
!1229 = metadata !{i32 1276, i32 0, metadata !316, metadata !1220}
!1230 = metadata !{i32 1279, i32 0, metadata !318, metadata !1220}
!1231 = metadata !{i32 1280, i32 0, metadata !318, metadata !1220}
!1232 = metadata !{i32 1281, i32 0, metadata !318, metadata !1220}
!1233 = metadata !{i32 1282, i32 0, metadata !318, metadata !1220}
!1234 = metadata !{i32 462, i32 0, metadata !498, null}
!1235 = metadata !{i32 463, i32 0, metadata !498, null}
!1236 = metadata !{i32 430, i32 0, metadata !212, null}
!1237 = metadata !{i32 39, i32 0, metadata !0, metadata !1238}
!1238 = metadata !{i32 431, i32 0, metadata !502, null}
!1239 = metadata !{i32 40, i32 0, metadata !231, metadata !1238}
!1240 = metadata !{i32 43, i32 0, metadata !231, metadata !1238}
!1241 = metadata !{i32 46, i32 0, metadata !231, metadata !1238}
!1242 = metadata !{i32 47, i32 0, metadata !231, metadata !1238}
!1243 = metadata !{i32 48, i32 0, metadata !234, metadata !1238}
!1244 = metadata !{i32 49, i32 0, metadata !234, metadata !1238}
!1245 = metadata !{i32 432, i32 0, metadata !502, null}
!1246 = metadata !{i32 433, i32 0, metadata !502, null}
!1247 = metadata !{i32 434, i32 0, metadata !502, null}
!1248 = metadata !{i32 1265, i32 0, metadata !145, metadata !1249}
!1249 = metadata !{i32 441, i32 0, metadata !504, null}
!1250 = metadata !{i32 1252, i32 0, metadata !135, metadata !1251}
!1251 = metadata !{i32 1266, i32 0, metadata !313, metadata !1249}
!1252 = metadata !{i32 1254, i32 0, metadata !303, metadata !1251}
!1253 = metadata !{i32 1255, i32 0, metadata !303, metadata !1251}
!1254 = metadata !{i32 1269, i32 0, metadata !313, metadata !1249}
!1255 = metadata !{i32 1270, i32 0, metadata !316, metadata !1249}
!1256 = metadata !{i32 1271, i32 0, metadata !316, metadata !1249}
!1257 = metadata !{i32 1273, i32 0, metadata !316, metadata !1249}
!1258 = metadata !{i32 1276, i32 0, metadata !316, metadata !1249}
!1259 = metadata !{i32 1279, i32 0, metadata !318, metadata !1249}
!1260 = metadata !{i32 1280, i32 0, metadata !318, metadata !1249}
!1261 = metadata !{i32 1281, i32 0, metadata !318, metadata !1249}
!1262 = metadata !{i32 1282, i32 0, metadata !318, metadata !1249}
!1263 = metadata !{i32 443, i32 0, metadata !504, null}
!1264 = metadata !{i32 444, i32 0, metadata !504, null}
!1265 = metadata !{i32 233, i32 0, metadata !213, null}
!1266 = metadata !{i32 237, i32 0, metadata !509, null}
!1267 = metadata !{i32 239, i32 0, metadata !509, null}
!1268 = metadata !{i32 242, i32 0, metadata !509, null}
!1269 = metadata !{i32 243, i32 0, metadata !509, null}
!1270 = metadata !{i32 244, i32 0, metadata !509, null}
!1271 = metadata !{i32 63, i32 0, metadata !59, metadata !1272}
!1272 = metadata !{i32 247, i32 0, metadata !509, null}
!1273 = metadata !{i32 64, i32 0, metadata !238, metadata !1272}
!1274 = metadata !{i32 65, i32 0, metadata !237, metadata !1272}
!1275 = metadata !{i32 66, i32 0, metadata !237, metadata !1272}
!1276 = metadata !{i32 249, i32 0, metadata !509, null}
!1277 = metadata !{i32 250, i32 0, metadata !509, null}
!1278 = metadata !{i32 251, i32 0, metadata !509, null}
!1279 = metadata !{i32 254, i32 0, metadata !509, null}
!1280 = metadata !{i32 255, i32 0, metadata !509, null}
!1281 = metadata !{i32 256, i32 0, metadata !509, null}
!1282 = metadata !{i32 257, i32 0, metadata !509, null}
!1283 = metadata !{i32 260, i32 0, metadata !509, null}
!1284 = metadata !{i32 1252, i32 0, metadata !135, metadata !1285}
!1285 = metadata !{i32 263, i32 0, metadata !511, null}
!1286 = metadata !{i32 1254, i32 0, metadata !303, metadata !1285}
!1287 = metadata !{i32 1255, i32 0, metadata !303, metadata !1285}
!1288 = metadata !{i32 1259, i32 0, metadata !139, metadata !1289}
!1289 = metadata !{i32 264, i32 0, metadata !511, null}
!1290 = metadata !{i32 1260, i32 0, metadata !306, metadata !1289}
!1291 = metadata !{i32 1261, i32 0, metadata !306, metadata !1289}
!1292 = metadata !{i32 268, i32 0, metadata !511, null}
!1293 = metadata !{i32 269, i32 0, metadata !511, null}
!1294 = metadata !{i32 270, i32 0, metadata !511, null}
!1295 = metadata !{i32 272, i32 0, metadata !511, null}
!1296 = metadata !{i32 274, i32 0, metadata !511, null}
!1297 = metadata !{i32 275, i32 0, metadata !511, null}
!1298 = metadata !{i32 276, i32 0, metadata !511, null}
!1299 = metadata !{i32 279, i32 0, metadata !511, null}
!1300 = metadata !{i32 280, i32 0, metadata !511, null}
!1301 = metadata !{i32 284, i32 0, metadata !509, null}
!1302 = metadata !{i32 285, i32 0, metadata !509, null}
!1303 = metadata !{i32 289, i32 0, metadata !509, null}
!1304 = metadata !{i32 290, i32 0, metadata !509, null}
!1305 = metadata !{i32 293, i32 0, metadata !509, null}
!1306 = metadata !{i32 294, i32 0, metadata !509, null}
!1307 = metadata !{i32 296, i32 0, metadata !509, null}
!1308 = metadata !{i32 240, i32 0, metadata !509, null}
!1309 = metadata !{i32 542, i32 0, metadata !219, null}
!1310 = metadata !{i32 63, i32 0, metadata !59, metadata !1311}
!1311 = metadata !{i32 545, i32 0, metadata !517, null}
!1312 = metadata !{i32 64, i32 0, metadata !238, metadata !1311}
!1313 = metadata !{i32 65, i32 0, metadata !237, metadata !1311}
!1314 = metadata !{i32 66, i32 0, metadata !237, metadata !1311}
!1315 = metadata !{i32 547, i32 0, metadata !517, null}
!1316 = metadata !{i32 548, i32 0, metadata !517, null}
!1317 = metadata !{i32 549, i32 0, metadata !517, null}
!1318 = metadata !{i32 552, i32 0, metadata !517, null}
!1319 = metadata !{i32 553, i32 0, metadata !517, null}
!1320 = metadata !{i32 554, i32 0, metadata !517, null}
!1321 = metadata !{i32 555, i32 0, metadata !517, null}
!1322 = metadata !{i32 556, i32 0, metadata !517, null}
!1323 = metadata !{i32 559, i32 0, metadata !517, null}
!1324 = metadata !{i32 507, i32 0, metadata !216, metadata !1325}
!1325 = metadata !{i32 560, i32 0, metadata !517, null}
!1326 = metadata !{i32 508, i32 0, metadata !1327, metadata !1325}
!1327 = metadata !{i32 589835, metadata !216, i32 507, i32 0, metadata !1, i32 71} ; [ DW_TAG_lexical_block ]
!1328 = metadata !{i32 509, i32 0, metadata !1327, metadata !1325}
!1329 = metadata !{i32 510, i32 0, metadata !1327, metadata !1325}
!1330 = metadata !{i32 511, i32 0, metadata !1327, metadata !1325}
!1331 = metadata !{i32 513, i32 0, metadata !1327, metadata !1325}
!1332 = metadata !{i32 515, i32 0, metadata !1327, metadata !1325}
!1333 = metadata !{i32 516, i32 0, metadata !1327, metadata !1325}
!1334 = metadata !{i32 562, i32 0, metadata !519, null}
!1335 = metadata !{i32 563, i32 0, metadata !519, null}
!1336 = metadata !{i32 564, i32 0, metadata !519, null}
!1337 = metadata !{i32 520, i32 0, metadata !222, null}
!1338 = metadata !{i32 39, i32 0, metadata !0, metadata !1339}
!1339 = metadata !{i32 523, i32 0, metadata !523, null}
!1340 = metadata !{i32 40, i32 0, metadata !231, metadata !1339}
!1341 = metadata !{i32 43, i32 0, metadata !231, metadata !1339}
!1342 = metadata !{i32 46, i32 0, metadata !231, metadata !1339}
!1343 = metadata !{i32 47, i32 0, metadata !231, metadata !1339}
!1344 = metadata !{i32 48, i32 0, metadata !234, metadata !1339}
!1345 = metadata !{i32 49, i32 0, metadata !234, metadata !1339}
!1346 = metadata !{i32 51, i32 0, metadata !234, metadata !1339}
!1347 = metadata !{i32 525, i32 0, metadata !523, null}
!1348 = metadata !{i32 526, i32 0, metadata !523, null}
!1349 = metadata !{i32 527, i32 0, metadata !523, null}
!1350 = metadata !{i32 528, i32 0, metadata !523, null}
!1351 = metadata !{i32 529, i32 0, metadata !523, null}
!1352 = metadata !{i32 532, i32 0, metadata !523, null}
!1353 = metadata !{i32 507, i32 0, metadata !216, metadata !1354}
!1354 = metadata !{i32 533, i32 0, metadata !523, null}
!1355 = metadata !{i32 508, i32 0, metadata !1327, metadata !1354}
!1356 = metadata !{i32 509, i32 0, metadata !1327, metadata !1354}
!1357 = metadata !{i32 510, i32 0, metadata !1327, metadata !1354}
!1358 = metadata !{i32 511, i32 0, metadata !1327, metadata !1354}
!1359 = metadata !{i32 513, i32 0, metadata !1327, metadata !1354}
!1360 = metadata !{i32 515, i32 0, metadata !1327, metadata !1354}
!1361 = metadata !{i32 516, i32 0, metadata !1327, metadata !1354}
!1362 = metadata !{i32 1265, i32 0, metadata !145, metadata !1363}
!1363 = metadata !{i32 535, i32 0, metadata !525, null}
!1364 = metadata !{i32 1252, i32 0, metadata !135, metadata !1365}
!1365 = metadata !{i32 1266, i32 0, metadata !313, metadata !1363}
!1366 = metadata !{i32 1254, i32 0, metadata !303, metadata !1365}
!1367 = metadata !{i32 1255, i32 0, metadata !303, metadata !1365}
!1368 = metadata !{i32 1269, i32 0, metadata !313, metadata !1363}
!1369 = metadata !{i32 1270, i32 0, metadata !316, metadata !1363}
!1370 = metadata !{i32 1271, i32 0, metadata !316, metadata !1363}
!1371 = metadata !{i32 1273, i32 0, metadata !316, metadata !1363}
!1372 = metadata !{i32 1276, i32 0, metadata !316, metadata !1363}
!1373 = metadata !{i32 1279, i32 0, metadata !318, metadata !1363}
!1374 = metadata !{i32 1280, i32 0, metadata !318, metadata !1363}
!1375 = metadata !{i32 1281, i32 0, metadata !318, metadata !1363}
!1376 = metadata !{i32 1282, i32 0, metadata !318, metadata !1363}
!1377 = metadata !{i32 536, i32 0, metadata !525, null}
!1378 = metadata !{i32 537, i32 0, metadata !525, null}
!1379 = metadata !{i32 301, i32 0, metadata !225, null}
!1380 = metadata !{i32 305, i32 0, metadata !530, null}
!1381 = metadata !{i32 63, i32 0, metadata !59, metadata !1382}
!1382 = metadata !{i32 307, i32 0, metadata !530, null}
!1383 = metadata !{i32 64, i32 0, metadata !238, metadata !1382}
!1384 = metadata !{i32 65, i32 0, metadata !237, metadata !1382}
!1385 = metadata !{i32 66, i32 0, metadata !237, metadata !1382}
!1386 = metadata !{i32 309, i32 0, metadata !530, null}
!1387 = metadata !{i32 310, i32 0, metadata !530, null}
!1388 = metadata !{i32 311, i32 0, metadata !530, null}
!1389 = metadata !{i32 314, i32 0, metadata !530, null}
!1390 = metadata !{i32 315, i32 0, metadata !530, null}
!1391 = metadata !{i32 316, i32 0, metadata !530, null}
!1392 = metadata !{i32 317, i32 0, metadata !530, null}
!1393 = metadata !{i32 320, i32 0, metadata !530, null}
!1394 = metadata !{i32 1252, i32 0, metadata !135, metadata !1395}
!1395 = metadata !{i32 323, i32 0, metadata !532, null}
!1396 = metadata !{i32 1254, i32 0, metadata !303, metadata !1395}
!1397 = metadata !{i32 1255, i32 0, metadata !303, metadata !1395}
!1398 = metadata !{i32 1259, i32 0, metadata !139, metadata !1399}
!1399 = metadata !{i32 324, i32 0, metadata !532, null}
!1400 = metadata !{i32 1260, i32 0, metadata !306, metadata !1399}
!1401 = metadata !{i32 1261, i32 0, metadata !306, metadata !1399}
!1402 = metadata !{i32 328, i32 0, metadata !532, null}
!1403 = metadata !{i32 329, i32 0, metadata !532, null}
!1404 = metadata !{i32 330, i32 0, metadata !532, null}
!1405 = metadata !{i32 331, i32 0, metadata !532, null}
!1406 = metadata !{i32 333, i32 0, metadata !532, null}
!1407 = metadata !{i32 334, i32 0, metadata !532, null}
!1408 = metadata !{i32 335, i32 0, metadata !532, null}
!1409 = metadata !{i32 338, i32 0, metadata !532, null}
!1410 = metadata !{i32 339, i32 0, metadata !532, null}
!1411 = metadata !{i32 340, i32 0, metadata !532, null}
!1412 = metadata !{i32 346, i32 0, metadata !534, null}
!1413 = metadata !{i32 347, i32 0, metadata !534, null}
!1414 = metadata !{i32 350, i32 0, metadata !534, null}
!1415 = metadata !{i32 351, i32 0, metadata !534, null}
!1416 = metadata !{i32 353, i32 0, metadata !534, null}
!1417 = metadata !{i32 354, i32 0, metadata !534, null}
!1418 = metadata !{i32 358, i32 0, metadata !534, null}
!1419 = metadata !{i32 359, i32 0, metadata !534, null}
!1420 = metadata !{i32 361, i32 0, metadata !534, null}
!1421 = metadata !{i32 362, i32 0, metadata !534, null}
!1422 = metadata !{i32 364, i32 0, metadata !534, null}
!1423 = metadata !{i32 365, i32 0, metadata !534, null}
!1424 = metadata !{i32 367, i32 0, metadata !534, null}
!1425 = metadata !{i32 368, i32 0, metadata !534, null}
!1426 = metadata !{i32 128, i32 0, metadata !226, null}
!1427 = metadata !{i32 133, i32 0, metadata !539, null}
!1428 = metadata !{i32 134, i32 0, metadata !539, null}
!1429 = metadata !{i32 136, i32 0, metadata !539, null}
!1430 = metadata !{i32 137, i32 0, metadata !539, null}
!1431 = metadata !{i32 138, i32 0, metadata !539, null}
!1432 = metadata !{i32 141, i32 0, metadata !539, null}
!1433 = metadata !{i32 144, i32 0, metadata !539, null}
!1434 = metadata !{i32 39, i32 0, metadata !0, metadata !1435}
!1435 = metadata !{i32 146, i32 0, metadata !539, null}
!1436 = metadata !{i32 40, i32 0, metadata !231, metadata !1435}
!1437 = metadata !{i32 43, i32 0, metadata !231, metadata !1435}
!1438 = metadata !{i32 46, i32 0, metadata !231, metadata !1435}
!1439 = metadata !{i32 47, i32 0, metadata !231, metadata !1435}
!1440 = metadata !{i32 48, i32 0, metadata !234, metadata !1435}
!1441 = metadata !{i32 49, i32 0, metadata !234, metadata !1435}
!1442 = metadata !{i32 147, i32 0, metadata !539, null}
!1443 = metadata !{i32 150, i32 0, metadata !539, null}
!1444 = metadata !{i32 153, i32 0, metadata !539, null}
!1445 = metadata !{i32 154, i32 0, metadata !539, null}
!1446 = metadata !{i32 168, i32 0, metadata !539, null}
!1447 = metadata !{i32 169, i32 0, metadata !539, null}
!1448 = metadata !{i32 170, i32 0, metadata !539, null}
!1449 = metadata !{i32 173, i32 0, metadata !539, null}
!1450 = metadata !{i32 97, i32 0, metadata !77, metadata !1449}
!1451 = metadata !{i32 99, i32 0, metadata !245, metadata !1449}
!1452 = metadata !{i32 101, i32 0, metadata !245, metadata !1449}
!1453 = metadata !{i32 107, i32 0, metadata !245, metadata !1449}
!1454 = metadata !{i32 118, i32 0, metadata !245, metadata !1449}
!1455 = metadata !{i32 121, i32 0, metadata !245, metadata !1449}
!1456 = metadata !{i32 174, i32 0, metadata !539, null}
!1457 = metadata !{i32 175, i32 0, metadata !539, null}
!1458 = metadata !{i32 178, i32 0, metadata !539, null}
!1459 = metadata !{i32 1265, i32 0, metadata !145, metadata !1460}
!1460 = metadata !{i32 181, i32 0, metadata !543, null}
!1461 = metadata !{i32 1252, i32 0, metadata !135, metadata !1462}
!1462 = metadata !{i32 1266, i32 0, metadata !313, metadata !1460}
!1463 = metadata !{i32 1254, i32 0, metadata !303, metadata !1462}
!1464 = metadata !{i32 1255, i32 0, metadata !303, metadata !1462}
!1465 = metadata !{i32 1269, i32 0, metadata !313, metadata !1460}
!1466 = metadata !{i32 1270, i32 0, metadata !316, metadata !1460}
!1467 = metadata !{i32 1271, i32 0, metadata !316, metadata !1460}
!1468 = metadata !{i32 1273, i32 0, metadata !316, metadata !1460}
!1469 = metadata !{i32 1276, i32 0, metadata !316, metadata !1460}
!1470 = metadata !{i32 1279, i32 0, metadata !318, metadata !1460}
!1471 = metadata !{i32 1280, i32 0, metadata !318, metadata !1460}
!1472 = metadata !{i32 1281, i32 0, metadata !318, metadata !1460}
!1473 = metadata !{i32 1282, i32 0, metadata !318, metadata !1460}
!1474 = metadata !{i32 182, i32 0, metadata !543, null}
!1475 = metadata !{i32 183, i32 0, metadata !543, null}
!1476 = metadata !{i32 184, i32 0, metadata !543, null}
!1477 = metadata !{i32 186, i32 0, metadata !543, null}
!1478 = metadata !{i32 190, i32 0, metadata !539, null}
!1479 = metadata !{i32 189, i32 0, metadata !539, null}
!1480 = metadata !{i32 191, i32 0, metadata !539, null}
!1481 = metadata !{i32 193, i32 0, metadata !539, null}
!1482 = metadata !{i32 195, i32 0, metadata !539, null}
