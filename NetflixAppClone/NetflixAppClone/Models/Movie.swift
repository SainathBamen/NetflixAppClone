//
//  Movie.swift
//  NetflixAppClone
//
//  Created by mac on 3/8/24.
//

import UIKit

struct Movie: Hashable{
    let title: String
    let headerImage: UIImage?
    let thumbnail: UIImage?
    let description: String?
    
    
    init(title: String, headerImage: UIImage? = nil, thumbnail: UIImage? = nil, description: String? = nil){
        self.title = title
        self.headerImage = headerImage
        self.thumbnail = thumbnail
        self.description = description
        
        
    }
    
    let identifier = UUID().uuidString
    
    func hash(int hasher: inout Hasher){
        hasher.combine(identifier)
        
    }
    static func == (lhs: Movie, rhs: Movie) -> Bool{
        return lhs.identifier == rhs.identifier
    }
}
