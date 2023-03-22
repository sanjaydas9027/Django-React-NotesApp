# Stage 1:  React 
FROM node:14-alpine as build-react
WORKDIR /app/frontend
COPY ./frontend/package.json ./
RUN npm install

# Stage 2: Django 
FROM python:3.9-alpine as build-django
WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
COPY . .
COPY --from=build-react /app/frontend/ ./frontend/build
EXPOSE 8000
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
