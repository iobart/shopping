import 'package:firebase_auth/firebase_auth.dart';
import 'package:logger/logger.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shopping/core/dtos/menu_dto.dart';
import 'package:shopping/core/dtos/user_dto.dart';
import 'package:shopping/core/models/menu_model.dart';
import 'package:shopping/core/models/user_model.dart';

class ShoppingApi {
  final Logger _logger = Logger();
  final CollectionReference _firestore =
      FirebaseFirestore.instance.collection("users");
  final CollectionReference _menu =
  FirebaseFirestore.instance.collection("menu");
  final FirebaseAuth _auth = FirebaseAuth.instance;

  ///this method is user to register user
  Future<bool> registerUser(UserDTO user) async {
    try {
      if (user.email == null || user.password == null) {
        throw Exception('El correo y la contraseña son obligatorios.');
      }

      final UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: user.email!, password: user.password!);

      if (userCredential.user != null) {
        final userId = userCredential.user!.uid;

        await _firestore.doc(userId).set({
          'id': userId,
          'email': user.email,
        });
        return true;
      } else {
        return false;
      }
    } catch (e) {
      _logger.e('Error al registrar al usuario: $e');
      return false;
    }
  }

  ///this method is user to authenticate user
  Future<UserDTO> authUser(UserDTO user) async {
    try {
      final UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: user.email!, password: user.password!);

      if (userCredential.user != null) {
        String? userId = userCredential.user?.uid;
        String? userEmail = userCredential.user?.email;
        UserDTO authenticatedUser = UserDTO(
          id: userId,
          email: userEmail,
        );
        return authenticatedUser;
      }
      return UserDTO();
    } catch (e) {
      _logger.e(e);
      return UserDTO();
    }
  }

  ///this method is user to logout user
  Future<void> logoutUser() async {
    try {
      await _auth.signOut();
    } catch (e) {
      _logger.e(e);
    }
  }


  ///menu

  ///this method to create menu product
  Future<bool> createMenu(MenuModel menu) async {
    try {
      User? currentUser = FirebaseAuth.instance.currentUser;

      if (currentUser != null) {
        String userId = currentUser.uid;
        DocumentReference userReference =
        FirebaseFirestore.instance.collection('users').doc(userId);

        MenuModel newMenu = MenuModel(
          name: menu.name,
          description: menu.description,
          stock:menu.stock,
          price: menu.price,
          createdByUserId: userReference,
        );

        await FirebaseFirestore.instance.collection('menu').add(newMenu.toJson());
        return true;

      } else {
        return false;
      }
    } catch (e) {
      print('Error al crear el menú: $e');
      return false;
    }
  }

  ///this method to get list Menu products
   Stream<QuerySnapshot<MenuDTO>>? getMenu( ) {
     User? currentUser = FirebaseAuth.instance.currentUser;
     if (currentUser != null) {
       String userId = currentUser.uid;
       DocumentReference userReference =
       FirebaseFirestore.instance.collection('users').doc(userId);
       try {
         return FirebaseFirestore.instance
             .collection('menu')
             .where('createdByUserId', isEqualTo: userReference)
             .withConverter(
           fromFirestore: (snap, _) =>
               MenuDTO.fromJson(snap.data() ?? {}),
           toFirestore: (MenuDTO model, _) => model.toJson(),
         ).snapshots();
       } catch (e) {
         _logger.e(e);
         return null;
       }
     }
   }
}
