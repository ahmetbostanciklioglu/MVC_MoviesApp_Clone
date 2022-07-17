//
//  FilmCell.swift
//  Movies
//
//  Created by Ahmet Bostancıklıoğlu on 8.07.2022.
//

import UIKit

class FilmCell: UICollectionViewCell {
    
    @IBOutlet weak var photoView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        photoView.layer.cornerRadius = 10
        
    }
    
    func cellDuzenle(film: Film) {
        photoView.image = UIImage(named: film.goruntuAdi)
}

}
