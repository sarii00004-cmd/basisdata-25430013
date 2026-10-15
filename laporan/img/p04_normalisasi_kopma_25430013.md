### D.1 Dari UNF ke 1NF
## 1. Menuliskan relasi spreadsheet lama dalam bentuk UNF
Bentuk Unnormalized Form (UNF) merupakan bentuk data yang masih memiliki grup berulang. Pada data penjualan Kopma, satu nota dapat menyimpan beberapa barang beserta jumlah, harga satuan, dan subtotal masing-masing barang. Hal ini sesuai dengan aturan bisnis AB-01, yaitu setiap nota memiliki nomor unik dan minimal satu baris barang. p02_kebutuhan _data_kopma_25430013.md

Contoh struktur UNF:
NOTA_UNF (
    no_nota_penjualan,
    tgl_penjualan,
    kode_petugas,
    nama_petugas,
    no_anggota,
    nama_anggota,
    {
        kode_barang,
        nama_barang,
        qty_detail_penjualan,
        harga_satuan_detail_penjualan,
        subtotal_detail_penjualan
    },
    jumlah_penjualan,
    diskon_penjualan,
    total_penjualan
)
Keterangan:
- no_nota_penjualan merupakan nomor unik setiap nota.
- kode_petugas dan nama_petugas menunjukkan kasir yang melayani transaksi.
- no_anggota dan nama_anggota mencatat anggota apabila pembeli merupakan anggota koperasi.
- Grup {...} menunjukkan data barang yang dapat berulang dalam satu nota.
- jumlah_penjualan, diskon_penjualan, dan total_penjualan merupakan informasi total transaksi.
## 2. Menghilangkan grup berulang menjadi 1NF
Pada tahap ini, grup barang yang berulang dipisahkan sehingga satu baris hanya mewakili satu barang dalam satu nota. Setiap atribut memiliki nilai atomik dan tidak berisi daftar beberapa barang dalam satu kolom.
Struktur relasi setelah diubah menjadi 1NF:
NOTA_1NF (
    no_nota_penjualan,
    kode_barang,
    tgl_penjualan,
    kode_petugas,
    nama_petugas,
    no_anggota,
    nama_anggota,
    nama_barang,
    qty_detail_penjualan,
    harga_satuan_detail_penjualan,
    subtotal_detail_penjualan,
    jumlah_penjualan,
    diskon_penjualan,
    total_penjualan
)
Kunci primer komposit:
(no_nota_penjualan, kode_barang)
Kunci tersebut digunakan dengan asumsi bahwa satu barang hanya dicatat satu kali dalam satu nota. Jika barang yang sama boleh muncul pada beberapa baris dalam satu nota, diperlukan atribut tambahan seperti no_urut_detail sebagai bagian dari kunci primer.
Contoh tabel 1NF:
|no_nota_penjualan|kode_barang|nama_barang|qty_detail_penjualan|harga_satuan_detail_penjualan |subtotal_detail_penjualan
|PJ-2609-0142	|BRG001	|Buku Tulis	|2	|5.000	|10.000
|PJ-2609-0142	|BRG002	|Pulpen	    |3	|4.000	|12.000
|PJ-2609-0142	|BRG003	|Penghapus	|1	|7.000	|7.000

### D.2 Menuliskan Dependensi Fungsional
Dependensi fungsional diturunkan dari aturan bisnis yang telah ditentukan pada Pertemuan 2, bukan hanya berdasarkan isi spreadsheet. Dependensi fungsional menjelaskan hubungan antara atribut penentu (determinant) dengan atribut yang nilainya ditentukan.
FD1: no_nota_penjualan
     -> tgl_penjualan, kode_petugas, no_anggota
     (AB-01)

FD2: kode_petugas
     -> nama_petugas

FD3: no_anggota
     -> nama_anggota
     (AB-05)

FD4: kode_barang
     -> nama_barang

FD5: (no_nota_penjualan, kode_barang)
     -> qty_detail_penjualan,
        harga_satuan_detail_penjualan
     (AB-04)

FD6: (qty_detail_penjualan,
      harga_satuan_detail_penjualan)
     -> subtotal_detail_penjualan
     (turunan)

     Keterangan
1. FD1: Nomor nota menentukan tanggal penjualan, petugas yang melayani, dan anggota yang melakukan transaksi.
2. FD2: Kode petugas menentukan nama petugas yang bertugas sebagai kasir.
3. FD3: Nomor anggota menentukan nama anggota. NIM anggota juga bersifat unik sesuai AB-05.
4. FD4: Kode barang menentukan nama barang.
5. FD5: Kombinasi nomor nota dan kode barang menentukan jumlah barang serta harga satuan yang digunakan dalam transaksi. Harga satuan disimpan sesuai AB-04 agar tidak berubah ketika harga barang diperbarui.
6. FD6: Subtotal detail penjualan merupakan nilai turunan yang dihitung dari jumlah barang dikalikan harga satuan.
Rumus subtotal:
                subtotal ={qty} {harga satuan}

