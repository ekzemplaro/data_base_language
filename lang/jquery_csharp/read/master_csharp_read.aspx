<script runat="server" Language="C#">
void Page_Load(Object sender, EventArgs e)
{
	Response.ContentType = "text/json";

	master_proc ();

}

void master_proc ()
{
	String out_str;

out_str = "{\"t0421\":{\"population\":\"56314\",\"name\":\"仙台\",\"date_mod\":\"2009-3-4\"},";

	Response.Write (out_str);

out_str = "\"t0422\": {\"population\":62583,\"name\":\"石巻\",\"date_mod\":\"2009-5-12\"},";

	Response.Write (out_str);

out_str = "\"t0423\": {\"population\":43726,\"name\":\"塩竈\",\"date_mod\":\"2009-5-21\"},";

	Response.Write (out_str);

out_str = "\"t0424\": {\"population\":62129,\"name\":\"石巻\",\"date_mod\":\"2009-8-12\"},";

	Response.Write (out_str);

out_str = "\"t0425\": {\"population\":69517,\"name\":\"白石\",\"date_mod\":\"2009-7-21\"},";

	Response.Write (out_str);

out_str = "\"t0426\": {\"population\":65329,\"name\":\"名取\",\"date_mod\":\"2009-3-25\"},";

	Response.Write (out_str);

out_str = "\"t0427\": {\"population\":78214,\"name\":\"多賀城\",\"date_mod\":\"2009-6-17\"},";

	Response.Write (out_str);

out_str = "\"t0428\": {\"population\":43128,\"name\":\"岩沼\",\"date_mod\":\"2009-9-7\"},";

	Response.Write (out_str);

out_str = "\"t0429\": {\"population\":25719,\"name\":\"大崎\",\"date_mod\":\"2009-10-15\"}}";

	Response.Write (out_str);

}

</script>
