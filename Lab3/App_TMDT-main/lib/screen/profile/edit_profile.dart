

import 'dart:io';
import 'dart:typed_data';

import 'package:doan_tmdt/model/err_dialog.dart';
import 'package:doan_tmdt/screen/profile/profile_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {

  final TextEditingController fullname = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController address = TextEditingController();
  String url = '';
  String newURL ="";
  String linkanh = '';

    final DatabaseReference _databaseReference = FirebaseDatabase(
      databaseURL:
          'https://tmdt-bangiay-default-rtdb.asia-southeast1.firebasedatabase.app/',
    ).ref();

    List<Map<dynamic, dynamic>> lst_users = [];
    List<Map<dynamic, dynamic>> infoTitle = [];
    //---------------------------------------------
    Future<void> _loadData() async {
    try {
      DatabaseEvent _event = await _databaseReference.once();
      DataSnapshot? _dataSnapshot = _event.snapshot;
      if (_dataSnapshot != null && _dataSnapshot.value != null) {
        Map<dynamic, dynamic> data = (_dataSnapshot.value as Map)['infomation'];
        data.forEach((key, value) {
          lst_users.add(value);
        });
      }
      String UID = getUserUIDString();
      for( var element in lst_users)
      {
       print("Đây là key: " + element.keys.toString());
       String UIDS = "($UID)";
       print("Đây là UID: "+ UIDS);
       
        if(element.keys.toString() == UIDS){
          infoTitle.add(element);
        }
      }
     
      setState(() {
        
      });
      updateUI();
    } catch (e) {
      print(e.toString());
      
    }
     print(lst_users);
     print("------------------0");
     print(infoTitle);
     String ID = getUserUIDString();
    print("đây là ID: "+ID);
  }
  

  String getUserUIDString() {
  User? user = FirebaseAuth.instance.currentUser;

  if (user != null) {
    // Kiểm tra xem user có khác null không trước khi truy cập thuộc tính uid
    String userUID = user.uid;
    return userUID;
  }
  // Trả về một giá trị mặc định hoặc chuỗi trống tùy thuộc vào yêu cầu của bạn
  return ''; // hoặc return 'Giá trị mặc định';
}
bool isValidPhoneNumber(String input) {
    final RegExp regex = RegExp(r'^[0-9]{10}$');
    return regex.hasMatch(input);
  }
 bool isValidGmail(String input) {
    // Biểu thức chính quy kiểm tra xem chuỗi là địa chỉ email Gmail hợp lệ hay không
    final RegExp regex = RegExp(r'^[a-zA-Z0-9._%+-]+@gmail\.com$');
    return regex.hasMatch(input);
  }
  
  void editData() async {
    String ID = getUserUIDString();
    print("đây là ID"+ID);
    
    setState(() {
      if(newURL!='')
       url = newURL;
  });
    await _databaseReference.child('infomation').child(ID).child(ID).set({
      'fullname': fullname.text,
      'email':email.text,
      'phone':phone.text,
      'address':address.text,
      'url': url
     }    
    );
  }
  void updateUI() {
  String ID = getUserUIDString();
  setState(() {
    fullname.text = infoTitle[0][ID]['fullname'];
    phone.text = infoTitle[0][ID]['phone'];
    email.text = infoTitle[0][ID]['email'];
    address.text = infoTitle[0][ID]['address'];
    url = infoTitle[0][ID]['url'];
  });
}
  //------------------------------------
  // void editData() async {
  //   await _databaseReference.child('users').child('user0').child('info').set({
  //     'fullname': fullname.text,
  //     'email':email.text,
  //     'phone':phone.text,
  //     'address':address.text,
  //     'url': url
  //   }
      
  //   );
  // }  
  
    @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadData();
  }
  @override
  Widget build(BuildContext context) {
    String ID = getUserUIDString();
    try{
    // name = infoTitle[0][ID]['fullname'];
      // fullname.text = infoTitle[0][ID]['fullname'];
      // phone.text = infoTitle[0][ID]['phone'];
      // email.text = infoTitle[0][ID]['email'];
      // address.text = infoTitle[0][ID]['address'];
      // url = infoTitle[0][ID]['url'];
      //name = infoTitle[0]['fullname'];
      // name = lst_users[0]['-NoDL5o87-Gj7rEwKmvB']['fullname'];
      // url = lst_users[0]['-NoDL5o87-Gj7rEwKmvB']['url'];
    }catch(e){
      print(e.toString());
    }
    return 
    Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile',style: TextStyle(color: Colors.white),),
        leading: IconButton(
          icon: Icon(Icons.arrow_back,color: Colors.white,),
          onPressed: () {
            // Xử lý khi nút arrow_back được nhấn
            Navigator.pop(context);
          },
        ),
        backgroundColor: const Color.fromRGBO(46, 91, 69, 1),
      ),
      backgroundColor: Color(0xFFD2EDE0),
      body: SingleChildScrollView(
        child: Center(
        child:Column(
          //mainAxisAlignment: MainAxisAlignment.center, // Căn giữa theo chiều dọc
          crossAxisAlignment: CrossAxisAlignment.center, // Căn giữa theo chiều ngang
          children: [
            Stack(
              children: [
                InkWell(
                  onTap: () async{
                    // Xử lý sự kiện
                    String? imageUrl = await pickAndUploadImageToFirebase();
                        if (imageUrl != null) {
                          setState(() {
                            newURL = imageUrl;
                          });
                          
                          print('link Ảnh: $imageUrl');
                          print('link url:$url');
                          print('new URl $newURL');
                        } else {
                          print('Image upload failed.');
                        }
                    //_pickImage();
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: const Color.fromARGB(255, 237, 173, 173), 
                        width: 3.0, 
                      ),
                    ),
                    child: ClipOval(
                     child: url != null && url.isNotEmpty
                      ? Image.network(
                          newURL == '' ? url : newURL,
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        )
                      : Container(
                          // Thay thế bằng một widget hoặc hiệu ứng khác khi không có URL hợp lệ
                          color: Colors.grey, // Ví dụ: Màu xám
                        ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: IconButton(
                    icon: Icon(Icons.edit),
                    color: Colors.white,
                    onPressed: ()async {
                      // Xử lý sự kiện khi nút chỉnh sửa được nhấn
                       String? imageUrl = await pickAndUploadImageToFirebase();
                        if (imageUrl != null) {
                          setState(() {
                            newURL = imageUrl;
                          });
                          
                          print('link Ảnh: $imageUrl');
                          print('link url:$url');
                          print('new URl $newURL');
                        } else {
                          print('Image upload failed.');
                        }
                    },
                  ),
                )
              ],
            ),
            SizedBox(height: 20,),
            Column(
              //mainAxisAlignment: MainAxisAlignment.center, // Căn giữa theo chiều dọc
              crossAxisAlignment: CrossAxisAlignment.center, // Căn giữa theo chiều ngang
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width/1.2,
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    border: Border.all(
                    color: const Color.fromRGBO(46, 91, 69, 1),
                    width: 2.0,
                    ),
                  ),
                  child: TextField(
                  controller: fullname,
                  decoration: InputDecoration(
                  labelText: 'Họ và tên',
                   prefixIcon: Icon(
                    Icons.account_circle,
                    color: Color.fromRGBO(46, 91, 69, 1),
                  ),
                   ),
                 ),
                 
                ),
                SizedBox(height: 13,),
                Container(
                  width: MediaQuery.of(context).size.width/1.2,
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    border: Border.all(
                    color: const Color.fromRGBO(46, 91, 69, 1),
                    width: 2.0,
                    ),
                  ),
                  child: TextField(
                    controller: phone,
                  decoration: InputDecoration(
                  labelText: 'Số Điện Thoại',
                  prefixIcon: Icon(
                    Icons.phone,
                    color: Color.fromRGBO(46, 91, 69, 1),
                  ),
                   ),
                 ),
                ),
                SizedBox(height: 13,),
                Container(
                  width: MediaQuery.of(context).size.width/1.2,
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    border: Border.all(
                    color: const Color.fromRGBO(46, 91, 69, 1),
                    width: 2.0,
                    ),
                  ),
                  child: TextField(
                  controller: email,
                  decoration: InputDecoration(
                  labelText: 'Email',
                   prefixIcon: Icon(
                    Icons.email,
                    color: Color.fromRGBO(46, 91, 69, 1),
                  ),
                   ),
                 ),
                ),
                SizedBox(height: 13,),
                Container(
                  width: MediaQuery.of(context).size.width/1.2,
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    border: Border.all(
                    color: Color.fromRGBO(46, 91, 69, 1),
                    width: 2.0,
                    ),
                  ),
                  child: TextField(
                  controller: address,
                  decoration: InputDecoration(
                  labelText: 'Địa chỉ',
                   prefixIcon: Icon(
                    Icons.location_on,
                    color: Color.fromRGBO(46, 91, 69, 1),
                  ),
                   ),
                 ),
                ),
                SizedBox(height: 20,),
                ElevatedButton(
                   style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Color.fromRGBO(46, 91, 69, 1))
                  ),
                onPressed: () {
                  setState(() {
                    print('đây là urlz: $url');
                    if(fullname.text == '' || phone.text == '' || email.text == '' || address.text == ''){
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Infomation',style: TextStyle(color: const Color.fromARGB(255, 207, 119, 112))),
                            content: Text('Vui lòng điền đủ thông tin',style: TextStyle(color:Colors.white)),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context); // Đóng dialog
                                },
                                child: Text('OK',style: TextStyle(color: Color.fromARGB(255, 249, 249, 249))),
                              ),
                            ],
                            backgroundColor: Color.fromRGBO(46, 91, 69, 1),
                          );
                          
                        },
                      );
                    }else if(isValidPhoneNumber(phone.text) == false)
                    {
                       showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Infomation',style: TextStyle(color: const Color.fromARGB(255, 207, 119, 112))),
                            content: Text('Số điện thoại không hợp lệ',style: TextStyle(color:Colors.white)),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context); // Đóng dialog
                                },
                                child: Text('OK',style: TextStyle(color: Color.fromARGB(255, 249, 249, 249))),
                              ),
                            ],
                            backgroundColor: Color.fromRGBO(46, 91, 69, 1),
                          );
                          
                        },
                      );

                    }else if(isValidGmail(email.text)== false){
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Infomation',style: TextStyle(color: const Color.fromARGB(255, 207, 119, 112))),
                            content: Text('Email không hợp lệ',style: TextStyle(color:Colors.white)),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context); // Đóng dialog
                                },
                                child: Text('OK',style: TextStyle(color: Color.fromARGB(255, 249, 249, 249))),
                              ),
                            ],
                            backgroundColor: Color.fromRGBO(46, 91, 69, 1),
                          );
                          
                        },
                      );
                    }else{
                      if(newURL != '')
                        url = newURL;
                         print('đây là urlz sau khi gán: $url');
                         editData();
                        Navigator.pop(context);
                     
                    }
                  });
                },

                child: Text('Cập nhật thông tin',style: TextStyle(color: Color.fromRGBO(252, 255, 254, 1)),),
              ),
              ],
            ),
          ],
        )
      ),
      )
       
    );
  }
  //    Future<void> _pickImage() async {
  //   final ImagePicker _picker = ImagePicker();
  //   final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

  //   if (image != null) {
  //     url = image.path;
  //   }
  // }
  
  Future<String?> pickAndUploadImageToFirebase() async {
  final file =  await ImagePicker().pickImage(source: ImageSource.gallery);
  if (file == null) return null;

  Uint8List imageData = await File(file.path!).readAsBytes();
  String fileName = DateTime.now().microsecondsSinceEpoch.toString();
  Reference referenceRoot = FirebaseStorage.instance.ref();
  Reference referenceDireImages = referenceRoot.child('images');
  Reference referenceUpLoad = referenceDireImages.child(fileName);

  try {
    await referenceUpLoad.putData(imageData, SettableMetadata(contentType: 'image/png'));
    
    // Lấy đường dẫn URL của ảnh sau khi tải lên
    String downloadUrl = await referenceUpLoad.getDownloadURL();
    print('Download URL: $downloadUrl');
    
    return downloadUrl;
  } catch (error) {
    print('Error uploading image to Firebase Storage: $error');
    // Xử lý lỗi nếu cần thiết
    return null;
  }
}
}