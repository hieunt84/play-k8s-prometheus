# play-k8s-prometheus
### Ref
```
-https://www.youtube.com/watch?v=h4Sl21AKiDg
-Part1: https://www.youtube.com/watch?v=QoDqxm7ybLc&list=PLy7NrYWoggjwPggqtFsI_zMAwvG0SqYCb&index=31
-Part2: https://www.youtube.com/watch?v=mLPg49b33sA
-https://github.com/prometheus/prometheus
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

### 4. Tính năng Prometheus
- tin cậy.
- sử dụng cơ chế pull metrics (số liệu).
- kiến trúc standalone.
- ít phức tạp, dễ dàng tiếp cận.

### 5. Cơ chế hoạt động của Prometheus, Kiến trúc Prometheus
#### 5.1 kiến trúc tổng quan
![kiến trúc tổng quan](https://github.com/hieunt84/play-k8s-prometheus/blob/master/images/kien-truc-tong-quan.png)

#### 5.2 Prometheus server
- là thành phần chính trong kiến trúc
![Prometheus server](https://github.com/hieunt84/play-k8s-prometheus/blob/master/images/prometheus-server.png)
- gồm có 3 thành nhỏ bên trong
  + Retrieval Worker: đi thu thập metrics (số liệu) từ target(mục tiêu) như   application, server, services,...
  + Storage: lưu trữ số liệu thu thập được.
  + http server: api gateway, tiếp nhận yêu cầu từ bên ngoài để truy vấn dữ liệu được lưu trữ trong storage.

#### 5.3 Target and Metrics
- Target là các mục tiêu cần giám sát ví dụ như:
  + Application như: wordpress,...
  + Service như: database,...
  + Server như: linux server, apache server,...
- Metrics các số liệu cần thu thập từ target ví dụ như:
  + Sử dụng bao nhiêu % CPU

#### 5.3 Metrics
- format mà con người có thể đọc được
- có 3 dạng:
  + Counter: đếm số lần xảy ra/ xuất hiện.
    ví dụ: đếm số request API Server nhận được.
  + Gauge: giá trị hiện thời của x
    ví dụ: trạng thái up/down, %CPU đang dùng,...
  + History (biểu đồ) : how long or how big?
    ví dụ: request xử lý bao lâu.

### 6. Cách Prometheus thu thập số liệu từ mục tiêu?
- Worker đi pull số liệu từ mục tiêu qua giao thức http/https tại địa chỉ
mà mục tiêu expose ra thường là http://địa-chỉ/metrics
- Mục tiêu phải expose metric thông qua địa chỉ cụ thể.
- Dạng metric expose ra phải đúng với format của Prometheus.
#### 6.1 Target Endpoint and Exporter
- có 3 dang target:
1. Target hỗ trợ native cho prometheus
   - ta không cần làm gì cả. ví dụ: Grafana, Ansibe-Tower,...



