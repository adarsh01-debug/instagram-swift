//
//  AdAPI.swift
//  Instagram
//
//  Created by Adarsh Pandey on 11/08/22.
//

import Foundation

class AdAPI {
    
    var delegate: AdsManagerDelegate?
    
    func fetchAd(_ token: String) {
        if let url = URL(string: "http://10.20.3.120:8111/ads/getads"){
            let session = URLSession(configuration: .default)
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            request.addValue("application/json", forHTTPHeaderField: "Accept")
            request.addValue(token, forHTTPHeaderField: "token")
            let task = session.dataTask(with: request){ [weak self](data,response,error) in
                if error != nil {
                    print(error!)
                    return
                }
                if let safeData = data {
                    let decoder = JSONDecoder()
                    do{
                        let responseData = try decoder.decode(AdModel.self, from: safeData)
                        self?.delegate?.getAds(adData: responseData)
                        return
                    } catch {
                        print("Error Parsing Data")
                    }
                }
            }
            task.resume()
        }
    }
}
