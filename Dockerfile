FROM python:3.11

# Install system dependencies, including Rust
RUN apt-get update && \
    apt-get install -y default-libmysqlclient-dev curl && \
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y && \
    export PATH="$HOME/.cargo/bin:$PATH" && \
    rustup default stable

# Set environment variables for mysqlclient
ENV MYSQLCLIENT_CFLAGS="-I/usr/local/mysql/include"
ENV MYSQLCLIENT_LDFLAGS="-L/usr/local/mysql/lib"

# Set up your application
WORKDIR /app
COPY . /app/
RUN pip install --no-cache-dir -r requirements.txt
