FROM alpine as prechroot

ENV FREEBSD_VERSION=15.0

RUN mkdir /freebsd \
  && cd /freebsd \
  && wget -q https://download.freebsd.org/snapshots/amd64/${FREEBSD_VERSION}-CURRENT/base.txz \
  && wget -q https://download.freebsd.org/snapshots/amd64/${FREEBSD_VERSION}-CURRENT/lib32.txz

FROM scratch as chroot

ADD --from=prechroot /freebsd/base.txz /
ADD --from=prechroot /freebsd/lib32.txz /

RUN echo hi
