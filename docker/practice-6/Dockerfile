# Stage 1: Build
FROM python:3.11-slim AS builder

# назначаем директорию
WORKDIR /app

# апдейт, установка необходимого, очистка кэша
RUN apt-get update && \
    apt-get install -y --no-install-recommends curl wget vim git build-essential && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# копируем список зависимостей
COPY requirements.txt .

# устанавливаем зависимости и окружение
RUN pip install --upgrade pip && \
    pip install --no-cache-dir --prefix=/dep -r requirements.txt && \
    pip install --no-cache-dir --prefix=/dep requests flask pytest black


# Stage 2: Runtime
FROM python:3.11-slim
# добавляем метаинфу, рабочую директорию, копируем зависимости и приложение
LABEL name="my_python_app" description="another py todo app" maintainer="mail@mymail.com" version="1.0.0"
WORKDIR /app
COPY --from=builder /dep /usr/local
COPY . .

# создаём пользователя, даём ему права на рабочую директорию и переключаемся на него
RUN useradd -m appuser && chown -R appuser /app
USER appuser

# переменные
ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    PATH="/home/appuser/.local/bin:${PATH}"

# документируем порты
EXPOSE 8080

# запускаем
CMD ["python", "app.py"]

# добавим healthcheck
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s \
  CMD python -c "import urllib.request; urllib.request.urlopen('http://localhost:8080')" || exit 1