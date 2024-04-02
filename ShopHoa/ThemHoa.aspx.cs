using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Cryptography;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShopHoa
{
    public partial class ThemHoa : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnThem_Click(object sender, EventArgs e)
        {
            string chuoi_ket_noi = ConfigurationManager.ConnectionStrings["HoaTuoiDBConnectionString"].ConnectionString;
            SqlConnection conn = new SqlConnection(chuoi_ket_noi);
            conn.Open(); 

            string sql = "INSERT INTO Hoa(TenHoa,Gia,Hinh,MaLoai,NgayDang) VALUES (@TenHoa,@Gia,@Hinh,@MaLoai,@NgayDang)";
            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.Parameters.AddWithValue("@TenHoa", txtTen.Text);
            cmd.Parameters.AddWithValue("@Gia", txtGia.Text);
            if (fHinh.HasFile)
            {
                string path = Server.MapPath("~/Hinh_San_Pham/") + fHinh.FileName;
                fHinh.SaveAs(path);
                cmd.Parameters.AddWithValue("@Hinh", fHinh.FileName);
            }
            cmd.Parameters.AddWithValue("@MaLoai", ddLoaiHoa.SelectedValue);
            cmd.Parameters.AddWithValue("@NgayDang", cldNgayCapNhat.SelectedDate );

            cmd.ExecuteNonQuery();

        }
    }
}