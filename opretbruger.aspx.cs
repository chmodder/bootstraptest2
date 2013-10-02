using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Drawing.Imaging;
using System.Drawing;
using System.Drawing.Drawing2D;

public partial class opretbruger : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void ButtonOpretBruger_Click(object sender, EventArgs e)
    {
        //try
        //{
            // Upload originalen til mappen /Images/Upload/Original/
            FileUploadAvatar.SaveAs(Server.MapPath("~/Images/Upload/Original/") + FileUploadAvatar.FileName);

            // Kald Metoden MakeThumbs, som laver en Reisze af originalen til 768px i bredden og uploader den til Resized_original mappen 
            MakeThumb(FileUploadAvatar.FileName, "/Images/Upload/Original/", 768, "/Images/Upload/Resized_Original/");

            // Kald Metoden MakeThumbs, som laver en Thumbnail og uploader den til Thumbs mappen
            MakeThumb(FileUploadAvatar.FileName, "/Images/Upload/Original/", 120, "/Images/Upload/Thumbs/");

            // opret forbindelse til databasen
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ToString());
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;

            // SQL strengen
            cmd.CommandText = "INSERT INTO brugere (brugernavn, email, telefon, password, avatar) VALUES (@brugernavn, @email, @telefon, @password, @avatar)";

            // Tilføj parametrer (input fra brugeren / TextBox fra .aspx siden) til din SQL streng
            cmd.Parameters.Add("@brugernavn", SqlDbType.NVarChar).Value = TextBoxNavn.Text;
            cmd.Parameters.Add("@email", SqlDbType.NVarChar).Value = TextBoxEmail.Text;
            cmd.Parameters.Add("@telefon", SqlDbType.Int).Value = TextBoxTelefon.Text;
            cmd.Parameters.Add("@password", SqlDbType.NVarChar).Value = TextBoxPassword.Text;
            cmd.Parameters.Add("@avatar", SqlDbType.NVarChar).Value = FileUploadAvatar.FileName;

            // Åben for forbindelsen til databasen
            conn.Open();

            // Udfør SQL komandoen
            cmd.ExecuteNonQuery();

            // Luk for forbindelsen til databasen
            conn.Close();

            // Besked til brugeren om at brugeren er oprettet
            PanelMsgSuccess.Visible = true;

            // reset form
            TextBoxNavn.Text = "";
            TextBoxEmail.Text = "";
            TextBoxTelefon.Text = "";
            TextBoxPassword.Text = "";

            Page_Load(null, null);
        //}

        //catch (Exception)
        //{
        //    PanelMsgFejl.Visible = true;
        //}
    }


    #region simpel upload til mappe og database

    #endregion

    #region Metoden MakeThumb
    /// <summary>
    /// Opret et Thumb, baseret på en fil og en mappe
    /// </summary>
    /// <param name="Filename">Hvad hedder filen</param>
    /// <param name="UploadFolder">Hvor er den uploadet til</param>
    private void MakeThumb(string Filename, string UploadFolder, int bredde, string thumbuploadfolder)
    {
        // find det uploadede image
        System.Drawing.Image OriginalImg = System.Drawing.Image.FromFile(Server.MapPath("~/") + UploadFolder + Filename);

        // find højde og bredde på image
        int originalWidth = OriginalImg.Width;
        int originalHeight = OriginalImg.Height;

        // bestem den nye bredde på det thumbnail som skal laves
        int newWidth = bredde;

        // beregn den nye højde på thumbnailbilledet
        double ratio = newWidth / (double)originalWidth;
        int newHeight = Convert.ToInt32(ratio * originalHeight);


        Bitmap Thumb = new Bitmap(newWidth, newHeight, PixelFormat.Format24bppRgb);
        Thumb.SetResolution(OriginalImg.HorizontalResolution, OriginalImg.VerticalResolution);

        // Hvis billedet indeholder nogen form for transperans 
        //(mere eller mindre gennemsigtig, eller en gennemsigtig baggrund) bliver det gjort her
        Thumb.MakeTransparent();


        // opret det nye billede
        Graphics ThumbMaker = Graphics.FromImage(Thumb);
        ThumbMaker.InterpolationMode = InterpolationMode.HighQualityBicubic;

        ThumbMaker.DrawImage(OriginalImg,
            new Rectangle(0, 0, newWidth, newHeight),
            new Rectangle(0, 0, originalWidth, originalHeight),
            GraphicsUnit.Pixel);

        // encoding
        ImageCodecInfo encoder;
        string fileExt = System.IO.Path.GetExtension(Filename);
        switch (fileExt)
        {
            case ".png":
                encoder = GetEncoderInfo("image/png");
                break;

            case ".gif":
                encoder = GetEncoderInfo("image/gif");
                break;

            default:
                // default til JPG 
                encoder = GetEncoderInfo("image/jpeg");
                break;
        }

        EncoderParameters encoderParameters = new EncoderParameters(1);
        encoderParameters.Param[0] = new EncoderParameter(Encoder.Quality, 100L);

        // gem thumbnail i mappen /Images/Uploads/Thumbs/
        Thumb.Save(Server.MapPath("~") + thumbuploadfolder + Filename, encoder, encoderParameters);

        // Fjern originalbilledet, thumbnail mm, fra computerhukommelsen
        OriginalImg.Dispose();
        ThumbMaker.Dispose();
        Thumb.Dispose();

    }

    #region encoding metode

    private static ImageCodecInfo GetEncoderInfo(String mimeType)
    {
        ImageCodecInfo[] encoders = ImageCodecInfo.GetImageEncoders();
        for (int i = 0; i < encoders.Length; i++)
        {
            if (encoders[i].MimeType == mimeType)
            {
                return encoders[i];
            }
        }
        return null;
    }
    #endregion

    #endregion
}