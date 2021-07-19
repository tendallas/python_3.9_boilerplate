FROM python:3.9.5

# Setup env
ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8
ENV PYTHONFAULTHANDLER 1
ENV PYTHONUNBUFFERED=1
ENV PYTHONDONTWRITEBYTECODE=1

WORKDIR /app

COPY Pip* /app/

RUN pip install --upgrade pip && \
    pip install pipenv && \
    cd /app && \
    pipenv lock && pipenv install --ignore-pipfile --system --dev --deploy

# copy project
ADD . /app

CMD python run.py
