import Foundation
import SwiftExtraCJHelper

public struct CQDMBundleModel {
    var nameSpace: String
    var className: String
    var bundleName: String
}

public extension Bundle {
    // 方法一：不需要循环
    public static func cqdemo_frameworkBundle(bundleModel: CQDMBundleModel) -> Bundle? {
        if //let tokenClass = NSClassFromString(className) {
            //let tokenClass = NSClassFromStringCJHelper.swiftClass(from: "CQWidgetModel", nameSpace: "CQViewElement_Swift")
            let tokenClass = NSClassFromStringCJHelper.swiftClass(from: bundleModel.className, nameSpace: bundleModel.nameSpace) {
            let frameworkBundle = Bundle(for: tokenClass)
            if let url = frameworkBundle.url(forResource: bundleModel.bundleName, withExtension: "bundle") {
                return Bundle(url: url)
            }
        }
        return nil
    }
    
    // 方法二：需要循环
    public static func cqdemo_frameworkBundle(bundleName: String) -> Bundle? {
        var bundle: Bundle?
        // Search all loaded bundles first (e.g., directly embedded .bundle)
        bundle = Bundle.allBundles.first { $0.bundleURL.lastPathComponent == "\(bundleName).bundle" }
        // Search inside each framework for resource bundles (use_frameworks! case)
        if bundle == nil {
            for framework in Bundle.allFrameworks {
                if let url = framework.url(forResource: bundleName, withExtension: "bundle"),
                   let found = Bundle(url: url) {
                    bundle = found
                    break
                }
            }
        }
        
        return bundle
    }
}
