function COM = COM_Bot(HeadYaw,HeadPitch,RShoulderPitch,RShoulderRoll,RElbowYaw,RElbowRoll,LShoulderPitch,LShoulderRoll,LElbowYaw,LElbowRoll,RHipYawPitch,RHipRoll,RHipPitch,RKneePitch,RAnklePitch,RAnkleRoll,LHipYawPitch,LHipRoll,LHipPitch,LKneePitch,LAnklePitch,LAnkleRoll)
COM_Head = HeadCOM(HeadYaw, HeadPitch);
COM_Torso = TorsoCOM;
COM_RArm = RightHandCOM(RShoulderPitch,RShoulderRoll,RElbowYaw,RElbowRoll)
COM_LArm = LeftHandCOM(LShoulderPitch,LShoulderRoll,LElbowYaw,LElbowRoll)
COM_RLeg = RightLegCOM(RHipYawPitch,RHipRoll,RHipPitch,RKneePitch,RAnklePitch,RAnkleRoll)
COM_LLeg = LeftLegCOM(LHipYawPitch,LHipRoll,LHipPitch,LKneePitch,LAnklePitch,LAnkleRoll)

COM = (COM_Head(4)*COM_Head(1:3) +COM_Torso(4)*COM_Torso(1:3) +COM_RArm(4)*COM_RArm(1:3) +COM_RLeg(4)*COM_RLeg(1:3) +COM_LArm(4)*COM_LArm(1:3) +COM_LLeg(4)*COM_LLeg(1:3))/(COM_Torso(4) +COM_Head(4) +COM_RArm(4) +COM_RLeg(4) +COM_LArm(4) +COM_LLeg(4))

end
