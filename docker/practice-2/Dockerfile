FROM cr.yandex/mirror/python:3.11-slim
WORKDIR /app
ENV REGISTRY="Yandex Mirror"
COPY app.py .
RUN adduser -u 1001 appuser
USER 1001
EXPOSE 8080
CMD ["python", "app.py"]