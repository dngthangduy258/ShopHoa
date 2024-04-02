<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="XemHoa.aspx.cs" Inherits="ShopHoa.XemHoa" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row">
            
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
            
            <asp:SqlDataSource ID="dsHoa" runat="server" ConnectionString="<%$ ConnectionStrings:HoaTuoiDBConnectionString %>" SelectCommand="SELECT * FROM [Hoa] WHERE ([MaLoai] = @MaLoai)">
                <SelectParameters>
                    <%--<asp:ControlParameter ControlID="rptDropLoaiHoa" DefaultValue="1" Name="MaLoai" QueryStringField="catid" PropertyName="SelectedValue" Type="Int32" />--%>
                    <asp:QueryStringParameter  DefaultValue="1" Name="MaLoai" QueryStringField="catid"  Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
           
        </div>

    </div>
</asp:Content>
