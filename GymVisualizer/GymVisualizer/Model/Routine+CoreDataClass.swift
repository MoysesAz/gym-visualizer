import Foundation
import CoreData
import UIKit

@objc(Routine)
public class Routine: NSManagedObject {
    let routineContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
}
