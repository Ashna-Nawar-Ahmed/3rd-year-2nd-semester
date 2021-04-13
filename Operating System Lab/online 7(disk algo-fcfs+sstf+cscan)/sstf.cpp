#include<bits/stdc++.h>
using namespace std;
//int currentPos=0;
struct request
{
    int value;
    int relativePos;
    request(int v,int r)
    {
        value=v;
        relativePos=r;

    }

    bool operator<(request r) const
    {
        return r.relativePos<relativePos;
    }
};

int main()
{
    //int cylinderReq[]= {98, 183, 37, 122, 14, 124, 65, 67};
    int heads,totalCylinderMoves=0,headPos,currentPos;
    priority_queue<request> pq;
    priority_queue<request> pq1;
    cout<<"Enter number of heads:"<<endl;
    cin>>heads;
    cout<<"Enter initial position of head:"<<endl;
    cin>>headPos;
    currentPos=headPos;
    pq.push(request(98,abs(headPos-98)));
    pq.push(request(183,abs(headPos-183)));
    pq.push(request(37,abs(headPos-37)));
    pq.push(request(122,abs(headPos-122)));
    pq.push(request(14,abs(headPos-14)));
    pq.push(request(124,abs(headPos-124)));
    pq.push(request(65,abs(headPos-65)));
    pq.push(request(67,abs(headPos-67)));
    int cnt=0;
    int n=8;
    while(cnt!=n)
    {
        request curr=pq.top();
        pq.pop();
        cout<<"Currently serving:"<<curr.value<<endl;
        currentPos=curr.value;
        totalCylinderMoves+=curr.relativePos;
        cnt++;
        while(!pq.empty())
        {
            request curr=pq.top();
            pq.pop();
            pq1.push((request(curr.value,abs(currentPos-curr.value))));
        }
        while(!pq1.empty())
        {
            request curr=pq1.top();
            pq1.pop();
            pq.push(curr);
        }

    }



    cout<<"\nTotal cylinder moves:"<<totalCylinderMoves<<endl;
    return 0;

}

