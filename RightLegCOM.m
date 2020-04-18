function COM_Vector = RightLegCOM(t1,t2,t3,t4,t5,t6)
load('LinkLengthParameters.mat')
Base_F = A_Matrix(0,-HipOffsetY,-HipOffsetZ)
RHipYawPitch_F = Base_F *TfMatrix(0,-1*sym(pi)/4,0,t1 - sym(pi)/2)
RHipRoll_F = RHipYawPitch_F *TfMatrix(0,-sym(pi)/2,0,t2 - sym(pi)/4)
RHipPitch_F = RHipRoll_F *TfMatrix(0,sym(pi)/2,0,t3)
RKneePitch_F = RHipPitch_F *TfMatrix(-ThighLength,0,0,t4)
RAnklePitch_F = RKneePitch_F *TfMatrix(-TibiaLength,0,0,t5)
RAnkleRoll = RAnklePitch_F * TfMatrix(0,-sym(pi)/2,0,t6)

COM_Frame = (0.07117 *RHipYawPitch_F *A_Matrix(-7.66,12,27.17) + 0.1353 *RHipRoll_F *A_Matrix(-16.49,-0.29,-4.75) + 0.39421 *RHipPitch_F *A_Matrix(1.32,-2.35,-53.52) + 0.29159 *RKneePitch_F *A_Matrix(4.22,-2.52,-48.68) + 0.13892 * RAnklePitch_F *A_Matrix(1.42,-0.28,6.38) + 0.16175 *RAnkleRoll *A_Matrix(2.54,-3.32,-32.41))/(0.07117 + 0.1353 + 0.39421 + 0.29159 + 0.13892 + 0.16175);

COM_Vector = [COM_Frame(0,3),COM_Frame(1,3),COM_Frame(2,3),(0.07117 + 0.1353 + 0.39421 + 0.29159 + 0.13892 + 0.16175)]
end