import 'package:go_router/go_router.dart';

import 'paginas/cargando_page.dart';
import 'paginas/entrar_page.dart';
import 'paginas/inicio_page.dart';
import 'paginas/perfil_page.dart';
import 'paginas/registro_page.dart';
import 'sesion_view_model.dart';

abstract class Rutas {
  static const cargando = '/cargando';
  static const entrar = '/entrar';
  static const registro = '/registro';
  static const inicio = '/inicio';
  static const perfil = '/inicio/perfil';

  static const publicas = {entrar, registro};
}

String? redirigir(EstadoSesion estado, String ubicacion) {
  final publica = Rutas.publicas.contains(ubicacion);
  return switch (estado) {
  // Aun no sabemos si hay o no hay sesion dentro de la aplicacion: esperar sin mostrar nada
    Verificando() => ubicacion == Rutas.cargando ? null : Rutas.cargando,
    SinSesion() => publica ? null : Rutas.entrar,
    ConSesion() => publica || ubicacion == Rutas.cargando ? Rutas.inicio : null,
  };
}

GoRouter crearRouter(SesionViewModel sesion) => GoRouter(
  initialLocation: Rutas.inicio,
  refreshListenable: sesion,
  redirect: (context, state) => redirigir(sesion.estado, state.matchedLocation),
  routes: [
    GoRoute(path: Rutas.cargando, builder: (_, _) => const CargandoPage()),
    GoRoute(path: Rutas.entrar, builder: (_, _) => const EntrarPage()),
    GoRoute(path: Rutas.registro, builder: (_, _) => const RegistroPage()),
    GoRoute(
      path: Rutas.inicio,
      builder: (_, _) => const InicioPage(),
      routes: [
        GoRoute(path: 'perfil', builder: (_, _) => const PerfilPage()),
      ],
    ),
  ],
);