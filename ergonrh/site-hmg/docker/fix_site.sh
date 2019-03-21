#!/bin/bash
#Script para corrigir temporariamente o problema com o site do Ergonrh, efetuando o clone dos repositórios do Ergonrh sem infecção do Github e atualizando no EFS de onde o container puxa o Corem, Themes e Plugins.
#Author Rivendel DevOps

#Vars
DATE="$(date +"%Y_%m_%d-%H-%M")"

#Faz o backup dos arquivos atuais Site (verificar necessidade)
#cp -Rf /usr/share/nginx/ergonrh /tmp/bkp_ergonrh_$DATE

#Realiza o clone dos repositórios em /tmp/git
git clone https://$GIT_USER@github.com/technecloud/ergonrh_website_core.git /tmp/git-$DATE
git clone https://$GIT_USER@github.com/technecloud/ergonrh_websites_themes.git /tmp/git-$DATE/wp-content/themes
git clone https://$GIT_USER@github.com/technecloud/ergonrh_website_plugins.git /tmp/git-$DATE/wp-content/plugins

#Copia com Overwrite os arquivos clonados para o diretório do site do ergonrh
cp -Rf /tmp/git-$DATE/* /usr/share/nginx/ergonrh/

#Refaz permissionamento dos arquivos do site do ergonrh
chown -R www-data. /usr/share/nginx/ergonrh/*
chmod -R 755 /usr/share/nginx/ergonrh/*
