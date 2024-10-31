FROM alpine as prechroot

RUN mkdir -p /freebsd/sys

FROM scratch as chroot

COPY --from=prechroot /freebsd/sys /sys

ADD base.txz /
ADD lib32.txz /

RUN echo hi
