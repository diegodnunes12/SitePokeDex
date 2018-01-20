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
    public partial class BestAttacks : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string json = new WebClient().DownloadString("https://pokeapi.co/api/v2/pokemon/?limit=949&offset=0");
                RootObject datalist = JsonConvert.DeserializeObject<RootObject>(json);

                List<PokemonData> pokemonsData;
                foreach (Result item in datalist.results)
                {
                    string jsonPokemonData = new WebClient().DownloadString(item.url);
                    PokemonData datalistPokemonData = JsonConvert.DeserializeObject<PokemonData>(jsonPokemonData);
                }


                this.ListPokemons.DataSource = datalist.results;
                this.ListPokemons.DataBind();
            }
        }
    }
}