//
//  ViewController.swift
//  ReusableUI
//
//  Created by Uriel Rodriguez Sandoval on 21/08/24.
//

import UIKit

class ViewController: UIViewController, ButtonActionDelegate {
    
    @IBOutlet weak var headerView: HeaderView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let myButton = ButtonBuilder()
            .setTitle("Press Me")
            .setBackgroundColor(.systemRed)
            .setShadowColor(.black)
            .setShadowOffset(CGSize(width: 0, height: 3))
            .setShadowOpacity(0.5)
            .setShadowRadius(6.0)
            .setWidth(120)
            .setHeight(60)
            .setActionDelegate(self)
            .build()
        
        // Añadir el botón a la vista
        view.addSubview(myButton)
        myButton.center = view.center
        
        headerView.delegateBackItem = self
        headerView.delegateLeftItem = self
        headerView.delegateRightItem = self
    }
    
    
    func buttonTapped(_ sender: UIButton) {
        print("Button was tapped!")
        // Aquí puedes agregar cualquier acción que desees cuando el botón es presionado
    }
}

extension ViewController: HeaderViewBackItemProtocols {
    func backEvent() {
        print("Hola mundo ----> Actiuon to Back screen")
    }
}

extension ViewController: HeaderViewLeftProtocols {
    func didsearch(_ value: String) {
        print("didsearch")
    }
}

extension ViewController: HeaderViewRightProtocols {
    func menuEvent() {
        print("menuEvent")
    }
}
