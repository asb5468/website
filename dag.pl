#! /usr/bin/perl
# S. Biscoveanu

$home = "/home/sylvia.biscoveanu";
$sub = "condor";
$njobs = 10;

$LIB = "/ldcg/matlab_r2012a/runtime/glnxa64:/ldcg/matlab_r2012a/sys/os/glnxa64:/ldcg/matlab_r2012a/bin/glnxa64:/ldcg/matlab_r2012a/sys/java/jre/glnxa64/jre/lib/amd64/native_threads:/ldcg/matlab_r2012a/sys/java/jre/glnxa64/jre/lib/amd64/server:/ldcg/matlab_r2012a/sys/java/jre/glnxa64/jre/lib/amd64:/ldcg/matlab_r2012a/sys/opengl/lib/glnxa64:/ligotools/lib";

open(dag,">./sylvia.dag");
for ($i=0; $i<=$njobs; $i=$i+1) {
    print dag "JOB $i /home/sylvia.biscoveanu/condor/$sub.sub\n";
    print dag "VARS $i ";
    print dag "jobNumber=\"$i\" ";
    print dag "ld_library_path=\"$LIB\"";
    print dag "\n\n";
}
print dag "PARENT 0 CHILD ";
for ($j=1; $j<$i; $j=$j+1) {print dag "$j ";}
print dag "\n";
close(dag);
