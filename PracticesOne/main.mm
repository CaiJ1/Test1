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
#include <string>
//#include "jiacai.h"
using namespace std;

template <typename T>   //or class T
void Swap(T &a, T &b) {
    T temp;
    temp = a;
    a = b;
    b = temp;
}

template <typename T>   //new template
void Swap(T *a, T *b, int n) {
    T temp;
    for (int i = 0 ; i < n; i++) {
        temp = a[i];
        a[i] = b[i];
        b[i] = temp;
    }
}
const int Lim = 8;
void Show(int a[]) {
    cout << a[0] << a[1] << "/";
    cout << a[2] << a[3] << "/";
    for (int i = 4; i < Lim ; i++) {
        cout << a[i];
    }
    cout  << endl;
}

void test() {
  
    int i = 10 ;
    int j = 20;
    cout << "i, j = " << i << ", " << j << endl;
    cout << "Using compiler-generated int swappper\n";
    Swap(i, j);
    cout << "Now i, j = " << i << ", " << j << endl;
    
    double x = 22.2;
    double y = 33.3;
    cout << "x, y = " << x << ", " << y << endl;
    cout << "Using compiler-generated doubel swapper\n";
    Swap(x, y);
     cout << "Now x, y = " << x << ", " << y << endl;
    
    
    
    int d1[Lim] {1,1,1,1,1,1,1};
    int d2[Lim] {2,2,2,2,2,2,2,2};
    cout << "Original arrays:\n";
    Show(d1);
    Show(d2);
    
    Swap(d1 , d2, Lim);
    cout << "Swapped arrays:\n";
    Show(d1);
    Show(d2);
    
    cout << "Done!" << endl;
    
}



int main(int argc, const char * argv[]) {
    
    test();
    
    cout << endl;
    
    return 0;
}
