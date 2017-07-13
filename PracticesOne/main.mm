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

void swapr(int &a, int &b);     //a, b are aliases for ints
void swapp(int *p, int *q);     //p, q are addresses of ints
void swapv(int a, int b);       //a, b are new variables

void test() {
  
    int wallet1 = 300;
    int wallet2 = 350;
    cout << "wallet1 = $" << wallet1;
    cout << " wallet2 = $" << wallet2 << endl;
    
    cout << "Using references to swap contents:\n";
    swapr(wallet1, wallet2);
    cout << "wallet1 = $" << wallet1;
    cout << " wallet2 = $" << wallet2 << endl;
    
    cout << "Using pointers to swap contents again:\n";
    swapp(&wallet1, &wallet2);
    cout << "wallet1 = $" << wallet1;
    cout << " wallet2 = $" << wallet2 << endl;
    
    cout << "Trying to use passing by value:\n";
    swapv(wallet1, wallet2);
    cout << "wallet1 = $" << wallet1;
    cout << " wallet2 = $" << wallet2 << endl;
}

void swapr(int &a, int &b) {
    int temp;
    temp = a;
    a = b;
    b = temp;
}
void swapp(int *p, int *q) {
    int temp;
    temp = *p;
    *p = *q;
    *q = temp;
}
void swapv(int a, int b) {
    int temp = a;
    a = b;
    b = temp;
}

int main(int argc, const char * argv[]) {
    
    test();
    
    cout << endl;
    return 0;
}
