//
//  PhotoPicker.swift
//  GamingApp
//
//  Created by lmcm on 5/23/22.
//

import SwiftUI

struct PhotoPicker: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let imagePicker = UIImagePickerController()
        imagePicker.allowsEditing = true
        return imagePicker
    }
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) { }
    typealias UIViewControllerType = UIImagePickerController
}
