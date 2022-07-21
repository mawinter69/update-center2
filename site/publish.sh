#!/bin/bash -ex

# Used later for rsyncing updates
#UPDATES_SITE="updates.jenkins.io"
#RSYNC_USER="www-data"

#wget --no-verbose -O jq https://github.com/stedolan/jq/releases/download/jq-1.5/jq-linux64 || { echo "Failed to download jq" >&2 ; exit 1; }
#chmod +x jq || { echo "Failed to make jq executable" >&2 ; exit 1; }

export PATH=.:$PATH

#"$( dirname "$0" )/generate.sh" ./www ./www/download

chmod -R a+r www/download
rsync -avzH --size-only --link-dest=/data/update-center2/www/download/plugins /data/update-center2/www/download/plugins/ /data/update-site/www/download/plugins


# push generated index to the production servers
# 'updates' come from tool installer generator, so leave that alone, but otherwise
# delete old sites
chmod -R a+r www
rsync -acvz www/ --exclude=/download --delete /data/update-site/www/
