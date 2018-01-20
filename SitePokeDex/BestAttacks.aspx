<%@ Page Title="" Language="C#" MasterPageFile="~/Page.Master" AutoEventWireup="true" CodeBehind="BestAttacks.aspx.cs" Inherits="SitePokeDex.BestAttacks" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <section>
        <div class="container">
            <div class="row">
                <asp:ListView ID="ListPokemons" runat="server">
                    <ItemTemplate>
                        <div class="col-sm-3 text-center">
                            <div class="container-poke">
                            <a href='Details.aspx?name=<%# Eval("name") %>'>
                                <h2>
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
