//
//  ViewController.swift
//  JSON-TableView-GU
//
//  Created by Jaimin Raval on 29/09/25.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var jokesArr:[JokeModel] = []
    
    @IBOutlet weak var MyDataTable: UITableView!
    
    override func viewWillAppear(_ animated: Bool) {
        jokesArr = JsonServices.shared.readJSON(filename: "LocalJson")
            
            MyDataTable.reloadData()
        }
        
        
    override func viewDidLoad() {
        super.viewDidLoad()
        MyDataTable.dataSource = self
        MyDataTable.delegate = self

    }
    
    
//    MARK: - TableView's Protocol methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return jokesArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyDataCell") as! MyDataCell
        
        return cell
    }
    


}

