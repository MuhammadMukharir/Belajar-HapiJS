-- Membuat Koneksi ke Database
-- Untuk melakukan koneksi dengan PostgreSQL, 
-- node-postgres memiliki dua cara yakni dengan menggunakan Client dan Pool.

-- Perbedaan di antara kedua cara ini adalah kasus penggunaannya. 

-- Jika aplikasi jarang terjadi pengaksesan terhadap database, cara client adalah pilihan yang tepat. 
-- Karena dia hanya bekerja dengan satu kali transaksi saja. Setiap transaksi yang akan dilakukan,
-- Anda perlu membuka koneksi melalui client.connect() dan menutup koneksi ketika transaksi selesai client.end().

-- Cara pool menjadi pilihan tepat bila aplikasi Anda seringkali melakukan transaksi ke database. 
-- Karena dengan pool kita tidak perlu membuka koneksi dan menutup koneksi secara manual. 
-- Ketahuilah bahwa ketika client membuka koneksi ke PostgreSQL server, 
-- maka dibutuhkan waktu setidaknya 20-30 milliseconds. Bila transaksi database sering terjadi, 
-- maka akan sering juga buka tutup koneksi terjadi, tentu dari segi waktu ini kurang efektif.

-- CREATE
CREATE TABLE karyawan (
   id VARCHAR(8) PRIMARY KEY,
   nama_lengkap VARCHAR(30) NOT NULL,
   email VARCHAR(50) UNIQUE NOT NULL,
   alamat TEXT
);

-- INSERT
INSERT INTO karyawan(id, nama_lengkap, email, alamat)
VALUES ('DCD001', 'Dimas Maulana', 'dimas@dicoding.com', 'Batik Kumeli No. 50 Bandung');

-- fail coz must unique email
INSERT INTO karyawan(id, nama_lengkap, email, alamat)
VALUES ('DCD002', 'Dimas Saputra', 'dimas@dicoding.com', 'Batik Kumeli No. 50 Bandung');

-- shorthand INSERT
INSERT INTO karyawan VALUES ('DCD002', 'Gilang Ramadhan', 'gilang@dicoding.com', 'Batik Kumeli No. 50 Bandung');

-- SELECT
SELECT id, nama_lengkap, email, alamat FROM karyawan;
SELECT * FROM karyawan;
SELECT * FROM karyawan WHERE nama_lengkap = 'Gilang Ramadhan';

-- UPDATE
UPDATE karyawan
SET nama_lengkap = 'Gilang Ramadan'
WHERE id = 'DCD002';
-- Ketahui juga bahwa penggunaan kueri UPDATE harus selalu diikuti dengan sebuah kondisi. 
-- Hal ini bertujuan untuk menghindari kesalahan dalam memperbarui data. 
-- Contohnya, bila kita tidak menggunakan WHERE id = ‘DCD002’, 
-- maka seluruh nama_lengkap karyawan akan berubah menjadi Gilang Ramadan. 
-- Ini sangat bahaya dan tak jarang terjadi pada kasus nyata.

-- DELETE
DELETE FROM karyawan WHERE id = 'DCD001';
-- Sama seperti kueri UPDATE, penggunaan DELETE harus selalu diikuti dengan sebuah kondisi.
-- Hal ini bertujuan untuk menghindari kesalahan dalam penghapusan data. 
-- Jangan sampai, seluruh karyawan resign karena Anda salah menuliskan kueri ya.
