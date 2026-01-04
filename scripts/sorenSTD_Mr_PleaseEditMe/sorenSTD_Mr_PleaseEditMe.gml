/* 
 * Hello! This is the configuration file for the Library!!
 * Ok, it's not automatic, but it's really more organized (and easier) this way.
 * Sorry for this setup.
*/

/* ----------------------------------------------------- */



/*  ____                  _              _ _  */
/* |  _ \ ___  __ _ _   _(_)_ __ ___  __| | | */
/* | |_) / _ \/ _` | | | | | '__/ _ \/ _` | | */
/* |  _ <  __/ (_| | |_| | | | |  __/ (_| |_| */
/* |_| \_\___|\__, |\__,_|_|_|  \___|\__,_(_) */
/*               |_|                          */

/* Change ERROR_WRITE_REQUIRED by the actual value, please! */

/* ----------------------------------------------------- */

/* 
 * The default layer for the controller objects do GUI things. 
 * Example: #macro __Srn_Default_Layer_For_Gui "GUI_Layer"
*/
#macro __Srn_Default_Layer_For_Gui  "Instances"

/* ----------------------------------------------------- */

/* 
 * The first room of your game that will be immediately loaded. 
 * Example: #macro __Srn_Default_First_Room rm_menu
*/
#macro __Srn_Default_First_Room     rm_4

/* ----------------------------------------------------- */
/* ----------------------------------------------------- */
/* ----------------------------------------------------- */
/* ----------------------------------------------------- */
/* ----------------------------------------------------- */
/* ----------------------------------------------------- */
/* ----------------------------------------------------- */
/* ----------------------------------------------------- */
/*   ___        _   _                   _  */
/*  / _ \ _ __ | |_(_) ___  _ __   __ _| | */
/* | | | | '_ \| __| |/ _ \| '_ \ / _` | | */
/* | |_| | |_) | |_| | (_) | | | | (_| | | */
/*  \___/| .__/ \__|_|\___/|_| |_|\__,_|_| */
/*       |_|                               */

/* ----------------------------------------------------- */

/* 
 * 
 * Throw an error if you try to delete a __Srn Controller
 * Basically prevines you from deleting something bad for the engine 
 * with, for example, instance_destroy()
 * 
 * Example: #macro __Srn_Default_Secure_Mode true
*/
#macro __Srn_Default_Secure_Mode            true

/* 
 * 
 * You can deactivate a module if you want! 
 * (There are modules that don't use objects, so it dont show here)
 * 
 * The object for the Controller will not be created at the start
 * 
 * Example: #macro __Srn_Default_Camera_Module false
*/
#macro __Srn_Default_Scene_Module           true
#macro __Srn_Default_Input_Module           true
#macro __Srn_Default_Camera_Module          true
#macro __Srn_Default_PostProcessing_Module  true
#macro __Srn_Default_Effects_Module         true
/* the library won't start if you set this to false! */
#macro __Srn_Default_Core_Module            true