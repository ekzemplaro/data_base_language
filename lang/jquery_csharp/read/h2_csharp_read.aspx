<script runat="server" Language="C#">
void Page_Load(Object sender, EventArgs e)
{
//	Response.ContentType = "text/plain";
	Response.ContentType = "text/json";

	function_bb_proc ();

}

void function_bb_proc ()
{
	String out_str;

out_str = "{\"cities\":[{\"population\":726666,\"id\":\"921\",\"name\":\"宇都宮\",\"date_mod\":\"2009-5-4\"},";

	Response.Write (out_str);

out_str = "{\"population\":6025672,\"id\":\"934\",\"name\":\"那須烏山\",\"date_mod\":\"2009-9-21\"}]}";

	Response.Write (out_str);
}

</script>
