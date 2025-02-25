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
//+++ Date   : 2021.08.05
//+++ Purpose: Implement the reader for [mates] block
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

#include "InputSystem/MatesBlockReader.h"


void MatesBlockReader::PrintHelper(){
    MessagePrinter::PrintStars(MessageColor::BLUE);
    MessagePrinter::PrintNormalTxt("The complete information for [mates] block:",MessageColor::BLUE);
    MessagePrinter::PrintNormalTxt("[mates]",MessageColor::BLUE);
    MessagePrinter::PrintNormalTxt("  [mate-1]",MessageColor::BLUE);
    MessagePrinter::PrintNormalTxt("    type=mate-type-1",MessageColor::BLUE);
    MessagePrinter::PrintNormalTxt("    params=val1 val2 ...",MessageColor::BLUE);
    MessagePrinter::PrintNormalTxt("  [end]",MessageColor::BLUE);
    MessagePrinter::PrintNormalTxt("  [mate-2]",MessageColor::BLUE);
    MessagePrinter::PrintNormalTxt("    type=mate-type-2",MessageColor::BLUE);
    MessagePrinter::PrintNormalTxt("    params=val3 val4",MessageColor::BLUE);
    MessagePrinter::PrintNormalTxt("  [end]",MessageColor::BLUE);
    MessagePrinter::PrintNormalTxt("[end]",MessageColor::BLUE);

    MessagePrinter::PrintStars(MessageColor::BLUE);

}

