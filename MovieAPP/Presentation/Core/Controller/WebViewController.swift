//
//  WebViewController.swift
//  MovieAPP
//
//  Created by Aslanli Faqan on 10.01.25.
//

import Foundation
import WebKit

final class WebViewController: BaseViewController {
    
    private lazy var webView: WKWebView = {
        let v = WKWebView()
        return v
    }()
    
    private var url: URL?
    
    init(url: String) {
        self.url = URL(string: url)
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func configureView() {
        super.configureView()
        view.addSubview(webView)
        guard let url = url else {return}
        
        webView.isInspectable = true
        webView.load(URLRequest(url: url))
    }
    
    override func configureConstraint() {
        super.configureConstraint()
        webView.fillSuperviewSafeAreaLayoutGuide()
    }
    
}
