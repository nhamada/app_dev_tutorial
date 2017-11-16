//
//  ViewController.swift
//  ImageDownload_Revised_4
//
//  Created by Naohiro Hamada on 2017/11/15.
//  Copyright © 2017年 Naohiro Hamada. All rights reserved.
//

import UIKit

enum AppImage {
    case image0
    case image1
    
    init(index: Int) {
        switch index {
        case 0:
            self = .image0
        case 1:
            self = .image1
        default:
            fatalError("Invalid index: \(index)")
        }
    }
    
    var urlString: String {
        switch self {
        case .image0:
            return "https://github.com/nhamada/app_dev_tutorial/raw/master/01_DownloadImage/images/image00.jpg"
        case .image1:
            return "https://github.com/nhamada/app_dev_tutorial/raw/master/01_DownloadImage/images/image01.jpg"
        }
    }
    
    var url: URL {
        guard let url = URL(string: urlString) else {
            fatalError()
        }
        return url
    }
}

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBAction func onImageSegmentedControlValueChanged(_ sender: UISegmentedControl) {
        let image = AppImage(index: sender.selectedSegmentIndex)
        download(image: image, into: imageView)
    }
    
    private func download(image: AppImage, into imageView: UIImageView) {
        let session = URLSession.shared
        let task = session.dataTask(with: image.url, completionHandler: { (data, response, error) in
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
