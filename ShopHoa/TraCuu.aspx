<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="TraCuu.aspx.cs" Inherits="ShopHoa.TraCuu" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row">
            <div class="form-inline col-12 mt-2">           
                Giá bán từ: <asp:TextBox ID="txtFrom" runat="server" ></asp:TextBox>
                <asp:RequiredFieldValidator CssClass="text-danger" ID="rfvGiaTu" runat="server" ErrorMessage="Chưa nhập giá từ" Text="(*)" ControlToValidate="txtFrom"></asp:RequiredFieldValidator>
                đến: <asp:TextBox ID="txtTo" runat="server" ></asp:TextBox>
                <asp:RequiredFieldValidator CssClass="text-danger" ID="rfvGiaDen" runat="server" ErrorMessage="Chưa nhập giá đến" Text="(*)" ControlToValidate="txtTo"></asp:RequiredFieldValidator>
                <asp:CompareValidator ID="cvGia" runat="server" ErrorMessage="Giá đến phải lớn hơn giá từ" ControlToCompare="txtFrom" ControlToValidate="txtTo" CssClass="text-danger" Operator="GreaterThanEqual" Type="Integer">(*)</asp:CompareValidator>
                <asp:Button CssClass="btn btn-secondary" ID="Button1" runat="server" Text="Tìm kiếm" />
                <asp:ValidationSummary CssClass="text-danger  d-inline" ID="ValidationSummary1" runat="server" />
            </div>
            <asp:Repeater ID="rptHoa" runat="server" DataSourceID="dsHoa">
                <ItemTemplate>
                    <div class="text-center col-3 mt-2">
                        <a href="#">
                            <img style="width:70%" src='Hinh_San_Pham/<%#Eval("Hinh")%>' />
                            <br />
                        </a>
                        <h5>
                            <%#Eval("TenHoa")%>
                        </h5>                        
                        <p>
                            Giá bán: <span class="text-danger"><%#Eval("Gia")%>đ</span>
                        </p>
                        <input type="button" class="btn btn-success" name="name" value="Add To Cart" />
                    </div>
                </ItemTemplate>
            </asp:Repeater>

            <asp:SqlDataSource ID="dsHoa" runat="server" ConnectionString="<%$ ConnectionStrings:HoaTuoiDBConnectionString %>" SelectCommand="SELECT * FROM [Hoa] WHERE (([Gia] &lt;= @Gia) AND ([Gia] &gt;= @Gia2))">
                <SelectParameters>
                    <asp:ControlParameter ControlID="txtTo" Name="Gia" PropertyName="Text" Type="Double" DefaultValue="99999999" />
                    <asp:ControlParameter ControlID="txtFrom" Name="Gia2" PropertyName="Text" Type="Double" DefaultValue="0" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
    </div>
</asp:Content>
