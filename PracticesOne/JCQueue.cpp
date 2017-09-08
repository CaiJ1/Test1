//
//  JCQueue.cpp
//  PracticesOne
//
//  Created by jac on 2017/9/7.
//  Copyright © 2017年 jac. All rights reserved.
//

#include "JCQueue.hpp"

Queue::Queue(int qs) : qSize(qs), front(nullptr), rear(nullptr), items(0) {    //initialize qsize to qs

}

Queue::~Queue() {
    Node *temp;
    while (front != nullptr) {
        temp = front;
        front = front->next;
        delete temp;
    }
}

bool Queue::isFull() const {
    return  items == qSize ? true : false;
}

bool Queue::isEmpty() const {
    return  items == 0 ? true : false;
}

int Queue::queueCount() const {
    return items;
}

bool Queue::enQueue(const Item &item) {
    if (isFull()) {
        return false;
    }
    Node *add = new Node;  //create node
    //on failure, new throws std::bad_alloc exception
    add->item = item;
    add->next = nullptr;
    items++;
    
    if (front == nullptr) {
        front = add;
    }
    else {
        rear->next = add;   //else place at rear
    }
    rear = add;             //have rear point to new node
    return true;
}

bool Queue::deQueue(Item &item) {
    if (front == nullptr) {
        return false;
    }
    item = front->item;
    items--;
    Node *temp = front;
    front = front->next;
    delete temp;
    if (items == 0) {
        rear = nullptr;
    }
    return true;
}




