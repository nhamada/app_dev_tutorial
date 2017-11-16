//
//  AppImage.swift
//  ImageDownload_Final
//
//  Created by Naohiro Hamada on 2017/11/16.
//  Copyright © 2017年 Naohiro Hamada. All rights reserved.
//

import Foundation

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
