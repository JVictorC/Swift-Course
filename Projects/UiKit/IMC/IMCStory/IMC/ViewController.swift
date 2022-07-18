//
//  ViewController.swift
//  IMC
//
//  Created by Joao Victo on 25/06/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tfWeigth: UITextField!
    @IBOutlet weak var tfHeight: UITextField!
    @IBOutlet weak var lbResult: UILabel!
    @IBOutlet weak var ivResult: UIImageView!
    @IBOutlet weak var viResult: UIView!
    
    var imc: Double = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viResult.isHidden = true
    }
    
    @IBAction func calculateIMC(_ sender: Any) {
        if let weigth = Double(tfWeigth.text!), let height = Double(tfHeight.text!)
        {
            imc = weigth / (height * height)
            
            showResults()
        }
    }
    
    func showResults() {
        var result = ""
        var image = ""
        
        switch imc {
        case 0..<16:
            result = "Magreza"
            image = "abaixo"
        case 16..<18.5:
            result = "Abaixo do Peso"
            image = "abaixo"
        case 18.5..<25:
            result = "Peso Ideal"
            image = "ideal"
        case 25..<30:
            result = "Sobre Peso"
            image = "sobre"

        default:
            result = "Obesidade"
            image = "obesidade"
        }
        
        lbResult.text = result;
        ivResult.image = UIImage(named: image)
        
        viResult.isHidden = false
    }
}

