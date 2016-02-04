; ModuleID = 'fd_64.c'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:32:64-f32:32:32-f64:32:64-v64:64:64-v128:128:128-a0:0:64-f80:32:32-f128:128:128-n8:16:32"
target triple = "i386-pc-linux-gnu"

%struct.__fsid_t = type { [2 x i32] }
%struct.dirent = type { i64, i64, i16, i8, [256 x i8] }
%struct.stat = type { i64, i16, i32, i32, i32, i32, i32, i64, i16, i64, i32, i64, %struct.timespec, %struct.timespec, %struct.timespec, i64 }
%struct.stat64 = type { i64, i32, i32, i32, i32, i32, i32, i64, i32, i64, i32, i64, %struct.timespec, %struct.timespec, %struct.timespec, i64 }
%struct.statfs = type { i32, i32, i64, i64, i64, i64, i64, %struct.__fsid_t, i32, i32, [5 x i32] }
%struct.timespec = type { i32, i32 }

@__getdents64 = alias i32 (i32, %struct.dirent*, i32)* @getdents64

define i32 @"\01open64"(i8* %pathname, i32 %flags, ...) nounwind {
entry:
  %ap = alloca i8*, align 4
  call void @llvm.dbg.value(metadata !{i8* %pathname}, i64 0, metadata !145), !dbg !155
  call void @llvm.dbg.value(metadata !{i32 %flags}, i64 0, metadata !146), !dbg !155
  call void @llvm.dbg.value(metadata !156, i64 0, metadata !147), !dbg !157
  %0 = and i32 %flags, 64, !dbg !158
  %1 = icmp eq i32 %0, 0, !dbg !158
  br i1 %1, label %bb3, label %bb, !dbg !158

bb:                                               ; preds = %entry
  call void @llvm.dbg.declare(metadata !{i8** %ap}, metadata !150), !dbg !159
  %ap1 = bitcast i8** %ap to i8*, !dbg !160
  call void @llvm.va_start(i8* %ap1), !dbg !160
  %2 = load i8** %ap, align 4, !dbg !161
  %3 = getelementptr inbounds i8* %2, i32 4, !dbg !161
  store i8* %3, i8** %ap, align 4, !dbg !161
  %4 = bitcast i8* %2 to i32*, !dbg !161
  %5 = load i32* %4, align 4, !dbg !161
  call void @llvm.dbg.value(metadata !{i32 %5}, i64 0, metadata !147), !dbg !161
  call void @llvm.va_end(i8* %ap1), !dbg !162
  br label %bb3, !dbg !162

bb3:                                              ; preds = %entry, %bb
  %mode.0 = phi i32 [ %5, %bb ], [ 0, %entry ]
  %6 = call i32 @__fd_open(i8* %pathname, i32 %flags, i32 %mode.0) nounwind, !dbg !163
  ret i32 %6, !dbg !163
}

define i32 @getdents64(i32 %fd, %struct.dirent* %dirp, i32 %count) nounwind {
entry:
  tail call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !120), !dbg !164
  tail call void @llvm.dbg.value(metadata !{%struct.dirent* %dirp}, i64 0, metadata !121), !dbg !164
  tail call void @llvm.dbg.value(metadata !{i32 %count}, i64 0, metadata !122), !dbg !164
  %0 = tail call i32 @__fd_getdents(i32 %fd, %struct.dirent* %dirp, i32 %count) nounwind, !dbg !165
  ret i32 %0, !dbg !165
}

declare void @llvm.dbg.declare(metadata, metadata) nounwind readnone

declare i32 @__fd_getdents(i32, %struct.dirent*, i32)

declare void @llvm.dbg.value(metadata, i64, metadata) nounwind readnone

define weak i32 @"\01statfs64"(i8* %path, %struct.statfs* %buf) nounwind {
entry:
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !123), !dbg !167
  tail call void @llvm.dbg.value(metadata !{%struct.statfs* %buf}, i64 0, metadata !124), !dbg !167
  %0 = tail call i32 @__fd_statfs(i8* %path, %struct.statfs* %buf) nounwind, !dbg !168
  ret i32 %0, !dbg !168
}

declare i32 @__fd_statfs(i8*, %struct.statfs*)

define i32 @ftruncate64(i32 %fd, i64 %length) nounwind {
entry:
  tail call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !125), !dbg !170
  tail call void @llvm.dbg.value(metadata !{i64 %length}, i64 0, metadata !126), !dbg !170
  %0 = tail call i32 @__fd_ftruncate(i32 %fd, i64 %length) nounwind, !dbg !171
  ret i32 %0, !dbg !171
}

declare i32 @__fd_ftruncate(i32, i64)

define i32 @"\01fstat64"(i32 %fd, %struct.stat* %buf) nounwind {
entry:
  tail call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !127), !dbg !173
  tail call void @llvm.dbg.value(metadata !{%struct.stat* %buf}, i64 0, metadata !128), !dbg !173
  %0 = bitcast %struct.stat* %buf to %struct.stat64*, !dbg !174
  %1 = tail call i32 @__fd_fstat(i32 %fd, %struct.stat64* %0) nounwind, !dbg !174
  ret i32 %1, !dbg !174
}

