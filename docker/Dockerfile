FROM python:3.11-slim
RUN apt-get update && apt-get install git -y \
    locales
RUN sed -i -e 's/# ru_RU.UTF-8 UTF-8/ru_RU.UTF-8 UTF-8/' /etc/locale.gen && \
    locale-gen
RUN pip install --no-cache-dir pyTelegramBotAPI python-dotenv
WORKDIR /app
RUN git clone https://github.com/ivshkvs/graduate.git
CMD ["python3", "./graduate/chatbot/app.py"]
