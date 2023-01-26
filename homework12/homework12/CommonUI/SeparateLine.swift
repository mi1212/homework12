//
//  SeparateLine.swift
//  homework12
//
//  Created by Mikhail Chuparnov on 26.01.2023.
//

import UIKit

final class SeparateLine: UIView {
    init() {
        super.init(frame: .zero)
        backgroundColor = .systemGray
        layer.opacity = 0.3
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: 0.7).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
