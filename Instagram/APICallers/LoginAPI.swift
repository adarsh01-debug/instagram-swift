//
//  LoginAPI.swift
//  Instagram
//
//  Created by Adarsh Pandey on 09/08/22.
//

import Foundation

class LoginAPI {
    
    var delegate: CheckValidation?
    
    func postLogInData(id: String, password: String) {
        let stringURL = "http://10.20.3.120:8111/user/login"
        guard let url = URL(string: stringURL) else {
            print("Problem in url string")
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let body: [String: AnyHashable] = [
            "email": id,
            "password": password,
            "socialMediaId": 2
        ]
        request.httpBody = try?JSONSerialization.data(withJSONObject: body, options: .fragmentsAllowed)
        let task = URLSession.shared.dataTask(with: request) {data, response, error in
            if (error != nil) {
                print("Error in session")
                return
            }
            let header = response as! HTTPURLResponse
            //print(header.allHeaderFields["token"])
            if let safeData = data {
                print("no error")
                if let convertedData = self.parseJSON(safeData) {
                    //sending the recieved status to view controller
                    if let token = header.allHeaderFields["token"] {
                        self.delegate?.sendUser(user: convertedData)
                        self.delegate?.sendToken(token: String(describing: token))
                        self.delegate?.sendStatus(status: true)
                    } else {
                        self.delegate?.sendStatus(status: false)
                    }
                } else {
                    self.delegate?.sendStatus(status: false)
                }
            }
        }
        task.resume()
    }
    
    func parseJSON(_ userData : Data) -> UserModel? {
        let decoder = JSONDecoder()
        do{
            let decodedData = try decoder.decode(UserModel.self, from: userData)
            return decodedData
        } catch {
            print("Unable to post given data to database")
            self.delegate?.sendStatus(status: false)
            return nil
        }
    }
}
