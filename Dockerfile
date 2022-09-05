FROM kalilinux/kali-rolling:latest

# Install packages
RUN apt update && DEBIAN_FRONTEND=noninteractive apt install -y kali-linux-default seclists
# Install rustscan
RUN wget -O /tmp/rustscan.deb "https://github.com/RustScan/RustScan/releases/download/2.0.1/rustscan_2.0.1_amd64.deb" && dpkg -i /tmp/rustscan.deb

# Create user
ARG NAME=bob
RUN useradd -u 1000 -G sudo -ms /bin/zsh $NAME
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

# Unzip rockyou
RUN gunzip -d /usr/share/wordlists/rockyou.txt.gz

# Add .git to directory wordlist
RUN echo ".git/HEAD" >> /usr/share/seclists/Discovery/Web-Content/directory-list-2.3-medium.txt
