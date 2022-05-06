//
//  Color.swift
//  GamingApp
//
//  Created by LMCM on 5/6/22.
//

import Foundation
import SwiftUI

extension Color {
    static let theme  = ColorTheme()
}

struct ColorTheme {
    let backgroundColor = Color("BackgroundColor")
    let secondaryColor = Color("SecondaryColor")
    let lightCyan = Color("LightCyan")
    let darkCyan = Color("DarkCyan")
}
