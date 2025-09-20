object roberto {
    var vehiculo = bici
    method cambiarVehiculo(unVehiculo) {
        vehiculo = unVehiculo
    }
    method peso() {
        return 90 + vehiculo.peso()
    }
    method puedeLlamar() {return false}
}

object bici {
    var rodado = 26
    method peso() {return rodado / 2}
    method cambiarRodado(unRodado) {
        rodado = unRodado
    }
}

object camion {
    var acoplados = 1
    method cantidadAcoplados(unCantidad) {
        acoplados = unCantidad
    }
    method peso() {
        return 500 * (acoplados.max(1))
    }
}

object chuck {
    method peso() {
        return 80
    }
    method puedeLlamar() {
        return true
    }
}


object neo {
    var tieneCredito = true
    method peso() {return 0}

    method puedeLlamar() {
        return tieneCredito
    }
    method cargarCredito() {
        tieneCredito = true
    }

    method agotarCredito() {
        tieneCredito = false
    }
}