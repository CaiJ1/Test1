//
//  main.cpp
//  PracticesOne
//
//  Created by jac on 2017/6/12.
//  Copyright © 2017年 jac. All rights reserved.
//

#include <iostream>
#import <fstream>
#include <vector>
#include <array>


//#include "jiacai.h"
using namespace std;

void test() {
  
    int rats = 101;
    int &rodents = rats;    //rodents is a reference
    cout << "rats = " << rats;
    cout << ", rodents = " << rodents << endl;
    
    rodents ++;
    cout << "rats = " << rats;
    cout << ", rodents = " << rodents << endl;
    
    //some implementations require type casting the following addresses to type unsigned
    cout << "rats address = " << &rats;
    cout << ", rodents address = " << &rodents << endl;
    
}

int main(int argc, const char * argv[]) {
    
    test();
    
    cout << endl;
    return 0;
}
