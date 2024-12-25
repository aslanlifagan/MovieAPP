//
//  HomeController.swift
//  MovieAPP
//
//  Created by Aslanli Faqan on 18.12.24.
//

import UIKit

final class HomeController: BaseViewController {
    private let viewModel: HomeViewModel
    
    private (set) lazy var collectionView: UICollectionView = {
        let l = UICollectionViewFlowLayout()
        l.minimumLineSpacing = 12
        l.minimumInteritemSpacing = 12
        let cv = UICollectionView(frame: .zero, collectionViewLayout:l)
        cv.showsVerticalScrollIndicator = false
        cv.delegate = self
        cv.dataSource = self
        cv.register(cell: MovieCell.self)
        cv.backgroundColor = .clear
        cv.refreshControl = refreshControl
        return cv
    }()
    
    private lazy var refreshControl = UIRefreshControl().withUsing {
        $0.addTarget(self, action: #selector(reloadPage), for: .valueChanged)
    }
    
    private let layout: HomeCollectionLayout
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
        self.layout = HomeCollectionLayout()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        viewModel.getMovieList()
        // Do any additional setup after loading the view.
    }
    
    override func configureView() {
        view.addSubViews(collectionView)
        configureCompositionalLayout()
    }
    
    override func configureConstraint() {
        collectionView.fillSuperview()
    }
    
    @objc
    private func reloadPage() {
        viewModel.getMovieList()
    }
}

//MARK: UICollectionViewCompositionalLayout
extension HomeController {
    
    fileprivate func configureCompositionalLayout() {
        let layout = UICollectionViewCompositionalLayout { [weak self] sectionIndex, environment in
            guard let self = self else {return nil}
            switch sectionIndex {
                case 0 : return self.layout.trandingSection()
                default: return self.layout.trandingSection()
            }
        }
        collectionView.setCollectionViewLayout(layout, animated: true)
    }
}


//MARK: UICollectionViewDelegate
extension HomeController: UICollectionViewDelegate,
                          UICollectionViewDataSource,
                          UICollectionViewDelegateFlowLayout {
    
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int) -> Int {
            switch section {
                case 1: return 4
                case 2 : return 10
                default: return 1
            }
        }
    
    func numberOfSections(
        in collectionView: UICollectionView
    ) -> Int { 3 }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            switch indexPath.section {
                case 0: 
                    let cell: MovieCell = collectionView.dequeue(for: indexPath)
                    return cell
                case 1:
                    let cell: MovieCell = collectionView.dequeue(for: indexPath)
                    return cell
                default:
                    let cell: MovieCell = collectionView.dequeue(for: indexPath)
                    return cell
            }
        }
    
    func collectionView(
        _ collectionView: UICollectionView,
        didSelectItemAt indexPath: IndexPath) {
            print(#function, indexPath.section, indexPath.item)
        }
}
