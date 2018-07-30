FROM ubuntu

MAINTAINER leo424yy

RUN \
  apt-get update -qq && \
  apt-get install -y \
  ruby

RUN gem install wikipedia-client

RUN mkdir data
COPY wiki_save.rb wiki_save.rb
COPY result.sh result.sh
COPY index_720.txt index_720.txt

RUN bash -c 'time ruby wiki_save.rb'
RUN bash -c 'time bash -x result.sh'
