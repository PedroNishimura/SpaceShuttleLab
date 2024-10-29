FROM apache/airflow:2.7.2-python3.11

USER root
RUN apt-get update && apt-get install -y \
    openjdk-11-jdk \
    build-essential \
    python3-dev \
    gcc \
    libffi-dev \
    libssl-dev \
    && apt-get clean

ENV JAVA_HOME /usr/lib/jvm/java-11-openjdk-amd64/
ENV PATH $JAVA_HOME/bin:$PATH

USER airflow
RUN pip install --upgrade pip
RUN pip install --upgrade apache-airflow-providers-openlineage>=1.8.0