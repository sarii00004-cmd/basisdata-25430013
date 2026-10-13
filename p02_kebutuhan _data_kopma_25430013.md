# Dokumen Kebutuhan Data - <Nama Organisasi>

## 1. Latar belakang dan aktivitas organisasi

Kopma menjual alat tulis, makanan ringan, dan minuman di lingkungan kampus. Pembeli
dapat berupa anggota atau umum. Mahasiswa mendaftar sebagai anggota dengan NIM,
nama, program studi, dan nomor HP, lalu memperoleh nomor anggota berformat A-xxxx.
Anggota aktif memperoleh diskon 5% untuk setiap nota.
Tiga kasir bekerja bergantian per sif. Kasir mencatat penjualan dan mencetak nota. Setiap
sore petugas gudang memeriksa stok; bila stok suatu barang di bawah batas minimum, ia
membuat pesanan pembelian ke pemasok. Ketika barang datang, stok bertambah sesuai
faktur pemasok. Setiap awal bulan, ketua koperasi menerima laporan omzet, barang
terlaris, barang dengan stok menipis, dan anggota paling aktif.
Kutipan wawancara. Ketua: “Harga barang sering naik, jadi kami bingung saat melihat
nota lama.” Petugas gudang: “Kadang di buku catatan stoknya malah minus.” Kasir:
“Anggota sering lupa membawa kartu, jadi kami mencarinya lewat NIM.”

## 2. Aktor dan proses bisnis

Aktor yang terlibat dalam aktivitas organisasi adalah:

- kasir (atas permintaan mahasiswa)
- kasir
- petugas gudang
- petugas gudang
- ketua koperasi

### Tabel PB-xx. Proses Bisnis

| Kode  | Proses Bisnis | Aktor | Pemicu |
| PB-01 | Mendaftarkan anggota | Kasir (atas permintaan mahasiswa) | Mahasiswa ingin menjadi anggota |
| PB-02 | Mencatat penjualan | Kasir | Pembeli membayar dikasir |
| PB-03 | Memesan  barang ke pemasok | Petugas gudang | Stok dibawah batas minimum |
| PB-04 | Menerima barang dari pemasok | Petugas gudang | Barang datang bersama faktur |
| PB-05 | Menyusun laporan bulanan | Ketua koperasi | Awal bulan |

### 3.1 membedah dokumen
# Nota penjualan

No.	Nama Field	       Isi Data
1	No. Nota	           PJ-2609-0142
2	Tanggal	             24-09-2026 10:15
3	Kasir	               Rina (K03)
4	Anggota	             A-0457 / Budi S.
5	Jumlah	             Rp29.000
6	Diskon anggota 5% 	 Rp1.450
7	Total	               Rp27.550
8	Bayar tunai       	 Rp30.000
9	Kembalian	           Rp2.450

### 3.2 
# Nota pembelian

No.	Nama Field	      Isi Data
1	No. Nota	          PB-2609-0078
2	Tanggal	            20-09-2026 14:30
3	Pemasok	            CV. Maju Jaya
4	No. Faktur	        FJ-0987
5	Jumlah pembelian	  Rp435.000
6	Diskon	            Rp0
7	PPN 11%	            Rp47.850
8	Total	              Rp482.850
### 3.3 
# Bukti transaksi

No.	Nama Field	      Isi Data
1	No. Transaksi	      TRX-2609-0031
2	Tanggal	            24-09-2026 10:15
3	Jenis Transaksi	    Penjualan
4	Kasir	              Rina (K03)
5	Anggota	            A-0457 / Budi S.
6	Jumlah	            Rp29.000
7	Diskon	            Rp1.450
8	Total Pembayaran	  Rp27.550
9	Metode Pembayaran	  Tunai
10	Uang Diterima	    Rp30.000
11	Kembalian	        Rp2.450
12	Status	          Lunas

### Tabel Entitas Kandidat

| Entitas Kandidat | Elemen Data Utama | Sumber |
| Anggota | nomor anggota, NIM, nama, program studi, nomor HP, status aktif | Formulir pendaftaran |
| Barang | kode, nama, kategori, harga jual, stok, batas minimum stok | Daftar barang faktur |
| Penjualan | nomor nota, tanggal-jam, kasir, anggota (opsional), bayar | Nota penjualan |
| Detail penjualan | nomor nota, barang, qty, harga saat transaksi | Nota penjualan |
| Petugas | Kode petugas,nama,peran (kasir/gudang/ketua) | Wawancara |
| Pemasok | Kode, nama, telepon, alamat | Faktur pemasok |
| Pembelian dan detailnya | Nomor faktur, tanggal, pemasok, barang, qty, harga beli | Faktur pemasok |

### Tabel AB-xx. Aturan Bisnis

| Kode | Aturan Bisnis |
| AB-01 | Setiap nota memiliki nomor unik dan minimal satu baris barang. | 
| AB-02 | Penjualan boleh tanpa anggota (pembeli umum); jika ada, anggota harus berstatus aktif untuk memperoleh diskon 5%. |
| AB-03 | Stok barang tidak boleh negatif; penjualan ditolak bila qty melebihi stok tersedia. |
| AB-04 | Harga jual yang dipakai pada nota disimpan per baris dan tidak berubah meski harga barang
kemudian naik. |
| AB-05 | NIM anggota unik; pencarian anggota dapat dilakukan lewat nomor anggota atau NIM. |
| AB-06 | Pesanan pembelian dibuat bila stok kurang dari batas minimum barang tersebut. |

### Tabel KI-xx. Kebutuhan Informasi

| Kode | Kebutuhan Informasi | Data yang Diperlukan |
| KI-01 | Omzet dan jumlah nota per hari dan per bulan | Penjualan, detail penjualan |
| KI-02 | Lima barang terlaris per bulan berdasarkan qty | Detail penjualan, barang |
| KI-03 | Barang dengan stok di bawah batas minimum | Barang |
| KI-04 | Sepuluh anggota dengan belanja terbesar per bulan | Penjualan, detail penjualan, anggota |

### Matriks CRUD Proses Bisnis terhadap Entitas

| Proses                  | Anggota | Barang | Penjualan | Detail | Pemasok | Pembelian |
| PB-01 Daftar anggota    | C       | -      | -         | -      | -       | -         |
| PB-02 Catat penjualan   | R       | R,U    | C         | C      |         |           |
| PB-03 Pesan ke pemasok  | -       | R      | -         | -      | R       | C         |
| PB-04 Terima barang     | -       | U      | -         | -      | R       | U         |
| PB-05 Laporan bulanan   | R       | R      | R         | R      | -       | R         |

### Tabel Kamus Data

| Elemen | Arti | Contoh | Aturan | Penanggung Jawab |

| no_anggota | Nomor anggota koperasi | A-0457 | Unik, format A-4 digit | Ketua |
| nim_anggota | NIM anggota | 2301010123 | Unik, 10 digit | Ketua |
| no_hp_anggota | Nomor HP anggota | 0812xxxx | Data pribadi, akses terbatas | Ketua |
| no_nota_penjualan | Nomor nota penjualan | PJ-2609-0142 | Unik per nota | Kasir |
| harga_satuan_detail_penjualan | Harga jual saat transaksi | 4000 | Bilangan bulat ≥ 0 (rupiah) | Kasir |
| stok_barang | Jumlah barang tersedia | 35 | Bilangan bulat ≥ 0 (AB-03) | Petugas | gudang |
