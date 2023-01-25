//
//  RecentlyViewedView.swift
//  homework12
//
//  Created by Mikhail Chuparnov on 25.01.2023.
//

import UIKit

protocol RecentlyViewedViewDelegate: AnyObject {
    func tapView(item: Item)
}

final class RecentlyViewedView: UIView {
    
    var item: Item?
    
    weak var delegate: RecentlyViewedViewDelegate?
    
    // MARK: - Views
    private let picImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 13, weight: .thin)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    init(item: Item) {
        super.init(frame: .zero)
        self.item = item
        setupLayout()
        setupProperts()
        setupData(item: item)
        setupGesture()
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
        backgroundColor = #colorLiteral(red: 0.1163231064, green: 0.107940051, blue: 0.1184733386, alpha: 1)
        layer.cornerRadius = 12
        clipsToBounds = true
    }
    
    private func setupData(item: Item) {
        picImageView.image = UIImage(named: item.imageName)
        titleLabel.text = item.name
    }
    
    private func setupGesture() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapView))
        addGestureRecognizer(tap)
    }
    
    @objc private func tapView() {
        if let item = self.item {
            delegate?.tapView(item: item)
        }
    }
    
}
