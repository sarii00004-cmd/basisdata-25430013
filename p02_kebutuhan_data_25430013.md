## Latar belakang dan aktivitas organisasi
# 1.1 Latar Belakang

Perpustakaan DV merupakan organisasi fiktif yang menyediakan layanan peminjaman dan pengembalian buku bagi anggota perpustakaan. Perpustakaan memiliki koleksi buku dari berbagai kategori dan menyediakan layanan keanggotaan, stok buku, peminjaman, pengembalian, serta pengelolaan denda keterlambatan.
Dalam kegiatan operasionalnya, perpustakaan membutuhkan data yang terstruktur untuk menyimpan informasi anggota, petugas, eksemplar buku, transaksi peminjaman, pengembalian, dan denda.
Pengelolaan data diperlukan agar petugas dapat mengetahui status keanggotaan, eksemplar buku, riwayat peminjaman anggota, serta jumlah denda yang harus dibayarkan.
Perhatian khusus pada proyek perpustakaan adalah membedakan judul buku dengan eksemplar buku. Satu judul dapat mempunyai lebih dari satu eksemplar fisik. Hal ini perlu diperhatikan sejak tahap kebutuhan data agar status ketersediaan buku dapat dicatat dengan benar.
# 1.2 Aktivitas Organisasi

Aktivitas utama Perpustakaan DV meliputi:

1. Pendaftaran dan pengelolaan anggota.
2. Pengelolaan data petugas.
3. Pengelolaan katalog judul buku.
4. Pengelolaan eksemplar buku.
5. Pencatatan peminjaman buku.
6. Pencatatan pengembalian buku.
7. Perhitungan dan pencatatan denda keterlambatan.
8. Pembuatan laporan aktivitas perpustakaan.

## 2. Aktor dan proses bisnis

Aktor yang terlibat dalam aktivitas Perpustakaan DV adalah:

1. Anggota — menggunakan layanan perpustakaan.
2. Petugas perpustakaan — mengelola anggota, buku, peminjaman, dan pengembalian.
3. Admin perpustakaan — mengelola data master dan petugas.
4. Kepala perpustakaan — melihat laporan dan melakukan pengawasan.

Tabel Proses Bisnis

Kode	|Proses Bisnis	                |Aktor	             |Pemicu
PB-01	|Mengelola data anggota	        |Petugas	         |Anggota baru mendaftar atau data anggota berubah|
PB-02	|Mengelola data petugas	        |Admin	             |Petugas baru bergabung atau data petugas berubah|
PB-03	|Mengelola katalog buku	        |Admin/Petugas       |Buku baru masuk atau data buku berubah|
PB-04	|Mengelola eksemplar buku	    |Petugas	         |Eksemplar baru ditambahkan atau status berubah|
PB-05	|Melayani peminjaman buku	    |Petugas dan Anggota |Anggota ingin meminjam buku|
PB-06	|Melayani pengembalian buku	    |Petugas dan Anggota |Anggota mengembalikan buku|
PB-07	|Mengelola denda	            |Petugas             |Pengembalian terlambat|
PB-08	|Membuat laporan perpustakaan	|Kepala Perpustakaan |Kebutuhan laporan periodik|

## 3. Dokumen sumber yang dianalisis
Dokumen sumber digunakan untuk mengetahui data yang benar-benar dibutuhkan dalam kegiatan perpustakaan.

# 3.1 Formulir Pendaftaran Anggota
Data yang ditemukan:
1. Nomor anggota
2. Nama anggota
3. Alamat
4. Nomor telepon
5. Email
6. Tanggal pendaftaran
7. Status anggota
Dokumen ini menjadi sumber data entitas Anggota.

# 3.2 Kartu/Daftar Katalog Buku

Data yang ditemukan:
1. Kode buku
2. ISBN
4. Judul buku
5. Penulis
6. Penerbit
7. Tahun terbit
8. Kategori
Dokumen ini menjadi sumber data Judul Buku.

# 3.3 Label Eksemplar Buku

Data yang ditemukan:
1. Kode eksemplar
2. Kode buku
3. Lokasi rak
4. Kondisi buku
5. Status ketersediaan
Dokumen ini menjadi sumber data Eksemplar.

# 3.4 Slip Peminjaman

Data yang ditemukan:
1. Nomor peminjaman
2. Nomor anggota
4. Nama anggota
5. Kode eksemplar
6. Tanggal peminjaman
7. Tanggal jatuh tempo
8. Petugas
Dokumen ini menjadi sumber data Peminjaman dan Detail Peminjaman.

# 3.5 Kuitansi Denda

