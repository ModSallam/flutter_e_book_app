import 'package:equatable/equatable.dart';

class RequestedBook extends Equatable {
  final String? error;
  final String? title;
  final String? subtitle;
  final String? authors;
  final String? publisher;
  final String? language;
  final String? isbn10;
  final String? isbn13;
  final String? pages;
  final String? year;
  final String? rating;
  final String? desc;
  final String? price;
  final String? image;
  final String? url;
  // final Pdf? pdf;

  const RequestedBook({
    required this.error,
    required this.title,
    required this.subtitle,
    required this.authors,
    required this.publisher,
    required this.language,
    required this.isbn10,
    required this.isbn13,
    required this.pages,
    required this.year,
    required this.rating,
    required this.desc,
    required this.price,
    required this.image,
    required this.url,
    // required this.pdf,
  });

  factory RequestedBook.fromMap(Map<String, dynamic> map) {
    return RequestedBook(
      error: map['error'],
      title: map['title'],
      subtitle: map['subtitle'],
      authors: map['authors'],
      publisher: map['publisher'],
      language: map['language'],
      isbn10: map['isbn10'],
      isbn13: map['isbn13'],
      pages: map['pages'],
      year: map['year'],
      rating: map['rating'],
      desc: map['desc'],
      price: map['price'],
      image: map['image'],
      url: map['url'],
      // pdf: map['pdf'] != null ? Pdf.fromMap(map['pdf']) : null,
    );
  }

  @override
  List<Object?> get props => [
        error,
        title,
        subtitle,
        authors,
        publisher,
        language,
        isbn10,
        isbn13,
        pages,
        year,
        rating,
        desc,
        price,
        image,
        url,
        // pdf,
      ];
}

// class Pdf extends Equatable {
//   final String? chapter2;
//   final String? chapter5;

//   const Pdf({
//     required this.chapter2,
//     required this.chapter5,
//   });

//   factory Pdf.fromMap(Map<String, dynamic> map) {
//     return Pdf(
//       chapter2: map['chapter2'],
//       chapter5: map['chapter5'],
//     );
//   }

//   @override
//   List<Object?> get props => [chapter2, chapter5];
// }
