#include<bits/stdc++.h>
using namespace std;
struct process
{
    int pid;
    int arrT;
    int cpuT;

};
struct gantt
{
    int pidg;
    int startT;
    int endT;
    gantt(int p,int s,int e)
    {
        pidg=p;
        startT=s;
        endT=e;
    }
};
struct data
{
    int starttime,endtime;
    data(int s,int e)
    {
        starttime=s;
        endtime=e;
    }
};
bool compCT(process a,process b)
{
    return a.cpuT<b.cpuT;
}
bool compAT(process a,process b)
{
    return a.arrT<b.arrT;
}
int main()
{
    struct process proc[3]= {{1,4,5},{2,0,7},{3,2,9}};
    struct process sortedAT[3]= {{1,4,5},{2,0,7},{3,2,9}};
    int n=3;
    sort(sortedAT,sortedAT+n,compAT);
    vector<gantt> gchart;
    int prevT=0;
    vector<vector<data> > vec(n+1);
    vector<int> arrived;
    vector<int>::iterator it;
    gchart.push_back(gantt(sortedAT[0].pid,prevT,prevT+sortedAT[0].cpuT));
    vec[sortedAT[0].pid].push_back(data(prevT,prevT+sortedAT[0].cpuT));

    prevT+=sortedAT[0].cpuT;
    int cnt=1;
    int itr=1;
    while(cnt!=n)
    {
        for(int i=itr; i<n; i++)
        {
            if(sortedAT[i].arrT<=prevT)
            {
                arrived.push_back(sortedAT[i].pid);
                itr++;
            }
        }
        sort(arrived.begin(),arrived.end());
        gchart.push_back(gantt(proc[arrived[0]-1].pid,prevT,prevT+proc[arrived[0]-1].cpuT));
        vec[proc[arrived[0]-1].pid].push_back(data(prevT,prevT+proc[arrived[0]-1].cpuT));
        cnt++;
        prevT+=proc[arrived[0]-1].cpuT;
        it=arrived.begin();
        arrived.erase(it);
    }
    cout<<"0";
    for(int i=0; i<gchart.size(); i++)
    {
        int id,st,en;
        struct gantt gid=gchart[i];
        id=gid.pidg;
        en=gid.endT;
        cout<<"---"<<"P"<<id<<"---"<<en;
    }
    cout<<endl;
     int wt[n+1]= {0,0,0,0};
    for(int i=1; i<vec.size(); i++)
    {
        for(int j=0; j<vec[i].size(); j++)
        {
            wt[i]+=vec[i][j].starttime-proc[i-1].arrT;
        }
    }
    int tat[n];
    for(int i=1; i<=n; i++)
    {
        tat[i]=wt[i]+proc[i-1].cpuT;
        cout<<"tat"<<i<<"="<<tat[i]<<"  wt"<<i<<"="<<wt[i]<<endl;
    }
}