Data yang ditemukan:
1. Nomor denda
2. Nomor peminjaman
3. Nomor anggota
4. Tanggal pengembalian
5. Jumlah hari keterlambatan
6. Tarif denda
7. Total denda
8. Status pembayaran
Dokumen ini menjadi sumber data Denda.

# 3.6 Dokumen Sumber Fiktif
Formulir Pengembalian Buku Perpustakaan
Dokumen fiktif yang dirancang untuk proyek ini adalah Formulir Pengembalian Buku Perpustakaan Cendekia VP.

Contoh:
|Elemen Data	       |Keterangan|
|No. Pengembalian	   |Nomor unik transaksi pengembalian|
|No. Peminjaman	       |Referensi transaksi peminjaman|
|No. Anggota     	   |Identitas anggota|
|Kode Eksemplar  	   |Identitas buku fisik|
|Tanggal Jatuh Tempo   |Batas waktu pengembalian|
|Tanggal Dikembalikan  |Tanggal aktual pengembalian|
|Kondisi Buku	       |Kondisi buku saat dikembalikan|
|Hari Terlambat	       |Jumlah hari keterlambatan|
|Denda	               |Jumlah denda|
|Status Denda	       |Lunas/belum lunas|
|Petugas               |Petugas yang menerima pengembalian|

Pembedahan Dokumen
Dari formulir tersebut dapat diidentifikasi beberapa entitas:
1. Peminjaman
2. Anggota
3. Eksemplar
4. Pengembalian
5. Denda
6. Petugas
Dokumen ini juga menunjukkan bahwa tanggal jatuh tempo perlu disimpan pada transaksi peminjaman agar keterlambatan dapat dihitung berdasarkan data historis transaksi.

## 4. Entitas kandidat dan elemen data

Berdasarkan proses bisnis dan dokumen sumber, diperoleh entitas kandidat berikut.

Entitas Kandidat	|Elemen Data Utama	                                                        |Sumber
Anggota	            |no_anggota, nama, alamat, no_hp, email, tanggal_daftar, status	            |Formulir anggota|
Petugas	            |id_petugas, nama, username, peran, status	                                |Data petugas|
Judul Buku	        |id_buku, ISBN, judul, penulis, penerbit, tahun, kategori	                |Katalog buku|
Eksemplar	        |id_eksemplar, id_buku, lokasi_rak, kondisi, status	                        |Label buku
Peminjaman	        |id_peminjaman, no_anggota, id_petugas, tanggal_pinjam, tanggal_jatuh_tempo	|Slip peminjaman|
Detail Peminjaman	|id_peminjaman, id_eksemplar	                                            |Slip peminjaman|
Pengembalian	    |id_pengembalian, id_peminjaman, tanggal_kembali, kondisi	                |Formulir pengembalian|
Denda	            |id_denda, id_pengembalian, hari_terlambat, tarif, total, status	        |Kuitansi denda|
Kategori	|       id_kategori, nama_kategori	                                                |Katalog buku|

Judul Buku menyimpan informasi bibliografis suatu judul.
Eksemplar menyimpan informasi buku fisik. Satu judul buku dapat mempunyai banyak eksemplar. Contohnya, buku dengan judul Basis Data Dasar dapat memiliki BK-001, BK-002, dan BK-003.
Pemisahan ini penting agar perpustakaan dapat mengetahui bukan hanya apakah suatu judul tersedia, tetapi juga eksemplar fisik mana yang sedang dipinjam, tersedia, rusak, atau hilang.

## 5. Aturan bisnis

Tabel Aturan Bisnis

Kode	|Aturan Bisnis
AB-01	|Setiap anggota memiliki nomor anggota yang unik.
AB-02	|Anggota harus berstatus aktif untuk melakukan peminjaman.
AB-03	|Setiap judul buku dapat memiliki satu atau lebih eksemplar fisik.
AB-04	|Setiap eksemplar hanya dapat memiliki satu status ketersediaan pada satu waktu.
AB-05	||Eksemplar dengan status sedang dipinjam tidak dapat dipinjam oleh anggota lain.
AB-06	|Setiap transaksi peminjaman harus memiliki minimal satu eksemplar buku.
AB-07	|Jumlah maksimal eksemplar yang dapat dipinjam dalam satu transaksi adalah 5 eksemplar.
AB-08	|Setiap eksemplar yang dikembalikan harus memiliki tanggal pengembalian.
AB-09	|Pengembalian setelah tanggal jatuh tempo dikenakan denda.
AB-10	|Tarif denda keterlambatan ditetapkan sebesar Rp3.000 per eksemplar per hari.
AB-11	|Setiap transaksi denda harus berhubungan dengan transaksi pengembalian.
AB-12	|Buku dengan status rusak atau hilang tidak dapat dipinjam sebelum statusnya diperbaiki.
AB-13	|Nomor ISBN dapat digunakan untuk mengidentifikasi judul buku secara unik apabila tersedia.
AB-14	|Setiap transaksi peminjaman harus dicatat oleh satu petugas.
AB-15	|Data historis peminjaman dan pengembalian tidak boleh dihapus hanya karena anggota menjadi tidak aktif.

