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
    public partial class Search : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Buscando todos Pokémons
                this.GetPokemons();
            }
        }        

        /// <summary>
        /// Buscando todos os Pokémons
        /// </summary>
        protected async void GetPokemons()
        {
            // Recebe o Json e converte ele em um objeto RootObject
            string json = await new WebClient().DownloadStringTaskAsync("https://pokeapi.co/api/v2/pokemon/?limit=949&offset=0");
            RootObject datalist = JsonConvert.DeserializeObject<RootObject>(json);

            List<BestAttack> bestAttacks = new List<BestAttack>();
            // Apresenta a imagem e o nome do Pokémon
            foreach (Result item in datalist.results)
            {
                int id = this.GetIdByUrl(item.url);
                
                BestAttack bestAttack = new BestAttack();
                bestAttack.name = item.name;
                bestAttack.image = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/" + id + ".png";
                bestAttack.id = id;

                bestAttacks.Add(bestAttack);
            }

            // Verifica a ordem seleciona pelo usuário
            switch (this.DdlOrder.SelectedValue)
            {
                case "1":
                    this.ListPokemons.DataSource = bestAttacks.OrderBy(pk => pk.name);
                    break;
                case "2":
                    this.ListPokemons.DataSource = bestAttacks.OrderByDescending(pk => pk.name);
                    break;
                case "3":
                    this.ListPokemons.DataSource = bestAttacks.OrderBy(pk => pk.id);
                    break;
                case "4":
                    this.ListPokemons.DataSource = bestAttacks.OrderByDescending(pk => pk.id);
                    break;
                default:
                    this.ListPokemons.DataSource = bestAttacks.OrderBy(pk => pk.id);
                    break;
            }

            this.ListPokemons.DataBind();            
        }

        /// <summary>
        /// Executa a ordenação da Lista
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void DdlOrder_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.GetPokemons();
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