//
//  ResultView.swift
//  IMCViewCOde
//
//  Created by Joao Victo on 28/06/22.
//

import UIKit

final class ResultView: UIView {
    
    
    private lazy var lbTitle: UILabel = {
        let label = UILabel()
        
        label.text = "Seu Indice de massa corporal é:"
        label.textColor = .darkGray
        label.font = UIFont(name: "", size: 17)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    } ()
    
    public lazy var lbResult: UILabel = {
        let label = UILabel()
        
        label.text = "result"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 34)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    public lazy var imResult: UIImageView = {
        let image = UIImageView()
    
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .center
        
        return image
    }()
    
    
    init() {
        super.init(frame: .zero)
        
        buildLayout()
        buildConstraints()
    }
    
    
    private func buildLayout() {
        addSubview(lbTitle)
        addSubview(lbResult)
        addSubview(imResult)
    }
    
    private func buildConstraints() {
        lbTitleConstraints()
        lbResultConstraints()
        imResultConstraints()
    }
    
    private func imResultConstraints() {
        NSLayoutConstraint.activate([
            imResult.topAnchor.constraint(equalTo: lbResult.bottomAnchor),
            imResult.leadingAnchor.constraint(equalTo: leadingAnchor),
            imResult.trailingAnchor.constraint(equalTo: trailingAnchor),
            imResult.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    private func lbResultConstraints() {
        NSLayoutConstraint.activate([
            lbResult.topAnchor.constraint(equalTo: lbTitle.bottomAnchor, constant: 10),
            lbResult.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
    
    private func lbTitleConstraints() {
        NSLayoutConstraint.activate([
            lbTitle.centerXAnchor.constraint(equalTo: centerXAnchor),
            lbTitle.topAnchor.constraint(equalTo: topAnchor, constant: 40)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
