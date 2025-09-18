# job_listing_app

A Flutter app that displays job listings with favorites functionality, built with clean architecture and BLoC.

## Setup Instructions

### Prerequisites
- Flutter SDK (>=3.0.0)
- Dart SDK (>=3.0.0)
- VS Code
- Android Emulator

### Installation Steps
1. **Clone the repository**
   ```bash
   git clone https://github.com/Lahiru-Ima/mini-job-listing-app.git
   cd mini-job-listing-app
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Configure Environment Variables**
   - Create a .env file in the root directory of the project
   - Add your API configuration
   - Replace {your-project-secret} with your actual MockAPI project URL


4. **Run the app**
   ```bash
   flutter run
   ```

## Architecture

### Clean Architecture

This app implements **Clean Architecture** with **BLoC (Business Logic Component)** state management pattern.

#### Why Clean Architecture?
- **Separation of Concerns**: Clear separation between UI, business logic, and data
- **Testability**: Each layer can be independently tested
- **Maintainability**: Easy to modify without affecting other layers
- **Scalability**: Simple to add new features and functionality

#### Architecture Layers:

1. **Presentation Layer** (`lib/src/features/job/presentation/`)
   - Pages (Job listing, Job details, Favorite jobs)
   - Widgets (Job cards, UI components)
   - BLoC (State management and business logic)

2. **Domain Layer** (`lib/src/features/job/domain/`)
   - Entities (Job data models)
   - Use Cases (Get jobs, search jobs)
   - Repository interfaces (Contracts for data layer)

3. **Data Layer** (`lib/src/features/job/data/`)
   - Repository implementations
   - Data sources (Remote API, Local storage)
   - Models (Data transformation)

4. **Core Layer** (`lib/src/core/`)
   - Dependency injection (GetIt)
   - Network configuration
   - Common utilities and enums

## State Management

### BLoC Pattern Implementation

**Why BLoC?**
- **Predictable State Management**: Clear state transitions and data flow
- **Reactive Programming**: UI automatically updates when state changes
- **Separation of Business Logic**: Logic is separated from UI components
- **Flutter Recommended**: Official recommendation for complex apps
- **Testable**: Easy to unit test business logic

## Project Structure

```
lib/
├── src/
│   ├── core/                    # Shared utilities
│   │   ├── di/                  # Dependency Injection (GetIt)
│   │   ├── network/             # HTTP client configuration
│   │   ├── config/              # Environment configuration
│   │   ├── enums/               # App-wide enums
│   │   └── errors/              # Error handling
│   │
│   ├── features/
│   │   └── job/                 # Job feature module
│   │       ├── presentation/    # UI Layer
│   │       │   ├── pages/       # Screen pages
│   │       │   ├── widgets/     # Reusable components
│   │       │   └── bloc/        # State management
│   │       │
│   │       ├── domain/          # Business Logic
│   │       │   ├── entities/    # Data models
│   │       │   ├── repositories/# Data contracts
│   │       │   └── usecases/    # Business operations
│   │       │
│   │       └── data/            # Data Layer
│   │           ├── models/      # API data models
│   │           ├── repositories/# Repository implementations
│   │           └── datasources/ # API & local data sources
│   │
│   └── shared/                  # Shared UI components
│       └── theme/               # Theme management
```

### Time Taken
**Total Development Time: 4.5 hours**


