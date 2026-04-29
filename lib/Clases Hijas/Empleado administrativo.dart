import 'package:practica_herencia_y_polimorfismo/Clase%20principal/Empleado.dart';

class EmpleadoAdministrativo extends Empleado{
  double _bonoAdministrativo;

 EmpleadoAdministrativo(
  String nombre, 
  int edad, 
  double salarioBase, 
  double bonoAdministrativo
) : _bonoAdministrativo = _comprobarBono(bonoAdministrativo),
    super(nombre, edad, salarioBase);

static double _comprobarBono(double bonoAdministrativo){
  if(bonoAdministrativo < 0){
    throw Exception("El bono no puede ser negativo");
  }
  return bonoAdministrativo;
}

double get bonoAdministrativo => _bonoAdministrativo;


@override
String tipoEmpleado() => "Administrativo";

@override
double calcularSalario(){
  return salarioBase + bonoAdministrativo;
 }
}