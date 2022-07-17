//
//  FilmListesiVC.swift
//  Movies
//
//  Created by Ahmet Bostancıklıoğlu on 7.07.2022.
//

import UIKit

class FilmListesiVC: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var secilenKategoriAdi: String = ""


    var veriler = VeriSeti()
    var secilenFilm : Film!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let tasarim : UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        let genislik = self.collectionView.frame.size.width
        tasarim.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        tasarim.itemSize = CGSize(width: (genislik-30)/2, height: (genislik - 30)/2)
        
        tasarim.minimumInteritemSpacing = 10
        
        tasarim.minimumLineSpacing = 10
        
        collectionView!.collectionViewLayout = tasarim
        
        
        collectionView.dataSource = self
        collectionView.delegate = self
//        print(secilenKategoriAdi)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return veriler.filmleriGetir(kategori: secilenKategoriAdi).count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let filmCell = collectionView.dequeueReusableCell(withReuseIdentifier: "filmcell", for: indexPath) as? FilmCell {
            filmCell.cellDuzenle(film: veriler.filmleriGetir(kategori: secilenKategoriAdi)[indexPath.row])
            
            filmCell.layer.borderColor = UIColor.darkGray.cgColor
            filmCell.layer.borderWidth = 0.5
            filmCell.layer.cornerRadius = 10
            
            
            return filmCell
        }
        return UICollectionViewCell()
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//
//        let width = self.view.frame.width - 10.0 * 2
//        let height: CGFloat = 192
//
////        let genislik = view.bounds.width
////        let hucreBoyutu = (genislik / 5) - 10
//        return CGSize(width: width, height: height)
//    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
        secilenFilm = veriler.filmleriGetir(kategori: secilenKategoriAdi)[indexPath.row]
    
        
        performSegue(withIdentifier: "filmdetayi", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let filmDetayiVC = segue.destination as? FilmDetayiVC
        {
            filmDetayiVC.secilenFilm = secilenFilm
        }
    }

}
