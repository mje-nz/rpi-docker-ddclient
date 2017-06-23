# Docker ddclient image for Raspberry Pi (and other armhf)
[![](https://images.microbadger.com/badges/image/mjenz/rpi-ddclient.svg)](https://microbadger.com/images/mjenz/rpi-ddclient "Get your own image badge on microbadger.com")

This image contains ddclient 3.8.3 on Alpine Linux 3.6.
Based loosely on [babim/docker-alp-ddclient](https://github.com/babim/docker-alp-ddclient).
I use it to keep a CloudFlare domain updated (see [CloudFlare's documentation](https://www.cloudflare.com/technical-resources/#ddclient)).

To install as a service:
```docker run --volume $(pwd)/ddclient.conf:/etc/ddclient/ddclient.conf --name ddclient --restart unless-stopped --detach -t mjenz/rpi-ddclient```
