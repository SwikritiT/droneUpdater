#!/usr/bin/env bash

# Author : Swikriti Tripath
# Copyright (c) Swikriti Tripathi
# Script follows here:

export BRANCH_NAME="update-drone-20220309"
declare -a REPO_NAMES=(
          "activity"
          "admin_audit"
          "afterlogic"
          "announcementcenter"
          "bookmarks"
          "brute_force_protection"
          "calendar"
          "contacts"
          "customgroups"
          "diagnostics"
          "enterprise_key"
          "files_antivirus"
          "files_classifier"
          "files_clipboard"
          "files_external_dropbox"
          "files_external_ftp"
          "files_external_s3"
          "files_ldap_home"
          "files_lifecycle"
          "files_mediaviewer"
          "files_pdfviewer"
          "files_primary_s3"
          "files_texteditor"
          "files_textviewer"
          "firewall"
          "gallery"
          "graphapi"
          "guests"
          "impersonate"
          "market"
          "metrics"
          "music"
          "notes"
          "objectstore"
          "openidconnect"
          "password_policy"
          "ransomware_protection"
          "richdocuments"
          "search_elastic"
          "sharepoint"
          "systemtags_management"
          "tasks"
          "templateeditor"
          "theme-enterprise"
          "twofactor_backup_codes"
          "twofactor_privacyidea"
          "twofactor_totp"
          "user_ldap"
          "user_shibboleth"
          "windows_network_drive"
          "wopi"
          "workflow"
        )


LEN=${#REPO_NAMES[@]}

for (( i=0; i<${LEN}; i++ ))
do
  cd $HOME/www/core/apps/
  if [ -d "$HOME/www/core/apps/${REPO_NAMES[i]}" ]; then
    echo ${REPO_NAMES[i]} ' already exists!'
    git checkout master
    git pull origin master
  else
    git clone git@github.com:owncloud/${REPO_NAMES[i]}.git --depth=1
  fi
  cd $HOME/www/core/apps/${REPO_NAMES[i]}
  git checkout -b $BRANCH_NAME
done