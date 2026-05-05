 abstract class Empleado {
  String _nombre;
  int _edad;
  double _salarioBase;

  Empleado(String nombre, int edad, double salarioBase): 
  _salarioBase = comprobarSalarioBase(salarioBase),
  _nombre = comprobarNombre(nombre),
  _edad = comprobarEdad(edad); 

  static String comprobarNombre(String nombre){
    if(nombre.isEmpty){
      throw ArgumentError("El nombre no puede estar vacio");
    }
    return nombre;
  }

  static int comprobarEdad(int edad){
    if(edad < 0){
      throw ArgumentError("La edad no puede ser negativa");
    }
    return edad;
  }

  static double comprobarSalarioBase(double salarioBase) {
    if (salarioBase < 0) {
      throw ArgumentError("El salario base no puede ser negativo");
    }
    return salarioBase;
  }
  String get nombre => _nombre;
  int get edad => _edad;
  double get salarioBase => _salarioBase;
  
   String tipoEmpleado();
   
   double calcularSalario (){
    return _salarioBase; 
  }

  void mostrarInfo(){
    print("El nombre del empleado es: $nombre");
    print("El empleado $nombre tiene $edad años");
    print("El salario del empleado $nombre es de: $_salarioBase pesos");
  }
}
 