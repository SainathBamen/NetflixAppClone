//
//  PreviewCell.swift
//  NetflixAppClone
//
//  Created by mac on 3/9/24.
//

import UIKit

class PreviewCell: UICollectionViewCell, MovieCell {
    
    @IBOutlet weak var image: UIImageView!
    
    
    @IBOutlet weak var title: UILabel!
    static let reuseIdentifier = String(describing: PreviewCell.self)
    
    func showMovie(movie: Movie?) {
        image.makeRound(borderColor: .init(gray: 1, alpha: 0))
        image.addGradient()
        image.image = movie?.thumbnail
        title.text = movie?.title
        
    }
    
}
