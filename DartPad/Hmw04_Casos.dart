void main() {
    // CASO 1: Nuevo paciente con fecha de última cita
    final joseGomez = Person(
                          ID: 1,
                          cortesyTitle: "Sr",
                          name: 'Jose',
                          firstLastname: 'Gomez',
                          secondLastname: 'Ortiz',
                          gender: 'Masculino',
                          bloodGroup: 'O+',
                          curp: 'GOOA030105HPLMRNA7',
                          birthdate: DateTime(2003, 1, 5),
                          isActive: true,
                          createdAt: DateTime(2024, 10, 26, 11, 05, 16),
                      );

    // La fecha de registro del paciente será un día antes de su última cita
    DateTime fechaUltimaCita = DateTime(2024, 10, 27, 15, 30, 00); // Fecha de última cita
    DateTime fechaRegistroPaciente = fechaUltimaCita.subtract(Duration(days: 1)); // Un día antes de la última cita

    Paciente paciente1 = Paciente(
                             persona: joseGomez,
                             nss: null,
                             tipoSeguro: 'IMSS',
                             estatusMedico: 'Normal',
                             estatusVida: 'Vivo',
                             estatus: 1,
                             fechaRegistro: fechaRegistroPaciente,
                             fechaUltimaCita: fechaUltimaCita,
                         );

    print(paciente1);

    // CASO 2: Persona que fue trabajadora del hospital y luego paciente
    final mariaPerez = Trabajador(
                           ID: 2,
                           cortesyTitle: "Sra",
                           name: 'Maria',
                           firstLastname: 'Perez',
                           secondLastname: 'Lopez',
                           gender: 'Femenino',
                           bloodGroup: 'A+',
                           curp: 'PELMA970202MDFRZS08',
                           birthdate: DateTime(1997, 2, 2),
                           isActive: true,
                           createdAt: DateTime(2023, 5, 10), // Fue ingresada antes como trabajadora
                           puesto: "Enfermera",
                           salario: 15000,
                       );

    Paciente paciente2 = Paciente(
                             persona: mariaPerez,
                             nss: '123456789',
                             tipoSeguro: 'ISSSTE',
                             estatusMedico: 'Normal',
                             estatusVida: 'Vivo',
                             estatus: 1,
                             fechaRegistro: DateTime.now(),
                         );

    print(paciente2);

    // CASO 3: Paciente fallecido
    final juanLopez = Person(
                          ID: 3,
                          cortesyTitle: "Sr",
                          name: 'Juan',
                          firstLastname: 'Lopez',
                          secondLastname: 'Ramirez',
                          gender: 'Masculino',
                          bloodGroup: 'B+',
                          curp: 'LORJ850405HPLRJN08',
                          birthdate: DateTime(1985, 4, 5),
                          isActive: true,
                          createdAt: DateTime(2024, 10, 15, 10, 45, 10),
                      );

    Paciente paciente3 = Paciente(
                             persona: juanLopez,
                             nss: '987654321',
                             tipoSeguro: 'Seguro Popular',
                             estatusMedico: 'Enfermo',
                             estatusVida: 'Vivo',
                             estatus: 1,
                             fechaRegistro: DateTime.now(),
                         );

    // Marcar como fallecido
    paciente3.marcarFallecido();
    print(paciente3);
}

class Person {
    int ID;
    String? cortesyTitle;
    String name;
    String firstLastname;
    String? secondLastname;
    String gender;
    String bloodGroup;
    String? curp;
    DateTime birthdate;
    bool isActive;
    DateTime createdAt;
    DateTime? updatedAt;

    Person({
        required this.ID,
        this.cortesyTitle,
        required this.name,
        required this.firstLastname,
        this.secondLastname,
        required this.gender,
        required this.bloodGroup,
        this.curp,
        required this.birthdate,
        this.isActive = true,
        DateTime? createdAt,
        this.updatedAt,
    }) : createdAt = createdAt ?? DateTime.now();

