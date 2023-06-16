

class BookInfo {
  String? nameBook;
  String? path;
  String? actor;
  int? iconId;
  int? chapter;
  bool haveBookMark;

  BookInfo({required this.nameBook, required this.actor, required this.iconId,required this.path,required this.chapter, this.haveBookMark = false});

  bool getBookMark(int? page) {
    if(page != null && page > -1){
      return true;
    }else{
      return false;
    }
  }
}
