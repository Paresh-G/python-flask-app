FROM python:3.11-alpine
LABEL Authore="Paresh"
WORKDIR /app
COPY . /app
RUN pip install -r requirements.txt
EXPOSE 8000
ENTRYPOINT ["python"]
CMD ["src/app.py"]
