import 'package:practica_herencia_y_polimorfismo/Clase%20principal/Empleado.dart';

class EmpleadoGerente extends Empleado {
  double _porcentajeComision;

  double get porcentajeComision => _porcentajeComision;

  EmpleadoGerente(
    String nombre,
    int edad,
    double salarioBase,
    this._porcentajeComision,
  ) : super(nombre, edad, salarioBase);
  

  @override
  String tipoEmpleado() => "Gerente";
 
  @override
  double calcularSalario(){
    return salarioBase + (salarioBase * (_porcentajeComision));
  }
}