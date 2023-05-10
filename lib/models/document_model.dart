class Document {
  String? doc_title;
  String? doc_url;
  String? doc_date;
  int? page_num;

  Document(this.doc_title, this.doc_url, this.doc_date, this.page_num);
  static List<Document> doc_list = [
    Document(
        "Java for beginners",
        "javatuto.pdf",
        "20-02-2023",
        32),
    Document(
        "Python for beginners",
        "https://python.sdv.univ-paris-diderot.fr/cours-python.pdf",
        "20-02-2023",
        298),
    Document(
        "Flutter for beginners",
        "https://www.tutorialspoint.com/flutter/flutter_tutorial.pdf",
        "20-02-2023",
        185)
  ];
}
