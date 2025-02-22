//
//  CQDemoWidgetExtensionDataUtil.swift
//  CQDemoShareFramework-Swift
//
//  Created by qian on 2024/12/3.
//  Copyright © 2024 dvlproad. All rights reserved.
//

import Foundation

@objc open class CQDemoAppGroupCacheUtil: NSObject {
    // 确保需要的那些 Target 都添加了 App Group
    @objc public static let ApplicationGroupName = "group.com.dvlproad.TSDemoDemo"
    
    @objc public static func getAppGroupDirectoryURL() -> URL? {
        let paths = FileManager.default.containerURL(forSecurityApplicationGroupIdentifier: ApplicationGroupName)
        if paths != nil{
            return paths!
        }
        return nil
    }
    
    @objc public static func dataForKey(_ key: String) -> Data? {
        if let userDefaults = UserDefaults(suiteName: ApplicationGroupName) {
            if let jsonData = userDefaults.value(forKey: key) {
                return jsonData as? Data
            }
            
            return nil
        }
        return nil
    }
    
    @objc public static func stringForKey(_ key: String) -> String? {
        if let userDefaults = UserDefaults(suiteName: ApplicationGroupName) {
            if let jsonData = userDefaults.value(forKey: key) {
                return jsonData as? String
            }
            
            return nil
        }
        return nil
    }
    
    @objc public static func set(_ value: Any?, forKey: String) {
        if let userDefaults = UserDefaults(suiteName: ApplicationGroupName) {
            userDefaults.set(value, forKey: forKey)
            userDefaults.synchronize()
        }
    }
}


@objc open class CQDemoWidgetExtensionDataUtil: NSObject {
    // 图标资源相对路径
    @objc public static func updateSymbolsBundleRelativePath(_ relativePath: String) {
        CQDemoAppGroupCacheUtil.set(relativePath, forKey: "CQDemoAppGroupCacheUtil_symbolsBundleRelativePath")
    }
    
    @objc public static func getSymbolsBundleRelativePath() -> String? {
        let value = CQDemoAppGroupCacheUtil.stringForKey("CQDemoAppGroupCacheUtil_symbolsBundleRelativePath")
        return value
    }
    
    @objc public static func getSymbolBundle() -> Bundle? {
        var downloadSymbolDirURL: URL? = getDownloadSymbolDirURL()
        guard let downloadSymbolDirURL = downloadSymbolDirURL else {
            return nil
        }
        var symbolsBundleRelativePath = getSymbolsBundleRelativePath()
        return getSymbolsBundle(from: downloadSymbolDirURL, downloadBundleRelativePath: symbolsBundleRelativePath)
        
        /*
        var downloadBundle: Bundle?
        let mainBundle: Bundle = Bundle.main
        if let downloadBundlePath = mainBundle.path(forResource: "DownloadSymbol", ofType: ".bundle") {
            downloadBundle = Bundle(path: downloadBundlePath)
        }
        return downloadBundle
        */
    }
    
    @objc public static func getDownloadSymbolDirURL() -> URL? {
        return CQDemoAppGroupCacheUtil.getAppGroupDirectoryURL()
    }
    
    @objc public static func getSymbolsBundle(from directoryURL: URL, downloadBundleRelativePath: String?) -> Bundle? {
        // 获取沙盒的路径（假设文件在应用的文档目录下）
        guard let unzipFileName = downloadBundleRelativePath else {
            return nil
        }
        
        let unzipDirectoryPath = directoryURL.path
        let unzipBundlePath = (unzipDirectoryPath as NSString).appendingPathComponent(unzipFileName)
        let downloadBundle: Bundle? = Bundle.init(path: unzipBundlePath)
        return downloadBundle
    }
    
    @objc public static func downloadFile(
        fileUrl: String,
        directoryURL: URL,
        saveWithFileName: String,
        success: @escaping ((_ cacheURL: URL) -> Void),
        failure: @escaping ((_ errorMessage: String) -> Void)
    ) {
        guard let fileURL = URL(string: fileUrl) else {
            failure("文件路径错误:\(fileUrl)")
            return
        }
        
        // 下载部分
        let downloadTask = URLSession.shared.downloadTask(with: fileURL, completionHandler: { (url, response: URLResponse?, error) in
            guard let url = url, (response as? HTTPURLResponse)?.statusCode == 200 else {
                failure("文件下载失败")
                return
            }
            
            do {
                let data = try Data(contentsOf: url)
                let cacheURL = directoryURL.appendingPathComponent(saveWithFileName)
                try data.write(to: cacheURL)
                success(cacheURL)
                
            } catch {
                failure("文件保存失败")
            }
        })
        downloadTask.resume()
    }
}
