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
    - ví dụ: đếm số request API Server nhận được.
  + Gauge: giá trị hiện thời của x
    - ví dụ: trạng thái up/down, %CPU đang dùng,...
  + History (biểu đồ) : how long or how big?
    - ví dụ: request xử lý bao lâu.

### 6. Cách Prometheus thu thập số liệu từ mục tiêu?
- Worker đi pull số liệu từ mục tiêu qua giao thức http/https tại địa chỉ
mà mục tiêu expose ra thường là http://địa-chỉ/metrics
- Mục tiêu phải expose metric thông qua địa chỉ cụ thể.
- Dạng metric expose ra phải đúng với format của Prometheus.
#### 6.1 Target Endpoint and Exporter
- có 3 dạng target:
1. Target hỗ trợ native cho prometheus
   - ta không cần làm gì cả. ví dụ: Grafana, Ansibe-Tower,...

2. Target không hỗ trợ native
   - dùng exporter (scripts, service)
   - exporter sẽ làm công việc:
     + đi lấy dữ liệu từ target.
     + convert data.
     + expose metric.
   - có 1 danh sách export được hỗ trợ có thể tìm thấy trên trang chủ, github.
   - Ví dụ: Các bước monitor server linux
     + download a node exporter
     + untar and execute
     + convert metrics of server
     + expose /metrics endpoint
     + config prometheus to scrape this endpoint

   - ví dụ: monitor mongodb deploy in k8s
     + exporter hỗ trợ mogodb được đóng gói thành image container
     + triển khai exporter đó.
     + config prometheus thu thập metrics từ endpoint này (tự động thông qua service monitor).
     
   - ví dụ: monitor app bitnami/wordpress deploy in k8s
     + exporter hỗ trợ được đóng gói thành image container.
     + triển khai exporter dạng sidecard/helper container bên trong pod wordpress.
     + config prometheus thu thập metrics từ endpoint này (tự động thông qua service monitor).

3. Monitor your own application
   - sử dụng client libraries.

### 7. Cơ chế Pull của Prometheus
- khác với một số hệ thống khác sử dụng cơ chế push như AWS Cloud Watch, Solarwind có thể gặp một số vấn đề:
 + high load for network traffic.
 + có thể trở thành một điểm thắc cổ chai (bottleneck) trong hệ thống.
 + install additional software or tool to push metrics.
- more advantages:
 + multiple instance Prometheus can pull metrics.
 + better dectecion/insight if service is up and running.

### 8. Configuing Prometheus
- Cấu hình monitor target nào.
- Cấu hình thời gian (interval) lấy dữ liệu.
- Cấu hình rule, ví dụ rule cảnh bảo.

### 9. Alert Manager - Triggering alerts
- Alert Manager chịu trách nhiệm nhận các cảnh bảo từ Server Prometheus
- Notify via channel like email, slack,...

### 10. Prometheus Data Storage - Where does Prometheus store the data?
- Prometheus store data in local disk (hdd/ssd) of node.
- support config remote storage.

### 11. My Experience (khi play với Prometheus)
- Learning PromQL.
- Config Yaml file Prometheus.
- Creating Dashboard.

### 12. Prometheus Monitoring with Docker and Kubernetes
- full compatible.
- Prometheus components are avaible as Docker images.
- can easily deploy in Container Environments like k8s.
- Monitoring of k8s Cluster Node Resource out-of-the box!   