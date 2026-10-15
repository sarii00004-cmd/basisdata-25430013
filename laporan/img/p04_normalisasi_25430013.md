### 1. Dokumen Sumber dan Titik Awal UNF
Dokumen sumber yang digunakan adalah Formulir Pengembalian Buku Perpustakaan DV pada dokumen kebutuhan data Pertemuan 2. Formulir ini memuat nomor pengembalian, nomor peminjaman, nomor anggota, kode eksemplar, tanggal jatuh tempo, tanggal dikembalikan, kondisi buku, hari terlambat, denda, status denda, dan petugas.
## 1.1 Bentuk UNF (Unnormalized Form)
Pada bentuk awal, informasi transaksi dan daftar buku yang dipinjam dapat tercampur dalam satu catatan. Jika satu transaksi berisi beberapa eksemplar, data anggota, peminjaman, dan petugas berpotensi diulang untuk setiap eksemplar.
Contoh struktur UNF konseptual:
FORM_PENGEMBALIAN_UNF(no_pengembalian, no_peminjaman, tanggal_pinjam, tanggal_jatuh_tempo, no_anggota, nama_anggota, id_petugas, nama_petugas, {kode_eksemplar, judul_buku, kondisi_kembali, tanggal_kembali, hari_terlambat, tarif_denda, total_denda, status_denda})
Tanda {...} menunjukkan kelompok data eksemplar yang dapat berulang. Nama anggota, nama petugas, dan judul buku disertakan untuk menggambarkan potensi pengulangan informasi pada formulir; dalam rancangan basis data, informasi tersebut sebaiknya dirujuk melalui kunci, bukan disalin ke setiap baris transaksi.
Masalah UNF:
- Kelompok data eksemplar dapat berulang dalam satu catatan.
- Nama anggota dan petugas dapat ditulis berulang.
- Perubahan satu fakta dapat menyebabkan nilai yang tidak konsisten.
- Penghapusan transaksi berisiko ikut menghilangkan informasi lain yang masih diperlukan.
### 2. Dependensi Fungsional dan Aturan Bisnis
Dependensi fungsional berikut diturunkan dari entitas, elemen data, dan aturan bisnis pada dokumen kebutuhan data. Kode AB dicantumkan sebagai dasar. Untuk atribut yang tidak secara eksplisit ditetapkan oleh aturan bisnis, dependensi ditandai sebagai asumsi rancangan dan perlu dikonfirmasi jika aturan operasional berbeda.
|No.	|Dependensi fungsional	|Dasar aturan bisnis / sumber
|DF-01	|no_anggota → nama_anggota, alamat, no_hp, email, tanggal_daftar, status_anggota	|AB-01; PB-01 dan formulir anggota
|DF-02	|id_petugas → nama_petugas, username, peran_petugas, status_petugas	|PB-02 dan data petugas
|DF-03	|id_buku → ISBN, judul_buku, penulis, penerbit, tahun_terbit, id_kategori	|AB-03, AB-13; katalog buku
|DF-04	|id_kategori → nama_kategori	|Entitas Kategori pada dokumen kebutuhan data
|DF-05	|id_eksemplar → id_buku, lokasi_rak, kondisi_buku, status_eksemplar	|AB-03, AB-04, AB-12
|DF-06	|id_peminjaman → no_anggota, id_petugas, tanggal_pinjam, tanggal_jatuh_tempo	|AB-14; slip peminjaman
|DF-07	|(id_peminjaman, id_eksemplar) → atribut detail peminjaman	|AB-06; Detail Peminjaman
|DF-08	|id_pengembalian → id_peminjaman, id_eksemplar, id_petugas, tanggal_kembali, kondisi_saat_kembali	|AB-08, AB-11; formulir pengembalian
|DF-09	|id_denda → id_pengembalian, hari_terlambat, tarif_denda, status_denda	|AB-09, AB-10, AB-11; kuitansi denda
|DF-10	|hari_terlambat, tarif_denda, jumlah_eksemplar_terlambat → total_denda	|AB-09 dan AB-10; nilai turunan yang dihitung
Catatan kunci: AB-13 menyatakan ISBN dapat mengidentifikasi judul secara unik apabila tersedia. Karena ISBN dapat tidak tersedia, id_buku tetap digunakan sebagai kunci utama, sedangkan ISBN yang terisi dapat diberi batasan unik.

