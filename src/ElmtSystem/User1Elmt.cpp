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
//+++ Purpose: implement the residual and jacobian for the UEL1
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

#include "ElmtSystem/User1Elmt.h"

void User1Elmt::ComputeAll(const FECalcType &calctype,const LocalElmtInfo &elmtinfo,const double (&ctan)[3],
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
        MessagePrinter::PrintErrorTxt("unsupported calculation type in User1Elmt, please check your related code");
        MessagePrinter::AsFem_Exit();
    }
}
//***************************************************************************
void User1Elmt::ComputeResidual(const LocalElmtInfo &elmtinfo,
                                const LocalElmtSolution &soln,
                                const LocalShapeFun &shp,
                                const Materials &Mate,const Materials &MateOld,
                                VectorXd &localR) {
    //***********************************************************
    //*** get rid of unused warning
    //***********************************************************
    if(elmtinfo.dt||soln.gpU[0]||shp.test||Mate.GetScalarMate().size()||MateOld.GetScalarMate().size()) {}
    double rho,Cp,K,Q;
    rho=Mate.ScalarMaterials("rho"); // density
    Cp=Mate.ScalarMaterials("Cp");   // capacity
    K=Mate.ScalarMaterials("K");     // thermal conductivity coefficient
    Q=Mate.ScalarMaterials("Q");     // heat source
    // R_T
    localR(1)=rho*Cp*soln.gpV[1]*shp.test
        +K*(soln.gpGradU[1]*shp.grad_test)
        -Q*shp.test;

}
//*****************************************************************************
void User1Elmt::ComputeJacobian(const LocalElmtInfo &elmtinfo,const double (&ctan)[3],
                                const LocalElmtSolution &soln,
                                const LocalShapeFun &shp,
                                const Materials &Mate,const Materials &MateOld,
                                MatrixXd &localK) {
    //***********************************************************
    //*** get rid of unused warning
    //***********************************************************
    if(elmtinfo.dt||ctan[0]||soln.gpU[0]||Mate.GetScalarMate().size()||MateOld.GetScalarMate().size()||shp.test){}

    double rho,Cp,K;
    rho=Mate.ScalarMaterials("rho"); // density
    Cp=Mate.ScalarMaterials("Cp");   // capacity
    K=Mate.ScalarMaterials("K");     // thermal conductivity coefficient

    // K_T,T
    localK(1,1)=rho*Cp*shp.trial*shp.test*ctan[1]
        +K*(shp.grad_trial*shp.grad_test)*ctan[0];

}
//*******************************************************************************
void User1Elmt::ComputeProjection(const LocalElmtInfo &elmtinfo,const double (&ctan)[3],
                                  const LocalElmtSolution &soln,
                                  const LocalShapeFun &shp,
                                  const Materials &Mate,const Materials &MateOld,
                                  ScalarMateType &gpProj) {
    //***********************************************************
    //*** get rid of unused warning
    //***********************************************************
    if(elmtinfo.dt||ctan[0]||soln.gpU[0]||shp.test||Mate.GetScalarMate().size()||MateOld.GetScalarMate().size()||gpProj.size()){}

}
