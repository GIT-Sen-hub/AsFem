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
//+++ Date   : 2020.07.10
//+++ Purpose: Define the boundary condition system in AsFem
//+++          Here we can apply:
//+++               1) dirichlet bc, i.e. displacement, temperature ...
//+++               2) neuman bc, i.e. flux, force
//+++               3) robin bc as well as user-defined-bc (ubc)
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

#include "BCSystem/BCSystem.h"

BCSystem::BCSystem(){
    _nBCBlocks=0;
    _BCBlockList.clear();

    _PenaltyFactor=1.0e15;
    _nBCDim=0;_nBulkDim=0;_nNodesPerBCElmt=0;
    _xi=0.0;_eta=0.0;_JxW=0.0;
    
    _xs[0][0]=0.0;_xs[0][1]=0.0;_xs[0][2]=0.0;
    _xs[1][0]=0.0;_xs[1][1]=0.0;_xs[1][2]=0.0;
    _xs[2][0]=0.0;_xs[2][1]=0.0;_xs[2][2]=0.0;

    _dist=0.0;

    _normals=0.0;

    _elmtinfo.dt=0.0;
    _elmtinfo.t=0.0;
    _elmtinfo.gpCoords=0.0;
    _elmtinfo.nDim=0;
    _elmtinfo.nDofs=0;
    _elmtinfo.nNodes=0;

    // here we assume the maximum dofs of each BC element is 10!
    _soln.gpU.resize(10);
    _soln.gpGradU.resize(10);
    _soln.gpV.resize(10);
    _soln.gpGradV.resize(10);
    // for the old solution in the previous step
    // do we realy need this?
    _soln.gpUold.resize(10);
    _soln.gpGradUold.resize(10);
    _soln.gpVold.resize(10);
    _soln.gpGradVold.resize(10);

    // for shape functions
    _shp.test=0.0;
    _shp.grad_test=0.0;
    _shp.trial=0.0;
    _shp.grad_trial=0.0;

    _localR.Resize(10);
    _localK.Resize(10,10);

}

//************************************
void BCSystem::AddBCBlock2List(BCBlock &bcblock){
    string msg;
    if(_BCBlockList.size()<1){
        _BCBlockList.push_back(bcblock);
        _nBCBlocks=int(_BCBlockList.size());
    }
    else{
        bool NotInList=true;
        for(const auto &it:_BCBlockList){
            if(it._BCBlockName==bcblock._BCBlockName){
                NotInList=false;
                break;
            }
        }
        if(NotInList){
            _BCBlockList.push_back(bcblock);
            _nBCBlocks=static_cast<int>(_BCBlockList.size());
        }
        else{
            msg="duplicated ["+bcblock._BCBlockName+"] in the [bcs] sub block";
            MessagePrinter::PrintErrorTxt(msg);
            MessagePrinter::AsFem_Exit();
        }
    }
}

void BCSystem::InitBCSystem(const Mesh &mesh){
    _PenaltyFactor=1.0e15;
    _nBCDim=0;
    _nBulkDim=mesh.GetBulkMeshDim();
    _nNodesPerBCElmt=mesh.GetBulkMeshNodesNumPerBulkElmt();
    _elNodes.InitNodes(mesh.GetBulkMeshNodesNumPerBulkElmt());

    _xi=0.0;_eta=0.0;_JxW=0.0;
    
    _xs[0][0]=0.0;_xs[0][1]=0.0;_xs[0][2]=0.0;
    _xs[1][0]=0.0;_xs[1][1]=0.0;_xs[1][2]=0.0;
    _xs[2][0]=0.0;_xs[2][1]=0.0;_xs[2][2]=0.0;

    _dist=0.0;

    _normals=0.0;
    
    _elmtinfo.dt=0.0;
    _elmtinfo.t=0.0;
    _elmtinfo.gpCoords=0.0;
    _elmtinfo.nDim=0;
    _elmtinfo.nDofs=0;
    _elmtinfo.nNodes=0;

    // here we assume the maximum dofs of each BC element is 10!
    _soln.gpU.resize(10);
    _soln.gpGradU.resize(10);
    _soln.gpV.resize(10);
    _soln.gpGradV.resize(10);
    // for the old solution in the previous step
    // do we realy need this?
    _soln.gpUold.resize(10);
    _soln.gpGradUold.resize(10);
    _soln.gpVold.resize(10);
    _soln.gpGradVold.resize(10);

    // for shape functions
    _shp.test=0.0;
    _shp.grad_test=0.0;
    _shp.trial=0.0;
    _shp.grad_trial=0.0;

}
