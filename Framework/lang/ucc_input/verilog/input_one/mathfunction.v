/*********************************************/
/* math.c - C routines for Verilog PLI                          */
#include "math.h"       /* C Math routines                      */
#include "vcsuser.h"    /* Base Verilog PLI definitions         */

/* Definitions specific for math.c                              */
#define ARG1    1       /* First argument                       */
#define ARG2    2       /* Second argument                      */
#define RETURNV 0       /* Return value                         */

/****************************************************************/
/* Checktf() routine to check for a single real argument        */
int math_check1()
{
  if (tf_nump() != ARG1) {
    tf_error("Wrong number of arguments, expecting 1");
    return;
  }

  if (tf_typep(ARG1) != tf_readonlyreal &&
      tf_typep(ARG1) != tf_readwritereal)
    tf_error("The argument must be a real number.");

}


/****************************************************************/
/* Checktf() routine to check for a single real argument        */
int math_check2()
{
  if (tf_nump() != ARG2) {
    tf_error("Wrong number of arguments, expecting 2");
    return;
  }

  if (tf_typep(ARG1) != tf_readonlyreal &&
      tf_typep(ARG1) != tf_readwritereal)
    tf_error("The first argument must be a real number.");

  if (tf_typep(ARG2) != tf_readonlyreal &&
      tf_typep(ARG2) != tf_readwritereal)
    tf_error("The second argument must be a real number.");

}

/****************************************************************/
/****************************************************************/
/* Calltf routine for exp or e**x                               */
exp_call()
{
    tf_putrealp (RETURNV, exp(tf_getrealp(ARG1)));
}


/****************************************************************/
/* Calltf routine for natural log                               */
log_call()
{
    tf_putrealp (RETURNV, log(tf_getrealp(ARG1)));
}


/****************************************************************/
/* Calltf routine for log base 10                               */
log10_call()
{
    tf_putrealp (RETURNV, log10(tf_getrealp(ARG1)));

}


/****************************************************************/
/* Calltf routine for pow function                              */
pow_call()
{
    tf_putrealp (RETURNV, pow(tf_getrealp(ARG1), tf_getrealp(ARG2)));
}


/****************************************************************/
/* Calltf routine for sine function                             */
sin_call()
{
    tf_putrealp (RETURNV, sin(tf_getrealp(ARG1)));
}


/****************************************************************/
/* Calltf routine for sqrt function                             */
sqrt_call()
{
    tf_putrealp (RETURNV, sqrt(tf_getrealp(ARG1)));
}


// math.tab for VCS
$exp    check=math_check1 call=exp_call   size=r
$log    check=math_check1 call=log_call   size=r
$log10  check=math_check1 call=log10_call size=r
$pow    check=math_check2 call=pow_call   size=r
$sin    check=math_check1 call=sin_call   size=r
$sqrt   check=math_check1 call=sqrt_call  size=r

//math.v
module math;
real x;
initial
 begin
        $display("$exp(2.0) = %f", $exp(2.0));
        $display("$log(44.0) = %f", $log(44.0));
        $display("$log10(100.0) = %f", $log10(100.0));
        $display("$log10(555.0) = %f", $log10(555.0));
        $display("$pow(3.1, 4.1) = %f", $pow(3.1, 4.1));
        $display("$sin(3.14159) = %f", $sin(3.14159));
        $display("$sqrt(169.0) = %f", $sqrt(169.0));
        end
endmodule // math