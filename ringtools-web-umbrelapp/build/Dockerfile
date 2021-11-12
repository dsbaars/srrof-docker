FROM node:16-buster-slim AS webbuilder
WORKDIR /app
COPY /srrof-ringtools-web /app
RUN yarn global add @angular/cli
RUN yarn install --dev
RUN yarn build

FROM python:3.10.0-slim-buster

WORKDIR /code
RUN apt-get update
RUN apt-get install -y git python3 build-essential g++ gcc musl-dev libffi-dev

RUN python -m pip install --upgrade pip
COPY /srrof-lnd-pubsub-python /code
COPY --from=webbuilder /app/dist/RoFweb /code/app/static

RUN pip install -r requirements.txt
EXPOSE 5000

CMD [ "python", "app/main.py" ]