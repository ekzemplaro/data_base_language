// -------------------------------------------------------------------
//	json_read.groovy
//
//					Mar/12/2013
//
// -------------------------------------------------------------------
import groovy.json.*
// -------------------------------------------------------------------
class json_read
{

// -------------------------------------------------------------------
static void main (args)
{
println ("*** 開始 ***")

def file_in = args[0]

def json_str = new File (file_in).text

def slurper = new JsonSlurper()
def dict_aa = slurper.parseText (json_str)

def ff = new text_manipulate ()
ff.dict_display_proc (dict_aa)

println ("*** 終了 ***")
}

// -------------------------------------------------------------------
}
// -------------------------------------------------------------------

