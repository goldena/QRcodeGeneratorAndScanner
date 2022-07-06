//
//  ContentView.swift
//  QRcodeGeneratorAndScanner
//
//  Created by Denis Goloborodko on 6.07.22.
//

import SwiftUI
import CoreImage.CIFilterBuiltins

struct ContentView: View {
    
    @State var qrString = UUID().uuidString
    @State var isQRCodeScannerPresented: Bool = false
    
    var body: some View {
        Spacer()
        
        if let uiImage = UIImage.qrCode(from: qrString) {
            Image(uiImage: uiImage)
                .interpolation(.none)
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
        }
        
        Spacer()
        
        Button {
            isQRCodeScannerPresented = true
        } label: {
            Text("QR Code Scanner")
        }
        .sheet(isPresented: $isQRCodeScannerPresented) {
            QRCodeScannerView()
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
