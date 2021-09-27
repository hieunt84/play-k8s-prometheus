# play-k8s-prometheus
### Ref
```
-Part1: https://www.youtube.com/watch?v=QoDqxm7ybLc&list=PLy7NrYWoggjwPggqtFsI_zMAwvG0SqYCb&index=31
-Part2: https://www.youtube.com/watch?v=mLPg49b33sA
- https://github.com/prometheus/prometheus
```

### 1. Prometheus là gì?
- là công cụ giúp giám sát hệ thống.

### 2. Tại sao dùng Prometheus?
- tương thích hoàn toàn với ứng dụng micro-service,
  ứng dụng triển khai trên môi trường container như : k8s.
- miễn phí.
- dễ dàng triển khai trên môi trường container.

### 3. Dùng Prometheus khi nào và ở đâu?
- giúp xử lý các sự cố của hệ thống:
  + hệ thống bị chậm
  + hệ thống bị quá tải.
  + hệ thống bị thiếu tài nguyên.
  + hệ thống bị lỗi

- cảnh báo sớm về tình trạng hệ thống.
  + Cảnh bảo khi dung lượng ổ cứng lớn hơn 70%.

- để đảm bảo hệ thống hoạt động tin cậy, ổn định và an toàn.
- Trường hợp cụ thể dùng Prometheus:
  + Automatic Monitoring
  + là 1 phần của workflow (qui trình) DevOps.
  + Cảnh báo tự động khi hệ thống có vấn đề.

### 4. Tíng năng Prometheus
- tin cậy.
- sử dụng cơ chế pull metrics (số liệu).
- kiến trúc standalone.
- ít phức tạp, dễ dàng tiếp cận.

### 5. Cơ chế hoạt động của Prometheus, Kiến trúc Prometheus
- kiến trúc tổng quan
![kiến trúc tổng quan](https://github.com/hieunt84/play-k8s-prometheus/blob/master/images/kien-truc-tong-quan.png)

   




