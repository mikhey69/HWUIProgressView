//
//  ViewController.swift
//  HWUIProgressView
//
//  Created by mikhey on 05.06.2018.
//  Copyright © 2018 mikhey. All rights reserved.
//

import UIKit

 class ViewController: UIViewController {

    private var myProgressView = UIProgressView()
    private var myImageView = UIImageView()
    private var myTimer = Timer()
    var myImage = UIImage()
    var zButton = UIButton()
    
    @IBOutlet weak var testButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createProgressView()
        createImageView()
        createMyTimer()
       
        self.title = "1"
        
        zButton.frame = CGRect(x: 120, y: 400, width: 50, height: 40)
        zButton.backgroundColor = UIColor.green
        zButton.addTarget(self, action: #selector(performSecondDisplay), for: .touchUpInside)
        view.addSubview(zButton)
    }

    //segue
    
    
    
    
    @objc func performSecondDisplay() {
        let secondVC = SecondViewController()
        self.navigationController?.pushViewController(secondVC, animated: true)
    }
    
    //MARK: - timer
     func createMyTimer() {
        myTimer = Timer.scheduledTimer(timeInterval: 0.01,
                                       target: self,
                                       selector: #selector(updateProgressView),
                                       userInfo: nil,
                                       repeats: true)
    }
    
    //MARK: - Selector
    @objc func updateProgressView() {
        if myProgressView.progress != 1.0 {
            myProgressView.progress += 0.001 / 1.0
            self.myImageView.alpha = CGFloat(self.myProgressView.progress)
        } else if myProgressView.progress == 1.0 {
            UIView.animate(withDuration: 1.0) {
            self.myImageView.alpha = 1.0
                self.myTimer.invalidate()
                self.performSecondDisplay()
            
                
            }
        }
    }
    
    //MARK: - UI
    func createProgressView() {
        myProgressView.frame = CGRect(x: 0, y: 0, width: 200, height: 53)
        myProgressView.center = view.center
        myProgressView.progressTintColor = UIColor.green
        myProgressView.trackTintColor = UIColor.gray
        view.addSubview(self.myProgressView)
    }
    
    func createImageView() {
        myImageView.frame = CGRect(x: view.center.x - 50, y: view.center.y - 150, width: 100, height: 100)
        myImageView.image = UIImage()
        myImageView.backgroundColor = UIColor.gray
        myImageView.alpha = 0.0
        myImage =  UIImage(named: "google_pay")!
        myImageView.image = myImage
        view.addSubview(self.myImageView)
    }

    @IBAction func testButton(_ sender: Any) {
        performSecondDisplay()
    }
    
}

