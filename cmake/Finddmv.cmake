##############################################################################
## Copyright (c) 2018-2022, Lawrence Livermore National Security, LLC.
##
## Produced at the Lawrence Livermore National Laboratory
##
## LLNL-CODE-758885
##
## All rights reserved.
##
## This file is part of Comb.
##
## For details, see https://github.com/LLNL/Comb
## Please also see the LICENSE file for MIT license.
##############################################################################

find_path(DMV_PATH
    NAMES "libdmv.a"
    PATHS
      ENV DMV_SOURCE_DIR
    DOC "Path to dmv library")


if(DMV_PATH)
    message(STATUS "DMV_PATH:  ${DMV_PATH}")
    set(DMV_FOUND TRUE)
    set(DMV_CXX_COMPILE_FLAGS -I${DMV_PATH}/include)
    set(DMV_INCLUDE_PATH      ${DMV_PATH}/include)
    set(DMV_CXX_LINK_FLAGS    -L${DMV_PATH}/lib)
    set(DMV_CXX_LIBRARIES     ${DMV_SOURCE_DIR}/${CMAKE_STATIC_LIBRARY_PREFIX}dmv${CMAKE_STATIC_LIBRARY_SUFFIX})
    set(DMV_ARCH              )
else()
    set(DMV_FOUND FALSE)
    message(WARNING "dmv library not found")
endif()
