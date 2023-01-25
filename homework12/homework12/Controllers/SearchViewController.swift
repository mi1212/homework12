//
//  SearchViewController.swift
//  homework12
//
//  Created by Mikhail Chuparnov on 25.01.2023.
//

import UIKit

final class SearchViewController: UIViewController {
        
    private let recentlyViewedItemsArray = [
        Item(name: "AirPods Pro (2nd generation)", price: 249, imageName: "MQD83"),
        Item(name: "iPhone 14 Plus Silicone Case with MagSafe - Lilac", price: 49, imageName: "MPT83"),
        Item(name: "41mm (PRODUCT)RED Sport Loop", price: 49, imageName: "MPL83")
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
