<script runat="server" Language="C#">
void Page_Load(Object sender, EventArgs e)
{
	Response.ContentType = "text/json";

	master_proc ();

}

void master_proc ()
{
	String out_str;

out_str = "{\"cities\":[{\"population\":\"11111\",\"id\":\"1421\",\"name\":\"横浜\",\"date_mod\":\"2009-05-04\"},";

	Response.Write (out_str);

out_str = "{\"population\":6000222,\"id\":\"1422\",\"name\":\"川崎\",\"date_mod\":\"2009-05-15\"},";

	Response.Write (out_str);

out_str = "{\"population\":6000222,\"id\":\"1423\",\"name\":\"小田原\",\"date_mod\":\"2009-05-15\"},";

	Response.Write (out_str);

out_str = "{\"population\":6002,\"id\":\"1424\",\"name\":\"川崎\",\"date_mod\":\"2009-08-11\"},";

	Response.Write (out_str);

out_str = "{\"population\":60012,\"id\":\"1425\",\"name\":\"相模原\",\"date_mod\":\"2009-07-25\"},";

	Response.Write (out_str);

out_str = "{\"population\":60099,\"id\":\"1426\",\"name\":\"厚木\",\"date_mod\":\"2010-03-25\"}]}";

	Response.Write (out_str);
}

</script>
