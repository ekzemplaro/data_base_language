<script runat="server" Language="C#">
void Page_Load(Object sender, EventArgs e)
{
	Response.ContentType = "text/json";

	master_proc ();

}

void master_proc ()
{
	String out_str;

out_str = "{\"cities\":[{\"population\":\"51317\",\"id\":\"1421\",\"name\":\"横浜\",\"date_mod\":\"2009-7-4\"},";

	Response.Write (out_str);

out_str = "{\"population\":62583,\"id\":\"1422\",\"name\":\"川崎\",\"date_mod\":\"2009-5-12\"},";

	Response.Write (out_str);

out_str = "{\"population\":43726,\"id\":\"1423\",\"name\":\"小田原\",\"date_mod\":\"2009-5-21\"},";

	Response.Write (out_str);

out_str = "{\"population\":62129,\"id\":\"1424\",\"name\":\"川崎\",\"date_mod\":\"2009-8-12\"},";

	Response.Write (out_str);

out_str = "{\"population\":69517,\"id\":\"1425\",\"name\":\"相模原\",\"date_mod\":\"2009-7-21\"},";

	Response.Write (out_str);

out_str = "{\"population\":65329,\"id\":\"1426\",\"name\":\"厚木\",\"date_mod\":\"2009-3-25\"},";

	Response.Write (out_str);

out_str = "{\"population\":78214,\"id\":\"1427\",\"name\":\"横須賀\",\"date_mod\":\"2009-6-17\"},";

	Response.Write (out_str);

out_str = "{\"population\":43128,\"id\":\"1428\",\"name\":\"鎌倉\",\"date_mod\":\"2009-9-7\"},";

	Response.Write (out_str);

out_str = "{\"population\":25018,\"id\":\"1429\",\"name\":\"逗子\",\"date_mod\":\"2009-10-12\"}]}";

	Response.Write (out_str);

}

</script>
