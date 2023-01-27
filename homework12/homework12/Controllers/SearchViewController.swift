//
//  SearchViewController.swift
//  homework12
//
//  Created by Mikhail Chuparnov on 25.01.2023.
//

import UIKit

final class SearchViewController: UIViewController {
        
    private let recentlyViewedItemsArray = [
        Item(
            name: "AirPods Pro (2nd generation)",
            price: 249,
            imageName: "MQD83",
            url: "https://www.apple.com/shop/product/MQD83AM/A/airpods-pro?fnode=8188557d1926ae5818301cd8a2501a8a7d6e426d3051d9dfd6b1e33b0a75a23d7d7da21d7cb705a7f195d54472ed7b5e17ed50f4b86943ae7eb54b6df26002ebb977c2a6ce5a2fdd46a2071b7a894db25e4ff5c8361aef22aa8be6f1cd264314"
            ),
        Item(
            name: "iPhone 14 Plus Silicone Case with MagSafe - Lilac",
            price: 49,
            imageName: "MPT83",
            url: "https://www.apple.com/shop/product/MPT83ZM/A/Iphone-14-plus-silicone-case-with-magsafe-lilac?fnode=f35a99aed2c8cc18c2ccd678dd253082af6b5bc6e489c5804c1da95d8c22a127d808b133d5dd376ab4520d6fd3a8b7b50b1008d5f15772512169f82e8de644983cf13fa636bc8056d8eb4d4ce59553651c211a8f0df08f5aa88ffdcc454ba0c8"
        ),
        Item(
            name: "41mm (PRODUCT)RED Sport Loop",
            price: 49,
            imageName: "MPL83",
            url: "https://www.apple.com/shop/product/MPL83AM/A/41mm-productred-sport-loop?fnode=8188557d1926ae5818301cd8a2501a8a7d6e426d3051d9dfd6b1e33b0a75a23d7d7da21d7cb705a7f195d54472ed7b5e17ed50f4b86943ae7eb54b6df26002ebb977c2a6ce5a2fdd46a2071b7a894db25e4ff5c8361aef22aa8be6f1cd264314"
        )
    ]
    
    private let optionsRequestArray = [
        "AirPods",
        "AppleCare",
        "Beats",
        "Сравните модели iPhone"
    ]
    
    // MARK: - views
    private let searchLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 30, weight: .heavy)
        label.text = "Поиск"
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let searchTextField: UITextField = {
        let textfield = UITextField()
        textfield.layer.cornerRadius = 12
        textfield.clipsToBounds = true
        textfield.backgroundColor = .darkGray
        
        let leftView = UIView(frame: CGRect(x: 0, y: 0, width: 32, height: 42))
        var imageView = UIImageView(frame:CGRect(x: 3, y: 9, width: 24, height: 24) )
        var image = UIImage(systemName: "magnifyingglass")
        imageView.image = image
        imageView.tintColor = .lightGray
        imageView.contentMode = .scaleAspectFit
        leftView.addSubview(imageView)
        textfield.leftView = leftView
        textfield.leftViewMode = .always
        
        textfield.attributedPlaceholder = NSAttributedString(
            string:"Поиск по продуктам и магазинам",
            attributes:[NSAttributedString.Key.foregroundColor: UIColor.lightGray]
        )
        textfield.translatesAutoresizingMaskIntoConstraints = false
        return textfield
    }()
    
    private let recentlyViewedLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .heavy)
        label.text = "Недавно просмотренные"
        label.textColor = .white
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let clearButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.link, for: .normal)
        button.setTitle("Очистить", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let recentlyViewedStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 8
        stack.distribution = .fillEqually
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private let optionsLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .heavy)
        label.text = "Варианты запросов"
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let optionsStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 0
        stack.distribution = .fillEqually
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    //MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        setupProperts()
        setupLayout()
        setupRecentlyStack()
        setupOptionsStack()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
    }

    private func setupLayout() {
        view.addSubview(searchLabel)
        view.addSubview(searchTextField)
        view.addSubview(recentlyViewedLabel)
        view.addSubview(clearButton)
        view.addSubview(recentlyViewedStack)
        view.addSubview(optionsLabel)
        view.addSubview(optionsStack)
        
        let inset: CGFloat = 16
        
        NSLayoutConstraint.activate([
            searchLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: inset),
            searchLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: inset),
            searchLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -inset)
        ])
        
        NSLayoutConstraint.activate([
            searchTextField.topAnchor.constraint(equalTo: searchLabel.bottomAnchor, constant: inset),
            searchTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: inset),
            searchTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -inset),
            searchTextField.heightAnchor.constraint(equalToConstant: 42)
        ])
        
        NSLayoutConstraint.activate([
            recentlyViewedLabel.topAnchor.constraint(equalTo: searchTextField.bottomAnchor, constant: inset*2),
            recentlyViewedLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: inset),
        ])
        
        NSLayoutConstraint.activate([
            clearButton.topAnchor.constraint(equalTo: recentlyViewedLabel.topAnchor),
            clearButton.bottomAnchor.constraint(equalTo: recentlyViewedLabel.bottomAnchor),
            clearButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -inset),
            clearButton.leadingAnchor.constraint(equalTo: recentlyViewedLabel.trailingAnchor, constant: inset)
        ])
        
        NSLayoutConstraint.activate([
            recentlyViewedStack.topAnchor.constraint(equalTo: recentlyViewedLabel.bottomAnchor, constant: inset),
            recentlyViewedStack.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: inset),
            recentlyViewedStack.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -inset),
            recentlyViewedStack.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.2)
        ])
        
        NSLayoutConstraint.activate([
            optionsLabel.topAnchor.constraint(equalTo: recentlyViewedStack.bottomAnchor, constant: inset*2),
            optionsLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: inset),
        ])
        
        NSLayoutConstraint.activate([
            optionsStack.topAnchor.constraint(equalTo: optionsLabel.bottomAnchor, constant: inset),
            optionsStack.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: inset),
            optionsStack.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -inset),
            optionsStack.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.2)
        ])
        
        
    }
    
    private func setupProperts() {
        view.backgroundColor = .black
        title = "Поиск"
        searchTextField.delegate = self
    }
    
    private func setupRecentlyStack() {
        
        for i in 0...recentlyViewedItemsArray.count-1 {
            let item = recentlyViewedItemsArray[i]
            let view = RecentlyViewedView(item: item)
            view.delegate = self
            recentlyViewedStack.addArrangedSubview(view)
        }
    }
    
    private func setupOptionsStack() {
        
        for i in 0...optionsRequestArray.count-1 {
            let label = UILabel()
            label.text = optionsRequestArray[i]
            label.textColor = .white
            label.translatesAutoresizingMaskIntoConstraints = false
            optionsStack.addArrangedSubview(label)
        }
    }
    
}

extension SearchViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
    }
    
}

extension SearchViewController: RecentlyViewedViewDelegate {
    func tapView(item: Item) {
        let vc = ItemViewController(item: item)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
}
