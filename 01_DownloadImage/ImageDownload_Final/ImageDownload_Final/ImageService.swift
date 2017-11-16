//
//  ImageService.swift
//  ImageDownload_Final
//
//  Created by Naohiro Hamada on 2017/11/16.
//  Copyright © 2017年 Naohiro Hamada. All rights reserved.
//

import UIKit

final class ImageService {
    static let `default` = ImageService(configuration: .default)
    
    private let session: URLSession
    private var dataTask: URLSessionDataTask? = nil
    
    init(configuration: URLSessionConfiguration) {
        session = URLSession(configuration: configuration)
    }
    
    func request(image: AppImage, completion: @escaping (UIImage?, Error?) -> Void) {
        if let dataTask = dataTask {
            dataTask.cancel()
            self.dataTask = nil
        }
        
        dataTask = session.dataTask(with: image.url, completionHandler: { (data, response, error) in
            guard let data = data else {
                DispatchQueue.main.async {
                    completion(nil, error)
                }
                return
            }
            let image = UIImage(data: data)
            DispatchQueue.main.async {
                completion(image, nil)
            }
        })
        dataTask?.resume()
    }
}
