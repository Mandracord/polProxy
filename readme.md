# FFXI PlayOnline Proxy

See the original project https://github.com/jaku/POL-Proxy 

--- 

The FFXI PlayOnline Proxy is a simple way to bypass the slow PlayOnline loading process that normally happens before the game launches.

This does NOT bypass PlayOnline authentication and does NOT send any data to third-party servers.
Everything runs locally on your machine.

Instead of downloading PML files from PlayOnline’s servers, the proxy serves a local page that immediately launches the game once PlayOnline starts.

You can see how it works here:
https://www.youtube.com/watch?v=SATgkzxw_ss

---

## How It Works

- PlayOnline normally fetches data from wh000.pol.com
- This proxy redirects that request to your local machine
- A local page is served that launches FFXI immediately
- No credentials are intercepted or stored

---

## Setup (Docker – Recommended for Linux / Steam Deck)

Docker is the easiest way to run the proxy on Linux-based systems, including the Steam Deck.

---

## Requirements

- Docker
- Docker Compose (v2)

---

## Linux (Desktop)

### 1) Install Docker

Use your distro's package manager.

**Debian / Ubuntu:**

```bash
sudo apt install docker docker-compose-plugin
sudo systemctl enable --now docker
```

**Arch Linux:**

```bash
sudo pacman -S docker docker-compose
sudo systemctl enable --now docker
```

**Fedora:**
```bash
sudo dnf install docker docker-compose-plugin
sudo systemctl enable --now docker
```

**openSUSE Leap / Tumbleweed:**

```bash
sudo zypper install docker docker-compose
sudo systemctl enable --now docker
```

**Add user to Docker group (skip using sudo):**
```bash
sudo usermod -aG docker $USER
# log out and back in
```

### 2) Edit hosts file
```bash
echo "127.0.0.1 wh000.pol.com" | sudo tee -a /etc/hosts
```

### 3) Clone and run the proxy
```bash
git clone https://github.com/Mandracord/polProxy
cd polProxy
docker compose \
  -f compose.polproxy.yml \
  -f compose.polproxy.host.yml \
  up --build
```
Expected output:

```bash
POL Proxy is running on port 51304
```
> [!NOTE]
> You can now run `docker compose -f compose.polproxy.yml -f compose.polproxy.host.yml up -d`
> to keep it running in the background.

Launch PlayOnline normally.

---

## Steam Deck (SteamOS)

Steam Deck runs SteamOS (Linux). Docker works in Desktop Mode.

Switch to Desktop Mode:
```bash
Steam button → Power → Switch to Desktop
```

### 1) Install Docker

Open Konsole and run:

```bash
sudo steamos-readonly disable
sudo pacman -S docker docker-compose
sudo systemctl enable --now docker
```

> Note:
> SteamOS updates may require reinstalling Docker.
> Your files and containers are not affected.

### 2) Edit hosts file

```bash
echo "127.0.0.1 wh000.pol.com" | sudo tee -a /etc/hosts
```

### 3) Clone and run proxy

```bash
git clone https://github.com/Mandracord/polProxy
cd polProxy
docker compose -f compose.polproxy.yml up --build
```
> [!NOTE]
> You can now run `docker compose -f compose.polproxy.yml up -d` to keep it running in the background.

---

## Windows

Windows users can either use Docker or the prebuilt executable.

### Option A: Docker

Install Docker Desktop:
https://www.docker.com/products/docker-desktop

Ensure Docker Desktop is running before continuing.

Clone and run

Open Powershell as Administrator:

```bash
git clone https://github.com/Mandracord/polProxy
cd polProxy
docker compose up --build
```

Edit hosts file as Administrator:

```bash
C:\Windows\System32\drivers\etc\hosts
```

Add:

```bash
127.0.0.1   wh000.pol.com
```

Save the file and launch PlayOnline.

---

### Option B: Prebuilt Executable (Windows Only)

Download:
https://github.com/jaku/POL-Proxy/releases/download/1.0.0/PolProxy.exe

Run it and you should see:

```bash
POL Proxy is running on port 51304
```

---

## Notes

- The proxy must be running before logging into PlayOnline
- You can close the proxy after logging in, but it uses minimal resources
- If you stop using the proxy, remove wh000.pol.com from your hosts file

---

## License

MIT
https://choosealicense.com/licenses/mit/
