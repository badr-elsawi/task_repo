class UserModel {
  late int id;
  late String name;
  late String username;
  late String email;
  late String phone;
  late String website;
  UserModel.fromJson(Map<String,dynamic> json){
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    username = json['username'];
    website = json['website'];
  }
}