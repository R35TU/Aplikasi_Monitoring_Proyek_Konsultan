# Software Requirements Specification

## Untuk Merancang Sistem Informasi Pengelolaan Laporan CV. Tata Saka Consultant

**Versi 1.0**

Disusun oleh:
- 103122400007 – Putra Anugrah Pamungkas
- 103122400013 – Ulung Putra Sadewo
- 103122400014 – Aradea Satria Permana
- 103122400022 – Muhammad Restu Aditya

---

## Daftar Perubahan

| Revisi | Deskripsi |
|--------|-----------|
| A | |
| B | |
| C | |
| D | |

| INDEX | A | B | C | D |
|-------|---|---|---|---|
| Tanggal | | | | |
| Ditulis oleh | | | | |
| Diperiksa Oleh | | | | |
| Disetujui Oleh | | | | |

---

## Daftar Halaman Perubahan

| Revisi | Halaman | Isi Semula | Perubahan |
|--------|---------|-----------|-----------|
| A | 15 | | |

---

## Daftar Isi

1. [Pendahuluan](#1-pendahuluan)
   - 1.1 [Tujuan Penulisan Dokumen](#11-tujuan-penulisan-dokumen)
   - 1.2 [Lingkup Masalah](#12-lingkup-masalah)
   - 1.3 [Definisi, Istilah dan Singkatan](#13-definisi-istilah-dan-singkatan)
   - 1.4 [Referensi](#14-referensi)
   - 1.5 [Deskripsi Umum Dokumen (Ikhtisar)](#15-deskripsi-umum-dokumen-ikhtisar)
2. [Deskripsi Keseluruhan Sistem](#2-deskripsi-keseluruhan-sistem)
   - 2.1 [Deskripsi Umum Sistem](#21-deskripsi-umum-sistem)
   - 2.2 [Penggolongan Karakteristik Pengguna](#22-penggolongan-karakteristik-pengguna)
   - 2.3 [Lingkungan Operasi](#23-lingkungan-operasi)
   - 2.4 [Batasan Desain dan Implementasi](#24-batasan-desain-dan-implementasi)
3. [Deskripsi Kebutuhan](#3-deskripsi-kebutuhan)
   - 3.1 [Kebutuhan Antarmuka Eksternal](#31-kebutuhan-antarmuka-eksternal)
   - 3.2 [Kebutuhan Fungsional](#32-kebutuhan-fungsional)
   - 3.3 [Kebutuhan Non-Fungsional](#33-kebutuhan-non-fungsional)

---

## 1. Pendahuluan

### 1.1 Tujuan Penulisan Dokumen

CV. Tata Saka Consultant merupakan perusahaan konsultan teknik sipil yang bergerak di bidang perencanaan dan pengawasan pekerjaan konstruksi. Perusahaan ini secara rutin bekerja sama dengan instansi pemerintah, khususnya Dinas Pekerjaan Umum, dalam pelaksanaan proyek infrastruktur seperti pembangunan jalan, jembatan, dan pekerjaan sipil lainnya. Selama ini, proses pelaporan dan pengelolaan data kegiatan masih dilakukan secara manual dan tersebar di berbagai media, mulai dari dokumen fisik, perangkat pribadi, hingga file yang dipegang oleh pihak kontraktor. Kondisi ini menimbulkan berbagai permasalahan, seperti sulitnya pencarian data secara cepat ketika dibutuhkan mendesak, lemahnya posisi konsultan dalam pembuktian data di hadapan aparat penegak hukum, serta tingginya risiko ketidaksesuaian antara laporan kontraktor dan laporan konsultan akibat tidak adanya sistem pencatatan yang real-time dan terpusat.

Untuk mengatasi permasalahan tersebut, dirancang sebuah Aplikasi Pengelolaan Laporan berbasis web dan mobile yang terintegrasi. Sistem ini bertujuan untuk menyediakan platform terpusat yang memungkinkan pencatatan laporan harian secara real-time langsung dari lapangan, penyimpanan bukti dokumentasi foto, pemantauan progres proyek secara aktual, serta pengaturan hak akses berdasarkan peran masing-masing pihak yang terlibat. Melalui sistem ini, proses pengelolaan laporan proyek diharapkan menjadi lebih efisien, akurat, terstruktur, dan dapat dipertanggungjawabkan secara hukum.

Dokumen SRS ini disusun dengan tujuan untuk mendefinisikan kebutuhan sistem secara jelas, baik dari sisi perangkat lunak, perangkat keras, kebutuhan fungsional, maupun non-fungsional. Selain itu, dokumen ini menjadi acuan bagi tim pengembang dalam merancang dan membangun sistem sesuai kebutuhan, serta menjadi pedoman bagi pemangku kepentingan dan pengguna akhir dalam memahami ruang lingkup, batasan, dan manfaat yang akan dihasilkan oleh sistem.

### 1.2 Lingkup Masalah

Lingkup masalah yang ingin diselesaikan melalui Aplikasi Pengelolaan Laporan CV. Tata Saka Consultant meliputi:

1. **Manipulasi laporan harian oleh kontraktor**, di mana laporan kerap disusun secara borongan menjelang akhir proyek (di belakang meja) agar kurva S terlihat ideal, padahal tidak mencerminkan kondisi pekerjaan yang sesungguhnya di lapangan. Hal ini menyulitkan konsultan dalam melakukan evaluasi yang akurat dan berpotensi menimbulkan permasalahan hukum apabila laporan kontraktor dan laporan konsultan ditemukan tidak sesuai saat pemeriksaan oleh Aparat Penegak Hukum (APH).

2. **Sistem pengarsipan berbagai laporan kegiatan** (RAB, BQ, HPS) masih terpusat di kantor. Hal ini menyulitkan pencarian data dan membuat penyaluran informasi ke lapangan menjadi tidak efisien serta sulitnya pegawai mendapatkan data serta laporan secara instan.

3. **Keterbatasan akses data secara cepat saat dibutuhkan secara mendadak.** Berdasarkan hasil wawancara, konsultan diharuskan selalu siap memberikan informasi perkembangan proyek kapan pun, bahkan di luar jam kerja dan pada saat tidak membawa dokumen fisik. Kondisi ini pernah dialami langsung ketika Bupati secara langsung meminta pemaparan progres suatu paket pekerjaan di lapangan, sementara seluruh data tersimpan di kantor atau lokasi yang berbeda.

4. **Rendahnya keterbacaan laporan oleh pihak Dinas**, di mana laporan fisik yang telah diserahkan seringkali tidak dibaca atau dipelajari. Akibatnya, pihak Dinas cenderung menanyakan informasi progres secara lisan langsung, meskipun data tersebut sebenarnya sudah terdokumentasi dalam laporan yang telah diserahkan.

5. **Risiko hukum akibat ketiadaan bukti data yang kuat.** Berdasarkan aturan terbaru, tanggung jawab pengawasan kini sepenuhnya berada di pihak konsultan. Apabila APH menemukan ketidaksesuaian volume pekerjaan atau perubahan teknis yang telah dituangkan dalam Contract Change Order (CCO), konsultan berpotensi menghadapi tuntutan pidana jika tidak mampu menunjukkan data pendukung yang akurat dan dapat dipertanggungjawabkan.

Dengan hadirnya sistem berbasis web dan mobile ini, permasalahan-permasalahan tersebut diharapkan dapat diatasi melalui pencatatan laporan harian secara real-time, integrasi data terpusat, pengarsipan bukti dokumentasi foto, pemantauan progres yang aktual, serta penerapan hak akses berbasis peran untuk menjaga keamanan dan kerahasiaan data.

#### A. Batasan Perancangan

**1. Platform Pengembangan**

Aplikasi ini dikembangkan dalam dua platform utama, yaitu berbasis web untuk mendukung pengelolaan data dan pelaporan yang lebih komprehensif di lingkungan kantor, serta berbasis mobile untuk memudahkan pencatatan laporan harian secara langsung dari lokasi proyek. Pendekatan ini dipilih untuk memastikan aksesibilitas optimal bagi seluruh pengguna, baik yang bekerja di kantor maupun di lapangan.

**2. Fitur Utama**

- Modul penginputan laporan harian yang memungkinkan pencatatan data kegiatan lapangan secara real-time melalui perangkat mobile, disertai kemampuan unggah foto sebagai bukti pendukung kegiatan di lapangan.
- Dashboard interaktif yang menampilkan informasi progres proyek secara aktual, termasuk grafik kurva S dan rekapitulasi kemajuan pekerjaan per paket proyek.
- Sistem akses multi-pengguna dengan tingkatan hak akses yang berbeda berdasarkan peran, yaitu konsultan, kontraktor, dan dinas, guna memastikan setiap pihak hanya dapat mengakses data sesuai dengan kewenangannya.
- Kemampuan penyimpanan riwayat proyek secara lengkap dan terstruktur, mencakup kronologi seluruh kegiatan dari awal perencanaan hingga serah terima proyek, yang dapat digunakan sebagai bukti pertanggungjawaban apabila diperlukan.
- Fitur notifikasi dan penyajian informasi progres yang memungkinkan konsultan menjawab pertanyaan dari pihak Dinas maupun pejabat terkait secara cepat tanpa harus membawa dokumen fisik.

**3. Batasan Teknologi**

- **Frontend:** Menggunakan Flutter Web (PWA) untuk membangun antarmuka aplikasi yang responsif dan dapat diinstal langsung di perangkat pengguna (Progressive Web App). Flutter dipilih untuk memastikan konsistensi UI di berbagai peramban serta kemudahan pengembangan dengan satu basis kode (single codebase).
- **Backend:** Menggunakan Google Firebase sebagai infrastruktur backend-as-a-service untuk menangani autentikasi pengguna secara instan, penyimpanan data NoSQL secara real-time melalui Firestore, serta media penyimpanan file melalui Firebase Storage.

**4. Batasan Fungsionalitas**

- Pengguna hanya dapat mengakses dan mengelola data sesuai dengan hak akses peran yang ditetapkan. Kontraktor hanya dapat melihat data paket proyek yang menjadi tanggung jawabnya, sementara konsultan dan dinas memiliki akses yang lebih luas sesuai dengan kewenangannya masing-masing.
- Pihak eksternal seperti APH hanya dapat memperoleh akses atas persetujuan dan pemberian izin eksplisit dari pihak konsultan, sesuai ketentuan hukum yang berlaku.
- Sistem difokuskan pada pengelolaan laporan kegiatan pengawasan proyek secara internal dan tidak mencakup fungsi akuntansi, penggajian, maupun manajemen kontrak secara menyeluruh.
- Data laporan yang telah tersimpan dan divalidasi tidak dapat diubah secara sepihak oleh pengguna dengan hak akses terbatas, guna menjaga akurasi dan keandalan data sebagai bukti pertanggungjawaban.

#### B. Sumber Data

Dalam penyusunan dan pengembangan Aplikasi Pengelolaan Laporan CV. Tata Saka Consultant, terdapat dua kategori sumber data yang digunakan.

1. **Data Primer:** Data yang diperoleh secara langsung melalui wawancara dengan pemilik CV. Tata Saka Consultant, Bapak Wibowo Janudardono, S.T., M.T., yang dilaksanakan setiap 2/3 minggu sekali.
2. **Data Sekunder:** Data yang diperoleh dari studi literatur berupa jurnal, artikel, dan penelitian terdahulu yang relevan dengan pengelolaan laporan proyek konstruksi dan sistem informasi berbasis web. Salah satu acuan utama adalah penelitian yang dilakukan oleh Prasetyo dan Nugroho (2022) mengenai sistem informasi laporan pengawasan dan perencanaan teknis berbasis web pada CV. Tata Saka Consultant, yang diterbitkan dalam Jurnal Teknik Informatika (JUTIF).

### 1.3 Definisi, Istilah dan Singkatan

| Singkatan/Istilah | Definisi |
|---|---|
| **SRS** | Software Requirements Specification, dokumen definisi kebutuhan sistem. |
| **IEEE** | Institute of Electrical and Electronics Engineers, standar penyusunan dokumen Software Requirements Specification (SRS) agar sistematis, jelas, dan terstruktur. |
| **Super Admin** | Pengguna dengan hak akses tertinggi yang memiliki kendali penuh terhadap sistem, termasuk mengelola pengguna, hak akses, data proyek, serta konfigurasi sistem. |
| **Admin** | Pengguna yang memiliki hak akses untuk mengelola data operasional sistem, seperti input, edit, dan penghapusan data, dengan batasan tertentu sesuai kebijakan sistem. |
| **Full Access** | Hak akses penuh yang memungkinkan pengguna untuk melihat, menambah, mengubah, dan menghapus seluruh data yang tersedia dalam sistem. |
| **Limited Access** | Hak akses terbatas yang hanya mengizinkan pengguna untuk melakukan beberapa aktivitas tertentu sesuai peran yang diberikan. |
| **View-Only** | Hak akses yang hanya memungkinkan pengguna untuk melihat dan memantau data tanpa dapat melakukan perubahan apa pun, termasuk memantau progres seluruh paket proyek. |
| **CCO** | Contract Change Order, dokumen resmi yang digunakan untuk mencatat perubahan pekerjaan dalam kontrak proyek, baik dari segi volume, spesifikasi, maupun biaya. |
| **APH** | Aparat Penegak Hukum, pihak yang memiliki kewenangan dalam penegakan hukum sesuai peraturan perundang-undangan. Dalam konteks proyek, APH dapat terlibat dalam proses pengawasan, audit, atau penanganan permasalahan hukum yang berkaitan dengan pelaksanaan proyek. |
| **PHO** | Professional Hand Over, tahapan serah terima pertama pekerjaan proyek dari kontraktor kepada pihak terkait setelah pekerjaan dinyatakan selesai secara substansial. |
| **RAB** | Rencana Anggaran Biaya, dokumen perencanaan yang berisi estimasi biaya yang dibutuhkan dalam pelaksanaan suatu proyek, mencakup material, tenaga kerja, dan biaya lainnya. |
| **RBAC** | Role-Based Access Control, metode pengaturan hak akses dalam sistem berdasarkan peran pengguna, sehingga setiap pengguna hanya dapat mengakses fitur sesuai dengan tanggung jawabnya. |
| **Kurva S** | Grafik yang menunjukkan hubungan antara waktu dan progres pekerjaan proyek, biasanya digunakan untuk memantau perkembangan proyek dari awal hingga selesai. |
| **PDF** | Portable Document Format, format file digital yang digunakan untuk menyimpan dokumen secara konsisten sehingga dapat dibuka di berbagai perangkat tanpa mengubah format tampilan. |

### 1.4 Referensi

- Prasetyo dan Nugroho (2022). Sistem informasi laporan pengawasan dan perencanaan teknis berbasis web pada CV. Tata Saka Consultant. *Jurnal Teknik Informatika (JUTIF)*.
- IEEE Std 830-1998, IEEE Recommended Practice for Software Requirements Specifications.

### 1.5 Deskripsi Umum Dokumen (Ikhtisar)

Dokumen ini terdiri dari tiga bagian utama. Bagian pertama membahas pendahuluan yang mencakup tujuan, lingkup masalah, definisi istilah, dan referensi. Bagian kedua menjelaskan deskripsi keseluruhan sistem meliputi gambaran umum, karakteristik pengguna, lingkungan operasi, serta batasan desain dan implementasi. Bagian ketiga memaparkan deskripsi kebutuhan sistem secara rinci, mencakup kebutuhan antarmuka eksternal, kebutuhan fungsional beserta use case dan activity diagram, serta kebutuhan non-fungsional.

---

## 2. Deskripsi Keseluruhan Sistem

### 2.1 Deskripsi Umum Sistem

Sistem yang dikembangkan merupakan platform manajemen proyek dan pelaporan digital terintegrasi yang dirancang khusus untuk memenuhi kebutuhan operasional CV. Tata Saka Consultant. Sistem ini berfungsi sebagai portal informasi terpusat yang menghubungkan manajemen kantor dengan pengawas di lapangan, sekaligus bertindak sebagai instrumen proteksi audit bagi konsultan pengawas. Secara fundamental, sistem ini memigrasikan proses pelaporan konvensional yang sering tertunda menjadi sistem real-time berbasis mobile untuk memastikan kesesuaian antara data administratif dengan fakta aktual di lapangan. Melalui integrasi aplikasi web dan mobile, sistem ini menghilangkan kendala ketersediaan data saat terjadi kunjungan mendadak oleh pihak Dinas atau pemangku kepentingan lainnya.

Sistem ini memungkinkan pengguna untuk:

1. Memonitoring seluruh pengarsipan dokumen, laporan harian, grafik kemajuan proyek, serta laporan dari pengawas teknis di lapangan.
2. Memberikan akses multi-user dengan hak akses berbeda (Kontraktor, Client/pemilik proyek, dan APH/inspektorat) dan user (Super Admin dan Admin Lapangan di CV. Tata Saka Consultant).
3. Menghasilkan laporan harian (berupa material dan kemajuan) otomatis untuk Super Admin dan Admin Lapangan dalam bentuk tabel, serta export ke PDF.

### 2.2 Penggolongan Karakteristik Pengguna

| Pengguna | Tugas | Hak Akses |
|---|---|---|
| **Super Admin** (Internal CV. Tata Saka Consultant) | Mengelola seluruh paket proyek yang berjalan, memvalidasi laporan dari lapangan, serta mengatur izin akses bagi pihak eksternal. | Full Access |
| **Admin Lapangan/Pengawas** (Pegawai CV. Tata Saka) | Mengunggah progres harian, mengunggah bukti foto material secara langsung, serta menggunakan fitur generate laporan melalui perangkat mobile. | Limited Access |
| **Client/Pemilik Proyek** | Memantau seluruh paket proyek yang mereka danai tanpa kemampuan untuk mengubah data. | View-Only |
| **Kontraktor/Pemborong** | Memantau seluruh proyek yang mereka kerjakan sendiri tanpa kemampuan untuk mengubah data. | View-Only |
| **Aparat Penegak Hukum/Inspektorat** | Pemeriksaan audit atau hukum setiap proyek melalui perizinan Super Admin. | View-Only |

### 2.3 Lingkungan Operasi

Aplikasi dirancang agar dapat diakses secara fleksibel dan optimal di berbagai perangkat. Lingkungan operasi yang digunakan meliputi aspek perangkat keras, perangkat lunak, dan konektivitas yang mendukung kestabilan serta keamanan sistem.

#### i. Platform dan Perangkat Keras

Aplikasi dapat dijalankan pada komputer, laptop, smartphone, dan tablet dengan spesifikasi minimum sebagai berikut:

1. Sistem operasi yang didukung meliputi Windows 10 atau lebih baru, macOS High Sierra atau lebih baru, Linux distribusi terbaru, serta Android 7.0 (Nougat) atau iOS 12 ke atas.
2. Perangkat keras minimum meliputi prosesor dengan kecepatan 1.6 GHz atau lebih tinggi, RAM 2 GB atau lebih, serta ruang penyimpanan kosong minimal 100 MB untuk caching PWA pada browser.
3. Resolusi layar minimum 360 × 640 untuk perangkat mobile guna memastikan antarmuka responsif, dan minimal 1366 × 768 untuk tampilan optimal pada perangkat desktop.
4. Browser yang direkomendasikan adalah Google Chrome, Mozilla Firefox, Microsoft Edge, atau Apple Safari versi terbaru yang mendukung fitur service workers dan manifest web untuk instalasi PWA.

#### ii. Konektivitas

1. Sistem memerlukan koneksi internet yang stabil untuk sinkronisasi data secara real-time dengan database.
2. Protokol keamanan yang digunakan adalah HTTPS (SSL/TLS) yang disediakan oleh hosting untuk menjamin keamanan transmisi data antara klien dan server.
3. Sistem mendukung akses multi-user secara bersamaan dengan memanfaatkan cloud, sehingga mampu menangani banyak pengguna sekaligus tanpa penurunan performa.
4. Mekanisme caching PWA diterapkan agar aset aplikasi dapat dimuat lebih cepat, serta memungkinkan beberapa fitur dasar tetap dapat diakses meskipun internet sedang tidak stabil.

### 2.4 Batasan Desain dan Implementasi

Terdapat beberapa batasan yang harus diperhatikan agar sistem tetap berjalan dengan cepat, efisien, dan sesuai dengan aturan yang berlaku.

#### i. Batasan Teknologi

**a. Platform dan Perangkat Keras**

Aplikasi dapat digunakan di perangkat PC, Laptop, Tablet, dan Smartphone dengan spesifikasi minimum:

| Perangkat | Spesifikasi Minimum |
|---|---|
| Desktop/Laptop | Prosesor minimal Dual Core 1.6 GHz, RAM 2 GB atau lebih, ruang kosong minimal 200 MB |
| Tablet/Smartphone | Layar minimal 4.5 inci untuk pengalaman antarmuka yang nyaman, RAM 2 GB atau lebih |

Sistem operasi yang didukung:

| Platform | Sistem Operasi |
|---|---|
| Desktop/Laptop | Windows 10 atau lebih baru, macOS 10.15 atau lebih baru, Linux distribusi terbaru |
| Mobile/Tablet | Android 7.0 (Nougat) atau lebih baru, iOS 12 atau lebih baru |

Resolusi Tampilan:
- **Desktop/Laptop:** Resolusi minimum 1366 × 768.
- **Mobile/Tablet:** Antarmuka responsif berbasis Flutter Widgets yang secara otomatis menyesuaikan berbagai ukuran layar.

#### ii. Batasan Fungsionalitas

**a. Hak Akses dan Peran Pengguna**

Akses dan pengelolaan data dibatasi berdasarkan peran:

- **Administrator (Konsultan Kantor/Pusat):** Akses penuh pengelolaan keseluruhan data kegiatan, manajemen akun pengguna (men-generate akun dinas dan kontraktor), alokasi proyek, serta otorisasi final terhadap tindakan penghapusan berkas melalui persetujuan berjenjang.
- **User Lapangan (Konsultan Lapangan/Site Engineer/Inspector):** Akses monitoring progres proyek, pengisian catatan pengawasan mutu teknis dua sisi, verifikasi kehadiran berbasis lokasi, serta hak konfirmasi/validasi atas laporan harian dari pihak kontraktor.
- **Eksternal (Kontraktor):** Akses terbatas untuk menginput laporan harian fisik (volume pekerjaan dan material), mengunggah berkas gambar kerja (shop drawing), mengajukan dokumen Request of Work, serta melihat grafik ringkasan progres proyek yang sedang dikerjakannya.
- **Viewer (Dinas/Owner):** Akses baca (view-only) untuk pemantauan dasbor ringkasan kegiatan, meninjau linimasa kronologi administrasi, serta memberikan otorisasi pengesahan akhir pada laporan bulanan proyek.
- **Audit Eksternal (APH/Aparat Penegak Hukum):** Akses baca terbatas (view-only) secara spesifik hanya pada riwayat kronologi dan laporan administrasi fisik yang telah disahkan, tanpa hak mengubah data atau melihat informasi internal sensitif lainnya.

Data riwayat kegiatan atau dokumen yang telah divalidasi/dikonfirmasi oleh konsultan pengawas tidak dapat diubah atau dihapus secara sepihak oleh pengguna non-admin lapangan.

**b. Interaksi dalam Aplikasi**

- Antarmuka menyediakan dashboard ringkasan proyek (setelah pengguna memilih kegiatan spesifik), formulir input laporan pengawasan dan progres harian, linimasa (timeline) kronologi dua jalur (progres fisik lapangan dan progres administrasi kontrak), kolom notifikasi kendala lapangan, serta fitur ekspor data untuk men-generate otomatis laporan mingguan dan bulanan berbasis template.
- Alur integrasi laporan harian mengikuti skema validasi dua arah (sisi kuantitas fisik oleh kontraktor dan sisi mutu/kualitas teknis material oleh konsultan); pengiriman laporan pengawasan lapangan wajib lolos validasi kamera (selfie) dan lokasi aktif (geotagging) untuk mencegah anomali manipulasi data kurva S.
- Notifikasi sistem difokuskan pada peringatan kendala/permasalahan teknis di lapangan serta batasan waktu respons berkas administratif, di mana pengajuan Request of Work harus ditanggapi oleh konsultan maksimal dalam kurun waktu 3 hari kerja.

#### iii. Batasan Regulasi dan Kebijakan

**a. Privasi dan Kepatuhan**

1. **Penerapan Prinsip Keamanan Informasi:** Menjamin kerahasiaan, integritas, dan ketersediaan data teknis, dokumen kontrak, dokumen lelang (adset), serta rekaman kronologi fisik pengawasan milik CV. Tata Saka Consultant dan instansi dinas terkait.
2. **Audit Trail Wajib untuk Pemantauan Perubahan Data:** Mencatat secara otomatis setiap jejak aktivitas modifikasi data (siapa, kapan, apa yang diperbarui), termasuk menyimpan arsip data versi lama sebagai backup dinamis ketika terjadi proses pembaruan (update) informasi terbaru. Tindakan penghapusan berkas wajib melalui pencatatan log riwayat hapus yang transparan demi akuntabilitas hukum.
3. **Pembatasan Akses Data Lintas Dinas dan Bidang:** Pengguna hanya dapat melihat atau mengelola data proyek sesuai dengan otorisasi penugasan wilayah kerjanya. Parameter perhitungan analisis input laporan wajib dikunci terpisah mematuhi 3 rumpun regulasi AHSP Kementerian (Bina Marga untuk beton lentur jalan/jembatan, Cipta Karya untuk tekan beton gedung, dan Bidang SDA untuk pengairan) tanpa adanya pencampuran koefisien antar bidang dinas.

---

## 3. Deskripsi Kebutuhan

### 3.1 Kebutuhan Antarmuka Eksternal

#### 3.1.1 Antarmuka Pemakai

Antarmuka pengguna dirancang agar intuitif dan mudah digunakan oleh berbagai kategori pengguna. Elemen-elemen utama dalam antarmuka pengguna meliputi:

1. **Dashboard:** Menampilkan ringkasan perbandingan antara progres fisik lapangan yang riil dengan rencana kerja, serta kolom notifikasi kendala lapangan dalam bentuk grafik interaktif.
2. **Form Input Data:** Untuk pencatatan pelaporan dua sisi (volume fisik oleh kontraktor dan mutu teknis material oleh konsultan), serta form pengunggahan berkas shop drawing dan dokumen Request of Work.
3. **Tabel Data Interaktif:** Menampilkan linimasa (timeline) kronologi dua jalur paralel (progres fisik dan administrasi kontrak) lengkap dengan fitur pencarian, filter, dan ekspor data ke template laporan mingguan/bulanan.
4. **Notifikasi Sistem:** Memberikan peringatan kendala teknis di lapangan serta batas waktu respons administrasi (maksimal 3 hari kerja untuk tindak lanjut dokumen Request of Work).
5. **Desain Antarmuka:** Menggunakan kerangka kerja frontend responsif dengan tampilan sederhana, mudah dipahami, serta dilengkapi validasi berbasis geotagging dan kamera (selfie) untuk pelaporan lapangan.

#### 3.1.2 Antarmuka Perangkat Keras

Sistem ini berbasis web (PWA) dan memerlukan perangkat keras minimal sebagai berikut untuk pengalaman pengguna yang optimal:

1. Perangkat yang didukung:
   - Laptop atau komputer dengan sistem operasi Windows, macOS, atau Linux.
   - Smartphone atau tablet (Android/iOS) dengan ukuran layar minimal 4.5 inci.
   - Resolusi layar minimal 360 × 640 untuk mobile dan 1366 × 768 untuk desktop.
2. Persyaratan perangkat keras minimum:
   - Prosesor: minimal 1.6 GHz Dual-core atau setara.
   - RAM 2 GB atau lebih.
   - Kapasitas penyimpanan: minimal 100 MB ruang kosong pada memori internal untuk penyimpanan cache PWA dan data lokal.

#### 3.1.3 Antarmuka Perangkat Lunak

Untuk mengakses aplikasi berbasis web ini, diperlukan lingkungan perangkat lunak sebagai berikut:

1. Sistem operasi yang didukung:
   - Windows 10 ke atas, macOS 10.15 ke atas, atau distribusi Linux terbaru.
   - Android 7.0 (Nougat) ke atas atau iOS 12 ke atas.
2. Peramban web yang didukung:
   - Google Chrome
   - Mozilla Firefox
   - Microsoft Edge
   - Apple Safari

#### 3.1.4 Antarmuka Komunikasi

Sistem menggunakan protokol HTTPS (SSL/TLS) untuk seluruh transmisi data antara klien dan server guna menjamin keamanan pertukaran informasi.

### 3.2 Kebutuhan Fungsional

#### 3.2.1 Daftar Kebutuhan Fungsional

| No. | Kode | Kebutuhan Fungsional |
|-----|------|----------------------|
| 1 | FR-001 | Sistem memungkinkan Administrator (Konsultan Kantor) untuk membuat (generate) akun baru bagi pengguna dari pihak Dinas (Owner) dan pihak Kontraktor. |
| 2 | FR-002 | Sistem memungkinkan semua kategori pengguna untuk melakukan login ke dalam aplikasi menggunakan akun yang telah dibuat oleh Administrator. |
| 3 | FR-003 | Sistem memverifikasi validitas data login pengguna berdasarkan peran (role) dan penugasan proyek yang terdaftar. |
| 4 | FR-004 | Sistem memungkinkan pengguna untuk melakukan logout dari aplikasi. |
| 5 | FR-005 | Sistem memungkinkan pengguna untuk melakukan reset password akun mereka. |
| 6 | FR-006 | Sistem memungkinkan Administrator (Konsultan Kantor) untuk mengelola data proyek konstruksi, termasuk menambah data kegiatan baru dan melakukan pembaruan (update) informasi. |
| 7 | FR-007 | Sistem menampilkan halaman Dashboard Utama yang memuat grafik interaktif perbandingan antara progres fisik lapangan yang riil dengan rencana kerja awal setelah pengguna memilih satu kegiatan/proyek tertentu. |
| 8 | FR-008 | Sistem menampilkan notifikasi indikator kendala atau permasalahan teknis proyek secara langsung pada halaman Dashboard Utama. |
| 9 | FR-009 | Sistem menyediakan fitur input Laporan Harian dua sisi (sisi Kontraktor untuk kuantitas/volume fisik lapangan dan sisi Konsultan untuk pengawasan mutu/kualitas teknis material). |
| 10 | FR-010 | Sistem memvalidasi pengiriman laporan pengawasan lapangan dari user dengan mewajibkan verifikasi lokasi (geotagging) aktif dan pengunggahan bukti foto wajah (selfie). |
| 11 | FR-011 | Sistem menyediakan fitur bagi Kontraktor untuk mengunggah berkas gambar kerja (shop drawing) dan dokumen permohonan kerja (Request of Work). |
| 12 | FR-012 | Sistem mengirimkan notifikasi batas waktu respons kepada Konsultan untuk menindaklanjuti dokumen Request of Work dari kontraktor dalam kurun waktu maksimal 3 hari kerja. |
| 13 | FR-013 | Sistem menampilkan visualisasi Linimasa Proyek (Timeline Kronologi) dua jalur paralel, yaitu jalur Kronologi Fisik Lapangan (dimulai dari Pre-Construction Meeting) dan jalur Kronologi Administrasi Kontrak (berdasarkan hari kalender kontrak). |
| 14 | FR-014 | Sistem membatasi proses perhitungan analisis dan koefisien input laporan agar otomatis terkunci secara terpisah mematuhi rumpun regulasi kementerian (Bina Marga, Cipta Karya, atau SDA) sesuai kategori proyek yang dipilih. |
| 15 | FR-015 | Sistem memungkinkan pengguna dari pihak Dinas (Owner) untuk memberikan otorisasi digital dan pengesahan akhir pada berkas laporan bulanan proyek. |
| 16 | FR-016 | Sistem menyediakan fitur untuk men-generate otomatis akumulasi data laporan harian menjadi draf template Laporan Mingguan (progres saja) serta Laporan Bulanan lengkap dalam format Excel/Word. |
| 17 | FR-017 | Sistem melakukan pencatatan log otomatis (Audit Trail) terhadap setiap aktivitas pembaruan (update) data dan menolak perintah penghapusan berkas secara permanen dari pengguna non-admin lapangan. |
| 18 | FR-018 | Sistem memungkinkan Administrator (Konsultan Kantor) untuk mengotorisasi penghapusan berkas melalui persetujuan berjenjang serta merekam data file yang dihapus ke dalam Riwayat Aktivitas. |

#### 3.2.2 Use Case Diagram

Use case diagram menggambarkan interaksi utama antara aktor-aktor yang terlibat di dalam sistem monitoring proyek CV. Tata Saka Consultant, yaitu Konsultan, Kontraktor, Dinas, dan External (APH). Pada tahap awal, seluruh pengguna wajib melalui proses Login dengan memasukkan kredensial yang valid untuk dapat mengakses sistem. Setelah login, sistem akan menyesuaikan hak akses sesuai peran pengguna:

**a. Konsultan** memiliki akses penuh untuk melakukan:
- Pengelolaan hak akses akun
- Manajemen data proyek
- Pengurusan dokumen administrasi hukum
- Penginputan laporan pengawasan mutu
- Verifikasi berkas kontraktor
- Pembuatan rekapitulasi laporan berkala

**b. Kontraktor** memiliki akses khusus untuk:
- Menginput pencatatan volume fisik harian di lapangan
- Memantau grafik capaian kemajuan fisik pada proyek yang sedang ditangani sendiri

**c. Dinas** memiliki akses monitoring untuk:
- Meninjau dasbor perkembangan progres fisik
- Memantau sisa masa kontrak pengawasan
- Melihat keseluruhan linimasa kronologi kegiatan

**d. External (APH)** memiliki akses sangat terbatas yang hanya diizinkan untuk:
- Melihat visualisasi linimasa kronologi dokumen dan laporan fisik proyek yang telah disahkan

---

##### Hak Akses Konsultan

Konsultan memiliki kendali utama terhadap manajemen operasional pengawasan proyek di dalam sistem dengan sembilan kemampuan fungsional utama:

| Fungsi | Deskripsi |
|---|---|
| Mengelola Kelola Hak Akses | Mengizinkan pembuatan (generate), pembaruan, dan pengaturan hak akses akun pengguna dinas maupun kontraktor per proyek. |
| Mengelola Data Proyek | Menginput, memperbarui, dan mengelola paket data informasi dasar dari setiap kegiatan konstruksi terdaftar. |
| Mengelola Administrasi Proyek | Mengarsipkan dokumen kontrak, hasil pengukuran ulang (adset), notulensi rapat PCM, gambar kerja, serta penerbitan berkas administrasi seperti surat peringatan (SP). |
| Menginput Laporan Harian Pengawasan | Melakukan pencatatan harian hasil peninjauan kualitas teknis, material, dan keputusan pengawasan mutu di lapangan. |
| Memverifikasi Laporan Harian Kontraktor | Melakukan validasi dan konfirmasi persetujuan terhadap kuantitas/volume capaian fisik yang diajukan oleh kontraktor. |
| Memantau Progress Fisik | Memeriksa bagan grafik visual perbandingan antara target rencana kerja dengan realisasi volume fisik riil di lapangan. |
| Memantau Progress Pengawasan | Mengevaluasi performa jalannya masa kontrak administrasi pengawasan konsultan berdasarkan hari kalender kerja yang berjalan. |
| Membuat Rekap Laporan | Mengakumulasikan data harian secara otomatis menjadi dokumen draf laporan mingguan (progres) dan laporan bulanan format Excel/Word. |
| Melihat Kronologi Proyek | Memantau jejak rekam peristiwa proyek secara lengkap melalui visualisasi linimasa (timeline) dua jalur paralel. |

##### Hak Akses Kontraktor

Kontraktor memiliki hak akses terbatas yang difokuskan pada pelaporan performa fisik lapangan dengan tiga kemampuan fungsional utama:

| Fungsi | Deskripsi |
|---|---|
| Menginput Laporan Harian | Melakukan pencatatan dan pengiriman data harian terkait volume capaian fisik konstruksi, penggunaan material, serta tenaga kerja di lapangan. |
| Melihat Progress Fisik Proyek Sendiri | Memantau diagram grafik ringkasan kemajuan fisik khusus pada paket pekerjaan konstruksi yang sedang didelegasikan kepada mereka. |
| Login | Mengakses ruang kerja sistem menggunakan akun terverifikasi yang telah dibuat sebelumnya oleh pihak konsultan. |

##### Hak Akses Dinas

Dinas selaku owner memiliki hak akses pemantauan (monitoring) menyeluruh terhadap jalannya proyek melalui empat kemampuan fungsional utama:

| Fungsi | Deskripsi |
|---|---|
| Memantau Progress Fisik | Meninjau bagan grafik visual interaktif yang membandingkan target rencana dengan realisasi fisik riil di lapangan. |
| Memantau Progress Pengawasan | Memeriksa data evaluasi jalannya durasi kontrak pengawasan administrasi konsultan berdasarkan sisa hari kalender. |
| Melihat Kronologi Proyek | Mengakses visualisasi linimasa (timeline) untuk melihat seluruh rekam jejak peristiwa, perubahan volume, dan surat-surat administratif proyek. |
| Login | Masuk ke dalam sistem monitoring menggunakan kredensial khusus dinas untuk memberikan otorisasi pengesahan akhir berkas laporan. |

##### Hak Akses External (APH)

External (Aparat Penegak Hukum) memiliki tingkat akses paling ketat yang bersifat pasif dengan dua kemampuan fungsional utama:

| Fungsi | Deskripsi |
|---|---|
| Melihat Kronologi Proyek | Membaca (view-only) berkas riwayat dan linimasa kronologi administrasi fisik yang telah disahkan demi kebutuhan transparansi hukum. |
| Login | Mengautentikasi akun terbatas masuk ke dalam sistem sesuai batas wilayah pengawasan yang ditentukan. |

#### 3.2.3 Use Case Scenario

*(Terdapat pada Use Case Diagram — Bagian 3.2.2)*

#### 3.2.4 Activity Diagram

##### A. Login

**Tahapan Proses Login:**

1. **Inisiasi:** Proses dimulai oleh sistem yang bertugas menampilkan Form Login di layar.
2. **Input Kredensial:** Pengguna mengisi Form Login menggunakan data akun mereka.
3. **Proses Validasi:** Data yang dimasukkan pengguna dikirim kembali ke sistem untuk tahap Validasi Akun.
4. **Skenario Gagal:** Jika data akun yang dimasukkan tidak valid, sistem akan menampilkan kembali form login kepada pengguna.
5. **Skenario Berhasil:** Jika data akun terbukti valid, pengguna berhasil masuk sebagai role yang telah ditentukan di dalam aplikasi.
6. **Selesai:** Proses login berakhir dan pengguna dapat mulai menggunakan fitur-fitur portal monitoring sesuai dengan peran atau jabatannya.

---

##### B. Melihat Kronologi Proyek

**Tahapan Proses Melihat Kronologi Proyek:**

1. **Akses Menu (User):** Alur dimulai saat pengguna memilih menu kronologi proyek pada antarmuka aplikasi.
2. **Menyajikan Data (Sistem):** Sistem merespons aksi tersebut dengan mengambil data dan menampilkan Daftar Proyek yang ada.
3. **Pilih Proyek (User):** Dari daftar yang disajikan, pengguna memilih proyek spesifik yang ingin ditinjau riwayat pengerjaannya.
4. **Menampilkan Riwayat (Sistem):** Setelah proyek dipilih, sistem menampilkan kronologi proyek, yang umumnya berisi urutan waktu, tahapan, atau status pembaruan proyek tersebut.
5. **Pilih Item Riwayat (User):** Jika pengguna ingin melihat informasi yang lebih spesifik, pengguna memilih item kronologi tertentu dari daftar riwayat tersebut.
6. **Menampilkan Detail Selesai (Sistem):** Terakhir, sistem akan menampilkan Detail Informasi mengenai item yang dipilih tersebut secara lengkap, dan proses pada aktivitas ini pun berakhir.

---

##### C. Melihat Progres Fisik Proyek Sendiri

**Tahapan Proses Melihat Progres Proyek:**

1. **Awal Proses (System):** Alur dimulai dari sistem yang secara otomatis menampilkan Dashboard Utama ketika kontraktor berhasil masuk ke dalam aplikasi.
2. **Akses Fitur (Kontraktor):** Melalui dashboard tersebut, kontraktor berinteraksi dengan memilih Fitur Lihat Progres.
3. **Menyajikan Data (System):** Sistem memproses permintaan tersebut dan merespons dengan menampilkan semua list proyek yang dikerjakan yang secara spesifik ditugaskan kepada kontraktor yang bersangkutan.
4. **Pilih Proyek Spesifik (Kontraktor):** Dari daftar proyek yang muncul, kontraktor kemudian memilih salah satu proyek yang ingin ditinjau kemajuannya.
5. **Menampilkan Hasil (System):** Terakhir, sistem memuat data dan menampilkan Detail Proyek, yang berisi informasi lengkap mengenai progres fisik proyek yang telah dipilih. Proses pada aktivitas ini pun selesai.

---

##### D. Memantau Progress Fisik

**Tahapan Proses Memantau Progres Fisik:**

1. **Awal Proses (Sistem):** Alur tidak dimulai dari pengguna, melainkan dari sistem yang sudah berada pada state Sistem Menampilkan Detail Progress Proyek (biasanya ini terjadi setelah konsultan memilih suatu proyek dari daftar pada proses sebelumnya).
2. **Aksi Pilihan (Konsultan):** Pada halaman detail proyek tersebut, konsultan berinteraksi dengan memilih menu progress fisik.
3. **Menyajikan Data Spesifik (Sistem):** Sistem merespons pilihan tersebut dengan mengubah tampilan dan menampilkan Detail Progress Fisik, yang berisi rincian data kemajuan fisik di lapangan.
4. **Selesai:** Setelah detail progres fisik ditampilkan, alur untuk aktivitas spesifik ini dinyatakan selesai.

---

##### E. Membuat Rekap Laporan

**Tahapan Proses Membuat Rekap Laporan:**

1. **Akses Menu (Konsultan):** Proses dimulai ketika konsultan memilih menu rekap laporan pada antarmuka aplikasi.
2. **Menyajikan Data Proyek (Sistem):** Sistem merespons aksi tersebut dengan menarik data dan menampilkan daftar proyek yang tersedia.
3. **Pilih Proyek (Konsultan):** Dari daftar yang disajikan, konsultan kemudian memilih proyek spesifik yang laporannya ingin direkapitulasi.
4. **Opsi Periode (Sistem):** Setelah proyek dipilih, sistem akan menampilkan pilihan periode laporan untuk menentukan format rekapitulasi.
5. **Pengaturan Waktu (Konsultan):** Konsultan melakukan dua tindakan berurutan: pertama, memilih periode rekap laporan, lalu secara lebih spesifik menentukan rentang waktu laporan.
6. **Pemrosesan Data (Sistem):** Berdasarkan parameter yang dimasukkan konsultan, sistem melakukan komputasi untuk menghasilkan rekap laporan berdasarkan laporan harian yang sudah terhimpun.
7. **Menyajikan Hasil (Sistem):** Sebagai langkah terakhir, sistem menampilkan hasil rekap laporan tersebut di layar agar dapat dibaca atau diunduh oleh konsultan. Proses pada aktivitas ini pun selesai.

---

##### F. Memverifikasi Laporan Harian Kontraktor

**Tahapan Proses Verifikasi Laporan:**

1. **Permintaan Verifikasi (Kontraktor/Sistem):** Alur dimulai dengan ditampilkannya permintaan verifikasi laporan harian kepada konsultan.
2. **Pengambilan Keputusan (Konsultan):** Konsultan mengevaluasi laporan tersebut dan masuk ke tahap memilih opsi. Terdapat percabangan keputusan:

   - **Jalur "Setujui" (Jika Laporan Diterima):**
     - Sistem merespons dengan menampilkan Canvas Tanda Tangan.
     - Konsultan melakukan aksi menandatangani persetujuan.
     - Sistem kemudian menyimpan Laporan Harian tersebut.
     - Sistem mengakhiri alur ini dengan menampilkan Status "Laporan Disetujui".

   - **Jalur "Tolak" (Jika Laporan Membutuhkan Perbaikan):**
     - Sistem akan menampilkan form pesan revisi.
     - Konsultan bertugas mengisi form pesan yang berisi catatan perbaikan.
     - Sistem memproses dan mengirim pesan revisi ke Kontraktor.
     - Sistem mengakhiri proses dengan menampilkan Status "Laporan Ditolak".

---

##### G. Mengelola Administrasi Proyek

**Tahapan Proses Pengelolaan Administrasi:**

**Fase Persiapan:**
1. **Menampilkan Data (System):** Alur diawali oleh sistem yang menampilkan List Proyek yang tersedia di aplikasi.
2. **Pilih Proyek (User):** Dari daftar tersebut, pengguna memilih salah satu proyek yang ingin dikelola administrasinya.
3. **Detail Proyek (System):** Sistem merespons dengan menampilkan Detail Progress Proyek.

**Fase Pemilihan Aksi:**

- **Jalur "Tambahkan" (Membuat Administrasi Baru):**
  - Sistem akan menampilkan Form Input Judul.
  - Pengguna bertugas mengisi Form Input Judul serta rentang waktu.
  - Setelah diisi, sistem lanjut menampilkan Form Input Dokumen.
  - Pengguna menginput dokumen yang relevan (seperti mengunggah file).
  - Sistem mengakhiri alur penambahan ini dengan menyimpan data.

- **Jalur "Edit" (Memperbarui Administrasi yang Ada):**
  - Sistem merespons pilihan edit dengan menampilkan Form Detail Administrasi dari item yang sudah ada.
  - Pengguna mengedit detail administrasi yang dipilih sesuai kebutuhan.
  - Sebelum menyimpan, sistem akan meminta validasi dengan menampilkan Pop Up Konfirmasi Perubahan.
  - Pengguna kemudian memilih opsi pada pop up tersebut:
    - Jika memilih "Batalkan", sistem akan membatalkan perubahan dan melempar alur kembali ke tahap awal.
    - Jika memilih "Simpan", sistem akan menyimpan data terbaru tersebut, dan keseluruhan proses aktivitas ini dinyatakan selesai.

---

##### H. Mengelola Data Proyek

**Tahapan Proses Pengelolaan Data Proyek:**

**Fase Persiapan:**
1. Sistem menampilkan Dashboard Utama.
2. Konsultan Kantor memilih Menu Kelola Data Proyek.
3. Sistem merespons dengan menampilkan Semua Proyek OnProgress.
4. Konsultan Kantor memilih salah satu proyek dari daftar tersebut.
5. Sistem menampilkan Detail Proyek Beserta Opsi "Add", "Update", "Delete".

**Fase Pemilihan Opsi:**

- **Jalur "ADD" (Menambah Data Proyek):**
  - Sistem menampilkan Form Tambah Proyek.
  - Konsultan mengisi Form Add.
  - Sistem melakukan Validasi Format Pengisian.
    - Jika tidak valid, sistem mengembalikan konsultan ke form pengisian.
    - Jika valid, sistem menyimpan proyek, lalu menampilkan pesan "Proyek Berhasil Ditambahkan", dan alur ini selesai.

- **Jalur "Update" (Memperbarui Data Proyek):**
  - Sistem menampilkan Form Detail Proyek.
  - Konsultan mengubah detail proyek yang ada.
  - Sistem memunculkan Pop-up Konfirmasi Perubahan.
  - Jika memilih Batalkan, alur kembali ke form detail proyek.
  - Jika memilih Konfirmasi, sistem menetapkan bahwa perubahan disimpan, dan alur ini selesai.

- **Jalur "Delete" (Menghapus Data Proyek):**
  - Sistem langsung memberikan peringatan dengan menampilkan Popup Konfirmasi Hapus Permanen.
  - Jika memilih Batalkan, alur ditarik mundur kembali ke halaman detail proyek beserta opsi.
  - Jika memilih Konfirmasi, sistem bertindak menghapus proyek dipilih, dan keseluruhan aktivitas sistem berakhir.

---

##### I. Mengelola Hak Akses

**Tahapan Proses Kelola Hak Akses:**

1. **Pemilihan Aksi Utama:** Sistem menampilkan pilihan Kelola Hak Akses atau Tambahkan Akun. Pengguna masuk ke tahap memilih pilihan, yang membagi alur menjadi dua jalur utama.

2. **Jalur "Tambahkan Akun" (Membuat Akun Baru):**
   - Sistem merespons dengan menampilkan Form Register.
   - Konsultan Kantor mengisi Form Register dengan data pengguna baru.
   - Sistem menyimpan data akun tersebut, dan alur untuk proses penambahan ini selesai.

3. **Jalur "Kelola Hak Akses" (Mengubah atau Menghapus Akun):**
   - Sistem menampilkan Daftar Akun yang terdaftar.
   - Konsultan Kantor memilih akun yang akan dikelola dari daftar tersebut.
   - Sistem kemudian menampilkan pilihan Update atau Delete Akun.

   - **Skenario Hapus Akun (Delete Akun):**
     - Sistem menampilkan Pop-Up Konfirmasi Sebelum Delete Akun.
     - Jika Batalkan, alur ditarik kembali ke menu pemilihan Update/Delete.
     - Jika Konfirmasi, sistem mengeksekusi agar akun berhasil dihapus, dan alur spesifik ini selesai.

   - **Skenario Perbarui Akun (Update Detail Akun):**
     - Sistem menampilkan Detail Akun dari pengguna yang dipilih.
     - Konsultan Kantor mengupdate detail akun sesuai kebutuhan.
     - Sistem meminta validasi dengan menampilkan Pop-Up Konfirmasi Simpan Perubahan.
     - Jika Batalkan, alur dikembalikan ke halaman detail akun sebelumnya agar bisa diedit ulang.
     - Jika Konfirmasi, sistem memastikan perubahan disimpan, dan keseluruhan aktivitas pengelolaan sistem ini berakhir dengan sukses.

---

##### J. Mengelola Progress Proyek

**Tahapan Proses Pengelolaan Progress Proyek:**

1. **Fase Pemilihan Proyek:**
   - Sistem menampilkan List Proyek di layar pengguna.
   - Pengguna berinteraksi dengan memilih salah satu proyek dari daftar tersebut.
   - Sistem merespons dengan menampilkan Detail Progress Proyek.

2. **Fase Pemilihan Aksi:**

   - **Jalur "Tambahkan" (Memasukkan Progres Baru):**
     - Sistem akan menampilkan Form Input Judul.
     - Pengguna mengisi Form Input Judul serta rentang waktu.
     - Sistem kemudian menampilkan Form Input Dokumen.
     - Pengguna menginput dokumen pendukung terkait progres tersebut.
     - Sistem mengakhiri alur penambahan dengan menyimpan data.

   - **Jalur "Edit" (Memperbarui Progres yang Ada):**
     - Sistem merespons pilihan ini dengan menampilkan Form Detail Administrasi (atau form detail progres).
     - Pengguna mengedit detail administrasi yang dipilih.
     - Sistem akan meminta validasi dengan menampilkan Pop Up Konfirmasi Perubahan.
     - Jika memilih "Batalkan", sistem tidak menyimpan perubahan dan mengembalikan pengguna ke tampilan awal.
     - Jika memilih "Simpan", sistem akan menyimpan data terbaru, dan keseluruhan aktivitas pengelolaan ini dinyatakan selesai.

---

##### K. Menginput Laporan Harian Pengawasan

**Tahapan Proses Input Laporan Pengawasan Harian:**

1. **Inisiasi (System):** Proses diawali oleh sistem yang mengambil data dan menampilkan Daftar Proyek.
2. **Pilih Proyek (Konsultan):** Dari daftar tersebut, konsultan memilih salah satu proyek yang sedang diawasi.
3. **Detail Proyek (System):** Sistem merespons dengan menampilkan Detail Proyek terkait.
4. **Akses Fitur (Konsultan):** Pada halaman detail proyek tersebut, konsultan memilih menu input laporan pengawasan harian.
5. **Menyajikan Form (System):** Sistem kemudian menyiapkan antarmuka dan menampilkan Form Laporan Pengawasan.
6. **Input Data (Konsultan):** Konsultan mulai bekerja dengan mengisi Form Laporan Pengawasan berdasarkan data atau temuan aktual di lapangan.
7. **Proses Validasi (System):** Setelah data disubmit, sistem melakukan pengecekan. Terdapat percabangan keputusan:
   - **Jalur "Invalid":** Jika isian tidak lengkap atau salah format, sistem menolak penyimpanan dan mengembalikan alur ke form laporan pengawasan agar konsultan dapat memperbaikinya.
   - **Jalur "Valid":** Jika semua isian sudah benar dan sesuai ketentuan, alur dilanjutkan ke tahap berikutnya.
8. **Penyimpanan (System):** Sistem mengeksekusi perintah untuk menyimpan laporan pengawasan tersebut ke dalam database.
9. **Konfirmasi Selesai (System):** Sebagai penutup, sistem menampilkan Notifikasi Berhasil di layar konsultan, menandakan bahwa keseluruhan proses pada aktivitas ini telah selesai dengan sukses.

---

##### L. Menginput Laporan Harian

**Tahapan Proses Input Laporan Harian:**

1. **Inisiasi (Sistem):** Alur dimulai dengan sistem yang bertugas menampilkan Form Laporan Harian di layar antarmuka pengguna.
2. **Pengisian Form (Kontraktor):** Kontraktor kemudian bertindak dengan mengisi Form Laporan sesuai dengan data perkembangan proyek di hari tersebut.
3. **Pengecekan Data (Sistem):** Data yang dikirimkan oleh kontraktor akan melalui tahap Validasi Input oleh sistem. Di titik ini, terdapat percabangan:
   - **Jalur "Tidak Valid":** Jika data yang diinput belum lengkap atau formatnya salah, sistem akan mengembalikan alur ke awal.
   - **Jalur "Valid":** Jika seluruh inputan sudah benar, proses dilanjutkan ke tahap berikutnya.
4. **Permintaan Dokumentasi (Sistem):** Setelah teks laporan valid, sistem akan menampilkan Form Input Bukti Gambar.
5. **Unggah Bukti Fisik (Kontraktor):** Kontraktor diwajibkan untuk melakukan Input Bukti Gambar, seperti mengunggah foto-foto kondisi aktual pengerjaan di lapangan.
6. **Pemrosesan Laporan (Sistem):** Setelah bukti gambar diunggah, sistem secara otomatis mengirim laporan ke Konsultan untuk di konfirmasi.
7. **Selesai (Sistem):** Sebagai penutup alur, sistem akan menampilkan Status Laporan "Menunggu disetujui" kepada kontraktor, dan keseluruhan aktivitas input laporan harian ini pun dinyatakan selesai.

---

##### M. Memantau Progress Pengawasan

**Tahapan Proses Memantau Progress Pengawasan:**

1. **Titik Awal (Sistem):** Alur dimulai dari sisi sistem yang sedang berada pada antarmuka Sistem Menampilkan Detail Progress Proyek.
2. **Aksi Pengguna (Konsultan):** Melalui halaman detail proyek tersebut, konsultan berinteraksi dengan memilih menu progress pengawasan.
3. **Respon Sistem:** Sistem memproses pilihan tersebut lalu merespons dengan menampilkan Detail Progress Pengawasan, yang memuat data spesifik mengenai jalannya pengawasan proyek.
4. **Selesai:** Setelah halaman rincian tersebut terbuka dan disajikan kepada konsultan, proses pada diagram aktivitas ini dinyatakan selesai.

---

### 3.3 Kebutuhan Non-Fungsional

| No | Parameter | Deskripsi Kebutuhan |
|----|-----------|---------------------|
| 1 | **Availability** | Aplikasi portal monitoring harus terus dapat beroperasi 7 hari per minggu, 24 jam per hari tanpa gagal, di luar waktu pemeliharaan (maintenance) yang telah dijadwalkan. |
| 2 | **Reliability** | Kegagalan dalam proses sinkronisasi atau penyimpanan data (seperti input laporan harian) memiliki toleransi maksimal satu kali kegagalan (error rate) dalam satu minggu operasional. |
| 3 | **Ergonomy** | Tampilan antarmuka aplikasi harus bersih, profesional, dan mudah dipahami oleh pengguna dengan berbagai peran (Konsultan dan Kontraktor) tanpa memerlukan pelatihan khusus yang panjang. |
| 4 | **Portability** | Sistem dapat diakses dengan lancar lintas platform, baik melalui web browser standar (Chrome, Edge, Safari) di PC/Laptop, maupun melalui perangkat mobile (Android/iOS). |
| 5 | **Memory** | Aplikasi di sisi klien (client-side) dirancang ringan sehingga konsumsi RAM perangkat pengguna (web atau mobile) saat membuka detail progres proyek tidak melebihi 250 MB. |
| 6 | **Response Time** | Sistem mampu menampilkan halaman detail progress fisik proyek maksimal dalam waktu 3 detik setelah diklik. Proses meng-generate dan menampilkan rekap laporan memakan waktu maksimal 5–10 detik. |
| 7 | **Safety** | Sistem dilengkapi dengan mekanisme pencadangan (backup) basis data secara berkala untuk memastikan tidak ada data kronologi proyek atau laporan pengawasan yang hilang jika terjadi kegagalan pada server. |
| 8 | **Security** | Sistem menerapkan pembatasan hak akses (role-based access control), enkripsi password pengguna di basis data, serta mengamankan lalu lintas pertukaran data menggunakan standar enkripsi koneksi HTTPS. |

---

## Lampiran: User Story

| No | Kode | User Story |
|----|------|------------|
| 1 | FR-001 | Sebagai Administrator (Konsultan Kantor), saya ingin membuat akun pengguna baru untuk pihak Dinas dan Kontraktor sehingga mereka dapat mengakses sistem sesuai perannya. |
| 2 | FR-002 | Sebagai pengguna sistem, saya ingin login menggunakan akun yang telah diberikan sehingga saya dapat mengakses fitur yang sesuai dengan hak akses saya. |
| 3 | FR-003 | Sebagai pengguna sistem, saya ingin sistem memverifikasi data login dan peran saya sehingga keamanan akses sistem dapat terjamin. |
| 4 | FR-004 | Sebagai pengguna sistem, saya ingin logout dari aplikasi sehingga akun saya tetap aman setelah selesai digunakan. |
| 5 | FR-005 | Sebagai pengguna sistem, saya ingin mereset password akun saya sehingga saya dapat kembali mengakses sistem jika lupa kata sandi. |
| 6 | FR-006 | Sebagai Administrator (Konsultan Kantor), saya ingin mengelola data proyek konstruksi sehingga informasi proyek selalu terbaru dan akurat. |
| 7 | FR-007 | Sebagai pengguna sistem, saya ingin melihat dashboard utama yang menampilkan perbandingan progres fisik dan rencana kerja sehingga saya dapat memantau perkembangan proyek dengan cepat. |
| 8 | FR-008 | Sebagai pengguna sistem, saya ingin menerima notifikasi kendala teknis proyek sehingga saya dapat segera mengetahui dan menindaklanjuti permasalahan yang terjadi. |
| 9 | FR-009 | Sebagai Kontraktor maupun Konsultan, saya ingin menginput laporan harian sesuai tanggung jawab masing-masing sehingga data progres fisik dan mutu pekerjaan dapat terdokumentasi secara lengkap. |
| 10 | FR-010 | Sebagai Konsultan Lapangan, saya ingin sistem memvalidasi lokasi dan foto selfie saat mengirim laporan sehingga keaslian data lapangan dapat dipastikan. |
| 11 | FR-011 | Sebagai Kontraktor, saya ingin mengunggah shop drawing dan Request of Work sehingga dokumen proyek dapat diproses oleh pihak konsultan. |
| 12 | FR-012 | Sebagai Konsultan, saya ingin menerima notifikasi batas waktu respons Request of Work sehingga tidak terjadi keterlambatan tindak lanjut dokumen. |
| 13 | FR-013 | Sebagai pengguna yang berwenang, saya ingin melihat timeline kronologi proyek sehingga saya dapat memahami riwayat progres fisik dan administrasi proyek secara lengkap. |
| 14 | FR-014 | Sebagai pengguna sistem, saya ingin sistem mengunci perhitungan sesuai regulasi kementerian yang berlaku sehingga analisis proyek tetap sesuai standar dan tidak terjadi kesalahan perhitungan. |
| 15 | FR-015 | Sebagai pihak Dinas (Owner), saya ingin memberikan otorisasi digital pada laporan bulanan sehingga laporan proyek dapat disahkan secara resmi. |
| 16 | FR-016 | Sebagai Konsultan, saya ingin sistem membuat rekap laporan mingguan dan bulanan secara otomatis sehingga proses penyusunan laporan menjadi lebih cepat dan efisien. |
| 17 | FR-017 | Sebagai Administrator, saya ingin sistem mencatat seluruh aktivitas perubahan data dan membatasi penghapusan berkas sehingga keamanan serta akuntabilitas data tetap terjaga. |
| 18 | FR-018 | Sebagai Administrator (Konsultan Kantor), saya ingin mengotorisasi penghapusan berkas melalui persetujuan berjenjang sehingga proses penghapusan data dapat dipertanggungjawabkan dan tercatat dalam riwayat aktivitas. |