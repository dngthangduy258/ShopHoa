<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="ThemHoa.aspx.cs" Inherits="ShopHoa.ThemHoa" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container w-50">
        <div class="row">
            <div class="text-center col-12 mt-2">
                <h3>Thêm Hoa</h3>
            </div>

            <div class="col-3 mt-2">
                Danh mục:
            </div>
            <div class="col-9 mt-2">
                <asp:DropDownList Width="100%" ID="ddLoaiHoa" runat="server" DataSourceID="dsLoai" DataTextField="TenLoai" DataValueField="MaLoai"></asp:DropDownList>
            </div>
            <div class="col-3 mt-2">
                Tên hoa:
            </div>
            <div class="col-9 mt-2">
                <asp:TextBox ID="txtTen" runat="server" Width="100%"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Tên hoa không được rỗng" Text="(*)" CssClass="text-danger" ControlToValidate="txtTen"></asp:RequiredFieldValidator>
            </div>
            <div class="col-3 mt-2">
                Giá:
            </div>
            <div class="col-9 mt-2">
                <asp:TextBox ID="txtGia" runat="server" Width="100%"></asp:TextBox>
            </div>
            <div class="col-3 mt-2">
                Ngày cập nhật:
            </div>
            <div class="col-9 mt-2">
                <asp:Calendar ID="cldNgayCapNhat" runat="server"></asp:Calendar>
            </div>
            <div class="col-3 mt-2">
                Hình:
            </div>
            <div class="col-9 mt-2">
                <asp:FileUpload ID="fHinh" runat="server" />
            </div>
            <div class="col-12 mt-2 text-center">
                <asp:Button CssClass="btn btn-success" ID="btnThem" runat="server" Text="Thêm mới" OnClick="btnThem_Click" />
            </div>
        </div>
    </div>
    <asp:SqlDataSource ID="dsLoai" runat="server" ConnectionString="<%$ ConnectionStrings:HoaTuoiDBConnectionString %>" SelectCommand="SELECT * FROM [Loai]"></asp:SqlDataSource>
</asp:Content>
