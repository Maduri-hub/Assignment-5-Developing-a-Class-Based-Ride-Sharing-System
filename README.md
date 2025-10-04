# Assignment-5-Developing-a-Class-Based-Ride-Sharing-System
Assignment 5: Developing a Class-Based Ride Sharing System
README – RideShare Program

This program is a small ride-sharing simulation written in C++.

It shows how OOP concepts (encapsulation, inheritance, polymorphism) work.

Ride (base class) stores ride info like ID, pickup, drop-off, and distance.

StandardRide and PremiumRide inherit from Ride and override the fare calculation.

The driver class stores driver details and the rides completed.

Rider class can request rides and check ride history.

The program calculates fares:

StandardRide → distance × 10

PremiumRide → distance × 20

To compile: g++ --std=c++17 RideShare.cpp -o rideshare

To run: ./rideshare (Linux/Mac) or rideshare.exe (Windows).

Output shows driver details, rider history, and a polymorphism demo proving the right fare is chosen for each ride type.
