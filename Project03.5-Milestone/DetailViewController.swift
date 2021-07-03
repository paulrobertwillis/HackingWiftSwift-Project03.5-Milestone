//
//  DetailViewController.swift
//  Project03.5-Milestone
//
//  Created by Paul Willis on 01/07/2021.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet var imageView: UIImageView!
    var selectedImage: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        title = "test"
//        navigationController?.navigationBar.prefersLargeTitles = false

        if let imageToLoad = selectedImage {
            imageView.image = UIImage(named: imageToLoad)
        }
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }
    
    @objc func shareTapped() {
        
        guard let image = imageView.image?.jpegData(compressionQuality: 0.8) else {
                print("No image found")
                return
            }

        let vc = UIActivityViewController(activityItems: [image], applicationActivities: [])
            
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
            
        present(vc, animated: true)
    }
}
