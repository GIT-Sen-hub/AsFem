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
//+++ Date   : 2020.07.12
//+++ Purpose: define the [output] block for our input file
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

#pragma once

#include <iostream>
#include <string>
#include <vector>

#include "OutputSystem/OutputType.h"

using namespace std;

class OutputBlock{
public:
    OutputBlock(){
        _Interval=1;
        _OutputFormatName="vtu";
        _OutputFolderName.clear();
        _OutputType=OutputType::VTU;
    }

    int            _Interval;
    string         _OutputFormatName;
    string         _OutputFolderName;
    OutputType     _OutputType;

    void Init(){
        _Interval=1;
        _OutputFormatName="vtu";
        _OutputFolderName.clear();
        _OutputType=OutputType::VTU;
    }

};