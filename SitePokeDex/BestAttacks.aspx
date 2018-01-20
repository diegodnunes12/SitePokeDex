<%@ Page Title="" Language="C#" MasterPageFile="~/Page.Master" AutoEventWireup="true" CodeBehind="BestAttacks.aspx.cs" Inherits="SitePokeDex.BestAttacks" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section>
        <div class="container">
            <div class="row">
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
            </div>
        </div>
    </section>
</asp:Content>
