//
//  QRCodeScannerView.swift
//  QRcodeGeneratorAndScanner
//
//  Created by Denis Goloborodko on 7.07.22.
//

import SwiftUI

struct QRCodeScannerView: UIViewControllerRepresentable {

    func updateUIViewController(
        _ uiViewController: UIViewControllerType,
        context: Context
    ) {}

    func makeUIViewController(context: Context) -> some QRCodeScannerViewController {
        QRCodeScannerViewController()
    }
    
}

struct QRCodeScannerView_Previews: PreviewProvider {
    static var previews: some View {
        QRCodeScannerView()
    }
}
