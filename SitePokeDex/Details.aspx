﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Page.Master" AutoEventWireup="true" CodeBehind="Details.aspx.cs" Inherits="SitePokeDex.Details" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <h1>
            <asp:Label ID="LblName" runat="server"></asp:Label>

            <asp:Image ID="ImgPoke" runat="server" />
        </h1>
    <div>
        <h2>Abilities</h2>
        <asp:Label ID="LblAbilities" runat="server"></asp:Label>

    </div>
    <div>
        <h2>Stats</h2>
        <asp:Label ID="LblStats" runat="server"></asp:Label>

    </div>
    <div>
        <h2>Weight</h2>
        <asp:Label ID="LblWeight" runat="server"></asp:Label>

    </div>
    <div>
        <h2>Moves</h2>
        <asp:Label ID="LblMoves" runat="server"></asp:Label>

    </div>
    <div>
        <h2>Base Experience</h2>
        <asp:Label ID="LblBaseExperience" runat="server"></asp:Label>

    </div>
        
</asp:Content>