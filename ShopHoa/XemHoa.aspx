<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="XemHoa.aspx.cs" Inherits="ShopHoa.XemHoa" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-12 mt-2">
                <asp:Label ID="Label1" runat="server" Text="Danh mục loại:"></asp:Label>
                <asp:DropDownList AutoPostBack="true" CssClass="form-control" Width="20%" ID="ddLoai" runat="server" DataSourceID="dsLoai" DataTextField="TenLoai" DataValueField="MaLoai"></asp:DropDownList>
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
            
            <asp:SqlDataSource ID="dsHoa" runat="server" ConnectionString="<%$ ConnectionStrings:HoaTuoiDBConnectionString %>" SelectCommand="SELECT * FROM [Hoa] WHERE ([MaLoai] = @MaLoai)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="ddLoai" DefaultValue="1" Name="MaLoai" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="dsLoai" runat="server" ConnectionString="<%$ ConnectionStrings:HoaTuoiDBConnectionString %>" DeleteCommand="DELETE FROM [Loai] WHERE [MaLoai] = @MaLoai" InsertCommand="INSERT INTO [Loai] ([TenLoai], [GhiChu]) VALUES (@TenLoai, @GhiChu)" SelectCommand="SELECT * FROM [Loai]" UpdateCommand="UPDATE [Loai] SET [TenLoai] = @TenLoai, [GhiChu] = @GhiChu WHERE [MaLoai] = @MaLoai">
                <DeleteParameters>
                    <asp:Parameter Name="MaLoai" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="TenLoai" Type="String" />
                    <asp:Parameter Name="GhiChu" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="TenLoai" Type="String" />
                    <asp:Parameter Name="GhiChu" Type="String" />
                    <asp:Parameter Name="MaLoai" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>

    </div>
</asp:Content>
