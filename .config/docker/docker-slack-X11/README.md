# Slack in a Container

Docker image based on ArchLinux to run Slack Desktop.

## Usage

```
docker run --rm -it --name slack \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  -e DISPLAY=unix$DISPLAY \
  -e GDK_SCALE=2 \
  --device /dev/snd \
  -v /dev/shm:/dev/shm \
  -v /usr/share/fonts:/usr/share/fonts \
  -v /usr/share/themes:/usr/share/themes/ \
  -v ~/.config/gtk-3.0:/home/slack/.config/gtk-3.0 \
  -v ~/.config/Slack:/home/slack/.config/Slack \
  mcuadros/slack-x11
```