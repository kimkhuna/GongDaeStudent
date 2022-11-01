//
//  MainViewController.swift
//  GongDaeStudent
//
//  Created by 김경훈 on 2022/07/28.
//

import UIKit
import SideMenu

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        navigationController?.setNavigationBarHidden(true, animated: true)
        
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
//    override func viewDidDisappear(_ animated: Bool) {
//        navigationController?.setNavigationBarHidden(true, animated: true)
//    }
    

    

}
