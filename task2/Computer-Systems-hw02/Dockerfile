# Використовуємо офіційне образ Python з Docker Hub
FROM python:3.10

# Встановлюємо змінні середовища
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Встановлюємо робочу директорію в контейнері
WORKDIR /app

# Встановлюємо залежності
COPY requirements.txt .
RUN pip install -r requirements.txt

# Копіюємо весь решту коду застосунку
COPY . .

# Встановлюємо команду для запуску застосунку
ENTRYPOINT ["python", "main.py"]