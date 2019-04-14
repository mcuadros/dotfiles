# Run the Slack in a container
#
# Build or update image:
#   docker build --no-cache -t mcuadros/slack-x11 .
#

FROM archlinux/base
ARG USERNAME=slack

# User and group configuration
RUN  groupmod -g 1000 users \
	&& groupmod -g 29 audio \
	&& useradd -ms /bin/bash $USERNAME -u 1000 -g users -G sys,adm,uucp,wheel,tty,log,audio

# Minimum build tools package
RUN pacman --noconfirm -Syu git sudo fakeroot binutils file awk patch \
  && echo "${USERNAME} ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

USER $USERNAME
WORKDIR /home/$USERNAME

# Slack installation
RUN git clone https://aur.archlinux.org/slack-desktop-dark.git \
  && cd slack-desktop-dark \
  && makepkg -si --noconfirm


ENTRYPOINT ["/usr/lib/slack/slack"]
