#!/bin/bash

WEBSITE_STAGING_PATH="$SECOND_BRAIN_PATH/61.websites/20.website2/blog_published"
WEBSITE_BUILD_PATH="$HOME_PATH/website_repo"

echo "SN3AKIWHIZPER SYNC FROM SECOND BRAIN TO WEBSITE REPO"
ech "*****************************************************"
echo "> syncing pages"
rsync -av $WEBSITE_STAGING_PATH $WEBSITE_BUILD_PATH/_pages/
echo "> well done!"
