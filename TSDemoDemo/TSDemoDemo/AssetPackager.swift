//
//  AssetPackager.swift
//  TSDemoDemo
//
//  Created by qian on 2025/2/17.
//  Copyright © 2025 dvlproad. All rights reserved.
//

import Foundation

class AssetPackager {
    func packageAssets(imagePaths: [String], jsonPaths: [String], outputFile: String) {
        // 获取目标文件的路径
        let outputURL = URL(fileURLWithPath: outputFile)
        
        // 获取文件所在的目录路径
        let directoryURL = outputURL.deletingLastPathComponent()
        
        // 如果目录不存在，则创建目录
        if !FileManager.default.fileExists(atPath: directoryURL.path) {
            do {
                try FileManager.default.createDirectory(at: directoryURL, withIntermediateDirectories: true, attributes: nil)
                print("Created directory: \(directoryURL.path)")
            } catch {
                print("Failed to create directory: \(directoryURL.path), error: \(error)")
                return
            }
        }
        
        
        // 继续进行资源的打包操作
        var assetData = Data()
        
        // 创建文件头
        var header = AssetHeader(version: 1, resourceCount: Int32(imagePaths.count + jsonPaths.count))
        let headerData = withUnsafeBytes(of: &header) { Data($0) }
        assetData.append(headerData)
        
        // 打包资源
        var fileEntries: [AssetFileEntry] = []
        var offset = headerData.count
        var resourceData = Data()

        // 处理图片资源
        for imagePath in imagePaths {
            let imageName = (imagePath as NSString).lastPathComponent
            if let imageData = try? Data(contentsOf: URL(fileURLWithPath: imagePath)) {
                let entry = AssetFileEntry(name: imageName, type: .image, offset: Int32(offset), size: Int32(imageData.count))
                fileEntries.append(entry)
                assetData.append(imageData)
                offset += imageData.count
            }
        }
        
        // 处理 JSON 资源
        for jsonPath in jsonPaths {
            let jsonName = (jsonPath as NSString).lastPathComponent
            if let jsonData = try? Data(contentsOf: URL(fileURLWithPath: jsonPath)) {
                let entry = AssetFileEntry(name: jsonName, type: .json, offset: Int32(offset), size: Int32(jsonData.count))
                fileEntries.append(entry)
                assetData.append(jsonData)
                offset += jsonData.count
            }
        }
        
        // 创建资源文件表decrypt
        for entry in fileEntries {
            // 直接将 entry 传递给 withUnsafeBytes，不需要 inout
            let entryData = withUnsafeBytes(of: entry) { Data($0) }
            assetData.append(entryData)
        }
        
        // 写入输出文件
        do {
            try assetData.write(to: URL(fileURLWithPath: outputFile))
            print("Assets packaged successfully! \(outputFile)")
        } catch {
            print("Error packaging assets: \(error)")
        }
    }
}
