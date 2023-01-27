//
//  ItemViewController.swift
//  homework12
//
//  Created by Mikhail Chuparnov on 25.01.2023.
//

import UIKit

class ItemViewController: UIViewController {

    var item: Item
    
    var colorsArray = [UIColor.systemGray6, UIColor.darkGray]
    
    // MARK: - views
    
    private let titleLabel = Label(text: "", textAlignment: .center, size: 20, color: .white, weight: .heavy)
    
    private let priceLabel = Label(text: "", textAlignment: .center, size: 16, color: .systemGray, weight: .regular)
    
    private let smallTitleLabel = Label(text: "", textAlignment: .center, size: 12, color: .systemGray, weight: .regular)
    
    private let picImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        image.isUserInteractionEnabled = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
  
    private let optionsStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 8
        stack.distribution = .fillEqually
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    init(item: Item) {
        self.item = item
        super.init(nibName: nil, bundle: nil)
    }
    
    @available (*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupProperts()
        setupLayout()
        setupNavigationBarButtons()
        setupData(item: self.item)
        setupOptionsStack()
        setupGesture()
        
    }
    
    private func setupProperts() {
        view.backgroundColor = .black
        navigationController?.navigationBar.tintColor = .systemTeal
        
    }
    
    private func setupGesture() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapPic))
        picImageView.addGestureRecognizer(tap)
    }
    
    
    @objc private func tapPic() {
        let url = item.url
        let vc = WebViewController(url: url)
        present(vc, animated: true)
    }
    
    private func setupLayout() {
        view.addSubview(titleLabel)
        view.addSubview(priceLabel)
        view.addSubview(picImageView)
        view.addSubview(smallTitleLabel)
        view.addSubview(optionsStack)
        
        let inset: CGFloat = 16
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: inset),
            titleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: inset),
            titleLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -inset)
        ])
        
        NSLayoutConstraint.activate([
            priceLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: inset/2),
            priceLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: inset),
            priceLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -inset)
        ])
        
        NSLayoutConstraint.activate([
            picImageView.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: inset),
            picImageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            picImageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            picImageView.heightAnchor.constraint(equalTo: picImageView.widthAnchor, multiplier: 0.6)
        ])
        
        NSLayoutConstraint.activate([
            smallTitleLabel.topAnchor.constraint(equalTo: picImageView.bottomAnchor, constant: inset),
            smallTitleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: inset),
            smallTitleLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -inset)
        ])
        
        NSLayoutConstraint.activate([
            optionsStack.topAnchor.constraint(equalTo: smallTitleLabel.bottomAnchor, constant: inset*2),
            optionsStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            optionsStack.widthAnchor.constraint(equalToConstant: 108),
            optionsStack.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func setupNavigationBarButtons() {
        let shareButton = UIBarButtonItem(image: UIImage(systemName: "square.and.arrow.up"), style: .plain, target: #selector(tapLikeButton), action: nil)
        
        let likeButton = UIBarButtonItem(image: UIImage(systemName: "heart"), style: .plain, target: #selector(tapLikeButton), action: nil)
        
        navigationItem.rightBarButtonItems = [likeButton, shareButton]
    }
    
    private func setupData(item: Item) {
        titleLabel.text = item.name
        smallTitleLabel.text = item.name
        priceLabel.text = "\(item.price).00 USD"
        picImageView.image = UIImage(named: item.imageName)
    }
    
    @objc private func tapLikeButton() {}
    
    @objc private func tapShareButton() {}
    
    private func setupOptionsStack() {
        
        for i in 0...colorsArray.count-1 {
            let color = colorsArray[i]
            let view = ColorOptionsView(color: color)
            if i%2 == 0 {
                view.isChoosed = true
            }
            optionsStack.addArrangedSubview(view)
        }
    }
}
