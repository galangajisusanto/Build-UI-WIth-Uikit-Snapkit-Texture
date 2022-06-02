//
//  ViewPreview.swift
//  Build UI WIth Snapkit Texture
//
//  Created by MEKARI on 01/06/22.
//

import UIKit
import SwiftUI

struct ViewPreview: UIViewRepresentable {
    let viewBuilder: () -> UIView

    init(_ viewBuilder: @escaping () -> UIView) {
        self.viewBuilder = viewBuilder
    }

    func makeUIView(context: Context) -> some UIView {
        viewBuilder()
    }

    func updateUIView(_ uiView: UIViewType, context: Context) {
        // Not needed
    }
}
