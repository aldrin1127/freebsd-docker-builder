FROM alpine as prechroot

ENV FREEBSD_VERSION=15.0

RUN mkdir /freebsd/ \
  && wget -q "https://download.freebsd.org/snapshots/amd64/${FREEBSD_VERSION}-CURRENT/base.txz" \
  && tar -Jxf base.txz --remove-files \
  && rm base.txz \
  && wget -q "https://download.freebsd.org/snapshots/amd64/${FREEBSD_VERSION}-CURRENT/lib32.txz" \
  && tar -Jxf lib32.txz --remove-files \
  && rm lib32.txz

FROM scratch as chroot

COPY --from=prechroot /freebsd/ /

RUN echo hi
