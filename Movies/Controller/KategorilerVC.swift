//
//  KategorilerVC.swift
//  Movies
//
//  Created by Ahmet Bostancıklıoğlu on 7.07.2022.
//

import UIKit

class KategorilerVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    var secilenKategoriAdi : String = ""
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return veriler.kategoriler.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let kategoriCell = tableView.dequeueReusableCell(withIdentifier: "kategoricell") as? KategoriCell  {
            kategoriCell.cellDuzenle(filmKategori: veriler.kategoriler[indexPath.row])
            
            return  kategoriCell
        }
        return UITableViewCell()
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        secilenKategoriAdi = veriler.kategoriler[indexPath.row].kategoriAdi
        performSegue(withIdentifier: "filmlistesi", sender: self)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let filmListesiVC = segue.destination as? FilmListesiVC {
            filmListesiVC.secilenKategoriAdi = secilenKategoriAdi
        }
    }
    
    
    var veriler = VeriSeti()
    
 
    @IBOutlet weak var tableView: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
    }
    

   

}
