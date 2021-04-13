#include<bits/stdc++.h>
using namespace std;
int main()
{
    int heads,totalCylinderMoves=0,headPos;
    cout<<"Enter number of heads:"<<endl;
    cin>>heads;
    cout<<"Enter initial position of head:"<<endl;
    cin>>headPos;
    queue<int> cylinderRequest;
    cylinderRequest.push(98);
    cylinderRequest.push(183);
    cylinderRequest.push(37);
    cylinderRequest.push(122);
    cylinderRequest.push(14);
    cylinderRequest.push(124);
    cylinderRequest.push(65);
    cylinderRequest.push(67);
    int currentpos=headPos;
    while(!cylinderRequest.empty())
    {
        int val=cylinderRequest.front();
        cylinderRequest.pop();
        if(val<heads)
        {
            cout<<"Currently serving:"<<val<<endl;
            totalCylinderMoves+=abs(val-currentpos);
            currentpos=val;
        }
    }
    cout<<"Total cylinder moves:"<<totalCylinderMoves<<endl;
    return 0;

}
