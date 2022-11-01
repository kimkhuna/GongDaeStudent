//
//  MainSideMenuNavigationController.swift
//  GongDaeStudent
//
//  Created by 김경훈 on 2022/07/29.
//

import UIKit
import SideMenu

class MainSideMenuNavigationController: SideMenuNavigationController {
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate

    override func viewDidLoad() {
        super.viewDidLoad()
        
        appDelegate.mainSide = self
        
        self.menuWidth = 180
        self.leftSide = true
        self.presentationStyle = .menuSlideIn

    
    }
    

}
