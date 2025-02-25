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
//+++ Date   : 2021.02.22
//+++ Purpose: this pps can calculate the area of specific side or
//+++          boundary
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

#include "Postprocess/Postprocess.h"

double Postprocess::AreaPostProcess(vector<string> sidenamelist,const Mesh &mesh,FE &fe){
    double area=0.0;
    int nDim,nNodesPerBCElmt;
    int i,e,ee,gpInd;
    Nodes elNodes;
    elNodes.InitNodes(16);
    double xi,eta,JxW;


    if(sidenamelist.size()<1){
        MessagePrinter::PrintErrorTxt("we can not find any side set name in your AreaPostProcess, please check your input file or your mesh");
        MessagePrinter::AsFem_Exit();
    }


    area=0.0;
    for(const auto &sidename:sidenamelist){
        for(e=1;e<=mesh.GetBulkMeshElmtsNumViaPhysicalName(sidename);e++){
            nDim=mesh.GetBulkMeshDimViaPhyName(sidename);
            nNodesPerBCElmt=mesh.GetBulkMeshNodesNumPerElmtViaPhysicalName(sidename);
            //cout<<"nNodesPerBCElmt="<<nNodesPerBCElmt<<endl;
            ee=mesh.GetBulkMeshIthElmtIDViaPhyName(sidename,e);
            if(nDim==0){
                MessagePrinter::PrintErrorTxt("you can not get the 'area' of a point, the dimension for area postprocess must be 2 or 3");
                MessagePrinter::AsFem_Exit();
            }
            else if(nDim==1){
                // for 1D line
                mesh.GetBulkMeshIthElmtNodes(ee,elNodes);
                for(gpInd=1;gpInd<=fe._LineQPoint.GetQpPointsNum();++gpInd){
                    xi=fe._LineQPoint(gpInd,1);
                    fe._LineShp.Calc(xi,elNodes,true);
                    JxW=fe._LineShp.GetDetJac()*fe._LineQPoint(gpInd,0);
                    for(i=1;i<=nNodesPerBCElmt;++i){
                        area+=fe._LineShp.shape_value(i)*1.0*JxW;
                    }
                }
            }
            else if(nDim==2){
                // for surface case (bulk dim=3, bc dim=2)
                mesh.GetBulkMeshIthElmtNodes(ee,elNodes);
                for(gpInd=1;gpInd<=fe._SurfaceQPoint.GetQpPointsNum();++gpInd){
                    xi=fe._SurfaceQPoint(gpInd,1);
                    eta=fe._SurfaceQPoint(gpInd,2);
                    fe._SurfaceShp.Calc(xi,eta,elNodes,true);
                    JxW=fe._SurfaceShp.GetDetJac()*fe._SurfaceQPoint(gpInd,0);
                    for(i=1;i<=nNodesPerBCElmt;++i){
                        area+=fe._SurfaceShp.shape_value(i)*1.0*JxW;
                    }
                }
            }
            else if(nDim>=3){
                MessagePrinter::PrintErrorTxt("AreaPostProcess can not be used for dim>=3, its unphysical, please check your input file");
                MessagePrinter::AsFem_Exit();
            }
        }
    }
    return area;
}