### 3. Tahapan Normalisasi
##  3.1 UNF ke 1NF
Syarat 1NF adalah setiap kolom menyimpan satu nilai atomik dan tidak ada kelompok berulang. Kelompok eksemplar dalam formulir dipecah menjadi baris detail yang terpisah.
Struktur relasi konseptual setelah 1NF:
PENGEMBALIAN_1NF(no_pengembalian, no_peminjaman, id_eksemplar, no_anggota, nama_anggota, id_petugas, nama_petugas, tanggal_pinjam, tanggal_jatuh_tempo, tanggal_kembali, kondisi_saat_kembali, hari_terlambat, tarif_denda, total_denda, status_denda)
Kunci kandidat sementara untuk satu baris item pengembalian adalah (no_pengembalian, id_eksemplar) apabila satu nomor pengembalian dapat memuat beberapa eksemplar. Untuk rancangan akhir, setiap item pengembalian diberi id_pengembalian unik dan satu baris mewakili satu eksemplar yang dikembalikan.
Perbaikan pada tahap ini:
- Satu baris hanya mewakili satu eksemplar yang dikembalikan.
- Data tidak disimpan sebagai daftar beberapa kode eksemplar dalam satu kolom.
- Nama anggota dan nama petugas masih terlihat berulang sehingga perlu dipisahkan pada tahap berikutnya.
## 3.2 1NF ke 2NF
2NF mengharuskan setiap atribut bukan kunci bergantung pada seluruh kunci kandidat, bukan hanya sebagian kunci komposit. Pada tabel item transaksi, atribut judul buku bergantung pada id_buku, sedangkan identitas anggota dan petugas bergantung pada transaksi peminjaman, bukan pada eksemplar saja. Karena itu, atribut-atribut tersebut dipisahkan ke tabel master dan tabel transaksi.
Hasil pemisahan:
- ANGGOTA(no_anggota, nama_anggota, alamat, no_hp, email, tanggal_daftar, status_anggota)
- PETUGAS(id_petugas, nama_petugas, username, peran_petugas, status_petugas)
- KATEGORI(id_kategori, nama_kategori)
- JUDUL_BUKU(id_buku, ISBN, judul_buku, penulis, penerbit, tahun_terbit, id_kategori)
- EKSEMPLAR(id_eksemplar, id_buku, lokasi_rak, kondisi_buku, status_eksemplar)
- PEMINJAMAN(id_peminjaman, no_anggota, id_petugas, tanggal_pinjam, tanggal_jatuh_tempo)
- DETAIL_PEMINJAMAN(id_peminjaman, id_eksemplar)
- PENGEMBALIAN(id_pengembalian, id_peminjaman, id_eksemplar, id_petugas, tanggal_kembali, kondisi_saat_kembali)
- DENDA(id_denda, id_pengembalian, hari_terlambat, tarif_denda, status_denda)
DETAIL_PEMINJAMAN memakai kunci primer gabungan (id_peminjaman, id_eksemplar). Setiap eksemplar yang dipinjam dicatat satu kali pada suatu transaksi. Struktur ini mengikuti AB-06 dan AB-07.
3.3 2NF ke 3NF
3NF mengharuskan atribut bukan kunci tidak bergantung secara transitif pada kunci utama melalui atribut bukan kunci lain. Contohnya, nama_kategori tidak disimpan pada JUDUL_BUKU; tabel tersebut menyimpan id_kategori sebagai kunci tamu. Nama kategori disimpan satu kali di tabel KATEGORI.
Demikian pula:
- nama_anggota hanya disimpan pada ANGGOTA, bukan pada PEMINJAMAN atau PENGEMBALIAN.
- nama_petugas hanya disimpan pada PETUGAS, sedangkan transaksi menyimpan id_petugas.
- Informasi judul buku disimpan pada JUDUL_BUKU, sedangkan buku fisik dan statusnya disimpan pada EKSEMPLAR.
- total_denda tidak disimpan sebagai nilai terpisah karena merupakan nilai turunan; total dihitung dari hari keterlambatan, tarif, dan jumlah eksemplar terlambat sesuai konteks perhitungan.
Dengan pemisahan ini, setiap tabel menyimpan fakta tentang satu objek atau satu jenis transaksi dan atribut nonkunci bergantung pada kunci tabelnya.
### 4. Skema Relasional Akhir (3NF)
|Tabel	|Atribut dan kunci
|ANGGOTA	|no_anggota PK, nama_anggota, alamat, no_hp, email, tanggal_daftar, status_anggota
|PETUGAS	|id_petugas PK, nama_petugas, username UNIQUE, peran_petugas, status_petugas
|KATEGORI	|id_kategori PK, nama_kategori UNIQUE
|JUDUL_BUKU	|id_buku PK, ISBN UNIQUE bila terisi, judul_buku, penulis, penerbit, tahun_terbit, id_kategori FK
|EKSEMPLAR	|id_eksemplar PK, id_buku FK, lokasi_rak, kondisi_buku, status_eksemplar
|PEMINJAMAN	|id_peminjaman PK, no_anggota FK, id_petugas FK, tanggal_pinjam, tanggal_jatuh_tempo
|DETAIL_PEMINJAMAN	|id_peminjaman PK/FK, id_eksemplar PK/FK
|PENGEMBALIAN	|id_pengembalian PK, id_peminjaman, id_eksemplar, id_petugas FK, tanggal_kembali, kondisi_saat_kembali; pasangan (id_peminjaman, id_eksemplar) FK gabungan ke DETAIL_PEMINJAMAN dan UNIQUE bila satu item hanya boleh memiliki satu catatan pengembalian
|DENDA	|id_denda PK, id_pengembalian FK/UNIQUE bila maksimal satu denda per pengembalian, hari_terlambat, tarif_denda, status_denda


