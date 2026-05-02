Aplikasi Sistem informasi CV.TATA SAKA CONCULTANT untuk Mentracking kinerja proyek secara detail 

## 🚀 Tech Stack

### Frontend

| Teknologi    | Versi  | Kegunaan                               |
| ------------ | ------ | -------------------------------------- |
| Flutter      | 3.x    | Framework utama untuk membuat PWA      |
| Riverpod     | 2.x    | State management                       |
| FL Chart     | latest | grafik untuk tracking progress proyek  |
| Lucide Icons | latest | Library icon UI                        |

### Backend

| Teknologi               | Kegunaan                                                                   |
| ----------------------- | -------------------------------------------------------------------------- |
| Firebase Firestore      | Database utama                                                             |
| Firebase Authentication | Autentikasi pengguna (register & login)                                    |

### Data & Tools

| Tools                 | Kegunaan                     |
| --------------------- | ---------------------------- |
| Git + GitHub          | Version control & kolaborasi |
| VS Code + Flutter SDK | IDE                          |


## 📁 Project Structure

```
Cv.TATA SAKA CONSULTANT/
├── frontend/
│   ├── src/
│   │   ├── components/
│   │   │   ├── LoginPage.dart          # Login Page
│   │   │   ├── Dashboard.dart          # Statistics & progress bar
│   │   ├── context/
│   │   │   └── context.dart            # Global state management
│   │   ├── utils/
│   │   │   ├── constants.dart          # Categories, priorities, & colors
│   │   │   └── theme.dart              # Global styles & animations
│   │   ├── app.dart                    # Main MaterialApp configuration
│   │   └── main.dart                   # Entry point aplikasi
│   ├── web/                            # PWA specific files
│   │   ├── index.html                  # Web entry point
│   │   └── manifest.json               # PWA metadata (icons, colors, display)
├── pubspec.yaml                        # Dependency management (Riverpod, Firebase)
└── analysis_options.yaml               # Linting rules for clean code
