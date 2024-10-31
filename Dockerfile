FROM scratch

ADD base.txz /
ADD lib32.txz /

CMD ["/bin/sh"]