Nilai batas 5 eksemplar dan denda Rp3.000 berasal dari parameter personal NIM yang dihitung pada bagian 9.

## 6. Kebutuhan informasi

Tabel Kebutuhan Informasi

Kode	|Kebutuhan Informasi	                                        |Data yang Diperlukan
KI-01	|Menampilkan daftar anggota aktif	                            |Anggota
KI-02	|Menampilkan koleksi buku yang tersedia	                        |Judul Buku, Eksemplar
KI-03	|Menampilkan daftar buku yang sedang dipinjam	                |Peminjaman, Detail Peminjaman, Eksemplar, Judul Buku
KI-04	|Menampilkan riwayat peminjaman seorang anggota	                |Anggota Peminjaman, Detail Peminjaman
KI-05	|Menampilkan daftar anggota yang terlambat mengembalikan buku	|Anggota, Peminjaman, Pengembalian
KI-06	|Menampilkan total denda yang belum dibayar	Anggota, Denda
KI-07	|Menampilkan buku yang paling sering dipinjam	                |Judul Buku, Eksemplar, Detail Peminjaman
KI-08	|Menampilkan jumlah peminjaman per bulan	                    |Peminjaman
KI-09	|Menampilkan jumlah koleksi berdasarkan kategori	            |Kategori, Judul Buku, Eksemplar
KI-10	|Menampilkan daftar buku rusak atau hilang	                    |Eksemplar, Judul Buku

Contoh Pengujian Kebutuhan Informasi

KI-02 dapat diuji dengan memilih suatu judul buku dan sistem harus dapat menampilkan jumlah eksemplar dengan status tersedia.
KI-05 dapat diuji dengan memilih periode tertentu dan sistem menampilkan anggota yang tanggal pengembaliannya melewati tanggal jatuh tempo.
KI-06 dapat diuji dengan menampilkan seluruh denda yang mempunyai status belum lunas.
KI-07 dapat diuji dengan menghitung jumlah peminjaman setiap judul buku kemudian mengurutkannya dari jumlah peminjaman terbesar.

## 7. Matriks CRUD

Keterangan:

C = Create
R = Read
U = Update
D = Delete
Matriks CRUD Proses Bisnis terhadap Entitas

Proses	|Anggota	|Petugas	|Judul Buku	|Eksemplar	|Kategori|Peminjaman	|Detail |Peminjaman	|Pengembalian	|Denda

PB-01 |Mengelola anggota	|C, R, U|	R|	-|	-|	-|	-|	-|	-|	-|
PB-02 |Mengelola petugas	|-	|C, R, U|	-|	-|	-|	-|	-|	-|	-|
PB-03 |Mengelola katalog buku	|-	|R  |C, R, U|	-|	C, R, U|	-|	-|	-|	-|
PB-04 |Mengelola eksemplar	|-	|R|	|R|	|C, R, U|	-|	-|	-|	-|	-|
PB-05 |Melayani peminjaman	|R|	R|	R|	R, U|	R|	C, R|	C|	-|	-|
PB-06 |Melayani pengembalian	|R|	R|	R|	|R, U|	|-	|R, U|	|R	|C	|-|
PB-07 |Mengelola denda	|R|	R|	-|	R|	-|	R|	R|	R|	C, R, U|
PB-08 |Membuat laporan	|R|	R|	R|	R|	R|	R|	R|	R|	R|

Pemeriksaan CRUD
Setiap entitas memiliki proses yang melakukan Create:

1. Anggota → PB-01
2. Petugas → PB-02
3. udul Buku → PB-03
4. Kategori → PB-03
5. Eksemplar → PB-04
6. Peminjaman → PB-05
7. Detail Peminjaman → PB-05
8. Pengembalian → PB-06
9. Denda → PB-07

Pemeriksaan seperti ini penting karena modul memperingatkan tentang entitas yatim dalam matriks CRUD, yaitu entitas yang tidak memiliki huruf C. Solusinya adalah menambahkan proses pemeliharaan data atau menghapus entitas yang memang tidak diperlukan.


## 8. Kamus data awal

