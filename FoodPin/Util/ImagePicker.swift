//
//  ImagePicker.swift
//  FoodPin
//
//  Created by Ly Gia Huy on 25/03/2023.
//

import SwiftUI
import UIKit


struct ImagePicker: UIViewControllerRepresentable {
    var sourceType: UIImagePickerController.SourceType = .photoLibrary
    @Binding var selectImage: UIImage
    @Environment(\.dismiss) private var dismiss
}
