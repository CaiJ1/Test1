//
//  JCCustomer.cpp
//  PracticesOne
//
//  Created by jac on 2017/9/8.
//  Copyright © 2017年 jac. All rights reserved.
//

#include "JCCustomer.hpp"

void Customer::set(long when) {
    processTime = std::rand() % 3 + 1;
    arrive = when;
}
