<%@ Page Title="" Language="C#" MasterPageFile="~/Page.Master" Async="true" AutoEventWireup="true" CodeBehind="Order.aspx.cs" Inherits="SitePokeDex.Search" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="preload" class="preload"></div>
        <section>
            <div class="container container-information">
                <div class="row">
                <div class="col-xs-12 title-page text-center">
                    <h1>Order By
                    <small><asp:DropDownList ID="DdlOrder" runat="server" AutoPostBack="true" OnSelectedIndexChanged="DdlOrder_SelectedIndexChanged">
                        <asp:ListItem Value="0" Text=""> </asp:ListItem>
                        <asp:ListItem Value="1">De A a Z</asp:ListItem>
                        <asp:ListItem Value="2">De Z a A</asp:ListItem>
                        <asp:ListItem Value="3">Menor Número</asp:ListItem>
                        <asp:ListItem Value="4">Maior Número</asp:ListItem>
                    </asp:DropDownList></small>
                    </h1> 
                </div>
                <asp:ListView ID="ListPokemons" runat="server">
                    <ItemTemplate>
                        <div class="col-sm-3 text-center">
                            <div class="container-poke">
                            <a href='Details.aspx?name=<%# Eval("name") %>'>
                                <asp:Image ID="ImgPoke" runat="server" ImageUrl='<%# Eval("image") %>' />
                                <h2 class="h3">
                                    <%# Eval("name") %>
                                </h2>
                            </a>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:ListView>
            </div>
                </div>
            </section>
</asp:Content>
