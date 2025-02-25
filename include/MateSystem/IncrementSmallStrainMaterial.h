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
//+++ Date   : 2021.04.11
//+++ Purpose: calculate the stress and strain based on incremental
//+++          description for small strain case
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#pragma once

#include "MateSystem/MechanicsMaterialBase.h"

/**
 * This class implement the incremental description for elastic analysis
 * Here the stress and strain are calculated based on delta U(\f$\Delta U\f$)
 */
class IncrementSmallStrainMaterial: public MechanicsMaterialBase{
public:
    /**
     * Initialize material properties in LinearElasticMaterial
     */
    virtual void InitMaterialProperties(const vector<double> &InputParams, const LocalElmtInfo &elmtinfo, const LocalElmtSolution &elmtsoln, Materials &Mate) override;
   
    /**
     * Compute the stress and jacobian in LinearElasticMaterial
     */ 
    virtual void ComputeMaterialProperties(const vector<double> &InputParams, const LocalElmtInfo &elmtinfo, const LocalElmtSolution &elmtsoln, const Materials &MateOld, Materials &Mate) override;


private:
    /**
     * Compute the strain, it could be small strain \f$\mathbf{\varepsilon}\f$, Green-Lagrange tensor \f$\mathbf{E}=\frac{1}{2}(\mathbf{F}^{T}\mathbf{F}-\mathbf{I})\f$.
     * @param elmtinfo the current element information data
     * @param elmtsoln the curent element's solution, include the displacement and its gradient
     * @param Strain the rank-2 strain tensor
     */ 
    virtual void ComputeStrain(const LocalElmtInfo &elmtinfo,const LocalElmtSolution &elmtsoln,RankTwoTensor &Strain) override;

    /**
     * Compute the stress \f$\mathbf{\sigma}\f$ and jacobian matrix \f$\mathbb{C}\f$ .
     * @param InputParams the input material parameters from your input file.
     * @param Strain the input strain tensor, it is calculated from ComputeStrain function.
     * @param Stress the calculated stress tensor \f$\mathbf{\sigma}\f$ for MechanicsElmt.
     * @param Jacobian the calculated 'elasticity' tensor \f$\mathbb{C}\f$, it is the rank-4 tensor for the general constitutive law.
     */
    virtual void ComputeStressAndJacobian(const vector<double> &InputParams,const RankTwoTensor &Strain,
                                          RankTwoTensor &Stress,RankFourTensor &Jacobian) override;

private:
    RankTwoTensor _GradU,_Strain,_StrainOld,_DeltaStrain,_Stress,_StressOld,_DeltaStress,_I,_devStress;
    RankFourTensor _Jac;

};
