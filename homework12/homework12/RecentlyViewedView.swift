//
//  RecentlyViewedView.swift
//  homework12
//
//  Created by Mikhail Chuparnov on 25.01.2023.
//

import UIKit

final class RecentlyViewedView: UIView {
    
    private let picImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 13, weight: .thin)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    init(item: Item) {
        super.init(frame: .zero)
        setupLayout()
        setupProperts()
        setupData(item: item)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        addSubview(picImageView)
        addSubview(titleLabel)
        
        let inset: CGFloat = 8
        
        NSLayoutConstraint.activate([
            picImageView.topAnchor.constraint(equalTo: topAnchor, constant: inset),
            picImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: inset),
            picImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -inset),
            picImageView.heightAnchor.constraint(equalTo: picImageView.widthAnchor)
        ])
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: picImageView.bottomAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: inset),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -inset),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    private func setupProperts() {
        backgroundColor = .white
        layer.cornerRadius = 12
        clipsToBounds = true
    }
    
    private func setupData(item: Item) {
        picImageView.image = UIImage(named: item.imageName)
        titleLabel.text = item.name
    }
    
}
