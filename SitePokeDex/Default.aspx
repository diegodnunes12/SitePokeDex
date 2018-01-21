<%@ Page Title="" Language="C#" MasterPageFile="~/Page.Master" AutoEventWireup="true" Async="true" CodeBehind="Default.aspx.cs" Inherits="SitePokeDex.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section>
        <div class="container container-information">
            <div class="row">
                <div class="col-xs-12 title-page text-center">
                    <h1>Pokédex</h1>
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
            <div class="row">
                <div class="col-sm-6 text-center">
                    <asp:Button ID="BtnPrev" runat="server" Text="Previous" CssClass="btn btn-primary btn-lg" OnClick="BtnPrev_Click" />
                </div>
                <div class="col-sm-6 text-center">
                    <asp:Button ID="BtnNext" runat="server"  Text="Next" CssClass="btn btn-primary btn-lg" OnClick="BtnNext_Click" />
                </div>
            </div>
            <%--<div class="row">
                <div class="col-sm-12 text-center">
                    <asp:Button ID="BtnLoadBestAttack" runat="server" Text="best attacks loaded" CssClass="btn btn-primary btn-lg" OnClick="BtnLoadBestAttack_Click" />
                </div>
            </div>--%>

            <asp:Panel ID="PnlBestAttack" runat="server" Visible="false">
                <div class="row">
                <div class="col-xs-12 title-page text-center">
                    <h2>The six best attacked pokémons</h2>
                </div>
                <asp:ListView ID="ListBestPokemons" runat="server">
                    <ItemTemplate>
                        <div class="col-sm-12 text-center">
                            <div class="container-poke best-pokes">
                                <a href='Details.aspx?name=<%# Eval("name") %>'>
                                    <div class="col-md-3">
                                        <div class="text-center">
                                            <asp:Image ID="ImgPoke" runat="server" ImageUrl='<%# Eval("image") %>' />
                                        </div>
                                        <h2>
                                            <%# Eval("name") %>
                                        </h2>
                                    </div>
                                    <div class="col-md-2">
                                        <h4>Attack Base</h4>
                                        <h3><%# Eval("base_attack") %></h3>
                                    </div>
                                    <div class="col-md-2">
                                        <h4>Base Experience</h4>
                                        <h3><%# Eval("base_experience") %></h3>
                                    </div>
                                    <div class="col-md-2">
                                        <h4>Weight</h4>
                                        <h3><%# Eval("weight") %></h3>
                                    </div>
                                    <div class="col-md-2">
                                        <h4>Total Stats</h4>
                                        <h3><%# Eval("totalStats") %></h3>
                                    </div>
                                    <div class="clearfix"></div>
                                </a>
                            </div>

                        </div>
                    </ItemTemplate>
                </asp:ListView>
            </div>
            </asp:Panel>            
        </div>
    </section>
</asp:Content>
