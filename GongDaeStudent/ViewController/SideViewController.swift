//
//  SideViewController.swift
//  GongDaeStudent
//
//  Created by 김경훈 on 2022/07/29.
//

import UIKit
import Firebase
import FirebaseAuth

class SideViewController: UIViewController {
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func onBtnLogout(_ sender: UIButton) {
        let FirebaseAuth = Auth.auth()
        do{
            try FirebaseAuth.signOut()
        }catch let signOutError as NSError{
            print("signOut Error: %@", signOutError)
        }
        gotoFirstVC()
    }
    
    func gotoFirstVC(){
        let firstVC = self.storyboard?.instantiateViewController(withIdentifier: "firstVC") as! ViewController
        self.navigationController?.pushViewController(firstVC, animated: true)
       
    }
    
    
    

}
