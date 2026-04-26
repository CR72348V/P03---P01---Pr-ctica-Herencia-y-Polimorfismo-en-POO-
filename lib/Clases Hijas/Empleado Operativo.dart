import 'package:practica_herencia_y_polimorfismo/Clase%20principal/Empleado.dart';

class EmpleadoOperativo extends Empleado {
  double horasExtras;
  double pagoxHora;

  EmpleadoOperativo(
    String nombre,
    int edad,
    double salarioBase,
    this.horasExtras,
    this.pagoxHora
  ) : super(nombre, edad, salarioBase){
    if (horasExtras < 0) {
      throw ArgumentError("No puden haber horas negativas");
    }
  }

  @override
  String tipoEmpleado() => "Operativo";

  @override
      double calcularSalario(){
        var _salarioBase = super.calcularSalario();
        return _salarioBase + horasExtras * pagoxHora;
  }
} 