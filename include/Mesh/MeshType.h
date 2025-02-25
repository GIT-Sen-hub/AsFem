//****************************************************************
//* This file is part of the AsFem framework
//* A Simple Finite Element Method program (AsFem)
//* All rights reserved, Yang Bai/M3 Group @ CopyRight 2022
//* https://github.com/M3Group/AsFem
//* Licensed under GNU GPLv3, please see LICENSE for details
//* https://www.gnu.org/licenses/gpl-3.0.en.html
//****************************************************************

#ifndef ASFEM_MESHTYPE_H
#define ASFEM_MESHTYPE_H

enum class MeshType{
    NULLTYPE,
    POINT,
    EDGE2,
    EDGE3,
    EDGE4,
    EDGE5,
    TRI3,
    TRI6,
    QUAD4,
    QUAD8,
    QUAD9,
    TET4,
    TET10,
    HEX8,
    HEX20,
    HEX27
};

#endif // ASFEM_MESHTYPE_H