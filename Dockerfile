# Sử dụng Python 3.12 slim
FROM python:3.12-slim

# Đặt thư mục làm việc
WORKDIR /app

# Sao chép file Pipfile và Pipfile.lock
COPY Pipfile Pipfile.lock ./

# Cài đặt pipenv và phụ thuộc
RUN pip install pipenv && pipenv install --system --deploy

# Sao chép toàn bộ mã nguồn vào container
COPY . .

# Mở cổng 8000
EXPOSE 8000

# Chạy server Django
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
