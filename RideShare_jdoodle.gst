"Superclass: Ride"
Object subclass: #Ride
    instanceVariableNames: 'rideID pickupLocation dropoffLocation distance fare'
    classVariableNames: ''
    poolDictionaries: ''
    category: 'RideSharingSystem'.

Ride >> initialize: anID pickup: pickup dropoff: dropoff distance: dist [
    rideID := anID.
    pickupLocation := pickup.
    dropoffLocation := dropoff.
    distance := dist.
    fare := 0.
]

Ride >> calculateFare [
    fare := distance * 10.  "Default rate"
]

Ride >> rideDetails [
    ^ 'Ride ID: ', rideID asString, 
      ' | Pickup: ', pickupLocation,
      ' | Dropoff: ', dropoffLocation,
      ' | Distance: ', distance asString,
      ' | Fare: ', fare asString
]


"Subclass: StandardRide"
Ride subclass: #StandardRide
    instanceVariableNames: ''
    classVariableNames: ''
    poolDictionaries: ''
    category: 'RideSharingSystem'.

StandardRide >> calculateFare [
    fare := distance * 10.  "Standard rate per mile"
]


"Subclass: PremiumRide"
Ride subclass: #PremiumRide
    instanceVariableNames: ''
    classVariableNames: ''
    poolDictionaries: ''
    category: 'RideSharingSystem'.

PremiumRide >> calculateFare [
    fare := distance * 20.  "Premium rate per mile"
]


"Driver Class"
Object subclass: #Driver
    instanceVariableNames: 'driverID name rating assignedRides'
    classVariableNames: ''
    poolDictionaries: ''
    category: 'RideSharingSystem'.

Driver >> initialize: anID name: aName rating: aRating [
    driverID := anID.
    name := aName.
    rating := aRating.
    assignedRides := OrderedCollection new.
]

Driver >> addRide: aRide [
    assignedRides add: aRide.
]

Driver >> getDriverInfo [
    ^ 'Driver ID: ', driverID asString, 
      ' | Name: ', name,
      ' | Rating: ', rating asString,
      ' | Rides Completed: ', assignedRides size asString
]


"Rider Class"
Object subclass: #Rider
    instanceVariableNames: 'riderID name requestedRides'
    classVariableNames: ''
    poolDictionaries: ''
    category: 'RideSharingSystem'.

Rider >> initialize: anID name: aName [
    riderID := anID.
    name := aName.
    requestedRides := OrderedCollection new.
]

Rider >> requestRide: aRide [
    requestedRides add: aRide.
]

Rider >> viewRides [
    requestedRides do: [:ride | Transcript show: ride rideDetails; cr].
]


"Demo"
| ride1 ride2 driver1 rider1 ridesList |
ride1 := StandardRide new.
ride1 initialize: 'R101' pickup: 'Park Street' dropoff: 'Airport' distance: 15.
ride1 calculateFare.

ride2 := PremiumRide new.
ride2 initialize: 'R102' pickup: 'Salt Lake' dropoff: 'New Town' distance: 10.
ride2 calculateFare.

driver1 := Driver new.
driver1 initialize: 'D201' name: 'Arjun' rating: 4.9.
driver1 addRide: ride1.
driver1 addRide: ride2.

rider1 := Rider new.
rider1 initialize: 'C301' name: 'Meera'.
rider1 requestRide: ride1.
rider1 requestRide: ride2.

"Polymorphism with rides list"
ridesList := {ride1. ride2}.
ridesList do: [:r | Transcript show: r rideDetails; cr].
