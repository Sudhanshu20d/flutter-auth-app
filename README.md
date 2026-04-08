# 🔐 Flutter Auth App

A Flutter application demonstrating **Login & Signup functionality** using a dummy REST API with form validation and token storage.

---

## 🚀 Features

* Login Screen with validation
* Signup Screen with confirm password check
* Form Validation (email format, password min 6 chars)
* API Integration (Reqres dummy API)
* Loading Indicator during API calls
* Error Handling with proper messages
* Token Storage using SharedPreferences
* Navigation to Dashboard after successful login

---

## 🛠️ Tech Stack

* Flutter (latest stable)
* Dart
* HTTP package — API calls
* Shared Preferences — Token storage
* setState — State management

---

## 📡 API Used

* Base URL: https://reqres.in
* Login: `POST /api/login`
* Register: `POST /api/register`

---

## 🔑 Test Credentials

### Login
* Email: `eve.holt@reqres.in`
* Password: `cityslicka`

### Signup
* Email: `eve.holt@reqres.in`
* Password: `pistol`

---

## 📁 Project Structure
lib/
├── main.dart
├── screens/
│   ├── login_screen.dart
│   ├── signup_screen.dart
│   └── dashboard_screen.dart
├── services/
│   └── api_service.dart
└── utils/
    └── validators.dart

## ▶️ How to Run

1. Clone the repository
```bash
   git clone https://github.com/Sudhanshu20d/flutter-auth-app.git
```
2. Install dependencies
```bash
   flutter pub get
```
3. Connect device or emulator
4. Run the app
```bash
   flutter run
```

---

## ⚠️ Note

This project uses a **dummy API (Reqres)**.
User data is not stored permanently.

---

## 📱 Screens

* Login Screen
* Signup Screen
* Dashboard Screen

---

## 👨‍💻 Author

Developed by **Sudhanshu**
