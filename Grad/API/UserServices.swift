//
//  UserServices.swift
//  Grad
//
//  Created by Oscar Garcia Vazquez on 10/10/20.
//

import Foundation

struct UserServices {
    static let shared = UserServices()
    
    func registerUser(cred : userCredentials, completion: @escaping() -> Void) {
        let url = "http://71.200.200.230:3000/auth/register"
        
        let userCred : [String : Any] = ["email" : cred.email,
                                         "password" : cred.password,
                                         "firstName" : cred.firstName,
                                         "lastName" : cred.lastname,
                                         "satScore" : cred.satScore,
                                         "gpa" : cred.gpa,
                                         "ethnicity" : cred.ethnicity,
                                         "gender" : cred.gender,
                                         "mostEducation" : cred.mostEducation,
                                         "interests" : cred.Interests]
        
        let jsonData = try? JSONSerialization.data(withJSONObject: userCred)
        
        if let url = URL(string: url) {
            
            var request = URLRequest(url: url)
            request.addValue("application/json", forHTTPHeaderField: "content-type")
            request.httpMethod = "POST"
            request.httpBody = jsonData
            
            let session = URLSession(configuration: .default, delegate: nil, delegateQueue: nil)
            let task = session.dataTask(with: request) { (data, response, error) in
                
                DispatchQueue.main.async {
                    print("1")
                    if error != nil {
                        return
                    }
                    
                    do {
                        print("2")
                        if let data = data {
                            print("3")
                            let decoder = JSONDecoder()
                            print("4")
                            let res = try decoder.decode(registrationResponse.self, from: data)
                            print("5")
                            print(res)
                            currentUser.currUser = res
                            
                            print("here")
                        }
                    } catch let err {
                        print("6")
                        print(err)
                    }
                }
            }
            task.resume()
        }
    }

}
