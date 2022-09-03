//
//  ExampleViewController.swift
//  Exitec
//
//  Created by Владислав Кузьмичёв on 03.09.2022.
//

import Foundation
import UIKit

class ExampleViewController: UIViewController {
    
    private let mobileStorage = MobileStorage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let mobile1 = Mobile(imei: "1111", model: "iphone")
        let mobile2 = Mobile(imei: "1122", model: "samsung")
        
        //insert mobile
        try? mobileStorage.save(mobile1)
        try? mobileStorage.save(mobile2)
        
        //get all mobiles
        var mobiles = mobileStorage.getAll()
        
        print("Number of saved items: \(mobiles.count)")
        
        //fing by imei
        let newMobile = mobileStorage.findByImei("1111")
        
        //check exist
        var exist = false
        if let newMobile = newMobile {
            exist = mobileStorage.exists(newMobile)
        }
        
        //delete mobile
        if exist {
            try? mobileStorage.delete(newMobile!)
        }
        
        mobiles = mobileStorage.getAll()
        
        print("Number of saved items: \(mobiles.count)")
        
    }
}
