//
//  HeaderSerachView.swift
//  ClimaViewCode
//
//  Created by Joao Victor on 16/07/22.
//


import UIKit
// MARK: - HeaerSearchView

final class HeaerSearchView: UIView {
    init() {
        super.init(frame: .zero)
        
        buildAllViews()
        buildAllConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UIS
    
    lazy var uiStackSearch: UIStackView = {
        let view = UIStackView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis                                      = .horizontal
        view.distribution                              = .fill
        view.spacing                                   = 20
        
        return view
    }()
    
    lazy var uiButtonSearchByLocation: UIButton = {
        let view = UIButton()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.tintColor                                 = .white
        view.setBackgroundImage(UIImage(systemName:"location.circle.fill")!, for: .normal)
        
        
        return view
    }()
    
    lazy var uiButtonSearch: UIButton = {
        let view = UIButton()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.tintColor                                 = .white
        view.setBackgroundImage(UIImage(systemName:"magnifyingglass")!, for: .normal)
        
        return view
    }()
    
    lazy var uiSearchCityTextField: UITextField = {
        let view = UITextField()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.placeholder                               = "Digite aqui"
        view.rightView                                 = UIView(
            frame: CGRect(x: 0, y: 0, width: 10, height: self.frame.size.height)
        )
        view.rightViewMode                             = .always
        view.textAlignment                             = .right
        view.backgroundColor                           = .systemFill
        
        view.layer.cornerRadius = 5
        
        return view
    }()
}

// MARK: - BuildAllViews
extension HeaerSearchView {
    func buildAllViews() {
        addSubview(uiStackSearch)
        
        uiStackSearch.addArrangedSubview(uiButtonSearchByLocation)
        uiStackSearch.addArrangedSubview(uiSearchCityTextField)
        uiStackSearch.addArrangedSubview(uiButtonSearch)
    }
}

// MARK: - BuildAllConstraints

extension HeaerSearchView {
    func buildAllConstraints() {
        buildStackSearchConstraints()
        buildButtonSearchByLocationConstraints()
        buildButtonSearchConstraints()
    }
    
    
    
    func buildStackSearchConstraints() {
        NSLayoutConstraint.activate([
            uiStackSearch.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 10),
            uiStackSearch.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -10),
            uiStackSearch.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
        ])
    }
    
    func buildButtonSearchByLocationConstraints() {
        NSLayoutConstraint.activate([
            uiButtonSearchByLocation.heightAnchor.constraint(equalToConstant: 45),
            uiButtonSearchByLocation.widthAnchor.constraint(equalToConstant: 45)
        ])
    }
    
    func buildButtonSearchConstraints() {
        NSLayoutConstraint.activate([
            uiButtonSearch.heightAnchor.constraint(equalToConstant: 45),
            uiButtonSearch.widthAnchor.constraint(equalToConstant: 45)
        ])
    }
    
}
