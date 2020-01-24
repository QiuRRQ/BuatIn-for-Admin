
class Pemesanan {
  static final String columnDomain = "";
  static final String columnHarga = "";
  static final String columnLayanan = "";
  static final String columnStatus = "";
  static final String columnTemplate = "";
  static final String columnUid = "";
  static final String columnDocumentId = "";

  Pemesanan({
    this.uid,
    this.status,
    this.template,
    this.layanan,
    this.domain,
    this.harga,
    this.documentId
  });

  final String domain;
  final String harga;
  final String template;
  final String layanan;
  final String status;
  final String uid;
  final String documentId;

  Map toMap() {
    Map<String, dynamic> map = {
      columnDomain: domain,
      columnHarga: harga,
      columnLayanan: layanan,
      columnStatus: status,
      columnTemplate: template,
      columnUid: uid,
      columnDocumentId: documentId
    };

    return map;
  }

  static Pemesanan fromMap(Map map) {
    return new Pemesanan(
        harga: map[columnHarga],
        domain: map[columnDomain],
        layanan: map[columnLayanan],
        template: map[columnTemplate],
        status: map[columnStatus],
        documentId: map[columnDocumentId],
        uid: map[columnUid]);
  }
}