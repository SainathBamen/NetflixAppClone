//
//  HomeViewController.swift
//  NetflixAppClone
//
//  Created by mac on 3/8/24.
//

import UIKit

typealias MoviesDataSource = UICollectionViewDiffableDataSource<MovieManager.Section, Movie>

class HomeViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    private var dataSource : MoviesDataSource!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setNavigationImage()
        configureDataSource()
        configureSnapShot()

        

    }
    private func setupView(){
        setNavigationImage()
        
        //configure collectionView layout
        collectionView.collectionViewLayout = configureCollectionViewLayout()
        collectionView.register(TitleHeaderView.self,forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: TitleHeaderView.reuseIdentifier)
        
        
        
    }
    
    
    private func setNavigationImage(){
        let logo = UIImage(named: "netflixLogo.png")
        
        let imageView = UIImageView(image:logo)
        imageView.contentMode = .scaleAspectFit
        self.navigationItem.titleView = imageView
    }
}

//Collection View.

extension HomeViewController { //MoviesiewController
    func configureCollectionViewLayout() -> UICollectionViewCompositionalLayout {
        let sectionProvider = { (sectionIndex: Int, layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
            var section: NSCollectionLayoutSection?
            
            switch sectionIndex{
            case 0:
                section = self.getHighlightSection()
            case 1:
                section = self.getPreviewSection()
            default:
                section = self.getRecommendationSection()
            }
            return section
        }
        return UICollectionViewCompositionalLayout(sectionProvider:  sectionProvider)
    }
    
    
    
    private func getHighlightSection() -> NSCollectionLayoutSection?{
        //creat item.
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        
        //create group
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.4))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        //create section.
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .paging
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        return section
        
    }
    private func getPreviewSection() -> NSCollectionLayoutSection?{
        //creat item.
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        
        //create group
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.3), heightDimension: .fractionalHeight(0.2))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        //create section.
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        section.boundarySupplementaryItems = getHeader()

        return section
        
    }
    
    private func getRecommendationSection() -> NSCollectionLayoutSection?{
        //creat item.
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0)
        
        //create group
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.3), heightDimension: .fractionalHeight(0.22))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        //create section.
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 0)
        section.boundarySupplementaryItems = getHeader()
        return section
        
    }
    private func getHeader() -> [NSCollectionLayoutBoundarySupplementaryItem]{
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(44))
        let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .topLeading)
        return [sectionHeader]
    }
    
    
    
}

//Mark : Diffable Data Source.


extension HomeViewController{
    func configureDataSource(){
        dataSource = MoviesDataSource(collectionView: collectionView){ (collectionView: UICollectionView, IndexPath: IndexPath, movie: Movie) -> UICollectionViewCell? in
            let reuseIndentifier: String
            
            switch IndexPath.section{
            case 0: reuseIndentifier = HighlightCell.reuseIdentifier
            case 1: reuseIndentifier = PreviewCell.reuseIdentifier
            case 2: reuseIndentifier = RecommendationCell.reuseIdentifier
                
                
            default: reuseIndentifier = RecommendationCell.reuseIdentifier
                
                
            }
            
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIndentifier, for: IndexPath) as? MovieCell else {
                return nil
            }
            let section = MovieManager.Section.allCases[IndexPath.section]
            cell.showMovie(movie: MovieManager.movies[section]?[IndexPath.item])
            
            return cell
            
        }
        dataSource.supplementaryViewProvider = { [weak self] (collectionView: UICollectionView, kind: String, indexPath: IndexPath) -> UICollectionReusableView? in
            if let self = self, let headerSupplementryView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: TitleHeaderView.reuseIdentifier, for: indexPath) as? TitleHeaderView {
                let section = self.dataSource.snapshot().sectionIdentifiers[indexPath.section]
                headerSupplementryView.textLabel.text = section.rawValue
                return headerSupplementryView
            }
            return nil
        }
        
        
    }
    
    func configureSnapShot(){
        var currentSnapShot = NSDiffableDataSourceSnapshot<MovieManager.Section, Movie> ()
        MovieManager.Section.allCases.forEach{ collection in
            currentSnapShot.appendSections([collection])
            if let movies = MovieManager.movies[collection]{
                currentSnapShot.appendItems(movies)
                
                
            }
            
        }
        
        dataSource.apply(currentSnapShot, animatingDifferences: false)
        
    }
}



