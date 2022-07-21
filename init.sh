export SECRET=resources/certificates
read -p "Artifactory User: " ARTIFACTORY_USERNAME
read -s -p "Artifactory password: " ARTIFACTORY_PASSWORD
echo
read -p "Github user: " GITHUB_USERNAME
read -s -p "Github password: " GITHUB_PASSWORD
echo
read -p "Secondary Artifactory user: " SECONDARY_ARTIFACTORY_USERNAME
read -s -p "Secondary Artifactory password: " SECONDARY_ARTIFACTORY_PASSWORD
echo
export ARTIFACTORY_USERNAME
export ARTIFACTORY_PASSWORD
export GITHUB_PASSWORD
export GITHUB_USERNAME
export SECONDARY_ARTIFACTORY_USERNAME
export SECONDARY_ARTIFACTORY_PASSWORD
export SECONDARY_ARTIFACTORY_URL=https://<your artifactory server>/artifactory/
export DOWNLOADS_ROOT_URL=https://<your download server>/download
export ARTIFACTORY_REPO=
