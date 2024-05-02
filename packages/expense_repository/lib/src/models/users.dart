import 'package:expense_repository/expense_repository.dart';

class users {
  String username;
//constructer
  users({
    required this.username,

  });

   static final empty = users(
    username: '',
    
  );



  userEntity toEntity() {
    return userEntity(
      username:username,
    );
  }

      static  fromEntity(userEntity entity) {
    return users(
      username: entity.username 
    );
  }
}