//
//  ButtonBuilder.swift
//  ReusableUI
//
//  Created by Uriel Rodriguez Sandoval on 23/08/24.
//

import UIKit

protocol ButtonActionDelegate: AnyObject {
    func buttonTapped(_ sender: UIButton)
}

class ButtonBuilder {
    private var title: String = ""
    private var backgroundColor: UIColor = .systemBlue
    private var shadowColor: UIColor = .black
    private var shadowOffset: CGSize = CGSize(width: 0, height: 2)
    private var shadowOpacity: Float = 0.7
    private var shadowRadius: CGFloat = 4.0
    private var width: CGFloat = 100
    private var height: CGFloat = 50
    private var cornerRadius: CGFloat = 8.0
    private weak var actionDelegate: ButtonActionDelegate?
    
    func setTitle(_ title: String) -> ButtonBuilder {
        self.title = title
        return self
    }
    
    func setBackgroundColor(_ color: UIColor) -> ButtonBuilder {
        self.backgroundColor = color
        return self
    }
    
    func setShadowColor(_ color: UIColor) -> ButtonBuilder {
        self.shadowColor = color
        return self
    }
    
    func setShadowOffset(_ offset: CGSize) -> ButtonBuilder {
        self.shadowOffset = offset
        return self
    }
    
    func setShadowOpacity(_ opacity: Float) -> ButtonBuilder {
        self.shadowOpacity = opacity
        return self
    }
    
    func setShadowRadius(_ radius: CGFloat) -> ButtonBuilder {
        self.shadowRadius = radius
        return self
    }
    
    func setWidth(_ width: CGFloat) -> ButtonBuilder {
        self.width = width
        return self
    }
    
    func setHeight(_ height: CGFloat) -> ButtonBuilder {
        self.height = height
        return self
    }
    
    func setCornerRadius(_ radius: CGFloat) -> ButtonBuilder {
        self.cornerRadius = radius
        return self
    }
    
    func setActionDelegate(_ delegate: ButtonActionDelegate) -> ButtonBuilder {
        self.actionDelegate = delegate
        return self
    }
    
    func build() -> UIView {
        // Crear el botón con esquinas redondeadas
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.backgroundColor = backgroundColor
        button.layer.cornerRadius = cornerRadius
        button.layer.masksToBounds = true
        button.frame.size = CGSize(width: width, height: height)
        button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        
        // Crear la vista contenedora que manejará la sombra
        let containerView = UIView(frame: button.frame)
        containerView.layer.shadowColor = shadowColor.cgColor
        containerView.layer.shadowOffset = shadowOffset
        containerView.layer.shadowOpacity = shadowOpacity
        containerView.layer.shadowRadius = shadowRadius
        
        // Añadir el botón dentro de la vista contenedora
        containerView.addSubview(button)
        
        return containerView
    }
    
    @objc private func buttonTapped(_ sender: UIButton) {
        actionDelegate?.buttonTapped(sender)
    }
}
