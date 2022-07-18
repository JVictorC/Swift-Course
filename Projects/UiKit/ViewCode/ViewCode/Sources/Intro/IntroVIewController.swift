//
//  IntroVIewController.swift
//  ViewCode
//
//  Created by Joao Victo on 26/06/22.
//

import UIKit

final class IntroViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        buildView()
    }
    
    private func buildView() {
        view = IntroView()
    }
    
}
