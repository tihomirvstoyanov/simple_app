FROM tihomirvstoyanov/initial_registry:0.1

WORKDIR /app

COPY src/ .

RUN pip install --no-cache-dir -r requirements.txt

EXPOSE 3000

CMD ["python", "app.py"]
