//
//  MovieDetailController.swift
//  MovieAPP
//
//  Created by Aslanli Faqan on 10.01.25.
//

import UIKit

final class MovieDetailController: BaseViewController {
    
    private lazy var movieImage = UIImageView().withUsing {
        $0.backgroundColor = .clear
        $0.image = UIImage(named: "poster")
        $0.layer.cornerRadius = 12
        $0.layer.masksToBounds = true
        $0.anchorSize(.init(width: 120, height: 120))
    }
    
    private lazy var titleLabel = UILabel().withUsing {
        $0.text = "Better Call Saul"
        $0.textColor = .label
        $0.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
    }
    
    
    private lazy var stackView: UIStackView = {
        let s = UIStackView(arrangedSubviews: [movieImage, titleLabel])
        s.alignment = .center
        s.distribution = .fill
        s.axis = .horizontal
        s.spacing = 12
        return s
    }()
    
    
    private lazy var fullStackView: UIStackView = {
        let s = UIStackView(arrangedSubviews: [stackView, showTrailerButton])
        s.alignment = .leading
        s.distribution = .fill
        s.axis = .vertical
        s.spacing = 12
        return s
    }()
    
    private lazy var showTrailerButton = UIButton().withUsing {
        $0.setTitle("Show", for: .normal)
        $0.anchorSize(.init(width: 0, height: 24))
        $0.tintColor = .white
        $0.backgroundColor = .blue
    }
    
    private let viewModel: MovieDetailViewModel
    
    init(viewModel: MovieDetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewModel()
    }
    
    override func configureView() {
        super.configureView()
        view.addSubViews(fullStackView)
        movieImage.loadImageURL(url: viewModel.getDetail().icon)
        titleLabel.text = viewModel.getDetail().title
    }
    
    override func configureConstraint() {
        super.configureConstraint()
        fullStackView.anchor(
            top: view.safeAreaLayoutGuide.topAnchor,
            leading: view.leadingAnchor,
            trailing: view.trailingAnchor,
            padding: .init(all: 24)
        )
        
    }
    
    override func configureTargets() {
        super.configureTargets()
        showTrailerButton.addTarget(self, action: #selector(showTrailerClicked) , for: .touchUpInside)
    }
    
    private func configureViewModel() {
        viewModel.requestCallBack = { [weak self ] state in
            guard let self = self else {return}
            switch state {
                case .loading:
                    print(state)
                case .loaded:
                    print(state)
                case .success:
                    break
                case .error(let error):
                    showMessage(message: error)
            }
        }
    }
    @objc
    private func showTrailerClicked() {
        viewModel.showTrailer()
    }
    
}
