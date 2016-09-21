# WordPress Plugin Downloader
Lets you download any WordPress plugin from the terminal. Can be used to download plugins that are removed from the WordPress plugins repository (but still have the SVN repo)

# Usage
1. download and upload `wppd.sh` to anywhere on your server or local environment
2. run `sudo wppd.sh` and follow up.

You should enter the plugin name slug (e.g wordpress-seo for wordpress.org/plugins/wordpress-seo) in order to download the plugin.

You should also cd to the directory where you want to save this download before calling the script.

# Requirements
Required packages: `curl` (used to check for the plugin SVN repository) and `zip` is optional.

Thanks! This is acutally my first bash shell script and I learned few commands while setting up some cloud servers on DigitalOcean. A long way ahead :)
