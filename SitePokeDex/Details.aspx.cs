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

                foreach (var ab in datalist.abilities)
                {
                    this.LblAbilities.Text += ab.ability.name + " ";
                }

                foreach (var st in datalist.stats)
                {
                    this.LblAbilities.Text += st.stat.name + ": " + st.base_stat + " ";
                }


            }
        }
    }
}