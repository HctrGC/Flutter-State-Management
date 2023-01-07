class Usuario{
  String nombre;
  int edad;
  List<String> profesiones;

  Usuario(this.nombre, this.edad, this.profesiones);

  Usuario copyWith(String nombre, int edad, List<String> profesiones) {
    return Usuario(
      nombre, 
      edad, 
      profesiones
    );
  }
} 