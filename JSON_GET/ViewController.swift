//
//  ViewController.swift
//  JSON_GET
//
//  Created by Nikhil Balne on 28/10/20.
//

import UIKit

class ViewController: UIViewController {

    var todosTableDataArray = [TodoResponse]()
    @IBOutlet weak var todosTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        callListofTodos()
    }

    func callListofTodos(){
        
        
        let todosUrl = "https://jsonplaceholder.typicode.com/todos"
        
    
        NetworkingClient.networkingClient.excuteGetServiceCall(url:todosUrl, controller:self){ response in
            
            if response.response?.statusCode == 200 {
                print("StatusCode:\(response.response!.statusCode)")
            
            do {
                
                let results = try JSONDecoder().decode([TodoResponse].self, from: response.data!)
            
//                print("Response:\(results)")
                self.todosTableDataArray = results;
                
                DispatchQueue.main.async {
                    self.todosTableView.reloadData()
                }
                
            } catch let error {
                print("Error:",error.localizedDescription)
                }
            
            } else {
                print("StatusCode:\(response.response!.statusCode)")
            
                }
            }
    }
}

extension ViewController : UITableViewDelegate,UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todosTableDataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodosTableViewCell") as! TodosTableViewCell
        
        let todoObj = todosTableDataArray[indexPath.row]
        cell.titleLabel.text = todoObj.title
        cell.userIdLabel.text = String(todoObj.userID)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }

}
