class Sepatu {
  int idSepatu;
  String nama;
  String tipe;
  int ukuran;
  String deskripsi;
  String gender;
  int harga;
  int stok;
  String gambar;

  Sepatu(
      {this.idSepatu,
      this.nama,
      this.tipe,
      this.ukuran,
      this.deskripsi,
      this.gender,
      this.harga,
      this.stok,
      this.gambar});

  Sepatu.fromJson(Map<String, dynamic> json) {
    idSepatu = json['id_sepatu'];
    nama = json['nama'];
    tipe = json['tipe'];
    ukuran = json['ukuran'];
    deskripsi = json['deskripsi'];
    gender = json['gender'];
    harga = json['harga'];
    stok = json['stok'];
    gambar = json['gambar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_sepatu'] = this.idSepatu;
    data['nama'] = this.nama;
    data['tipe'] = this.tipe;
    data['ukuran'] = this.ukuran;
    data['deskripsi'] = this.deskripsi;
    data['gender'] = this.gender;
    data['harga'] = this.harga;
    data['stok'] = this.stok;
    data['gambar'] = this.gambar;
    return data;
  }
}

