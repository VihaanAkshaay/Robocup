function COM_Vector = LeftLegCOM(t1,t2,t3,t4,t5,t6)
load('LinkLengthParameters.mat')
Base_F = A_Matrix(0,HipOffsetY,-HipOffsetZ);
LHipYawPitch_F = Base_F *TfMatrix(0,-3 *sym(pi)/4,0,t1 - sym(pi)/2);
LHipRoll_F = LHipYawPitch_F *TfMatrix(0,-sym(pi)/2,0,t2 + sym(pi)/4);
LHipPitch_F = LHipRoll_F *TfMatrix(0,sym(pi)/2,0,t3);
LKneePitch_F = LHipPitch_F *TfMatrix(-ThighLength,0,0,t4);
LAnklePitch_F = LKneePitch_F *TfMatrix(-TibiaLength,0,0,t5);
LAnkleRoll = LAnklePitch_F * TfMatrix(0,-sym(pi)/2,0,t6);

COM_Frame = (0.07117 *LHipYawPitch_F *A_Matrix(-7.66,-12,27.17) + 0.1353 *LHipRoll_F *A_Matrix(-16.49,0.29,-4.75) + 0.39421 *LHipPitch_F *A_Matrix(1.32,2.35,-53.52) + 0.29159 *LKneePitch_F *A_Matrix(4.22,2.52,-48.68) + 0.13892 * LAnklePitch_F *A_Matrix(1.42,0.28,6.38) + 0.16175 *LAnkleRoll *A_Matrix(2.54,3.32,-32.41))/(0.07117 + 0.1353 + 0.39421 + 0.29159 + 0.13892 + 0.16175);

COM_Vector = [COM_Frame(1,4),COM_Frame(2,4),COM_Frame(3,4),(0.07117 + 0.1353 + 0.39421 + 0.29159 + 0.13892 + 0.16175)];
end
