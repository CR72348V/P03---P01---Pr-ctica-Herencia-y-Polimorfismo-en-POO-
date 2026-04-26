import 'package:practica_herencia_y_polimorfismo/Clase%20principal/Empleado.dart';
import 'package:practica_herencia_y_polimorfismo/Clases%20Hijas/Empleado%20Gerente.dart';
import 'dart:io';
import 'package:practica_herencia_y_polimorfismo/Clases%20Hijas/Empleado%20Operativo.dart';
import 'package:practica_herencia_y_polimorfismo/Clases%20Hijas/Empleado%20administrativo.dart';

void main() {
  List<Empleado> empleados = [];

  while (true) {
    print("\n1. Agregar empleado");
    print("2. Reporte");
    print("3. Salir\n");

    int opcion = int.tryParse(stdin.readLineSync()!) ?? 0;

    if (opcion == 1) {
      print("Nombre:");
      String nombre = stdin.readLineSync()!;

      print("Edad:");
      int edad = int.parse(stdin.readLineSync()!);

      print("Salario base:");
      double salarioBase = double.parse(stdin.readLineSync()!);

      print("\nTipo:");
      print("1. Operativo");
      print("2. Administrativo");
      print("3. Gerente\n");

      int tipo = int.parse(stdin.readLineSync()!);

      try {
        switch (tipo) {
          case 1:
            print("Horas extras:");
            double horas = double.parse(stdin.readLineSync()!);

            print("Pago por hora:");
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
            print("Comisión (ej: 0.1):");
            double comision = double.parse(stdin.readLineSync()!);

            empleados.add(
              EmpleadoGerente(nombre, edad, salarioBase, comision)
            );
            break;

          default:
            print("Tipo inválido");
        }
      } catch (e) {
        print("Error: $e");
      }
    }

    else if (opcion == 2) {
      if (empleados.isEmpty) {
        print("No hay empleados.");
        continue;
      }

      double total = 0;
      double mayor = 0;
      Empleado? mejor;

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

      print("\n--- REPORTE ---");
      print("Total nómina: $total");
      print("Promedio: $promedio");
      print("Mayor salario: $mayor");

      mejor?.mostrarInfo();
    }

    else if (opcion == 3) {
      break;
    }

    else {
      print("Opción inválida");
    }
  }
}