//
//  ThatsNewView.swift
//  homework12
//
//  Created by Mikhail Chuparnov on 26.01.2023.
//

import UIKit

final class ThatsNewView: UIView {
    
    // MARK: - Views
    private let picImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let line = SeparateLine()
    
    private let statusLabel = Label(text: "Ваш заказ отправлен", textAlignment: .left, size: 14, color: .black, weight: .heavy)
    
    private let infoLabel = Label(text: "1 товар, доставка завтра", textAlignment: .left, size: 14, color: .systemGray, weight: .regular)
    
    private let chevronImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.tintColor = .systemTeal
        image.image = UIImage(systemName: "chevron.right")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let statusLabelsStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fillProportionally
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private let processedLabel = Label(text: "Обрабатывается", textAlignment: .left, size: 12, color: .black, weight: .regular)
    private let sentLabel = Label(text: "Отправлено", textAlignment: .center, size: 12, color: .black, weight: .regular)
    private let deliveredLabel = Label(text: "Доставлено", textAlignment: .right, size: 12, color: .systemGray, weight: .regular)
    

    
    init() {
        super.init(frame: .zero)
        setupProperts()
        setupLayout()
    }
    
    @available (*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupItemData(item: Item) {
        picImageView.image = UIImage(named: item.imageName)
    }
    
    private func setupProperts() {
        backgroundColor = .white
        translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius = 12
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.3
        layer.shadowOffset = CGSize(width: 0, height: 10)
        layer.shadowRadius = 7
    }
    
    private func setupLayout() {
        addSubview(picImageView)
        addSubview(statusLabel)
        addSubview(infoLabel)
        addSubview(line)
        addSubview(chevronImageView)
        addSubview(statusLabelsStack)
        
        statusLabelsStack.addArrangedSubview(processedLabel)
        statusLabelsStack.addArrangedSubview(sentLabel)
        statusLabelsStack.addArrangedSubview(deliveredLabel)
        
        let inset: CGFloat = 16
        
        NSLayoutConstraint.activate([
            picImageView.topAnchor.constraint(equalTo: topAnchor, constant: inset),
            picImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: inset),
            picImageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.45),
            picImageView.widthAnchor.constraint(equalTo: picImageView.heightAnchor)
        ])
        
        NSLayoutConstraint.activate([
            statusLabel.topAnchor.constraint(equalTo: picImageView.topAnchor, constant: inset),
            statusLabel.leadingAnchor.constraint(equalTo: picImageView.trailingAnchor, constant: inset),
            statusLabel.trailingAnchor.constraint(equalTo: chevronImageView.leadingAnchor, constant: -inset),
        ])
        
        NSLayoutConstraint.activate([
            infoLabel.bottomAnchor.constraint(equalTo: picImageView.bottomAnchor, constant: -inset),
            infoLabel.leadingAnchor.constraint(equalTo: picImageView.trailingAnchor, constant: inset),
            infoLabel.trailingAnchor.constraint(equalTo: chevronImageView.leadingAnchor, constant: -inset),
        ])
        
        NSLayoutConstraint.activate([
            chevronImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -inset/2),
            chevronImageView.centerYAnchor.constraint(equalTo: picImageView.centerYAnchor),
            chevronImageView.widthAnchor.constraint(equalToConstant: 24),
            chevronImageView.heightAnchor.constraint(equalTo: chevronImageView.widthAnchor)
        ])
        
        NSLayoutConstraint.activate([
            line.topAnchor.constraint(equalTo: picImageView.bottomAnchor, constant: inset),
            line.leadingAnchor.constraint(equalTo: leadingAnchor),
            line.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
        
        NSLayoutConstraint.activate([
            statusLabelsStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: inset),
            statusLabelsStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -inset),
            statusLabelsStack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -inset/2),
            statusLabelsStack.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
}
