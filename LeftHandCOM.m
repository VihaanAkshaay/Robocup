function COM_Vector = LeftHandCOM(t1,t2,t3,t4)
load('LinkLengthParameters.mat');
Base_F = A_Matrix(0,ShoulderOffsetY,ShoulderOffsetZ);
LShoulderPitch_F = Base_F *TfMatrix(0,-sym(pi)/2,0,t1);
LShoulderRoll_F = LShoulderPitch_F *TfMatrix(0,sym(pi)/2,0,t2+sym(pi)/2);
LElbowYaw_F = LShoulderRoll_F *TfMatrix(ElbowOffsetY,sym(pi)/2,UpperArmLength,t3);
LElbowRoll_F = LElbowYaw_F *TfMatrix(0,-sym(pi)/2,0,t4);

COM_Frame = (0.06996 *LShoulderPitch_F *A_Matrix(-1.78,-24.96,0.18) + 0.12309 *LShoulderRoll_F *A_Matrix(18.85,5.77,0.65) + 0.05971 *LElbowYaw_F *A_Matrix(-25.6,-0.01,-0.19) + 0.185 *LElbowRoll_F *A_Matrix(65.36,0.34,-0.02))/(0.06996 + 0.12309 + 0.05971 + 0.185);

COM_Vector = [COM_Frame(1,4),COM_Frame(2,4),COM_Frame(3,4),(0.06996 + 0.12309 + 0.05971 + 0.185)];

end