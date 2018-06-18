//
//  SecondViewController.swift
//  HWUIProgressView
//
//  Created by mikhey on 05.06.2018.
//  Copyright © 2018 mikhey. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    var myImageView2 = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        createImageView()
        
    }
    
    func createImageView() {
        myImageView2.frame = CGRect(x: view.center.x - 50, y: view.center.y - 150, width: 100, height: 100)
        myImageView2.image = UIImage()
        myImageView2.backgroundColor = UIColor.green
        myImageView2.alpha = 1
        view.addSubview(myImageView2)
    }
    
}
