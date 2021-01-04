//
//  AutenticacaoLocal.swift
//  Agenda
//
//  Created by Lucas Abdel Leitao on 04/01/21.
//  Copyright © 2021 Alura. All rights reserved.
//

import UIKit
import LocalAuthentication

class AutenticacaoLocal: NSObject {
    
    var error:NSError?
    
    func autorizaUsuario(completion: @escaping (_ autenticado:Bool)-> Void){
        let contexto = LAContext()
        
        if contexto.canEvaluatePolicy(.deviceOwnerAuthentication, error: &error){
            contexto.evaluatePolicy(.deviceOwnerAuthentication, localizedReason: "é necessario autenticacao para apagar um aluno") { (resposta, erro) in
                completion(resposta)
                
            }
        }
    }

}
