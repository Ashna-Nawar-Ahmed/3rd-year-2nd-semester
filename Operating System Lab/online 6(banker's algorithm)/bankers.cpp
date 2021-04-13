#include<bits/stdc++.h>
using namespace std;
int main()
{
    int p,r;
    //safe
    p=5;
    r=3;
    int resources[r]= {10,5,7};
    int allo[p][r]= { {0,1,0},
        {2,0,0},
        {3,0,2},
        {2,1,1},
        {0,0,2}
    };
    int maxim[p][r]= { {7,5,3},
        {3,2,2},
        {9,0,2},
        {2,2,2},
        {4,3,3}
    };
    //unsafe
    /*
        p=4;
        r=3;
        int resources[r]= {14,10,15};
        int allo[p][r]= {
            {2,1,1},
            {2,3,1},
            {1,1,4},
            {1,4,2}
        };
        int maxim[p][r]=
        {
            {4,2,3},
            {7,3,10},
            {5,2,13},
            {10,5,14}
        };*/
    /* //safe
    p=7;
    r=3;
    int resources[r]= {20,19,16};
    int allo[p][r]= { {1,1,1},
        {2,3,3},
        {3,0,5},
        {2,2,0},
        {3,1,0},
        {1,2,1},
        {1,1,1}
    };
    int maxim[p][r]=
    {
        {7,5,6},
        {5,8,5},
        {9,2,8},
        {8,8,6},
        {14,4,5},
        {4,6,3},
        {2,9,2}
    };*/

    int need[p][r];
    cout<<"Need:"<<endl;
    int totalAlloc[r]= {0,0,0};
    int av[r]= {0,0,0};
    for(int i=0; i<p; i++)
    {
        for(int j=0; j<r; j++)
        {
            need[i][j]=maxim[i][j]-allo[i][j];
            totalAlloc[j]+=allo[i][j];
            cout<<need[i][j]<<" ";
        }
        cout<<endl;
    }
    cout<<"Available:"<<endl;
    for(int i=0; i<r; i++)
    {
        av[i]=resources[i]-totalAlloc[i];
        cout<<av[i]<<" ";
    }
    int cnt=0;
    bool done[p];
    queue<int> q;
    bool state=false;
    bool flag=false;
    while(cnt!=p)
    {
        state=false;
        for(int i=0; i<p; i++)
        {

            if(!done[i]&&(need[i][0]<=av[0]&&need[i][1]<=av[1]&&need[i][2]<=av[2]))
            {
                q.push(i);
                int val=q.back();
                done[i]=true;
                state=true;
                cnt++;
                for(int j=0; j<r; j++)
                {
                    av[j]+=need[i][j];
                }

            }
            if(i==p-1&&state==false&&cnt!=p)
            {
                flag=true;
                break;
            }
        }
        if(flag)
            break;
    }

    if(!state&&cnt!=p)
        cout<<"\nSystem is not in safe state."<<endl;
    else
    {
        cout<<"\nSystem is in safe state."<<endl;
        cout<<"\nSafe sequence:";
        while(!q.empty())
        {
            int val=q.front();
            q.pop();
            cout<<"P"<<val<<" ";
        }

    }

}
