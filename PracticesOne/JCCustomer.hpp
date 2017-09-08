//
//  JCCustomer.hpp
//  PracticesOne
//
//  Created by jac on 2017/9/8.
//  Copyright © 2017年 jac. All rights reserved.
//

#ifndef JCCustomer_hpp
#define JCCustomer_hpp

#include <stdio.h>
#include <iostream>

#endif /* JCCustomer_hpp */


class Customer {
private:
    long arrive;       //arrival time for customer
    int  processTime;  //processing time for customer
    
public:
    Customer() {
        arrive = processTime = 0;
    }
    void set(long when);
    long when() const {
        return arrive;
    }
    int pTime() const {
        return processTime;
    }
};
