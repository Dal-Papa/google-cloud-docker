FROM debian:bullseye-slim
LABEL maintainer="Dal-Papa"

RUN apt update && apt upgrade --yes && apt install curl --yes
RUN curl -L "https://firebase.tools/bin/linux/v12.5.4" -o /usr/bin/firebase && chmod +x /usr/bin/firebase

COPY start-firebase.sh .
RUN chmod +x start-firebase.sh

COPY firebase.json /

EXPOSE 9099 4000

ENTRYPOINT ["./start-firebase.sh"]