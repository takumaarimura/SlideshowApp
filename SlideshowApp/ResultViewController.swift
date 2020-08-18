//
//  ResultViewController.swift
//  SlideshowApp
//
//  Created by 有村卓馬 on 2020/08/17.
//  Copyright © 2020 takuma.arimura. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    @IBOutlet weak var largeImage: UIImageView!
    
    var selectedImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        largeImage.image = selectedImage.image
        

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
