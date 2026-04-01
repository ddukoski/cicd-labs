FROM ubuntu:latest

COPY ./list.sh /listingapp/app/list.sh

WORKDIR /listingapp/app

RUN chmod +x list.sh

CMD ["./list.sh"]