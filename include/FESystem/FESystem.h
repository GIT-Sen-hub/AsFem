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
//+++ Date   : 2020.11.29
//+++ Purpose: Implement the general tasks of FEM calculation in AsFem,
//+++          i.e. compute residual, compute jacobian
//+++          projection from gauss point to nodal point
//+++          assemble from local element to global, ...
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#pragma once

#include <iostream>
#include <iomanip>
#include <fstream>
#include <chrono>

#include "petsc.h"


//*************************************
//*** For AsFem's own header file
//*************************************
#include "Mesh/Mesh.h"
#include "DofHandler/DofHandler.h"
#include "BCSystem/BCSystem.h"

#include "ElmtSystem/ElmtSystem.h"
#include "MateSystem/MateSystem.h"
#include "SolutionSystem/SolutionSystem.h"

#include "FE/FE.h"
#include "FE/ShapeFun.h"

#include "Utils/Vector3d.h"
#include "Utils/VectorXd.h"
#include "Utils/MatrixXd.h"
#include "ElmtSystem/LocalElmtData.h"

using namespace std;

/**
 * This class responsible for the system matrix calculation, i.e., the calculation of global
 * residual and jacobian, the local to global space assemble.
 */
class FESystem{
public:
    FESystem();
    /**
     * Init the bulk element system
     */
    void InitBulkFESystem(const Mesh &mesh,
                    const DofHandler &dofHandler,
                    FE &fe,
                    SolutionSystem &solution);

public:
    void SetHistNumPerGPoint(const int &n){_nHist=n;}
    void SetProjNumPerNode(const int &n) {_nProj=n;}
    void SetKMatrixFactor(const double &factor){_KMatrixFactor=factor;}
    inline double GetKMatrixFactor() const{return _KMatrixFactor;}
    void ResetMaxAMatrixValue(){_MaxKMatrixValue=-1.0e6;}
    void SetMaxAMatrixValue(const double &val) {_MaxKMatrixValue=val;}
    inline double GetMaxAMatrixValue()const {return _MaxKMatrixValue;}
    inline double GetBulkVolume() const {return _BulkVolumes;}

    /**
     * This function will do the calculation for residual, jacobian, and projection
     */
    void FormBulkFE(const FECalcType &calctype,const double &t,const double &dt,const double (&ctan)[3],
                Mesh &mesh,const DofHandler &dofHandler,FE &fe,
                ElmtSystem &elmtSystem,MateSystem &mateSystem,
                SolutionSystem &solutionSystem,
                Mat &AMATRIX,Vec &RHS);
    
    
private:
    //*********************************************************
    //*** assemble residual to local and global one
    //*********************************************************
    /**
     * assemle the sub element's contribution to local array(from sub-element to local element)
     */
    void AssembleSubResidualToLocalResidual(const int &ndofspernode,const int &dofs,const int &iInd,
                                            const VectorXd &subR,VectorXd &localR);
    /**
     * accumulate all the sub-element's contribution
     */
    void AccumulateLocalResidual(const int &dofs,const vector<double> &dofsactiveflag,const double &JxW,
                                 const VectorXd &localR,vector<double> &sumR);
    /**
     * assemble the local reisudal to the global RHS array
     */
    void AssembleLocalResidualToGlobalResidual(const int &ndofs,const vector<int> &dofindex,
                                            const vector<double> &residual,Vec &rhs);

    //*********************************************************
    //*** assemble jacobian to local and global one
    //*********************************************************
    /**
     * assemble the sub-element's jacobian to the local element
     */
    void AssembleSubJacobianToLocalJacobian(const int &ndofspernode,
                                            const int &iInd,const int &jInd,
                                            const MatrixXd &subK,MatrixXd &localK);
    /**
     * accumulate the sub-element's contribution
     */
    void AccumulateLocalJacobian(const int &dofs,const vector<double> &dofsactiveflag,const double &JxW,
                                 const MatrixXd &localK,vector<double> &sumK);
    /**
     * assemble the local jacobian to the global K matrix
     */
    void AssembleLocalJacobianToGlobalJacobian(const int &ndofs,const vector<int> &dofindex,
                                            const vector<double> &jacobian,Mat &K);

