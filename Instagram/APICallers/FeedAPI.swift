//
//  FeedAPI.swift
//  Instagram
//
//  Created by Adarsh Pandey on 09/08/22.
//

import Foundation

class FeedAPI {
    
    let apiURL = "http://10.20.4.157:9014/post"
    weak var delegate: PostManagerDelegate?
    
    func fecthPostDetails() {
        performRequest(with: apiURL)
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
                    if let posts = self?.parseJSON(safeData) {
                        self?.delegate?.updatedData(postData: posts)
                    } else {
                        print("Error while parsing data")
                    }
                } else {
                    print("Data isn't safe")
                }
            }
            task.resume()
        } else {
            print("\(urlString) is invalid")
        }
    }
    
    func parseJSON(_ postData: Data) -> [PostModel]? {
        let decoder = JSONDecoder()
        do {
            let decodeData = try decoder.decode([PostModel].self, from: postData)
            return decodeData
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
}

class FetchImage {
    let apiURL = "http://10.20.4.157:9014/post/"
    weak var delegate: PostManagerDelegate?
    
    func fecthImage(_ imageName: String) {
        let urlString = "\(apiURL)\(imageName)"
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
                    if let posts = self?.parseJSON(safeData) {
                        self?.delegate?.updatedData(postData: posts)
                    } else {
                        print("Error while parsing data")
                    }
                } else {
                    print("Data isn't safe")
                }
            }
            task.resume()
        } else {
            print("\(urlString) is invalid")
        }
    }
    
    func parseJSON(_ postData: Data) -> [PostModel]? {
        let decoder = JSONDecoder()
        do {
            let decodeData = try decoder.decode([PostModel].self, from: postData)
            return decodeData
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
}