## 4.1 Relasi antartabel
- Satu anggota dapat mempunyai banyak transaksi peminjaman.
- Satu petugas dapat mencatat banyak transaksi peminjaman dan pengembalian.
- Satu kategori dapat mempunyai banyak judul buku.
- Satu judul buku dapat mempunyai banyak eksemplar fisik.
- Satu transaksi peminjaman mempunyai satu atau lebih baris detail peminjaman.
- Satu eksemplar dapat muncul pada transaksi yang berbeda sepanjang waktu, tetapi tidak boleh memiliki dua peminjaman aktif secara bersamaan (AB-05).
- Pengembalian merujuk pada item yang dipinjam; denda, jika ada, merujuk pada pengembalian (AB-11).
Catatan implementasi: Relasi antara PENGEMBALIAN dan DETAIL_PEMINJAMAN memerlukan kunci tamu gabungan (id_peminjaman, id_eksemplar). Tambahkan batasan unik sesuai aturan apakah satu item hanya boleh dikembalikan sekali.

### 5. Pemeriksaan BCNF
BCNF mensyaratkan setiap determinan pada dependensi fungsional nontrivial merupakan superkey.
|Tabel	|Determinan utama	|Hasil pemeriksaan
|ANGGOTA	|no_anggota	|Memenuhi BCNF jika no_anggota adalah satu-satunya determinan nontrivial yang ditetapkan
|PETUGAS	|id_petugas; username jika unik	|Memenuhi BCNF jika kedua atribut tersebut masing-masing mengidentifikasi satu petugas
|KATEGORI	|id_kategori; nama_kategori jika unik	|Memenuhi BCNF dengan batasan unik pada nama kategori
|JUDUL_BUKU	|id_buku; ISBN jika tersedia dan unik	|Memenuhi BCNF jika ISBN yang terisi dijaga unik
|EKSEMPLAR	|id_eksemplar	|Memenuhi BCNF
|PEMINJAMAN	|id_peminjaman	|Memenuhi BCNF
|DETAIL_PEMINJAMAN	|(id_peminjaman, id_eksemplar)	|Memenuhi BCNF; tidak ada atribut nonkunci
|PENGEMBALIAN	|id_pengembalian; pasangan peminjaman-eksemplar jika diberi UNIQUE	|Memenuhi BCNF dengan aturan keunikan tersebut
|DENDA	|id_denda; id_pengembalian jika maksimal satu denda per pengembalian	|Memenuhi BCNF jika aturan keunikan diterapkan

Kesimpulan pemeriksaan: skema dirancang memenuhi BCNF berdasarkan dependensi fungsional dan batasan unik yang dinyatakan di atas. Klaim ini bergantung pada aturan bisnis tersebut benar-benar diterapkan sebagai constraint di basis data.

