// --------------------------------------------------------------------
//	pythagoras.js
//
//					Jul/05/2010
// --------------------------------------------------------------------
// --------------------------------------------------------------------
print('*** start ***');
var nmax = 50;
print ("namx=",nmax);
var rr = new Array ();
for (var it=1; it < nmax; it++)
	{
	for (var jt=it; jt < nmax; jt++)
		{
		func_hantei (it,jt,rr);
		}
	}

print('*** end ***');

// --------------------------------------------------------------------
// [4]:
function func_hantei (it,jt,rr)
{
	var it2 = it * it;
	var jt2 = jt * jt;
	var itjt2 = it2 + jt2;
	var ktx = Math.sqrt (itjt2);
	var kt = Math.floor (ktx);
	var kt2 = kt * kt;
	if (itjt2 === kt2)
		{
		var ratio = it / jt;
		if (new_data_check (rr,ratio))
			{
			print (it,jt,kt,ratio);
			var nn = rr.length;
			rr[nn] = ratio;
			}
		}
}

// --------------------------------------------------------------------
// [4-4]:
function new_data_check (rr,ratio)
{
	var rvalue = true;

	if (0 < rr.length)
		{
		for (var it=0; it < rr.length; it++)
			{
			if (rr[it] === ratio)
				{
				rvalue = false;
				break;
				}
			}
		}

	return	rvalue;
}

// --------------------------------------------------------------------
