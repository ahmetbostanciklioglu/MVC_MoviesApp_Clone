//
//  FilmDetayiVC.swift
//  Movies
//
//  Created by Ahmet Bostancıklıoğlu on 7.07.2022.
//

import UIKit

class FilmDetayiVC: UIViewController {

    @IBOutlet weak var lblFilmAdi: UILabel!
    @IBOutlet weak var imgFilmGorsel: UIImageView!
    @IBOutlet weak var lblFilmDetayi: UITextView!
    
    var secilenFilm: Film!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let secilenFilm = secilenFilm {
            
            imgFilmGorsel.image = UIImage(named: secilenFilm.goruntuAdi)
            lblFilmAdi.text = secilenFilm.adi
            lblFilmDetayi.text = secilenFilm.detaylari
            
        }
        
    }
  
}
