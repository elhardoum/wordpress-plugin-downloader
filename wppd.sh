#!/bin/bash

echo ""
echo ""
echo "=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="
echo ""
echo "  WordPress Plugins Downloader"
echo "  download plugins from your terminal, including the removed"
echo "  ones (if the SVN repo is still there)"
echo ""
echo "  Written by Samuel Elh (2016)"
echo "  https://github.com/elhardoum/"
echo "  @samuel_elh"
echo ""
echo "=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="
echo ""
echo ""
echo "Before you begin, please cd to the directory where"
echo "you want the plugin to be saved."
echo ""
echo "(e.g cd wp-content/plugins/)"
echo ""
echo ""
echo "Please enter the plugin name slug:"
echo ""
echo "(plugin slug, e.g wordpress-seo, all-in-one-seo-pack)"
echo ""
read pluginName
pluginSvnUri="https://plugins.svn.wordpress.org/"

if [ ! -z $pluginName ]
then
    echo ""
    echo ""
    echo "Searching for SVN repository ..."
    pluginSvnUri+=$pluginName
    pluginSvnUri+="/trunk/"
    echo ""
    echo ""
    SavedTo=$(pwd)

    if curl --output /dev/null --silent --head --fail "$pluginSvnUri"
    then
        echo "Packing files from the repository..."
        echo ""
        svn export "$pluginSvnUri" $pluginName
        echo ""
        echo ""
        echo "Would you like to make a zip of this plugin? [Y/N]"
        read do_zip
        if [[ $do_zip =~ ^(y|Y|)$ ]]
        then
            echo "Making a archive in progress ..."
            echo ""
            echo ""
            zip -r "$pluginName.zip" "$pluginName"
            SavedTo+="/$pluginName.zip!"
            echo ""
            echo ""
            echo "Zipped to $SavedTo"
            sudo rm -r "$pluginName"
        else
            SavedTo+="/$pluginName"
            echo ""
            echo ""
            echo "Your plugin $pluginName is saved into this directory $SavedTo"
        fi

        echo ""
        echo ""
        echo "Cheers!"

    else
        echo "Sorry, there is no SVN repository found for this plugin."
        exit
    fi

else
    echo "Please enter a plugin name and try again."
    exit
fi
