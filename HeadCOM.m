%Head Forward Kinematics
% t1 - HeadYaw
function COM_Vector = HeadCOM(t1,t2)
load('LinkLengthParameters.mat')
Base_F =  A_Matrix(0,0,NeckOffsetZ);
HeadYaw_F = Base_F *TfMatrix(0,0,0,t1);
HeadPitch_F = HeadYaw_F *TfMatrix(0, -sym(pi)/2,0,t2-sym(pi)/2);
 
COM_Frame = (0.05930 *HeadYaw_F *A_Matrix(-4.15,0.07,42.58) + 0.52065 *HeadPitch_F *A_Matrix(1.2,-0.84,53.53))/(0.05930 + 0.52065);
COM_Vector = [COM_Frame(1,4),COM_Frame(2,4),COM_Frame(3,4),(0.05930 + 0.52065)];

end