//
//  ColorOptionsView.swift
//  homework12
//
//  Created by Mikhail Chuparnov on 25.01.2023.
//

import UIKit

final class ColorOptionsView: UIView {

    var isChoosed: Bool = false {
        didSet {
            circleView.backgroundColor = .systemTeal
        }
    }
    
    private let colorView: UIView = {
        let view = UIView()
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = 3
        view.clipsToBounds = true
        view.layer.cornerRadius = 25
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let circleView: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.backgroundColor = .black
        view.layer.cornerRadius = 24
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    init(color: UIColor) {
        super.init(frame: .zero)
        setupLayout()
        colorView.backgroundColor = color
    }
    
    @available (*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        addSubview(circleView)
        circleView.addSubview(colorView)
        
        let inset: CGFloat = 1
        
        NSLayoutConstraint.activate([
            circleView.topAnchor.constraint(equalTo: topAnchor),
            circleView.leadingAnchor.constraint(equalTo: leadingAnchor),
            circleView.trailingAnchor.constraint(equalTo: trailingAnchor),
            circleView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
        
        NSLayoutConstraint.activate([
            colorView.topAnchor.constraint(equalTo: circleView.topAnchor, constant: inset),
            colorView.leadingAnchor.constraint(equalTo: circleView.leadingAnchor, constant: inset),
            colorView.trailingAnchor.constraint(equalTo: circleView.trailingAnchor, constant: -inset),
            colorView.bottomAnchor.constraint(equalTo: circleView.bottomAnchor, constant: -inset),
        ])
    }
    
}
