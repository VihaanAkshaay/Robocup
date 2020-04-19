function COM_Vector = RightHandCOM(t1,t2,t3,t4)
load('LinkLengthParameters.mat');
Base_F = A_Matrix(0,-ShoulderOffsetY,ShoulderOffsetZ);
RShoulderPitch_F = Base_F *TfMatrix(0,-sym(pi)/2,0,t1);
RShoulderRoll_F = RShoulderPitch_F *TfMatrix(0,sym(pi)/2,0,t2+sym(pi)/2);
RElbowYaw_F = RShoulderRoll_F *TfMatrix(-ElbowOffsetY,sym(pi)/2,UpperArmLength,t3);
RElbowRoll_F = RElbowYaw_F *TfMatrix(0,-sym(pi)/2,0,t4);

COM_Frame = (0.06996 *RShoulderPitch_F *A_Matrix(-1.78,24.96,0.18) + 0.12309 *RShoulderRoll_F *A_Matrix(18.85,-5.77,0.65) + 0.05971 *RElbowYaw_F *A_Matrix(-25.6,0.01,-0.19) + 0.185 *RElbowRoll_F *A_Matrix(65.36,-0.34,-0.02))/(0.06996 + 0.12309 + 0.05971 + 0.185);

COM_Vector = [COM_Frame(1,4),COM_Frame(2,4),COM_Frame(3,4),(0.06996 + 0.12309 + 0.05971 + 0.185)];

end