; ModuleID = 'kern.c'
source_filename = "kern.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128"
target triple = "bpf"

%struct.anon.5 = type { ptr, ptr, ptr, ptr }
%struct.anon.6 = type { ptr, ptr, ptr }
%struct.xdp_md = type { i32, i32, i32, i32, i32, i32 }
%struct.ethhdr = type { [6 x i8], [6 x i8], i16 }
%struct.packetrec = type { %union.tcp_addr, %union.tcp_addr, i8, i16, i16 }
%union.tcp_addr = type { %struct.in6_addr }
%struct.in6_addr = type { %union.anon }
%union.anon = type { [4 x i32] }
%struct.ipv6hdr = type { i8, [3 x i8], i16, i8, i8, %union.anon.0 }
%union.anon.0 = type { %struct.anon }
%struct.anon = type { %struct.in6_addr, %struct.in6_addr }
%struct.iphdr = type { i8, i8, i16, i16, i16, i8, i8, i16, %union.anon.2 }
%union.anon.2 = type { %struct.anon.3 }
%struct.anon.3 = type { i32, i32 }
%struct.tcphdr = type { i16, i16, i32, i32, i16, i16, i16, i16 }
%struct.datarec = type { i64, i64 }

@xdp_parser_func.____fmt = internal constant [14 x i8] c"got something\00", align 1, !dbg !0
@_license = dso_local global [4 x i8] c"GPL\00", section "license", align 1, !dbg !73
@xdp_stats_map = dso_local global %struct.anon.5 zeroinitializer, section ".maps", align 8, !dbg !79
@xdp_packets_queue = dso_local global %struct.anon.6 zeroinitializer, section ".maps", align 8, !dbg !105
@llvm.compiler.used = appending global [6 x ptr] [ptr @_license, ptr @xdp_packets_queue, ptr @xdp_parser_func, ptr @xdp_port_rewrite_func, ptr @xdp_stats_map, ptr @xdp_vlan_swap_func], section "llvm.metadata"

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local i32 @xdp_port_rewrite_func(ptr nocapture readnone %0) #0 section "xdp" !dbg !289 {
  call void @llvm.dbg.value(metadata ptr poison, metadata !291, metadata !DIExpression()), !dbg !292
  ret i32 2, !dbg !293
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nofree nounwind memory(read, inaccessiblemem: none)
define dso_local i32 @xdp_vlan_swap_func(ptr nocapture noundef readonly %0) #2 section "xdp" !dbg !294 {
  call void @llvm.dbg.value(metadata ptr %0, metadata !296, metadata !DIExpression()), !dbg !302
  %2 = getelementptr inbounds %struct.xdp_md, ptr %0, i64 0, i32 1, !dbg !303
  %3 = load i32, ptr %2, align 4, !dbg !303, !tbaa !304
  %4 = zext i32 %3 to i64, !dbg !309
  %5 = inttoptr i64 %4 to ptr, !dbg !310
  call void @llvm.dbg.value(metadata ptr %5, metadata !297, metadata !DIExpression()), !dbg !302
  %6 = load i32, ptr %0, align 4, !dbg !311, !tbaa !312
  %7 = zext i32 %6 to i64, !dbg !313
  %8 = inttoptr i64 %7 to ptr, !dbg !314
  call void @llvm.dbg.value(metadata ptr %8, metadata !298, metadata !DIExpression()), !dbg !302
  call void @llvm.dbg.value(metadata ptr %8, metadata !299, metadata !DIExpression()), !dbg !302
  call void @llvm.dbg.value(metadata ptr undef, metadata !315, metadata !DIExpression()), !dbg !324
  call void @llvm.dbg.value(metadata ptr %5, metadata !322, metadata !DIExpression()), !dbg !324
  call void @llvm.dbg.value(metadata ptr undef, metadata !323, metadata !DIExpression()), !dbg !324
  call void @llvm.dbg.value(metadata ptr undef, metadata !326, metadata !DIExpression()), !dbg !351
  call void @llvm.dbg.value(metadata ptr %5, metadata !338, metadata !DIExpression()), !dbg !351
  call void @llvm.dbg.value(metadata ptr undef, metadata !339, metadata !DIExpression()), !dbg !351
  call void @llvm.dbg.value(metadata ptr null, metadata !340, metadata !DIExpression()), !dbg !351
  call void @llvm.dbg.value(metadata ptr %8, metadata !341, metadata !DIExpression()), !dbg !351
  call void @llvm.dbg.value(metadata i32 14, metadata !342, metadata !DIExpression()), !dbg !351
  %9 = getelementptr i8, ptr %8, i64 14, !dbg !353
  %10 = icmp ugt ptr %9, %5, !dbg !355
  br i1 %10, label %26, label %11, !dbg !356

11:                                               ; preds = %1
  call void @llvm.dbg.value(metadata ptr %9, metadata !299, metadata !DIExpression()), !dbg !302
  call void @llvm.dbg.value(metadata ptr %9, metadata !343, metadata !DIExpression()), !dbg !351
  %12 = getelementptr inbounds %struct.ethhdr, ptr %8, i64 0, i32 2, !dbg !357
  call void @llvm.dbg.value(metadata i16 poison, metadata !349, metadata !DIExpression()), !dbg !351
  call void @llvm.dbg.value(metadata i32 0, metadata !350, metadata !DIExpression()), !dbg !351
  %13 = load i16, ptr %12, align 1, !dbg !351, !tbaa !358
  call void @llvm.dbg.value(metadata i16 %13, metadata !349, metadata !DIExpression()), !dbg !351
  call void @llvm.dbg.value(metadata i16 %13, metadata !360, metadata !DIExpression()), !dbg !365
  %14 = icmp eq i16 %13, 129, !dbg !371
  %15 = icmp eq i16 %13, -22392, !dbg !372
  %16 = tail call i1 @llvm.bpf.passthrough.i1.i1(i32 0, i1 %14)
  %17 = or i1 %15, %16, !dbg !372
  %18 = getelementptr i8, ptr %8, i64 18
  %19 = icmp ule ptr %18, %5
  %20 = select i1 %17, i1 %19, i1 false, !dbg !373
  br i1 %20, label %21, label %26, !dbg !373

21:                                               ; preds = %11
  call void @llvm.dbg.value(metadata i16 poison, metadata !349, metadata !DIExpression()), !dbg !351
  %22 = getelementptr i8, ptr %8, i64 16, !dbg !374
  call void @llvm.dbg.value(metadata ptr %18, metadata !343, metadata !DIExpression()), !dbg !351
  call void @llvm.dbg.value(metadata i32 1, metadata !350, metadata !DIExpression()), !dbg !351
  %23 = load i16, ptr %22, align 1, !dbg !351, !tbaa !358
  call void @llvm.dbg.value(metadata i16 %23, metadata !349, metadata !DIExpression()), !dbg !351
  call void @llvm.dbg.value(metadata i16 %23, metadata !360, metadata !DIExpression()), !dbg !365
  %24 = icmp eq i16 %23, 129, !dbg !371
  %25 = tail call i1 @llvm.bpf.passthrough.i1.i1(i32 0, i1 %24)
  br label %26, !dbg !373

26:                                               ; preds = %11, %21, %1
  ret i32 2, !dbg !375
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #3

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #3

; Function Attrs: nounwind
define dso_local i32 @xdp_parser_func(ptr nocapture noundef readonly %0) #4 section "xdp" !dbg !2 {
  %2 = alloca i32, align 4
  %3 = alloca %struct.packetrec, align 4
  %4 = alloca [3 x i32], align 4
  call void @llvm.dbg.declare(metadata ptr %4, metadata !194, metadata !DIExpression(DW_OP_LLVM_fragment, 32, 96)), !dbg !376
  %5 = alloca [3 x i32], align 4
  call void @llvm.dbg.declare(metadata ptr %5, metadata !195, metadata !DIExpression(DW_OP_LLVM_fragment, 32, 96)), !dbg !377
  call void @llvm.dbg.value(metadata ptr %0, metadata !175, metadata !DIExpression()), !dbg !378
  %6 = getelementptr inbounds %struct.xdp_md, ptr %0, i64 0, i32 1, !dbg !379
  %7 = load i32, ptr %6, align 4, !dbg !379, !tbaa !304
  %8 = zext i32 %7 to i64, !dbg !380
  %9 = inttoptr i64 %8 to ptr, !dbg !381
  call void @llvm.dbg.value(metadata ptr %9, metadata !176, metadata !DIExpression()), !dbg !378
  %10 = load i32, ptr %0, align 4, !dbg !382, !tbaa !312
  %11 = zext i32 %10 to i64, !dbg !383
  %12 = inttoptr i64 %11 to ptr, !dbg !384
  call void @llvm.dbg.value(metadata ptr %12, metadata !177, metadata !DIExpression()), !dbg !378
  call void @llvm.dbg.value(metadata i32 2, metadata !178, metadata !DIExpression()), !dbg !378
  call void @llvm.dbg.value(metadata ptr %12, metadata !179, metadata !DIExpression()), !dbg !378
  call void @llvm.dbg.value(metadata ptr undef, metadata !315, metadata !DIExpression()), !dbg !385
  call void @llvm.dbg.value(metadata ptr %9, metadata !322, metadata !DIExpression()), !dbg !385
  call void @llvm.dbg.value(metadata ptr undef, metadata !323, metadata !DIExpression()), !dbg !385
  call void @llvm.dbg.value(metadata ptr undef, metadata !326, metadata !DIExpression()), !dbg !387
  call void @llvm.dbg.value(metadata ptr %9, metadata !338, metadata !DIExpression()), !dbg !387
  call void @llvm.dbg.value(metadata ptr undef, metadata !339, metadata !DIExpression()), !dbg !387
  call void @llvm.dbg.value(metadata ptr null, metadata !340, metadata !DIExpression()), !dbg !387
  call void @llvm.dbg.value(metadata ptr %12, metadata !341, metadata !DIExpression()), !dbg !387
  call void @llvm.dbg.value(metadata i32 14, metadata !342, metadata !DIExpression()), !dbg !387
  %13 = getelementptr i8, ptr %12, i64 14, !dbg !389
  %14 = icmp ugt ptr %13, %9, !dbg !390
  br i1 %14, label %15, label %17, !dbg !391

