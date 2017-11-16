//
//  Presenter.swift
//  ImageDownload_Final
//
//  Created by Naohiro Hamada on 2017/11/16.
//  Copyright © 2017年 Naohiro Hamada. All rights reserved.
//

import UIKit

protocol PresenterOutput: class {
    func show(image: UIImage)
    
    func clearImage()
}

final class Presenter {
    private let imageService = ImageService.default
    
    private weak var output: PresenterOutput?
    
    init(output: PresenterOutput) {
        self.output = output
    }
    
    func request(image: AppImage) {
        imageService.request(image: image, completion: { [weak self] (image, error) in
            if let image = image {
                self?.output?.show(image: image)
            }
        })
    }
}
