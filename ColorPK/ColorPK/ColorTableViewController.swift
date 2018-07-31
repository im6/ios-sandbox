
import UIKit

class ColorTableViewController: UITableViewController {
    
    //private var colorList = [VPColor]()
    private var colorList = VPColor.getDummyColorList()
    
    private func loadColors() {
        let backgroundQ = DispatchQueue.global(qos: .userInitiated)
        //colorList = VPColor.getDummyColorList()
        backgroundQ.async { [weak self] in
            let json: [String: Any] = ["_csrf": "uNmjCwXz-ztEL6Anx7zjSUuRq2R21oDGoJDA"]
            let jsonData = try? JSONSerialization.data(withJSONObject: json)
            let url = URL(string: "http://localhost:3000/api/initColorList")!
            
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            //request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            request.httpBody = jsonData
            
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                guard let data = data, error == nil else {
                    print(error?.localizedDescription ?? "No data")
                    return
                }
                let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
                
                print("parse json")
                if let responseJSON = responseJSON as? [String: Any] {
                    if let results = responseJSON["result"] as? [Any] {
                        for oneColor in results {
                            let oneColor1 = oneColor as! [String: Any]
                            if let newId = oneColor1["id"],
                                let newColor = oneColor1["color"],
                                let newIsLiked = oneColor1["liked"],
                                let newLikeNum = oneColor1["like"] {
                                let newColor = VPColor(id: newId as! Int,
                                                       color: newColor as! String,
                                                       isLiked: (newIsLiked as! Int) == 1,
                                                       likeNum: newLikeNum as! Int)
                                self?.colorList.append(newColor)
                                DispatchQueue.main.async {
                                    self?.tableView?.reloadData()
                                }
                            } else {
                                print("error parsing colors json response.")
                                return
                            }
                        }
                    }
                    
                }
            }
            
            task.resume()
            
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        loadColors()
        
        //tableView.estimatedRowHeight = tableView.rowHeight
        //tableView.rowHeight = UITableViewAutomaticDimension
        
        self.tableView.allowsSelection = true
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return colorList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "colorCell", for: indexPath)
        let color = colorList[indexPath.row]
        //cell.textLabel?.text = "id: \(color.id)"
        //cell.detailTextLabel?.text = "\(color.color)"
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        
        if let colorCell = cell as? ColorTableViewCell {
            colorCell.color = color
        }
        return cell
    }
    
//    override func tableView(_ UITableView: UITableView, didSelectRowAt: IndexPath) {
//        //print("select row at: \(didSelectRowAt)")
//    }
    
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let segId = segue.identifier,
            segId == "showOneDetail"
        {
            let destCtr = segue.destination
            if let colorDetailCtr = destCtr as? ColorDetailViewController,
                let rowId = tableView.indexPathForSelectedRow?.row
            {
                colorDetailCtr.color = colorList[rowId]
            }
        }
    }


}
