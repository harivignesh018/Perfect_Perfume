FROM python:3.11

# Install MySQL development files
RUN apt-get update && apt-get install -y default-libmysqlclient-dev

# Set environment variables for mysqlclient
ENV MYSQLCLIENT_CFLAGS="-I/usr/local/mysql/include"
ENV MYSQLCLIENT_LDFLAGS="-L/usr/local/mysql/lib"

# Set up your application
WORKDIR /app
COPY . /app/
RUN python -m venv --copies /opt/venv && . /opt/venv/bin/activate && pip install -r requirements.txt
