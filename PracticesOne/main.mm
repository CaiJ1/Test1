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

struct free_throws {
    string name;
    int made;
    int attempts;
    float percent;
};

void display(const free_throws &ft);
void set_pc(free_throws &ft);
free_throws & accumulate(free_throws &target, const free_throws &source);

void test() {
  
    //partial initializations - remaining members set to 0
    free_throws one {"one", 13, 14};
    free_throws two {"two", 10, 16};
    free_throws three {"three", 7, 9};
    free_throws fout {"four", 5, 9};
    free_throws five {"five", 6, 14};
    free_throws team {"team", 0, 0};
    
    //no initialization
    free_throws dup;
    
    set_pc(one);
    display(one);
    accumulate(team, one);
    display(team);
    
    //use return value as argument
    display(accumulate(team, two));
    accumulate(accumulate(team, three), fout);
    display(team);
    
    //use return value in assignment
    dup = accumulate(team, five);
    cout << "Displaying team:\n";
    display(team);
    cout << "Displaying dup after assignment:\n";
    display(dup);
    set_pc(fout);
    
    accumulate(dup, five) = fout;
    display(dup);
    display(team);
}

void display(const free_throws &ft) {
    cout << "Name: " << ft.name << endl;
    cout << "Made: " << ft.made << endl;
    cout << "Attempts: " << ft.attempts << endl;
    cout << "Percent: " << ft.percent << endl << endl;
}
void set_pc(free_throws &ft) {
    if (ft.attempts != 0) {
        ft.percent = 100.f * float(ft.made / float(ft.attempts));
    }
    else {
        ft.percent = 0;
    }
}
free_throws & accumulate(free_throws &target, const free_throws &source) {
    target.attempts += source.attempts;
    target.made += source.made;
    set_pc(target);
    return target;
}

int main(int argc, const char * argv[]) {
    
    test();
    
    cout << endl;
    return 0;
}
