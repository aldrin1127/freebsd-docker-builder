FROM scratch

ADD base.txz /
ADD lib32.txz /

RUN echo hi
