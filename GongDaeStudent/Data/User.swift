//
//  User.swift
//  GongDaeStudent
//
//  Created by 김경훈 on 2022/08/21.
//

import Foundation

class User{
    struct UserData{
        var userName:String = ""
        var userEmail:String = ""
        var userUniversity:String = ""
        var userMajor:String = ""
        var userStudentNumber:String = ""
        var profileImage: String = ""
    
        func getDict() -> [String:String]{
            let dict = ["userName" : self.userName, "userEmail" : self.userEmail, "userUniversity" : self.userUniversity, "userMajor" : self.userMajor, "userStudentNumber" : self.userStudentNumber]
            return dict
        }
    }
}
