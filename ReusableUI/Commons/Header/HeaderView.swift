import UIKit

enum ShowButtons: Int {
    case none = 0
    case onlyBack = 1
    case noback = 2
    case oneBtn = 3
    case twobutton = 4
}

class HeaderView: UIView {
    
    @IBOutlet weak var rightItem: UIButton!
    @IBOutlet weak var backItem: UIButton!
    @IBOutlet weak var leftItem: UIButton!
    
    weak var delegateLeftItem: HeaderViewLeftProtocols?
    weak var delegateRightItem: HeaderViewRightProtocols?
    weak var delegateBackItem: HeaderViewBackItemProtocols?
    
    @IBInspectable var showButtons: Int = ShowButtons.none.rawValue {
        didSet {
            configureButtons()
        }
    }
    
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
        configureButtons()
    }
    
    func configureButtons() {
        let selectedOption = ShowButtons(rawValue: showButtons) ?? .none
        
        // Ocultar todos los botones al inicio
        leftItem.isHidden = true
        rightItem.isHidden = true
        backItem.isHidden = true
        
        // Mostrar botones según la opción seleccionada
        switch selectedOption {
        case .none:
            break
        case .onlyBack:
            backItem.isHidden = false
        case .noback:
            leftItem.isHidden = false
            rightItem.isHidden = false
        case .oneBtn:
            rightItem.isHidden = false
        case .twobutton:
            leftItem.isHidden = false
            rightItem.isHidden = false
        }
    }
    
    @IBAction func leftEvent(_ sender: Any) {
        delegateLeftItem?.didsearch("")
    }
    
    @IBAction func rightEvent(_ sender: Any) {
        delegateRightItem?.menuEvent()
    }
    
    @IBAction func backEvent(_ sender: Any) {
        delegateBackItem?.backEvent()
    }
}
