//
//  ViewController.swift
//  ABG
//
//  Created by wujungao on 2020/3/19.
//  Copyright © 2020 com.wujungao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor=UIColor.green
        
        ABG.shared.registService(service: TestService.shared, key: TestProtocol.self)
        
        let btn=UIButton.init(type: .detailDisclosure)
        btn.addTarget(self, action: #selector(btnAction(sender:)), for: .touchUpInside)
        
        self.view.addSubview(btn)
    }
    
    @objc func btnAction(sender:UIButton){
        let s=ABG.shared.getService(key:TestProtocol.self)
        
        guard let ss = s as? TestProtocol else {
            return
        }
        
        let cc=ss.getContext?()
        
        print(cc?.parameters)
    }
}

