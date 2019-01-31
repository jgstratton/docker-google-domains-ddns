FROM alpine:3.9

RUN apk add --no-cache bash
RUN apk add --no-cache curl

# Add dynamic dns script
ADD google-domains-ddns.sh /root/google-domains-ddns/google-domains-ddns.sh
RUN chmod +x /root/google-domains-ddns/google-domains-ddns.sh

# Create template config file
ADD google-domains-ddns.conf /root/google-domains-ddns/google-domains-ddns.conf

# Create actual config file
ADD private.conf /config/google-domains-ddns.conf

CMD /root/google-domains-ddns/google-domains-ddns.sh
