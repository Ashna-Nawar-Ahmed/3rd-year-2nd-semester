#include<bits/stdc++.h>
using namespace std;
struct holes
{
    int position;
    int width;
    bool operator<(holes h) const
    {
        return h.width>width;
    }
} arr[1000];
int main()
{
    int holesAr[]= {50, 200, 70, 115, 15};
    int requests[]= { 100, 10, 35, 15, 23, 6, 25, 55, 88, 40 };
    int r=10;
    int h=5;
    for(int i=0; i<h; i++)
    {
        arr[i].position=i;
        arr[i].width=holesAr[i];

    }
    int currentReq=0;
    int flag=0;
    cout<<"Initial holes: "<<endl;
    for(int j=0; j<h; j++)
    {
        cout<<holesAr[j]<<" ";
    }
    cout<<endl;

    while(currentReq!=r)
    {
        priority_queue<holes> pq;
        for(int i=0; i<h; i++)
        {
            if(arr[i].width>=requests[currentReq])
            {
                struct holes x;
                x.position=arr[i].position;
                x.width=arr[i].width;
                pq.push(x);
            }
            if(i==h-1&&pq.empty()&&arr[i].width<requests[currentReq])
            {
                cout<<requests[currentReq]<<" can't be allocated."<<endl;
                cout<<"External fragmentation: ";
                int extFrag=0;
                for(int j=0; j<h; j++)
                {
                    extFrag+=arr[j].width;
                }
                cout<<extFrag<<endl;
                flag=1;
                break;
            }
            if(flag==1)
                break;

        }
        struct holes pos=pq.top();
        pq.pop();
        arr[pos.position].width-=requests[currentReq];
        cout<<"Allocation situation for "<<requests[currentReq]<<": "<<endl;
        for(int j=0; j<h; j++)
        {
            cout<<arr[j].width<<" ";
        }
        cout<<endl;
        currentReq++;

    }
    return 0;
}


