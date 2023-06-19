

class BookInfo {
  String? nameBook;
  String? path;
  String? actor;
  int? iconId;
  int? chapter;
  bool haveBookMark;
  String? assetsFile;

  BookInfo({required this.nameBook, required this.actor, required this.iconId,required this.path,required this.chapter, this.haveBookMark = false, required this.assetsFile});

  bool getBookMark(int? page) {
    if(page != null && page > -1){
      return true;
    }else{
      return false;
    }
  }
}
