import Foundation
import CoreData
import UIKit

@objc(Week)
public class Week: NSManagedObject {
    let weekContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
}
