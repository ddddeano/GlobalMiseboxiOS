//
//  File.swift
//  
//
//  Created by Daniel Watson on 23.02.2024.
//

import Foundation
import FirebaseiOSMisebox
import _PhotosUI_SwiftUI

public class PhotosPickerVM: ObservableObject {
    let firebaseManager: FirestoreManager
    var documentId: String
    var collectionName: String
    
    @Published public var imageSelection: PhotosPickerItem? = nil {
        didSet {
            Task {
                await processImageSelection()
            }
        }
    }
    var path = ""

    public init(path: String, documentId: String, collectionName: String) {
        self.path = path
        self.documentId = documentId
        self.collectionName = collectionName
        self.firebaseManager = FirestoreManager()
    }

    private func processImageSelection() async {
        guard let selection = imageSelection else { return }
        await loadImageData(from: selection)
    }
    
    private func loadImageData(from selection: PhotosPickerItem?) async {
        guard let selection = selection,
              let data = try? await selection.loadTransferable(type: Data.self) else { return }
        
        await uploadImageToFirebaseStorage(imageData: data)
    }

    private func uploadImageToFirebaseStorage(imageData: Data) async {
        if let downloadURL = try? await FirebaseStorageManager.shared.uploadImage(imageData: imageData, inDirectory: path) {
            await updateFirestoreDocument(withImageUrl: downloadURL)
        }
    }

    private func updateFirestoreDocument(withImageUrl imageUrl: String) async {
         await firebaseManager.updateDocumentField(collection: self.collectionName, documentID: self.documentId, data: ["image_url": imageUrl])
    }
}
