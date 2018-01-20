using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SitePokeDex
{
    public partial class Details : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string pokemonSelected = Request.QueryString["name"];

                string json = new WebClient().DownloadString("https://pokeapi.co/api/v2/pokemon/" + pokemonSelected);
                PokemonData datalist = JsonConvert.DeserializeObject<PokemonData>(json);

                

                // composing the data of the Pokémon
                this.LblName.Text = datalist.name.ToString() + " n° " + datalist.id;
                this.ImgPoke.ImageUrl = datalist.sprites.front_default;
                this.LblWeight.Text = datalist.weight.ToString();
                this.LblBaseExperience.Text = datalist.base_experience.ToString();
                this.LblHeight.Text = datalist.height.ToString();

                

                foreach (var ab in datalist.abilities)
                {
                    this.LblAbilities.Text += ab.ability.name + ", ";
                }

                foreach (var st in datalist.stats)
                {
                    this.LtlStats.Text += "<div class='col-xs-6 text-right'>" + st.stat.name + ":</div >" + 
                        "<div class='col-xs-6'>" +
                            "<div class='progress'>" +
                                "<div class='progress-bar' role='progressbar' aria-valuenow='" + st.base_stat + "' aria-valuemin='0' aria-valuemax='100' style='width:" + st.base_stat + "%;'>" +
                                    st.base_stat + 
                                " </div>" +
                            " </div>" +
                         " </div>";                    
                }

                foreach (var mv in datalist.moves)
                {
                    this.LblMoves.Text += "<div class='col-md-3'>" + mv.move.name + "</div>";
                }
            }
        }
    }
}