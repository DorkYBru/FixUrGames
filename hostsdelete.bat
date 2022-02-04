echo "odpal jako administrator"
cd C:\Windows\System32\drivers\etc
del hosts
wget "https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts"
echo skończone
exit