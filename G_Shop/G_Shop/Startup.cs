using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(G_Shop.Startup))]
namespace G_Shop
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
