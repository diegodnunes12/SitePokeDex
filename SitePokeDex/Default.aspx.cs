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
                this.GetPokemons("https://pokeapi.co/api/v2/pokemon/");                
            }
        }

        /// <summary>
        /// Busca os próximos 20 pokemons
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void BtnNext_Click(object sender, EventArgs e)
        {
            this.GetPokemons(this.BtnNext.CommandName);
        }

        /// <summary>
        /// 
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
        protected void GetPokemons(string url)
        {
            string json = new WebClient().DownloadString(url);
            RootObject datalist = JsonConvert.DeserializeObject<RootObject>(json);

            this.ListPokemons.DataSource = datalist.results;
            this.ListPokemons.DataBind();

            if (string.IsNullOrEmpty(datalist.next))
            {
                this.BtnNext.Enabled = false;
            }
            else
            {
                this.BtnNext.CommandName = datalist.next;
                this.BtnNext.Enabled = true;
            }

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
    }
}