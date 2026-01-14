# SYSTEM 101 - 1 : Container is Isolated

Workshop นี้มีวัตถุประสงค์เพื่อให้เข้าใจว่า **Container มี filesystem แยกจาก Host**
การแก้ไขไฟล์ภายใน container จะหายไปทันทีเมื่อ container ถูกลบ

---

## Objective

- เข้าใจ concept ของ Container Isolation
- ทดลองแก้ไขไฟล์ภายใน container โดยตรง
- เห็นผลลัพธ์เมื่อ container ถูก Stop และ Remove
- เปลี่ยนจากการใช้ `docker run` เป็น `docker-compose.yml`

---

## Step 1 : Run NGINX Container

```bash
docker run -d --name nginx-lab -p 8080:80 nginx:alpine
```

เปิด Browser:
http://localhost:8080

---

## Step 2 : เข้าไปแก้ไขไฟล์ใน Container

```bash
docker exec -it nginx-lab sh
cd /usr/share/nginx/html
echo "Hello from inside container" > index.html
```

Refresh หน้าเว็บ จะเห็นผลลัพธ์เปลี่ยนทันที

---

## Step 3 : Stop และ Remove Container

```bash
docker stop nginx-lab && docker rm nginx-lab
docker run -d --name nginx-lab -p 8080:80 nginx:alpine
```

ไฟล์จะกลับเป็นค่าเดิม

---

## TASK-01 : Docker Compose

สร้างไฟล์ `docker-compose.yml`

```yaml
version: "3.9"
services:
  nginx:
    image: nginx:alpine
    container_name: nginx-lab
    ports:
      - "8080:80"
```

```bash
docker compose up -d
docker compose down
```

---

## Conclusion

- Container เป็น Isolated
- ข้อมูลไม่ Persist หากไม่ใช้ Volume
- Docker Compose ช่วยจัดการ container เป็นระบบ
