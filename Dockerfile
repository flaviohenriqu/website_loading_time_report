FROM python:3.10-slim-buster

WORKDIR /app

COPY pyproject.toml poetry.lock /app/

RUN pip install --no-cache-dir poetry && \
    poetry config virtualenvs.create false && \
    poetry install --no-dev --no-interaction --no-ansi

COPY . /app

EXPOSE 8080

CMD ["python", "app.py"]
