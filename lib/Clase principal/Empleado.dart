 abstract class Empleado {
  String nombre;
  int edad;
  double _salarioBase;

  double get salarioBase => _salarioBase;

  Empleado(this.nombre, this.edad, this._salarioBase){
    if (_salarioBase < 0) {
      throw ArgumentError("El salario base no puede ser negativo");
    }
  }
  
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
 