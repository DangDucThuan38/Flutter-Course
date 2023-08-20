import 'dart:async';

// Future<String> fetchUsername(){
//   return Future.delayed(Duration(seconds: 3),()=>'Nguyen Van A');
// }
//
// void main(){
//   fetchUsername().then((username){
//     print('User name : $username');
//   });
// }
Future<String> fetchUsernameAsnyc() async{
  await Future.delayed(Duration(seconds: 3));
  return 'Phan Van B';
}
Future<void> main() async{
  try{
    String username =await fetchUsernameAsnyc();
    print('Username: $username');

}catch(err){
    print('Error: $err');
}
}