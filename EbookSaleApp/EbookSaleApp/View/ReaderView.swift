//
//  ReaderView.swift
//  EbookSaleApp
//
//  Created by Sagar Rathode   on 22/08/25.
//


import SwiftUI
import PDFKit

struct ReaderView: View {
    let book: Ebook
    @State private var nightMode = false
    @State private var searchText = ""
    @State private var currentPage: Int = 1
    @State private var bookmarkedPages: [Int] = []
    
    var body: some View {
        VStack {
            // Toolbar with controls
            HStack {
                Button(action: { nightMode.toggle() }) {
                    Image(systemName: nightMode ? "sun.max.fill" : "moon.fill")
                }
                
                Spacer()
                
                Button(action: {
                    if !bookmarkedPages.contains(currentPage) {
                        bookmarkedPages.append(currentPage)
                    }
                }) {
                    Image(systemName: "bookmark")
                }
                
                Spacer()
                
                TextField("Search", text: $searchText, onCommit: {
                    NotificationCenter.default.post(
                        name: .searchPDF,
                        object: nil,
                        userInfo: ["query": searchText]
                    )
                })
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .frame(width: 150)
            }
            .padding(.horizontal)
            
            // PDF Viewer
            PDFKitView(fileName: book.fileName,
                      nightMode: nightMode,
                      currentPage: $currentPage)
        }
        .navigationTitle(book.title)
        .edgesIgnoringSafeArea(.all)
    }
}

// MARK: - PDFKit Wrapper
struct PDFKitView: UIViewRepresentable {
    let fileName: String
    let nightMode: Bool
    @Binding var currentPage: Int
    
    func makeUIView(context: Context) -> PDFView {
        let pdfView = PDFView()
        pdfView.autoScales = true
        pdfView.displayMode = .singlePageContinuous
        pdfView.displayDirection = .vertical
        pdfView.backgroundColor = nightMode ? .black : .systemBackground
        
        // Load PDF
        if let url = Bundle.main.url(forResource: fileName, withExtension: nil),
           let document = PDFDocument(url: url) {
            pdfView.document = document
        }
        
        // Listen for search
        NotificationCenter.default.addObserver(forName: .searchPDF,
                                               object: nil,
                                               queue: .main) { notification in
            if let query = notification.userInfo?["query"] as? String {
                if let selections = pdfView.document?.findString(query, withOptions: .caseInsensitive),
                   let firstMatch = selections.first {
                    pdfView.setCurrentSelection(firstMatch, animate: true)
                    pdfView.go(to: firstMatch)
                }

            }
        }
        
        // Track page changes
        NotificationCenter.default.addObserver(forName: Notification.Name.PDFViewPageChanged,
                                               object: pdfView,
                                               queue: .main) { _ in
            if let page = pdfView.currentPage,
               let index = pdfView.document?.index(for: page) {
                currentPage = index + 1
            }
        }
        
        return pdfView
    }
    
    func updateUIView(_ uiView: PDFView, context: Context) {
        uiView.backgroundColor = nightMode ? .black : .systemBackground
    }
}

// MARK: - Notification for Search
extension Notification.Name {
    static let searchPDF = Notification.Name("searchPDF")
}
