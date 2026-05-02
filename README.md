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

Cv.TATA SAKA CONSULTANT/
├── lib/
│   ├── models/                      # DEFENSIVE: Skema data (Project, Task, User)
│   │   └── project_model.dart
│   ├── providers/                   # AUTOMATA: State management
│   │   ├── auth_provider.dart
│   │   └── project_provider.dart
│   ├── ui/                          # Folder utama untuk tampilan
│   │   ├── screens/                 # Halaman utama
│   │   │   ├── login_page.dart
│   │   │   └── dashboard_page.dart
│   │   └── widgets/                 # Komponen kecil (Reusable)
│   │       ├── project_card.dart
│   │       └── progress_chart.dart
│   ├── utils/
│   │   ├── constants.dart           # Warna brand perusahaan & konstanta
│   │   └── theme.dart
│   ├── app.dart
│   └── main.dart
├── web/                             # PWA Metadata
│   ├── index.html
│   └── manifest.json
├── pubspec.yaml
└── analysis_options.yaml
