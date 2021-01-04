//
//  MenuOpcoesAlunos.swift
//  Agenda
//
//  Created by Lucas Abdel Leitao on 04/01/21.
//  Copyright © 2021 Alura. All rights reserved.
//

import UIKit

enum MenuActionSheetAluno {
    case sms
}

class MenuOpcoesAlunos: NSObject {
    
    func configuraOpcoesAluno(completion: @escaping (_ opcao: MenuActionSheetAluno)->Void) -> UIAlertController{
        let menu = UIAlertController(title: "Atencao", message: "escolha uma das opcoes", preferredStyle: .actionSheet)
        
        let sms = UIAlertAction(title: "enviar SMS", style: .default) { (acao) in
            //implementar
        }
        menu.addAction(sms)
        let cancelar = UIAlertAction(title: "cancelar", style: .cancel, handler: nil)
        menu.addAction(cancelar)
        
        return menu
    }
}
