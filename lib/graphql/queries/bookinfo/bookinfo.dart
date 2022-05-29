class BooksInfoQueries {
  BooksInfoQueries._();

  static const String getBooksInfoById = r'''
  query getBookById($book_id: Int!) {
  books(where: {id: {_eq: $book_id}}) {
    id
    isbn
    title
    author_id
    thumbnail
  }
}
''';

  static const String getBooksInfoPaginated = r'''
  query getBooksPaginated($limit: Int, $offset: Int) {
    books(limit: $limit, offset: $offset) {
      id
      isbn
      title
      author_id
      thumbnail
    }
    }
  ''';

  static const getBooksInfoPaginatedBySearch = r'''
  query getBookPaginatedBySearchKeyword($search: String, $limit: Int, $offset: Int) {
    books(where: {title: {_like: $search}}, limit: $limit, offset: $offset) {
      id
      isbn
      title
      author_id
      thumbnail
    }
    }
  ''';

  static const getBooksInfoAll = r'''
query getBookinfoAll {
 list:  books {
    id
    isbn
    title
    author_id
    thumbnail
    author{
      id
      first_name
      last_name
      email
    }
  }
}
''';

// /create book mutation
  static const createBooksInfo = r'''
  mutation createBook($isbn: String!, $title: String!, $author_id: Int!, $thumbnail: String!, $price: Int!, $rating: Int!) {
    insert_books(objects: {isbn: $isbn, title: $title, author_id: $author_id, thumbnail: $thumbnail, price: $price, rating: $rating}) {
      returning {
        id
        isbn
        title
        author_id
        thumbnail
        price
        rating
      }
    }
  }
  ''';

  // update books mutation
  static const updateBooksInfo = r'''
  mutation updateBook($id: Int!, $isbn: String, $title: String, $author_id: Int, $thumbnail: String) {
    update_books(
      where: {id: {_eq: $id}},
     _set: {isbn: $isbn, title: $title, author_id: $author_id, thumbnail: $thumbnail}) {
      returning {
        id
        isbn
        title
        author_id
        thumbnail
      }
    }
  }
  ''';

  // delete books mutation by id
  static const deleteBooksInfo = r'''
  mutation deleteBook($id: Int!) {
    delete_books(where: {id: {_eq: $id}}) {
      returning {
        id
      }
    }
  }
  ''';
}
