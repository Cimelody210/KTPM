// import 'package:firebase_database/firebase_database.dart';

// class User{

//   String fullname;
//   String phone;
//   String email;
//   String address;
//   String url;
//   User({
//     required this.fullname,
//     required this.phone,
//     required this.email,
//     required this.address,
//     required this.url
//   });


//    final DatabaseReference _databaseReference = FirebaseDatabase(
//     databaseURL:
//         'https://tmdt-bangiay-default-rtdb.asia-southeast1.firebasedatabase.app/',
//   ).ref();
//   List<Map<dynamic, dynamic>> Lst_user = [];
//   // lấy dữ liệu từ firebase
//   factory User.fromSnapshot(DataSnapshot snapshot) {
//     Map<dynamic, dynamic> data = snapshot.value as Map;
//     return User(
//       fullname: data['info']['fullname'],
//       phone: data['info']['phone'],
//       email: data['info']['email'],
//       address: data['info']['address'],
//       url: data['info']['url'],
//     );
//   }
//   //---------------------------------------
//   // load dữ liệu
//   Future<void> _loadData() async {
//     try {
//       DatabaseEvent _event = await _databaseReference.once();
//       DataSnapshot? _dataSnapshot = _event.snapshot;
//       if (_dataSnapshot != null && _dataSnapshot.value != null) {
//         Map<dynamic, dynamic> data = (_dataSnapshot.value as Map)['users'];
//         data.forEach((key, value) {
//           Lst_user.add(value);
//         });
//         // print(lst_cat);
//         // print(lst_cat[0]['namepro']);
//       }
      
//     } catch (e) {
//       print(e.toString());
//     }
//   }
  
//   // gán
//     // name = lst_users[0]['info']['fullname'];
//     // url = lst_users[0]['info']['url'];
//   // edit data
//   // void editData() async {
//   //   await _databaseReference.child('users').child('user0').child('info').set({
//   //     'fullname': fullname,
//   //     'email':email,
//   //     'phone':phone,
//   //     'address':address
//   //   }
      
//   //   );
//   // }
  
// }