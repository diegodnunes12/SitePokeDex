<%@ Page Title="" Language="C#" MasterPageFile="~/Page.Master" AutoEventWireup="true" Async="true" CodeBehind="Default.aspx.cs" Inherits="SitePokeDex.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Preload -->
    <div id="preload" class="preload"></div>
    <section>
        <div class="container container-information">
            <div class="row">
                <div class="col-xs-12 title-page text-center">
                    <h1>Pokédex</h1>
                </div>
                <!-- List of Pokemons -->
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
            <!-- Navigation -->
            <div class="row">
                <div class="col-sm-6 text-center">
                    <asp:Button ID="BtnPrev" runat="server" Text="Previous" CssClass="btn btn-primary btn-lg" OnClick="BtnPrev_Click" />
                </div>
                <div class="col-sm-6 text-center">
                    <asp:Button ID="BtnNext" runat="server" Text="Next" CssClass="btn btn-primary btn-lg" OnClick="BtnNext_Click" />
                </div>
            </div>
            <!-- List of best attack loaded -->
            <asp:Panel ID="PnlBestAttack" runat="server" Visible="true">
                <div id="bestAttack" class="row">
                    <div class="col-xs-12 title-page text-center">
                        <h2>The six best attacked pokémons loaded</h2>
                    </div>
                    <asp:ListView ID="ListBestPokemons" runat="server" DataKeyNames="name, image, base_attack, base_experience, weight, totalStats">
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
                    <!-- Summary -->
                    <div class="col-xs-12 text-center">
                        <div class="panel panel-default">
                            <div class="panel-heading">Summary</div>
                            <div class="panel-body">
                                <div class="col-sm-6 profile">
                                    <div class="panel panel-default">
                                        <div class="panel-body">
                                            <div class="col-md-6">
                                                <div>
                                                    <b>Total HP:</b>
                                                    <asp:Label ID="LblTotalHp" runat="server"></asp:Label>
                                                </div>
                                                <div>
                                                    <b>Total Attack:</b>
                                                    <asp:Label ID="LblTotalAttack" runat="server"></asp:Label>
                                                </div>
                                                <div>
                                                    <b>Total Defense:</b>
                                                    <asp:Label ID="LblTotalDefense" runat="server"></asp:Label>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div>
                                                    <b>Total Speed:</b>
                                                    <asp:Label ID="LblTotalSpeed" runat="server"></asp:Label>
                                                </div>
                                                <div>
                                                    <b>Total Special Attack:</b>
                                                    <asp:Label ID="LblTotalSpAt" runat="server"></asp:Label>
                                                </div>
                                                <div>
                                                    <b>Total Special Defense:</b>
                                                    <asp:Label ID="LblTotalSpDf" runat="server"></asp:Label>
                                                </div>
                                            </div>
                                            <div class="col-xs-12">
                                                <div>
                                                    <b>Total Stats:</b>
                                                    <asp:Label ID="LblTotalStats" runat="server"></asp:Label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-6 profile">
                                    <div class="panel panel-default">
                                        <div class="panel-body">
                                            <div class="col-md-6">
                                                <div>
                                                    <b>Total Weight:</b>
                                                    <asp:Label ID="LblWeight" runat="server"></asp:Label>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div>
                                                    <b>Base Experience:</b>
                                                    <asp:Label ID="LblBaseExperience" runat="server"></asp:Label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </asp:Panel>
        </div>
    </section>
    <div class="clearfix"></div>
</asp:Content>
