const longitudMinimaCotrasena = 8;

final formatoCorreo = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');


//validar coreo

String? validarCorreo(String correo) {
  final limpio = correo.trim();

  if (limpio.isEmpty) return 'Escribe tu correo';
  if (!formatoCorreo.hasMatch(limpio)) return 'Correo inválido';
  return null;
}

//validar contraseña
//que no sea vacio
//que cumpla con la longitud minima
String? validarContrasena(String contrasena) {
  final limpia = contrasena.trim();

  if (limpia.isEmpty) return 'Escribe tu contraseña';
  if (limpia.length < longitudMinimaCotrasena) {
    return 'La contraseña debe tener al menos $longitudMinimaCotrasena caracteres';
  }
  return null;
}

//validar confirmacion y confirmacion
//Compara contraseña con confirmacion para ver que sean iguales
String? validarConfirmacion(String contrasena, String confirmacion) {
  final limpia = confirmacion.trim();

  if (limpia.isEmpty) return 'Confirma tu contraseña';
  if (contrasena != confirmacion) return 'Las contraseñas no coinciden';
  return null;
}
