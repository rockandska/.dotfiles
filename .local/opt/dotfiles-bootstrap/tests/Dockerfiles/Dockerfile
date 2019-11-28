FROM alpine:3.10.3
ARG GUIX_BINARY_VERSION
COPY etc/profile.d/guix.sh /etc/profile.d/
COPY usr/local/bin/entrypoint /usr/local/bin/
COPY usr/local/bin/guix /usr/local/bin/
RUN apk add --no-cache shadow && \
  groupadd --system guixbuild && \
  for i in `seq -w 1 10`; do useradd -g guixbuild -G guixbuild -d /var/empty -s `which nologin` -c "Guix build user $i" --system guixbuilder$i; done && \
  apk del shadow && \
  wget -O - https://ftp.gnu.org/gnu/guix/guix-binary-${GUIX_BINARY_VERSION}.x86_64-linux.tar.xz | tar -xJv -C / && \
  mkdir -p /root/.config/guix && \
  ln -sf /var/guix/profiles/per-user/root/current-guix /root/.config/guix/current && \
  source /root/.config/guix/current/etc/profile && \
  mkdir -p /usr/local/share/info && \
  for i in /var/guix/profiles/per-user/root/current-guix/share/info/*; do ln -s $i /usr/local/share/info/; done && \
  guix archive --authorize < /root/.config/guix/current/share/guix/ci.guix.gnu.org.pub
VOLUME /root/.config/guix
VOLUME /root/.guix-profile
VOLUME /var/guix
VOLUME /gnu/store
ENTRYPOINT [ "entrypoint" , "guix-daemon" ]
CMD [ "--build-users-group=guixbuild" ]
