# Use the official Python image as the base
FROM python:3.9-slim

# Set the working directory in the container
WORKDIR /app

# Copy the requirements file into the container
COPY requirements.txt /app/

# Install the required Python packages
RUN pip install --no-cache-dir -r requirements.txt

# Copy the src folder and its contents into the container
COPY src/ /app/src/

# Set the entry point for the container to execute the Python script
CMD ["python", "src/joke_fetcher.py"]
