FROM alpine:latest
RUN adduser --disabled-password mumble
COPY --chown=mumble:mumble ./murmur.ini /etc/murmur/murmur.ini
COPY --chown=mumble:mumble ./murmur.x86 /usr/bin/
# COPY --chown=mumble:mumble ./fullchain.pem ./privkey.pem /home/mumble/
USER mumble
CMD /usr/bin/murmur.x86 -fg -ini /etc/murmur/murmur.ini
