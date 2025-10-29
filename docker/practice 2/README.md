# Задание 2: Использование Yandex Mirror Registry

## Цель

Научиться использовать альтернативные Docker-репозитории (зеркала) вместо Docker Hub.

---

## Yandex Mirror

**URL**: `cr.yandex/mirror/`

Формат образа:
```dockerfile
FROM cr.yandex/mirror/<образ>:<тег>
```

**Примеры:**
- `cr.yandex/mirror/python:3.11-slim`
- `cr.yandex/mirror/node:18-alpine`
- `cr.yandex/mirror/nginx:alpine`
- `cr.yandex/mirror/ubuntu:22.04`

---

## Задание

Написать Dockerfile, который:
1. Использует базовый образ **из Yandex Mirror**: `cr.yandex/mirror/python:3.11-slim`
2. Устанавливает рабочую директорию `/app`
3. Устанавливает переменную окружения `REGISTRY="Yandex Mirror"`
4. Копирует `app.py`
5. Работает от пользователя `1001`
6. Открывает порт `8080`


## Выполнение

### Шаг 1: Собрать образ

### Шаг 2: Запустить контейнер 

### Шаг 3: Проверить

```bash
# Проверить логи
docker logs yandex-app

# Проверить в браузере
# http://localhost:8080

# Проверить переменную
docker exec yandex-app env | grep REGISTRY
```

---