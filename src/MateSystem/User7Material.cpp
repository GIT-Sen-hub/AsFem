//****************************************************************
//* This file is part of the AsFem framework
//* A Simple Finite Element Method program (AsFem)
//* All rights reserved, Yang Bai/M3 Group @ CopyRight 2022
//* https://github.com/M3Group/AsFem
//* Licensed under GNU GPLv3, please see LICENSE for details
//* https://www.gnu.org/licenses/gpl-3.0.en.html
//****************************************************************
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++ Author : Yang Bai
//+++ Date   : 2021.09.03
//+++ Purpose: Calculate the user-defined-material(umat7)
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

#include "MateSystem/User7Material.h"

void User7Material::InitMaterialProperties(const vector<double> &InputParams, const LocalElmtInfo &elmtinfo, const LocalElmtSolution &elmtsoln, Materials &Mate){
    //***************************************************
    //*** get rid of unused warning
    //***************************************************
    if(InputParams.size()||elmtinfo.dt||elmtsoln.gpU[0]||Mate.GetScalarMate().size()){}

}

//********************************************************************
void User7Material::ComputeMaterialProperties(const vector<double> &InputParams, const LocalElmtInfo &elmtinfo, const LocalElmtSolution &elmtsoln, const Materials &MateOld, Materials &Mate){
    //**************************************************************
    //*** get rid of unused warning
    //**************************************************************
    if(InputParams.size()||elmtinfo.dt||elmtsoln.gpU[0]||MateOld.GetScalarMate().size()||Mate.GetScalarMate().size()){}

}
