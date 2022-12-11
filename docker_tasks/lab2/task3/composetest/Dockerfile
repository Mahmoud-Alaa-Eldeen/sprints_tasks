# syntax=docker/dockerfile:1
FROM python:3.8-alpine3.17
WORKDIR /code
ENV FLASK_APP=app.py
ENV FLASK_RUN_HOST=0.0.0.0
RUN rm -rf /var/cache/apk/* && \
    rm -rf /tmp/*
RUN apk update 
RUN apk add python3-dev gcc libc-dev libffi-dev

RUN apk add --no-cache gcc musl-dev linux-headers
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt
EXPOSE 5000
COPY . .
CMD ["flask", "run"]