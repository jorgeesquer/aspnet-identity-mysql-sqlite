using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(CustomIdentitySample.Startup))]
namespace CustomIdentitySample
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
