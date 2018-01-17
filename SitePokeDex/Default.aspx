<%@ Page Title="" Language="C#" MasterPageFile="~/Page.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="SitePokeDex.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        
    <section>
        <article>
            <asp:Repeater ID="RptListPokemon" runat="server">
                <ItemTemplate>
                    <div class="container">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="col-md-4">

                                </div>
                                <div class="col-md-8">
                                    <h2>
                                        <%# Eval("Nome") %>
                                    </h2>
                                </div>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </article>
    </section>

</asp:Content>
