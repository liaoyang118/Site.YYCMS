using System.Web;
using System.Web.Optimization;

namespace Site.Main
{
    public class BundleConfig
    {
        // For more information on bundling, visit https://go.microsoft.com/fwlink/?LinkId=301862
        public static void RegisterBundles(BundleCollection bundles)
        {
            bundles.Add(new ScriptBundle("~/bundles/jquery").Include(
                        "~/Scripts/jquery-{version}.js"));

            bundles.Add(new ScriptBundle("~/bundles/jqueryval").Include(
                        "~/Scripts/jquery.validate*"));

            // 使用要用于开发和学习的 Modernizr 的开发版本。然后，当你做好
            // ready for production, use the build tool at https://modernizr.com to pick only the tests you need.
            bundles.Add(new ScriptBundle("~/bundles/modernizr").Include(
                        "~/Scripts/modernizr-*"));

            bundles.Add(new ScriptBundle("~/bundles/bootstrap").Include(
                      "~/Scripts/bootstrap.js",
                      "~/Scripts/respond.js"));

            bundles.Add(new StyleBundle("~/Content/css").Include(
                      "~/Content/bootstrap.css"));

            //bootstrap 模板样式,【特别需要注意映射的虚拟路径如果不一致，样式里面的字体、图标资源文件就会找不到路径，映射到实体文件上级目录后在加一级虚拟路径】
            bundles.Add(new StyleBundle("~/Content/Bootstrap/css/temp").Include(
                     "~/Content/Bootstrap/css/reset.css",
                     "~/Content/Bootstrap/css/nivoslider.css",
                     "~/Content/Bootstrap/css/prettyPhoto.css",
                     "~/Content/Bootstrap/css/responsive.css"
                     ));

            bundles.Add(new StyleBundle("~/Content/Bootstrap/temp").Include(
                   "~/Content/Bootstrap/style.css"
                   ));


            //bootstrap 模板脚本
            bundles.Add(new ScriptBundle("~/Scripts/Bootstrap/js/temp").Include(
                     "~/Scripts/Bootstrap/js/jquery-1.7.1.min.js",
                     "~/Scripts/Bootstrap/js/jquery.nivo.slider.pack.js",
                     "~/Scripts/Bootstrap/js/jquery.carouFredSel-5.6.2.js",
                     "~/Scripts/Bootstrap/js/jquery.prettyPhoto.js",
                     "~/Scripts/Bootstrap/js/jquery.sticky.js",
                     "~/Scripts/Bootstrap/js/jquery-scroller-v1.min.js",
                     "~/Scripts/Bootstrap/js/kendo.web.min.js",
                     "~/Scripts/Bootstrap/js/custom.js"
                     ));
        }
    }
}
