if (__Srn_Default_Core_Module == false) exit

/* setting each instance for the modules/creating them */
/* scene controller */
if (__Srn_Default_Scene_Module){
    global.__Srn_Inst_Scene = instance_create_layer(0, 0, __Srn_Default_Layer_For_Gui, __sorenSTDSceneController)
}
    


/* input controller */
if (__Srn_Default_Input_Module)
{
    global.__Srn_Inst_Input = instance_create_layer(0, 0, __Srn_Default_Layer_For_Gui, __sorenSTDInputController);
}


/* camera controller */
if (__Srn_Default_Camera_Module)
{
    global.__Srn_Inst_Camera = instance_create_layer(10, 0, __Srn_Default_Layer_For_Gui, __sorenSTDCameraController);
}


/* postprocessing controller */
if (__Srn_Default_PostProcessing_Module)
{
   global.__Srn_Inst_PostProcessing = instance_create_layer(10, 0, __Srn_Default_Layer_For_Gui, __sorenSTDPostProcessingController);
}

/* effects controller */
if (__Srn_Default_PostProcessing_Module)
{
   global.__Srn_Inst_Effects = instance_create_layer(10, 0, __Srn_Default_Layer_For_Gui, __sorenSTDEffectsController);
}


Scene.load(__Srn_Default_First_Room)