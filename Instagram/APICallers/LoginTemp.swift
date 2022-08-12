//
//  LoginTemp.swift
//  Instagram
//
//  Created by Adarsh Pandey on 10/08/22.
//
import Foundation

class LoginTemp{
    
    let apiURL = "http://10.20.4.157:8088/user/getUser/"
    var delegate: UserIdDelegate?
    
    func fecthUserDetails(email: String) {
        let urlString = "\(apiURL)\(email)"
        performRequest(with: urlString)
    }
    
    func performRequest(with urlString: String) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { [weak self] (data, response, error) in
                if error != nil {
                    print("Error!")
                    return
                }
                if let safeData = data {
                    if let user = self?.parseJSON(safeData) {
                        self?.delegate?.getUserId(userId: user.id)
                    }
                }
            }
            task.resume()
        } else {
            print("\(urlString) is invalid")
        }
    }
    
    func parseJSON(_ userData: Data) -> UserId? {
        let decoder = JSONDecoder()
        do {
            let decodeData = try decoder.decode(UserId.self, from: userData)
            return decodeData
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
}
