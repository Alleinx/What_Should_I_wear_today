//
//  Proxy.swift
//  Cloth wearing
//
//  Created by noObject on 2019/4/13.
//  Copyright © 2019 noObject. All rights reserved.
//

import Python

class Proxy {
    private let py_proxy : PythonObject
    private let proxy : PythonObject
    
    init () {
        py_proxy = Python.import("xmlrpc.client")
        proxy = py_proxy.ServerProxy("http://localhost:8000")
    }
    
    func get_service() -> PythonObject {
        return proxy
    }
    
}
