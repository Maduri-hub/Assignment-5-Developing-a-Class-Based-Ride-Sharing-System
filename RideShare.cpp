#include <iostream>
#include <vector>
#include <string>
using namespace std;

// Base Class: Ride
class Ride {
protected:
    string rideID, pickupLocation, dropoffLocation;
    double distance, fare;
public:
    Ride(string id, string pickup, string dropoff, double dist) 
        : rideID(id), pickupLocation(pickup), dropoffLocation(dropoff), distance(dist), fare(0) {}
    
    virtual void calculateFare() {
        fare = distance * 10; // default rate
    }
    
    virtual void rideDetails() {
        cout << "Ride ID: " << rideID
             << " | Pickup: " << pickupLocation
             << " | Dropoff: " << dropoffLocation
             << " | Distance: " << distance
             << " | Fare: " << fare << endl;
    }
    
    virtual ~Ride() {}
};

// Subclass: StandardRide
class StandardRide : public Ride {
public:
    StandardRide(string id, string pickup, string dropoff, double dist) 
        : Ride(id, pickup, dropoff, dist) {}
    
    void calculateFare() override {
        fare = distance * 10; // Standard rate
    }
};

// Subclass: PremiumRide
class PremiumRide : public Ride {
public:
    PremiumRide(string id, string pickup, string dropoff, double dist) 
        : Ride(id, pickup, dropoff, dist) {}
    
    void calculateFare() override {
        fare = distance * 20; // Premium rate
    }
};

// Driver Class
class Driver {
private:
    string driverID, name;
    double rating;
    vector<Ride*> assignedRides; // Encapsulation
public:
    Driver(string id, string n, double r) : driverID(id), name(n), rating(r) {}
    
    void addRide(Ride* r) {
        assignedRides.push_back(r);
    }
    
    void getDriverInfo() {
        cout << "Driver ID: " << driverID 
             << " | Name: " << name 
             << " | Rating: " << rating 
             << " | Rides Completed: " << assignedRides.size() << endl;
    }
};

// Rider Class
class Rider {
private:
    string riderID, name;
    vector<Ride*> requestedRides;
public:
    Rider(string id, string n) : riderID(id), name(n) {}
    
    void requestRide(Ride* r) {
        requestedRides.push_back(r);
    }
    
    void viewRides() {
        for (auto r : requestedRides) {
            r->rideDetails();
        }
    }
};

// Main demo
int main() {
    Ride* r1 = new StandardRide("R101", "Park Street", "Airport", 15);
    r1->calculateFare();
    
    Ride* r2 = new PremiumRide("R102", "Salt Lake", "New Town", 10);
    r2->calculateFare();
    
    Driver d1("D201", "Arjun", 4.9);
    d1.addRide(r1);
    d1.addRide(r2);
    d1.getDriverInfo();
    
    Rider c1("C301", "Meera");
    c1.requestRide(r1);
    c1.requestRide(r2);
    
    cout << "\nRider's Ride History:\n";
    c1.viewRides();
    
    cout << "\nPolymorphism Demo:\n";
    vector<Ride*> ridesList = {r1, r2};
    for (auto r : ridesList) {
        r->rideDetails(); // dynamic dispatch
    }
    
    delete r1;
    delete r2;
    return 0;
}
