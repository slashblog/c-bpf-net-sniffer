# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)

XDP_TARGETS  := kern
USER_TARGETS := loader
USER_TARGETS += stats

COMMON_DIR = ../common

# Extend with another COMMON_OBJS
COMMON_OBJS += $(COMMON_DIR)/common_user_bpf_xdp.o

include $(COMMON_DIR)/common.mk