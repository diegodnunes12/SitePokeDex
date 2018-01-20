<%@ Page Title="" Language="C#" MasterPageFile="~/Page.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="SitePokeDex.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section>
        <div class="container">
            <div class="row">
                <div class="col-xs-12 title-page text-center">
                    <h1>Pokédex</h1>
                </div>
                <asp:ListView ID="ListPokemons" runat="server">
                    <ItemTemplate>
                        <div class="col-sm-3 text-center">
                            <div class="container-poke">
                            <a href='Details.aspx?name=<%# Eval("name") %>'>
                                <h2 class="h3">
                                    <%# Eval("name") %>
                                </h2>
                            </a>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:ListView>
            </div>
            <div class="row">
                <div class="col-sm-6 text-center">
                    <asp:Button ID="BtnPrev" runat="server" Text="Previous" CssClass="btn btn-primary btn-lg" OnClick="BtnPrev_Click" />
                </div>
                <div class="col-sm-6 text-center">
                    <asp:Button ID="BtnNext" runat="server"  Text="Next" CssClass="btn btn-primary btn-lg" OnClick="BtnNext_Click" />
                </div>
            </div>
        </div>
    </section>
</asp:Content>
