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
//+++ Date   : 2020.12.29
//+++ Purpose: Define time stepping block for our input file
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

#pragma once


#include <iostream>
#include <string>

#include "TimeStepping/TimeSteppingType.h"

#include "Utils/MessagePrinter.h"

using namespace std;


class TimeSteppingBlock{
public:
    TimeSteppingType _TimeSteppingType=TimeSteppingType::BACKWARDEULER;
    string _TimeSteppingTypeName="backward-euler";
    bool _Adaptive=false;
    int _OptIters=3;// for adaptive stepping
    double _GrowthFactor=1.1;
    double _CutBackFactor=0.85;

    double _Dt=1.0e-5;
    double _FinalT=1.0e-3;
    double _DtMin=1.0e-12;
    double _DtMax=1.0e2;

    void Init(){
        _TimeSteppingType=TimeSteppingType::BACKWARDEULER;
        _TimeSteppingTypeName="backward-euler";
        _Adaptive=false;
        _OptIters=3;// for adaptive stepping
        _GrowthFactor=1.1;
        _CutBackFactor=0.85;
        _Dt=1.0e-5;
        _DtMin=1.0e-12;
        _DtMax=1.0e2;
        _FinalT=1.0e-3;
    }
};