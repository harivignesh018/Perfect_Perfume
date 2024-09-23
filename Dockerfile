FROM python:3.11

# Install system dependencies and Rust
RUN apt-get update && \
    apt-get install -y default-libmysqlclient-dev gcc curl build-essential && \
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y && \
    export PATH="/root/.cargo/bin:${PATH}" && \
    rustup default stable

# Set up your application
WORKDIR /app
COPY . /app/

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt
