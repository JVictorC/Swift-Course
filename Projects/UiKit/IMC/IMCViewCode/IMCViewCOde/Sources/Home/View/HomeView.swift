//
//  HomeView.swift
//  IMCViewCOde
//
//  Created by Joao Victo on 27/06/22.
//

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }
}


import UIKit


final class HomeView: UIView {
    
    init() {
        super.init(frame: .zero)
        
        backgroundColor = UIColor(rgb: 0x54ACCB)
        viResult.backgroundColor = UIColor(rgb: 0x54ACCB)
        
        viResult.isHidden = false
        
        buildLayout()
        buildConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    lazy var lbCalc: UILabel = {
        let label = UILabel()
        
        label.text = "Cálculo do IMC"
        label.textColor = .white
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 34)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var lbDescription: UILabel = {
        let label = UILabel()
        
        label.text = "Descobra seu indice de massa corporal"
        label.textColor = .white
        label.font = UIFont(
            name: "HelveticaNeue-Regular",
            size: 17
        )
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    } ()
    
    lazy var lbWeigth: UILabel = {
        let label = UILabel()
        
        label.text = "Peso"
        label.textAlignment = .center
        label.textColor = .white
        label.font = UIFont(
            name: "HelveticaNeue-Bold",
            size: 17
        )
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var lbHeigth: UILabel = {
        let label = UILabel()
        
        label.text = "Altura"
        label.textAlignment = .center
        label.textColor = .white
        label.font = UIFont(
            name: "HelveticaNeue-Bold",
            size: 17
        )
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    public var tfHeigth: UITextField = {
        let tf = UITextField()
        
        tf.placeholder = "Ex.: 1.17"
        tf.textAlignment = .center
        tf.backgroundColor = .white
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.layer.cornerRadius = 5
        
        
        return tf
    }()
    
    public lazy var tfWeigth: UITextField = {
        let tf = UITextField()
        
        tf.placeholder = "Ex.: 1.20"
        tf.backgroundColor = .white
        tf.textAlignment = .center
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.layer.cornerRadius = 5
        
        
        return tf
    }()
    
    public lazy var viResult: ResultView = {
        let viResult = ResultView()
        
        viResult.translatesAutoresizingMaskIntoConstraints = false
        
        return viResult
    } ()
    
    public lazy var btCalc: UIButton = {
        let button = UIButton()
        
        button.setTitle("CALCULAR", for: .normal)
        button.layer.cornerRadius = 10
        button.setTitleColor(UIColor(rgb: 0x54ACCB), for: .normal)
        button.backgroundColor = .systemYellow
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    private func buildLayout() {
        addSubview(lbCalc)
        addSubview(lbDescription)
        addSubview(lbWeigth)
        addSubview(lbHeigth)
        addSubview(tfWeigth)
        addSubview(tfHeigth)
        addSubview(btCalc)
        addSubview(viResult)
    }
    
    private func buildConstraints() {
        lbCalcConstraints()
        lbDescriptionConstraints()
        lbWeigthConstraints()
        lbHeigthConstraints()
        tfWeigthConstraints()
        tfHeigthConstraints()
        btCalcConstraints()
        viResultConstraints()
    }
    
    private func viResultConstraints() {
        NSLayoutConstraint.activate([
            viResult.topAnchor.constraint(equalTo: tfHeigth.bottomAnchor),
            viResult.bottomAnchor.constraint(equalTo: btCalc.topAnchor),
            viResult.leadingAnchor.constraint(equalTo: leadingAnchor),
            viResult.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    private func btCalcConstraints() {
        NSLayoutConstraint.activate([
            btCalc.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            btCalc.centerXAnchor.constraint(equalTo: centerXAnchor),
            btCalc.leadingAnchor.constraint(equalTo: tfWeigth.leadingAnchor),
            btCalc.trailingAnchor.constraint(equalTo: tfHeigth.trailingAnchor),
            btCalc.heightAnchor.constraint(equalToConstant: 40),
        ])
    }
    
    private func tfHeigthConstraints() {
        NSLayoutConstraint.activate([
            tfHeigth.topAnchor.constraint(equalTo: lbHeigth.bottomAnchor,
                constant: 8
         ),
            tfHeigth.leadingAnchor.constraint(equalTo: lbHeigth.leadingAnchor),
            tfHeigth.trailingAnchor.constraint(equalTo: lbHeigth.trailingAnchor),
            tfHeigth.heightAnchor.constraint(equalToConstant: 25)
        ])
    }
    
    private func tfWeigthConstraints() {
        NSLayoutConstraint.activate([
            tfWeigth.topAnchor.constraint(
                equalTo: lbWeigth.bottomAnchor,
                constant: 8
            ),
            tfWeigth.leadingAnchor.constraint(equalTo: lbWeigth.leadingAnchor),
            tfWeigth.trailingAnchor.constraint(equalTo: lbWeigth.trailingAnchor),
            tfWeigth.heightAnchor.constraint(equalToConstant: 25)
        ])
    }
    
    private func lbHeigthConstraints() {
        NSLayoutConstraint.activate([
            lbHeigth.topAnchor.constraint(
                equalTo: lbWeigth.topAnchor
            ),
            lbHeigth.centerXAnchor.constraint(
                equalTo: centerXAnchor,
                constant: 80
            ),
            lbHeigth.widthAnchor.constraint(equalToConstant: 110)
            
        ])
    }
    
    private func lbWeigthConstraints() {
        NSLayoutConstraint.activate([
            lbWeigth.topAnchor.constraint(
                equalTo:lbDescription.topAnchor,
                constant: 35
            ),
            lbWeigth.centerXAnchor.constraint(
                equalTo: centerXAnchor,
                constant: -80
            ),
            lbWeigth.widthAnchor.constraint(equalToConstant: 110)
        ])
    }
    
    private func lbDescriptionConstraints() {
        NSLayoutConstraint.activate([
            lbDescription.topAnchor.constraint(
                equalTo: lbCalc.bottomAnchor,
                constant: 16
            ),
            lbDescription.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
    
    private func lbCalcConstraints() {
        NSLayoutConstraint.activate([
            lbCalc.topAnchor.constraint(
                equalTo: topAnchor, constant: 40
            ),
            lbCalc.centerXAnchor.constraint(
                equalTo: centerXAnchor
            )
        ])
    }
    
}
