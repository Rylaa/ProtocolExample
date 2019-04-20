//
//  firstPage.swift
//  Protocol-Delegate
//
//  Created by Yusuf DEMİRKOPARAN on 19.04.2019.
//  Copyright © 2019 Yusuf DEMİRKOPARAN. All rights reserved.
//

import Foundation
import UIKit
import TinyConstraints
class firstPage: UIViewController {
     let secondP = secondPage()
    var btnNextPage : UIButton = {
       var btn = UIButton()
        btn.setTitle("Next Screen", for: .normal)
        btn.backgroundColor = .black
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = #colorLiteral(red: 0.4392156899, green: 0.01176470611, blue: 0.1921568662, alpha: 1)
        return btn
    }()
    
    var selectedImage : UIImageView = {
       var img = UIImageView()
        img.image = #imageLiteral(resourceName: "bob")
        img.contentMode = UIView.ContentMode.scaleAspectFit
        return img
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        secondP.sDelegate = self
        view.backgroundColor = .white
        view.addSubview(selectedImage)
        view.addSubview(btnNextPage)
        
        
        selectedImage.center(in: self.view)
        selectedImage.height(UIScreen.main.bounds.height*0.6)
        selectedImage.width()
        
        
        btnNextPage.addTarget(self, action: #selector(goSecondPage), for:  .touchUpInside)
        
     
        btnNextPage.topToBottom(of: selectedImage)
        btnNextPage.centerX(to: view)
        btnNextPage.width(UIScreen.main.bounds.width*0.7)
        btnNextPage.height(35)
        
        
    }
    
    @objc func goSecondPage() {
        
       
  
        navigationController?.pushViewController(secondP, animated: true)
    }
}

extension firstPage : sideSelectionDelegate {
        func didSelectedImage(image: UIImage?, name: String, color: UIColor) {
            selectedImage.image = image
            self.navigationItem.title = name
            self.view.backgroundColor = color
        }
}