    void AssembleLocalToGlobal(const int &isw,const int &ndofs,vector<int> &elDofs,
                               vector<double> &localK,vector<double> &localR,
                               Mat &AMATRIX,Vec &RHS);
    //*********************************************************
    //*** for projection
    //*********************************************************
    /**
     * Assemble the projected quantities to the global array
     */
    void AssembleLocalProjectionToGlobal(const int &nNodes,const double &DetJac,const ShapeFun &shp,
                                         const map<string,double> &ProjVariables,
                                         const ScalarMateType &ScalarMate,
                                         const VectorMateType &VectorMate,
                                         const Rank2MateType &Rank2Mate,
                                         const Rank4MateType &Rank4Mate,
                                         SolutionSystem &solutionSystem);

    void AssembleLocalProjVariable2Global(const int &nNodes,const double &DetJac,const ShapeFun &shp,
                                          const int &nProj,vector<string> ProjNameVec,const map<string,double> &elProj,Vec &ProjVec);

    void AssembleLocalProjScalarMate2Global(const int &nNodes,const double &DetJac,const ShapeFun &shp,
                                            const int &nProj,vector<string> ProjNameVec,const ScalarMateType &ScalarMate,Vec &ProjVec);

    void AssembleLocalProjVectorMate2Global(const int &nNodes,const double &DetJac,const ShapeFun &shp,
                                            const int &nProj,vector<string> ProjNameVec,const VectorMateType &VectorMate,Vec &ProjVec);

    void AssembleLocalProjRank2Mate2Global(const int &nNodes,const double &DetJac,const ShapeFun &shp,
                                            const int &nProj,vector<string> ProjNameVec,const Rank2MateType &Rank2Mate,Vec &ProjVec);

    void AssembleLocalProjRank4Mate2Global(const int &nNodes,const double &DetJac,const ShapeFun &shp,
                                            const int &nProj,vector<string> ProjNameVec,const Rank4MateType &Rank4Mate,Vec &ProjVec);

    /**
     * the final projection function for the quantities from gauss point to the nodal one
     */
    void Projection(const int &nTotalNodes,SolutionSystem &solutionSystem);


    //*********************************************************
    //*** for material properties  variables
    //*********************************************************
    /**
     * assemble the local material properties to the global array
     */
    void AssembleLocalMaterialsToGlobal(const int &e,const int &ngp,const int &gpInd,const Materials &mate,SolutionSystem &solutionSystem);
    void AssembleLocalHistToGlobal(const int &e,const int &ngp,SolutionSystem &solutionSystem);
    

public:
    void PrintFESystemInfo() const;



private:
    double _BulkVolumes=0.0;
    MatrixXd _localK;    //used in uel, the size is the maximum dofs per element
    VectorXd _localR;    //used in uel, the size is the maximum dofs per element
    MatrixXd _subK; // used in each sub element, the size is the maximum dofs per node
    VectorXd _subR; // used in each sub element, the size is the maximum dofs per node
    vector<double> _K,_R;//used in assemble
    
    
    Nodes _elNodes;
    vector<int> _elConn,_elDofs;
    vector<double> _elDofsActiveFlag;
    vector<double> _elU,_elV;
    vector<double> _elUold,_elVold;
    vector<double> _gpU,_gpV;
    vector<double> _gpUOld,_gpVOld;
    vector<double> _gpHist,_gpHistOld;
    ScalarMateType _gpProj;
    vector<Vector3d> _gpGradU,_gpGradV;
    vector<Vector3d> _gpGradUOld,_gpGradVOld;
    vector<double> _MaterialValues;
    Vector3d _gpCoord;
    int _nHist,_nProj,_nGPoints;
    double _MaxKMatrixValue=-1.0e9,_KMatrixFactor=0.1;

    ElmtType elmttype;
    MateType matetype;
    vector<int> localDofIndex;
    int mateindex;


    LocalElmtInfo _elmtinfo;
    LocalElmtSolution _elmtsoln;
    LocalShapeFun _elmtshp;

private:
    //************************************
    //*** For PETSc related vairables
    PetscMPIInt _rank,_size;
    VecScatter _scatteru,_scatterv,_scatterproj,_scatteruold,_scattervold;
    Vec _Useq,_Uoldseq;// this can contain the ghost node from other processor
    Vec _Vseq,_Voldseq;
    Vec _ProjSeq;
};
