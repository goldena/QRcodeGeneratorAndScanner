//
//  QRCodeScannerView.swift
//  QRcodeGeneratorAndScanner
//
//  Created by Denis Goloborodko on 7.07.22.
//

import SwiftUI

struct QRCodeScannerView: UIViewControllerRepresentable {

    @Binding var scannedCode: String

    func updateUIViewController(
        _ uiViewController: UIViewControllerType,
        context: Context
    ) {}

    func makeUIViewController(context: Context) -> some QRCodeScannerViewController {
        let qrCodeScannerViewController = QRCodeScannerViewController()
        qrCodeScannerViewController.delegate = context.coordinator
        return qrCodeScannerViewController
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(of: self)
    }

}

protocol QRCodeScannerViewControllerDelegate: AnyObject {

    func didScanQRCode(qrCode: String?)

}

extension QRCodeScannerView {

    final class Coordinator: NSObject, QRCodeScannerViewControllerDelegate {

        var parent: QRCodeScannerView!

        init(of parent: QRCodeScannerView) {
            self.parent = parent
        }

        func didScanQRCode(qrCode: String?) {
            parent.scannedCode = qrCode ?? ""
        }

    }

}

struct QRCodeScannerView_Previews: PreviewProvider {

    @State private static var scannedCode: String = "Some scanned code"

    static var previews: some View {
        QRCodeScannerView(scannedCode: $scannedCode)
    }
    
}
