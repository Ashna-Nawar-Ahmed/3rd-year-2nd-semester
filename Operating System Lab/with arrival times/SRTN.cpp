#include<bits/stdc++.h>
using namespace std;

int main()
{
    int n;
    //struct process arr[4]={{1,6},{2,8},{3,7},{4,3}};
    int arrT[10],cpuT[10];
    //com[10];
    for(int i=0; i<n; i++)
    {
        arrT[i]=0;
        cpuT[i]=0;

    }
    //int arrT[4]={0,1,2,3};
    //int cput[4]={8,4,9,5};
    cout<<"enter no of processes:"<<endl;
    cin>>n;
    for(int i=0; i<n; i++)
    {
        int a;
        cout<<"enter arrival time of process "<<i+1<<endl;
        cin>>a;
        arrT[i]=a;

    }
    for(int i=0; i<n; i++)
    {
        int a;
        cout<<"enter cpu time of process "<<i+1<<endl;
        cin>>a;
        cpuT[i]=a;

    }
    int x[n];
    for(int i=0; i<n; i++)
        x[i]=cpuT[i];
    int wt[n],tat[n];
    cpuT[9]=INT_MAX;
    int least;
    int cnt=0;
    for(int time=0; cnt!=n; time++)
    {
        least=9;
        for(int i=0; i<n; i++)
        {
            if(arrT[i]<=time&&cpuT[i]<cpuT[least]&&cpuT
                    [i]>0)
            {
                least=i;
            }
        }
        cpuT[least]--;
        int en;
        if(cpuT[least]==0)
        {
            cnt++;
            en=time+1;
            //com[least]=en;
            wt[least]=en-arrT[least]-x[least];
            tat[least]=en-arrT[least];

        }
    }
    double ttat=0,twt=0;
    for(int i=0; i<n; i++)
    {
        printf("\n");
        cout<<"Process "<<i+1<<":"<<endl;
        cout<<"Waiting time="<<wt[i]<<endl;
        cout<<"Turnaround time="<<tat[i]<<endl;
        ttat+=tat[i];
        twt+=wt[i];
        printf("\n");
    }
    cout<<"Average waiting time="<<twt/n<<endl;
    cout<<"Average turnaround time="<<ttat/n<<endl;
}
