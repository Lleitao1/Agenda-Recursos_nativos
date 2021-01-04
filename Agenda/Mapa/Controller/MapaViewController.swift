//
//  MapaViewController.swift
//  Agenda
//
//  Created by Lucas Abdel Leitao on 04/01/21.
//  Copyright © 2021 Alura. All rights reserved.
//

import UIKit

class MapaViewController: UIViewController {
    
    //MARK: - variavel
    
    var aluno:Aluno?
    
    //MARK: - View Lyfecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = getTitulo()
    }
        func getTitulo()-> String{
            
            return "localizar alunos"
    }

}
