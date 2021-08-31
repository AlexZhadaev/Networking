//
//  MainCollectionViewController.swift
//  Networking
//
//  Created by Жадаев Алексей on 31.08.2021.
//

import UIKit

enum Actions: String, CaseIterable {
    case downloadImage = "Download image"
    case get = "GET"
    case post = "POST"
    case ourCourses = "Our courses"
    case uploadImage = "Upload image"
}

class MainCollectionViewController: UICollectionViewController {

    private let reuseIdentifier = "cellGalleryIdentifier"
    
    private let url = "https://jsonplaceholder.typicode.com/posts"
    
    let actions = Actions.allCases


    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return actions.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! MainCollectionViewCell
        cell.label.text = actions[indexPath.item].rawValue
        return cell
    }

    // MARK: UICollectionViewDelegate
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let action = actions[indexPath.item]
        
        switch action {
        case .downloadImage:
            performSegue(withIdentifier: "imageScreenSegue", sender: self)
        case .get:
            NetworkManager.getRequest(url: url)
        case .post:
            NetworkManager.postRequest(url: url)
        case .ourCourses:
            performSegue(withIdentifier: "coursesScreenSegue", sender: self)
        case .uploadImage:
            print("Upload image")
        }
    }
}
