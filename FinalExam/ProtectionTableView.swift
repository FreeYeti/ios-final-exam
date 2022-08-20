//
//  ProtectionTableView.swift
//  FinalExam
//
//  Created by Jack on 2022/8/19.
//

import UIKit

class ProtectionTableView: UITableViewController {
    
    struct Info {
        var Title : String!
        var Image : UIImage!
        var Description: String!
    }
    
    var Knowledge = [Info]()

    @IBOutlet weak var myTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myTableView.estimatedRowHeight = UITableView.automaticDimension
        self.view.backgroundColor = hexStringToUIColor(hex: CONFIG_MAIN_BGCOLOR)
        
        // the data source is the website of US CDC
        // https://www.cdc.gov/coronavirus/2019-ncov/prevent-getting-sick/prevention.html
        
        Knowledge = [
            Info(Title: "Staying Up to Date with COVID-19 Vaccines", Image: UIImage(named: "1_Vaccination"), Description: "COVID-19 vaccines help your body develop protection from the virus that causes COVID-19."),
            Info(Title: "Improving Ventilation and Spending Time Outdoors", Image: UIImage(named: "2_Fresh-Air"), Description: "Improving ventilation (moving air into, out of, or within a room) and filtration (trapping particles on a filter to remove them from the air) can help prevent virus particles from accumulating in indoor air."),
            Info(Title: "Getting Tested for COVID-19 If Needed", Image: UIImage(named: "3_Testing"), Description: "Get tested if you have COVID-19 symptoms. A viral test tells you if you are infected with the virus that causes COVID-19. There are two types of viral tests: rapid tests and laboratory tests."),
            Info(Title: "Following Recommendations for What to Do If You Have Been Exposed", Image: UIImage(named: "4_Exposure-medium"), Description: "If you were exposed to someone with COVID-19, you may have been infected with the virus. Follow CDC’s recommendations for what to do if you were exposed."),
            Info(Title: "Staying Home When You Have Suspected or Confirmed COVID-19", Image: UIImage(named: "4_Staying-Home-medium"), Description: "If you have COVID-19, you can spread it to others, even if you do not have symptoms. If you have symptoms, get tested and stay home until you have your results. If you have tested positive (even without symptoms), follow CDC’s isolation recommendations."),
            Info(Title: "Seeking Treatment If You Have COVID-19 and Are at High Risk of Getting Very Sick", Image: UIImage(named: "5_Avoid-Contact-medium"), Description: "Effective treatments are now widely available and free, and you may be eligible. Don’t delay! Treatment must be started within a few days after you first develop symptoms to be effective."),
            Info(Title: "Avoiding Contact with People Who Have Suspected or Confirmed COVID-19", Image: UIImage(named: "6_Treatments-medium"), Description: "Avoiding contact with people who have COVID-19, whether or not they feel sick, can reduce your risk of catching the virus from them. If possible, avoid being around a person who has COVID-19 until they can safely end home isolation."),
            Info(Title: "Data source: https://www.cdc.gov/", Image: UIImage(named: "cdc"), Description: "Centers for Disease Control and Prevention")
        ]
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return Knowledge.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProtectionItemCell", for: indexPath) as! ProtectionTableCell

        let i = indexPath.row
        let item = Knowledge[i]
        
        cell.config(title: item.Title, img: item.Image, desc: item.Description)

        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
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
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
