//
//  LoginViewController.swift
//  GongDaeStudent
//
//  Created by 김경훈 on 2022/07/27.
//

import UIKit
import Firebase
import FirebaseAuth
import Toast_Swift

class LoginViewController: UIViewController {

    @IBOutlet weak var textFieldEmail: UITextField!
    @IBOutlet weak var textFieldPW: UITextField!
    
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()

    
    }
    
  
    
  
    
    @IBAction func onBtnLogin(_ sender: UIButton) {
        if let textID = textFieldEmail.text, let textPW = textFieldPW.text{
            
            if textID.count < 1 || textPW.count < 8{
                self.view.makeToast("아이디와 비밀번호를 입력하세요")
                return
            }
           
            
        
            
            Auth.auth().signIn(withEmail: textID, password: textPW){
                [weak self] user, error in
                guard let _ = self else {return}
                
                
                
                let user = Auth.auth().currentUser
//                print("\(String(describing: user?.email)), \(user?.uid)")
                self!.gotoMain()
//                self?.view.makeToast("아이디와 비밀번호를 확인해주세요.")
                
            }
            
        }else{
//            self.view.makeToast("아이디와 비밀번호를 확인해주세요.")
            return
        }
    }
//
    func gotoMain(){

        let mainVC = self.storyboard?.instantiateViewController(withIdentifier: "mainVC") as! MainViewController
        self.navigationController?.pushViewController(mainVC, animated: true)
    }

//}
}
