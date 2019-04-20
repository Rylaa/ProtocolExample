//
//  secondPage.swift
//  Protocol-Delegate
//
//  Created by Yusuf DEMİRKOPARAN on 19.04.2019.
//  Copyright © 2019 Yusuf DEMİRKOPARAN. All rights reserved.
//

import Foundation
import UIKit
import TinyConstraints
protocol sideSelectionDelegate {
    func  didSelectedImage (image: UIImage?, name: String, color: UIColor)
}

class secondPage : UIViewController {
    var patrick : UIButton = {
        var btn = UIButton()
        btn.setImage(#imageLiteral(resourceName: "patrick"), for: .normal)
        return btn
    }()
    
    var squid : UIButton = {
        var btn = UIButton()
        btn.setImage(#imageLiteral(resourceName: "squid"), for: .normal)
        return btn
    }()
    var yengec : UIButton = {
        var btn = UIButton()
        btn.setImage(#imageLiteral(resourceName: "yengec"), for: .normal)
        return btn
    }()
    var sDelegate : sideSelectionDelegate!
    override func viewDidLoad() {
        super.viewDidLoad()
       
        view.backgroundColor = .white
        
        view.addSubview(patrick)
        view.addSubview(squid)
        view.addSubview(yengec)
        
        patrick.tag = 0
        patrick.addTarget(self, action: #selector(btnclick(sender:)), for: .touchUpInside)
        patrick.width(UIScreen.main.bounds.width*0.5)
        patrick.height(UIScreen.main.bounds.width*0.5)
        patrick.center(in: view)
        
        squid.tag = 1
          squid.addTarget(self, action: #selector(btnclick(sender:)), for: .touchUpInside)
        squid.width(UIScreen.main.bounds.width*0.5)
        squid.height(UIScreen.main.bounds.width*0.5)
        squid.topToBottom(of: patrick)
        squid.leftToSuperview()
        
        yengec.tag = 2
          yengec.addTarget(self, action: #selector(btnclick(sender:)), for: .touchUpInside)
        yengec.width(UIScreen.main.bounds.width*0.5)
        yengec.height(UIScreen.main.bounds.width*0.5)
        yengec.topToBottom(of: patrick)
        yengec.leftToRight(of: squid)
        
  
        
       //
    }
    
    
@objc func btnclick (sender : UIButton) {
    if sender.tag == 0 {
        sDelegate.didSelectedImage(image: #imageLiteral(resourceName: "patrick"), name: "Patrick", color: #colorLiteral(red: 0.6928933263, green: 0.4937247634, blue: 0.7321847081, alpha: 1))
        navigationController?.popViewController(animated: true)
        
        print(1)
    } else if sender.tag == 1 {
        sDelegate.didSelectedImage(image: #imageLiteral(resourceName: "squid"), name: "Squiad", color: #colorLiteral(red: 0.6107506156, green: 0.7233604789, blue: 0.8297984004, alpha: 1))
        navigationController?.popViewController(animated: true)
        print(2)

    } else {
        sDelegate.didSelectedImage(image: #imageLiteral(resourceName: "yengec"), name: "Bay yengec", color: #colorLiteral(red: 0.9893446565, green: 0.8048084974, blue: 0.8127152324, alpha: 1))
        navigationController?.popViewController(animated: true)
        print(3)

    }
   }

}
