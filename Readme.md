# Docker ddclient image for Raspberry Pi (and other armhf)
This image contains ddclient 3.8.3 on Alpine Linux 3.6.
Based loosely on [babim/docker-alp-ddclient](https://github.com/babim/docker-alp-ddclient).
I use it to keep a Cloudflare domain updated (see [Cloudflare's documentation](https://www.cloudflare.com/technical-resources/#ddclient)).

To install as a service:
```docker run --volume $(pwd)/ddclient.conf:/etc/ddclient/ddclient.conf --name ddclient --restart unless-stopped --detach -t mjenz/rpi-ddclient```
