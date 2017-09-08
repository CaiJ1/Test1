//
//  main.cpp
//  PracticesOne
//
//  Created by jac on 2017/6/12.
//  Copyright © 2017年 jac. All rights reserved.
//

#include <iostream>
#include <cstdlib>
#include <ctime>
#include "JCQueue.hpp"

const int MIN_PER_HR = 60;

bool newCustomer(double x);    //is there a new customer?

int main(int argc, const char * argv[]) {
    
    using std::cin;
    using std::cout;
    using std::endl;
    using std::ios_base;
    
    //setting things up
    std::srand(std::time(0));      //random initializing of rand()
    
    cout << "Case study: Bank of Heather Automatic Teller\n";
    cout << "Enter maximun size of queue:";
    int qs;
    cin >> qs;
    Queue line(qs);         //line queue holds up to qs people
    
    cout << "Enter the number of simulation hours: ";
    int hours;
    cin >> hours;           //hours of simulation
    //simulation will run 1 cycle per minute
    long cycleLimit = MIN_PER_HR * hours;
    
    cout << "Enter the average number of customers per hour: ";
    double perHour;         //average # of arrival per hour
    cin >> perHour;
    double min_per_cust;    //average time between arrivals
    min_per_cust = MIN_PER_HR / perHour;
    
    Item temp;              // new customer data
    long turnaways = 0;     // turned away by full queue
    long customers = 0;     // joined the queue
    long served = 0;        // served during the simulation
    long sum_line = 0;      // cumulative line length
    int wait_time = 0;      // time until autoteller is free
    long line_wait = 0;     // cumulative time in line
    
    //running the simulation
    for (int cycle = 0; cycle < cycleLimit; cycle++) {
        if (newCustomer(min_per_cust)) {    //have newCustomer
            if (line.isFull()) {
                turnaways++;
            }
            else {
                customers++;
                temp.set(cycle);    //cycle = time of arrival
                line.enQueue(temp); // add newcutomer to line
            }
        }
        
        if (wait_time <= 0 && !line.isEmpty()) {
            line.deQueue(temp);    //attend next customer
            wait_time = temp.pTime(); // for wait_time minutes
            line_wait += cycle - temp.when();
            served++;
        }
        
        if (wait_time > 0) {
            wait_time--;
        }
        sum_line += line.queueCount();
        
    }
    
    //reporting results
    if (customers > 0) {
        cout << "customers accepted: " << customers << endl;
        cout << "customers served:   " << served << endl;
        cout << "turnAways:          " << turnaways << endl;
        cout << "average queue size: ";
        cout.precision(2);
        cout.setf(ios_base::fixed, ios_base::floatfield);
        cout << (double)sum_line / cycleLimit << endl;
        cout << "average wait time: " << (double) line_wait / served << " minutes\n";
    }
    else {
        cout << "No customer!\n";
    }
    
    cout << "Done!\n";
    
    return 0;
}

bool newCustomer(double x) {
    return (std::rand() * x / RAND_MAX < 1);
}
