import Foundation

class Model {
    private var proxy : Proxy
    
    init (proxy : Proxy) {
        self.proxy = proxy
    }
    
    func calculate() -> Float {
        return Float(proxy.get_service().add(10, 20))!  //#TODO: Change
    }
}
