//
//  ViewController.swift
//  ImageDownload_Revised_3
//
//  Created by Naohiro Hamada on 2017/11/15.
//  Copyright © 2017年 Naohiro Hamada. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBAction func onImageSegmentedControlValueChanged(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            guard let url = URL(string: "https://github.com/nhamada/app_dev_tutorial/raw/master/01_DownloadImage/images/image00.jpg") else {
                return
            }
            downloadImage(from: url, into: imageView)
        case 1:
            guard let url = URL(string: "https://github.com/nhamada/app_dev_tutorial/raw/master/01_DownloadImage/images/image01.jpg") else {
                return
            }
            downloadImage(from: url, into: imageView)
        default:
            fatalError()
        }
    }
    
    private func downloadImage(from url: URL, into imageView: UIImageView) {
        let session = URLSession.shared
        let task = session.dataTask(with: url, completionHandler: { (data, response, error) in
            guard let data = data else {
                return
            }
            let image = UIImage(data: data)
            DispatchQueue.main.async {
                imageView.image = image
            }
        })
        task.resume()
    }
}
