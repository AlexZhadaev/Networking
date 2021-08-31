//
//  NetworkManager.swift
//  Networking
//
//  Created by Жадаев Алексей on 31.08.2021.
//

import UIKit

class NetworkManager {
    
    static func getRequest(url: String) {
        guard let url = URL(string: url) else { return }
        
        let session = URLSession.shared
        session.dataTask(with: url) { data, response, error in
            guard let response = response, let data = data else { return }
            debugPrint(response)
            
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: [])
            } catch {
                debugPrint(error.localizedDescription)
            }
        }.resume()
    }
    
    static func postRequest(url: String) {
        guard let url = URL(string: url) else { return }
        
        let userData = ["Course": "Networking", "Lesson": "Post request"]
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        guard let httpBody = try? JSONSerialization.data(withJSONObject: userData, options: []) else { return }
        request.httpBody = httpBody
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let session = URLSession.shared
        session.dataTask(with: request) { data, response, error in
            guard let data = data, let response = response else { return }
            debugPrint(response)
            
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                print(json)
            } catch {
                debugPrint(error)
            }
        }.resume()
    }
    
    static func fetchImage(url: String, completion: @escaping (_ image: UIImage)->()) {
        guard let url = URL(string: url) else { return }
        
        let session = URLSession.shared
        session.dataTask(with: url) { data, response, error in
            if let data = data, let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    completion(image)
                }
            }
        }.resume()
    }
    
    static func fetchCourses(url: String, completion: @escaping ([Course])->()) {
        guard let url = URL(string: url) else { return }
        
        let session = URLSession.shared
        session.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let courses = try decoder.decode([Course].self, from: data)
                print(courses)
                completion(courses)
            } catch let error {
                debugPrint("json serialization error", error)
            }
        }.resume()
    }
}
