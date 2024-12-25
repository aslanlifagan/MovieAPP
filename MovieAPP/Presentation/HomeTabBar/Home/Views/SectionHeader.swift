//
//  SectionHeader.swift
//  MovieAPP
//
//  Created by Aslanli Faqan on 25.12.24.
//


import UIKit

final class SectionHeader: UICollectionReusableView {
    
    private lazy var divider: UIView = {
        let d = UIView()
        d.backgroundColor = .red
        return d
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
        setUpConstrains()
    }
    
    func setUpConstrains() {
        addSubview(divider)
        divider.fillSuperview()
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
