FROM python:3.8-alpine3.11
LABEL JL Renaudon jl062705@sfr.fr

ENV PYTHONUNBUFFERED 1

COPY ./requirements.txt /requirements.txt
RUN pip install -r requirements.txt

RUN mkdir ./app
WORKDIR /app
COPY ./app /app

RUN adduser -D user
USER user
