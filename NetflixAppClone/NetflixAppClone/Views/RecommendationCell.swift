//
//  RecommendationCell.swift
//  NetflixAppClone
//
//  Created by mac on 3/9/24.
//

import UIKit

class RecommendationCell: UICollectionViewCell, MovieCell {
    
    @IBOutlet weak var myImage: UIImageView!
    
    static let reuseIdentifier = String(describing: RecommendationCell.self)
    func showMovie(movie: Movie?) {
        myImage.image = movie?.thumbnail
    }
    
    
    
}
