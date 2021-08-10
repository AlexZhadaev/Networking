//
//  ViewController.swift
//  Networking
//
//  Created by Жадаев Алексей on 03.08.2021.
//

import UIKit

class ViewController: UIViewController {

    
    @IBAction func getRequest(_ sender: UIButton) {
        
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
        
        let session = URLSession.shared
        
        session.dataTask(with: url) { data, response, error in
            guard let response = response, let data = data else { return }
        
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: [])
            } catch {
                debugPrint(error.localizedDescription)
            }
            
        }.resume()
        
    }
    
    @IBAction func postRequest(_ sender: UIButton) {
        
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
        
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
}

