# Aplikasi Monitoring Proyek CV. TATA SAKA CONSULTANT 🚀

Aplikasi Sistem Informasi untuk tracking kinerja proyek secara detail, dibangun menggunakan Flutter PWA.

## 🛠️ Tech Stack

### Frontend
| Teknologi     | Versi  | Kegunaan                               |
| ------------  | ------ | -------------------------------------- |
| Flutter       | 3.x    | Framework utama untuk membuat PWA      |
| Provider      | 6.x    | State management                       |
| FL Chart      | latest | Grafik untuk tracking progress proyek  |
| Material Icons| latest | Library icon UI                        |

### Backend
| Teknologi    | Kegunaan                                      |
| ------------ | --------------------------------------------- |
| SQLite       | Database Relasional utama                     |
| REST API     | Jembatan antara Flutter & Database            |

## 📁 Project Structure

```
CV.TATA SAKA CONSULTANT/
├── lib/
│   ├── Frontend/
│   │   ├── providers/          
│   │   │   └── dashboard_provider.dart
│   │   └── ui/
│   │       └── pages/          # Halaman Utama
│   │           ├── login_page.dart
│   │           ├── welcome_page.dart
│   │           └── dashboard_page.dart
│   └── main.dart               # Entry point aplikasi
├── web/                        # PWA Metadata
├── .env
├── pubspec.yaml
└── README.md
```