<%@ Page Title="" Language="C#" MasterPageFile="~/Page.Master" AutoEventWireup="true" CodeBehind="BestAttacks.aspx.cs" Inherits="SitePokeDex.BestAttacks" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%--<div class='loader'>
  <div class='loader-container'>
    <h3><b>Please wait a moment while we are preparing the content !</b></h3>
    <div class='progress progress-striped active'>
      <div class='progress-bar progress-bar-color' id='bar' role='progressbar' style='width: 0%;'></div>
    </div>
  </div>
</div>--%>
    <div id="preload" class="preload"></div>
    <section>
        <div class="container">
            <div class="row">
                <div class="col-xs-12 text-center">
                    <h1>We have selected the six Pokémon with the highest attack</h1>
                </div>
                <asp:ListView ID="ListPokemons" runat="server">
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
        </div>
        </div>
    </section>

</asp:Content>
