//
//  WebViewController.swift
//  homework12
//
//  Created by Mikhail Chuparnov on 27.01.2023.
//

import UIKit
import WebKit

class WebViewController: UIViewController, WKNavigationDelegate {

    var webView: WKWebView!
    
    var url: String
    
    let activityIndicatorView = UIActivityIndicatorView(style: .large)
    
    let backButtonItem = UIBarButtonItem(
        image: UIImage(systemName: "arrowshape.backward"),
        style: .plain,
        target: nil,
        action: #selector(tapBackButton)
    )
    let forwardButtonItem = UIBarButtonItem(
        image: UIImage(systemName: "arrowshape.forward"),
        style: .plain,
        target: nil,
        action: #selector(tapForwardButton)
    )
    let refreshButtonItem = UIBarButtonItem(
        image: UIImage(systemName: "arrow.clockwise"),
        style: .plain,
        target: nil,
        action: #selector(tapRefreshButton)
    )
    
    private let toolBar: UIToolbar = {
        let toolBar = UIToolbar()
        toolBar.backgroundColor = .black
        toolBar.translatesAutoresizingMaskIntoConstraints = false
        return toolBar
    }()
    
    init(url: String) {
        self.url = url
        super.init(nibName: nil, bundle: nil)
    }
    
    @available (*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupWebView(url: url)
        setupProperts()
        setupLayout()
        setupToolBar()
    }
    
    private func setupProperts() {
        activityIndicatorView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupLayout() {
        view.addSubview(toolBar)
        view.addSubview(webView)
        
        NSLayoutConstraint.activate([
            toolBar.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            toolBar.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            toolBar.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            toolBar.heightAnchor.constraint(equalToConstant: 46)
        ])
        
        NSLayoutConstraint.activate([
            webView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            webView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            webView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            webView.bottomAnchor.constraint(equalTo: toolBar.topAnchor)
        ])
    }
    
    private func setupWebView(url: String) {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.translatesAutoresizingMaskIntoConstraints = false
        webView.navigationDelegate = self
        let myURL = URL(string:url)
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
    }
    
    func setupToolBar() {
        let item = UIBarButtonItem(image: nil, style: .plain, target: nil, action: nil)
        backButtonItem.isEnabled = false
        forwardButtonItem.isEnabled = false
        refreshButtonItem.isEnabled = false
        toolBar.setItems([backButtonItem, item, forwardButtonItem, refreshButtonItem], animated: true)
    }
 
    @objc func tapBackButton() {
        webView.goBack()
    }
    
    @objc func tapForwardButton() {
        webView.goForward()
    }
    
    @objc func tapRefreshButton() {
        webView.reload()
    }

    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        setupActivityIndicator()
        activityIndicatorView.startAnimating()
        refreshButtonItem.isEnabled = false
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        activityIndicatorView.removeFromSuperview()
        activityIndicatorView.stopAnimating()
        if webView.canGoBack {
            backButtonItem.isEnabled = true
        } else {
            backButtonItem.isEnabled = false
        }
        
        if webView.canGoForward {
            forwardButtonItem.isEnabled = true
        } else {
            forwardButtonItem.isEnabled = false
        }
        
        refreshButtonItem.isEnabled = true
        
    }
    
    private func setupActivityIndicator() {
        view.addSubview(activityIndicatorView)
        
        NSLayoutConstraint.activate([
            activityIndicatorView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            activityIndicatorView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            activityIndicatorView.heightAnchor.constraint(equalToConstant: 100),
            activityIndicatorView.widthAnchor.constraint(equalToConstant: 100)
        ])
    }

}
