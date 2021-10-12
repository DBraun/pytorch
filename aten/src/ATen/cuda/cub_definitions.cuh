#pragma once

#if !defined(USE_ROCM)
#include <cuda.h>
#include <cub/version.cuh>
#else
#define CUB_VERSION 0
#endif

// cub sort support for __nv_bfloat16 is added to cub 1.13 in:
// https://github.com/NVIDIA/cub/pull/306
#if CUB_VERSION >= 101300
#define CUB_SUPPORTS_NV_BFLOAT16() true
#else
#define CUB_SUPPORTS_NV_BFLOAT16() false
#endif

// cub sort support for CUB_WRAPPED_NAMESPACE is added to cub 1.13.1 in:
// https://github.com/NVIDIA/cub/pull/326
// CUB_WRAPPED_NAMESPACE is defined globally in cmake/Dependencies.cmake
// starting from CUDA 11.5
#if CUB_VERSION >= 101400
#define USE_GLOBAL_CUB_WRAPPED_NAMESPACE() true
#else
#define USE_GLOBAL_CUB_WRAPPED_NAMESPACE() false
#endif