15:                                               ; preds = %1
  call void @llvm.dbg.value(metadata ptr poison, metadata !179, metadata !DIExpression()), !dbg !378
  call void @llvm.dbg.value(metadata i32 poison, metadata !184, metadata !DIExpression()), !dbg !378
  call void @llvm.lifetime.start.p0(i64 12, ptr nonnull %4), !dbg !392
  call void @llvm.dbg.value(metadata i32 0, metadata !194, metadata !DIExpression(DW_OP_LLVM_fragment, 0, 32)), !dbg !378
  call void @llvm.lifetime.start.p0(i64 12, ptr nonnull %5), !dbg !393
  call void @llvm.dbg.value(metadata i32 0, metadata !195, metadata !DIExpression(DW_OP_LLVM_fragment, 0, 32)), !dbg !378
  call void @llvm.dbg.value(metadata i16 0, metadata !196, metadata !DIExpression()), !dbg !378
  call void @llvm.dbg.value(metadata i16 0, metadata !197, metadata !DIExpression()), !dbg !378
  call void @llvm.dbg.value(metadata i8 0, metadata !198, metadata !DIExpression()), !dbg !378
  %16 = tail call i64 (ptr, i32, ...) inttoptr (i64 6 to ptr)(ptr noundef nonnull @xdp_parser_func.____fmt, i32 noundef 14) #9, !dbg !394
  br label %103, !dbg !396

17:                                               ; preds = %1
  call void @llvm.dbg.value(metadata ptr %13, metadata !179, metadata !DIExpression()), !dbg !378
  call void @llvm.dbg.value(metadata ptr %13, metadata !343, metadata !DIExpression()), !dbg !387
  %18 = getelementptr inbounds %struct.ethhdr, ptr %12, i64 0, i32 2, !dbg !397
  call void @llvm.dbg.value(metadata i16 poison, metadata !349, metadata !DIExpression()), !dbg !387
  call void @llvm.dbg.value(metadata i32 0, metadata !350, metadata !DIExpression()), !dbg !387
  %19 = load i16, ptr %18, align 1, !dbg !387, !tbaa !358
  call void @llvm.dbg.value(metadata i16 %19, metadata !349, metadata !DIExpression()), !dbg !387
  call void @llvm.dbg.value(metadata ptr %13, metadata !343, metadata !DIExpression()), !dbg !387
  call void @llvm.dbg.value(metadata i32 0, metadata !350, metadata !DIExpression()), !dbg !387
  call void @llvm.dbg.value(metadata ptr %13, metadata !343, metadata !DIExpression()), !dbg !387
  call void @llvm.dbg.value(metadata i16 %19, metadata !360, metadata !DIExpression()), !dbg !398
  %20 = icmp eq i16 %19, 129, !dbg !400
  %21 = icmp eq i16 %19, -22392, !dbg !401
  %22 = tail call i1 @llvm.bpf.passthrough.i1.i1(i32 0, i1 %20)
  %23 = or i1 %21, %22, !dbg !401
  %24 = getelementptr i8, ptr %12, i64 18
  %25 = icmp ule ptr %24, %9
  %26 = select i1 %23, i1 %25, i1 false, !dbg !402
  br i1 %26, label %27, label %40, !dbg !402

27:                                               ; preds = %17
  call void @llvm.dbg.value(metadata i16 poison, metadata !349, metadata !DIExpression()), !dbg !387
  %28 = getelementptr i8, ptr %12, i64 16, !dbg !403
  call void @llvm.dbg.value(metadata ptr %24, metadata !343, metadata !DIExpression()), !dbg !387
  call void @llvm.dbg.value(metadata i32 1, metadata !350, metadata !DIExpression()), !dbg !387
  %29 = load i16, ptr %28, align 1, !dbg !387, !tbaa !358
  call void @llvm.dbg.value(metadata i16 %29, metadata !349, metadata !DIExpression()), !dbg !387
  call void @llvm.dbg.value(metadata i32 1, metadata !350, metadata !DIExpression()), !dbg !387
  call void @llvm.dbg.value(metadata ptr %24, metadata !343, metadata !DIExpression()), !dbg !387
  call void @llvm.dbg.value(metadata i16 %29, metadata !360, metadata !DIExpression()), !dbg !398
  %30 = icmp eq i16 %29, 129, !dbg !400
  %31 = icmp eq i16 %29, -22392, !dbg !401
  %32 = tail call i1 @llvm.bpf.passthrough.i1.i1(i32 0, i1 %30)
  %33 = or i1 %31, %32, !dbg !401
  %34 = getelementptr i8, ptr %12, i64 22
  %35 = icmp ule ptr %34, %9
  %36 = select i1 %33, i1 %35, i1 false, !dbg !402
  br i1 %36, label %37, label %40, !dbg !402

37:                                               ; preds = %27
  call void @llvm.dbg.value(metadata i16 poison, metadata !349, metadata !DIExpression()), !dbg !387
  %38 = getelementptr i8, ptr %12, i64 20, !dbg !403
  call void @llvm.dbg.value(metadata ptr %34, metadata !343, metadata !DIExpression()), !dbg !387
  call void @llvm.dbg.value(metadata i32 2, metadata !350, metadata !DIExpression()), !dbg !387
  %39 = load i16, ptr %38, align 1, !dbg !387, !tbaa !358
  call void @llvm.dbg.value(metadata i16 %39, metadata !349, metadata !DIExpression()), !dbg !387
  br label %40

