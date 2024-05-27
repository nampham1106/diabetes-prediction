FROM python:3.10-slim

RUN apt update && apt install -y default-jdk

WORKDIR /app
COPY . .
RUN python -m pip install --upgrade pip
RUN pip install --no-cache-dir --upgrade -r requirements.txt
RUN echo 'export PATH="/root/.local/bin:$PATH"' >> /root/.bashrc

CMD ["uvicorn", "--host", "0.0.0.0", "--port", "7860", "--app-dir=api", "--reload", "--reload-dir", "api", "main:app"]