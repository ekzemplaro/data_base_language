 import java.awt.Font;
 import com.itextpdf.text.pdf.BaseFont;
 import com.itextpdf.text.pdf.FontMapper;
 /**
  * ＡＷＴのフォントとCJKファントをマッピングするクラス
  */
 public class JapaneseFontMapper implements FontMapper
 { 
   private BaseFont basefont;
   public JapaneseFontMapper(BaseFont font){
      this.basefont = font;
   }
   public BaseFont awtToPdf(Font font){
      return basefont;
   }
   public Font pdfToAwt(BaseFont font, int size){
      return new Font("dialog",Font.PLAIN,size);
   }
 }
