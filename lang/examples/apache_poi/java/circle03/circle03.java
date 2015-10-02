// ---------------------------------------------------------------------
//
//	circle03.java
//
//					Sep/29/2015
//
// ---------------------------------------------------------------------
import org.apache.poi.xssf.usermodel.XSSFDrawing;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.apache.poi.xssf.usermodel.XSSFSheet;

// import org.apache.poi.ss.usermodel.Sheet;

// ---------------------------------------------------------------------
public class circle03
{
// ---------------------------------------------------------------------
public static void main (String[]args) throws Exception
{
	System.out.println ("*** start ***");

	String xlsx_in = args[0];
	String xlsx_out = args[1];

	System.out.println (xlsx_in);
	System.out.println (xlsx_out);

	int [][] pos_org = {{-241,96},{-345,96},
				{-241,184},{-345,184},
				{-241,272},{-345,272},
				{-241,360},{-345,360},
				{-241,448},{-345,448}
				};

	XSSFWorkbook workbook = poi_common.workbook_read_proc (xlsx_in);

	XSSFSheet sheet = workbook.getSheetAt (0);

	XSSFDrawing drawing = (XSSFDrawing) sheet.createDrawingPatriarch();

	int radius = 19;

	for (int[] pos:pos_org)
		{
		System.out.print (pos[0] + "\t" );
		System.out.print (pos[1] + "\t");

		double xx_new = -pos[0] * 0.75 + 130.0;
		double yy_new = pos[1] * 0.75 + 210.0;
		
		int []pos_aa = {(int)xx_new,(int)yy_new };
		System.out.print (pos_aa[0] + "\t" );
		System.out.println (pos_aa[1]);
	poi_common.draw_circle_proc (sheet,drawing,pos_aa,radius,"black");
		}

	poi_common.workbook_out_proc (workbook,xlsx_out);

	System.out.println ("*** end ***");
}

// ---------------------------------------------------------------------
}

// ---------------------------------------------------------------------
