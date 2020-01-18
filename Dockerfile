FROM python:3.8-alpine3.11
LABEL JL Renaudon jl062705@sfr.fr

ENV PYTHONUNBUFFERED 1

COPY ./requirements.txt /requirements.txt
RUN apk add --update --no-cache postgresql-client
RUN apk add --update --no-cache --virtual .tmp-build-deps \
    gcc libc-dev linux-headers postgresql-dev
RUN pip install -r requirements.txt
RUN apk del .tmp-build-deps

RUN mkdir ./app
WORKDIR /app
COPY ./app /app

RUN adduser -D user
USER user
CMD gunicorn --bind 0.0.0.0:$PORT wsgi