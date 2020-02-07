//****************************************************************
//* This file is part of the AsFem framework
//* A Simple Finite Element Method program (AsFem)
//* All rights reserved, Yang Bai @ CopyRight 2020
//* https://github.com/walkandthinker/AsFem
//* Licensed under GNU GPLv3, please see LICENSE for details
//* https://www.gnu.org/licenses/gpl-3.0.en.html
//****************************************************************

#include "TimeStepping/TimeStepping.h"


void TimeStepping::SteppingNew(Mesh &mesh,DofHandler &dofHandler,
                BCSystem &bcSystem,ICSystem &icSystem,
                ElmtSystem &elmtSystem,MateSystem &mateSystem,
                EquationSystem &equationSystem,Solution &solution,
                FE &fe,FESystem &feSystem,
                OutputSystem &outputSystem,
                NonlinearSolver &nonlinearsolver,
                FeCtrlInfo &fectrl){
    double dt,dtold,currentime;
    fectrl.CurrentStep=0;
    dtold=_dt0;
    dt=_dt0;
    fectrl.t=0.0;

    bool IsFailed=false;

    

    icSystem.ApplyIC(mesh,dofHandler,solution._Uold);
    VecCopy(solution._Uold,solution._Unew);

    feSystem.FormFE(4,dt,dt,fectrl.ctan,
            mesh,dofHandler,fe,
            elmtSystem,mateSystem,
            solution._Unew,solution._V,
            solution._Hist,solution._HistOld,solution._Proj,
            equationSystem._AMATRIX,equationSystem._RHS);
    
    if(fectrl.IsProjection){
        feSystem.FormFE(9,fectrl.t,fectrl.dt,fectrl.ctan,
                    mesh,dofHandler,fe,elmtSystem,mateSystem,
                    solution._Unew,solution._V,solution._Hist,solution._HistOld,
                    solution._Proj,equationSystem._AMATRIX,equationSystem._RHS);
                        
                        
        outputSystem.WriteResultToVTU(0,mesh,dofHandler,solution._Unew,
                    solution.GetProjNumPerNode(),
                    solution.GetProjNameVec(),
                    solution._Proj);
    }
    else{
        outputSystem.WriteResultToVTU(0,mesh,dofHandler,solution._Unew);
    }

    for(currentime=0.0;currentime<=_FinalTime;){
        fectrl.ctan[0]=1.0;
        fectrl.ctan[1]=1.0/dt;
        fectrl.CurrentStep+=1;
        fectrl.t+=dt;
        IsFailed=false;
        if(nonlinearsolver.SSolve(mesh,dofHandler,elmtSystem,mateSystem,
                bcSystem,icSystem,solution,equationSystem,fe,
                feSystem,fectrl)){
            currentime+=dt;


            PetscPrintf(PETSC_COMM_WORLD,"*** Time=%14.6e, dt=%14.6e, step=%6d, iters=%4d   ***\n",currentime,dt,fectrl.CurrentStep,nonlinearsolver.GetCurrentIters()+1);

            // update solution
            VecCopy(solution._Uold,solution._Uolder);
            VecCopy(solution._Unew,solution._Uold);

            // update the history variable
            feSystem.FormFE(8,currentime,dt,fectrl.ctan,
                mesh,dofHandler,fe,
                elmtSystem,mateSystem,
                solution._Unew,solution._V,
                solution._Hist,solution._HistOld,
                solution._Proj,
                equationSystem._AMATRIX,equationSystem._RHS);
            VecCopy(solution._Hist,solution._HistOld);

            if(fectrl.CurrentStep%_interval==0){
                if(fectrl.IsProjection){
                    feSystem.FormFE(9,fectrl.t,fectrl.dt,fectrl.ctan,
                        mesh,dofHandler,fe,elmtSystem,mateSystem,
                        solution._Unew,solution._V,solution._Hist,solution._HistOld,
                        solution._Proj,equationSystem._AMATRIX,equationSystem._RHS);
                        
                        
                    outputSystem.WriteResultToVTU(fectrl.CurrentStep,mesh,dofHandler,solution._Unew,
                        solution.GetProjNumPerNode(),
                        solution.GetProjNameVec(),
                        solution._Proj);
                }
                else{
                    outputSystem.WriteResultToVTU(fectrl.CurrentStep,mesh,dofHandler,solution._Unew);
                }
                PetscPrintf(PETSC_COMM_WORLD,"*** Write result to [%41s] !!!   ***\n",outputSystem.GetVTUFileName().c_str());
            }
        }
        else{
            // if nonlinear solver failed
            while (dt>_dtmin){
                fectrl.CurrentStep-=1;
                fectrl.t-=dt;
                IsFailed=true;
                dtold=dt;
                dt=dt*_CutFactor;
                fectrl.ctan[0]=1.0;
                fectrl.ctan[1]=1.0/dt;
                fectrl.CurrentStep+=1;
                fectrl.t+=dt;
                PetscPrintf(PETSC_COMM_WORLD,"*** SNES solver failed, reduce dt to dt=%13.5e ***\n",dt);
                if(nonlinearsolver.SSolve(mesh,dofHandler,elmtSystem,mateSystem,
                    bcSystem,icSystem,solution,equationSystem,fe,
                    feSystem,fectrl)){
                    currentime+=dt;
                    VecCopy(solution._Uold,solution._Uolder);
                    VecCopy(solution._Unew,solution._Uold);

                    // update the history variable
                    feSystem.FormFE(8,currentime,dt,fectrl.ctan,
                        mesh,dofHandler,fe,
                        elmtSystem,mateSystem,
                        solution._Unew,solution._V,
                        solution._Hist,solution._HistOld,
                        solution._Proj,
                        equationSystem._AMATRIX,equationSystem._RHS);
                    VecCopy(solution._Hist,solution._HistOld);

                    if(fectrl.CurrentStep%_interval==0){
                        if(fectrl.IsProjection){
                            feSystem.FormFE(9,fectrl.t,fectrl.dt,fectrl.ctan,
                                mesh,dofHandler,fe,elmtSystem,mateSystem,
                                solution._Unew,solution._V,solution._Hist,solution._HistOld,
                                solution._Proj,equationSystem._AMATRIX,equationSystem._RHS);
                        
                        
                            outputSystem.WriteResultToVTU(fectrl.CurrentStep,mesh,dofHandler,solution._Unew,
                                solution.GetProjNumPerNode(),
                                solution.GetProjNameVec(),
                                solution._Proj);
                        }
                        else{
                            outputSystem.WriteResultToVTU(fectrl.CurrentStep,mesh,dofHandler,solution._Unew);
                        }
                        PetscPrintf(PETSC_COMM_WORLD,"*** Write result to [%41s] !!!   ***\n",outputSystem.GetVTUFileName().c_str());
                    }
                    break;
                }
            }
        }

        if(_IsAdaptive){
            if(nonlinearsolver.GetCurrentIters()<_nOpts){
                dtold=dt;
                if(IsFailed){
                    dt=dtold;
                }
                else{
                    dt*=_GrowthFactor;
                }
                if(dt>_dtmax) dt=_dtmax;
            }
            else{
                dtold=dt;
                if(IsFailed){
                    dt=dtold;
                }
                else{
                    dt*=_CutFactor;
                }
                if(dt<_dtmin) dt=_dtmin;
            }
        }
        else{
            dt=dtold;
        }
    }
}