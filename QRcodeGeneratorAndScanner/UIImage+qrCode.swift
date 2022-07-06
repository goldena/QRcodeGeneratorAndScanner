//
//  String+qrCode.swift
//  QRcodeGeneratorAndScanner
//
//  Created by Denis Goloborodko on 7.07.22.
//

import SwiftUI

extension UIImage {
    
    static func qrCode(from string: String) -> UIImage? {
        let qrCodeGeneratorFilter = CIFilter.qrCodeGenerator()
        qrCodeGeneratorFilter.message = Data(string.utf8)

        if let ciImage = qrCodeGeneratorFilter.outputImage,
           let cgImage = CIContext().createCGImage(ciImage, from: ciImage.extent) {
            return UIImage(cgImage: cgImage)
        } else {
            return nil
        }
    }
    
}
