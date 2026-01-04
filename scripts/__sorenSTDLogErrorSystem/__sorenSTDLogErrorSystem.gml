/* Handling some debug funcs for logging errors */
/* Not meant for user use! Just for internal purposes. */

function __Srn_Check_Errors(__var, __error) {
    if (__var == __error) {
        show_error("\n\n<<!!!>> so/renSTD: " + string(__error) + string("\n\n"), true)
    }
}