40:                                               ; preds = %17, %27, %37
  %41 = phi ptr [ %13, %17 ], [ %24, %27 ], [ %34, %37 ], !dbg !387
  %42 = phi i16 [ %19, %17 ], [ %29, %27 ], [ %39, %37 ], !dbg !387
  call void @llvm.dbg.value(metadata ptr %41, metadata !179, metadata !DIExpression()), !dbg !378
  call void @llvm.dbg.value(metadata i16 %42, metadata !184, metadata !DIExpression(DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !378
  call void @llvm.lifetime.start.p0(i64 12, ptr nonnull %4), !dbg !392
  call void @llvm.dbg.value(metadata i32 0, metadata !194, metadata !DIExpression(DW_OP_LLVM_fragment, 0, 32)), !dbg !378
  call void @llvm.memset.p0.i64(ptr noundef nonnull align 4 dereferenceable(12) %4, i8 0, i64 12, i1 false), !dbg !376
  call void @llvm.lifetime.start.p0(i64 12, ptr nonnull %5), !dbg !393
  call void @llvm.dbg.value(metadata i32 0, metadata !195, metadata !DIExpression(DW_OP_LLVM_fragment, 0, 32)), !dbg !378
  call void @llvm.memset.p0.i64(ptr noundef nonnull align 4 dereferenceable(12) %5, i8 0, i64 12, i1 false), !dbg !377
  call void @llvm.dbg.value(metadata i16 0, metadata !196, metadata !DIExpression()), !dbg !378
  call void @llvm.dbg.value(metadata i16 0, metadata !197, metadata !DIExpression()), !dbg !378
  call void @llvm.dbg.value(metadata i8 0, metadata !198, metadata !DIExpression()), !dbg !378
  %43 = tail call i64 (ptr, i32, ...) inttoptr (i64 6 to ptr)(ptr noundef nonnull @xdp_parser_func.____fmt, i32 noundef 14) #9, !dbg !394
  switch i16 %42, label %103 [
    i16 -8826, label %44
    i16 8, label %58
  ], !dbg !396

44:                                               ; preds = %40
  call void @llvm.dbg.value(metadata ptr undef, metadata !404, metadata !DIExpression()), !dbg !413
  call void @llvm.dbg.value(metadata ptr %9, metadata !410, metadata !DIExpression()), !dbg !413
  call void @llvm.dbg.value(metadata ptr undef, metadata !411, metadata !DIExpression()), !dbg !413
  call void @llvm.dbg.value(metadata ptr %41, metadata !412, metadata !DIExpression()), !dbg !413
  %45 = getelementptr inbounds %struct.ipv6hdr, ptr %41, i64 1, !dbg !415
  %46 = icmp ugt ptr %45, %9, !dbg !417
  br i1 %46, label %103, label %47, !dbg !418

47:                                               ; preds = %44
  call void @llvm.dbg.value(metadata ptr %45, metadata !179, metadata !DIExpression()), !dbg !378
  %48 = getelementptr inbounds %struct.ipv6hdr, ptr %41, i64 0, i32 3, !dbg !419
  %49 = load i8, ptr %48, align 2, !dbg !419, !tbaa !420
  call void @llvm.dbg.value(metadata i8 %49, metadata !184, metadata !DIExpression(DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !378
  %50 = icmp eq i8 %49, 6, !dbg !422
  br i1 %50, label %51, label %103, !dbg !424

51:                                               ; preds = %47
  call void @llvm.dbg.value(metadata ptr %41, metadata !199, metadata !DIExpression()), !dbg !425
  %52 = getelementptr inbounds %struct.ipv6hdr, ptr %41, i64 0, i32 5, !dbg !426
  %53 = load i32, ptr %52, align 4, !dbg !426, !tbaa.struct !427
  call void @llvm.dbg.value(metadata i32 %53, metadata !194, metadata !DIExpression(DW_OP_LLVM_fragment, 0, 32)), !dbg !378
  %54 = getelementptr inbounds %struct.ipv6hdr, ptr %41, i64 0, i32 5, i32 0, i32 0, i32 0, i32 0, i64 1, !dbg !426
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 4 dereferenceable(12) %4, ptr noundef nonnull align 4 dereferenceable(12) %54, i64 12, i1 false), !dbg !426, !tbaa.struct !429
  %55 = getelementptr inbounds %struct.ipv6hdr, ptr %41, i64 0, i32 5, i32 0, i32 1, !dbg !430
  %56 = load i32, ptr %55, align 4, !dbg !430, !tbaa.struct !427
  call void @llvm.dbg.value(metadata i32 %56, metadata !195, metadata !DIExpression(DW_OP_LLVM_fragment, 0, 32)), !dbg !378
  %57 = getelementptr inbounds %struct.ipv6hdr, ptr %41, i64 0, i32 5, i32 0, i32 1, i32 0, i32 0, i64 1, !dbg !430
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 4 dereferenceable(12) %5, ptr noundef nonnull align 4 dereferenceable(12) %57, i64 12, i1 false), !dbg !430, !tbaa.struct !429
  call void @llvm.dbg.value(metadata i8 1, metadata !198, metadata !DIExpression()), !dbg !378
  br label %79

58:                                               ; preds = %40
  call void @llvm.dbg.value(metadata ptr undef, metadata !431, metadata !DIExpression()), !dbg !441
  call void @llvm.dbg.value(metadata ptr %9, metadata !437, metadata !DIExpression()), !dbg !441
  call void @llvm.dbg.value(metadata ptr undef, metadata !438, metadata !DIExpression()), !dbg !441
  call void @llvm.dbg.value(metadata ptr %41, metadata !439, metadata !DIExpression()), !dbg !441
  %59 = getelementptr inbounds %struct.iphdr, ptr %41, i64 1, !dbg !443
  %60 = icmp ugt ptr %59, %9, !dbg !445
  br i1 %60, label %103, label %61, !dbg !446

61:                                               ; preds = %58
  %62 = load i8, ptr %41, align 4, !dbg !447
  %63 = shl i8 %62, 2, !dbg !448
  %64 = and i8 %63, 60, !dbg !448
  call void @llvm.dbg.value(metadata i8 %64, metadata !440, metadata !DIExpression(DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !441
  %65 = icmp ult i8 %64, 20, !dbg !449
  br i1 %65, label %103, label %66, !dbg !451

66:                                               ; preds = %61
  %67 = zext i8 %64 to i64
  call void @llvm.dbg.value(metadata i64 %67, metadata !440, metadata !DIExpression()), !dbg !441
  %68 = getelementptr i8, ptr %41, i64 %67, !dbg !452
  %69 = icmp ugt ptr %68, %9, !dbg !454
  br i1 %69, label %103, label %70, !dbg !455

70:                                               ; preds = %66
  call void @llvm.dbg.value(metadata ptr %68, metadata !179, metadata !DIExpression()), !dbg !378
  %71 = getelementptr inbounds %struct.iphdr, ptr %41, i64 0, i32 6, !dbg !456
  %72 = load i8, ptr %71, align 1, !dbg !456, !tbaa !457
  call void @llvm.dbg.value(metadata i8 %72, metadata !184, metadata !DIExpression(DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !378
  %73 = icmp eq i8 %72, 6, !dbg !459
  br i1 %73, label %74, label %103, !dbg !461

74:                                               ; preds = %70
  call void @llvm.dbg.value(metadata ptr %41, metadata !228, metadata !DIExpression()), !dbg !462
  %75 = getelementptr inbounds %struct.iphdr, ptr %41, i64 0, i32 8, !dbg !463
  %76 = load i32, ptr %75, align 4, !dbg !463, !tbaa !428
  call void @llvm.dbg.value(metadata i32 %76, metadata !194, metadata !DIExpression(DW_OP_LLVM_fragment, 0, 32)), !dbg !378
  %77 = getelementptr inbounds %struct.iphdr, ptr %41, i64 0, i32 8, i32 0, i32 1, !dbg !464
  %78 = load i32, ptr %77, align 4, !dbg !464, !tbaa !428
  call void @llvm.dbg.value(metadata i32 %78, metadata !195, metadata !DIExpression(DW_OP_LLVM_fragment, 0, 32)), !dbg !378
  call void @llvm.dbg.value(metadata i8 0, metadata !198, metadata !DIExpression()), !dbg !378
  br label %79

79:                                               ; preds = %74, %51
  %80 = phi ptr [ %68, %74 ], [ %45, %51 ], !dbg !465
  %81 = phi i32 [ %76, %74 ], [ %53, %51 ], !dbg !376
  %82 = phi i32 [ %78, %74 ], [ %56, %51 ], !dbg !377
  %83 = phi i8 [ 0, %74 ], [ 1, %51 ], !dbg !466
  call void @llvm.dbg.value(metadata i32 %82, metadata !195, metadata !DIExpression(DW_OP_LLVM_fragment, 0, 32)), !dbg !378
  call void @llvm.dbg.value(metadata i32 %81, metadata !194, metadata !DIExpression(DW_OP_LLVM_fragment, 0, 32)), !dbg !378
  call void @llvm.dbg.value(metadata ptr %80, metadata !179, metadata !DIExpression()), !dbg !378
  call void @llvm.dbg.value(metadata i8 %83, metadata !198, metadata !DIExpression()), !dbg !378
  call void @llvm.dbg.value(metadata ptr undef, metadata !467, metadata !DIExpression()), !dbg !477
  call void @llvm.dbg.value(metadata ptr %9, metadata !473, metadata !DIExpression()), !dbg !477
  call void @llvm.dbg.value(metadata ptr undef, metadata !474, metadata !DIExpression()), !dbg !477
  call void @llvm.dbg.value(metadata ptr %80, metadata !476, metadata !DIExpression()), !dbg !477
  %84 = getelementptr inbounds %struct.tcphdr, ptr %80, i64 1, !dbg !479
  %85 = icmp ugt ptr %84, %9, !dbg !481
  br i1 %85, label %120, label %86, !dbg !482

86:                                               ; preds = %79
  call void @llvm.dbg.value(metadata i16 poison, metadata !475, metadata !DIExpression(DW_OP_constu, 2, DW_OP_shr, DW_OP_constu, 60, DW_OP_and, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !477
  call void @llvm.dbg.value(metadata i32 undef, metadata !184, metadata !DIExpression()), !dbg !378
  call void @llvm.dbg.value(metadata ptr %80, metadata !258, metadata !DIExpression()), !dbg !378
  %87 = load i16, ptr %80, align 4, !dbg !483, !tbaa !484
  %88 = tail call i16 @llvm.bswap.i16(i16 %87), !dbg !483
  call void @llvm.dbg.value(metadata i16 %88, metadata !196, metadata !DIExpression()), !dbg !378
  %89 = getelementptr inbounds %struct.tcphdr, ptr %80, i64 0, i32 1, !dbg !486
  %90 = load i16, ptr %89, align 2, !dbg !486, !tbaa !487
  %91 = tail call i16 @llvm.bswap.i16(i16 %90), !dbg !486
  call void @llvm.dbg.value(metadata i16 %91, metadata !197, metadata !DIExpression()), !dbg !378
  call void @llvm.dbg.value(metadata ptr %0, metadata !488, metadata !DIExpression()), !dbg !504
  call void @llvm.dbg.value(metadata ptr undef, metadata !498, metadata !DIExpression()), !dbg !504
  call void @llvm.dbg.value(metadata ptr undef, metadata !499, metadata !DIExpression()), !dbg !504
  call void @llvm.dbg.value(metadata i8 %83, metadata !500, metadata !DIExpression()), !dbg !504
  call void @llvm.dbg.value(metadata ptr undef, metadata !501, metadata !DIExpression()), !dbg !504
  call void @llvm.dbg.value(metadata ptr undef, metadata !502, metadata !DIExpression()), !dbg !504
  call void @llvm.lifetime.start.p0(i64 40, ptr nonnull %3) #9, !dbg !506
  call void @llvm.dbg.declare(metadata ptr %3, metadata !503, metadata !DIExpression()), !dbg !507
  store i32 %81, ptr %3, align 4, !dbg !508, !tbaa.struct !509
  %92 = getelementptr inbounds i8, ptr %3, i64 4, !dbg !508
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 4 dereferenceable(12) %92, ptr noundef nonnull align 4 dereferenceable(12) %4, i64 12, i1 false), !dbg !508, !tbaa.struct !429
  %93 = getelementptr inbounds %struct.packetrec, ptr %3, i64 0, i32 1, !dbg !511
  store i32 %82, ptr %93, align 4, !dbg !512, !tbaa.struct !509
  %94 = getelementptr inbounds %struct.packetrec, ptr %3, i64 0, i32 1, i32 0, i32 0, i32 0, i64 1, !dbg !512
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 4 dereferenceable(12) %94, ptr noundef nonnull align 4 dereferenceable(12) %5, i64 12, i1 false), !dbg !512, !tbaa.struct !429
  %95 = getelementptr inbounds %struct.packetrec, ptr %3, i64 0, i32 2, !dbg !513
  store i8 %83, ptr %95, align 4, !dbg !514, !tbaa !515
  %96 = getelementptr inbounds %struct.packetrec, ptr %3, i64 0, i32 3, !dbg !517
  store i16 %88, ptr %96, align 2, !dbg !518, !tbaa !519
  %97 = getelementptr inbounds %struct.packetrec, ptr %3, i64 0, i32 4, !dbg !520
  store i16 %91, ptr %97, align 4, !dbg !521, !tbaa !522
  %98 = call i64 inttoptr (i64 87 to ptr)(ptr noundef nonnull @xdp_packets_queue, ptr noundef nonnull %3, i64 noundef 2) #9, !dbg !523
  %99 = lshr i64 %98, 62, !dbg !504
  %100 = trunc i64 %99 to i32, !dbg !504
  %101 = and i32 %100, 2, !dbg !504
  %102 = xor i32 %101, 2, !dbg !504
  call void @llvm.lifetime.end.p0(i64 40, ptr nonnull %3) #9, !dbg !525
  call void @llvm.dbg.value(metadata i32 %102, metadata !178, metadata !DIExpression()), !dbg !378
  br label %103, !dbg !526

103:                                              ; preds = %66, %61, %58, %70, %44, %47, %15, %40, %86
  %104 = phi i32 [ %102, %86 ], [ 2, %40 ], [ 2, %15 ], [ 2, %47 ], [ 2, %44 ], [ 2, %70 ], [ 2, %58 ], [ 2, %61 ], [ 2, %66 ], !dbg !378
  call void @llvm.dbg.value(metadata i32 %104, metadata !178, metadata !DIExpression()), !dbg !378
  call void @llvm.dbg.label(metadata !280), !dbg !527
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %2), !dbg !528
  call void @llvm.dbg.value(metadata ptr %0, metadata !533, metadata !DIExpression()), !dbg !528
  call void @llvm.dbg.value(metadata i32 %104, metadata !534, metadata !DIExpression()), !dbg !528
  store i32 %104, ptr %2, align 4, !tbaa !510
  call void @llvm.dbg.value(metadata ptr %2, metadata !534, metadata !DIExpression(DW_OP_deref)), !dbg !528
  %105 = call ptr inttoptr (i64 1 to ptr)(ptr noundef nonnull @xdp_stats_map, ptr noundef nonnull %2) #9, !dbg !537
  call void @llvm.dbg.value(metadata ptr %105, metadata !535, metadata !DIExpression()), !dbg !528
  %106 = icmp eq ptr %105, null, !dbg !538
  br i1 %106, label %118, label %107, !dbg !540

107:                                              ; preds = %103
  %108 = load i64, ptr %105, align 8, !dbg !541, !tbaa !542
  %109 = add i64 %108, 1, !dbg !541
  store i64 %109, ptr %105, align 8, !dbg !541, !tbaa !542
  %110 = load i32, ptr %6, align 4, !dbg !545, !tbaa !304
  %111 = load i32, ptr %0, align 4, !dbg !546, !tbaa !312
  %112 = sub i32 %110, %111, !dbg !547
  %113 = zext i32 %112 to i64, !dbg !548
  %114 = getelementptr inbounds %struct.datarec, ptr %105, i64 0, i32 1, !dbg !549
  %115 = load i64, ptr %114, align 8, !dbg !550, !tbaa !551
  %116 = add i64 %115, %113, !dbg !550
  store i64 %116, ptr %114, align 8, !dbg !550, !tbaa !551
  %117 = load i32, ptr %2, align 4, !dbg !552, !tbaa !510
  call void @llvm.dbg.value(metadata i32 %117, metadata !534, metadata !DIExpression()), !dbg !528
  br label %118, !dbg !553

118:                                              ; preds = %103, %107
  %119 = phi i32 [ %117, %107 ], [ 0, %103 ], !dbg !528
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %2), !dbg !554
  br label %120, !dbg !555

120:                                              ; preds = %79, %118
  %121 = phi i32 [ %119, %118 ], [ 0, %79 ]
  call void @llvm.lifetime.end.p0(i64 12, ptr nonnull %5), !dbg !556
  call void @llvm.lifetime.end.p0(i64 12, ptr nonnull %4), !dbg !556
  ret i32 %121, !dbg !556
}

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #5

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #6

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i16 @llvm.bswap.i16(i16) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare void @llvm.dbg.label(metadata) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare void @llvm.dbg.value(metadata, metadata, metadata) #7

; Function Attrs: nounwind memory(none)
declare i1 @llvm.bpf.passthrough.i1.i1(i32, i1) #8

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(none) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { nofree nounwind memory(read, inaccessiblemem: none) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #3 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #5 = { mustprogress nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #6 = { mustprogress nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #7 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #8 = { nounwind memory(none) }
attributes #9 = { nounwind }

!llvm.dbg.cu = !{!20}
!llvm.module.flags = !{!284, !285, !286, !287}
!llvm.ident = !{!288}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "____fmt", scope: !2, file: !3, line: 124, type: !281, isLocal: true, isDefinition: true)
!2 = distinct !DISubprogram(name: "xdp_parser_func", scope: !3, file: !3, line: 94, type: !4, scopeLine: 95, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !20, retainedNodes: !174)
!3 = !DIFile(filename: "kern.c", directory: "/home/ncd/git/c-bpf-net-sniffer/sniffer", checksumkind: CSK_MD5, checksum: "26994ac6f1fc1b438281ddc08ebdcc3e")
!4 = !DISubroutineType(types: !5)
!5 = !{!6, !7}
!6 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!7 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !8, size: 64)
!8 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "xdp_md", file: !9, line: 6198, size: 192, elements: !10)
!9 = !DIFile(filename: "/usr/include/linux/bpf.h", directory: "", checksumkind: CSK_MD5, checksum: "0e8ee22284445bf280d4dd8fb9f52271")
!10 = !{!11, !15, !16, !17, !18, !19}
!11 = !DIDerivedType(tag: DW_TAG_member, name: "data", scope: !8, file: !9, line: 6199, baseType: !12, size: 32)
!12 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u32", file: !13, line: 27, baseType: !14)
!13 = !DIFile(filename: "/usr/include/asm-generic/int-ll64.h", directory: "", checksumkind: CSK_MD5, checksum: "b810f270733e106319b67ef512c6246e")
!14 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!15 = !DIDerivedType(tag: DW_TAG_member, name: "data_end", scope: !8, file: !9, line: 6200, baseType: !12, size: 32, offset: 32)
!16 = !DIDerivedType(tag: DW_TAG_member, name: "data_meta", scope: !8, file: !9, line: 6201, baseType: !12, size: 32, offset: 64)
!17 = !DIDerivedType(tag: DW_TAG_member, name: "ingress_ifindex", scope: !8, file: !9, line: 6203, baseType: !12, size: 32, offset: 96)
!18 = !DIDerivedType(tag: DW_TAG_member, name: "rx_queue_index", scope: !8, file: !9, line: 6204, baseType: !12, size: 32, offset: 128)
!19 = !DIDerivedType(tag: DW_TAG_member, name: "egress_ifindex", scope: !8, file: !9, line: 6206, baseType: !12, size: 32, offset: 160)
!20 = distinct !DICompileUnit(language: DW_LANG_C11, file: !3, producer: "clang version 16.0.6", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !21, retainedTypes: !67, globals: !72, splitDebugInlining: false, nameTableKind: None)
!21 = !{!22, !29, !61}
!22 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "xdp_action", file: !9, line: 6187, baseType: !14, size: 32, elements: !23)
!23 = !{!24, !25, !26, !27, !28}
!24 = !DIEnumerator(name: "XDP_ABORTED", value: 0)
!25 = !DIEnumerator(name: "XDP_DROP", value: 1)
!26 = !DIEnumerator(name: "XDP_PASS", value: 2)
!27 = !DIEnumerator(name: "XDP_TX", value: 3)
!28 = !DIEnumerator(name: "XDP_REDIRECT", value: 4)
!29 = !DICompositeType(tag: DW_TAG_enumeration_type, file: !30, line: 29, baseType: !14, size: 32, elements: !31)
!30 = !DIFile(filename: "/usr/include/linux/in.h", directory: "", checksumkind: CSK_MD5, checksum: "fcee415bb19db8acb968eeda6f02fa29")
!31 = !{!32, !33, !34, !35, !36, !37, !38, !39, !40, !41, !42, !43, !44, !45, !46, !47, !48, !49, !50, !51, !52, !53, !54, !55, !56, !57, !58, !59, !60}
!32 = !DIEnumerator(name: "IPPROTO_IP", value: 0)
!33 = !DIEnumerator(name: "IPPROTO_ICMP", value: 1)
!34 = !DIEnumerator(name: "IPPROTO_IGMP", value: 2)
!35 = !DIEnumerator(name: "IPPROTO_IPIP", value: 4)
!36 = !DIEnumerator(name: "IPPROTO_TCP", value: 6)
!37 = !DIEnumerator(name: "IPPROTO_EGP", value: 8)
!38 = !DIEnumerator(name: "IPPROTO_PUP", value: 12)
!39 = !DIEnumerator(name: "IPPROTO_UDP", value: 17)
!40 = !DIEnumerator(name: "IPPROTO_IDP", value: 22)
!41 = !DIEnumerator(name: "IPPROTO_TP", value: 29)
!42 = !DIEnumerator(name: "IPPROTO_DCCP", value: 33)
!43 = !DIEnumerator(name: "IPPROTO_IPV6", value: 41)
!44 = !DIEnumerator(name: "IPPROTO_RSVP", value: 46)
!45 = !DIEnumerator(name: "IPPROTO_GRE", value: 47)
!46 = !DIEnumerator(name: "IPPROTO_ESP", value: 50)
!47 = !DIEnumerator(name: "IPPROTO_AH", value: 51)
!48 = !DIEnumerator(name: "IPPROTO_MTP", value: 92)
!49 = !DIEnumerator(name: "IPPROTO_BEETPH", value: 94)
!50 = !DIEnumerator(name: "IPPROTO_ENCAP", value: 98)
!51 = !DIEnumerator(name: "IPPROTO_PIM", value: 103)
!52 = !DIEnumerator(name: "IPPROTO_COMP", value: 108)
!53 = !DIEnumerator(name: "IPPROTO_L2TP", value: 115)
!54 = !DIEnumerator(name: "IPPROTO_SCTP", value: 132)
!55 = !DIEnumerator(name: "IPPROTO_UDPLITE", value: 136)
!56 = !DIEnumerator(name: "IPPROTO_MPLS", value: 137)
!57 = !DIEnumerator(name: "IPPROTO_ETHERNET", value: 143)
!58 = !DIEnumerator(name: "IPPROTO_RAW", value: 255)
!59 = !DIEnumerator(name: "IPPROTO_MPTCP", value: 262)
!60 = !DIEnumerator(name: "IPPROTO_MAX", value: 263)
!61 = !DICompositeType(tag: DW_TAG_enumeration_type, file: !9, line: 1228, baseType: !14, size: 32, elements: !62)
!62 = !{!63, !64, !65, !66}
!63 = !DIEnumerator(name: "BPF_ANY", value: 0)
!64 = !DIEnumerator(name: "BPF_NOEXIST", value: 1)
!65 = !DIEnumerator(name: "BPF_EXIST", value: 2)
!66 = !DIEnumerator(name: "BPF_F_LOCK", value: 4)
!67 = !{!68, !69, !70}
!68 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!69 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!70 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u16", file: !13, line: 24, baseType: !71)
!71 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!72 = !{!0, !73, !79, !105, !154, !162, !169}
!73 = !DIGlobalVariableExpression(var: !74, expr: !DIExpression())
!74 = distinct !DIGlobalVariable(name: "_license", scope: !20, file: !3, line: 176, type: !75, isLocal: false, isDefinition: true)
!75 = !DICompositeType(tag: DW_TAG_array_type, baseType: !76, size: 32, elements: !77)
!76 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!77 = !{!78}
!78 = !DISubrange(count: 4)
!79 = !DIGlobalVariableExpression(var: !80, expr: !DIExpression())
!80 = distinct !DIGlobalVariable(name: "xdp_stats_map", scope: !20, file: !81, line: 22, type: !82, isLocal: false, isDefinition: true)
!81 = !DIFile(filename: "./../common/xdp_stats_kern.h", directory: "/home/ncd/git/c-bpf-net-sniffer/sniffer", checksumkind: CSK_MD5, checksum: "25bea8477ebc9bcca300b739c08b4d93")
!82 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !81, line: 16, size: 256, elements: !83)
!83 = !{!84, !89, !91, !100}
!84 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !82, file: !81, line: 18, baseType: !85, size: 64)
!85 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !86, size: 64)
!86 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 192, elements: !87)
!87 = !{!88}
!88 = !DISubrange(count: 6)
!89 = !DIDerivedType(tag: DW_TAG_member, name: "key", scope: !82, file: !81, line: 19, baseType: !90, size: 64, offset: 64)
!90 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !12, size: 64)
!91 = !DIDerivedType(tag: DW_TAG_member, name: "value", scope: !82, file: !81, line: 20, baseType: !92, size: 64, offset: 128)
!92 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !93, size: 64)
!93 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "datarec", file: !94, line: 10, size: 128, elements: !95)
!94 = !DIFile(filename: "./../common/xdp_stats_kern_user.h", directory: "/home/ncd/git/c-bpf-net-sniffer/sniffer", checksumkind: CSK_MD5, checksum: "449a5b2598e78842fe00eb9ff78e80bf")
!95 = !{!96, !99}
!96 = !DIDerivedType(tag: DW_TAG_member, name: "rx_packets", scope: !93, file: !94, line: 12, baseType: !97, size: 64)
!97 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u64", file: !13, line: 31, baseType: !98)
!98 = !DIBasicType(name: "unsigned long long", size: 64, encoding: DW_ATE_unsigned)
!99 = !DIDerivedType(tag: DW_TAG_member, name: "rx_bytes", scope: !93, file: !94, line: 13, baseType: !97, size: 64, offset: 64)
!100 = !DIDerivedType(tag: DW_TAG_member, name: "max_entries", scope: !82, file: !81, line: 21, baseType: !101, size: 64, offset: 192)
!101 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !102, size: 64)
!102 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 160, elements: !103)
!103 = !{!104}
!104 = !DISubrange(count: 5)
!105 = !DIGlobalVariableExpression(var: !106, expr: !DIExpression())
!106 = distinct !DIGlobalVariable(name: "xdp_packets_queue", scope: !20, file: !81, line: 29, type: !107, isLocal: false, isDefinition: true)
!107 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !81, line: 24, size: 192, elements: !108)
!108 = !{!109, !114, !149}
!109 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !107, file: !81, line: 26, baseType: !110, size: 64)
!110 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !111, size: 64)
!111 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 704, elements: !112)
!112 = !{!113}
!113 = !DISubrange(count: 22)
!114 = !DIDerivedType(tag: DW_TAG_member, name: "value", scope: !107, file: !81, line: 27, baseType: !115, size: 64, offset: 64)
!115 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !116, size: 64)
!116 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "packetrec", file: !94, line: 22, size: 320, elements: !117)
!117 = !{!118, !145, !146, !147, !148}
!118 = !DIDerivedType(tag: DW_TAG_member, name: "src_addr", scope: !116, file: !94, line: 24, baseType: !119, size: 128)
!119 = !DIDerivedType(tag: DW_TAG_typedef, name: "tcp_addr", file: !94, line: 20, baseType: !120)
!120 = distinct !DICompositeType(tag: DW_TAG_union_type, file: !94, line: 16, size: 128, elements: !121)
!121 = !{!122, !144}
!122 = !DIDerivedType(tag: DW_TAG_member, name: "v6", scope: !120, file: !94, line: 18, baseType: !123, size: 128)
!123 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "in6_addr", file: !124, line: 33, size: 128, elements: !125)
!124 = !DIFile(filename: "/usr/include/linux/in6.h", directory: "", checksumkind: CSK_MD5, checksum: "8bebb780b45d3fe932cc1d934fa5f5fe")
!125 = !{!126}
!126 = !DIDerivedType(tag: DW_TAG_member, name: "in6_u", scope: !123, file: !124, line: 40, baseType: !127, size: 128)
!127 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !123, file: !124, line: 34, size: 128, elements: !128)
!128 = !{!129, !135, !141}
!129 = !DIDerivedType(tag: DW_TAG_member, name: "u6_addr8", scope: !127, file: !124, line: 35, baseType: !130, size: 128)
!130 = !DICompositeType(tag: DW_TAG_array_type, baseType: !131, size: 128, elements: !133)
!131 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u8", file: !13, line: 21, baseType: !132)
!132 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!133 = !{!134}
!134 = !DISubrange(count: 16)
!135 = !DIDerivedType(tag: DW_TAG_member, name: "u6_addr16", scope: !127, file: !124, line: 37, baseType: !136, size: 128)
!136 = !DICompositeType(tag: DW_TAG_array_type, baseType: !137, size: 128, elements: !139)
!137 = !DIDerivedType(tag: DW_TAG_typedef, name: "__be16", file: !138, line: 28, baseType: !70)
!138 = !DIFile(filename: "/usr/include/linux/types.h", directory: "", checksumkind: CSK_MD5, checksum: "64bcf4b731906682de6e750679b9f4a2")
!139 = !{!140}
!140 = !DISubrange(count: 8)
!141 = !DIDerivedType(tag: DW_TAG_member, name: "u6_addr32", scope: !127, file: !124, line: 38, baseType: !142, size: 128)
!142 = !DICompositeType(tag: DW_TAG_array_type, baseType: !143, size: 128, elements: !77)
!143 = !DIDerivedType(tag: DW_TAG_typedef, name: "__be32", file: !138, line: 30, baseType: !12)
!144 = !DIDerivedType(tag: DW_TAG_member, name: "v4", scope: !120, file: !94, line: 19, baseType: !143, size: 32)
!145 = !DIDerivedType(tag: DW_TAG_member, name: "dst_addr", scope: !116, file: !94, line: 25, baseType: !119, size: 128, offset: 128)
!146 = !DIDerivedType(tag: DW_TAG_member, name: "isv6", scope: !116, file: !94, line: 26, baseType: !131, size: 8, offset: 256)
!147 = !DIDerivedType(tag: DW_TAG_member, name: "src_port", scope: !116, file: !94, line: 27, baseType: !70, size: 16, offset: 272)
!148 = !DIDerivedType(tag: DW_TAG_member, name: "dst_port", scope: !116, file: !94, line: 28, baseType: !70, size: 16, offset: 288)
!149 = !DIDerivedType(tag: DW_TAG_member, name: "max_entries", scope: !107, file: !81, line: 28, baseType: !150, size: 64, offset: 128)
!150 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !151, size: 64)
!151 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 3200, elements: !152)
!152 = !{!153}
!153 = !DISubrange(count: 100)
!154 = !DIGlobalVariableExpression(var: !155, expr: !DIExpression())
!155 = distinct !DIGlobalVariable(name: "bpf_trace_printk", scope: !20, file: !156, line: 177, type: !157, isLocal: true, isDefinition: true)
!156 = !DIFile(filename: "../lib/install/include/bpf/bpf_helper_defs.h", directory: "/home/ncd/git/c-bpf-net-sniffer/sniffer", checksumkind: CSK_MD5, checksum: "09cfcd7169c24bec448f30582e8c6db9")
!157 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !158, size: 64)
!158 = !DISubroutineType(types: !159)
!159 = !{!69, !160, !12, null}
!160 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !161, size: 64)
!161 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !76)
!162 = !DIGlobalVariableExpression(var: !163, expr: !DIExpression())
!163 = distinct !DIGlobalVariable(name: "bpf_map_push_elem", scope: !20, file: !156, line: 2289, type: !164, isLocal: true, isDefinition: true)
!164 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !165, size: 64)
!165 = !DISubroutineType(types: !166)
!166 = !{!69, !68, !167, !97}
!167 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !168, size: 64)
!168 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!169 = !DIGlobalVariableExpression(var: !170, expr: !DIExpression())
!170 = distinct !DIGlobalVariable(name: "bpf_map_lookup_elem", scope: !20, file: !156, line: 56, type: !171, isLocal: true, isDefinition: true)
!171 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !172, size: 64)
!172 = !DISubroutineType(types: !173)
!173 = !{!68, !68, !167}
!174 = !{!175, !176, !177, !178, !179, !184, !185, !194, !195, !196, !197, !198, !199, !228, !258, !280}
!175 = !DILocalVariable(name: "ctx", arg: 1, scope: !2, file: !3, line: 94, type: !7)
!176 = !DILocalVariable(name: "data_end", scope: !2, file: !3, line: 96, type: !68)
!177 = !DILocalVariable(name: "data", scope: !2, file: !3, line: 97, type: !68)
!178 = !DILocalVariable(name: "action", scope: !2, file: !3, line: 103, type: !12)
!179 = !DILocalVariable(name: "nh", scope: !2, file: !3, line: 106, type: !180)
!180 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "hdr_cursor", file: !181, line: 33, size: 64, elements: !182)
!181 = !DIFile(filename: "./../common/parsing_helpers.h", directory: "/home/ncd/git/c-bpf-net-sniffer/sniffer", checksumkind: CSK_MD5, checksum: "172efdd203783aed49c0ce78645261a8")
!182 = !{!183}
!183 = !DIDerivedType(tag: DW_TAG_member, name: "pos", scope: !180, file: !181, line: 34, baseType: !68, size: 64)
!184 = !DILocalVariable(name: "nh_type", scope: !2, file: !3, line: 107, type: !6)
!185 = !DILocalVariable(name: "eth", scope: !2, file: !3, line: 110, type: !186)
!186 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !187, size: 64)
!187 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ethhdr", file: !188, line: 173, size: 112, elements: !189)
!188 = !DIFile(filename: "/usr/include/linux/if_ether.h", directory: "", checksumkind: CSK_MD5, checksum: "163f54fb1af2e21fea410f14eb18fa76")
!189 = !{!190, !192, !193}
!190 = !DIDerivedType(tag: DW_TAG_member, name: "h_dest", scope: !187, file: !188, line: 174, baseType: !191, size: 48)
!191 = !DICompositeType(tag: DW_TAG_array_type, baseType: !132, size: 48, elements: !87)
!192 = !DIDerivedType(tag: DW_TAG_member, name: "h_source", scope: !187, file: !188, line: 175, baseType: !191, size: 48, offset: 48)
!193 = !DIDerivedType(tag: DW_TAG_member, name: "h_proto", scope: !187, file: !188, line: 176, baseType: !137, size: 16, offset: 96)
!194 = !DILocalVariable(name: "src_addr", scope: !2, file: !3, line: 118, type: !119)
!195 = !DILocalVariable(name: "dst_addr", scope: !2, file: !3, line: 119, type: !119)
!196 = !DILocalVariable(name: "src_port", scope: !2, file: !3, line: 120, type: !70)
!197 = !DILocalVariable(name: "dst_port", scope: !2, file: !3, line: 121, type: !70)
!198 = !DILocalVariable(name: "isv6", scope: !2, file: !3, line: 122, type: !131)
!199 = !DILocalVariable(name: "ip6h", scope: !200, file: !3, line: 128, type: !202)
!200 = distinct !DILexicalBlock(scope: !201, file: !3, line: 127, column: 2)
!201 = distinct !DILexicalBlock(scope: !2, file: !3, line: 126, column: 6)
!202 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !203, size: 64)
!203 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ipv6hdr", file: !204, line: 118, size: 320, elements: !205)
!204 = !DIFile(filename: "/usr/include/linux/ipv6.h", directory: "", checksumkind: CSK_MD5, checksum: "5119f4e1c8becf2f187fa2b4015ad457")
!205 = !{!206, !207, !208, !212, !213, !214, !215}
!206 = !DIDerivedType(tag: DW_TAG_member, name: "priority", scope: !203, file: !204, line: 120, baseType: !131, size: 4, flags: DIFlagBitField, extraData: i64 0)
!207 = !DIDerivedType(tag: DW_TAG_member, name: "version", scope: !203, file: !204, line: 121, baseType: !131, size: 4, offset: 4, flags: DIFlagBitField, extraData: i64 0)
!208 = !DIDerivedType(tag: DW_TAG_member, name: "flow_lbl", scope: !203, file: !204, line: 128, baseType: !209, size: 24, offset: 8)
!209 = !DICompositeType(tag: DW_TAG_array_type, baseType: !131, size: 24, elements: !210)
!210 = !{!211}
!211 = !DISubrange(count: 3)
!212 = !DIDerivedType(tag: DW_TAG_member, name: "payload_len", scope: !203, file: !204, line: 130, baseType: !137, size: 16, offset: 32)
!213 = !DIDerivedType(tag: DW_TAG_member, name: "nexthdr", scope: !203, file: !204, line: 131, baseType: !131, size: 8, offset: 48)
!214 = !DIDerivedType(tag: DW_TAG_member, name: "hop_limit", scope: !203, file: !204, line: 132, baseType: !131, size: 8, offset: 56)
!215 = !DIDerivedType(tag: DW_TAG_member, scope: !203, file: !204, line: 134, baseType: !216, size: 256, offset: 64)
!216 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !203, file: !204, line: 134, size: 256, elements: !217)
!217 = !{!218, !223}
!218 = !DIDerivedType(tag: DW_TAG_member, scope: !216, file: !204, line: 134, baseType: !219, size: 256)
!219 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !216, file: !204, line: 134, size: 256, elements: !220)
!220 = !{!221, !222}
!221 = !DIDerivedType(tag: DW_TAG_member, name: "saddr", scope: !219, file: !204, line: 134, baseType: !123, size: 128)
!222 = !DIDerivedType(tag: DW_TAG_member, name: "daddr", scope: !219, file: !204, line: 134, baseType: !123, size: 128, offset: 128)
!223 = !DIDerivedType(tag: DW_TAG_member, name: "addrs", scope: !216, file: !204, line: 134, baseType: !224, size: 256)
!224 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !216, file: !204, line: 134, size: 256, elements: !225)
!225 = !{!226, !227}
!226 = !DIDerivedType(tag: DW_TAG_member, name: "saddr", scope: !224, file: !204, line: 134, baseType: !123, size: 128)
!227 = !DIDerivedType(tag: DW_TAG_member, name: "daddr", scope: !224, file: !204, line: 134, baseType: !123, size: 128, offset: 128)
!228 = !DILocalVariable(name: "iph", scope: !229, file: !3, line: 145, type: !231)
!229 = distinct !DILexicalBlock(scope: !230, file: !3, line: 144, column: 2)
!230 = distinct !DILexicalBlock(scope: !201, file: !3, line: 143, column: 11)
!231 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !232, size: 64)
!232 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "iphdr", file: !233, line: 87, size: 160, elements: !234)
!233 = !DIFile(filename: "/usr/include/linux/ip.h", directory: "", checksumkind: CSK_MD5, checksum: "149778ace30a1ff208adc8783fd04b29")
!234 = !{!235, !236, !237, !238, !239, !240, !241, !242, !243, !245}
!235 = !DIDerivedType(tag: DW_TAG_member, name: "ihl", scope: !232, file: !233, line: 89, baseType: !131, size: 4, flags: DIFlagBitField, extraData: i64 0)
!236 = !DIDerivedType(tag: DW_TAG_member, name: "version", scope: !232, file: !233, line: 90, baseType: !131, size: 4, offset: 4, flags: DIFlagBitField, extraData: i64 0)
!237 = !DIDerivedType(tag: DW_TAG_member, name: "tos", scope: !232, file: !233, line: 97, baseType: !131, size: 8, offset: 8)
!238 = !DIDerivedType(tag: DW_TAG_member, name: "tot_len", scope: !232, file: !233, line: 98, baseType: !137, size: 16, offset: 16)
!239 = !DIDerivedType(tag: DW_TAG_member, name: "id", scope: !232, file: !233, line: 99, baseType: !137, size: 16, offset: 32)
!240 = !DIDerivedType(tag: DW_TAG_member, name: "frag_off", scope: !232, file: !233, line: 100, baseType: !137, size: 16, offset: 48)
!241 = !DIDerivedType(tag: DW_TAG_member, name: "ttl", scope: !232, file: !233, line: 101, baseType: !131, size: 8, offset: 64)
!242 = !DIDerivedType(tag: DW_TAG_member, name: "protocol", scope: !232, file: !233, line: 102, baseType: !131, size: 8, offset: 72)
!243 = !DIDerivedType(tag: DW_TAG_member, name: "check", scope: !232, file: !233, line: 103, baseType: !244, size: 16, offset: 80)
!244 = !DIDerivedType(tag: DW_TAG_typedef, name: "__sum16", file: !138, line: 34, baseType: !70)
!245 = !DIDerivedType(tag: DW_TAG_member, scope: !232, file: !233, line: 104, baseType: !246, size: 64, offset: 96)
!246 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !232, file: !233, line: 104, size: 64, elements: !247)
!247 = !{!248, !253}
!248 = !DIDerivedType(tag: DW_TAG_member, scope: !246, file: !233, line: 104, baseType: !249, size: 64)
!249 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !246, file: !233, line: 104, size: 64, elements: !250)
!250 = !{!251, !252}
!251 = !DIDerivedType(tag: DW_TAG_member, name: "saddr", scope: !249, file: !233, line: 104, baseType: !143, size: 32)
!252 = !DIDerivedType(tag: DW_TAG_member, name: "daddr", scope: !249, file: !233, line: 104, baseType: !143, size: 32, offset: 32)
!253 = !DIDerivedType(tag: DW_TAG_member, name: "addrs", scope: !246, file: !233, line: 104, baseType: !254, size: 64)
!254 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !246, file: !233, line: 104, size: 64, elements: !255)
!255 = !{!256, !257}
!256 = !DIDerivedType(tag: DW_TAG_member, name: "saddr", scope: !254, file: !233, line: 104, baseType: !143, size: 32)
!257 = !DIDerivedType(tag: DW_TAG_member, name: "daddr", scope: !254, file: !233, line: 104, baseType: !143, size: 32, offset: 32)
!258 = !DILocalVariable(name: "tcph", scope: !2, file: !3, line: 163, type: !259)
!259 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !260, size: 64)
!260 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "tcphdr", file: !261, line: 25, size: 160, elements: !262)
!261 = !DIFile(filename: "/usr/include/linux/tcp.h", directory: "", checksumkind: CSK_MD5, checksum: "0fb7164446a017a2406c1e3b94b6d7a6")
!262 = !{!263, !264, !265, !266, !267, !268, !269, !270, !271, !272, !273, !274, !275, !276, !277, !278, !279}
!263 = !DIDerivedType(tag: DW_TAG_member, name: "source", scope: !260, file: !261, line: 26, baseType: !137, size: 16)
!264 = !DIDerivedType(tag: DW_TAG_member, name: "dest", scope: !260, file: !261, line: 27, baseType: !137, size: 16, offset: 16)
!265 = !DIDerivedType(tag: DW_TAG_member, name: "seq", scope: !260, file: !261, line: 28, baseType: !143, size: 32, offset: 32)
!266 = !DIDerivedType(tag: DW_TAG_member, name: "ack_seq", scope: !260, file: !261, line: 29, baseType: !143, size: 32, offset: 64)
!267 = !DIDerivedType(tag: DW_TAG_member, name: "res1", scope: !260, file: !261, line: 31, baseType: !70, size: 4, offset: 96, flags: DIFlagBitField, extraData: i64 96)
!268 = !DIDerivedType(tag: DW_TAG_member, name: "doff", scope: !260, file: !261, line: 32, baseType: !70, size: 4, offset: 100, flags: DIFlagBitField, extraData: i64 96)
!269 = !DIDerivedType(tag: DW_TAG_member, name: "fin", scope: !260, file: !261, line: 33, baseType: !70, size: 1, offset: 104, flags: DIFlagBitField, extraData: i64 96)
!270 = !DIDerivedType(tag: DW_TAG_member, name: "syn", scope: !260, file: !261, line: 34, baseType: !70, size: 1, offset: 105, flags: DIFlagBitField, extraData: i64 96)
!271 = !DIDerivedType(tag: DW_TAG_member, name: "rst", scope: !260, file: !261, line: 35, baseType: !70, size: 1, offset: 106, flags: DIFlagBitField, extraData: i64 96)
!272 = !DIDerivedType(tag: DW_TAG_member, name: "psh", scope: !260, file: !261, line: 36, baseType: !70, size: 1, offset: 107, flags: DIFlagBitField, extraData: i64 96)
!273 = !DIDerivedType(tag: DW_TAG_member, name: "ack", scope: !260, file: !261, line: 37, baseType: !70, size: 1, offset: 108, flags: DIFlagBitField, extraData: i64 96)
!274 = !DIDerivedType(tag: DW_TAG_member, name: "urg", scope: !260, file: !261, line: 38, baseType: !70, size: 1, offset: 109, flags: DIFlagBitField, extraData: i64 96)
!275 = !DIDerivedType(tag: DW_TAG_member, name: "ece", scope: !260, file: !261, line: 39, baseType: !70, size: 1, offset: 110, flags: DIFlagBitField, extraData: i64 96)
!276 = !DIDerivedType(tag: DW_TAG_member, name: "cwr", scope: !260, file: !261, line: 40, baseType: !70, size: 1, offset: 111, flags: DIFlagBitField, extraData: i64 96)
!277 = !DIDerivedType(tag: DW_TAG_member, name: "window", scope: !260, file: !261, line: 55, baseType: !137, size: 16, offset: 112)
!278 = !DIDerivedType(tag: DW_TAG_member, name: "check", scope: !260, file: !261, line: 56, baseType: !244, size: 16, offset: 128)
!279 = !DIDerivedType(tag: DW_TAG_member, name: "urg_ptr", scope: !260, file: !261, line: 57, baseType: !137, size: 16, offset: 144)
!280 = !DILabel(scope: !2, name: "out", file: !3, line: 172)
!281 = !DICompositeType(tag: DW_TAG_array_type, baseType: !161, size: 112, elements: !282)
!282 = !{!283}
!283 = !DISubrange(count: 14)
!284 = !{i32 7, !"Dwarf Version", i32 5}
!285 = !{i32 2, !"Debug Info Version", i32 3}
!286 = !{i32 1, !"wchar_size", i32 4}
!287 = !{i32 7, !"frame-pointer", i32 2}
!288 = !{!"clang version 16.0.6"}
!289 = distinct !DISubprogram(name: "xdp_port_rewrite_func", scope: !3, file: !3, line: 57, type: !4, scopeLine: 58, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !20, retainedNodes: !290)
!290 = !{!291}
!291 = !DILocalVariable(name: "ctx", arg: 1, scope: !289, file: !3, line: 57, type: !7)
!292 = !DILocation(line: 0, scope: !289)
!293 = !DILocation(line: 59, column: 2, scope: !289)
!294 = distinct !DISubprogram(name: "xdp_vlan_swap_func", scope: !3, file: !3, line: 66, type: !4, scopeLine: 67, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !20, retainedNodes: !295)
!295 = !{!296, !297, !298, !299, !300, !301}
!296 = !DILocalVariable(name: "ctx", arg: 1, scope: !294, file: !3, line: 66, type: !7)
!297 = !DILocalVariable(name: "data_end", scope: !294, file: !3, line: 68, type: !68)
!298 = !DILocalVariable(name: "data", scope: !294, file: !3, line: 69, type: !68)
!299 = !DILocalVariable(name: "nh", scope: !294, file: !3, line: 72, type: !180)
!300 = !DILocalVariable(name: "nh_type", scope: !294, file: !3, line: 73, type: !6)
!301 = !DILocalVariable(name: "eth", scope: !294, file: !3, line: 76, type: !186)
!302 = !DILocation(line: 0, scope: !294)
!303 = !DILocation(line: 68, column: 38, scope: !294)
!304 = !{!305, !306, i64 4}
!305 = !{!"xdp_md", !306, i64 0, !306, i64 4, !306, i64 8, !306, i64 12, !306, i64 16, !306, i64 20}
!306 = !{!"int", !307, i64 0}
!307 = !{!"omnipotent char", !308, i64 0}
!308 = !{!"Simple C/C++ TBAA"}
!309 = !DILocation(line: 68, column: 27, scope: !294)
!310 = !DILocation(line: 68, column: 19, scope: !294)
!311 = !DILocation(line: 69, column: 34, scope: !294)
!312 = !{!305, !306, i64 0}
!313 = !DILocation(line: 69, column: 23, scope: !294)
!314 = !DILocation(line: 69, column: 15, scope: !294)
!315 = !DILocalVariable(name: "nh", arg: 1, scope: !316, file: !181, line: 124, type: !319)
!316 = distinct !DISubprogram(name: "parse_ethhdr", scope: !181, file: !181, line: 124, type: !317, scopeLine: 127, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !20, retainedNodes: !321)
!317 = !DISubroutineType(types: !318)
!318 = !{!6, !319, !68, !320}
!319 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !180, size: 64)
!320 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !186, size: 64)
!321 = !{!315, !322, !323}
!322 = !DILocalVariable(name: "data_end", arg: 2, scope: !316, file: !181, line: 125, type: !68)
!323 = !DILocalVariable(name: "ethhdr", arg: 3, scope: !316, file: !181, line: 126, type: !320)
!324 = !DILocation(line: 0, scope: !316, inlinedAt: !325)
!325 = distinct !DILocation(line: 77, column: 12, scope: !294)
!326 = !DILocalVariable(name: "nh", arg: 1, scope: !327, file: !181, line: 79, type: !319)
!327 = distinct !DISubprogram(name: "parse_ethhdr_vlan", scope: !181, file: !181, line: 79, type: !328, scopeLine: 83, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !20, retainedNodes: !337)
!328 = !DISubroutineType(types: !329)
!329 = !{!6, !319, !68, !320, !330}
!330 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !331, size: 64)
!331 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "collect_vlans", file: !181, line: 64, size: 32, elements: !332)
!332 = !{!333}
!333 = !DIDerivedType(tag: DW_TAG_member, name: "id", scope: !331, file: !181, line: 65, baseType: !334, size: 32)
!334 = !DICompositeType(tag: DW_TAG_array_type, baseType: !70, size: 32, elements: !335)
!335 = !{!336}
!336 = !DISubrange(count: 2)
!337 = !{!326, !338, !339, !340, !341, !342, !343, !349, !350}
!338 = !DILocalVariable(name: "data_end", arg: 2, scope: !327, file: !181, line: 80, type: !68)
!339 = !DILocalVariable(name: "ethhdr", arg: 3, scope: !327, file: !181, line: 81, type: !320)
!340 = !DILocalVariable(name: "vlans", arg: 4, scope: !327, file: !181, line: 82, type: !330)
!341 = !DILocalVariable(name: "eth", scope: !327, file: !181, line: 84, type: !186)
!342 = !DILocalVariable(name: "hdrsize", scope: !327, file: !181, line: 85, type: !6)
!343 = !DILocalVariable(name: "vlh", scope: !327, file: !181, line: 86, type: !344)
!344 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !345, size: 64)
!345 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "vlan_hdr", file: !181, line: 42, size: 32, elements: !346)
!346 = !{!347, !348}
!347 = !DIDerivedType(tag: DW_TAG_member, name: "h_vlan_TCI", scope: !345, file: !181, line: 43, baseType: !137, size: 16)
!348 = !DIDerivedType(tag: DW_TAG_member, name: "h_vlan_encapsulated_proto", scope: !345, file: !181, line: 44, baseType: !137, size: 16, offset: 16)
!349 = !DILocalVariable(name: "h_proto", scope: !327, file: !181, line: 87, type: !70)
!350 = !DILocalVariable(name: "i", scope: !327, file: !181, line: 88, type: !6)
!351 = !DILocation(line: 0, scope: !327, inlinedAt: !352)
!352 = distinct !DILocation(line: 129, column: 9, scope: !316, inlinedAt: !325)
!353 = !DILocation(line: 93, column: 14, scope: !354, inlinedAt: !352)
!354 = distinct !DILexicalBlock(scope: !327, file: !181, line: 93, column: 6)
!355 = !DILocation(line: 93, column: 24, scope: !354, inlinedAt: !352)
!356 = !DILocation(line: 93, column: 6, scope: !327, inlinedAt: !352)
!357 = !DILocation(line: 99, column: 17, scope: !327, inlinedAt: !352)
!358 = !{!359, !359, i64 0}
!359 = !{!"short", !307, i64 0}
!360 = !DILocalVariable(name: "h_proto", arg: 1, scope: !361, file: !181, line: 68, type: !70)
!361 = distinct !DISubprogram(name: "proto_is_vlan", scope: !181, file: !181, line: 68, type: !362, scopeLine: 69, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !20, retainedNodes: !364)
!362 = !DISubroutineType(types: !363)
!363 = !{!6, !70}
!364 = !{!360}
!365 = !DILocation(line: 0, scope: !361, inlinedAt: !366)
!366 = distinct !DILocation(line: 106, column: 8, scope: !367, inlinedAt: !352)
!367 = distinct !DILexicalBlock(scope: !368, file: !181, line: 106, column: 7)
!368 = distinct !DILexicalBlock(scope: !369, file: !181, line: 105, column: 39)
!369 = distinct !DILexicalBlock(scope: !370, file: !181, line: 105, column: 2)
!370 = distinct !DILexicalBlock(scope: !327, file: !181, line: 105, column: 2)
!371 = !DILocation(line: 70, column: 20, scope: !361, inlinedAt: !366)
!372 = !DILocation(line: 70, column: 46, scope: !361, inlinedAt: !366)
!373 = !DILocation(line: 106, column: 7, scope: !368, inlinedAt: !352)
!374 = !DILocation(line: 112, column: 18, scope: !368, inlinedAt: !352)
!375 = !DILocation(line: 88, column: 1, scope: !294)
!376 = !DILocation(line: 118, column: 11, scope: !2)
!377 = !DILocation(line: 119, column: 11, scope: !2)
!378 = !DILocation(line: 0, scope: !2)
!379 = !DILocation(line: 96, column: 38, scope: !2)
!380 = !DILocation(line: 96, column: 27, scope: !2)
!381 = !DILocation(line: 96, column: 19, scope: !2)
!382 = !DILocation(line: 97, column: 34, scope: !2)
!383 = !DILocation(line: 97, column: 23, scope: !2)
!384 = !DILocation(line: 97, column: 15, scope: !2)
!385 = !DILocation(line: 0, scope: !316, inlinedAt: !386)
!386 = distinct !DILocation(line: 116, column: 12, scope: !2)
!387 = !DILocation(line: 0, scope: !327, inlinedAt: !388)
!388 = distinct !DILocation(line: 129, column: 9, scope: !316, inlinedAt: !386)
!389 = !DILocation(line: 93, column: 14, scope: !354, inlinedAt: !388)
!390 = !DILocation(line: 93, column: 24, scope: !354, inlinedAt: !388)
!391 = !DILocation(line: 93, column: 6, scope: !327, inlinedAt: !388)
!392 = !DILocation(line: 118, column: 2, scope: !2)
!393 = !DILocation(line: 119, column: 2, scope: !2)
!394 = !DILocation(line: 124, column: 2, scope: !395)
!395 = distinct !DILexicalBlock(scope: !2, file: !3, line: 124, column: 2)
!396 = !DILocation(line: 126, column: 6, scope: !2)
!397 = !DILocation(line: 99, column: 17, scope: !327, inlinedAt: !388)
!398 = !DILocation(line: 0, scope: !361, inlinedAt: !399)
!399 = distinct !DILocation(line: 106, column: 8, scope: !367, inlinedAt: !388)
!400 = !DILocation(line: 70, column: 20, scope: !361, inlinedAt: !399)
!401 = !DILocation(line: 70, column: 46, scope: !361, inlinedAt: !399)
!402 = !DILocation(line: 106, column: 7, scope: !368, inlinedAt: !388)
!403 = !DILocation(line: 112, column: 18, scope: !368, inlinedAt: !388)
!404 = !DILocalVariable(name: "nh", arg: 1, scope: !405, file: !181, line: 132, type: !319)
!405 = distinct !DISubprogram(name: "parse_ip6hdr", scope: !181, file: !181, line: 132, type: !406, scopeLine: 135, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !20, retainedNodes: !409)
!406 = !DISubroutineType(types: !407)
!407 = !{!6, !319, !68, !408}
!408 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !202, size: 64)
!409 = !{!404, !410, !411, !412}
!410 = !DILocalVariable(name: "data_end", arg: 2, scope: !405, file: !181, line: 133, type: !68)
!411 = !DILocalVariable(name: "ip6hdr", arg: 3, scope: !405, file: !181, line: 134, type: !408)
!412 = !DILocalVariable(name: "ip6h", scope: !405, file: !181, line: 136, type: !202)
!413 = !DILocation(line: 0, scope: !405, inlinedAt: !414)
!414 = distinct !DILocation(line: 130, column: 13, scope: !200)
!415 = !DILocation(line: 142, column: 11, scope: !416, inlinedAt: !414)
!416 = distinct !DILexicalBlock(scope: !405, file: !181, line: 142, column: 6)
!417 = !DILocation(line: 142, column: 15, scope: !416, inlinedAt: !414)
!418 = !DILocation(line: 142, column: 6, scope: !405, inlinedAt: !414)
!419 = !DILocation(line: 148, column: 15, scope: !405, inlinedAt: !414)
!420 = !{!421, !307, i64 6}
!421 = !{!"ipv6hdr", !307, i64 0, !307, i64 0, !307, i64 1, !359, i64 4, !307, i64 6, !307, i64 7, !307, i64 8}
!422 = !DILocation(line: 131, column: 15, scope: !423)
!423 = distinct !DILexicalBlock(scope: !200, file: !3, line: 131, column: 7)
!424 = !DILocation(line: 131, column: 7, scope: !200)
!425 = !DILocation(line: 0, scope: !200)
!426 = !DILocation(line: 137, column: 23, scope: !200)
!427 = !{i64 0, i64 16, !428, i64 0, i64 16, !428, i64 0, i64 16, !428}
!428 = !{!307, !307, i64 0}
!429 = !{i64 0, i64 12, !428, i64 0, i64 12, !428, i64 0, i64 12, !428}
!430 = !DILocation(line: 138, column: 23, scope: !200)
!431 = !DILocalVariable(name: "nh", arg: 1, scope: !432, file: !181, line: 151, type: !319)
!432 = distinct !DISubprogram(name: "parse_iphdr", scope: !181, file: !181, line: 151, type: !433, scopeLine: 154, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !20, retainedNodes: !436)
!433 = !DISubroutineType(types: !434)
!434 = !{!6, !319, !68, !435}
!435 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !231, size: 64)
!436 = !{!431, !437, !438, !439, !440}
!437 = !DILocalVariable(name: "data_end", arg: 2, scope: !432, file: !181, line: 152, type: !68)
!438 = !DILocalVariable(name: "iphdr", arg: 3, scope: !432, file: !181, line: 153, type: !435)
!439 = !DILocalVariable(name: "iph", scope: !432, file: !181, line: 155, type: !231)
!440 = !DILocalVariable(name: "hdrsize", scope: !432, file: !181, line: 156, type: !6)
!441 = !DILocation(line: 0, scope: !432, inlinedAt: !442)
!442 = distinct !DILocation(line: 147, column: 13, scope: !229)
!443 = !DILocation(line: 158, column: 10, scope: !444, inlinedAt: !442)
!444 = distinct !DILexicalBlock(scope: !432, file: !181, line: 158, column: 6)
!445 = !DILocation(line: 158, column: 14, scope: !444, inlinedAt: !442)
!446 = !DILocation(line: 158, column: 6, scope: !432, inlinedAt: !442)
!447 = !DILocation(line: 161, column: 17, scope: !432, inlinedAt: !442)
!448 = !DILocation(line: 161, column: 21, scope: !432, inlinedAt: !442)
!449 = !DILocation(line: 163, column: 13, scope: !450, inlinedAt: !442)
!450 = distinct !DILexicalBlock(scope: !432, file: !181, line: 163, column: 5)
!451 = !DILocation(line: 163, column: 5, scope: !432, inlinedAt: !442)
!452 = !DILocation(line: 167, column: 14, scope: !453, inlinedAt: !442)
!453 = distinct !DILexicalBlock(scope: !432, file: !181, line: 167, column: 6)
!454 = !DILocation(line: 167, column: 24, scope: !453, inlinedAt: !442)
!455 = !DILocation(line: 167, column: 6, scope: !432, inlinedAt: !442)
!456 = !DILocation(line: 173, column: 14, scope: !432, inlinedAt: !442)
!457 = !{!458, !307, i64 9}
!458 = !{!"iphdr", !307, i64 0, !307, i64 0, !307, i64 1, !359, i64 2, !359, i64 4, !359, i64 6, !307, i64 8, !307, i64 9, !359, i64 10, !307, i64 12}
!459 = !DILocation(line: 148, column: 15, scope: !460)
!460 = distinct !DILexicalBlock(scope: !229, file: !3, line: 148, column: 7)
!461 = !DILocation(line: 148, column: 7, scope: !229)
!462 = !DILocation(line: 0, scope: !229)
!463 = !DILocation(line: 154, column: 22, scope: !229)
!464 = !DILocation(line: 155, column: 22, scope: !229)
!465 = !DILocation(line: 108, column: 9, scope: !2)
!466 = !DILocation(line: 122, column: 7, scope: !2)
!467 = !DILocalVariable(name: "nh", arg: 1, scope: !468, file: !181, line: 247, type: !319)
!468 = distinct !DISubprogram(name: "parse_tcphdr", scope: !181, file: !181, line: 247, type: !469, scopeLine: 250, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !20, retainedNodes: !472)
!469 = !DISubroutineType(types: !470)
!470 = !{!6, !319, !68, !471}
!471 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !259, size: 64)
!472 = !{!467, !473, !474, !475, !476}
!473 = !DILocalVariable(name: "data_end", arg: 2, scope: !468, file: !181, line: 248, type: !68)
!474 = !DILocalVariable(name: "tcphdr", arg: 3, scope: !468, file: !181, line: 249, type: !471)
!475 = !DILocalVariable(name: "len", scope: !468, file: !181, line: 251, type: !6)
!476 = !DILocalVariable(name: "h", scope: !468, file: !181, line: 252, type: !259)
!477 = !DILocation(line: 0, scope: !468, inlinedAt: !478)
!478 = distinct !DILocation(line: 164, column: 12, scope: !2)
!479 = !DILocation(line: 254, column: 8, scope: !480, inlinedAt: !478)
!480 = distinct !DILexicalBlock(scope: !468, file: !181, line: 254, column: 6)
!481 = !DILocation(line: 254, column: 12, scope: !480, inlinedAt: !478)
!482 = !DILocation(line: 254, column: 6, scope: !468, inlinedAt: !478)
!483 = !DILocation(line: 168, column: 13, scope: !2)
!484 = !{!485, !359, i64 0}
!485 = !{!"tcphdr", !359, i64 0, !359, i64 2, !306, i64 4, !306, i64 8, !359, i64 12, !359, i64 12, !359, i64 13, !359, i64 13, !359, i64 13, !359, i64 13, !359, i64 13, !359, i64 13, !359, i64 13, !359, i64 13, !359, i64 14, !359, i64 16, !359, i64 18}
!486 = !DILocation(line: 169, column: 13, scope: !2)
!487 = !{!485, !359, i64 2}
!488 = !DILocalVariable(name: "ctx", arg: 1, scope: !489, file: !81, line: 53, type: !7)
!489 = distinct !DISubprogram(name: "xdp_add_to_queue", scope: !81, file: !81, line: 53, type: !490, scopeLine: 54, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !20, retainedNodes: !497)
!490 = !DISubroutineType(types: !491)
!491 = !{!12, !7, !492, !492, !494, !495, !495}
!492 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !493, size: 64)
!493 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !119)
!494 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !131)
!495 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !496, size: 64)
!496 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !70)
!497 = !{!488, !498, !499, !500, !501, !502, !503}
!498 = !DILocalVariable(name: "saddr", arg: 2, scope: !489, file: !81, line: 53, type: !492)
!499 = !DILocalVariable(name: "daddr", arg: 3, scope: !489, file: !81, line: 53, type: !492)
!500 = !DILocalVariable(name: "isv6", arg: 4, scope: !489, file: !81, line: 53, type: !494)
!501 = !DILocalVariable(name: "sport", arg: 5, scope: !489, file: !81, line: 53, type: !495)
!502 = !DILocalVariable(name: "dport", arg: 6, scope: !489, file: !81, line: 53, type: !495)
!503 = !DILocalVariable(name: "data", scope: !489, file: !81, line: 55, type: !116)
!504 = !DILocation(line: 0, scope: !489, inlinedAt: !505)
!505 = distinct !DILocation(line: 171, column: 11, scope: !2)
!506 = !DILocation(line: 55, column: 2, scope: !489, inlinedAt: !505)
!507 = !DILocation(line: 55, column: 19, scope: !489, inlinedAt: !505)
!508 = !DILocation(line: 57, column: 18, scope: !489, inlinedAt: !505)
!509 = !{i64 0, i64 16, !428, i64 0, i64 16, !428, i64 0, i64 16, !428, i64 0, i64 4, !510}
!510 = !{!306, !306, i64 0}
!511 = !DILocation(line: 58, column: 7, scope: !489, inlinedAt: !505)
!512 = !DILocation(line: 58, column: 18, scope: !489, inlinedAt: !505)
!513 = !DILocation(line: 59, column: 7, scope: !489, inlinedAt: !505)
!514 = !DILocation(line: 59, column: 12, scope: !489, inlinedAt: !505)
!515 = !{!516, !307, i64 32}
!516 = !{!"packetrec", !307, i64 0, !307, i64 16, !307, i64 32, !359, i64 34, !359, i64 36}
!517 = !DILocation(line: 60, column: 7, scope: !489, inlinedAt: !505)
!518 = !DILocation(line: 60, column: 16, scope: !489, inlinedAt: !505)
!519 = !{!516, !359, i64 34}
!520 = !DILocation(line: 61, column: 7, scope: !489, inlinedAt: !505)
!521 = !DILocation(line: 61, column: 16, scope: !489, inlinedAt: !505)
!522 = !{!516, !359, i64 36}
!523 = !DILocation(line: 63, column: 6, scope: !524, inlinedAt: !505)
!524 = distinct !DILexicalBlock(scope: !489, file: !81, line: 63, column: 6)
!525 = !DILocation(line: 67, column: 1, scope: !489, inlinedAt: !505)
!526 = !DILocation(line: 171, column: 2, scope: !2)
!527 = !DILocation(line: 172, column: 1, scope: !2)
!528 = !DILocation(line: 0, scope: !529, inlinedAt: !536)
!529 = distinct !DISubprogram(name: "xdp_stats_record_action", scope: !81, file: !81, line: 33, type: !530, scopeLine: 34, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !20, retainedNodes: !532)
!530 = !DISubroutineType(types: !531)
!531 = !{!12, !7, !12}
!532 = !{!533, !534, !535}
!533 = !DILocalVariable(name: "ctx", arg: 1, scope: !529, file: !81, line: 33, type: !7)
!534 = !DILocalVariable(name: "action", arg: 2, scope: !529, file: !81, line: 33, type: !12)
!535 = !DILocalVariable(name: "rec", scope: !529, file: !81, line: 39, type: !92)
!536 = distinct !DILocation(line: 173, column: 9, scope: !2)
!537 = !DILocation(line: 39, column: 24, scope: !529, inlinedAt: !536)
!538 = !DILocation(line: 40, column: 7, scope: !539, inlinedAt: !536)
!539 = distinct !DILexicalBlock(scope: !529, file: !81, line: 40, column: 6)
!540 = !DILocation(line: 40, column: 6, scope: !529, inlinedAt: !536)
!541 = !DILocation(line: 47, column: 17, scope: !529, inlinedAt: !536)
!542 = !{!543, !544, i64 0}
!543 = !{!"datarec", !544, i64 0, !544, i64 8}
!544 = !{!"long long", !307, i64 0}
!545 = !DILocation(line: 48, column: 25, scope: !529, inlinedAt: !536)
!546 = !DILocation(line: 48, column: 41, scope: !529, inlinedAt: !536)
!547 = !DILocation(line: 48, column: 34, scope: !529, inlinedAt: !536)
!548 = !DILocation(line: 48, column: 19, scope: !529, inlinedAt: !536)
!549 = !DILocation(line: 48, column: 7, scope: !529, inlinedAt: !536)
!550 = !DILocation(line: 48, column: 16, scope: !529, inlinedAt: !536)
!551 = !{!543, !544, i64 8}
!552 = !DILocation(line: 50, column: 9, scope: !529, inlinedAt: !536)
!553 = !DILocation(line: 50, column: 2, scope: !529, inlinedAt: !536)
!554 = !DILocation(line: 51, column: 1, scope: !529, inlinedAt: !536)
!555 = !DILocation(line: 173, column: 2, scope: !2)
!556 = !DILocation(line: 174, column: 1, scope: !2)
