//
//  IntroView.swift
//  ViewCode
//
//  Created by Joao Victo on 26/06/22.
//

import UIKit

class IntroView: UIView {
    private lazy var lbWelcome: UILabel = {
        let label = UILabel()
        
        label.text = "Welcome"
        label.font = UIFont.systemFont(ofSize: 22)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var lbMyName: UILabel = {
        let label = UILabel()
        
        label.text = "JVictorC"
        
        label.textColor = .darkGray
        label.font = UIFont.systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label;
    }()
    
    
    init() {
        super.init(frame: .zero)
        
        backgroundColor = .white
        
        addSubViews()
        constraintsLbWelcome()
        constraintsLbMyName()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func addSubViews() {
        addSubview(lbWelcome)
        addSubview(lbMyName)
    }
    
    
    private func constraintsLbWelcome() {
        let constraints = [
            lbWelcome.centerXAnchor.constraint(equalTo: centerXAnchor),
            lbWelcome.topAnchor.constraint(equalTo: topAnchor, constant: 50)
        ]
        
        
        constraints.forEach { constraint in constraint.isActive = true }
    }
    
    private func constraintsLbMyName() {
        let constraints = [
            lbMyName.topAnchor.constraint(equalTo: lbWelcome.bottomAnchor, constant: 30),
            lbMyName.centerXAnchor.constraint(equalTo: centerXAnchor)
        ]
        
        constraints.forEach { constraint in constraint.isActive = true }
    }
    
}
