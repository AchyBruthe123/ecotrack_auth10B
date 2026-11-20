import '../dominio/usuario.dart';

abstract interface class AuthRepository {
  Stream<Usuario?> cambiosDeSesion();

  Future<Usuario> registrar(String correo, String contrasena);

  Future<Usuario> iniciarSesion(String correo, String contrasena);

  Future<void> cerrarSesion();
}