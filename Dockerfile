FROM alpine:3.21

ARG MINUTE=0
ARG HOUR=6
ARG DAY_OF_MONTH=*
ARG MONTH=*
ARG DAY_OF_WEEK=*
ARG TZ=Etc/UTC
ARG FETCH_SIZE=7

RUN apk add xmltv perl-json tzdata curl --no-cache
RUN mkdir /etc/cron && \
    echo "${MINUTE} ${HOUR} ${DAY_OF_MONTH} ${MONTH} ${DAY_OF_WEEK} run-parts /etc/periodic/daily" > /etc/cron/crontab && \
    echo "" >> /etc/cron/crontab && \
    crontab /etc/cron/crontab
COPY --chmod=755 xmltv.sh /etc/periodic/daily/
RUN ln -s /usr/share/zoneinfo/${TZ} /etc/localtime
RUN mkdir /root/.xmltv

VOLUME /root/.xmltv

ENTRYPOINT ["crond", "-f"]
