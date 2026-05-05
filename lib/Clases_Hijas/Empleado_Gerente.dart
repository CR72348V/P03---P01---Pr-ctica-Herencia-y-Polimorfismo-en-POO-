import 'package:practica_herencia_y_polimorfismo/Clase_Principal/Empleado.dart';

class EmpleadoGerente extends Empleado {
  double _porcentajeComision;

  EmpleadoGerente(
    String nombre,
    int edad,
    double salarioBase,
    double porcentajeComision
  ) : _porcentajeComision = _comprobarPorcentajeComision(porcentajeComision),
      super(nombre, edad, salarioBase);

  static double _comprobarPorcentajeComision(double porcentajeComision){
    if(porcentajeComision < 0){
      throw Exception("No existe comision negativa");
    }
    return porcentajeComision;
  }

  double get porcentajeComision => _porcentajeComision; 
  

  @override
  String tipoEmpleado() => "Gerente";
 
  @override
  double calcularSalario(){
    return salarioBase + (salarioBase * (_porcentajeComision));
  }
}