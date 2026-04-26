# 🚀 Insurance Management System

A **full-stack web-based Insurance Management System** built using **Spring Boot (Java)** that automates policy management, user interactions, and claim processing with **role-based access control**.

---

## 📌 Overview

The Insurance Management System is designed to simplify and digitize insurance operations. It provides a centralized platform where:

* **Users** can browse policies, purchase them, and raise claims
* **Admins** can manage policies and approve/reject claims

The system follows **MVC architecture** and ensures **data integrity, security, and usability**.

---

## 🎯 Features

### 👤 User Features

* Register & Login
* View available policies
* Buy policies
* View purchased policies
* Raise claims
* Track claim status

### 🛠️ Admin Features

* Add new policies
* Delete policies (with safety checks)
* View all claims
* Approve / Reject claims

### 🔐 System Features

* Role-based access control (Admin/User)
* Session-based authentication
* Prevent duplicate policy purchase
* Prevent deletion of policies in use
* Clean and responsive UI

---

## 🧱 Tech Stack

### Backend

* Java
* Spring Boot
* Spring MVC
* Spring Data JPA (Hibernate)

### Frontend

* JSP
* HTML, CSS
* Bootstrap

### Database

* MySQL

### Tools

* Maven
* Eclipse / IntelliJ IDEA
* Git & GitHub

---

## 🏗️ Project Structure

```
insurance-management-system/
│
├── controller/        # Controllers (Request Handling)
├── model/             # Entity Classes (User, Policy, Subscription, Claim)
├── dao/               # Repository Interfaces
├── service/           # Business Logic (if implemented)
├── resources/
│   ├── templates/     # JSP Pages
│   └── application.properties
└── pom.xml
```

---

## ⚙️ Installation & Setup

### 🔧 Prerequisites

* Java 8+
* Maven
* MySQL
* IDE (Eclipse / IntelliJ)

---

### 🛠️ Steps

1. **Clone the repository**

```bash
git clone https://github.com/your-username/insurance-management-system.git
cd insurance-management-system
```

2. **Configure database**

Create database:

```sql
CREATE DATABASE insurance_db;
```

Update `application.properties`:

```properties
spring.datasource.url=jdbc:mysql://localhost:3306/insurance_db
spring.datasource.username=your_username
spring.datasource.password=your_password
spring.jpa.hibernate.ddl-auto=update
```

---

3. **Run the project**

```bash
mvn spring-boot:run
```

---

4. **Open in browser**

```
http://localhost:8080
```

---

## 🔑 Default Roles

| Role  | Access                         |
| ----- | ------------------------------ |
| USER  | Buy policies, raise claims     |
| ADMIN | Manage policies, handle claims |

---

## 🧠 System Workflow

1. User registers and logs in
2. Views available policies
3. Purchases a policy
4. Raises a claim
5. Admin reviews and approves/rejects claim

---

## 🗃️ Database Design

### Entities:

* **User**
* **Policy**
* **Subscription**
* **Claim**

### Relationships:

* User → Subscription (1:M)
* Policy → Subscription (1:M)
* User → Claim (1:M)
* Policy → Claim (1:M)

---

## 🧪 Testing Highlights

* Login validation (valid/invalid)
* Duplicate policy purchase prevention
* Claim submission & tracking
* Role-based access validation
* Policy deletion safety check

---

## ⚠️ Limitations

* No payment gateway integration
* Basic authentication (no encryption)
* No email notifications
* Limited UI customization

---

## 🚀 Future Enhancements

* Spring Security integration (JWT/Auth)
* Payment gateway integration
* Email & notification system
* Advanced UI (React / Angular)
* Search & filtering
* Admin analytics dashboard
* Cloud deployment (AWS/Azure)

---

## 📸 Screenshots (Add in repo)

* Login Page
* Dashboard
* Policy List
* My Policies
* Claim Page

---

## 🤝 Contributing

Contributions are welcome!

1. Fork the repo
2. Create a branch (`feature/your-feature`)
3. Commit changes
4. Push to branch
5. Open a Pull Request

---

## 📚 References

* Spring Boot Documentation
* Oracle Java Docs
* MySQL Docs
* Bootstrap Docs

---

## 📄 License

This project is developed for **academic purposes**.

---

## 👨‍💻 Author

**Drishay Chauhan**

---

## ⭐ Acknowledgment

Thanks to mentors and resources that guided the development of this project.

---

## 💬 Final Note

This project demonstrates a **complete real-world workflow** of an insurance system and serves as a strong foundation for scalable enterprise applications.

---

### 🔥 If you like this project, give it a star ⭐
