FROM python:3.10

 
# Create the home directory
ENV APP_HOME=/home/app
RUN mkdir -p $APP_HOME
WORKDIR $APP_HOME
# 

# install
COPY . $APP_HOME
RUN pip install --no-cache-dir --upgrade -r requirements.txt
RUN pip install -e .