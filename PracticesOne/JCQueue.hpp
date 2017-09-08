//
//  JCQueue.hpp
//  PracticesOne
//
//  Created by jac on 2017/9/7.
//  Copyright © 2017年 jac. All rights reserved.
//

#ifndef JCQueue_hpp
#define JCQueue_hpp

#include <stdio.h>
#include "JCCustomer.hpp"

#endif /* JCQueue_hpp */


typedef Customer Item;



class Queue {
private:
    //private representation to be developed later
    //Node is a nested structure definition local to this class
    struct Node {
        Item item;          //data stored in the node
        struct Node *next;  //pointer to next node
    };
    enum {Q_SIZE = 10};
    //private class members
    Node *front;        //pointer to front of Queue
    Node *rear;         //pointer to rear of Queue
    int items;          //current number of items in Queue
    const int qSize;    //maximum number of items in Queue
    
    Queue(const Queue &q): qSize(0) {}
    Queue &operator = (const Queue &q) {
        return  *this;
    }
    
public:
    Queue(int qs = Q_SIZE); //create queue with a qs limit
    ~Queue();
    bool isEmpty() const;
    bool isFull() const;
    int  queueCount() const;
    bool enQueue(const Item &item);   //add item to end
    bool deQueue(Item &item);         //remove item from front
    
};
