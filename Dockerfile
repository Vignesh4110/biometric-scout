FROM node:20-slim as builder

WORKDIR /app

COPY frontend/package*.json ./frontend/
RUN npm --prefix frontend install

COPY frontend/ ./frontend/
RUN npm --prefix frontend run build


FROM python:3.13-slim

WORKDIR /app

RUN pip install uv

COPY requirements.txt .
RUN uv pip install --no-cache-dir --system -r requirements.txt

COPY backend/app/ .

COPY --from=builder /app/frontend/dist /frontend/dist

EXPOSE 8080

CMD ["python", "main.py"]
