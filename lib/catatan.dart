class Catatan {
  String Judul;
  String Isi;
  DateTime? tglInput;

  Catatan({required this.Judul, required this.Isi}) {
    tglInput = DateTime.now();
  }
}
