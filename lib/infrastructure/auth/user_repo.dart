import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:evenage/domain/core/failures/main_failure.dart';
import 'package:evenage/domain/user/i_user_repo.dart';
import 'package:evenage/domain/user/models/user_model.dart';

@LazySingleton(as: IUserRepo)
class UserRepo implements IUserRepo {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  @override
  Future<Either<MainFailure, UserModel>> signInWithGoogle() async {
    try {
      final user = await _googleSignIn.signIn();
      if (user == null) {
        return const Left(MainFailure.serverFailure());
      } else {
        final googleAuth = await user.authentication;

        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        await FirebaseAuth.instance.signInWithCredential(credential);
        return Right(UserModel(
          uid: FirebaseAuth.instance.currentUser!.uid,
          email: FirebaseAuth.instance.currentUser!.email!,
          name: FirebaseAuth.instance.currentUser!.displayName!,
        ));
      }
    } catch (_) {
      return const Left(MainFailure.clientFailure());
    }
  }

  @override
  Future<Either<MainFailure, UserModel>> signOut() async {
    try {
      await _googleSignIn.disconnect();
      await _firebaseAuth.signOut();
      return const Right(UserModel(uid: '', email: '', name: ''));
    } catch (_) {
      return const Left(MainFailure.clientFailure());
    }
  }

  @override
  Future<Either<MainFailure, UserModel>> getUser() async {
    try {
      if (_firebaseAuth.currentUser == null) {
        return const Left(MainFailure.serverFailure());
      } else {
        return Right(UserModel(
          uid: FirebaseAuth.instance.currentUser!.uid,
          email: FirebaseAuth.instance.currentUser!.email!,
          name: FirebaseAuth.instance.currentUser!.displayName!,
        ));
      }
    } catch (_) {
      return const Left(MainFailure.clientFailure());
    }
  }
}
