//
//  UIView+extensions.swift
//  ReusableUI
//
//  Created by Uriel Rodriguez Sandoval on 23/08/24.
//

import UIKit

extension UIView {
    func loadNibContent() {
        let bundle = Bundle(for: type(of: self))
        let nibName = String(describing: type(of: self))
        
        guard let viewToAdd = bundle.loadNibNamed(nibName, owner: self, options: nil)?.first as? UIView else {
            return
        }
        
        // Configura la vista cargada para que se ajuste a los límites de la vista principal
        viewToAdd.frame = self.bounds
        viewToAdd.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        // Añadir la vista cargada como subvista
        addSubview(viewToAdd)
    }
}
