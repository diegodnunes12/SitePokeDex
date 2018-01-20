<%@ Page Title="" Language="C#" MasterPageFile="~/Page.Master" AutoEventWireup="true" CodeBehind="Details.aspx.cs" Inherits="SitePokeDex.Details" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section>
        <div class="container">
            <div class="row">                
                <div class="col-md-12 text-center">
                    <h1><asp:Image ID="ImgPoke" runat="server" /> <asp:Label ID="LblName" runat="server"></asp:Label></h1>
                </div>
                <div class="col-md-6 text-center">
                    <div class="panel panel-default">
                      <div class="panel-heading">Profile</div>
                      <div class="panel-body">
                        <div class="col-sm-6 profile">
                            <div>
                                <b>Height:</b> 
                                <asp:Label ID="LblHeight" runat="server"></asp:Label>
                            </div>
                            <div>
                                <b>Weight:</b> 
                                <asp:Label ID="LblWeight" runat="server"></asp:Label>
                            </div>
                        </div>
                          <div class="col-sm-6">
                            <div>
                                <b>Abilities:</b>
                                <asp:Label ID="LblAbilities" runat="server"></asp:Label>
                            </div>
                            <div>
                                <b>Base Experience:</b> 
                                <asp:Label ID="LblBaseExperience" runat="server"></asp:Label>
                            </div>
                        </div>
                      </div>
                    </div>                    
                </div> 
                <div class="col-md-6 text-center">
                    <div class="panel panel-default">
                      <div class="panel-heading">Stats</div>
                      <div class="panel-body">
                        <asp:Literal ID="LtlStats" runat="server"></asp:Literal>
                      </div>
                    </div>                    
                </div>
                <div class="col-xs-12 text-center">
                    <div class="panel panel-default">
                      <div class="panel-heading">Moves</div>
                      <div class="panel-body">
                        <asp:Literal ID="LblMoves" runat="server"></asp:Literal>
                      </div>
                    </div>                    
                </div>                              
            </div>
        </div>
    </section>
</asp:Content>
