//
//  HeaderProtocols.swift
//  ReusableUI
//
//  Created by Uriel Rodriguez Sandoval on 28/08/24.
//

import Foundation

protocol HeaderViewBackItemProtocols: AnyObject {
    func backEvent()
}


protocol HeaderViewLeftProtocols: AnyObject {
    func didsearch(_ value: String)
}


protocol HeaderViewRightProtocols: AnyObject {
    func menuEvent()
}
