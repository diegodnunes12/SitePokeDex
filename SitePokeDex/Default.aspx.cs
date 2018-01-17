using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Newtonsoft.Json;
using System.Runtime.Serialization;

namespace SitePokeDex
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //List<Pokemon> pokemons = new List<Pokemon>();

                //Pokemon pokemon1 = new Pokemon();
                //pokemon1.Id = "1";
                //pokemon1.Nome = "Poke1";                

                //Pokemon pokemon2 = new Pokemon();
                //pokemon2.Id = "2";
                //pokemon2.Nome = "Poke2";

                //Pokemon pokemon3 = new Pokemon();
                //pokemon3.Id = "3";
                //pokemon3.Nome = "Poke3";

                //Pokemon pokemon4 = new Pokemon();
                //pokemon4.Id = "4";
                //pokemon4.Nome = "Poke4";

                //Pokemon pokemon5 = new Pokemon();
                //pokemon5.Id = "5";
                //pokemon5.Nome = "Poke5";

                //pokemons.Add(pokemon1);
                //pokemons.Add(pokemon2);
                //pokemons.Add(pokemon3);
                //pokemons.Add(pokemon4);
                //pokemons.Add(pokemon5);

                //this.RptListPokemon.DataSource = pokemons;
                //this.RptListPokemon.DataBind();


                ///teste
                ///

                string json = new WebClient().DownloadString("https://pokeapi.co/api/v2/pokemon/");
                RootObject datalist = JsonConvert.DeserializeObject<RootObject>(json);

                this.RptListPokemon.DataSource = datalist.results;
                this.RptListPokemon.DataBind();

                //List<Result> pokes = JsonConvert.DeserializeObject<List<Result>>(json);
                //var pokes = (List<RootObject>)JsonConvert.DeserializeObject(json, json.GetType());

                //foreach (var item in pokes)
                //{
                //    int a = 1;
                //}
            }
        }
    }

    public class Result
    {
        public string url { get; set; }
        public string name { get; set; }
    }

    public class RootObject
    {
        public int count { get; set; }
        public object previous { get; set; }
        public Result [] results { get; set; }
        public string next { get; set; }
    }
}