//
//  ViewController.swift
//  Movies
//
//  Created by Ahmet Bostancıklıoğlu on 7.07.2022.
//



//MVC design pattern used to in this project.

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    var labelStatus = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        label.isUserInteractionEnabled = true
        
   
        
    }

   
}

