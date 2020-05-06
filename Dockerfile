FROM madnight/docker-alpine-wkhtmltopdf
MAINTAINER Artem Khizhka <artem.khizhka.work@gmail.com>

ENV WORKER_CLASS sync
ENV WORKER_THREADS 1
ENV WORKERS_COUNT 1
ENV WORKER_CONNECTIONS 100
ENV WORKER_TIMEOUT 300
ENV LOG_LEVEL info

# Install dependencies for running web service
RUN apk add --update py-pip
RUN apk add --update bash
RUN apk add --update py-gevent
RUN apk add --update py-gunicorn
RUN pip install werkzeug executor gunicorn futures

ADD app.py /app.py
ADD start.sh /start.sh

EXPOSE 80

RUN chmod +x /start.sh

ENTRYPOINT ["./start.sh"]

CMD []