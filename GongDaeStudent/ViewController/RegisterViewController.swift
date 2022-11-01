//
//  RegisterViewController.swift
//  GongDaeStudent
//
//  Created by 김경훈 on 2022/07/27.
//

import UIKit
import Firebase
import FirebaseAuth
import Toast_Swift

class RegisterViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var textFieldName: UITextField!
    @IBOutlet weak var textFieldEmail: UITextField!
    @IBOutlet weak var textFieldPw: UITextField!
    @IBOutlet weak var textFieldUniversity: UITextField!
    @IBOutlet weak var textFieldMajor: UITextField!
    @IBOutlet weak var textFieldStudentNumber: UITextField!
    @IBOutlet weak var emailError: UILabel!
    @IBOutlet weak var passwordError: UILabel!
    @IBOutlet weak var correctpasswordError: UILabel!
    @IBOutlet weak var textFieldCorrectPW: UITextField!
    
    
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate    
    
    // MARK: 사용자 데이터 구조체
  
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textFieldEmail.addTarget(self, action: #selector(textFieldEdited), for: .editingChanged)
        textFieldPw.addTarget(self, action: #selector(textFieldEdited), for: .editingChanged)
        textFieldCorrectPW.addTarget(self, action: #selector(textFieldCompare), for: .editingChanged)
    }
    
    // MARK: 사용자 정보 추가
    func addUserInfo(){
        var user = User.UserData()
        user.userName = textFieldName.text!
        user.userEmail = textFieldEmail.text!
        user.userUniversity = textFieldUniversity.text!
        user.userMajor = textFieldMajor.text!
        user.userStudentNumber = textFieldStudentNumber.text!
        
        let userDict = user.getDict()
        
        let db = Firestore.firestore()
        
        var ref: DocumentReference? = nil
        ref = db.collection("UserData").addDocument(data: userDict) {
            //후행 클로저
            err in
            if let error = err {
                print("쓰기 에러 발생 : ", error)
            }else{
                print("Document write Sucess!")
                print("Document ID : ", ref!.documentID)
                }
            }
    }
    
    // MARK: 확인
    @objc func textFieldEdited(textField: UITextField){
        
        if textField == textFieldEmail{
            if isValidEmail(email: textField.text) == true{
                //에러 표시 사라짐
                emailError.heightAnchor.constraint(equalToConstant: 0).isActive = true
                
            }else{
                emailError.heightAnchor.constraint(equalToConstant: 16).isActive = true
                emailError.text = "이메일 형식이 올바르지 않습니다."
                emailError.textColor = .red
                
            }
        }else if textField == textFieldPw{
            if isValidPassword(pw: textField.text) == true{
                
                passwordError.heightAnchor.constraint(equalToConstant: 0).isActive = true
                
            }
            else{
                passwordError.heightAnchor.constraint(equalToConstant: 16).isActive = true
                passwordError.text = "비밀번호 형식이 올바르지 않습니다."
                passwordError.textColor = .red
            }
            
            
        }
    }
    
    @objc func textFieldCompare(textField: UITextField){
        if textField == textFieldCorrectPW{
            if isSamePassword(pw: textFieldPw.text, checkpw: textFieldCorrectPW.text) == true{
                
                correctpasswordError.heightAnchor.constraint(equalToConstant: 16).isActive = true
                correctpasswordError.text = "비밀번호가 일치합니다."
                correctpasswordError.textColor = .green
            }else{
                correctpasswordError.heightAnchor.constraint(equalToConstant: 16).isActive = true
            }
        }
    }
    
    //Email regular expression
    func isValidEmail(email:String?) -> Bool {
           
           guard email != nil else {return false}
           
              let regEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
           
              let pred = NSPredicate(format:"SELF MATCHES %@", regEx)
           
              return pred.evaluate(with: email)
   }
    
    //PW regular expression
    func isValidPassword(pw: String?) -> Bool {
        
        guard pw != nil else {return false}
        
            let regEx = "^(?=.*[A-Za-z])(?=.*[0-9])(?=.*[!@#$%^&*()_+=-]).{8,50}"

            let pred = NSPredicate(format:"SELF MATCHES %@", regEx)
        
            return pred.evaluate(with: pw)
    }
    
    // Correct pw
    func isSamePassword(pw: String?, checkpw: String?) -> Bool{
        
        let pw = textFieldPw.text!
        let checkpw = textFieldCorrectPW.text!

        if pw == checkpw{
            return true
        }else{
            return false
        }
    }
    
    // MARK: 회원가입
    
    @IBAction func onBtnRegister(_ sender: UIButton) {
        
        if let textEmail = textFieldEmail.text, let textPW = textFieldPw.text {
            Auth.auth().createUser(withEmail: textEmail, password: textPW){
                    authResult, error in
                    guard let user = authResult?.user, error == nil else{
                        print(error!.localizedDescription)
                        return
                    }
                
                self.addUserInfo()
                self.viewIfLoaded?.makeToast("회원가입 성공")
                print("\(String(describing: user.email)) 회원가입 성공")
                print("\(user.uid) 회원가입 성공")
            }
        }
        else {
            }
        }
}
