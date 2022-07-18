//
//  HomeViewController.swift
//  IMCViewCOde
//
//  Created by Joao Victo on 27/06/22.
//

import UIKit


final class HomeViewController: UIViewController {
    var homeView: HomeView?
        var imc: Double = 0
    
    override func loadView() {
        super.loadView()
        homeView = HomeView()
        
        self.view = homeView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //        homeView?.tfHeigth.text = "Testando ViewCode"
        //        homeView?.viResult.imResult.image = UIImage(named: "ideal")
        
        homeView?.btCalc.addTarget(self, action: #selector(self.pressed), for: .touchUpInside)
    }
    
    
    
    @objc func pressed() {
        
        if
            let height = Double(homeView?.tfHeigth.text ?? "0"),
            let weigth = Double(homeView?.tfWeigth.text ?? "0") {
            imc = weigth / (height * height)
            print(imc)
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
        
                homeView?.viResult.lbResult.text = result
                homeView?.viResult.imResult.image = UIImage(named: image)
        
         homeView?.viResult.isHidden = false
    }
    
}
