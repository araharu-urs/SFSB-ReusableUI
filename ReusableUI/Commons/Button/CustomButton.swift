//
//  CustomButton.swift
//  ReusableUI
//
//  Created by Uriel Rodriguez Sandoval on 21/08/24.
//

import UIKit

enum Icons: String {
    case arrow = "arrow.right.to.line"
    case terminal = "apple.terminal"
}

class CustomButton: UIView {
    
    @IBOutlet weak var imgItem: UIImageView! {
        didSet {
            if let image = UIImage(systemName: Icons.arrow.rawValue) {
                imgItem.image = image
            }
        }
    }
    
    @IBOutlet weak var button: UIButton!
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        loadNibContent()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadNibContent()
    }
}
