import 'package:practica_herencia_y_polimorfismo/Clase%20principal/Empleado.dart';

class EmpleadoAdministrativo extends Empleado{
  double bonoAdministrativo;


 EmpleadoAdministrativo(
  String nombre, 
  int edad, 
  double salarioBase, 
  this.bonoAdministrativo
) : super(nombre, edad, salarioBase);


@override
String tipoEmpleado() => "Administrativo";

@override
double calcularSalario(){
  var _salarioBase;
  return _salarioBase + bonoAdministrativo;
 }
}