declare i32 @__fd_fstat(i32, %struct.stat64*)

define i32 @"\01__fxstat64"(i32 %vers, i32 %fd, %struct.stat* %buf) nounwind {
entry:
  tail call void @llvm.dbg.value(metadata !{i32 %vers}, i64 0, metadata !129), !dbg !176
  tail call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !130), !dbg !176
  tail call void @llvm.dbg.value(metadata !{%struct.stat* %buf}, i64 0, metadata !131), !dbg !176
  %0 = bitcast %struct.stat* %buf to %struct.stat64*, !dbg !177
  %1 = tail call i32 @__fd_fstat(i32 %fd, %struct.stat64* %0) nounwind, !dbg !177
  ret i32 %1, !dbg !177
}

define i32 @"\01lstat64"(i8* %path, %struct.stat* %buf) nounwind {
entry:
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !132), !dbg !179
  tail call void @llvm.dbg.value(metadata !{%struct.stat* %buf}, i64 0, metadata !133), !dbg !179
  %0 = bitcast %struct.stat* %buf to %struct.stat64*, !dbg !180
  %1 = tail call i32 @__fd_lstat(i8* %path, %struct.stat64* %0) nounwind, !dbg !180
  ret i32 %1, !dbg !180
}

declare i32 @__fd_lstat(i8*, %struct.stat64*)

define i32 @"\01__lxstat64"(i32 %vers, i8* %path, %struct.stat* %buf) nounwind {
entry:
  tail call void @llvm.dbg.value(metadata !{i32 %vers}, i64 0, metadata !134), !dbg !182
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !135), !dbg !182
  tail call void @llvm.dbg.value(metadata !{%struct.stat* %buf}, i64 0, metadata !136), !dbg !182
  %0 = bitcast %struct.stat* %buf to %struct.stat64*, !dbg !183
  %1 = tail call i32 @__fd_lstat(i8* %path, %struct.stat64* %0) nounwind, !dbg !183
  ret i32 %1, !dbg !183
}

define i32 @"\01stat64"(i8* %path, %struct.stat* %buf) nounwind {
entry:
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !137), !dbg !185
  tail call void @llvm.dbg.value(metadata !{%struct.stat* %buf}, i64 0, metadata !138), !dbg !185
  %0 = bitcast %struct.stat* %buf to %struct.stat64*, !dbg !186
  %1 = tail call i32 @__fd_stat(i8* %path, %struct.stat64* %0) nounwind, !dbg !186
  ret i32 %1, !dbg !186
}

declare i32 @__fd_stat(i8*, %struct.stat64*)

define i32 @"\01__xstat64"(i32 %vers, i8* %path, %struct.stat* %buf) nounwind {
entry:
  tail call void @llvm.dbg.value(metadata !{i32 %vers}, i64 0, metadata !139), !dbg !188
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !140), !dbg !188
  tail call void @llvm.dbg.value(metadata !{%struct.stat* %buf}, i64 0, metadata !141), !dbg !188
  %0 = bitcast %struct.stat* %buf to %struct.stat64*, !dbg !189
  %1 = tail call i32 @__fd_stat(i8* %path, %struct.stat64* %0) nounwind, !dbg !189
  ret i32 %1, !dbg !189
}

define i64 @"\01lseek64"(i32 %fd, i64 %offset, i32 %whence) nounwind {
entry:
  tail call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !142), !dbg !191
  tail call void @llvm.dbg.value(metadata !{i64 %offset}, i64 0, metadata !143), !dbg !191
  tail call void @llvm.dbg.value(metadata !{i32 %whence}, i64 0, metadata !144), !dbg !191
  %0 = tail call i64 @__fd_lseek(i32 %fd, i64 %offset, i32 %whence) nounwind, !dbg !192
  ret i64 %0, !dbg !192
}

declare i64 @__fd_lseek(i32, i64, i32)

declare void @llvm.va_start(i8*) nounwind

declare void @llvm.va_end(i8*) nounwind

declare i32 @__fd_open(i8*, i32, i32)

!llvm.dbg.sp = !{!0, !27, !59, !64, !103, !106, !109, !112, !113, !114, !117}
!llvm.dbg.lv.getdents64 = !{!120, !121, !122}
!llvm.dbg.lv.statfs64 = !{!123, !124}
!llvm.dbg.lv.ftruncate64 = !{!125, !126}
!llvm.dbg.lv.fstat64 = !{!127, !128}
!llvm.dbg.lv.__fxstat64 = !{!129, !130, !131}
!llvm.dbg.lv.lstat64 = !{!132, !133}
!llvm.dbg.lv.__lxstat64 = !{!134, !135, !136}
!llvm.dbg.lv.stat64 = !{!137, !138}
!llvm.dbg.lv.__xstat64 = !{!139, !140, !141}
!llvm.dbg.lv.lseek64 = !{!142, !143, !144}
!llvm.dbg.lv.open64 = !{!145, !146, !147, !150}

