class ResturantQueries {
  ResturantQueries._();

//   static const String getBookById = r'''
//   query getBookById($book_id: Int!) {
//   books(where: {id: {_eq: $book_id}}) {
//     id
//     isbn
//     title
//     author_id
//     thumbnail
//   }
// }
// ''';

  static const String getResturantsPaginated = r'''
  query getResturantsPaginated($limit: Int, $offset: Int){
  resturants_names(limit: $limit, offset: $offset){
    id
    name
    location
    item{
      id
      items
    }
  }
}
  ''';

  // static const getBooksPaginatedBySearchKeyword = r'''
  // query getBookPaginatedBySearchKeyword($keyword: String, $limit: Int, $offset: Int) {
  //   books(where: {title: {_like: $keyword}}, limit: $limit, offset: $offset) {
  //     id
  //     isbn
  //     title
  //     author_id
  //     thumbnail
  //   }
  //   }
  // ''';

  static const getItemsAll = r'''
   query getItemsAll {
  list: resturants_items{
    id
    items
  }
}
''';

  static const getVariantsAll = r'''
   query getVariantsAll {
  list:  resturants_variants{
    id
    variants
  }
}
''';

  static const getResturantsAll = r'''
  query getResturantsAll {
  list: resturants_names{
    id
    name
    location
    item{
      id
      items
    }
  }
}
''';
}
