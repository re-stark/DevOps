# собираем образ пайтон
FROM python:3.11-slim
# вешаем метаинфу
LABEL maintainer="re-stark" \
      description="another python app" \
      version="1.0.0"
# задаём рабочую директорию
WORKDIR /app
# объявляем переменные
ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    APP_VERSION=1.0.0 \
    ENVIRONMENT=env/prod \
    STUDENT_NAME=Anton_Pavlovich
# копируем файл зависимостей
COPY requirements.txt .
# апдейты, зависимости, чистка мусора
RUN apt-get update && apt-get install -y --no-install-recommends gcc && pip install --no-cache-dir --upgrade pip && pip install --no-cache-dir -r requirements.txt && apt-get purge -y --auto-remove gcc && apt-get clean && rm -rf /var/lib/apt/lists/*
# копируем приложение
COPY app.py .
# создаём юзера, назначаем его владельцем рабочей директории, переключаемся на него
RUN useradd -m -u 1001 appuser && chown -R appuser:appuser /app
USER 1001
# Документируем порт 8080
EXPOSE 8080
# добавляем health-check
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
    CMD python -c "import urllib.request; urllib.request.urlopen('http://localhost:8080/health')" || exit 1

# запускаем
CMD ["python", "app.py"]