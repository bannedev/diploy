echo Fetching binary
curl -s https://api.github.com/repos/crossphoton/diploy/releases/latest \
| grep "browser_download_url.*diploy" \
| cut -d : -f 2,3 \
| tr -d \" \
| wget -qi -
echo Done
echo Giving permissions
chmod +x diploy

echo Running setup
./diploy server setup