//
//  AssetManager.swift
//  TSDemoDemo
//
//  Created by qian on 2025/2/17.
//  Copyright © 2025 dvlproad. All rights reserved.
//

import Foundation
import UIKit

// 定义资源的类型
enum AssetType {
    case image
    case json
    // 可以根据需求增加其他资源类型
}

// 文件头结构
struct AssetHeader {
    var version: Int32
    var resourceCount: Int32
}

// 文件表中的每项记录
struct AssetFileEntry {
    var name: String
    var type: AssetType
    var offset: Int32
    var size: Int32
}

class AssetManager {
    private var assetBundle: Data?
    private var fileEntries: [AssetFileEntry] = []

    init(assetFilePath: String) {
        // 加载文件数据
        guard let fileData = try? Data(contentsOf: URL(fileURLWithPath: assetFilePath)) else {
            print("Failed to load asset file")
            return
        }
        self.assetBundle = fileData
        self.parseHeader()
    }
    
    private func parseHeader() {
        guard let bundle = assetBundle else { return }
        
        // 读取文件头信息
        var header = AssetHeader(version: 0, resourceCount: 0)
        let headerSize = MemoryLayout<AssetHeader>.size
        _ = withUnsafeMutableBytes(of: &header) { bundle.copyBytes(to: $0, from: 0..<headerSize) }
        
        // 文件头解析成功
        print("Asset Version: \(header.version), Resource Count: \(header.resourceCount)")
        
        // 解析文件表（AssetFileEntry）
        var offset = headerSize
        for _ in 0..<header.resourceCount {
            var entry = AssetFileEntry(name: "", type: .image, offset: 0, size: 0)
            let entrySize = MemoryLayout<AssetFileEntry>.size
            _ = withUnsafeMutableBytes(of: &entry) { bundle.copyBytes(to: $0, from: offset..<offset+entrySize) }
            fileEntries.append(entry)
            offset += entrySize
        }
    }
    
    // 获取资源
    func loadImage(named imageName: String) -> UIImage? {
        guard let entry = fileEntries.first(where: { $0.name == imageName && $0.type == .image }) else {
            print("Image not found")
            return nil
        }
        
        guard let imageData = extractData(for: entry) else {
            print("Failed to extract image data")
            return nil
        }
        
        return UIImage(data: imageData)
    }

    func loadJSON(named jsonName: String) -> [String: Any]? {
        guard let entry = fileEntries.first(where: { $0.name == jsonName && $0.type == .json }) else {
            print("JSON not found")
            return nil
        }
        
        guard let jsonData = extractData(for: entry) else {
            print("Failed to extract JSON data")
            return nil
        }
        
        return try? JSONSerialization.jsonObject(with: jsonData, options: []) as? [String: Any]
    }
    
    // 提取资源数据
    private func extractData(for entry: AssetFileEntry) -> Data? {
        guard let bundle = assetBundle else { return nil }
        
        // 计算资源在文件中的偏移位置
        let dataRange = entry.offset..<entry.offset + entry.size
        
        // 将 Range<Int32> 转换为 Range<Int>
        let range = Range<Data.Index>(uncheckedBounds: (lower: Int(dataRange.lowerBound), upper: Int(dataRange.upperBound)))
        
        // 提取资源数据
        let resourceData = bundle.subdata(in: range)
        
        // 如果需要，可以在此处对资源数据进行解密或解压操作
        // 示例: resourceData = decrypt(resourceData)
        
        return resourceData
    }
    
    // 示例：解密资源数据
    private func decrypt(_ data: Data) -> Data? {
        // 实现你的解密逻辑
        return data
    }
}