### 6. Keputusan Penyimpanan Nilai Turunan
|Nilai	|Keputusan	|Alasan
|hari_terlambat	|Dihitung dari tanggal jatuh tempo dan tanggal kembali; dapat dihitung saat diperlukan	|Menghindari nilai yang tidak konsisten jika tanggal berubah
|total_denda	|Tidak disimpan sebagai atribut permanen; dihitung saat ditampilkan atau ditagihkan	|Nilai turunan dari hari terlambat, tarif, dan jumlah eksemplar terlambat
|Jumlah eksemplar dipinjam	|Dihitung dari jumlah baris DETAIL_PEMINJAMAN	|Menghindari duplikasi dengan detail transaksi
|Jumlah eksemplar tersedia per judul	|Dihitung dari jumlah eksemplar yang statusnya tersedia	|Status fisik disimpan per eksemplar sesuai AB-04
|Jumlah peminjaman per bulan	|Dihitung dari tanggal transaksi pada PEMINJAMAN	|Merupakan kebutuhan laporan, bukan fakta master yang harus disimpan

Rumus denda berdasarkan aturan bisnis:
total_denda = hari_terlambat × tarif_denda × jumlah_eksemplar_terlambat
Tarif dasar yang tercantum dalam dokumen kebutuhan data adalah Rp3.000 per eksemplar per hari (AB-10). Nilai denda sebaiknya dihitung berdasarkan aturan yang berlaku untuk transaksi tersebut agar riwayat denda tetap dapat dijelaskan.

### 7. Perubahan ERD Proyek
ERD perlu diselaraskan dengan skema 3NF sebagai berikut:
1. Pastikan KATEGORI menjadi entitas terpisah dan JUDUL_BUKU menyimpan id_kategori sebagai FK.
2. Pertahankan pemisahan JUDUL_BUKU dan EKSEMPLAR; satu judul mempunyai banyak eksemplar (AB-03).
3. Pastikan PEMINJAMAN menjadi tabel header dan DETAIL_PEMINJAMAN menghubungkan transaksi dengan eksemplar (AB-06).
4. Hubungkan PENGEMBALIAN dengan item peminjaman tertentu melalui pasangan (id_peminjaman, id_eksemplar), agar setiap pengembalian dapat ditelusuri ke eksemplar yang benar.
5. Hubungkan DENDA ke PENGEMBALIAN, bukan hanya ke anggota, karena setiap denda harus berhubungan dengan pengembalian (AB-11).
6. Hapus atribut nama_anggota, nama_petugas, judul_buku, dan total_denda dari tabel transaksi jika sebelumnya disalin sebagai atribut biasa; informasi tersebut diambil melalui relasi atau dihitung.
7. Tambahkan batasan unik pada ISBN jika terisi, username, dan atribut lain yang memang dijamin unik oleh aturan bisnis.
Catatan perubahan ERD untuk commit: Memisahkan kategori, memisahkan detail peminjaman dari header, menautkan pengembalian ke item peminjaman, dan menghitung total denda sebagai nilai turunan.
8. Kesimpulan
Berdasarkan dokumen sumber Formulir Pengembalian Buku Perpustakaan Cendekia VP dan kebutuhan data Perpustakaan DV, data awal yang berulang dipecah menjadi relasi dengan atribut atomik. Dependensi fungsional digunakan untuk memisahkan data anggota, petugas, kategori, judul buku, eksemplar, transaksi peminjaman, pengembalian, dan denda. Skema akhir dirancang mencapai 3NF dan memenuhi BCNF dengan asumsi batasan kunci unik diterapkan. Nilai turunan seperti total denda dan jumlah koleksi dihitung agar tidak terjadi ketidakkonsistenan data.
9. Catatan yang Perlu Dikonfirmasi
- Dokumen sumber menyebut tarif Rp3.000 per eksemplar per hari dan maksimal 5 eksemplar per transaksi. Aturan ini dipertahankan dalam rancangan.
- Dokumen kebutuhan data menuliskan P = (47 mod 9) + 1 = 3, tetapi juga mencantumkan NIM dengan dua digit terakhir 13 dan nama berkas p02_kebutuhan_data_25430013.md. Karena angka 47 tidak konsisten dengan NIM pada nama berkas, perhitungan parameter personal perlu diperiksa kembali sebelum laporan final.
- Struktur PENGEMBALIAN di atas mengasumsikan satu baris pengembalian mewakili satu eksemplar. Jika formulir aktual mencatat banyak eksemplar dalam satu nomor pengembalian, gunakan tabel header PENGEMBALIAN dan tabel DETAIL_PENGEMBALIAN terpisah.
