FROM python:3.10.11-slim-bullseye

COPY requirements.txt .

RUN python -m pip install -r requirements.txt

COPY . /src

WORKDIR /src

ENV FLASK_APP=src/__init__
ENV JWT_SECRET_KEY: "237123387258913088129406613799583093374"

RUN flask db init
RUN flask db migrate
RUN flask db upgrade

CMD flask run -h 0.0.0.0 -p $PORT