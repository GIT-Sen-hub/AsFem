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
//+++ Date   : 2021.09.04
//+++ Purpose: implement the residual and jacobian for the UEL19
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

#include "ElmtSystem/User19Elmt.h"

void User19Elmt::ComputeAll(const FECalcType &calctype,const LocalElmtInfo &elmtinfo,const double (&ctan)[3],
            const LocalElmtSolution &soln,const LocalShapeFun &shp,
            const Materials &Mate,const Materials &MateOld,
            ScalarMateType &gpProj,
            MatrixXd &localK,VectorXd &localR) {
    if(calctype==FECalcType::ComputeResidual){
        ComputeResidual(elmtinfo,soln,shp,Mate,MateOld,localR);
    }
    else if(calctype==FECalcType::ComputeJacobian){
        ComputeJacobian(elmtinfo,ctan,soln,shp,Mate,MateOld,localK);
    }
    else if(calctype==FECalcType::Projection){
        ComputeProjection(elmtinfo,ctan,soln,shp,Mate,MateOld,gpProj);
    }
    else{
        MessagePrinter::PrintErrorTxt("unsupported calculation type in User19Elmt, please check your related code");
        MessagePrinter::AsFem_Exit();
    }
}
//***************************************************************************
void User19Elmt::ComputeResidual(const LocalElmtInfo &elmtinfo,
                                const LocalElmtSolution &soln,
                                const LocalShapeFun &shp,
                                const Materials &Mate,const Materials &MateOld,
                                VectorXd &localR) {
    //***********************************************************
    //*** get rid of unused warning
    //***********************************************************
    if(elmtinfo.dt||soln.gpU[0]||shp.test||Mate.GetScalarMate().size()||MateOld.GetScalarMate().size()) {}

   localR(1)=0.0;

}
//*****************************************************************************
void User19Elmt::ComputeJacobian(const LocalElmtInfo &elmtinfo,const double (&ctan)[3],
                                const LocalElmtSolution &soln,
                                const LocalShapeFun &shp,
                                const Materials &Mate,const Materials &MateOld,
                                MatrixXd &localK) {
    //***********************************************************
    //*** get rid of unused warning
    //***********************************************************
    if(elmtinfo.dt||ctan[0]||soln.gpU[0]||Mate.GetScalarMate().size()||MateOld.GetScalarMate().size()||shp.test){}

    localK(1,1)=0.0;

}
//*******************************************************************************
void User19Elmt::ComputeProjection(const LocalElmtInfo &elmtinfo,const double (&ctan)[3],
                                  const LocalElmtSolution &soln,
                                  const LocalShapeFun &shp,
                                  const Materials &Mate,const Materials &MateOld,
                                  ScalarMateType &gpProj) {
    //***********************************************************
    //*** get rid of unused warning
    //***********************************************************
    if(elmtinfo.dt||ctan[0]||soln.gpU[0]||shp.test||Mate.GetScalarMate().size()||MateOld.GetScalarMate().size()||gpProj.size()){}

}
