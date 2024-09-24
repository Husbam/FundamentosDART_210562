void main() {
    final double totalCarlist;
    // 1. Llamado de una función sin parámetros
    greetEveryone();

    // 2. Llamado de la función que retorna valores
    // a) Sin almacenar el dato en una variable
    print("El día de hoy es: ${getDayNumber()} del mes.");

    // b) Almacenando el valor de la función en una nueva variable
    final int diaMes = getDayNumber();
    print("En tres días será: ${diaMes + 3}");

    // 3. Llamado de una función con un solo parámetro obligatorio
    // a) Llamado correcto
    print(greetSomeone("Jose"));

    // b) En caso de que la función esté declarada como <dynamic>
    print(greetSomeone(4));
    print(greetSomeone(-312));
    print(greetSomeone(3.1416));
    print(greetSomeone(true));
    print("----------------------------------------------------------------");

    // c) Mismo experimento pero ahora con la función de parámetros tipados
    // print(greetSomeoneTyped("Jose"));
    // print(greetSomeoneTyped(4));
    // print(greetSomeoneTyped(-312));
    // print(greetSomeoneTyped(3.1416));
    // print(greetSomeoneTyped(true));

    // 3.2
    // print(greetSomeone()); // No se puede ejecutar porque si no se definen los parámetros de una función, por default están definidos como obligatorios

    // 4. Llamado de una función con parámetros opcionales
    //4.1 Enviando parametros
    print(greetHourOfDay("Jose", 20));
    //4.2 solo enviando el obligatorio
    print(greetHourOfDay("Jose",null));

    //5. FUNCIONES LAMBDA - las funciones lamdda, o mejor conocidas como funciones anonimas o funciones simplificadas
    //se ejecutan de manera simple y no frecuente en la ejecucion de un programa o sistema
    var calculaCosto = (double productQuantity, double productprice,
                        double percentageDiscount) => (productQuantity * productprice)*((100-percentageDiscount)/100);
    double PrecioProducto = 5;
    double cantidadProducto = 125.5;
    double descuento = 2.5;
    print("""
          Costo del producto: ${PrecioProducto};
          Cantidad: ${cantidadProducto};
          Descuento: ${descuento}
          --------------------------------------
          Costo del Crrito de Compras: ${calculaCosto(cantidadProducto,PrecioProducto,descuento)}
          """);

}

// *********************** FUNCIONES Y PARÁMETROS ***********************************

// 1. FUNCIÓN SIN PARÁMETROS
void greetEveryone() {
    print("Hola a tod@s");
}

// FUNCIÓN SIN PARÁMETROS QUE RETORNA DATOS
int getDayNumber() {
    DateTime now = DateTime.now();
    return now.day;
}

// 3. FUNCIÓN QUE RECIBE UN PARÁMETRO, EN DART SI NO SE ESPECIFICA COMO OPCIONAL, SIEMPRE SERA OBLIGATORIO
String greetSomeone(dynamic personName) {
    return "Hola, ${personName}";
}

// 3.1 Tipando el parámetro de entrada
String greetSomeoneTyped(String personName) {
    return "Hola, ${personName}";
}

// 4. FUNCIÓN CON PARÁMETROS OPCIONALES
// int? puede ser opcional  -NullSafety
String greetHourOfDay(String personName, int? hora) {
    hora ??= DateTime.now().hour; // Si hora es null, se asigna la fecha actual
    print("Hora:${hora}");
    String saludo;

    if (hora >= 6 && hora < 12) {
        saludo = "Buenos días";
    } else if (hora >= 12 && hora < 18) {
        saludo = "Buenas tardes";
    } else {
        saludo = "Buenas noches";
    }

    return "${saludo},${personName}";
}