Elemen Data	    |Arti	                    |Contoh     	        |Aturan	|Penanggung Jawab
no_anggota	    |Nomor identitas anggota	    |A001	            |Unik	|Petugas|
nama_anggota	|Nama lengkap anggota	        |Devita sari	    |Wajib	|Petugas
alamat	        |Alamat anggota	|Bandung	    |Wajib	            |Petugas|
no_hp	        |Nomor telepon anggota	        |08123456789	    |Format nomor telepon |Petugas|
email	        |Email anggota	                |devita@email.com	|Format email	|Petugas|
tanggal_daftar	|Tanggal pendaftaran	        |2026-10-02	        |Wajib	|Petugas|
status_anggota	|Status keanggotaan	            |Aktif	            |Aktif/Nonaktif	|Petugas|
id_petugas	    |Identitas petugas      	    |PT001	            |Unik	|Admin|
nama_petugas	|Nama petugas	                |Andi           	|Wajib	|Admin|
peran_petugas	|Peran petugas	                |Admin	            |Nilai terbatas	|Admin|
id_buku	        |Identitas judul buku	        |B001           	|Unik	|Admin|
isbn	        |Nomor |ISBN	9781234567890	|Sesuai             |format ISBN|	Admin|
judul_buku	    |Judul buku	Basis Data Dasar    |Wajib	|Admin|
penulis	Nama    |penulis	|Dedi Irawan	    |Wajib	|Admin|
penerbit	    |Nama penerbit|	Informatika 	|Wajib	|Admin|
tahun_terbit	|Tahun buku diterbitkan	|2025	|Tahun valid|Adm in|
id_kategori	    |Identitas kategori  K001       |Unik	|Admin|
nama_kategori	|Nama kategori buku	Teknologi	|Wajib	|Admin|
id_eksemplar	|Identitas buku fisik	|E001	|Unik	|Petugas|
lokasi_rak	    |Lokasi penyimpanan	|R-A01	|Wajib	|Petugas|
status_eksemplar|Status buku fisik	|Tersedia	|Nilai terbatas	Petugas|
kondisi_buku	|Kondisi fisik buku	Baik	|Baik/Rusak/Hilang	|Petugas|
id_peminjaman	|Identitas transaksi peminjaman	|PJ001	Unik	Petugas|
tanggal_pinjam	|Tanggal peminjaman	2026-10-02	Wajib	|Petugas|
tanggal_jatuh_tempo	|Batas pengembalian	|2026-10-09	Setelah |tanggal pinjam	|Petugas|
id_pengembalian	|Identitas pengembalian	|PG001	|Unik	|Petugas|
tanggal_kembali	|Tanggal buku dikembalikan	|2026-10-10	|Tidak sebelum tanggal| pinjam	|Petugas|
hari_terlambat	|Jumlah hari keterlambatan	|1	|>= 0	|Petugas|
id_denda	    |Identitas denda	|D001	|Unik	|Petugas|
tarif_denda	    |Tarif denda per hari	|3000	|>= 0	|Kepala Perpustakaan|
total_denda	    |Total denda	|3000	Nilai turunan	|Petugas|
status_denda	|Status pembayaran denda	Lunas	|Lunas/Belum Lunas	Petugas|

Kamus data awal tersebut memiliki lebih dari 20 elemen dan setiap elemen mempunyai penanggung jawab. Hal ini sesuai dengan ketentuan milestone Modul 2 yang meminta minimal 20 elemen dengan kolom penanggung jawab.

## 9. Kebutuhan non-fungsional data
# 9.1 Parameter Personal
1. Dua digit terakhir NIM: 13

Perhitungan parameter P:
P = (47 mod 9) + 1
P = 2 + 1
P = 3
Jadi:
P = 3

2. Parameter yang digunakan:
Batas maksimal item per transaksi
P + 2
= 3 + 2
= 5 item
Jadi seorang anggota dapat meminjam maksimal 5 eksemplar dalam satu transaksi.

3. Denda harian

4. Nilai denda berdasarkan parameter:
P = 3

5. Dalam proyek ini digunakan nilai:
Rp3.000 per eksemplar per hari keterlambatan.
Perkiraan volume transaksi harian
40 + (5 × P)
= 40 + (5 × 3)
= 55 transaksi per hari
Dengan demikian, estimasi volume transaksi perpustakaan adalah 55 transaksi per hari.
Buku praktikum menetapkan rumus tersebut dan meminta hasil perhitungan P dicantumkan pada bagian kebutuhan non-fungsional. Nilai P juga digunakan kembali pada modul berikutnya untuk data sampel.

# 9.2 Volume Data
Perpustakaan diperkirakan menangani sekitar 55 transaksi per hari.

