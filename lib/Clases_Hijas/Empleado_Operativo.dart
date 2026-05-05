import 'package:practica_herencia_y_polimorfismo/Clase_Principal/Empleado.dart';

class EmpleadoOperativo extends Empleado {
  double _horasExtras;
  double _pagoxHora;

  EmpleadoOperativo(
    String nombre,
    int edad,
    double salarioBase,
    double horasExtras,
    double pagoxHora
  ) : _horasExtras = _horasExtra(horasExtras),
      _pagoxHora = pagoxHora,
      super(nombre, edad, salarioBase);

  static double _horasExtra(double horasExtra){
    if(horasExtra < 0){
      throw Exception("No hay horas negativas");
    }
    return horasExtra;
  }

  double get horasExtras => _horasExtras;
  double get pagoxHora => _pagoxHora;


  @override
  String tipoEmpleado() => "Operativo";

  @override
      double calcularSalario(){
        return salarioBase + horasExtras * pagoxHora;
  }
}  