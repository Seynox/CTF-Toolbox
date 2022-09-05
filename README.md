# CTF Toolbox
A installer for a fully installed Kali docker.
**Warning : This has been made for Arch distros running systemd and Xorg**
## Install
1. Clone this repo
2. `cd` into the repo directory and run the `install.sh` script (You only need to do this once)
3. You can delete the repo directory and its content
4. Log-out and log back in (or just reboot)

## Usage
From anywhere, you can run the `kali` command to enter the toolbox and run any tool (even graphical ones like Burpsuite).
You can also have multiple shells by running the `kali` command from another terminal.
The only shared directory is the CTF directory located at your home (`~/CTF/`) and mounted in the docker (`/CTF/`)

## Troubleshooting
- Docker "permission denied" when running the `kali` command : Make sure you did the 4th step of the installation so that your user is in the `docker` group

- Kali command not found: Make sure that /usr/bin is in your PATH

Note : Remember that **only** the CTF folder is shared ! Adding a /etc/hosts entry needs to be done on the host AND the docker container !
