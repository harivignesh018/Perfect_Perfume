# Use the official Python image
FROM python:3.11

# Install MySQL development files
RUN apt-get update && apt-get install -y default-libmysqlclient-dev

# Set up your application
WORKDIR /app
COPY . /app/

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt
