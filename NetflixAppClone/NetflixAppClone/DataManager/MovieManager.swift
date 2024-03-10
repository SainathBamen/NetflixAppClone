//
//  MovieManager.swift
//  NetflixAppClone
//
//  Created by mac on 3/8/24.
//

import UIKit


struct MovieManager{
    enum Section: String, CaseIterable{
        case HIGHLIGHTS = "Highlights"
        case PREVIEW = "Preview"
        case POPULAR = "Popular"
        case ANIME = "Anime"
        case CLASSIC = "Classic"
        case DOCUMENTARIES = "Documentaries"
        case DRAMAS = "Dramas"
        case MUSIC = "Music"
    }
    
    static var movies = [
        Section.HIGHLIGHTS: [
            
            Movie(title: "Sher Shivraj", headerImage: #imageLiteral(resourceName: "sherShivraj"), description: "Watch Movie"),
            Movie(title: "Pawankhind", headerImage: #imageLiteral(resourceName: "sherShivraj"), description: "Watch Season 2"),
            Movie(title: "Farzand", headerImage: #imageLiteral(resourceName: "sherShivraj"), description: "Watch Season 1")
            
        ],
        Section.PREVIEW: [
            Movie(title: "Ant Man", thumbnail: #imageLiteral(resourceName: "sherShivraj.jpeg")),
            Movie(title: "Avatar", thumbnail: #imageLiteral(resourceName: "sherShivraj.jpeg")),
            Movie(title: "Hobbit", thumbnail: #imageLiteral(resourceName: "sherShivraj.jpeg")),
            Movie(title: "How To Train Your Dragon", thumbnail: #imageLiteral(resourceName: "sherShivraj.jpeg")),
            Movie(title: "Harry Poter", thumbnail: #imageLiteral(resourceName: "sherShivraj.jpeg")),
            Movie(title: "Fright Night", thumbnail: #imageLiteral(resourceName: "sherShivraj.jpeg")),
            Movie(title: "Hobbit", thumbnail: #imageLiteral(resourceName: "sherShivraj.jpeg")),
            Movie(title: "Avatar", thumbnail: #imageLiteral(resourceName: "sherShivraj.jpeg"))
        ],
        Section.POPULAR: [
            Movie(title: "Hobbit", thumbnail: #imageLiteral(resourceName: "sherShivraj.jpeg")),
            Movie(title: "Harry Poter", thumbnail: #imageLiteral(resourceName: "sherShivraj.jpeg")),
            Movie(title: "How To Train Your Dragon", thumbnail: #imageLiteral(resourceName: "sherShivraj.jpeg")),
            Movie(title: "Avatar", thumbnail: #imageLiteral(resourceName: "sherShivraj.jpeg")),
            Movie(title: "Fright Night", thumbnail: #imageLiteral(resourceName: "sherShivraj.jpeg")),
            Movie(title: "Hobbit", thumbnail: #imageLiteral(resourceName: "sherShivraj.jpeg")),
            Movie(title: "Avatar", thumbnail: #imageLiteral(resourceName: "sherShivraj.jpeg")),
            Movie(title: "Ant Man", thumbnail: #imageLiteral(resourceName: "sherShivraj.jpeg"))
        ],
        Section.ANIME: [
            Movie(title: "Ant Man", thumbnail: #imageLiteral(resourceName: "sherShivraj.jpeg")),
            Movie(title: "Hobbit", thumbnail: #imageLiteral(resourceName: "sherShivraj.jpeg")),
            Movie(title: "right Night", thumbnail: #imageLiteral(resourceName: "sherShivraj.jpeg")),
            Movie(title: "Avatar", thumbnail: #imageLiteral(resourceName: "sherShivraj.jpeg")),
            Movie(title: "How To Train Your Dragon", thumbnail: #imageLiteral(resourceName: "sherShivraj.jpeg")),
            Movie(title: "How To Trai", thumbnail: #imageLiteral(resourceName: "sherShivraj.jpeg")),
            Movie(title: "Ant Man", thumbnail: #imageLiteral(resourceName: "sherShivraj.jpeg")),
            Movie(title: "Hobbit", thumbnail: #imageLiteral(resourceName: "sherShivraj.jpeg"))
        ]
    ]
}
