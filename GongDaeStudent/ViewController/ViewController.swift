//
//  ViewController.swift
//  GongDaeStudent
//
//  Created by 김경훈 on 2022/07/21.
//

import UIKit
import Firebase
import FirebaseAuth

class ViewController: UIViewController, UINavigationControllerDelegate{
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate

    override func viewDidLoad() {
        super.viewDidLoad()
        updateLogin()
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: true) 
    }
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    func updateLogin(){
        if let user = Auth.auth().currentUser{
            let mainVC = self.storyboard?.instantiateViewController(withIdentifier: "mainVC") as! MainViewController
            self.navigationController?.pushViewController(mainVC, animated: true)
        }else{
            print("로그인해야됨")
            return
        }
    }

}

