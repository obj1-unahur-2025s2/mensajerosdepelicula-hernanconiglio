import mensajeros.*
import destinos.*

object paquete {
    var destino = matrix
    var estaPago = false

    method cambiarDestino(nuevoDestino) {
        destino = nuevoDestino
    }

    method estaPago() {
        return estaPago
    }
    method registrarPago() {
        estaPago = true
    }

    method cancelarPago() {
        estaPago = false
    }

    method puedeSerEntregado(unMensajero) {
        return estaPago && destino.puedePasar(unMensajero)
    }

    method precio() {
        return 50
    }
}

object paquetito {
    var destino = matrix
    method cambiarDestino(nuevoDestino) {
        destino = nuevoDestino
    }
    method estaPago() {return true}

    method precio() {return 0}

    method puedeSerEntregado(unMensajero) {return true}
}

object paqueton {
    var importePagado = 0
    const destinos = []

    method precio() {
        return destinos.size() * 100
    }

    method agregarDestino(unDestino) {
        destinos.add(unDestino)
    }

    method recibirPago(unValor) {
        importePagado = (importePagado + unValor).min(self.precio())
    }

    method estaPago() {
        return importePagado == self.precio()
    }

    method puedeSerEntregado(unMesajero) {
        return destinos.all({cadaDestinoDeLaLista => cadaDestinoDeLaLista.puedePasar(unMesajero)})
        && self.estaPago()
    }
}