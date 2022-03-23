FROM hugojosefson/popos

# Adds repositories, then updates them locally and finally downloads and installs packages. The final package, for KeePassXC,
# is downloaded from an S3 Bucket I have set up which contains the .deb package. 

RUN add-apt-repository ppa:hluk/copyq 
#    curl https://download.jitsi.org/jitsi-key.gpg.key | sh -c 'gpg --dearmor > /usr/share/keyrings/jitsi-keyring.gpg' &&\
#    echo 'deb [signed-by=/usr/share/keyrings/jitsi-keyring.gpg] https://download.jitsi.org stable/' |\
#    tee /etc/apt/sources.list.d/jitsi-stable.list > /dev/null &&\
#    curl -sS https://download.spotify.com/debian/pubkey_0D811D58.gpg | apt-key add - &&\
#    echo "deb http://repository.spotify.com stable non-free" | tee /etc/apt/sources.list.d/spotify.list &&\ 
#    add-apt-repository ppa:qbittorrent-team/qbittorrent-stable &&\

RUN apt-get update && apt-get install -y \
      copyq \
      neofetch \
      git
#     jitsi-meet &&\
#     qbittorrent &&\
#     spotify-client &&\
#     virtualbox &&\
#     gparted &&\     

RUN mkdir Downloads && cd Downloads &&\
    curl -O https://software-packages-pop-os.s3.amazonaws.com/keepassxc_2.4.3%2Bdfsg.1-1build1_amd64.deb &&\
    apt install -y ./keepassxc_2.4.3%2Bdfsg.1-1build1_amd64.deb

CMD echo 'This is my Pop!_OS setup. This image contains a few applications I've installed on my computer. They are CopyQ, Neofetch, Git, QBittorrent, Jitsi Meet, Spotify, VirtualBox, GParted and KeePassXC."
