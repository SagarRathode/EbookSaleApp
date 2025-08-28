//
//  PDFViewer.swift
//  EbookSaleApp
//
//  Created by Sagar Rathode on 27/08/25.
//

import PDFKit
import SwiftUI

struct PDFViewer: View {
    let fileName: String

    var body: some View {
        if let url = Bundle.main.url(forResource: fileName, withExtension: nil),
           let pdfDoc = PDFDocument(url: url) {
            PDFContentView(document: pdfDoc)   // ✅ renamed helper view
        } else {
            Text("PDF not found")
                .foregroundColor(.red)
        }
    }
}

/// A wrapper around PDFKit's PDFView for SwiftUI
struct PDFContentView: UIViewRepresentable {
    let document: PDFDocument

    func makeUIView(context: Context) -> PDFView {
        let pdfView = PDFView()
        pdfView.autoScales = true
        pdfView.displayMode = .singlePageContinuous
        pdfView.document = document
        return pdfView
    }

    func updateUIView(_ uiView: PDFView, context: Context) {
        uiView.document = document
    }
}
