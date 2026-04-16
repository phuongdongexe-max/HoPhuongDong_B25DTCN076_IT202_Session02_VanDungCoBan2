CREATE TABLE CUSTOMERS (
    CustomerID INT PRIMARY KEY,
    FullName VARCHAR(100),
    Email VARCHAR(100),
    Age INT             
);

-- Thiếu NOT NULL cho cột Email: Trong nghiệp vụ gửi email, Email là thông tin bắt buộc. Việc để mặc định (cho phép NULL) khiến hệ thống dễ lỗi do có thể lấy thông tin trống.
-- Thiếu CHECK constraint cho cột Age: Kiểu INT cho phép lưu cả số âm (lên đến -2 tỷ). Việc khách hàng nhập tuổi là -5 mà database vẫn nhận là do thiếu quy tắc kiểm tra tính logic của dữ liệu.
-- 1. Ép cột Email không được để trống
ALTER TABLE CUSTOMERS MODIFY Email VARCHAR(100) NOT NULL;

-- 2. Thêm ràng buộc kiểm tra tuổi phải lớn hơn 0 và nhỏ hơn (ví dụ) 150
ALTER TABLE CUSTOMERS ADD CONSTRAINT Check_Age CHECK (Age > 0 AND Age < 150);

-- 3. Nên để FullName là NOT NULL để thông tin khánh hàng ko bị để trống
ALTER TABLE CUSTOMERS MODIFY FullName VARCHAR(100) NOT NULL;