Data transaksi yang mengalami pertumbuhan paling cepat adalah:
1. Peminjaman
2. Detail peminjaman
3. Pengembalian
4. Denda

Data master seperti anggota, petugas, judul buku, kategori, dan eksemplar bertambah lebih lambat.
Sistem harus mampu menyimpan riwayat transaksi sehingga data peminjaman dan pengembalian dari periode sebelumnya tetap dapat digunakan untuk kebutuhan laporan.

#  9.3 Retensi Data
Data historis peminjaman dan pengembalian perlu dipertahankan untuk mengetahui riwayat aktivitas anggota dan penggunaan koleksi.
Data denda juga perlu dipertahankan untuk mengetahui riwayat kewajiban anggota.
Data anggota yang sudah tidak aktif tidak langsung dihapus karena masih dapat mempunyai riwayat transaksi.
Dengan demikian, status aktif/nonaktif lebih tepat digunakan daripada menghapus data anggota secara langsung.

# 9.4 Privasi Data
Data anggota tertentu merupakan data pribadi dan harus dibatasi aksesnya.
Data	        |Kategori	        |Pihak yang Boleh Mengakses
Nama anggota	|Data pribadi	    |Petugas, Admin, Kepala Perpustakaan
Alamat	        |Data pribadi	    |Petugas, Admin
Nomor HP	    |Data pribadi	    |Petugas, Admin
Email	        |Data pribadi	    |Petugas, Admin
Anggota biasa tidak boleh melihat data pribadi anggota lain.

### 10. Isu kualitas data yang diantisipasi
10.1 Duplikasi Anggota
Seorang anggota dapat tercatat lebih dari satu kali.

Pencegahan:
Nomor anggota harus unik.
Data anggota harus dicari terlebih dahulu sebelum pendaftaran baru.
Jika memungkinkan, email atau nomor identitas tertentu digunakan sebagai data pembanding.

# 10.2 Data Anggota Tidak Lengkap
Alamat, nomor telepon, atau email dapat kosong.

Pencegahan:
1. Menentukan elemen yang wajib diisi.
2. Memberikan validasi pada formulir pendaftaran.
3. Menampilkan pesan apabila data wajib belum diisi.

# 10.3 Duplikasi Judul Buku
Buku yang sama dapat dimasukkan beberapa kali sebagai judul berbeda.

Pencegahan:
1. Menggunakan ISBN sebagai identifikasi.
2. Melakukan pencarian berdasarkan ISBN atau judul sebelum menambahkan buku baru.

# 10.4 Kesalahan antara Judul Buku dan Eksemplar
Satu judul dapat mempunyai banyak buku fisik. Jika keduanya dicampur menjadi satu data, status ketersediaan buku dapat menjadi tidak akurat.

Pencegahan:
1. Memisahkan entitas Judul Buku dan Eksemplar.
2. Setiap eksemplar mempunyai kode unik.
3. Status peminjaman disimpan pada eksemplar.
Hal ini merupakan perhatian khusus yang diberikan modul untuk tema perpustakaan.

# 10.5 Status Eksemplar Tidak Akurat
Buku dapat tercatat tersedia padahal sedang dipinjam.

Pencegahan:
1. Status eksemplar diperbarui ketika peminjaman.
2. Status dikembalikan menjadi tersedia setelah pengembalian berhasil.
3. Buku rusak/hilang diberi status khusus.

# 10.6 Kesalahan Perhitungan Denda
Jumlah denda dapat tidak sesuai dengan jumlah hari keterlambatan.

Pencegahan:
1. Hari keterlambatan dihitung berdasarkan tanggal jatuh tempo dan tanggal pengembalian.
2. Tarif denda ditetapkan secara konsisten.
3. Total denda dapat dihitung dari jumlah hari terlambat × tarif denda × jumlah eksemplar yang terlambat.

# 10.7 Riwayat Transaksi Terhapus
Penghapusan data anggota atau buku dapat menyebabkan riwayat transaksi menjadi tidak dapat ditelusuri.

Pencegahan:
1. Tidak menghapus transaksi historis.
2. Menggunakan status nonaktif untuk anggota.
3. Menyimpan referensi buku dan eksemplar yang pernah digunakan dalam transaksi.

# 10.8 Kesalahan Data Kategori
Satu buku dapat diberi kategori yang salah atau kategori yang sama dapat ditulis dengan nama berbeda.

Pencegahan:
1. Menggunakan tabel kategori.
2. Memilih kategori dari daftar yang tersedia.
3. Menghindari pengetikan kategori secara bebas pada setiap transaksi.