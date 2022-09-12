import Foundation
import CoreData


extension Week {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Week> {
        return NSFetchRequest<Week>(entityName: "Week")
    }

    @NSManaged public var routines: [Routine]?

}

extension Week : Identifiable {
    func getWeeks() {
        do {
            let _ = try weekContext.fetch(Week.fetchRequest())
        } catch {
            print(error)
        }
    }

    func createWeek(_ week: Week) {
        let _ = Routine(context: weekContext)
        _ = week

        do {
            try weekContext.save()
        } catch {
            print(error)
        }
    }

    func deleteWeek(_ week: Week) {
        weekContext.delete(week)
        do {
            try weekContext.save()
        } catch {
            print(error)
        }
    }

    func updateWeek(_ week: Week, _ newWeek: Week) {
        week.routines = newWeek.routines

        do {
            try weekContext.save()
        } catch {
            print(error)
        }
    }
}