!0 = metadata !{i32 589870, i32 0, metadata !1, metadata !"getdents64", metadata !"getdents64", metadata !"getdents64", metadata !1, i32 86, metadata !3, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, %struct.dirent*, i32)* @getdents64} ; [ DW_TAG_subprogram ]
!1 = metadata !{i32 589865, metadata !"fd_64.c", metadata !"/home/jeffwalt/Desktop/LLVM/workspace/klee/runtime/POSIX/", metadata !2} ; [ DW_TAG_file_type ]
!2 = metadata !{i32 589841, i32 0, i32 1, metadata !"fd_64.c", metadata !"/home/jeffwalt/Desktop/LLVM/workspace/klee/runtime/POSIX/", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build 2.9)", i1 true, i1 true, metadata !"", i32 0} ; [ DW_TAG_compile_unit ]
!3 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !4, i32 0, null} ; [ DW_TAG_subroutine_type ]
!4 = metadata !{metadata !5, metadata !6, metadata !7, metadata !6}
!5 = metadata !{i32 589860, metadata !1, metadata !"int", metadata !1, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!6 = metadata !{i32 589860, metadata !1, metadata !"unsigned int", metadata !1, i32 0, i64 32, i64 32, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!7 = metadata !{i32 589839, metadata !1, metadata !"", metadata !1, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !8} ; [ DW_TAG_pointer_type ]
!8 = metadata !{i32 589843, metadata !1, metadata !"dirent", metadata !9, i32 24, i64 2208, i64 32, i64 0, i32 0, null, metadata !10, i32 0, null} ; [ DW_TAG_structure_type ]
!9 = metadata !{i32 589865, metadata !"dirent.h", metadata !"/usr/include/bits", metadata !2} ; [ DW_TAG_file_type ]
!10 = metadata !{metadata !11, metadata !15, metadata !18, metadata !20, metadata !22}
!11 = metadata !{i32 589837, metadata !8, metadata !"d_ino", metadata !9, i32 29, i64 64, i64 64, i64 0, i32 0, metadata !12} ; [ DW_TAG_member ]
!12 = metadata !{i32 589846, metadata !13, metadata !"__ino64_t", metadata !13, i32 139, i64 0, i64 0, i64 0, i32 0, metadata !14} ; [ DW_TAG_typedef ]
!13 = metadata !{i32 589865, metadata !"types.h", metadata !"/usr/include/bits", metadata !2} ; [ DW_TAG_file_type ]
!14 = metadata !{i32 589860, metadata !1, metadata !"long long unsigned int", metadata !1, i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!15 = metadata !{i32 589837, metadata !8, metadata !"d_off", metadata !9, i32 30, i64 64, i64 64, i64 64, i32 0, metadata !16} ; [ DW_TAG_member ]
!16 = metadata !{i32 589846, metadata !13, metadata !"__off64_t", metadata !13, i32 143, i64 0, i64 0, i64 0, i32 0, metadata !17} ; [ DW_TAG_typedef ]
!17 = metadata !{i32 589860, metadata !1, metadata !"long long int", metadata !1, i32 0, i64 64, i64 64, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!18 = metadata !{i32 589837, metadata !8, metadata !"d_reclen", metadata !9, i32 32, i64 16, i64 16, i64 128, i32 0, metadata !19} ; [ DW_TAG_member ]
!19 = metadata !{i32 589860, metadata !1, metadata !"short unsigned int", metadata !1, i32 0, i64 16, i64 16, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!20 = metadata !{i32 589837, metadata !8, metadata !"d_type", metadata !9, i32 33, i64 8, i64 8, i64 144, i32 0, metadata !21} ; [ DW_TAG_member ]
!21 = metadata !{i32 589860, metadata !1, metadata !"unsigned char", metadata !1, i32 0, i64 8, i64 8, i64 0, i32 0, i32 8} ; [ DW_TAG_base_type ]
!22 = metadata !{i32 589837, metadata !8, metadata !"d_name", metadata !9, i32 34, i64 2048, i64 8, i64 152, i32 0, metadata !23} ; [ DW_TAG_member ]
!23 = metadata !{i32 589825, metadata !1, metadata !"", metadata !1, i32 0, i64 2048, i64 8, i64 0, i32 0, metadata !24, metadata !25, i32 0, null} ; [ DW_TAG_array_type ]
!24 = metadata !{i32 589860, metadata !1, metadata !"char", metadata !1, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ]
!25 = metadata !{metadata !26}
!26 = metadata !{i32 589857, i64 0, i64 255}      ; [ DW_TAG_subrange_type ]
!27 = metadata !{i32 589870, i32 0, metadata !1, metadata !"statfs", metadata !"statfs", metadata !"\01statfs64", metadata !1, i32 82, metadata !28, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, %struct.statfs*)* @"\01statfs64"} ; [ DW_TAG_subprogram ]
!28 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !29, i32 0, null} ; [ DW_TAG_subroutine_type ]
!29 = metadata !{metadata !5, metadata !30, metadata !32}
!30 = metadata !{i32 589839, metadata !1, metadata !"", metadata !1, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !31} ; [ DW_TAG_pointer_type ]
!31 = metadata !{i32 589862, metadata !1, metadata !"", metadata !1, i32 0, i64 8, i64 8, i64 0, i32 0, metadata !24} ; [ DW_TAG_const_type ]
!32 = metadata !{i32 589839, metadata !1, metadata !"", metadata !1, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !33} ; [ DW_TAG_pointer_type ]
!33 = metadata !{i32 589843, metadata !1, metadata !"statfs", metadata !34, i32 26, i64 672, i64 32, i64 0, i32 0, null, metadata !35, i32 0, null} ; [ DW_TAG_structure_type ]
!34 = metadata !{i32 589865, metadata !"statfs.h", metadata !"/usr/include/bits", metadata !2} ; [ DW_TAG_file_type ]
!35 = metadata !{metadata !36, metadata !37, metadata !38, metadata !40, metadata !41, metadata !42, metadata !44, metadata !45, metadata !53, metadata !54, metadata !55}
!36 = metadata !{i32 589837, metadata !33, metadata !"f_type", metadata !34, i32 27, i64 32, i64 32, i64 0, i32 0, metadata !5} ; [ DW_TAG_member ]
!37 = metadata !{i32 589837, metadata !33, metadata !"f_bsize", metadata !34, i32 28, i64 32, i64 32, i64 32, i32 0, metadata !5} ; [ DW_TAG_member ]
!38 = metadata !{i32 589837, metadata !33, metadata !"f_blocks", metadata !34, i32 36, i64 64, i64 64, i64 64, i32 0, metadata !39} ; [ DW_TAG_member ]
!39 = metadata !{i32 589846, metadata !13, metadata !"__fsblkcnt64_t", metadata !13, i32 177, i64 0, i64 0, i64 0, i32 0, metadata !14} ; [ DW_TAG_typedef ]
!40 = metadata !{i32 589837, metadata !33, metadata !"f_bfree", metadata !34, i32 37, i64 64, i64 64, i64 128, i32 0, metadata !39} ; [ DW_TAG_member ]
!41 = metadata !{i32 589837, metadata !33, metadata !"f_bavail", metadata !34, i32 38, i64 64, i64 64, i64 192, i32 0, metadata !39} ; [ DW_TAG_member ]
!42 = metadata !{i32 589837, metadata !33, metadata !"f_files", metadata !34, i32 39, i64 64, i64 64, i64 256, i32 0, metadata !43} ; [ DW_TAG_member ]
!43 = metadata !{i32 589846, metadata !13, metadata !"__fsfilcnt64_t", metadata !13, i32 180, i64 0, i64 0, i64 0, i32 0, metadata !14} ; [ DW_TAG_typedef ]
!44 = metadata !{i32 589837, metadata !33, metadata !"f_ffree", metadata !34, i32 40, i64 64, i64 64, i64 320, i32 0, metadata !43} ; [ DW_TAG_member ]
!45 = metadata !{i32 589837, metadata !33, metadata !"f_fsid", metadata !34, i32 42, i64 64, i64 32, i64 384, i32 0, metadata !46} ; [ DW_TAG_member ]
!46 = metadata !{i32 589846, metadata !13, metadata !"__fsid_t", metadata !13, i32 145, i64 0, i64 0, i64 0, i32 0, metadata !47} ; [ DW_TAG_typedef ]
!47 = metadata !{i32 589843, metadata !1, metadata !"", metadata !13, i32 144, i64 64, i64 32, i64 0, i32 0, null, metadata !48, i32 0, null} ; [ DW_TAG_structure_type ]
!48 = metadata !{metadata !49}
!49 = metadata !{i32 589837, metadata !47, metadata !"__val", metadata !13, i32 144, i64 64, i64 32, i64 0, i32 0, metadata !50} ; [ DW_TAG_member ]
!50 = metadata !{i32 589825, metadata !1, metadata !"", metadata !1, i32 0, i64 64, i64 32, i64 0, i32 0, metadata !5, metadata !51, i32 0, null} ; [ DW_TAG_array_type ]
!51 = metadata !{metadata !52}
!52 = metadata !{i32 589857, i64 0, i64 1}        ; [ DW_TAG_subrange_type ]
!53 = metadata !{i32 589837, metadata !33, metadata !"f_namelen", metadata !34, i32 43, i64 32, i64 32, i64 448, i32 0, metadata !5} ; [ DW_TAG_member ]
!54 = metadata !{i32 589837, metadata !33, metadata !"f_frsize", metadata !34, i32 44, i64 32, i64 32, i64 480, i32 0, metadata !5} ; [ DW_TAG_member ]
!55 = metadata !{i32 589837, metadata !33, metadata !"f_spare", metadata !34, i32 45, i64 160, i64 32, i64 512, i32 0, metadata !56} ; [ DW_TAG_member ]
!56 = metadata !{i32 589825, metadata !1, metadata !"", metadata !1, i32 0, i64 160, i64 32, i64 0, i32 0, metadata !5, metadata !57, i32 0, null} ; [ DW_TAG_array_type ]
!57 = metadata !{metadata !58}
!58 = metadata !{i32 589857, i64 0, i64 4}        ; [ DW_TAG_subrange_type ]
!59 = metadata !{i32 589870, i32 0, metadata !1, metadata !"ftruncate64", metadata !"ftruncate64", metadata !"ftruncate64", metadata !1, i32 77, metadata !60, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i64)* @ftruncate64} ; [ DW_TAG_subprogram ]
!60 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !61, i32 0, null} ; [ DW_TAG_subroutine_type ]
!61 = metadata !{metadata !5, metadata !5, metadata !62}
!62 = metadata !{i32 589846, metadata !63, metadata !"off64_t", metadata !63, i32 100, i64 0, i64 0, i64 0, i32 0, metadata !17} ; [ DW_TAG_typedef ]
!63 = metadata !{i32 589865, metadata !"types.h", metadata !"/usr/include/sys", metadata !2} ; [ DW_TAG_file_type ]
!64 = metadata !{i32 589870, i32 0, metadata !1, metadata !"fstat", metadata !"fstat", metadata !"\01fstat64", metadata !1, i32 73, metadata !65, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, %struct.stat*)* @"\01fstat64"} ; [ DW_TAG_subprogram ]
!65 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !66, i32 0, null} ; [ DW_TAG_subroutine_type ]
!66 = metadata !{metadata !5, metadata !5, metadata !67}
!67 = metadata !{i32 589839, metadata !1, metadata !"", metadata !1, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !68} ; [ DW_TAG_pointer_type ]
!68 = metadata !{i32 589843, metadata !1, metadata !"stat", metadata !69, i32 44, i64 768, i64 32, i64 0, i32 0, null, metadata !70, i32 0, null} ; [ DW_TAG_structure_type ]
!69 = metadata !{i32 589865, metadata !"stat.h", metadata !"/usr/include/bits", metadata !2} ; [ DW_TAG_file_type ]
!70 = metadata !{metadata !71, metadata !73, metadata !74, metadata !77, metadata !79, metadata !81, metadata !83, metadata !85, metadata !86, metadata !87, metadata !88, metadata !91, metadata !93, metadata !100, metadata !101, metadata !102}
!71 = metadata !{i32 589837, metadata !68, metadata !"st_dev", metadata !69, i32 45, i64 64, i64 64, i64 0, i32 0, metadata !72} ; [ DW_TAG_member ]
!72 = metadata !{i32 589846, metadata !13, metadata !"__dev_t", metadata !13, i32 135, i64 0, i64 0, i64 0, i32 0, metadata !14} ; [ DW_TAG_typedef ]
!73 = metadata !{i32 589837, metadata !68, metadata !"__pad1", metadata !69, i32 47, i64 16, i64 16, i64 64, i32 0, metadata !19} ; [ DW_TAG_member ]
!74 = metadata !{i32 589837, metadata !68, metadata !"__st_ino", metadata !69, i32 52, i64 32, i64 32, i64 96, i32 0, metadata !75} ; [ DW_TAG_member ]
!75 = metadata !{i32 589846, metadata !13, metadata !"__ino_t", metadata !13, i32 138, i64 0, i64 0, i64 0, i32 0, metadata !76} ; [ DW_TAG_typedef ]
!76 = metadata !{i32 589860, metadata !1, metadata !"long unsigned int", metadata !1, i32 0, i64 32, i64 32, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!77 = metadata !{i32 589837, metadata !68, metadata !"st_mode", metadata !69, i32 55, i64 32, i64 32, i64 128, i32 0, metadata !78} ; [ DW_TAG_member ]
!78 = metadata !{i32 589846, metadata !13, metadata !"__mode_t", metadata !13, i32 140, i64 0, i64 0, i64 0, i32 0, metadata !6} ; [ DW_TAG_typedef ]
!79 = metadata !{i32 589837, metadata !68, metadata !"st_nlink", metadata !69, i32 56, i64 32, i64 32, i64 160, i32 0, metadata !80} ; [ DW_TAG_member ]
!80 = metadata !{i32 589846, metadata !13, metadata !"__nlink_t", metadata !13, i32 141, i64 0, i64 0, i64 0, i32 0, metadata !6} ; [ DW_TAG_typedef ]
!81 = metadata !{i32 589837, metadata !68, metadata !"st_uid", metadata !69, i32 61, i64 32, i64 32, i64 192, i32 0, metadata !82} ; [ DW_TAG_member ]
!82 = metadata !{i32 589846, metadata !13, metadata !"__uid_t", metadata !13, i32 136, i64 0, i64 0, i64 0, i32 0, metadata !6} ; [ DW_TAG_typedef ]
!83 = metadata !{i32 589837, metadata !68, metadata !"st_gid", metadata !69, i32 62, i64 32, i64 32, i64 224, i32 0, metadata !84} ; [ DW_TAG_member ]
!84 = metadata !{i32 589846, metadata !13, metadata !"__gid_t", metadata !13, i32 137, i64 0, i64 0, i64 0, i32 0, metadata !6} ; [ DW_TAG_typedef ]
!85 = metadata !{i32 589837, metadata !68, metadata !"st_rdev", metadata !69, i32 66, i64 64, i64 64, i64 256, i32 0, metadata !72} ; [ DW_TAG_member ]
!86 = metadata !{i32 589837, metadata !68, metadata !"__pad2", metadata !69, i32 68, i64 16, i64 16, i64 320, i32 0, metadata !19} ; [ DW_TAG_member ]
!87 = metadata !{i32 589837, metadata !68, metadata !"st_size", metadata !69, i32 73, i64 64, i64 64, i64 352, i32 0, metadata !16} ; [ DW_TAG_member ]
!88 = metadata !{i32 589837, metadata !68, metadata !"st_blksize", metadata !69, i32 75, i64 32, i64 32, i64 416, i32 0, metadata !89} ; [ DW_TAG_member ]
!89 = metadata !{i32 589846, metadata !13, metadata !"__blksize_t", metadata !13, i32 169, i64 0, i64 0, i64 0, i32 0, metadata !90} ; [ DW_TAG_typedef ]
!90 = metadata !{i32 589860, metadata !1, metadata !"long int", metadata !1, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!91 = metadata !{i32 589837, metadata !68, metadata !"st_blocks", metadata !69, i32 79, i64 64, i64 64, i64 448, i32 0, metadata !92} ; [ DW_TAG_member ]
!92 = metadata !{i32 589846, metadata !13, metadata !"__blkcnt64_t", metadata !13, i32 173, i64 0, i64 0, i64 0, i32 0, metadata !17} ; [ DW_TAG_typedef ]
!93 = metadata !{i32 589837, metadata !68, metadata !"st_atim", metadata !69, i32 88, i64 64, i64 32, i64 512, i32 0, metadata !94} ; [ DW_TAG_member ]
!94 = metadata !{i32 589843, metadata !1, metadata !"timespec", metadata !95, i32 121, i64 64, i64 32, i64 0, i32 0, null, metadata !96, i32 0, null} ; [ DW_TAG_structure_type ]
!95 = metadata !{i32 589865, metadata !"time.h", metadata !"/usr/include", metadata !2} ; [ DW_TAG_file_type ]
!96 = metadata !{metadata !97, metadata !99}
!97 = metadata !{i32 589837, metadata !94, metadata !"tv_sec", metadata !95, i32 122, i64 32, i64 32, i64 0, i32 0, metadata !98} ; [ DW_TAG_member ]
!98 = metadata !{i32 589846, metadata !13, metadata !"__time_t", metadata !13, i32 150, i64 0, i64 0, i64 0, i32 0, metadata !90} ; [ DW_TAG_typedef ]
!99 = metadata !{i32 589837, metadata !94, metadata !"tv_nsec", metadata !95, i32 123, i64 32, i64 32, i64 32, i32 0, metadata !90} ; [ DW_TAG_member ]
!100 = metadata !{i32 589837, metadata !68, metadata !"st_mtim", metadata !69, i32 89, i64 64, i64 32, i64 576, i32 0, metadata !94} ; [ DW_TAG_member ]
!101 = metadata !{i32 589837, metadata !68, metadata !"st_ctim", metadata !69, i32 90, i64 64, i64 32, i64 640, i32 0, metadata !94} ; [ DW_TAG_member ]
!102 = metadata !{i32 589837, metadata !68, metadata !"st_ino", metadata !69, i32 109, i64 64, i64 64, i64 704, i32 0, metadata !12} ; [ DW_TAG_member ]
!103 = metadata !{i32 589870, i32 0, metadata !1, metadata !"__fxstat", metadata !"__fxstat", metadata !"\01__fxstat64", metadata !1, i32 69, metadata !104, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i32, %struct.stat*)* @"\01__fxstat64"} ; [ DW_TAG_subprogram ]
!104 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !105, i32 0, null} ; [ DW_TAG_subroutine_type ]
!105 = metadata !{metadata !5, metadata !5, metadata !5, metadata !67}
!106 = metadata !{i32 589870, i32 0, metadata !1, metadata !"lstat", metadata !"lstat", metadata !"\01lstat64", metadata !1, i32 65, metadata !107, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, %struct.stat*)* @"\01lstat64"} ; [ DW_TAG_subprogram ]
!107 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !108, i32 0, null} ; [ DW_TAG_subroutine_type ]
!108 = metadata !{metadata !5, metadata !30, metadata !67}
!109 = metadata !{i32 589870, i32 0, metadata !1, metadata !"__lxstat", metadata !"__lxstat", metadata !"\01__lxstat64", metadata !1, i32 61, metadata !110, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i8*, %struct.stat*)* @"\01__lxstat64"} ; [ DW_TAG_subprogram ]
!110 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !111, i32 0, null} ; [ DW_TAG_subroutine_type ]
!111 = metadata !{metadata !5, metadata !5, metadata !30, metadata !67}
!112 = metadata !{i32 589870, i32 0, metadata !1, metadata !"stat", metadata !"stat", metadata !"\01stat64", metadata !1, i32 57, metadata !107, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, %struct.stat*)* @"\01stat64"} ; [ DW_TAG_subprogram ]
!113 = metadata !{i32 589870, i32 0, metadata !1, metadata !"__xstat", metadata !"__xstat", metadata !"\01__xstat64", metadata !1, i32 53, metadata !110, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i8*, %struct.stat*)* @"\01__xstat64"} ; [ DW_TAG_subprogram ]
!114 = metadata !{i32 589870, i32 0, metadata !1, metadata !"lseek", metadata !"lseek", metadata !"\01lseek64", metadata !1, i32 49, metadata !115, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i64 (i32, i64, i32)* @"\01lseek64"} ; [ DW_TAG_subprogram ]
!115 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !116, i32 0, null} ; [ DW_TAG_subroutine_type ]
!116 = metadata !{metadata !62, metadata !5, metadata !62, metadata !5}
!117 = metadata !{i32 589870, i32 0, metadata !1, metadata !"open", metadata !"open", metadata !"\01open64", metadata !1, i32 35, metadata !118, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i32, ...)* @"\01open64"} ; [ DW_TAG_subprogram ]
!118 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !119, i32 0, null} ; [ DW_TAG_subroutine_type ]
!119 = metadata !{metadata !5, metadata !30, metadata !5}
!120 = metadata !{i32 590081, metadata !0, metadata !"fd", metadata !1, i32 86, metadata !6, i32 0} ; [ DW_TAG_arg_variable ]
!121 = metadata !{i32 590081, metadata !0, metadata !"dirp", metadata !1, i32 86, metadata !7, i32 0} ; [ DW_TAG_arg_variable ]
!122 = metadata !{i32 590081, metadata !0, metadata !"count", metadata !1, i32 86, metadata !6, i32 0} ; [ DW_TAG_arg_variable ]
!123 = metadata !{i32 590081, metadata !27, metadata !"path", metadata !1, i32 82, metadata !30, i32 0} ; [ DW_TAG_arg_variable ]
!124 = metadata !{i32 590081, metadata !27, metadata !"buf", metadata !1, i32 82, metadata !32, i32 0} ; [ DW_TAG_arg_variable ]
!125 = metadata !{i32 590081, metadata !59, metadata !"fd", metadata !1, i32 77, metadata !5, i32 0} ; [ DW_TAG_arg_variable ]
!126 = metadata !{i32 590081, metadata !59, metadata !"length", metadata !1, i32 77, metadata !62, i32 0} ; [ DW_TAG_arg_variable ]
!127 = metadata !{i32 590081, metadata !64, metadata !"fd", metadata !1, i32 73, metadata !5, i32 0} ; [ DW_TAG_arg_variable ]
!128 = metadata !{i32 590081, metadata !64, metadata !"buf", metadata !1, i32 73, metadata !67, i32 0} ; [ DW_TAG_arg_variable ]
!129 = metadata !{i32 590081, metadata !103, metadata !"vers", metadata !1, i32 69, metadata !5, i32 0} ; [ DW_TAG_arg_variable ]
!130 = metadata !{i32 590081, metadata !103, metadata !"fd", metadata !1, i32 69, metadata !5, i32 0} ; [ DW_TAG_arg_variable ]
!131 = metadata !{i32 590081, metadata !103, metadata !"buf", metadata !1, i32 69, metadata !67, i32 0} ; [ DW_TAG_arg_variable ]
!132 = metadata !{i32 590081, metadata !106, metadata !"path", metadata !1, i32 65, metadata !30, i32 0} ; [ DW_TAG_arg_variable ]
!133 = metadata !{i32 590081, metadata !106, metadata !"buf", metadata !1, i32 65, metadata !67, i32 0} ; [ DW_TAG_arg_variable ]
!134 = metadata !{i32 590081, metadata !109, metadata !"vers", metadata !1, i32 61, metadata !5, i32 0} ; [ DW_TAG_arg_variable ]
!135 = metadata !{i32 590081, metadata !109, metadata !"path", metadata !1, i32 61, metadata !30, i32 0} ; [ DW_TAG_arg_variable ]
!136 = metadata !{i32 590081, metadata !109, metadata !"buf", metadata !1, i32 61, metadata !67, i32 0} ; [ DW_TAG_arg_variable ]
!137 = metadata !{i32 590081, metadata !112, metadata !"path", metadata !1, i32 57, metadata !30, i32 0} ; [ DW_TAG_arg_variable ]
!138 = metadata !{i32 590081, metadata !112, metadata !"buf", metadata !1, i32 57, metadata !67, i32 0} ; [ DW_TAG_arg_variable ]
!139 = metadata !{i32 590081, metadata !113, metadata !"vers", metadata !1, i32 53, metadata !5, i32 0} ; [ DW_TAG_arg_variable ]
!140 = metadata !{i32 590081, metadata !113, metadata !"path", metadata !1, i32 53, metadata !30, i32 0} ; [ DW_TAG_arg_variable ]
!141 = metadata !{i32 590081, metadata !113, metadata !"buf", metadata !1, i32 53, metadata !67, i32 0} ; [ DW_TAG_arg_variable ]
!142 = metadata !{i32 590081, metadata !114, metadata !"fd", metadata !1, i32 49, metadata !5, i32 0} ; [ DW_TAG_arg_variable ]
!143 = metadata !{i32 590081, metadata !114, metadata !"offset", metadata !1, i32 49, metadata !62, i32 0} ; [ DW_TAG_arg_variable ]
!144 = metadata !{i32 590081, metadata !114, metadata !"whence", metadata !1, i32 49, metadata !5, i32 0} ; [ DW_TAG_arg_variable ]
!145 = metadata !{i32 590081, metadata !117, metadata !"pathname", metadata !1, i32 35, metadata !30, i32 0} ; [ DW_TAG_arg_variable ]
!146 = metadata !{i32 590081, metadata !117, metadata !"flags", metadata !1, i32 35, metadata !5, i32 0} ; [ DW_TAG_arg_variable ]
!147 = metadata !{i32 590080, metadata !148, metadata !"mode", metadata !1, i32 36, metadata !149, i32 0} ; [ DW_TAG_auto_variable ]
!148 = metadata !{i32 589835, metadata !117, i32 35, i32 0, metadata !1, i32 10} ; [ DW_TAG_lexical_block ]
!149 = metadata !{i32 589846, metadata !63, metadata !"mode_t", metadata !63, i32 77, i64 0, i64 0, i64 0, i32 0, metadata !6} ; [ DW_TAG_typedef ]
!150 = metadata !{i32 590080, metadata !151, metadata !"ap", metadata !1, i32 40, metadata !152, i32 0} ; [ DW_TAG_auto_variable ]
!151 = metadata !{i32 589835, metadata !148, i32 41, i32 0, metadata !1, i32 11} ; [ DW_TAG_lexical_block ]
!152 = metadata !{i32 589846, metadata !153, metadata !"va_list", metadata !153, i32 93, i64 0, i64 0, i64 0, i32 0, metadata !154} ; [ DW_TAG_typedef ]
!153 = metadata !{i32 589865, metadata !"stdio.h", metadata !"/usr/include", metadata !2} ; [ DW_TAG_file_type ]
!154 = metadata !{i32 589839, metadata !1, metadata !"", metadata !1, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !24} ; [ DW_TAG_pointer_type ]
!155 = metadata !{i32 35, i32 0, metadata !117, null}
!156 = metadata !{i32 0}
!157 = metadata !{i32 36, i32 0, metadata !148, null}
!158 = metadata !{i32 38, i32 0, metadata !148, null}
!159 = metadata !{i32 40, i32 0, metadata !151, null}
!160 = metadata !{i32 41, i32 0, metadata !151, null}
!161 = metadata !{i32 42, i32 0, metadata !151, null}
!162 = metadata !{i32 43, i32 0, metadata !151, null}
!163 = metadata !{i32 46, i32 0, metadata !148, null}
!164 = metadata !{i32 86, i32 0, metadata !0, null}
!165 = metadata !{i32 87, i32 0, metadata !166, null}
!166 = metadata !{i32 589835, metadata !0, i32 86, i32 0, metadata !1, i32 0} ; [ DW_TAG_lexical_block ]
!167 = metadata !{i32 82, i32 0, metadata !27, null}
!168 = metadata !{i32 83, i32 0, metadata !169, null}
!169 = metadata !{i32 589835, metadata !27, i32 82, i32 0, metadata !1, i32 1} ; [ DW_TAG_lexical_block ]
!170 = metadata !{i32 77, i32 0, metadata !59, null}
!171 = metadata !{i32 78, i32 0, metadata !172, null}
!172 = metadata !{i32 589835, metadata !59, i32 77, i32 0, metadata !1, i32 2} ; [ DW_TAG_lexical_block ]
!173 = metadata !{i32 73, i32 0, metadata !64, null}
!174 = metadata !{i32 74, i32 0, metadata !175, null}
!175 = metadata !{i32 589835, metadata !64, i32 73, i32 0, metadata !1, i32 3} ; [ DW_TAG_lexical_block ]
!176 = metadata !{i32 69, i32 0, metadata !103, null}
!177 = metadata !{i32 70, i32 0, metadata !178, null}
!178 = metadata !{i32 589835, metadata !103, i32 69, i32 0, metadata !1, i32 4} ; [ DW_TAG_lexical_block ]
!179 = metadata !{i32 65, i32 0, metadata !106, null}
!180 = metadata !{i32 66, i32 0, metadata !181, null}
!181 = metadata !{i32 589835, metadata !106, i32 65, i32 0, metadata !1, i32 5} ; [ DW_TAG_lexical_block ]
!182 = metadata !{i32 61, i32 0, metadata !109, null}
!183 = metadata !{i32 62, i32 0, metadata !184, null}
!184 = metadata !{i32 589835, metadata !109, i32 61, i32 0, metadata !1, i32 6} ; [ DW_TAG_lexical_block ]
!185 = metadata !{i32 57, i32 0, metadata !112, null}
!186 = metadata !{i32 58, i32 0, metadata !187, null}
!187 = metadata !{i32 589835, metadata !112, i32 57, i32 0, metadata !1, i32 7} ; [ DW_TAG_lexical_block ]
!188 = metadata !{i32 53, i32 0, metadata !113, null}
!189 = metadata !{i32 54, i32 0, metadata !190, null}
!190 = metadata !{i32 589835, metadata !113, i32 53, i32 0, metadata !1, i32 8} ; [ DW_TAG_lexical_block ]
!191 = metadata !{i32 49, i32 0, metadata !114, null}
!192 = metadata !{i32 50, i32 0, metadata !193, null}
!193 = metadata !{i32 589835, metadata !114, i32 49, i32 0, metadata !1, i32 9} ; [ DW_TAG_lexical_block ]
