//
//  ForYouViewController.swift
//  homework12
//
//  Created by Mikhail Chuparnov on 26.01.2023.
//

import UIKit

final class ForYouViewController: UIViewController {

    private let item = Item(name: "AirPods Pro (2nd generation)", price: 249, imageName: "MQD83")
    
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
    
    private let yourDevicesLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .heavy)
        label.text = "ваши устройства"
        label.textColor = .black
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let showAllDevicesButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.link, for: .normal)
        button.setTitle("Показать все", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupProperts()
        setupLayout()
        thatsNewView.setupItemData(item: self.item)
    }
    
    private func setupProperts() {
        view.backgroundColor = .white
    }
    
    private func setupLayout() {
        view.addSubview(titleLabel)
        view.addSubview(lineView)
        view.addSubview(thatsNewLabel)
        view.addSubview(thatsNewView)
        view.addSubview(recommendLabel)
        view.addSubview(notificationImageView)
        view.addSubview(statusLabel)
        view.addSubview(infoLabel)
        view.addSubview(chevronImageView)
        view.addSubview(secondLineView)
        view.addSubview(showAllDevicesButton)
        view.addSubview(yourDevicesLabel)
        
        let inset: CGFloat = 16
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: inset),
            titleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: inset),
            titleLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -inset),
        ])
        
        NSLayoutConstraint.activate([
            lineView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: inset/2),
            lineView.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            lineView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -inset),
        ])
        
        NSLayoutConstraint.activate([
            thatsNewLabel.topAnchor.constraint(equalTo: lineView.bottomAnchor, constant: inset),
            thatsNewLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: inset),
            thatsNewLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -inset),
        ])
        
        NSLayoutConstraint.activate([
            thatsNewView.topAnchor.constraint(equalTo: thatsNewLabel.bottomAnchor, constant: inset),
            thatsNewView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: inset),
            thatsNewView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -inset),
            thatsNewView.heightAnchor.constraint(equalTo: thatsNewView.widthAnchor, multiplier: 0.42)
        ])
        
        NSLayoutConstraint.activate([
            recommendLabel.topAnchor.constraint(equalTo: thatsNewView.bottomAnchor, constant: inset*4),
            recommendLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: inset),
            recommendLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -inset),
        ])
        
        NSLayoutConstraint.activate([
            notificationImageView.topAnchor.constraint(equalTo: recommendLabel.bottomAnchor, constant: inset*3),
            notificationImageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: inset*2),
            notificationImageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/10),
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
            chevronImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -inset),
            chevronImageView.centerYAnchor.constraint(equalTo: statusLabel.bottomAnchor),
            chevronImageView.widthAnchor.constraint(equalToConstant: 24),
            chevronImageView.heightAnchor.constraint(equalTo: chevronImageView.widthAnchor)
        ])
        
        NSLayoutConstraint.activate([
            secondLineView.topAnchor.constraint(equalTo: infoLabel.bottomAnchor, constant: inset*1.5),
            secondLineView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: inset),
            secondLineView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -inset),
        ])
    }
    
}
