# Robocup
##NAO Humanoid COM related matlab files

###A_Matrix 
This function returns a pure translation matrix which is used to locate the COM wrt to joint frames.

###TfMatrix 
This functio returns a required transformation matrix, which maps the initial frame to the final frame when post multiplied. This takes in Denavit–Hartenberg parameters in the order of alpha, a, d, theta following Craig's convention.

##COM_Bot
Passing the joint angles, following the order from 'Nikolas Kofinas Thesis', page number 22, this function returns the COM of the robot wrt the Torso frame. 
