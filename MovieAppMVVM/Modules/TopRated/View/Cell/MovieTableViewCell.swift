//
//  MovieTableViewCell.swift
//  MovieAppMVVM
//
//  Created by didin amarudin on 22/04/22.
//

import UIKit
import Kingfisher
class MovieTableViewCell: UITableViewCell {

    @IBOutlet weak var imageMovie: UIImageView!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

       
    }
    
    func configure(_ movie: Movie){
        titleLabel.text = movie.title
        descLabel.text = movie.overview
        imageMovie.kf.setImage(with: URL(string: baseImageURL+movie.posterPath))
    }
}
