# E-Commerce Mobile App & Node.js Backend

A cross-platform mobile e-commerce prototype built with Flutter, using BLoC state management and connected to a custom Node.js/Express REST API.

## Features
- **User Authentication:** Login and Sign Up with JWT token-based authentication.
- **Product Catalog & Home Screen:** Reactive UI rendering product lists fetched from the backend.
- **Cart Management:** Real-time item addition, removal, and live price/quantity calculation using BLoC.
- **RESTful API:** Node.js server handling auth, product routes, and cart logic.

## Tech Stack
- **Mobile:** Flutter, Dart, Flutter BLoC Pattern
- **Backend:** Node.js, Express.js, JWT Authentication
- **Tools:** Postman (API Testing), Git

## Getting Started

### Prerequisites
- Flutter SDK installed
- Node.js (v18+ recommended) installed

### Backend Setup
1. `cd backend`
2. `npm install`
3. `npm start` (Runs server on `http://localhost:5000`)

### Mobile Setup
1. `cd mobile`
2. `flutter pub get`
3. `flutter run`
