FROM alpine:latest
RUN adduser --disabled-password mumble

COPY --chown=mumble:mumble ./murmur.ini /etc/murmur/murmur.ini
COPY --chown=mumble:mumble ./murmur.x86 /usr/bin/

# Create certs directory to mount certs in as secret
RUN mkdir /etc/murmur/certs && chown -R mumble:mumble /etc/murmur/certs

USER mumble
CMD /usr/bin/murmur.x86 -fg -ini /etc/murmur/murmur.ini
