//
//  MovieCardTableViewCell.swift
//  NamavaTest
//
//  Created by reza akbari on 7/23/22.
//

import UIKit
import Kingfisher

class MovieCardTableViewCell: UITableViewCell {

    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configuration(with movie: MovieEntity){
        self.movieImageView?.kf.setImage(with: URL(string: movie.pictures?.sizes.last?.linkWithPlayButton ?? ""))
        self.movieTitleLabel.text = movie.name
        self.descriptionLabel.text = movie.description
    }
}
