
protocol AdvancedLifeSupport {
    func perfomCPR()
}


class EmergyCallHandler {
    var delegate: AdvancedLifeSupport?
    
    func assessSituation() {
        print("Can you tell me wha happend?")
    }
    
    func medicalEmergency() {
        delegate?.perfomCPR()
    }
}


struct Paramedic: AdvancedLifeSupport {
    
    init(handler: EmergyCallHandler) {
        handler.delegate = self
    }
    
    func perfomCPR() {
        print("The paramedic does chest compressions, 30 per second.")
    }
}

class Doctor: AdvancedLifeSupport {

    init(_ handler: EmergyCallHandler) {
        handler.delegate = self
    }
    
    func perfomCPR() {
        print("The doctor does chest compressions, 30 per second")
    }
    
    func useStathescope() {
        print("Listenin for heart sounds")
    }
}

// Classe emilio esta esperando que o delegate seja alguem que "Extends" de AdvancedLifeSupport
// E neste caso obrigatoriamente todos os filhos do protocolo AdvancedLifeSupport tem a funcao
// perfomCPR
let emilio = EmergyCallHandler()
// Minha Classwe Paramedic, neste caso depende via cosntructor, porem eu poderia usar em Instancia
// Como as Ui nos codigos UiTextField().delegate = delegate
let pete = Paramedic(handler: emilio)
let peter = Doctor(emilio)

emilio.assessSituation()
emilio.medicalEmergency()


Result.s

