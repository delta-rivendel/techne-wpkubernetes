#!/bin/bash
#Script para corrigir temporariamente o problema com o Intratechne, efetuando o clone dos repositórios do Intratechne sem infecção do Github e atualizando no EFS de onde o container puxa o Corem, Themes e Plugins.
#Author Rivendel DevOps

#Vars
DATE="$(date +"%Y_%m_%d-%H-%M")"

#Faz o backup dos arquivos atuais Site (verificar necessidade)
#cp -Rf /usr/share/nginx/ergonrh /tmp/bkp_intratechne_$DATE

#Realiza o clone dos repositórios em /tmp/git
git clone https://$GIT_USER@github.com/technecloud/techne_intra_core.git /tmp/git-$DATE
git clone https://$GIT_USER@github.com/technecloud/techne_intra_themes.git /tmp/git-$DATE/wp-content/themes
git clone https://$GIT_USER@github.com/technecloud/techne_intra_plugins.git /tmp/git-$DATE/wp-content/plugins

#Copia com Overwrite os arquivos clonados para o diretório do site do ergonrh
cp -Rf /tmp/git-$DATE/* /usr/share/nginx/intratechne/

#Refaz permissionamento dos arquivos do site do blog-techne
chown -R www-data. /usr/share/nginx/intratechne/*
chmod -R 755 /usr/share/nginx/intratechne/*
