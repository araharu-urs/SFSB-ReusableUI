//
//  HeaderView.swift
//  ReusableUI
//
//  Created by Uriel Rodriguez Sandoval on 28/08/24.
//

import UIKit

enum ShowButtons {
    case onlyBack
    case noback
    case oneBtn
    case twobutton
}

class HeaderView: UIView {
    
    @IBOutlet weak var rightItem: UIButton!
    @IBOutlet weak var backItem: UIButton!
    @IBOutlet weak var leftItem: UIButton!
    
    weak var delegateLeftItem: HeaderViewLeftProtocols?
    weak var delegateRightItem: HeaderViewRightProtocols?
    weak var delegateBackItem: HeaderViewBackItemProtocols?
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        loadNibContent()
        
        setupInit()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadNibContent()
    
        setupInit()
    }
    
    func setupInit() {
       // conffigutacion inicial
//        leftItem.isHidden = true
//        rightItem.isHidden = true
    }
    
    @IBAction func leftEvent(_ sender: Any) {
        if let delegate = delegateLeftItem {
            delegate.didsearch("")
        }
    }
    
    @IBAction func rightEvent(_ sender: Any) {
        if let delegate = delegateRightItem {
            delegate.menuEvent()
        }
    }
    
    @IBAction func backEvent(_ sender: Any) {
        if let delegate = delegateBackItem {
            delegate.backEvent()
        }
    }
}
