

class APIPath {
  static String demand(String uid, String demandId) => 'users/$uid/demands/$demandId';
  static String demands(String uid) => 'users/$uid/demands';

  static String user(String uid, String userInfosId) => 'users/$uid/userInfos/$userInfosId';
  //static String demands(String uid) => 'users/$uid/demands';
}