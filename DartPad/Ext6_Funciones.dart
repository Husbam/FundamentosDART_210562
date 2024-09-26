void main() {
    // 1. Llamado de una función sin parámetros
    greetEveryone();

    // 2. Llamado de la función que retorna valores
    print("El día de hoy es: ${getDayNumber()} del mes.");

    final int diaMes = getDayNumber();
    print("En tres días será: ${diaMes + 3}");

    // 3. Llamado de una función con un solo parámetro obligatorio
    print(greetSomeone("Jose"));
    print(greetSomeone(4));
    print(greetSomeone(-312));
    print(greetSomeone(3.1416));
    print(greetSomeone(true));
    print("----------------------------------------------------------------");

    // 4. Llamado de una función con parámetros opcionales
    print(greetHourOfDay("Jose", 20));
    print(greetHourOfDay("Angel", null));

    // 5. FUNCIONES LAMBDA
    var calculaCosto = (double productQuantity, double productPrice, double percentageDiscount) => 
        (productQuantity * productPrice) * ((100 - percentageDiscount) / 100);
    
    double PrecioProducto = 5;
    double cantidadProducto = 125.5;
    double descuento = 2.5;
    print("""
          Costo del producto: ${PrecioProducto};
          Cantidad: ${cantidadProducto};
          Descuento: ${descuento}
          --------------------------------------
          Costo del carrito de compras: ${calculaCosto(cantidadProducto, PrecioProducto, descuento)}
          """);

    // 6) Llamado de una funcion con parámetros nombrados
    print(infoCarListStatus(buyerName: "Angel"));
    
    // 6.1) Llamado de los parámetros en desorden posicional
    print(infoCarListStatus(
        status: "En espera de pago",
        amountCarList: 1123.32,
        buyerName: "Luis"));
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

// 3. FUNCIÓN QUE RECIBE UN PARÁMETRO
String greetSomeone(dynamic personName) {
    return "Hola, ${personName}";
}

// 4. FUNCIÓN CON PARÁMETROS OPCIONALES
String greetHourOfDay(String personName, [int? hora]) {
    hora ??= DateTime.now().hour; // Si hora es null, se asigna la fecha actual
    String saludo;

    if (hora >= 6 && hora < 12) {
        saludo = "Buenos días";
    } else if (hora >= 12 && hora < 18) {
        saludo = "Buenas tardes";
    } else {
        saludo = "Buenas noches";
    }

    return "${saludo}, ${personName}";
}

// 6. FUNCIONES CON PARÁMETROS NOMBRADOS
String infoCarListStatus({
    required String buyerName,
    double amountCarList = 0.0,
    String status = "Selección de productos",
}) {
    return "El carrito de compras de: ${buyerName}, Tiene un total de: \$${amountCarList} y actualmente está en estatus: ${status}";
}
