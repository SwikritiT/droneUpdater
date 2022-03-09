#!/usr/bin/env bash

# Author : Swikriti Tripath
# Copyright (c) Swikriti Tripathi
# - Requries the gh CLI (https://github.com/cli/cli) to create a PR.
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
    cd $HOME/www/core/apps/${REPO_NAMES[i]}
    git fetch origin master
    git rebase origin/master
    git add .
    git commit -m "Update drone.star to match the latest changes"
    git push -u origin $BRANCH_NAME
    gh pr create -a '@me'  -t "[CI]Update drone.star to match the latest changes" -F /$HOME/www/droneUpdater/prDesc.md -l 'QA:team' -p 'Current: QA/CI/TestAutomation'
done