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
                string json = new WebClient().DownloadString("https://pokeapi.co/api/v2/pokemon/?limit=10&offset=0");
                RootObject datalist = JsonConvert.DeserializeObject<RootObject>(json);

                List<BestAttack> bestAttacks = new List<BestAttack>();
                foreach (Result item in datalist.results)
                {
                    string jsonPokemonData = new WebClient().DownloadString(item.url);
                    PokemonData datalistPokemonData = JsonConvert.DeserializeObject<PokemonData>(jsonPokemonData);

                    BestAttack bestAttack = new BestAttack();
                    bestAttack.name = item.name;
                    bestAttack.image = datalistPokemonData.sprites.front_default;
                    bestAttack.weight = datalistPokemonData.weight;
                    bestAttack.base_experience = datalistPokemonData.base_experience;

                    foreach (Stat st in datalistPokemonData.stats)
                    {
                        if (st.stat.name == "attack")
                        {
                            bestAttack.base_attack = st.base_stat;
                        }

                        bestAttack.totalStats += st.base_stat;
                    }

                    bestAttacks.Add(bestAttack);
                }


                this.ListPokemons.DataSource = bestAttacks.OrderByDescending(ba => ba.base_attack).Take(6);
                this.ListPokemons.DataBind();
            }
        }
    }
}