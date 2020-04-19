function COM_Vector = TorsoCOM
COM_Frame = 1.03948 *A_Matrix(-4.15,0.07,42.58);
COM_Vector = [COM_Frame(1,4),COM_Frame(2,4),COM_Frame(3,4),1.03948];
end