
# Use an official Python runtime as a parent image
FROM python:3.9.16-alpine

#maintainer_name
LABEL maintainer_name="SanjayDas"

# Set the working directory to /app
WORKDIR /app

# Copy the requirements.txt contents into the container at /app
COPY requirements.txt /app

# Install any needed packages specified in requirements.txt
RUN pip install -r requirements.txt

# Copy the current directory contents into the container at /app
COPY . /app

# Expose the port the app will run on
EXPOSE 8000

# Start the application
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
