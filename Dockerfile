FROM golang AS build
ADD . /hugo
WORKDIR /hugo
RUN wget https://github.com/gohugoio/hugo/releases/download/v0.55.6/hugo_0.55.6_Linux-64bit.tar.gz && tar -zxf hugo_0.55.6_Linux-64bit.tar.gz && chmod a+x hugo
RUN mkdir /blog
RUN ./hugo -d /blog

FROM nginx:alpine
COPY --from=build /blog /usr/share/nginx/html