import paquetes.*
import mensajeros.*
import destinos.*

object empresa {
    const mensajeros = []
    const paquetesEnviados = []
    const paquetesPendientes = []

    method enviarPaquete(unPaquete) {
        if(self.algunMensajeroPuedeEntregar(unPaquete)) {
            paquetesEnviados.add(unPaquete)
        }
        else {
            paquetesPendientes.add(unPaquete)
        }
        
    }
    method contratar(unMensajero) {
        mensajeros.add(unMensajero)
    }

    method mensajeros() = mensajeros

    method despedir(unMensajero) {
        mensajeros.remove(unMensajero)
    }

    method despedirATodos() {
        mensajeros.clear()
    }

    method esGrande() {
        return mensajeros.size() > 2
    }

    method sePuedeEntregarPorPrimerEmpleado(unPaquete) {
       return  if(!mensajeros.isEmpty()) {
            unPaquete.puedeSerEntregado(mensajeros.first())
        } else {
            false
            }
    }
    method algunMensajeroPuedeEntregar(unPaquete) {
        return mensajeros.any({m => unPaquete.puedeSerEntregado(m)})
    }

    method todosLosQuePuedenLLevar(unPaquete) {
        return mensajeros.filter({m => unPaquete.puedeSerEntregado(m)})
    }

    method tieneSobrepeso() {
        return mensajeros.sum({m => m.peso()}) / mensajeros.size() > 500
        // mensajeros.map({m => m.peso()}).sum() / mensajeros.size() > 500
    }



    method pesoUltimoMensajero() {
        return mensajeros.last().peso()
    }

    method facturacion() {
        return paquetesEnviados.sum({p => p.precio()})
    }

    method enviar(conjuntoDePaquetes) {
        conjuntoDePaquetes.forEach({p => self.enviarPaquete(p)})
    }

    method enviarPaquetePendienteMasCaro() {
        if(self.algunMensajeroPuedeEntregar(self.paquetePendienteMasCaro())) {
            self.enviarPaquete(self.paquetePendienteMasCaro())
            paquetesPendientes.remove(self.paquetePendienteMasCaro())
        }
    }

    method paquetePendienteMasCaro() {
        return paquetesPendientes.max({p => p.precio()})
    }

}