using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using Newtonsoft.Json;


namespace SitePokeDex
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Buscando os 12 primeiros Pokémons
                this.GetPokemons("https://pokeapi.co/api/v2/pokemon/?limit=12&offset=0");
                // Encontrando os 6 melhores dos 12 primeiros
                this.BestAttackLoaded("https://pokeapi.co/api/v2/pokemon/?limit=12&offset=0");
            }
        }

        /// <summary>
        /// Busca os próximos 12 pokemons
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void BtnNext_Click(object sender, EventArgs e)
        {
            // Setando a url da próxima página como Command Name do botão
            this.GetPokemons(this.BtnNext.CommandName);
            // Buscando os melhores ataques
            this.BestAttackLoaded(this.BtnNext.CommandName);
        }

        /// <summary>
        /// Volta a página anterior
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void BtnPrev_Click(object sender, EventArgs e)
        {
            this.GetPokemons(this.BtnPrev.CommandName);
        }

        /// <summary>
        /// Busca os pokemons da API
        /// </summary>
        /// <param name="url"></param>
        protected async void GetPokemons(string url)
        {
            // Recebe os dados do Json e converte em um objeto dataList
            string json = await new WebClient().DownloadStringTaskAsync(url);
            RootObject datalist = JsonConvert.DeserializeObject<RootObject>(json);
            
            List<BestAttack> bestAttacks = new List<BestAttack>();
            // Para cada resultado da lista cria-se um objeto BestAttack que conterá o nome e a foto do Pokémon
            foreach (Result item in datalist.results)
            {
                int id = this.GetIdByUrl(item.url);

                BestAttack bestAttack = new BestAttack();
                bestAttack.name = item.name;
                bestAttack.image = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/" + id + ".png";
                bestAttack.id = id;

                bestAttacks.Add(bestAttack);                
            }

            // Exibindo os Pokémons no Listview
            this.ListPokemons.DataSource = bestAttacks;
            this.ListPokemons.DataBind();

            // Caso não tenha próxima página o botão é desabilitado, caso contrário é alterado o commandName
            if (string.IsNullOrEmpty(datalist.next))
            {
                this.BtnNext.Enabled = false;
            }
            else
            {
                this.BtnNext.CommandName = datalist.next;
                this.BtnNext.Enabled = true;
            }
            // Caso não tenha página anterior o botão é desabilitado, caso contrário é alterado o commandName
            if (datalist.previous == null)
            {
                this.BtnPrev.Enabled = false;
            }
            else
            {
                this.BtnPrev.CommandName = datalist.previous.ToString();
                this.BtnPrev.Enabled = true;
            }            
        }
        
        /// <summary>
        /// Mostra os 6 Pokémons com melhor ataque
        /// </summary>
        /// <param name="url"></param>
        protected async void BestAttackLoaded(string url)
        {
            // Recebe os dados do Json e converte em um objeto dataList
            string json = await new WebClient().DownloadStringTaskAsync(url);
            RootObject datalist = JsonConvert.DeserializeObject<RootObject>(json);

            List<BestAttack> bestAttacks = new List<BestAttack>();

            // Para cada resultado da lista o sistema lê a informação de cada Pokémon
            foreach (Result item in datalist.results)
            {
                string jsonPokemonData = new WebClient().DownloadString(item.url);
                PokemonData datalistPokemonData = JsonConvert.DeserializeObject<PokemonData>(jsonPokemonData);

                // Compondo os dados do Pokémon
                BestAttack bestAttack = new BestAttack();
                bestAttack.name = item.name;
                bestAttack.image = datalistPokemonData.sprites.front_default;
                bestAttack.weight = datalistPokemonData.weight;
                bestAttack.base_experience = datalistPokemonData.base_experience;

                // Compondo os dados das estatisticas
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
                    // Somando o total das estatisticas
                    bestAttack.totalStats += st.base_stat;
                }

                bestAttacks.Add(bestAttack);
            }

            // Recuperando os seis melhores até o momento
            for (int i = 0; i < ListBestPokemons.Items.Count; i++)
            {
                BestAttack bestAttack = new BestAttack();
                bestAttack.name = ListBestPokemons.DataKeys[i].Values["name"].ToString();
                bestAttack.image = ListBestPokemons.DataKeys[i].Values["image"].ToString();
                bestAttack.base_attack = int.Parse(ListBestPokemons.DataKeys[i].Values["base_attack"].ToString());
                bestAttack.base_experience = int.Parse(ListBestPokemons.DataKeys[i].Values["base_experience"].ToString());
                bestAttack.weight = int.Parse(ListBestPokemons.DataKeys[i].Values["weight"].ToString());
                bestAttack.totalStats = int.Parse(ListBestPokemons.DataKeys[i].Values["totalStats"].ToString());

                bool verification = false;
                foreach (var item in bestAttacks)
                {
                    if (item.name == bestAttack.name)
                    {
                        verification = true;
                    }
                }
                if (verification == false)
                {
                    bestAttacks.Add(bestAttack);
                }                
            }

            // Somando os dados para o quadro de resumo
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

            // Apresentando os seis melhores
            this.ListBestPokemons.DataSource = bestAttacks.OrderByDescending(ba => ba.base_attack).Take(6);
            this.ListBestPokemons.DataBind();
        }

        /// <summary>
        /// Return id of pokémon through url
        /// </summary>
        /// <param name="url"></param>
        /// <returns></returns>
        protected int GetIdByUrl(string url)
        {
            string idUrl = url.Replace("https://pokeapi.co/api/v2/pokemon/", "").Replace("/", "");
            return int.Parse(idUrl);
        }
    }
}