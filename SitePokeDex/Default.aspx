<%@ Page Title="" Language="C#" MasterPageFile="~/Page.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="SitePokeDex.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        
    <section>
        <article>
            <asp:ListView ID="ListPokemons" runat="server" GroupPlaceholderID="groupPlaceHolder1"
                                    ItemPlaceholderID="itemPlaceHolder1" OnPagePropertiesChanging="OnPagePropertiesChanging">

                                    <LayoutTemplate>
                                        <asp:PlaceHolder runat="server" ID="groupPlaceHolder1"></asp:PlaceHolder>
                                        <div class="b-items__pagination">
                                            <div class='b-items__pagination-main' id="paginacao">
                                                <asp:DataPager ID="DataPager1" runat="server" PagedControlID="ListPokemons" PageSize="6">
                                                    <Fields>
                                                        <asp:NextPreviousPagerField ButtonType="Link" ShowFirstPageButton="false" ShowPreviousPageButton="true"
                                                            ShowNextPageButton="false" ButtonCssClass="m_prev fa fa-angle-left" PreviousPageText=""
                                                            NextPageText="" RenderDisabledButtonsAsLabels="True" />
                                                        <asp:NumericPagerField ButtonType="Link" NumericButtonCssClass="link_pag" NextPreviousButtonCssClass="m_grupo"

                                                            NextPageText="&#10097;" PreviousPageText="&#10096;" />

                                                        <asp:NextPreviousPagerField ButtonType="Link" ShowNextPageButton="true" ShowLastPageButton="false"

                                                            ShowPreviousPageButton="false" NextPageText="" ButtonCssClass="m_next fa fa-angle-right"

                                                            PreviousPageText="" />

                                                    </Fields>

                                                </asp:DataPager>

                                            </div>

                                        </div>

                                    </LayoutTemplate>

                                    <GroupTemplate>

                                        <asp:PlaceHolder runat="server" ID="itemPlaceHolder1"></asp:PlaceHolder>

                                    </GroupTemplate>

                                    <ItemTemplate>

                                        <div class="b-items__cars-one wow zoomInUp" data-wow-delay="0.5s">

                                            <div class="b-items__cars-one-info">

                                                <div class="b-items__cars-one-info-header s-lineDownLeft">

                                                    <a href='Details.aspx?name=<%# Eval("name") %>' style="text-decoration: none">

                                                        <h2>

                                                            <%# Eval("name") %>

                                                        </h2>

                                                    </a>

                                                </div>

                                                

                                            </div>

                                        </div>

                                    </ItemTemplate>
                </asp:ListView>


            <%--<asp:Repeater ID="RptListPokemon" runat="server">
                <ItemTemplate>
                    <div class="container">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="col-md-4">

                                </div>
                                <div class="col-md-8">
                                    <h2>
                                        <%# Eval("name") %>
                                    </h2>
                                </div>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>--%>
        </article>
    </section>

</asp:Content>
