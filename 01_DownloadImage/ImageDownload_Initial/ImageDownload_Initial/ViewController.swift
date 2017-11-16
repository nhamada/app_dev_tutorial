//
//  ViewController.swift
//  ImageDownload_Initial
//
//  Created by Naohiro Hamada on 2017/10/29.
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
        do {
            let imageData = try Data(contentsOf: url)
            let image = UIImage(data: imageData)
            imageView.image = image
        } catch (let error){
            NSLog("\(error)")
        }
    }
    
    @IBAction func onButtonForImage2Tapped(_ sender: UIButton) {
        guard let url = URL(string: "https://github.com/nhamada/app_dev_tutorial/raw/master/01_DownloadImage/images/image01.jpg") else {
            return
        }
        do {
            let imageData = try Data(contentsOf: url)
            let image = UIImage(data: imageData)
            imageView.image = image
        } catch (let error){
            NSLog("\(error)")
        }
    }
}
