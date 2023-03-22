FROM node:14.17.6 AS node
WORKDIR /app
COPY ./frontend/package.json ./
RUN npm install
COPY . .
FROM python:3.9-alpine
WORKDIR /app
COPY requirements.txt ./
RUN pip install -r requirements.txt
COPY --from=node /app /app
COPY . .
EXPOSE 8000
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
