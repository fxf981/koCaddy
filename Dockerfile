FROM alpine:edge

ARG AUUID="d8b6af50-11dd-46ae-b598-6701778ce6b3"
ARG CADDYIndexPage="https://github.com/cristianCeamatu/microverse-HTML-CSS-capstone-project-online-shop-for-electronics/archive/master.zip"
ARG ParameterSSENCYPT="aes-128-gcm"
ARG PORT=8080



ADD xr /xr
ADD geoip.dat /geoip.dat
ADD geosite.dat /geosite.dat
ADD etc/Caddyfile /tmp/Caddyfile
ADD etc/xcfg.json /tmp/xcfg.json
ADD deploy.sh /deploy.sh
ADD start.sh /start.sh

RUN apk update && \
    apk add --no-cache ca-certificates bash caddy tor wget unzip && \
    bash /deploy.sh

RUN chmod +x /start.sh

CMD /start.sh