    @override
    String toString() {
        final String formatedDate = "${birthdate.day.toString().padLeft(2, '0')}/"
                                    "${birthdate.month.toString().padLeft(2, '0')}/"
                                    "${birthdate.year}";

        final String formatedCreatedDate = "${createdAt.day.toString().padLeft(2, '0')}/"
                                           "${createdAt.month.toString().padLeft(2, '0')}/"
                                           "${createdAt.year} "
                                           "${createdAt.hour.toString().padLeft(2, '0')}:"
                                           "${createdAt.minute.toString().padLeft(2, '0')}:"
                                           "${createdAt.second.toString().padLeft(2, '0')}";

        curp ??= "No encontrado";
        if (curp == "") curp ??= "No encontrado";

        String status = isActive ? "Activo" : "Inactivo";

        return """
               -------------------------------------------------------
               DATOS DE LA PERSONA
               -------------------------------------------------------
               ID: $ID
               Nombre: $name $firstLastname ${secondLastname ?? ''}
               Género: $gender
               Grupo Sanguíneo: $bloodGroup
               Fecha de Nacimiento: $formatedDate
               CURP: $curp
               Estatus: $status
               Fecha de Registro: $formatedCreatedDate
               """;
    }
}

class Trabajador extends Person {
    String puesto;
    double salario;

    Trabajador({
        required int ID,
        String? cortesyTitle,
        required String name,
        required String firstLastname,
        String? secondLastname,
        required String gender,
        required String bloodGroup,
        String? curp,
        required DateTime birthdate,
        bool isActive = true,
        DateTime? createdAt,
        DateTime? updatedAt,
        required this.puesto,
        required this.salario,
    }) : super(
        ID: ID,
        cortesyTitle: cortesyTitle,
        name: name,
        firstLastname: firstLastname,
        secondLastname: secondLastname,
        gender: gender,
        bloodGroup: bloodGroup,
        curp: curp,
        birthdate: birthdate,
        isActive: isActive,
        createdAt: createdAt,
        updatedAt: updatedAt);

    @override
    String toString() {
        return super.toString() +
               """
               -------------------------------------------------------
               DATOS DEL TRABAJADOR
               -------------------------------------------------------
               Persona ID: $ID
               Puesto: $puesto
               Salario: $salario
               """;
    }
}

class Paciente {
    Person persona;
    String? nss;
    String tipoSeguro;
    DateTime? fechaUltimaCita;
    String estatusMedico;
    String estatusVida;
    int estatus;
    DateTime fechaRegistro;
    DateTime? fechaActualizacion;

    Paciente({
        required this.persona,
        this.nss,
        required this.tipoSeguro,
        this.fechaUltimaCita,
        this.estatusMedico = 'Normal',
        this.estatusVida = 'Vivo',
        this.estatus = 1,
        required this.fechaRegistro,
        this.fechaActualizacion,
    });

    void marcarFallecido() {
        estatusVida = 'Fallecido';
        estatus = 0; // Marcamos como inactivo
    }

    @override
    String toString() {
        final String formatedRegistroDate = "${fechaRegistro.day.toString().padLeft(2, '0')}/"
                                            "${fechaRegistro.month.toString().padLeft(2, '0')}/"
                                            "${fechaRegistro.year} ${fechaRegistro.hour.toString().padLeft(2, '0')}:"
                                            "${fechaRegistro.minute.toString().padLeft(2, '0')}:"
                                            "${fechaRegistro.second.toString().padLeft(2, '0')}";

        final String? formatedUltimaCita = fechaUltimaCita != null
                                           ? "${fechaUltimaCita!.day.toString().padLeft(2, '0')}/"
                                           "${fechaUltimaCita!.month.toString().padLeft(2, '0')}/"
                                           "${fechaUltimaCita!.year} "
                                           "${fechaUltimaCita!.hour.toString().padLeft(2, '0')}:"
                                           "${fechaUltimaCita!.minute.toString().padLeft(2, '0')}"
                                           : "Sin registro";

        return """
               ${persona.toString()}
               -------------------------------------------------------
               DATOS DEL PACIENTE
               -------------------------------------------------------
               NSS: ${nss ?? 'No registrado'}
               Tipo de Seguro: $tipoSeguro
               Estatus Médico: $estatusMedico
               Estatus de Vida: $estatusVida
               Estatus: ${estatus == 1 ? 'Activo' : 'Inactivo'}
               Fecha de Registro: $formatedRegistroDate
               Fecha de Última Cita: $formatedUltimaCita
               -------------------------------------------------------
               """;
    }
}