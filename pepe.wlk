object pepe {

    var categoria = gerente
    var bonoResultado = resultadoNulo
    var bonoPresentismo = presentismoNulo
    var diasFalto = 0

	method rol(_categoria) {
      categoria = _categoria
    }

    method neto() {
      return categoria.neto()
    }

    method bonoResultado(_bonoResultado) {
      bonoResultado = _bonoResultado
    }
    
    method bonoPresentismo(_bonoPresentismo) {
      bonoPresentismo = _bonoPresentismo
    }

    method falto(dias) {
      diasFalto = dias
    }

    method sueldo() {
      return self.neto() + self.valorResultado() + self.valorPresentismo()
    }

    method valorResultado() {
      return bonoResultado.valor(self)
    }

    method valorPresentismo() {
      return bonoPresentismo.valor(self)
    }

    method faltas() {
      return diasFalto
    }
}

//categorias
object cadete {
  method neto() {
    return 20000
  }
}

object gerente {
  
  method neto() {
    return 15000
  }
}

//bonos por resultados
object porcentaje {

  method valor(empleado) {
    return empleado.neto() * 0.1
  }
}
object montoFijo {

  method valor(empleado) {
    return 800
  }
}

object resultadoNulo {

  method valor(empleado) {
    return 0
  }
}

//bonos por presentismo
object normal {
  method valor(empleado) {
     if (empleado.faltas() == 0){
        return 2000
        }
     if (empleado.faltas() == 1){
        return 1000
        }
        return 0
  }
}

object ajuste {
  method valor(empleado) {
    return if (empleado.faltas() == 0)
        100
        else 0
  }
}

object demagogico {
  method valor(empleado) {
    return if (empleado.neto() < 18000) 500 else 300

  }
}

object presentismoNulo {
  method valor(empleado) {
    return 0
  }
}