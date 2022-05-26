//
//  PhotoPicker.swift
//  GamingApp
//
//  Created by lmcm on 5/23/22.
//

import SwiftUI

// Hace falta usar una vista de UIkit
// en este caso uiViewController
// después se pasa que tipo de `uiViewController` necesitamos
// es decir UIImagePickerController
struct PhotoPicker: UIViewControllerRepresentable {
    // Establecemos que se necesitara un parametro de entrada para la imagen
    // que se actualizará en la vista swiftUI
    @Binding var avatarImage: UIImage
    // Solo para hacer que salga el imagePicker, pero no guarda info
    //
    // Se declara el tipo de uiViewController de la struct
    typealias UIViewControllerType = UIImagePickerController
    // crea dos médotos para conformar el protocolo
    // make y update
    //
    // makeUIViewController crea la vista
    func makeUIViewController(context: Context) -> UIImagePickerController {
        // let imagePicker = UIImagePickerController() crea el imagePicker
        let imagePicker = UIImagePickerController()
        imagePicker.allowsEditing = true // opcional
        // y se regresa el imagePicker
        return imagePicker
    }

    // updateUIViewController actualiza la vista
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) { }

    // Por medio de un coordinador se pasa la info desde UIkit a SwiftUI 
    final class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        // Declara cual photoPicker va a usar el coordinador
        // En este caso a uno mismo
        let photoPicker: PhotoPicker
        init(photoPicker: PhotoPicker) {
            self.photoPicker = photoPicker
        }
        //
        // Escoger didFinishMedia en el imagePicker
        // el parametro `info` es la imagen
        // pero puede ser nil, se debe hacer con `if let` o `guard let`
        func imagePickerController(_ picker: UIImagePickerController,
                                   didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
            // info es un diccionario
            // con `.` se acceden a todas las llaves
            if let image = info[.editedImage] as? UIImage {
                photoPicker.avatarImage = image
            } else {
                print("Error in Image Picker")
            }
        }
    }

    func makeCoordinator() -> Coordinator {
        // Decirle al corrdinador que va a usar su propio photoPicker
        return Coordinator(photoPicker: self)
    }
}
