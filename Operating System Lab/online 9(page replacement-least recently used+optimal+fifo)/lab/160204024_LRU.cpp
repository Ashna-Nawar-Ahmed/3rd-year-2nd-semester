#include<bits/stdc++.h>
using namespace std;
int main()
{
    int framesize=3;
    int ar[]= {7,0,1,2,0,3,0,4,2,3};
    int n=10;
    int cnt=0;
    int frame[]= {-1,-1,-1};
    int pos=0;
    for(int i=0; i<framesize; i++)
    {
        cout<<"Current page request:"<<ar[i]<<endl;
        frame[pos]=ar[i];
        pos++;
        cnt++;
        for(int j=0; j<framesize; j++)
        {
            cout<<frame[j]<<" ";
        }
        cout<<endl;
    }
    int foundWithinFrame=0;
    int dis[]= {0,0,0};
    while(cnt!=n)
    {
        foundWithinFrame=0;
        dis[0]=0;
        dis[1]=0;
        dis[2]=0;

        int val=ar[pos];
        cout<<"Current page request:"<<val<<endl;
        for(int j=0; j<framesize; j++)
        {
            if(ar[j]==val)
            {
                pos++;
                cnt++;
                for(int k=0; k<framesize; k++)
                {
                    cout<<frame[k]<<" ";
                }
                cout<<endl;
                foundWithinFrame=1;
                break;

            }
        }

        if(foundWithinFrame==0)
        {
            for(int j=0; j<framesize; j++)
            {
                int x=frame[j];
                for(int k=pos; k>=0; k--)
                {
                    if(ar[k]==x)
                    {
                        dis[j]=abs(pos-k);
                        break;

                    }
                }

            }
            int maxdis=dis[0];
            int maxdispos=0;
            for(int j=0; j<framesize; j++)
            {
                //cout<<"distance"<<j<<":"<<dis[j]<<endl;
                if(dis[j]>maxdis)
                {
                    maxdis=dis[j];
                    maxdispos=j;
                }

            }
            frame[maxdispos]=val;
            for(int k=0; k<framesize; k++)
            {
                cout<<frame[k]<<" ";
            }
            cout<<endl;
            pos++;
            cnt++;
            foundWithinFrame=0;




        }

    }
}
