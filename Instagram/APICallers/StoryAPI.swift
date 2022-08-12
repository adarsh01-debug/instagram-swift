//
//  StoryAPI.swift
//  Instagram
//
//  Created by Adarsh Pandey on 11/08/22.
//

import Foundation

class StoryAPI {
    
    let apiURL = "http://10.20.4.157:9011/story"
    weak var delegate: StoryManagerDelegate?
    
    func fecthStoryDetails() {
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
                    if let stories = self?.parseJSON(safeData) {
                        self?.delegate?.updatedData(storyData: stories)
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
    
    func parseJSON(_ storyData: Data) -> [StoryModel]? {
        let decoder = JSONDecoder()
        do {
            let decodeData = try decoder.decode([StoryModel].self, from: storyData)
            return decodeData
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
}