### D.3 Menuju 2NF dan 3NF
## 4. 2NF (Second Normal Form)
Pada tahap 2NF, FD1 dan FD4 hanya bergantung pada sebagian kunci komposit. Oleh karena itu, atribut yang bergantung pada nomor nota dipisahkan ke relasi penjualan, sedangkan atribut yang bergantung pada kode barang dipisahkan ke relasi barang. Atribut yang tersisa menjadi relasi detail penjualan.
## 5. 3NF (Third Normal Form)
Pada tahap 3NF, ketergantungan transitif dihilangkan. Dalam relasi penjualan terdapat ketergantungan no_nota_penjualan → kode_petugas → nama_petugas dan no_nota_penjualan → no_anggota → nama_anggota. Oleh karena itu, data petugas dan anggota dipisahkan menjadi relasi tersendiri agar tidak terjadi pengulangan data.
## 6. Nilai Turunan
Atribut subtotal_detail_penjualan, jumlah_penjualan, dan total_penjualan merupakan nilai turunan yang dapat dihitung dari data detail penjualan dan aturan diskon anggota. Nilai tersebut tidak disimpan sebagai atribut permanen dalam tabel operasional agar mengurangi risiko ketidakkonsistenan data.

Hasil relasi setelah normalisasi
PENJUALAN (
    no_nota_penjualan,
    tgl_penjualan,
    kode_petugas*,
    no_anggota*,
    bayar_penjualan
)

DETAIL_PENJUALAN (
    no_nota_penjualan*,
    kode_barang*,
    qty_detail_penjualan,
    harga_satuan_detail_penjualan
)

BARANG (
    kode_barang,
    nama_barang,
    kategori_barang,
    harga_jual_barang,
    stok_barang,
    stok_min_barang
)

PETUGAS (
    kode_petugas,
    nama_petugas,
    peran_petugas
)

ANGGOTA (
    no_anggota,
    nim_anggota,
    nama_anggota,
    prodi_anggota,
    no_hp_anggota,
    status_anggota,
    tgl_daftar_anggota
)
Keterangan kunci:
- no_nota_penjualan adalah kunci primer pada tabel PENJUALAN.
- (no_nota_penjualan, kode_barang) adalah kunci primer komposit pada tabel DETAIL_PENJUALAN, dengan asumsi satu barang dicatat satu kali per nota.
- kode_barang adalah kunci primer pada tabel BARANG.
- kode_petugas adalah kunci primer pada tabel PETUGAS.
- no_anggota adalah kunci primer pada tabel ANGGOTA.
- Tanda * menunjukkan kunci tamu (foreign key).

### D.4 Mencocokkan dengan Skema Kanonik
## 7. Membandingkan hasil normalisasi dengan skema kanonik Kopma
Skema kanonik menggunakan kunci pengganti (surrogate key) sebagai kunci primer, sedangkan kode alami seperti no_nota_penjualan digunakan sebagai kunci unik. Berikut tabel pencocokan skema kanonik berdasarkan gambar acuan.
Tabel 1. Pencocokan skema relasional dengan skema kanonik
|Tabel	             |Kunci primer	           |Kunci unik	             |Kunci tamu
|barang	             |id_barang	               |kode_barang	             |—
|pemasok	         |id_pemasok	           |—	                     |—
|petugas	         |id_petugas	           |kode_petugas             |—
|anggota	         |id_anggota	           |no_anggota, nim_anggota	 |—
|penjualan	         |id_penjualan	           |no_nota_penjualan	     |id_petugas, id_anggota (boleh NULL)
|detail_penjualan	 |(id_penjualan, id_barang)|—	                     |id_penjualan, id_barang
|pembelian	         |id_pembelian	           |—	                     |id_pemasok
|detail_pembelian	 |(id_pembelian, id_barang)|—	                     |id_pembelian, id_barang
## 8. Pemeriksaan BCNF
BCNF (Boyce-Codd Normal Form) mensyaratkan bahwa setiap penentu (determinant) dalam dependensi fungsional nontrivial harus merupakan kunci kandidat.
|Tabel	                 |Penentu yang diperiksa	          |Hasil
|barang	                 |id_barang, kode_barang	          |Memenuhi BCNF karena keduanya mengidentifikasi barang secara unik.
|pemasok                 |id_pemasok	                      |Memenuhi BCNF berdasarkan kunci primer yang tersedia.
|petugas                 |id_petugas, kode_petugas	          |Memenuhi BCNF karena kode petugas merupakan kunci unik.
|anggota                 |id_anggota, no_anggota, nim_anggota |Memenuhi BCNF karena atribut tersebut merupakan kunci unik.
|penjualan               |id_penjualan, no_nota_penjualan	  |Memenuhi BCNF karena nomor nota bersifat unik.
|detail_penjualan        |(id_penjualan, id_barang)	          |Memenuhi BCNF karena pasangan tersebut merupakan kunci primer komposit dan tidak memiliki atribut nonkunci.
|pembelian	             |id_pembelian                        |Memenuhi BCNF berdasarkan kunci primer yang tersedia.
|detail_pembelian        |(id_pembelian, id_barang)	          |Memenuhi BCNF karena pasangan tersebut merupakan kunci primer komposit dan tidak memiliki atribut nonkunci.