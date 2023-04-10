FROM python:3.9
WORKDIR /tg_bot
COPY build_app /tg_bot
RUN pip install -r requirements.txt
CMD ["python", "app.py"]
