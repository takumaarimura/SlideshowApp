//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 有村卓馬 on 2020/08/17.
//  Copyright © 2020 takuma.arimura. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var image: UIImageView!
    
    var imageIndex = 0
    
    var timer: Timer!
    
    var selectedImage: UIImageView!
    
    let images = [UIImage(named: "1"), UIImage(named: "2"), UIImage(named: "3")]
    @IBOutlet weak var nextTap: UIButton!
    @IBAction func nextButton(_ sender: Any) {
        
        if imageIndex == 2 {
            imageIndex = 0
        } else {
            imageIndex += 1
        }
        image.image = images[imageIndex]
        
    }
    @IBOutlet weak var backTap: UIButton!
    @IBAction func backButton(_ sender: Any) {
       
        if imageIndex == 0 {
                   imageIndex = 2
               } else {
                   imageIndex -= 1
               }
               image.image = images[imageIndex]
        
    }
    @IBOutlet weak var showTap: UIButton!
    @IBAction func showButton(_ sender: Any) {
        if self.timer == nil{
        timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(ViewController.onTimer(_:)), userInfo: nil, repeats: true)
            
            backTap.isEnabled = false
            nextTap.isEnabled = false
            
            (sender as AnyObject).setTitle("停止",for: .normal)
            
        } else{
            self.timer.invalidate()   // タイマーを停止する
            self.timer = nil          // startTimer() の self.timer == nil で判断するために、 self.timer = nil としておく
            backTap.isEnabled = true
            nextTap.isEnabled = true
            
            (sender as AnyObject).setTitle("再生",for: .normal)
        }
    }
    
    var timer_sec: Float = 0
    
    @IBOutlet weak var timerLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let imageView = images[0]

        image.image = imageView
    }
    
    @objc func onTimer(_ timer: Timer) {
        self.timer_sec += 2.0
        
        if imageIndex == 2 {
            imageIndex = 0
        } else {
            imageIndex += 1
        }
        image.image = images[imageIndex]
    }
    
    @IBAction func imageButton(_ sender: Any) {
        if self.timer != nil{
            self.timer.invalidate()
            backTap.isEnabled = true
            nextTap.isEnabled = true
            
            showTap.setTitle("再生", for: .normal)
            self.timer = nil
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // segueから遷移先のResultViewControllerを取得する
        let resultViewController:ResultViewController = segue.destination as! ResultViewController
        
        resultViewController.selectedImage = image
        
    }

    @IBAction func unwind(_ segue: UIStoryboardSegue) {
    }

}

