#include<bits/stdc++.h>
using namespace std;
int main()
{
    int heads,totalCylinderMoves=0,headPos;
    cout<<"Enter number of heads:"<<endl;
    cin>>heads;
    cout<<"Enter initial position of head:"<<endl;
    cin>>headPos;
    int cylinderReq[]= {98, 183, 37, 122, 14, 124, 65, 67};
    int n=8;
    sort(cylinderReq,cylinderReq+n);
    bool ar[heads];
    for(int i=0; i<heads; i++)
        ar[i]=false;
    for(int i=0; i<n; i++)
    {
        ar[cylinderReq[i]]=true;
    }
    int cnt=0;
    int prevpos=headPos;
    while(cnt!=n)
    {
        for(int i=prevpos; i<heads; i++,totalCylinderMoves++)
        {
            if(ar[i])
            {
                cout<<"currently serving:"<<i<<endl;
                ar[i]=false;
                cnt++;
                if(cnt==n)
                break;

            }
            if(i==heads-1)
            {
                i=0;
                totalCylinderMoves+=heads;
            }
        }
    }
    cout<<"\nTotal cylinder moves:"<<totalCylinderMoves<<endl;
    return 0;

}

