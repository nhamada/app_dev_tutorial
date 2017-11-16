//
//  ViewController.swift
//  ImageDownload_Final
//
//  Created by Naohiro Hamada on 2017/11/16.
//  Copyright © 2017年 Naohiro Hamada. All rights reserved.
//

import UIKit

class ViewController: UIViewController, PresenterOutput {
    // MARK:- Outlets
    @IBOutlet weak var imageView: UIImageView!
    
    // MARK:- Private properties
    private var presenter: Presenter!
    
    // MARK:- Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.presenter = Presenter(output: self)
    }
    
    // MARK:- Actions
    @IBAction func onImageSegmentedControlValueChanged(_ sender: UISegmentedControl) {
        let image = AppImage(index: sender.selectedSegmentIndex)
        presenter.request(image: image)
    }
    
    // MARK:- PresenterOutput
    func show(image: UIImage) {
        imageView.image = image
    }
    
    func clearImage() {
        imageView.image = nil
    }
}
