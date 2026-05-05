import 'package:practica_herencia_y_polimorfismo/Clase_Principal/Empleado.dart';
import 'package:practica_herencia_y_polimorfismo/Clases_Hijas/Empleado_Gerente.dart';
import 'package:practica_herencia_y_polimorfismo/Clases_Hijas/Empleado_Operativo.dart';
import 'package:practica_herencia_y_polimorfismo/Clases_Hijas/Empleado_Administrativo.dart';
import 'dart:io';

// void main() {
//   List<Empleado> empleados = [];

//   bool continuar = true;

//   while (continuar == true) {
//     print("\n1. Agregar empleado");
//     print("2. Reporte");
//     print("3. Salir\n");
//     print("Selecciona una opción:");
  
//     int opcion = int.parse(stdin.readLineSync()!);

//       String nombre;
//       int edad;
//       double salarioBase;

//     switch(opcion){
//       case 1:
//       stdout.write("Ingresa el nombre del empleado");
//       nombre = Empleado.comprobarNombre(stdin.readLineSync()!);

//       stdout.write("Ingresa la edad del Empleado $nombre");
//       edad = Empleado.comprobarEdad(int.parse(stdin.readLineSync()!));

//       stdout.write("Ingresa el salario Base del empleado $nombre");
//       salarioBase = Empleado.comprobarSalarioBase(double.parse(stdin.readLineSync()!));

      
    //}


//   }
// }

// 
  void main() {
    List<Empleado> empleados = [];

    while (true) {
      print("\n1. Agregar empleado");
      print("2. Reporte");
      print("3. Salir\n");

      int opcion = int.tryParse(stdin.readLineSync()!) ?? 0;

      if (opcion == 1) {
        String nombre;
        int edad;
        double salarioBase;
        
        try{
          print("Nombre:");
          nombre = Empleado.comprobarNombre(stdin.readLineSync()!);

          print("Edad:");
          edad = Empleado.comprobarEdad(int.parse(stdin.readLineSync()!));

          print("Salario base:");
          salarioBase = Empleado.comprobarSalarioBase(double.parse(stdin.readLineSync()!));
        }catch(e){
          print(e);
          continue;
        }

        print("\nTipo:");
        print("1. Operativo");
        print("2. Administrativo");
        print("3. Gerente\n");

        int tipo = int.parse(stdin.readLineSync()!);

        try {
          switch (tipo) {
            case 1:
              print("Horas Extras:");
              double horas = double.parse(stdin.readLineSync()!);

              print("Pago x hora:");
              double pago = double.parse(stdin.readLineSync()!);

              empleados.add(
                EmpleadoOperativo(nombre, edad, salarioBase, horas, pago)
              );
              break;

            case 2:
              print("Bono:");
              double bono = double.parse(stdin.readLineSync()!);

              empleados.add(
                EmpleadoAdministrativo(nombre, edad, salarioBase, bono)
              );
              break;

            case 3:
              print("Comisión (0.):");
              double comision = double.parse(stdin.readLineSync()!);

              empleados.add(
                EmpleadoGerente(nombre, edad, salarioBase, comision)
              );
              break;

            default:
              print("Error: Tipo de empleado no válido");
          }
      } catch(e) {
          print("Error: $e");
        }
      }

      else if (opcion == 2) {
        if (empleados.isEmpty) {
          print("No hay empleados.");
          continue;
        }
        
        double total = 0;
        Empleado mejor = empleados.first;
        double mayor = mejor.calcularSalario();

        for (var emp in empleados) {
          emp.mostrarInfo();

          double salario = emp.calcularSalario();
          total += salario;

          if (salario > mayor) {
            mayor = salario;
            mejor = emp;
          }
        }

        double promedio = total / empleados.length;

        print("\n++++++++++ REPORTE ++++++++++");
        print("\nTotal nómina: $total");
        print("Promedio: $promedio");
        print("Mayor salario: $mayor\n");

        mejor.mostrarInfo();
       }

      else if (opcion == 3) {
       break;
      }

      else {
        print("Opción inválida");
      }
    }
  }
    
    
  