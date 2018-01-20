using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

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
                        switch (st.stat.name)
                        {
                            case "attack":
                                bestAttack.base_attack = st.base_stat;
                                break;
                            case "speed":
                                bestAttack.base_speed = st.base_stat;
                                break;
                            case "special-defense":
                                bestAttack.base_spDf = st.base_stat;
                                break;
                            case "special-attack":
                                bestAttack.base_spAt = st.base_stat;
                                break;
                            case "defense":
                                bestAttack.base_defense = st.base_stat;
                                break;
                            case "hp":
                                bestAttack.base_hp = st.base_stat;
                                break;
                            default:
                                break;
                        }
                        //if (st.stat.name == "attack")
                        //{
                        //    bestAttack.base_attack = st.base_stat;
                        //}

                        bestAttack.totalStats += st.base_stat;
                    }

                    bestAttacks.Add(bestAttack);
                }

                int attackSum = 0; int defenseSum = 0; int hpSum = 0; int spAtSum = 0; int spDfSum = 0; int speedSum = 0; int weightSum = 0; int experienceSum = 0;
                foreach (var item in bestAttacks.OrderByDescending(ba => ba.base_attack).Take(6))
                {
                    attackSum += item.base_attack;
                    defenseSum += item.base_defense;
                    spAtSum += item.base_spAt;
                    spDfSum += item.base_spDf;
                    speedSum += item.base_speed;
                    hpSum += item.base_hp;
                    weightSum += item.weight;
                    experienceSum += item.base_experience;
                }

                // insert datas on resume
                this.LblTotalAttack.Text = attackSum.ToString();
                this.LblTotalDefense.Text = defenseSum.ToString();
                this.LblTotalSpAt.Text = spAtSum.ToString();
                this.LblTotalSpDf.Text = spDfSum.ToString();
                this.LblTotalHp.Text = hpSum.ToString();
                this.LblTotalSpeed.Text = speedSum.ToString();
                this.LblWeight.Text = weightSum.ToString();
                this.LblBaseExperience.Text = experienceSum.ToString();
                this.LblTotalStats.Text = (attackSum + defenseSum + spAtSum + spDfSum + speedSum + hpSum).ToString();



                this.ListPokemons.DataSource = bestAttacks.OrderByDescending(ba => ba.base_attack).Take(6);
                this.ListPokemons.DataBind();
            }
        }
    }
}