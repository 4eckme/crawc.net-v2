# overview:
+ this release for users, who had a problems with the first version. if you successfully use old code, i don't recommend use this update. this version includes modules dependences and more detailed instruction for install. also engines global variables are explicitly specified.
+ to minimize problems with install i recomend use ubuntu 20.04.

# installation:
+ get core into your home dir (default /home/chat/) from https://github.com/4eckme/crawc.net
+ update srv.js by new version (https://github.com/4eckme/crawc.net-v2) and copy package-lock.json from v2 into default home directory
+ then change global variables and set passwords
+ install mysql-server, mysql-client, imagemagick, exiftool, curl, nodejs, npm, certbot
+ install npm modules from package-lock.json (you can use "npm ci" for this action)
+ get security keys for https connection (use "certbot certonly")
+ allow access for write permissions on public/images and public/img and their child directories
+ create mysql database and load structure with demo-data from dump.sql

# run in debug mode:
+ node -r esm srv.js 

# run as a daemon:
+ forever start -c "node -r esm" srv.js

# last step:
+ register first user by auth web form from your site, it will be admin account
+ admin can manage default rooms and block accounts by link https://yoursitename.ru/ban/<USER_ID>
