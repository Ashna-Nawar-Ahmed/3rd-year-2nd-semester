#include<bits/stdc++.h>
using namespace std;
int main()
{
    int holes[]= {50, 200, 70, 115, 15};
    int requests[]= { 100, 10, 35, 15, 23, 6, 25, 55, 88, 40 };
    int r=10;
    int h=5;
    int currentReq=0;
    int flag=0;
    cout<<"Initial holes: "<<endl;
    for(int j=0; j<h; j++)
    {
        cout<<holes[j]<<" ";
    }
    cout<<endl;
    while(currentReq!=r)
    {
        for(int i=0; i<h; i++)
        {

            if(holes[i]>=requests[currentReq])
            {
                holes[i]-=requests[currentReq];

                cout<<"Allocation situation for "<<requests[currentReq]<<": "<<endl;
                for(int j=0; j<h; j++)
                {
                    cout<<holes[j]<<" ";
                }
                cout<<endl;
                currentReq++;
                i=-1;
                continue;
            }

            if(i==h-1&&holes[i]<requests[currentReq])
            {
                cout<<requests[currentReq]<<" can't be allocated."<<endl;
                cout<<"External fragmentation: ";
                int extFrag=0;
                for(int j=0; j<h; j++)
                {
                    extFrag+=holes[j];
                }
                cout<<extFrag<<endl;
                flag=1;
                break;
            }


        }
        if(flag==1)
            break;
    }
    return 0;
}
