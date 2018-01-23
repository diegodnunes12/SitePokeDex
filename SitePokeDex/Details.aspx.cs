using Newtonsoft.Json;
using System;
using System.Net;

namespace SitePokeDex
{
    public partial class Details : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Recuperando o nome do Pokémon selecionado            
                string pokemonSelected = Request.QueryString["name"];

                // Search the Pokémon data
                string json = new WebClient().DownloadString("https://pokeapi.co/api/v2/pokemon/" + pokemonSelected);
                PokemonData datalist = JsonConvert.DeserializeObject<PokemonData>(json);                

                // composing the data of the Pokémon
                this.LblName.Text = datalist.name.ToString() + " n° " + datalist.id;
                this.ImgPoke.ImageUrl = datalist.sprites.front_default;
                this.LblWeight.Text = datalist.weight.ToString();
                this.LblBaseExperience.Text = datalist.base_experience.ToString();
                this.LblHeight.Text = datalist.height.ToString();

                // composing abilities
                string ability = "";
                foreach (var ab in datalist.abilities)
                {
                    ability += ab.ability.name + ", ";
                }
                ability = ability.Remove(ability.Length - 2);
                this.LblAbilities.Text = ability;

                // composing type
                string type = "";
                foreach (var tp in datalist.types)
                {
                    type += tp.type.name + ", ";
                }
                this.LblType.Text = type.Remove(type.Length - 2);

                // composing stats
                foreach (var st in datalist.stats)
                {
                    float percent = (st.base_stat * 100) / 400;

                    this.LtlStats.Text += "<div class='col-xs-6 text-right'>" + st.stat.name + ":</div >" + 
                        "<div class='col-xs-6'>" +
                            "<div class='progress'>" +
                                "<div class='progress-bar' role='progressbar' aria-valuenow='" + st.base_stat + "' aria-valuemin='0' aria-valuemax='500' style='width:" + percent + "%;'>" +
                                    st.base_stat + 
                                " </div>" +
                            " </div>" +
                         " </div>";                    
                }

                // composing moves
                string move = "<ul class='list-group'>";
                foreach (var mv in datalist.moves)
                {
                    move += "<div class='col-md-3 moves'><li class='list-group-item'>" + mv.move.name + "</li></div>";
                }
                move += "</ul>";
                this.LblMoves.Text = move;
            }
        }
    }
}