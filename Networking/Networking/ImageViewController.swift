//
//  ImageViewController.swift
//  Networking
//
//  Created by Жадаев Алексей on 10.08.2021.
//

import UIKit

class ImageViewController: UIViewController {
    
    private let url = "https://applelives.com/wp-content/uploads/2016/03/iPhone-SE-11.jpeg"
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.isHidden = true
        activityIndicator.hidesWhenStopped = true
        fetchImage()
    }
    
    func fetchImage() {
        
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
        
        NetworkManager.fetchImage(url: url) { image in
            self.activityIndicator.stopAnimating()
            self.imageView.image = image
        }
    }
}
