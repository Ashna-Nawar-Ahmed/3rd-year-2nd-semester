#include<iostream>
using namespace std;

int wt[100];
int tat[100];


int main()
{
    int n;
    cout<<"Enter number of process: ";
    cin>>n;
    int p[n],bt[n];
    cout<<"Enter "<<n<<" process: ";
    for(int i=0; i<n; i++)
    {
        cin>>p[i];

    }

    cout<<"Enter CPU time: ";
    for(int i=0; i<n; i++)
    {
        cin>>bt[i];

    }

    wt[0]=0;
    for(int i=1; i<n; i++)
    {
        wt[i]=bt[i-1]+wt[i-1];
    }

    for(int i=0;i<n;i++)
    {
        tat[i]=bt[i]+wt[i];
    }

    double t_wt=0,t_tat=0;



    cout<<"\t WT TAT";
    cout<<"\n";
    for(int i=0;i<n;i++)
    {
        t_wt=t_wt+wt[i];
        t_tat=t_tat+tat[i];
        cout<<"process"<<i+1<<" "<<wt[i]<<"  "<<tat[i];
        cout<<"\n";
    }
    cout<"\n\n\n";
    cout<<"0";
    for(int i=0;i<n;i++)
    {
        cout<<"-----";
        cout<<tat[i];
    }
    cout<<"\n";
    for(int i=1;i<=n;i++)
    {
        cout<<"  p"<<i<<"   ";
        //cout<"\t  ";
    }
    cout<<"\n\n";

    cout<<"\n";
    cout<<"Average TurnAroundtime: "<<t_tat/n;
    cout<<"\n";
    cout<<"Average Waitingtime: "<<t_wt/n;





    return 0;
}
