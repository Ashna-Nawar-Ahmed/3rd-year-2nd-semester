#include<bits/stdc++.h>
using namespace std;

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
    int cylinderReq[]= {98, 183, 37, 122, 14, 124, 65, 67};
    int n=8;
    int heads,totalCylinderMoves=0,headPos,currentPos;
    priority_queue<request> pq;
    priority_queue<request> pq1;
    cout<<"Enter number of heads:"<<endl;
    cin>>heads;
    cout<<"Enter initial position of head:"<<endl;
    cin>>headPos;
    currentPos=headPos;
    for(int i=0;i<n;i++)
    {
        pq.push(request(cylinderReq[i],abs(headPos-cylinderReq[i])));
    }

    int cnt=0;

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

