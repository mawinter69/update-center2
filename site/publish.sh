#!/bin/bash -ex

# Used later for rsyncing updates
#UPDATES_SITE="updates.jenkins.io"
#RSYNC_USER="www-data"

#wget --no-verbose -O jq https://github.com/stedolan/jq/releases/download/jq-1.5/jq-linux64 || { echo "Failed to download jq" >&2 ; exit 1; }
#chmod +x jq || { echo "Failed to make jq executable" >&2 ; exit 1; }

export PATH=.:$PATH

"$( dirname "$0" )/generate.sh" ./www ./www/download

# push plugins to mirrors.jenkins-ci.org
chmod -R a+r www/download
rsync -avzH --size-only --link-dir=/data/update-center2/www/download/plugins /data/update-center2/www/download/plugins/ /data/update-site/www/download/plugins

# Invoke a minimal mirrorsync to mirrorbits which will use the 'recent-releases.json' file as input
#ssh ${RSYNC_USER}@${UPDATES_SITE} "cat > /tmp/update-center2-rerecent-releases.json" < www2/experimental/recent-releases.json
#ssh ${RSYNC_USER}@${UPDATES_SITE} "/srv/releases/sync-recent-releases.sh /tmp/update-center2-rerecent-releases.json"

# push generated index to the production servers
# 'updates' come from tool installer generator, so leave that alone, but otherwise
# delete old sites
chmod -R a+r www
rsync -acvz www/ --exclude=/download --delete /data/update-site/www/
