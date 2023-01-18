
FROM ghcr.io/praekeltfoundation/python-base-nw:3.10-bullseye

RUN apt-get update && apt-get -y install cron

COPY crontab.txt /etc/cron.d/crontab.txt

RUN chmod 0644 /etc/cron.d/crontab.txt

RUN crontab /etc/cron.d/crontab.txt

COPY . /app

WORKDIR /app

RUN pip install -r requirements.txt

CMD /usr/local/bin/python -u rapidpro_to_bigquery.py