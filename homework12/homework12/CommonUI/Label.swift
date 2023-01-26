//
//  Label.swift
//  homework12
//
//  Created by Mikhail Chuparnov on 26.01.2023.
//

import UIKit


final class Label: UILabel {
    
    init(text: String, textAlignment: NSTextAlignment, size: CGFloat, color: UIColor, weight: UIFont.Weight) {
        super.init(frame: .zero)
        self.font = UIFont.systemFont(ofSize: size, weight: weight)
        self.textColor = color
        self.textAlignment = textAlignment
        self.text = text
        self.numberOfLines = 0
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    @available (*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
