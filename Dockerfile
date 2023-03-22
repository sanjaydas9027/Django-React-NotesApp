FROM node:14-alpine as build-react
WORKDIR /app/frontend
COPY ./frontend/package.json ./
RUN npm install
COPY . .

FROM python:3.9-alpine as build-django
WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
COPY . .

EXPOSE 8000
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
