using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(ASP_ProjectFina.Startup))]
namespace ASP_ProjectFina
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
