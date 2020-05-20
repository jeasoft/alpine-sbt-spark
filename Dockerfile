FROM openjdk:8-jdk-alpine

ARG SBT_VERSION=1.3.10
ARG SPARK_VERSION=2.4.4

# Install sbt
RUN \
  apk update && apk add ca-certificates wget tar bash && \
  mkdir -p "/usr/local/sbt" && \
  mkdir -p "/usr/local/spark" && \
  wget -qO - --no-check-certificate "https://piccolo.link/sbt-$SBT_VERSION.tgz" | tar xz -C /usr/local/sbt --strip-components=1  && \
  wget -qO - --no-check-certificate "https://archive.apache.org/dist/spark/spark-$SPARK_VERSION/spark-$SPARK_VERSION-bin-hadoop2.7.tgz" | tar xz -C /usr/local/spark --strip-components=1  && \
  export PATH="/usr/local/sbt/bin:$PATH" \
  export PATH="/usr/local/spark/bin:$PATH" \
  sbt sbtVersion
