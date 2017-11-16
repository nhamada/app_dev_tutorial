//
//  ViewController.swift
//  ImageDownload_Revised_1
//
//  Created by Naohiro Hamada on 2017/10/31.
//  Copyright © 2017年 Naohiro Hamada. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var buttonForImage1: UIButton!
    @IBOutlet weak var buttonForImage2: UIButton!
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBAction func onButtonForImage1Tapped(_ sender: UIButton) {
        guard let url = URL(string: "https://github.com/nhamada/app_dev_tutorial/raw/master/01_DownloadImage/images/image00.jpg") else {
            return
        }
        
        let session = URLSession.shared
        let task = session.dataTask(with: url, completionHandler: { [unowned self] (data, response, error) in
            guard let data = data else {
                return
            }
            let image = UIImage(data: data)
            DispatchQueue.main.async { [unowned self] in
                self.imageView.image = image
            }
        })
        task.resume()
    }
    
    @IBAction func onButtonForImage2Tapped(_ sender: UIButton) {
        guard let url = URL(string: "https://github.com/nhamada/app_dev_tutorial/raw/master/01_DownloadImage/images/image01.jpg") else {
            return
        }
        
        let session = URLSession.shared
        let task = session.dataTask(with: url, completionHandler: { [unowned self] (data, response, error) in
            guard let data = data else {
                return
            }
            let image = UIImage(data: data)
            DispatchQueue.main.async { [unowned self] in
                self.imageView.image = image
            }
        })
        task.resume()
    }
}

