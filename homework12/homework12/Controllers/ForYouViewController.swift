//
//  ForYouViewController.swift
//  homework12
//
//  Created by Mikhail Chuparnov on 26.01.2023.
//

import UIKit

final class ForYouViewController: UIViewController {

    private let item = Item(
        name: "AirPods Pro (2nd generation)",
        price: 249,
        imageName: "MQD83",
        url: "https://www.apple.com/shop/product/MQD83AM/A/airpods-pro?fnode=8188557d1926ae5818301cd8a2501a8a7d6e426d3051d9dfd6b1e33b0a75a23d7d7da21d7cb705a7f195d54472ed7b5e17ed50f4b86943ae7eb54b6df26002ebb977c2a6ce5a2fdd46a2071b7a894db25e4ff5c8361aef22aa8be6f1cd264314"
    )
    
    private let scrollView = UIScrollView()
    
    private let contentView = UIView()
    
    // MARK: - Views
    
    private let titleLabel = Label(text: "Для вас", textAlignment: .left, size: 34, color: .black, weight: .heavy)
    
    private let thatsNewLabel = Label(text: "Вот что нового", textAlignment: .left, size: 30, color: .black, weight: .heavy)
    
    private let recommendLabel = Label(text: "Рекомендуется вам", textAlignment: .left, size: 26, color: .black, weight: .heavy)
    
    private let thatsNewView = ThatsNewView()
    
    private let lineView = SeparateLine()
    
    private let notificationImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.tintColor = .systemRed
        image.image = UIImage(systemName: "app.badge")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let statusLabel = Label(
        text: "Получайте новости о своем заказе в режиме реального времени.",
        textAlignment: .left,
        size: 14,
        color: .black,
        weight: .heavy
    )
    
    private let infoLabel = Label(
        text: "Включите уведомления, чтобы получать новости о своем заказе", 
        textAlignment: .left,
        size: 14,
        color: .systemGray,
        weight: .regular
    )
    
    private let chevronImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.tintColor = .systemTeal
        image.image = UIImage(systemName: "chevron.right")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let secondLineView = SeparateLine()
    
    private let yourDevicesLabel = Label(text: "ваши устройства", textAlignment: .left, size: 24, color: .black, weight: .heavy)
    
    private let showAllDevicesButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.link, for: .normal)
        button.setTitle("Показать все", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        setupProperts()
        setupLayout()
        thatsNewView.setupItemData(item: self.item)
    }
    
    private func setupProperts() {
        view.backgroundColor = .white
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupLayout() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        contentView.addSubview(titleLabel)
        contentView.addSubview(lineView)
        contentView.addSubview(thatsNewLabel)
        contentView.addSubview(thatsNewView)
        contentView.addSubview(recommendLabel)
        contentView.addSubview(notificationImageView)
        contentView.addSubview(statusLabel)
        contentView.addSubview(infoLabel)
        contentView.addSubview(chevronImageView)
        contentView.addSubview(secondLineView)
        contentView.addSubview(showAllDevicesButton)
        contentView.addSubview(yourDevicesLabel)
        
        let inset: CGFloat = 16
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
        ])
        
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
        ])
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: inset),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: inset),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -inset),
        ])

        NSLayoutConstraint.activate([
            lineView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: inset/2),
            lineView.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            lineView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -inset),
        ])

        NSLayoutConstraint.activate([
            thatsNewLabel.topAnchor.constraint(equalTo: lineView.bottomAnchor, constant: inset),
            thatsNewLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: inset),
            thatsNewLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -inset),
        ])
        
        NSLayoutConstraint.activate([
            thatsNewView.topAnchor.constraint(equalTo: thatsNewLabel.bottomAnchor, constant: inset),
            thatsNewView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: inset),
            thatsNewView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -inset),
            thatsNewView.heightAnchor.constraint(equalTo: thatsNewView.widthAnchor, multiplier: 0.42)
        ])

        NSLayoutConstraint.activate([
            recommendLabel.topAnchor.constraint(equalTo: thatsNewView.bottomAnchor, constant: inset*4),
            recommendLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: inset),
            recommendLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -inset),
        ])

        NSLayoutConstraint.activate([
            notificationImageView.topAnchor.constraint(equalTo: recommendLabel.bottomAnchor, constant: inset*3),
            notificationImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: inset*2),
            notificationImageView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 1/10),
            notificationImageView.heightAnchor.constraint(equalTo: notificationImageView.widthAnchor)
        ])

        NSLayoutConstraint.activate([
            statusLabel.topAnchor.constraint(equalTo: notificationImageView.topAnchor),
            statusLabel.leadingAnchor.constraint(equalTo: notificationImageView.trailingAnchor, constant: inset*2),
            statusLabel.trailingAnchor.constraint(equalTo: chevronImageView.leadingAnchor, constant: -inset),
        ])

        NSLayoutConstraint.activate([
            infoLabel.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: inset),
            infoLabel.leadingAnchor.constraint(equalTo: notificationImageView.trailingAnchor, constant: inset*2),
            infoLabel.trailingAnchor.constraint(equalTo: chevronImageView.leadingAnchor, constant: -inset),
        ])

        NSLayoutConstraint.activate([
            chevronImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -inset),
            chevronImageView.centerYAnchor.constraint(equalTo: statusLabel.bottomAnchor),
            chevronImageView.widthAnchor.constraint(equalToConstant: 24),
            chevronImageView.heightAnchor.constraint(equalTo: chevronImageView.widthAnchor)
        ])

        NSLayoutConstraint.activate([
            secondLineView.topAnchor.constraint(equalTo: infoLabel.bottomAnchor, constant: inset*1.5),
            secondLineView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: inset),
            secondLineView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -inset),
        ])

        NSLayoutConstraint.activate([
            yourDevicesLabel.topAnchor.constraint(equalTo: secondLineView.bottomAnchor, constant: inset*2),
            yourDevicesLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: inset),
            yourDevicesLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -inset)
        ])

        NSLayoutConstraint.activate([
            showAllDevicesButton.topAnchor.constraint(equalTo: yourDevicesLabel.topAnchor),
            showAllDevicesButton.bottomAnchor.constraint(equalTo: yourDevicesLabel.bottomAnchor),
            showAllDevicesButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -inset),
            showAllDevicesButton.leadingAnchor.constraint(equalTo: yourDevicesLabel.trailingAnchor, constant: inset)
        ])
    }
    
}
