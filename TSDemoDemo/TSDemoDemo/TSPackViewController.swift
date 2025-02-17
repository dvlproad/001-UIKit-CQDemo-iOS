//
//  TSPack.swift
//  TSDemoDemo
//
//  Created by qian on 2025/2/17.
//  Copyright © 2025 dvlproad. All rights reserved.
//

import UIKit
import CQDemoKit

@objc class TSPackViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 创建 AssetPackager 来打包资源
        let packager = AssetPackager()
//        let outputFilePath = "Resources/assets.dat"
//        let outputFilePath = Bundle.main.path(forResource: "assets", ofType: "dat") ?? ""
        let outputFilePath = CQTSSandboxPathUtil.makeupAbsoluteFilePath("Resources/assets.dat", to: .documents, checkIfExist: false) ?? ""
//        let imageRelativePaths = ["Assets/image1.png"]
//        let jsonRelativePaths = ["Assets/data.json"]
        let imageRelativePaths = ["image1.png"]
        let jsonRelativePaths = ["data.json"]
        var imagePaths = [String]()
        for imageRelativePath in imageRelativePaths {
            let imagePath = Bundle.main.path(forResource: imageRelativePath, ofType: nil) ?? ""
            imagePaths.append(imagePath)
        }
        
        var jsonPaths = [String]()
        for jsonRelativePath in jsonRelativePaths {
            let jsonPath = Bundle.main.path(forResource: jsonRelativePath, ofType: nil) ?? ""
            jsonPaths.append(jsonPath)
        }
        
        packager.packageAssets(imagePaths: imagePaths, jsonPaths: jsonPaths, outputFile: outputFilePath)
        
        // 加载打包后的资源
        let assetManager = AssetManager(assetFilePath: outputFilePath)
        
        // 加载图片
        if let image = assetManager.loadImage(named: "image1.png") {
            let imageView = UIImageView(image: image)
            imageView.frame = CGRect(x: 20, y: 100, width: 200, height: 200)
            self.view.addSubview(imageView)
        }
        
        // 加载 JSON 数据
        if let json = assetManager.loadJSON(named: "data.json") {
            print("Loaded JSON: \(json)")
        }
    }
}