//*******************************************************************
bool MatesBlockReader::ReadMatesBlock(ifstream &in, string str, const int &lastendlinenum, int &linenum, MateSystem &mateSystem){
    // each bc block should looks like:
    //   [mate1]
    //     type=elastic
    //     params=1.0 2.0
    //   [end]
    // important: now , str already contains [mate] !!!

    bool HasMateBlock=false;
    MateBlock mateBlock;
    string tempstr,str0;
    vector<double> number;
    string msg;

    bool HasElmt=false;
    bool HasValue=false;
    bool HasBlock=false;

    mateBlock.Init();

    // now str="[mates]"
    while (linenum<=lastendlinenum){
        getline(in,str);linenum+=1;
        str0=str;
        str=StringUtils::StrToLower(str);
        str=StringUtils::RemoveStrSpace(str);
        if(StringUtils::IsCommentLine(str)||str.size()<1) continue;

        if((str.find('[')!=string::npos&&str.find(']')!=string::npos)&&
          (str.find("[end]")==string::npos&&str.find("[END]")==string::npos)){
            tempstr=StringUtils::RemoveStrSpace(str0);
            mateBlock.Init();
            HasElmt=false;
            HasValue=false;
            HasBlock=false;
            if(tempstr.size()<3){
                MessagePrinter::PrintErrorInLineNumber(linenum);
                MessagePrinter::PrintErrorTxt("no material block name found in [mates] sub block",false);
                MessagePrinter::AsFem_Exit();
                return false;
            }
            else{
                mateBlock._MateBlockName=tempstr.substr(1,tempstr.size()-1-1);
                HasBlock=true;
            }
            while(str.find("[end]")==string::npos&&str.find("[END]")==string::npos){
                getline(in,str);linenum+=1;
                str=StringUtils::StrToLower(str);
                str0=str;
                str=StringUtils::RemoveStrSpace(str0);
                
                if(StringUtils::IsCommentLine(str)||str.size()<1) continue;
                
                
                if(str.find("helper")!=string::npos){
                    PrintHelper();
                    return false;
                }
                else if(str.find("type=")!=string::npos){
                    string substr=str.substr(str.find_first_of('=')+1);
                    if(substr.find("constpoisson")!=string::npos&&substr.length()==12){
                        mateBlock._MateTypeName="constpoisson";
                        mateBlock._MateType=MateType::CONSTPOISSONMATE;
                        HasElmt=true;
                    }
                    else if(substr.find("nlpoisson")!=string::npos&&substr.length()==9){
                        mateBlock._MateTypeName="nlpoisson";
                        mateBlock._MateType=MateType::NLPOISSONMATE;
                        HasElmt=true;
                    }
                    else if(substr.find("constdiffusion")!=string::npos&&substr.length()==14){
                        mateBlock._MateTypeName="constdiffusion";
                        mateBlock._MateType=MateType::CONSTDIFFUSIONMATE;
                        HasElmt=true;
                    }
                    else if(substr.find("nldiffusion")!=string::npos&&substr.length()==11){
                        mateBlock._MateTypeName="nldiffusion";
                        mateBlock._MateType=MateType::NLDIFFUSIONMATE;
                        HasElmt=true;
                    }
                    else if(substr.find("diffneohookeanmate")!=string::npos&&substr.length()==18){
                        mateBlock._MateTypeName="diffneohookeanmate";
                        mateBlock._MateType=MateType::DIFFNEOHOOKEANMATE;
                        HasElmt=true;
                    }
                    else if(substr.find("doublewellpotential")!=string::npos&&substr.length()==19){
                        mateBlock._MateTypeName="doublewellpotential";
                        mateBlock._MateType=MateType::DOUBLEWELLFREENERGYMATE;
                        HasElmt=true;
                    }
                    else if(substr.find("idealsolution")!=string::npos&&substr.length()==13){
                        mateBlock._MateTypeName="idealsolution";
                        mateBlock._MateType=MateType::IDEALSOLUTIONFREENERGYMATE;
                        HasElmt=true;
                    }

                    else if(substr.find("linearelastic")!=string::npos&&substr.length()==13){
                        mateBlock._MateTypeName="linearelastic";
                        mateBlock._MateType=MateType::LINEARELASTICMATE;
                        HasElmt=true;
                    }
                    else if(substr.find("incresmallstrain")!=string::npos&&substr.length()==16){
                        mateBlock._MateTypeName="incresmallstrain";
                        mateBlock._MateType=MateType::INCREMENTSMALLSTRAINMATE;
                        HasElmt=true;
                    }
                    else if(substr.find("saintvenant")!=string::npos&&substr.length()==11){
                        mateBlock._MateTypeName="saintvenant";
                        mateBlock._MateType=MateType::SAINTVENANTMATE;
                        HasElmt=true;
                    }
                    else if(substr.find("neohookean")!=string::npos&&substr.length()==10){
                        mateBlock._MateTypeName="neohookean";
                        mateBlock._MateType=MateType::NEOHOOKEANMATE;
                        HasElmt=true;
                    }
                    else if(substr.find("mooneyrivlin")!=string::npos&&substr.length()==12){
                        mateBlock._MateTypeName="mooneyrivlin";
                        mateBlock._MateType=MateType::MOONEYRIVLINMATE;
                        HasElmt=true;
                    }
                    else if(substr.find("plastic1d")!=string::npos&&substr.length()==9){
                        mateBlock._MateTypeName="plastic1d";
                        mateBlock._MateType=MateType::PLASTIC1DMATE;
                        HasElmt=true;
                    }
                    else if(substr.find("j2plasticity")!=string::npos&&substr.length()==12){
                        mateBlock._MateTypeName="j2plasticity";
                        mateBlock._MateType=MateType::J2PLASTICITYMATE;
                        HasElmt=true;
                    }
                    else if(substr.find("wavemate")!=string::npos&&substr.length()==8){
                        mateBlock._MateTypeName="wavemate";
                        mateBlock._MateType=MateType::WAVEMATE;
                        HasElmt=true;
                    }
                    else if(substr.find("thermalmate")!=string::npos&&substr.length()==11){
                        mateBlock._MateTypeName="thermal-material";
                        mateBlock._MateType=MateType::THERMALMATE;
                        HasElmt=true;
                    }
                    else if(substr.find("thermelastic")!=string::npos&&substr.length()==12){
                        mateBlock._MateTypeName="thermelastic";
                        mateBlock._MateType=MateType::THERMALELASTICMATE;
                        HasElmt=true;
                    }
                    else if(substr.find("lpffracture")!=string::npos&&substr.length()==11){
                        mateBlock._MateTypeName="lpffracture";
                        mateBlock._MateType=MateType::LINEARELASTICPFFRACTUREMATE;
                        HasElmt=true;
                    }
                    else if(substr.find("miehefracmate")!=string::npos&&substr.length()==13){
                        mateBlock._MateTypeName="miehefracmate";
                        mateBlock._MateType=MateType::MIEHEFRACTUREMATE;
                        HasElmt=true;
                    }
                    else if(substr.find("stressdecompositionmate")!=string::npos&&substr.length()==23){
                        mateBlock._MateTypeName="stressdecompositionmate";
                        mateBlock._MateType=MateType::STRESSDECOMPOSITIONMATE;
                        HasElmt=true;
                    }
                    else if(substr.find("neohookeanpffracturemate")!=string::npos&&substr.length()==24){
                        mateBlock._MateTypeName="neohookeanpffracturemate";
                        mateBlock._MateType=MateType::NEOHOOKEANPFFRACTUREMATE;
                        HasElmt=true;
                    }
                    else if(substr.find("diffusionfracturemate")!=string::npos&&substr.length()==21){
                        mateBlock._MateTypeName="diffusionfracturemate";
                        mateBlock._MateType=MateType::DIFFUSIONFRACTUREMATE;
                        HasElmt=true;
                    }
                    else if(substr.find("elasticch")!=string::npos&&substr.length()==9){
                        mateBlock._MateTypeName="elasticch";
                        mateBlock._MateType=MateType::ELASTICCAHNHILLIARDMATE;
                        HasElmt=true;
                    }
                    else if(substr.find("kobayashimate")!=string::npos&&substr.length()==13){
                        mateBlock._MateTypeName="kobayashimate";
                        mateBlock._MateType=MateType::KOBAYASHIMATE;
                        HasElmt=true;
                    }
                    else if(substr.find("linearelasticchmate")!=string::npos&&substr.length()==19){
                        mateBlock._MateTypeName="linearelasticchmate";
                        mateBlock._MateType=MateType::LINEARELASTICCHMATE;
                        HasElmt=true;
                    }
                    else if(substr.find("user")!=string::npos){
                        number=StringUtils::SplitStrNum(substr);
                        if(number.size()<1){
                            MessagePrinter::PrintErrorInLineNumber(linenum);
                            msg="no user number found for umat in the ["+mateBlock._MateBlockName+"] block, 'type=user1,user2,...,user20' is expected";
                            MessagePrinter::PrintErrorTxt(msg,false);
                            MessagePrinter::AsFem_Exit();
                            return false;
                        }

                        if(int(number[0])<1||int(number[0])>20){
                            MessagePrinter::PrintErrorInLineNumber(linenum);
                            msg="user number is invalid in the ["+mateBlock._MateBlockName+"] block, 'type=user1,user2,...,user20' is expected";
                            MessagePrinter::PrintErrorTxt(msg,false);
                            MessagePrinter::AsFem_Exit();
                            return false;
                        }
                        else{
                            mateBlock._MateTypeName=str.substr(str.find_first_of('=')+1);
                            switch(int(number[0])){
                                case 1:
                                  mateBlock._MateType=MateType::USER1MATE;
                                  break;
                                case 2:
                                  mateBlock._MateType=MateType::USER2MATE;
                                  break;
                                case 3:
                                  mateBlock._MateType=MateType::USER3MATE;
                                  break;
                                case 4:
                                  mateBlock._MateType=MateType::USER4MATE;
                                  break;
                                case 5:
                                  mateBlock._MateType=MateType::USER5MATE;
                                  break;
                                case 6:
                                  mateBlock._MateType=MateType::USER6MATE;
                                  break;
                                case 7:
                                  mateBlock._MateType=MateType::USER7MATE;
                                  break;
                                case 8:
                                  mateBlock._MateType=MateType::USER8MATE;
                                  break;
                                case 9:
                                  mateBlock._MateType=MateType::USER9MATE;
                                  break;
                                case 10:
                                  mateBlock._MateType=MateType::USER10MATE;
                                  break;
                                case 11:
                                  mateBlock._MateType=MateType::USER11MATE;
                                  break;
                                case 12:
                                  mateBlock._MateType=MateType::USER12MATE;
                                  break;
                                case 13:
                                  mateBlock._MateType=MateType::USER13MATE;
                                  break;
                                case 14:
                                  mateBlock._MateType=MateType::USER14MATE;
                                  break;
                                case 15:
                                  mateBlock._MateType=MateType::USER15MATE;
                                  break;
                                case 16:
                                  mateBlock._MateType=MateType::USER16MATE;
                                  break;
                                case 17:
                                  mateBlock._MateType=MateType::USER17MATE;
                                  break;
                                case 18:
                                  mateBlock._MateType=MateType::USER18MATE;
                                  break;
                                case 19:
                                  mateBlock._MateType=MateType::USER19MATE;
                                  break;
                                case 20:
                                  mateBlock._MateType=MateType::USER20MATE;
                                  break;
                                default:
                                  mateBlock._MateType=MateType::NULLMATE;
                                  break;
                            }
                            HasElmt=true;
                        }
                    }
                    else{
                        msg="unsupported material in the ["+mateBlock._MateBlockName+"] block, 'type="+mateBlock._MateTypeName+"' is invalid";
                        MessagePrinter::PrintErrorTxt(msg);
                        MessagePrinter::AsFem_Exit();
                    }
                }
                else if(str0.find("params=")!=string::npos){
                    if(!HasElmt){
                        msg="no type= found in ["+mateBlock._MateBlockName+"] block, parameters must be given after 'type='";
                        MessagePrinter::PrintErrorTxt(msg);
                        MessagePrinter::AsFem_Exit();
                    }
                    number=StringUtils::SplitStrNum(str0);
                    if(number.size()<1){
                        MessagePrinter::PrintErrorInLineNumber(linenum);
                        msg="parameters can not be found in ["+mateBlock._MateBlockName+"] block, 'params=x y z..' is expected";
                        MessagePrinter::PrintErrorTxt(msg);
                        MessagePrinter::AsFem_Exit();
                        return false;
                    }
                    else{
                        mateBlock._Parameters.clear();
                        mateBlock._Parameters=number;
                        HasValue=true;
                    }
                }
            }
            if(HasBlock&&HasElmt){
                HasBlock=true;
                if(!HasValue) {
                    mateBlock._Parameters.clear();
                    mateBlock._Parameters.push_back(1.0);
                }
                mateSystem.AddBulkMateBlock2List(mateBlock);
                HasMateBlock=true;
                mateBlock.Init();
            }
            else{
                msg="information is not complete in [mates] sub block, some information is missing in ["+mateBlock._MateBlockName+"]";
                MessagePrinter::PrintErrorTxt(msg,false);
                if(!HasElmt){
                    msg="no 'type=' option is found in ["+mateBlock._MateBlockName+"] block, 'type=' must be given in each [mates] sub block";
                    MessagePrinter::PrintErrorTxt(msg,false);
                }
                MessagePrinter::AsFem_Exit();
                return false;
            }
        }
    }

    return HasMateBlock;
}
